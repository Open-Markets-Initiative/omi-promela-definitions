/*
 * Intercontinental Exchange Binary Order Gateway
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
 *   - a field read in bits
 *   - a field present only on a condition
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 380

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Simple Open Framing Header: 4 bytes ------------------------------------- */

/* Simple Open Framing Header */
typedef SimpleOpenFramingHeader {
  byte message_length[2];
  byte encoding_type[2]
};

int simple_open_framing_header_at;

/* every byte of Simple Open Framing Header set to one value */
inline fill_simple_open_framing_header(simple_open_framing_header_record, simple_open_framing_header_value) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.message_length[simple_open_framing_header_at] = simple_open_framing_header_value; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.encoding_type[simple_open_framing_header_at] = simple_open_framing_header_value; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Open Framing Header set to where it lies, so a field read out of place says so */
inline ramp_simple_open_framing_header(simple_open_framing_header_record, simple_open_framing_header_base) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.message_length[simple_open_framing_header_at] = (simple_open_framing_header_base + 0 + simple_open_framing_header_at + 1) % 256; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.encoding_type[simple_open_framing_header_at] = (simple_open_framing_header_base + 2 + simple_open_framing_header_at + 1) % 256; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Open Framing Header to the wire, 4 bytes from where the cursor stands */
inline encode_simple_open_framing_header(simple_open_framing_header_record) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> wire[at] = simple_open_framing_header_record.message_length[simple_open_framing_header_at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> wire[at] = simple_open_framing_header_record.encoding_type[simple_open_framing_header_at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Open Framing Header off the wire, 4 bytes from where the cursor stands */
inline decode_simple_open_framing_header(simple_open_framing_header_record) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.message_length[simple_open_framing_header_at] = wire[at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> simple_open_framing_header_record.encoding_type[simple_open_framing_header_at] = wire[at]; at = at + 1; simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Open Framing Header is what was written, byte for byte */
inline equal_simple_open_framing_header(simple_open_framing_header_read, simple_open_framing_header_written) {
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> assert(simple_open_framing_header_read.message_length[simple_open_framing_header_at] == simple_open_framing_header_written.message_length[simple_open_framing_header_at]); simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  simple_open_framing_header_at = 0;
  do
  :: simple_open_framing_header_at < 2 -> assert(simple_open_framing_header_read.encoding_type[simple_open_framing_header_at] == simple_open_framing_header_written.encoding_type[simple_open_framing_header_at]); simple_open_framing_header_at = simple_open_framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Framing Header: 4 bytes ------------------------------------------------- */

/* SimpleOpenFramingHeaderMessage */
typedef FramingHeader {
  byte message_length[2];
  byte encoding_type[2]
};

int framing_header_at;

/* every byte of Framing Header set to one value */
inline fill_framing_header(framing_header_record, framing_header_value) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.message_length[framing_header_at] = framing_header_value; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.encoding_type[framing_header_at] = framing_header_value; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Framing Header set to where it lies, so a field read out of place says so */
inline ramp_framing_header(framing_header_record, framing_header_base) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.message_length[framing_header_at] = (framing_header_base + 0 + framing_header_at + 1) % 256; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.encoding_type[framing_header_at] = (framing_header_base + 2 + framing_header_at + 1) % 256; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Framing Header to the wire, 4 bytes from where the cursor stands */
inline encode_framing_header(framing_header_record) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> wire[at] = framing_header_record.message_length[framing_header_at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> wire[at] = framing_header_record.encoding_type[framing_header_at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Framing Header off the wire, 4 bytes from where the cursor stands */
inline decode_framing_header(framing_header_record) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.message_length[framing_header_at] = wire[at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.encoding_type[framing_header_at] = wire[at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Framing Header is what was written, byte for byte */
inline equal_framing_header(framing_header_read, framing_header_written) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> assert(framing_header_read.message_length[framing_header_at] == framing_header_written.message_length[framing_header_at]); framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> assert(framing_header_read.encoding_type[framing_header_at] == framing_header_written.encoding_type[framing_header_at]); framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Open Framing Header Message: 4 bytes ----------------------------- */

/* SimpleOpenFramingHeaderMessage */
typedef SimpleOpenFramingHeaderMessage {
  FramingHeader framing_header
};

/* every byte of Simple Open Framing Header Message set to one value */
inline fill_simple_open_framing_header_message(simple_open_framing_header_message_record, simple_open_framing_header_message_value) {
  fill_framing_header(simple_open_framing_header_message_record.framing_header, simple_open_framing_header_message_value);
  skip
}

/* each byte of Simple Open Framing Header Message set to where it lies, so a field read out of place says so */
inline ramp_simple_open_framing_header_message(simple_open_framing_header_message_record, simple_open_framing_header_message_base) {
  ramp_framing_header(simple_open_framing_header_message_record.framing_header, simple_open_framing_header_message_base + 0);
  skip
}

/* Simple Open Framing Header Message to the wire, 4 bytes from where the cursor stands */
inline encode_simple_open_framing_header_message(simple_open_framing_header_message_record) {
  encode_framing_header(simple_open_framing_header_message_record.framing_header);
  skip
}

/* Simple Open Framing Header Message off the wire, 4 bytes from where the cursor stands */
inline decode_simple_open_framing_header_message(simple_open_framing_header_message_record) {
  decode_framing_header(simple_open_framing_header_message_record.framing_header);
  skip
}

/* what was read of Simple Open Framing Header Message is what was written, byte for byte */
inline equal_simple_open_framing_header_message(simple_open_framing_header_message_read, simple_open_framing_header_message_written) {
  equal_framing_header(simple_open_framing_header_message_read.framing_header, simple_open_framing_header_message_written.framing_header);
  skip
}

/* ---- Logon Request Message: 236 bytes ---------------------------------------- */

/* LogonRequestMessage */
typedef LogonRequestMessage {
  byte user_id[20];
  byte client_id[4];
  byte heart_beat_interval[2];
  byte application_name[30];
  byte application_version[50];
  byte application_vendor[30];
  byte raw_data[50];
  byte ip_session_token[50]
};

int logon_request_message_at;

/* every byte of Logon Request Message set to one value */
inline fill_logon_request_message(logon_request_message_record, logon_request_message_value) {
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 20 -> logon_request_message_record.user_id[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 4 -> logon_request_message_record.client_id[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 2 -> logon_request_message_record.heart_beat_interval[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> logon_request_message_record.application_name[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.application_version[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> logon_request_message_record.application_vendor[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.raw_data[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.ip_session_token[logon_request_message_at] = logon_request_message_value; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Request Message set to where it lies, so a field read out of place says so */
inline ramp_logon_request_message(logon_request_message_record, logon_request_message_base) {
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 20 -> logon_request_message_record.user_id[logon_request_message_at] = (logon_request_message_base + 0 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 4 -> logon_request_message_record.client_id[logon_request_message_at] = (logon_request_message_base + 20 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 2 -> logon_request_message_record.heart_beat_interval[logon_request_message_at] = (logon_request_message_base + 24 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> logon_request_message_record.application_name[logon_request_message_at] = (logon_request_message_base + 26 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.application_version[logon_request_message_at] = (logon_request_message_base + 56 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> logon_request_message_record.application_vendor[logon_request_message_at] = (logon_request_message_base + 106 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.raw_data[logon_request_message_at] = (logon_request_message_base + 136 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.ip_session_token[logon_request_message_at] = (logon_request_message_base + 186 + logon_request_message_at + 1) % 256; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Request Message to the wire, 236 bytes from where the cursor stands */
inline encode_logon_request_message(logon_request_message_record) {
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 20 -> wire[at] = logon_request_message_record.user_id[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 4 -> wire[at] = logon_request_message_record.client_id[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 2 -> wire[at] = logon_request_message_record.heart_beat_interval[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> wire[at] = logon_request_message_record.application_name[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> wire[at] = logon_request_message_record.application_version[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> wire[at] = logon_request_message_record.application_vendor[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> wire[at] = logon_request_message_record.raw_data[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> wire[at] = logon_request_message_record.ip_session_token[logon_request_message_at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Request Message off the wire, 236 bytes from where the cursor stands */
inline decode_logon_request_message(logon_request_message_record) {
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 20 -> logon_request_message_record.user_id[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 4 -> logon_request_message_record.client_id[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 2 -> logon_request_message_record.heart_beat_interval[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> logon_request_message_record.application_name[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.application_version[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> logon_request_message_record.application_vendor[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.raw_data[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> logon_request_message_record.ip_session_token[logon_request_message_at] = wire[at]; at = at + 1; logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Request Message is what was written, byte for byte */
inline equal_logon_request_message(logon_request_message_read, logon_request_message_written) {
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 20 -> assert(logon_request_message_read.user_id[logon_request_message_at] == logon_request_message_written.user_id[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 4 -> assert(logon_request_message_read.client_id[logon_request_message_at] == logon_request_message_written.client_id[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 2 -> assert(logon_request_message_read.heart_beat_interval[logon_request_message_at] == logon_request_message_written.heart_beat_interval[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> assert(logon_request_message_read.application_name[logon_request_message_at] == logon_request_message_written.application_name[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> assert(logon_request_message_read.application_version[logon_request_message_at] == logon_request_message_written.application_version[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 30 -> assert(logon_request_message_read.application_vendor[logon_request_message_at] == logon_request_message_written.application_vendor[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> assert(logon_request_message_read.raw_data[logon_request_message_at] == logon_request_message_written.raw_data[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  logon_request_message_at = 0;
  do
  :: logon_request_message_at < 50 -> assert(logon_request_message_read.ip_session_token[logon_request_message_at] == logon_request_message_written.ip_session_token[logon_request_message_at]); logon_request_message_at = logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Report Message: 127 bytes ----------------------------------------- */

/* LogonReportMessage */
typedef LogonReportMessage {
  byte user_id[20];
  byte heart_beat_interval[2];
  byte severity_level;
  byte exchange_code[4];
  byte text[100]
};

int logon_report_message_at;

/* every byte of Logon Report Message set to one value */
inline fill_logon_report_message(logon_report_message_record, logon_report_message_value) {
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 20 -> logon_report_message_record.user_id[logon_report_message_at] = logon_report_message_value; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 2 -> logon_report_message_record.heart_beat_interval[logon_report_message_at] = logon_report_message_value; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_record.severity_level = logon_report_message_value;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 4 -> logon_report_message_record.exchange_code[logon_report_message_at] = logon_report_message_value; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 100 -> logon_report_message_record.text[logon_report_message_at] = logon_report_message_value; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Report Message set to where it lies, so a field read out of place says so */
inline ramp_logon_report_message(logon_report_message_record, logon_report_message_base) {
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 20 -> logon_report_message_record.user_id[logon_report_message_at] = (logon_report_message_base + 0 + logon_report_message_at + 1) % 256; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 2 -> logon_report_message_record.heart_beat_interval[logon_report_message_at] = (logon_report_message_base + 20 + logon_report_message_at + 1) % 256; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_record.severity_level = (logon_report_message_base + 22 + 1) % 256;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 4 -> logon_report_message_record.exchange_code[logon_report_message_at] = (logon_report_message_base + 23 + logon_report_message_at + 1) % 256; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 100 -> logon_report_message_record.text[logon_report_message_at] = (logon_report_message_base + 27 + logon_report_message_at + 1) % 256; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Report Message to the wire, 127 bytes from where the cursor stands */
inline encode_logon_report_message(logon_report_message_record) {
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 20 -> wire[at] = logon_report_message_record.user_id[logon_report_message_at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 2 -> wire[at] = logon_report_message_record.heart_beat_interval[logon_report_message_at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_report_message_record.severity_level; at = at + 1;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 4 -> wire[at] = logon_report_message_record.exchange_code[logon_report_message_at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 100 -> wire[at] = logon_report_message_record.text[logon_report_message_at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Report Message off the wire, 127 bytes from where the cursor stands */
inline decode_logon_report_message(logon_report_message_record) {
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 20 -> logon_report_message_record.user_id[logon_report_message_at] = wire[at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 2 -> logon_report_message_record.heart_beat_interval[logon_report_message_at] = wire[at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_record.severity_level = wire[at]; at = at + 1;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 4 -> logon_report_message_record.exchange_code[logon_report_message_at] = wire[at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 100 -> logon_report_message_record.text[logon_report_message_at] = wire[at]; at = at + 1; logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Report Message is what was written, byte for byte */
inline equal_logon_report_message(logon_report_message_read, logon_report_message_written) {
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 20 -> assert(logon_report_message_read.user_id[logon_report_message_at] == logon_report_message_written.user_id[logon_report_message_at]); logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 2 -> assert(logon_report_message_read.heart_beat_interval[logon_report_message_at] == logon_report_message_written.heart_beat_interval[logon_report_message_at]); logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  assert(logon_report_message_read.severity_level == logon_report_message_written.severity_level);
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 4 -> assert(logon_report_message_read.exchange_code[logon_report_message_at] == logon_report_message_written.exchange_code[logon_report_message_at]); logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  logon_report_message_at = 0;
  do
  :: logon_report_message_at < 100 -> assert(logon_report_message_read.text[logon_report_message_at] == logon_report_message_written.text[logon_report_message_at]); logon_report_message_at = logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Request Message: 20 bytes ---------------------------------------- */

/* LogoutRequestMessage */
typedef LogoutRequestMessage {
  byte user_id[20]
};

int logout_request_message_at;

/* every byte of Logout Request Message set to one value */
inline fill_logout_request_message(logout_request_message_record, logout_request_message_value) {
  logout_request_message_at = 0;
  do
  :: logout_request_message_at < 20 -> logout_request_message_record.user_id[logout_request_message_at] = logout_request_message_value; logout_request_message_at = logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Request Message set to where it lies, so a field read out of place says so */
inline ramp_logout_request_message(logout_request_message_record, logout_request_message_base) {
  logout_request_message_at = 0;
  do
  :: logout_request_message_at < 20 -> logout_request_message_record.user_id[logout_request_message_at] = (logout_request_message_base + 0 + logout_request_message_at + 1) % 256; logout_request_message_at = logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_logout_request_message(logout_request_message_record) {
  logout_request_message_at = 0;
  do
  :: logout_request_message_at < 20 -> wire[at] = logout_request_message_record.user_id[logout_request_message_at]; at = at + 1; logout_request_message_at = logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_logout_request_message(logout_request_message_record) {
  logout_request_message_at = 0;
  do
  :: logout_request_message_at < 20 -> logout_request_message_record.user_id[logout_request_message_at] = wire[at]; at = at + 1; logout_request_message_at = logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Request Message is what was written, byte for byte */
inline equal_logout_request_message(logout_request_message_read, logout_request_message_written) {
  logout_request_message_at = 0;
  do
  :: logout_request_message_at < 20 -> assert(logout_request_message_read.user_id[logout_request_message_at] == logout_request_message_written.user_id[logout_request_message_at]); logout_request_message_at = logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Report Message: 124 bytes ---------------------------------------- */

/* LogoutReportMessage */
typedef LogoutReportMessage {
  byte user_id[20];
  byte exchange_code[4];
  byte text[100]
};

int logout_report_message_at;

/* every byte of Logout Report Message set to one value */
inline fill_logout_report_message(logout_report_message_record, logout_report_message_value) {
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 20 -> logout_report_message_record.user_id[logout_report_message_at] = logout_report_message_value; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 4 -> logout_report_message_record.exchange_code[logout_report_message_at] = logout_report_message_value; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 100 -> logout_report_message_record.text[logout_report_message_at] = logout_report_message_value; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Report Message set to where it lies, so a field read out of place says so */
inline ramp_logout_report_message(logout_report_message_record, logout_report_message_base) {
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 20 -> logout_report_message_record.user_id[logout_report_message_at] = (logout_report_message_base + 0 + logout_report_message_at + 1) % 256; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 4 -> logout_report_message_record.exchange_code[logout_report_message_at] = (logout_report_message_base + 20 + logout_report_message_at + 1) % 256; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 100 -> logout_report_message_record.text[logout_report_message_at] = (logout_report_message_base + 24 + logout_report_message_at + 1) % 256; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Report Message to the wire, 124 bytes from where the cursor stands */
inline encode_logout_report_message(logout_report_message_record) {
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 20 -> wire[at] = logout_report_message_record.user_id[logout_report_message_at]; at = at + 1; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 4 -> wire[at] = logout_report_message_record.exchange_code[logout_report_message_at]; at = at + 1; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 100 -> wire[at] = logout_report_message_record.text[logout_report_message_at]; at = at + 1; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Report Message off the wire, 124 bytes from where the cursor stands */
inline decode_logout_report_message(logout_report_message_record) {
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 20 -> logout_report_message_record.user_id[logout_report_message_at] = wire[at]; at = at + 1; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 4 -> logout_report_message_record.exchange_code[logout_report_message_at] = wire[at]; at = at + 1; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 100 -> logout_report_message_record.text[logout_report_message_at] = wire[at]; at = at + 1; logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Report Message is what was written, byte for byte */
inline equal_logout_report_message(logout_report_message_read, logout_report_message_written) {
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 20 -> assert(logout_report_message_read.user_id[logout_report_message_at] == logout_report_message_written.user_id[logout_report_message_at]); logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 4 -> assert(logout_report_message_read.exchange_code[logout_report_message_at] == logout_report_message_written.exchange_code[logout_report_message_at]); logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  logout_report_message_at = 0;
  do
  :: logout_report_message_at < 100 -> assert(logout_report_message_read.text[logout_report_message_at] == logout_report_message_written.text[logout_report_message_at]); logout_report_message_at = logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Error Message: 129 bytes ------------------------------------------------ */

/* ErrorMessage */
typedef ErrorMessage {
  byte ref_sequence_id[4];
  byte severity_level;
  byte supported_schema_version[20];
  byte exchange_code[4];
  byte text[100]
};

int error_message_at;

/* every byte of Error Message set to one value */
inline fill_error_message(error_message_record, error_message_value) {
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.ref_sequence_id[error_message_at] = error_message_value; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_record.severity_level = error_message_value;
  error_message_at = 0;
  do
  :: error_message_at < 20 -> error_message_record.supported_schema_version[error_message_at] = error_message_value; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.exchange_code[error_message_at] = error_message_value; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 100 -> error_message_record.text[error_message_at] = error_message_value; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Error Message set to where it lies, so a field read out of place says so */
inline ramp_error_message(error_message_record, error_message_base) {
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.ref_sequence_id[error_message_at] = (error_message_base + 0 + error_message_at + 1) % 256; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_record.severity_level = (error_message_base + 4 + 1) % 256;
  error_message_at = 0;
  do
  :: error_message_at < 20 -> error_message_record.supported_schema_version[error_message_at] = (error_message_base + 5 + error_message_at + 1) % 256; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.exchange_code[error_message_at] = (error_message_base + 25 + error_message_at + 1) % 256; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 100 -> error_message_record.text[error_message_at] = (error_message_base + 29 + error_message_at + 1) % 256; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Message to the wire, 129 bytes from where the cursor stands */
inline encode_error_message(error_message_record) {
  error_message_at = 0;
  do
  :: error_message_at < 4 -> wire[at] = error_message_record.ref_sequence_id[error_message_at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  wire[at] = error_message_record.severity_level; at = at + 1;
  error_message_at = 0;
  do
  :: error_message_at < 20 -> wire[at] = error_message_record.supported_schema_version[error_message_at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> wire[at] = error_message_record.exchange_code[error_message_at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 100 -> wire[at] = error_message_record.text[error_message_at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Message off the wire, 129 bytes from where the cursor stands */
inline decode_error_message(error_message_record) {
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.ref_sequence_id[error_message_at] = wire[at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_record.severity_level = wire[at]; at = at + 1;
  error_message_at = 0;
  do
  :: error_message_at < 20 -> error_message_record.supported_schema_version[error_message_at] = wire[at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> error_message_record.exchange_code[error_message_at] = wire[at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 100 -> error_message_record.text[error_message_at] = wire[at]; at = at + 1; error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Error Message is what was written, byte for byte */
inline equal_error_message(error_message_read, error_message_written) {
  error_message_at = 0;
  do
  :: error_message_at < 4 -> assert(error_message_read.ref_sequence_id[error_message_at] == error_message_written.ref_sequence_id[error_message_at]); error_message_at = error_message_at + 1
  :: else -> break
  od;
  assert(error_message_read.severity_level == error_message_written.severity_level);
  error_message_at = 0;
  do
  :: error_message_at < 20 -> assert(error_message_read.supported_schema_version[error_message_at] == error_message_written.supported_schema_version[error_message_at]); error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 4 -> assert(error_message_read.exchange_code[error_message_at] == error_message_written.exchange_code[error_message_at]); error_message_at = error_message_at + 1
  :: else -> break
  od;
  error_message_at = 0;
  do
  :: error_message_at < 100 -> assert(error_message_read.text[error_message_at] == error_message_written.text[error_message_at]); error_message_at = error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Size Encoding: 4 bytes -------------------------------------------- */

/* GroupSizeEncoding */
typedef GroupSizeEncoding {
  byte block_length[2];
  byte num_in_group[2]
};

int group_size_encoding_at;

/* every byte of Group Size Encoding set to one value */
inline fill_group_size_encoding(group_size_encoding_record, group_size_encoding_value) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Group Size Encoding set to where it lies, so a field read out of place says so */
inline ramp_group_size_encoding(group_size_encoding_record, group_size_encoding_base) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = (group_size_encoding_base + 0 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = (group_size_encoding_base + 2 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* Group Size Encoding to the wire, 4 bytes from where the cursor stands */
inline encode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.block_length[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.num_in_group[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* Group Size Encoding off the wire, 4 bytes from where the cursor stands */
inline decode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Group Size Encoding is what was written, byte for byte */
inline equal_group_size_encoding(group_size_encoding_read, group_size_encoding_written) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.block_length[group_size_encoding_at] == group_size_encoding_written.block_length[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.num_in_group[group_size_encoding_at] == group_size_encoding_written.num_in_group[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Definition Reject Message: 115 bytes --------------------------- */

/* SecurityDefinitionRejectMessage */
typedef SecurityDefinitionRejectMessage {
  byte security_req_id[4];
  byte security_response_type;
  byte security_request_type;
  byte market_type_id[4];
  byte security_type_optional;
  byte exchange_code[4];
  byte text[100]
};

int security_definition_reject_message_at;

/* every byte of Security Definition Reject Message set to one value */
inline fill_security_definition_reject_message(security_definition_reject_message_record, security_definition_reject_message_value) {
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.security_req_id[security_definition_reject_message_at] = security_definition_reject_message_value; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_record.security_response_type = security_definition_reject_message_value;
  security_definition_reject_message_record.security_request_type = security_definition_reject_message_value;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.market_type_id[security_definition_reject_message_at] = security_definition_reject_message_value; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_record.security_type_optional = security_definition_reject_message_value;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.exchange_code[security_definition_reject_message_at] = security_definition_reject_message_value; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 100 -> security_definition_reject_message_record.text[security_definition_reject_message_at] = security_definition_reject_message_value; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Definition Reject Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_reject_message(security_definition_reject_message_record, security_definition_reject_message_base) {
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.security_req_id[security_definition_reject_message_at] = (security_definition_reject_message_base + 0 + security_definition_reject_message_at + 1) % 256; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_record.security_response_type = (security_definition_reject_message_base + 4 + 1) % 256;
  security_definition_reject_message_record.security_request_type = (security_definition_reject_message_base + 5 + 1) % 256;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.market_type_id[security_definition_reject_message_at] = (security_definition_reject_message_base + 6 + security_definition_reject_message_at + 1) % 256; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_record.security_type_optional = (security_definition_reject_message_base + 10 + 1) % 256;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.exchange_code[security_definition_reject_message_at] = (security_definition_reject_message_base + 11 + security_definition_reject_message_at + 1) % 256; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 100 -> security_definition_reject_message_record.text[security_definition_reject_message_at] = (security_definition_reject_message_base + 15 + security_definition_reject_message_at + 1) % 256; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Reject Message to the wire, 115 bytes from where the cursor stands */
inline encode_security_definition_reject_message(security_definition_reject_message_record) {
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> wire[at] = security_definition_reject_message_record.security_req_id[security_definition_reject_message_at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_reject_message_record.security_response_type; at = at + 1;
  wire[at] = security_definition_reject_message_record.security_request_type; at = at + 1;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> wire[at] = security_definition_reject_message_record.market_type_id[security_definition_reject_message_at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_reject_message_record.security_type_optional; at = at + 1;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> wire[at] = security_definition_reject_message_record.exchange_code[security_definition_reject_message_at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 100 -> wire[at] = security_definition_reject_message_record.text[security_definition_reject_message_at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Reject Message off the wire, 115 bytes from where the cursor stands */
inline decode_security_definition_reject_message(security_definition_reject_message_record) {
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.security_req_id[security_definition_reject_message_at] = wire[at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_record.security_response_type = wire[at]; at = at + 1;
  security_definition_reject_message_record.security_request_type = wire[at]; at = at + 1;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.market_type_id[security_definition_reject_message_at] = wire[at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_record.security_type_optional = wire[at]; at = at + 1;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> security_definition_reject_message_record.exchange_code[security_definition_reject_message_at] = wire[at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 100 -> security_definition_reject_message_record.text[security_definition_reject_message_at] = wire[at]; at = at + 1; security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Definition Reject Message is what was written, byte for byte */
inline equal_security_definition_reject_message(security_definition_reject_message_read, security_definition_reject_message_written) {
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> assert(security_definition_reject_message_read.security_req_id[security_definition_reject_message_at] == security_definition_reject_message_written.security_req_id[security_definition_reject_message_at]); security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  assert(security_definition_reject_message_read.security_response_type == security_definition_reject_message_written.security_response_type);
  assert(security_definition_reject_message_read.security_request_type == security_definition_reject_message_written.security_request_type);
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> assert(security_definition_reject_message_read.market_type_id[security_definition_reject_message_at] == security_definition_reject_message_written.market_type_id[security_definition_reject_message_at]); security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  assert(security_definition_reject_message_read.security_type_optional == security_definition_reject_message_written.security_type_optional);
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 4 -> assert(security_definition_reject_message_read.exchange_code[security_definition_reject_message_at] == security_definition_reject_message_written.exchange_code[security_definition_reject_message_at]); security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  security_definition_reject_message_at = 0;
  do
  :: security_definition_reject_message_at < 100 -> assert(security_definition_reject_message_read.text[security_definition_reject_message_at] == security_definition_reject_message_written.text[security_definition_reject_message_at]); security_definition_reject_message_at = security_definition_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Definition Request Message: 9 bytes ---------------------------- */

/* SecurityDefinitionRequestMessage */
typedef SecurityDefinitionRequestMessage {
  byte security_req_id[4];
  byte security_request_type;
  byte market_type_id[4]
};

int security_definition_request_message_at;

/* every byte of Security Definition Request Message set to one value */
inline fill_security_definition_request_message(security_definition_request_message_record, security_definition_request_message_value) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.security_req_id[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.security_request_type = security_definition_request_message_value;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.market_type_id[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Definition Request Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_request_message(security_definition_request_message_record, security_definition_request_message_base) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.security_req_id[security_definition_request_message_at] = (security_definition_request_message_base + 0 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.security_request_type = (security_definition_request_message_base + 4 + 1) % 256;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.market_type_id[security_definition_request_message_at] = (security_definition_request_message_base + 5 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Request Message to the wire, 9 bytes from where the cursor stands */
inline encode_security_definition_request_message(security_definition_request_message_record) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> wire[at] = security_definition_request_message_record.security_req_id[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_request_message_record.security_request_type; at = at + 1;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> wire[at] = security_definition_request_message_record.market_type_id[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Request Message off the wire, 9 bytes from where the cursor stands */
inline decode_security_definition_request_message(security_definition_request_message_record) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.security_req_id[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.security_request_type = wire[at]; at = at + 1;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.market_type_id[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Definition Request Message is what was written, byte for byte */
inline equal_security_definition_request_message(security_definition_request_message_read, security_definition_request_message_written) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> assert(security_definition_request_message_read.security_req_id[security_definition_request_message_at] == security_definition_request_message_written.security_req_id[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  assert(security_definition_request_message_read.security_request_type == security_definition_request_message_written.security_request_type);
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> assert(security_definition_request_message_read.market_type_id[security_definition_request_message_at] == security_definition_request_message_written.market_type_id[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trader Logon Request Message: 106 bytes --------------------------------- */

/* TraderLogonRequestMessage */
typedef TraderLogonRequestMessage {
  byte originator_user_id[20];
  byte direct_electronic_access;
  byte trading_capacity;
  byte liquidity_provision;
  byte commodity_deriv_indicator;
  byte investment_decision[8];
  byte execution_decision[8];
  byte client_id_code[8];
  byte mifid_id[8];
  byte raw_data[50]
};

int trader_logon_request_message_at;

/* every byte of Trader Logon Request Message set to one value */
inline fill_trader_logon_request_message(trader_logon_request_message_record, trader_logon_request_message_value) {
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 20 -> trader_logon_request_message_record.originator_user_id[trader_logon_request_message_at] = trader_logon_request_message_value; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_record.direct_electronic_access = trader_logon_request_message_value;
  trader_logon_request_message_record.trading_capacity = trader_logon_request_message_value;
  trader_logon_request_message_record.liquidity_provision = trader_logon_request_message_value;
  trader_logon_request_message_record.commodity_deriv_indicator = trader_logon_request_message_value;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.investment_decision[trader_logon_request_message_at] = trader_logon_request_message_value; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.execution_decision[trader_logon_request_message_at] = trader_logon_request_message_value; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.client_id_code[trader_logon_request_message_at] = trader_logon_request_message_value; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.mifid_id[trader_logon_request_message_at] = trader_logon_request_message_value; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 50 -> trader_logon_request_message_record.raw_data[trader_logon_request_message_at] = trader_logon_request_message_value; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trader Logon Request Message set to where it lies, so a field read out of place says so */
inline ramp_trader_logon_request_message(trader_logon_request_message_record, trader_logon_request_message_base) {
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 20 -> trader_logon_request_message_record.originator_user_id[trader_logon_request_message_at] = (trader_logon_request_message_base + 0 + trader_logon_request_message_at + 1) % 256; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_record.direct_electronic_access = (trader_logon_request_message_base + 20 + 1) % 256;
  trader_logon_request_message_record.trading_capacity = (trader_logon_request_message_base + 21 + 1) % 256;
  trader_logon_request_message_record.liquidity_provision = (trader_logon_request_message_base + 22 + 1) % 256;
  trader_logon_request_message_record.commodity_deriv_indicator = (trader_logon_request_message_base + 23 + 1) % 256;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.investment_decision[trader_logon_request_message_at] = (trader_logon_request_message_base + 24 + trader_logon_request_message_at + 1) % 256; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.execution_decision[trader_logon_request_message_at] = (trader_logon_request_message_base + 32 + trader_logon_request_message_at + 1) % 256; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.client_id_code[trader_logon_request_message_at] = (trader_logon_request_message_base + 40 + trader_logon_request_message_at + 1) % 256; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.mifid_id[trader_logon_request_message_at] = (trader_logon_request_message_base + 48 + trader_logon_request_message_at + 1) % 256; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 50 -> trader_logon_request_message_record.raw_data[trader_logon_request_message_at] = (trader_logon_request_message_base + 56 + trader_logon_request_message_at + 1) % 256; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logon Request Message to the wire, 106 bytes from where the cursor stands */
inline encode_trader_logon_request_message(trader_logon_request_message_record) {
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 20 -> wire[at] = trader_logon_request_message_record.originator_user_id[trader_logon_request_message_at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  wire[at] = trader_logon_request_message_record.direct_electronic_access; at = at + 1;
  wire[at] = trader_logon_request_message_record.trading_capacity; at = at + 1;
  wire[at] = trader_logon_request_message_record.liquidity_provision; at = at + 1;
  wire[at] = trader_logon_request_message_record.commodity_deriv_indicator; at = at + 1;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> wire[at] = trader_logon_request_message_record.investment_decision[trader_logon_request_message_at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> wire[at] = trader_logon_request_message_record.execution_decision[trader_logon_request_message_at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> wire[at] = trader_logon_request_message_record.client_id_code[trader_logon_request_message_at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> wire[at] = trader_logon_request_message_record.mifid_id[trader_logon_request_message_at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 50 -> wire[at] = trader_logon_request_message_record.raw_data[trader_logon_request_message_at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logon Request Message off the wire, 106 bytes from where the cursor stands */
inline decode_trader_logon_request_message(trader_logon_request_message_record) {
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 20 -> trader_logon_request_message_record.originator_user_id[trader_logon_request_message_at] = wire[at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_record.direct_electronic_access = wire[at]; at = at + 1;
  trader_logon_request_message_record.trading_capacity = wire[at]; at = at + 1;
  trader_logon_request_message_record.liquidity_provision = wire[at]; at = at + 1;
  trader_logon_request_message_record.commodity_deriv_indicator = wire[at]; at = at + 1;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.investment_decision[trader_logon_request_message_at] = wire[at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.execution_decision[trader_logon_request_message_at] = wire[at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.client_id_code[trader_logon_request_message_at] = wire[at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> trader_logon_request_message_record.mifid_id[trader_logon_request_message_at] = wire[at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 50 -> trader_logon_request_message_record.raw_data[trader_logon_request_message_at] = wire[at]; at = at + 1; trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trader Logon Request Message is what was written, byte for byte */
inline equal_trader_logon_request_message(trader_logon_request_message_read, trader_logon_request_message_written) {
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 20 -> assert(trader_logon_request_message_read.originator_user_id[trader_logon_request_message_at] == trader_logon_request_message_written.originator_user_id[trader_logon_request_message_at]); trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  assert(trader_logon_request_message_read.direct_electronic_access == trader_logon_request_message_written.direct_electronic_access);
  assert(trader_logon_request_message_read.trading_capacity == trader_logon_request_message_written.trading_capacity);
  assert(trader_logon_request_message_read.liquidity_provision == trader_logon_request_message_written.liquidity_provision);
  assert(trader_logon_request_message_read.commodity_deriv_indicator == trader_logon_request_message_written.commodity_deriv_indicator);
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> assert(trader_logon_request_message_read.investment_decision[trader_logon_request_message_at] == trader_logon_request_message_written.investment_decision[trader_logon_request_message_at]); trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> assert(trader_logon_request_message_read.execution_decision[trader_logon_request_message_at] == trader_logon_request_message_written.execution_decision[trader_logon_request_message_at]); trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> assert(trader_logon_request_message_read.client_id_code[trader_logon_request_message_at] == trader_logon_request_message_written.client_id_code[trader_logon_request_message_at]); trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 8 -> assert(trader_logon_request_message_read.mifid_id[trader_logon_request_message_at] == trader_logon_request_message_written.mifid_id[trader_logon_request_message_at]); trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  trader_logon_request_message_at = 0;
  do
  :: trader_logon_request_message_at < 50 -> assert(trader_logon_request_message_read.raw_data[trader_logon_request_message_at] == trader_logon_request_message_written.raw_data[trader_logon_request_message_at]); trader_logon_request_message_at = trader_logon_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trader Logon Report Message: 128 bytes ---------------------------------- */

/* TraderLogonReportMessage */
typedef TraderLogonReportMessage {
  byte originator_user_id[20];
  byte client_id[4];
  byte exchange_code[4];
  byte text[100]
};

int trader_logon_report_message_at;

/* every byte of Trader Logon Report Message set to one value */
inline fill_trader_logon_report_message(trader_logon_report_message_record, trader_logon_report_message_value) {
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 20 -> trader_logon_report_message_record.originator_user_id[trader_logon_report_message_at] = trader_logon_report_message_value; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> trader_logon_report_message_record.client_id[trader_logon_report_message_at] = trader_logon_report_message_value; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> trader_logon_report_message_record.exchange_code[trader_logon_report_message_at] = trader_logon_report_message_value; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 100 -> trader_logon_report_message_record.text[trader_logon_report_message_at] = trader_logon_report_message_value; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trader Logon Report Message set to where it lies, so a field read out of place says so */
inline ramp_trader_logon_report_message(trader_logon_report_message_record, trader_logon_report_message_base) {
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 20 -> trader_logon_report_message_record.originator_user_id[trader_logon_report_message_at] = (trader_logon_report_message_base + 0 + trader_logon_report_message_at + 1) % 256; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> trader_logon_report_message_record.client_id[trader_logon_report_message_at] = (trader_logon_report_message_base + 20 + trader_logon_report_message_at + 1) % 256; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> trader_logon_report_message_record.exchange_code[trader_logon_report_message_at] = (trader_logon_report_message_base + 24 + trader_logon_report_message_at + 1) % 256; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 100 -> trader_logon_report_message_record.text[trader_logon_report_message_at] = (trader_logon_report_message_base + 28 + trader_logon_report_message_at + 1) % 256; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logon Report Message to the wire, 128 bytes from where the cursor stands */
inline encode_trader_logon_report_message(trader_logon_report_message_record) {
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 20 -> wire[at] = trader_logon_report_message_record.originator_user_id[trader_logon_report_message_at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> wire[at] = trader_logon_report_message_record.client_id[trader_logon_report_message_at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> wire[at] = trader_logon_report_message_record.exchange_code[trader_logon_report_message_at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 100 -> wire[at] = trader_logon_report_message_record.text[trader_logon_report_message_at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logon Report Message off the wire, 128 bytes from where the cursor stands */
inline decode_trader_logon_report_message(trader_logon_report_message_record) {
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 20 -> trader_logon_report_message_record.originator_user_id[trader_logon_report_message_at] = wire[at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> trader_logon_report_message_record.client_id[trader_logon_report_message_at] = wire[at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> trader_logon_report_message_record.exchange_code[trader_logon_report_message_at] = wire[at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 100 -> trader_logon_report_message_record.text[trader_logon_report_message_at] = wire[at]; at = at + 1; trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trader Logon Report Message is what was written, byte for byte */
inline equal_trader_logon_report_message(trader_logon_report_message_read, trader_logon_report_message_written) {
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 20 -> assert(trader_logon_report_message_read.originator_user_id[trader_logon_report_message_at] == trader_logon_report_message_written.originator_user_id[trader_logon_report_message_at]); trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> assert(trader_logon_report_message_read.client_id[trader_logon_report_message_at] == trader_logon_report_message_written.client_id[trader_logon_report_message_at]); trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 4 -> assert(trader_logon_report_message_read.exchange_code[trader_logon_report_message_at] == trader_logon_report_message_written.exchange_code[trader_logon_report_message_at]); trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  trader_logon_report_message_at = 0;
  do
  :: trader_logon_report_message_at < 100 -> assert(trader_logon_report_message_read.text[trader_logon_report_message_at] == trader_logon_report_message_written.text[trader_logon_report_message_at]); trader_logon_report_message_at = trader_logon_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trader Logout Request Message: 20 bytes --------------------------------- */

/* TraderLogoutRequestMessage */
typedef TraderLogoutRequestMessage {
  byte originator_user_id[20]
};

int trader_logout_request_message_at;

/* every byte of Trader Logout Request Message set to one value */
inline fill_trader_logout_request_message(trader_logout_request_message_record, trader_logout_request_message_value) {
  trader_logout_request_message_at = 0;
  do
  :: trader_logout_request_message_at < 20 -> trader_logout_request_message_record.originator_user_id[trader_logout_request_message_at] = trader_logout_request_message_value; trader_logout_request_message_at = trader_logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trader Logout Request Message set to where it lies, so a field read out of place says so */
inline ramp_trader_logout_request_message(trader_logout_request_message_record, trader_logout_request_message_base) {
  trader_logout_request_message_at = 0;
  do
  :: trader_logout_request_message_at < 20 -> trader_logout_request_message_record.originator_user_id[trader_logout_request_message_at] = (trader_logout_request_message_base + 0 + trader_logout_request_message_at + 1) % 256; trader_logout_request_message_at = trader_logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logout Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_trader_logout_request_message(trader_logout_request_message_record) {
  trader_logout_request_message_at = 0;
  do
  :: trader_logout_request_message_at < 20 -> wire[at] = trader_logout_request_message_record.originator_user_id[trader_logout_request_message_at]; at = at + 1; trader_logout_request_message_at = trader_logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logout Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_trader_logout_request_message(trader_logout_request_message_record) {
  trader_logout_request_message_at = 0;
  do
  :: trader_logout_request_message_at < 20 -> trader_logout_request_message_record.originator_user_id[trader_logout_request_message_at] = wire[at]; at = at + 1; trader_logout_request_message_at = trader_logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trader Logout Request Message is what was written, byte for byte */
inline equal_trader_logout_request_message(trader_logout_request_message_read, trader_logout_request_message_written) {
  trader_logout_request_message_at = 0;
  do
  :: trader_logout_request_message_at < 20 -> assert(trader_logout_request_message_read.originator_user_id[trader_logout_request_message_at] == trader_logout_request_message_written.originator_user_id[trader_logout_request_message_at]); trader_logout_request_message_at = trader_logout_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trader Logout Report Message: 124 bytes --------------------------------- */

/* TraderLogoutReportMessage */
typedef TraderLogoutReportMessage {
  byte originator_user_id[20];
  byte exchange_code[4];
  byte text[100]
};

int trader_logout_report_message_at;

/* every byte of Trader Logout Report Message set to one value */
inline fill_trader_logout_report_message(trader_logout_report_message_record, trader_logout_report_message_value) {
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 20 -> trader_logout_report_message_record.originator_user_id[trader_logout_report_message_at] = trader_logout_report_message_value; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 4 -> trader_logout_report_message_record.exchange_code[trader_logout_report_message_at] = trader_logout_report_message_value; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 100 -> trader_logout_report_message_record.text[trader_logout_report_message_at] = trader_logout_report_message_value; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trader Logout Report Message set to where it lies, so a field read out of place says so */
inline ramp_trader_logout_report_message(trader_logout_report_message_record, trader_logout_report_message_base) {
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 20 -> trader_logout_report_message_record.originator_user_id[trader_logout_report_message_at] = (trader_logout_report_message_base + 0 + trader_logout_report_message_at + 1) % 256; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 4 -> trader_logout_report_message_record.exchange_code[trader_logout_report_message_at] = (trader_logout_report_message_base + 20 + trader_logout_report_message_at + 1) % 256; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 100 -> trader_logout_report_message_record.text[trader_logout_report_message_at] = (trader_logout_report_message_base + 24 + trader_logout_report_message_at + 1) % 256; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logout Report Message to the wire, 124 bytes from where the cursor stands */
inline encode_trader_logout_report_message(trader_logout_report_message_record) {
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 20 -> wire[at] = trader_logout_report_message_record.originator_user_id[trader_logout_report_message_at]; at = at + 1; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 4 -> wire[at] = trader_logout_report_message_record.exchange_code[trader_logout_report_message_at]; at = at + 1; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 100 -> wire[at] = trader_logout_report_message_record.text[trader_logout_report_message_at]; at = at + 1; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trader Logout Report Message off the wire, 124 bytes from where the cursor stands */
inline decode_trader_logout_report_message(trader_logout_report_message_record) {
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 20 -> trader_logout_report_message_record.originator_user_id[trader_logout_report_message_at] = wire[at]; at = at + 1; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 4 -> trader_logout_report_message_record.exchange_code[trader_logout_report_message_at] = wire[at]; at = at + 1; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 100 -> trader_logout_report_message_record.text[trader_logout_report_message_at] = wire[at]; at = at + 1; trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trader Logout Report Message is what was written, byte for byte */
inline equal_trader_logout_report_message(trader_logout_report_message_read, trader_logout_report_message_written) {
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 20 -> assert(trader_logout_report_message_read.originator_user_id[trader_logout_report_message_at] == trader_logout_report_message_written.originator_user_id[trader_logout_report_message_at]); trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 4 -> assert(trader_logout_report_message_read.exchange_code[trader_logout_report_message_at] == trader_logout_report_message_written.exchange_code[trader_logout_report_message_at]); trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  trader_logout_report_message_at = 0;
  do
  :: trader_logout_report_message_at < 100 -> assert(trader_logout_report_message_read.text[trader_logout_report_message_at] == trader_logout_report_message_written.text[trader_logout_report_message_at]); trader_logout_report_message_at = trader_logout_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Request Message: 327 bytes ------------------------------------ */

/* NewOrderRequestMessage */
typedef NewOrderRequestMessage {
  byte price_optional[8];
  byte order_qty[8];
  byte symbol[4];
  byte time_in_force;
  byte side;
  byte originator_user_id[20];
  byte ord_type;
  byte manual_order_indicator;
  byte cl_ord_id[8];
  byte max_show[8];
  byte stop_px[8];
  byte give_up_clearing_firm[4];
  byte clearing_firm[4];
  byte self_match_prevention_id[8];
  byte expire_date[2];
  byte self_match_prevention_instruction;
  byte exec_inst;
  byte direct_electronic_access;
  byte trading_capacity;
  byte liquidity_provision;
  byte commodity_deriv_indicator;
  byte investment_decision[8];
  byte execution_decision[8];
  byte client_id_code[8];
  byte mifid_id[8];
  byte cust_order_handling_inst;
  byte position_effect;
  byte alloc_handl_inst;
  byte price_type;
  byte clearing_account[14];
  byte customer_account_ref_id[12];
  byte memo[30];
  byte allocation_account[20];
  byte on_behalf_of_comp_id[41];
  byte on_behalf_of_sub_id[41];
  byte on_behalf_of_location_id[41]
};

int new_order_request_message_at;

/* every byte of New Order Request Message set to one value */
inline fill_new_order_request_message(new_order_request_message_record, new_order_request_message_value) {
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.price_optional[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.order_qty[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.symbol[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.time_in_force = new_order_request_message_value;
  new_order_request_message_record.side = new_order_request_message_value;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> new_order_request_message_record.originator_user_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.ord_type = new_order_request_message_value;
  new_order_request_message_record.manual_order_indicator = new_order_request_message_value;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.cl_ord_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.max_show[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.stop_px[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.give_up_clearing_firm[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.clearing_firm[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.self_match_prevention_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 2 -> new_order_request_message_record.expire_date[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.self_match_prevention_instruction = new_order_request_message_value;
  new_order_request_message_record.exec_inst = new_order_request_message_value;
  new_order_request_message_record.direct_electronic_access = new_order_request_message_value;
  new_order_request_message_record.trading_capacity = new_order_request_message_value;
  new_order_request_message_record.liquidity_provision = new_order_request_message_value;
  new_order_request_message_record.commodity_deriv_indicator = new_order_request_message_value;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.investment_decision[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.execution_decision[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.client_id_code[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.mifid_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.cust_order_handling_inst = new_order_request_message_value;
  new_order_request_message_record.position_effect = new_order_request_message_value;
  new_order_request_message_record.alloc_handl_inst = new_order_request_message_value;
  new_order_request_message_record.price_type = new_order_request_message_value;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 14 -> new_order_request_message_record.clearing_account[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 12 -> new_order_request_message_record.customer_account_ref_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 30 -> new_order_request_message_record.memo[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> new_order_request_message_record.allocation_account[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_comp_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_sub_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_location_id[new_order_request_message_at] = new_order_request_message_value; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Request Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_request_message(new_order_request_message_record, new_order_request_message_base) {
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.price_optional[new_order_request_message_at] = (new_order_request_message_base + 0 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.order_qty[new_order_request_message_at] = (new_order_request_message_base + 8 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.symbol[new_order_request_message_at] = (new_order_request_message_base + 16 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.time_in_force = (new_order_request_message_base + 20 + 1) % 256;
  new_order_request_message_record.side = (new_order_request_message_base + 21 + 1) % 256;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> new_order_request_message_record.originator_user_id[new_order_request_message_at] = (new_order_request_message_base + 22 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.ord_type = (new_order_request_message_base + 42 + 1) % 256;
  new_order_request_message_record.manual_order_indicator = (new_order_request_message_base + 43 + 1) % 256;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.cl_ord_id[new_order_request_message_at] = (new_order_request_message_base + 44 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.max_show[new_order_request_message_at] = (new_order_request_message_base + 52 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.stop_px[new_order_request_message_at] = (new_order_request_message_base + 60 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.give_up_clearing_firm[new_order_request_message_at] = (new_order_request_message_base + 68 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.clearing_firm[new_order_request_message_at] = (new_order_request_message_base + 72 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.self_match_prevention_id[new_order_request_message_at] = (new_order_request_message_base + 76 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 2 -> new_order_request_message_record.expire_date[new_order_request_message_at] = (new_order_request_message_base + 84 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.self_match_prevention_instruction = (new_order_request_message_base + 86 + 1) % 256;
  new_order_request_message_record.exec_inst = (new_order_request_message_base + 87 + 1) % 256;
  new_order_request_message_record.direct_electronic_access = (new_order_request_message_base + 88 + 1) % 256;
  new_order_request_message_record.trading_capacity = (new_order_request_message_base + 89 + 1) % 256;
  new_order_request_message_record.liquidity_provision = (new_order_request_message_base + 90 + 1) % 256;
  new_order_request_message_record.commodity_deriv_indicator = (new_order_request_message_base + 91 + 1) % 256;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.investment_decision[new_order_request_message_at] = (new_order_request_message_base + 92 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.execution_decision[new_order_request_message_at] = (new_order_request_message_base + 100 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.client_id_code[new_order_request_message_at] = (new_order_request_message_base + 108 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.mifid_id[new_order_request_message_at] = (new_order_request_message_base + 116 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.cust_order_handling_inst = (new_order_request_message_base + 124 + 1) % 256;
  new_order_request_message_record.position_effect = (new_order_request_message_base + 125 + 1) % 256;
  new_order_request_message_record.alloc_handl_inst = (new_order_request_message_base + 126 + 1) % 256;
  new_order_request_message_record.price_type = (new_order_request_message_base + 127 + 1) % 256;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 14 -> new_order_request_message_record.clearing_account[new_order_request_message_at] = (new_order_request_message_base + 128 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 12 -> new_order_request_message_record.customer_account_ref_id[new_order_request_message_at] = (new_order_request_message_base + 142 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 30 -> new_order_request_message_record.memo[new_order_request_message_at] = (new_order_request_message_base + 154 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> new_order_request_message_record.allocation_account[new_order_request_message_at] = (new_order_request_message_base + 184 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_comp_id[new_order_request_message_at] = (new_order_request_message_base + 204 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_sub_id[new_order_request_message_at] = (new_order_request_message_base + 245 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_location_id[new_order_request_message_at] = (new_order_request_message_base + 286 + new_order_request_message_at + 1) % 256; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Request Message to the wire, 327 bytes from where the cursor stands */
inline encode_new_order_request_message(new_order_request_message_record) {
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.price_optional[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.order_qty[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> wire[at] = new_order_request_message_record.symbol[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_request_message_record.time_in_force; at = at + 1;
  wire[at] = new_order_request_message_record.side; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> wire[at] = new_order_request_message_record.originator_user_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_request_message_record.ord_type; at = at + 1;
  wire[at] = new_order_request_message_record.manual_order_indicator; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.cl_ord_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.max_show[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.stop_px[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> wire[at] = new_order_request_message_record.give_up_clearing_firm[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> wire[at] = new_order_request_message_record.clearing_firm[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.self_match_prevention_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 2 -> wire[at] = new_order_request_message_record.expire_date[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_request_message_record.self_match_prevention_instruction; at = at + 1;
  wire[at] = new_order_request_message_record.exec_inst; at = at + 1;
  wire[at] = new_order_request_message_record.direct_electronic_access; at = at + 1;
  wire[at] = new_order_request_message_record.trading_capacity; at = at + 1;
  wire[at] = new_order_request_message_record.liquidity_provision; at = at + 1;
  wire[at] = new_order_request_message_record.commodity_deriv_indicator; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.investment_decision[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.execution_decision[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.client_id_code[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> wire[at] = new_order_request_message_record.mifid_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_request_message_record.cust_order_handling_inst; at = at + 1;
  wire[at] = new_order_request_message_record.position_effect; at = at + 1;
  wire[at] = new_order_request_message_record.alloc_handl_inst; at = at + 1;
  wire[at] = new_order_request_message_record.price_type; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 14 -> wire[at] = new_order_request_message_record.clearing_account[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 12 -> wire[at] = new_order_request_message_record.customer_account_ref_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 30 -> wire[at] = new_order_request_message_record.memo[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> wire[at] = new_order_request_message_record.allocation_account[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> wire[at] = new_order_request_message_record.on_behalf_of_comp_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> wire[at] = new_order_request_message_record.on_behalf_of_sub_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> wire[at] = new_order_request_message_record.on_behalf_of_location_id[new_order_request_message_at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Request Message off the wire, 327 bytes from where the cursor stands */
inline decode_new_order_request_message(new_order_request_message_record) {
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.price_optional[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.order_qty[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.symbol[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.time_in_force = wire[at]; at = at + 1;
  new_order_request_message_record.side = wire[at]; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> new_order_request_message_record.originator_user_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.ord_type = wire[at]; at = at + 1;
  new_order_request_message_record.manual_order_indicator = wire[at]; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.cl_ord_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.max_show[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.stop_px[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.give_up_clearing_firm[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> new_order_request_message_record.clearing_firm[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.self_match_prevention_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 2 -> new_order_request_message_record.expire_date[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.self_match_prevention_instruction = wire[at]; at = at + 1;
  new_order_request_message_record.exec_inst = wire[at]; at = at + 1;
  new_order_request_message_record.direct_electronic_access = wire[at]; at = at + 1;
  new_order_request_message_record.trading_capacity = wire[at]; at = at + 1;
  new_order_request_message_record.liquidity_provision = wire[at]; at = at + 1;
  new_order_request_message_record.commodity_deriv_indicator = wire[at]; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.investment_decision[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.execution_decision[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.client_id_code[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> new_order_request_message_record.mifid_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_record.cust_order_handling_inst = wire[at]; at = at + 1;
  new_order_request_message_record.position_effect = wire[at]; at = at + 1;
  new_order_request_message_record.alloc_handl_inst = wire[at]; at = at + 1;
  new_order_request_message_record.price_type = wire[at]; at = at + 1;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 14 -> new_order_request_message_record.clearing_account[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 12 -> new_order_request_message_record.customer_account_ref_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 30 -> new_order_request_message_record.memo[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> new_order_request_message_record.allocation_account[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_comp_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_sub_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> new_order_request_message_record.on_behalf_of_location_id[new_order_request_message_at] = wire[at]; at = at + 1; new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Request Message is what was written, byte for byte */
inline equal_new_order_request_message(new_order_request_message_read, new_order_request_message_written) {
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.price_optional[new_order_request_message_at] == new_order_request_message_written.price_optional[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.order_qty[new_order_request_message_at] == new_order_request_message_written.order_qty[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> assert(new_order_request_message_read.symbol[new_order_request_message_at] == new_order_request_message_written.symbol[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  assert(new_order_request_message_read.time_in_force == new_order_request_message_written.time_in_force);
  assert(new_order_request_message_read.side == new_order_request_message_written.side);
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> assert(new_order_request_message_read.originator_user_id[new_order_request_message_at] == new_order_request_message_written.originator_user_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  assert(new_order_request_message_read.ord_type == new_order_request_message_written.ord_type);
  assert(new_order_request_message_read.manual_order_indicator == new_order_request_message_written.manual_order_indicator);
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.cl_ord_id[new_order_request_message_at] == new_order_request_message_written.cl_ord_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.max_show[new_order_request_message_at] == new_order_request_message_written.max_show[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.stop_px[new_order_request_message_at] == new_order_request_message_written.stop_px[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> assert(new_order_request_message_read.give_up_clearing_firm[new_order_request_message_at] == new_order_request_message_written.give_up_clearing_firm[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 4 -> assert(new_order_request_message_read.clearing_firm[new_order_request_message_at] == new_order_request_message_written.clearing_firm[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.self_match_prevention_id[new_order_request_message_at] == new_order_request_message_written.self_match_prevention_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 2 -> assert(new_order_request_message_read.expire_date[new_order_request_message_at] == new_order_request_message_written.expire_date[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  assert(new_order_request_message_read.self_match_prevention_instruction == new_order_request_message_written.self_match_prevention_instruction);
  assert(new_order_request_message_read.exec_inst == new_order_request_message_written.exec_inst);
  assert(new_order_request_message_read.direct_electronic_access == new_order_request_message_written.direct_electronic_access);
  assert(new_order_request_message_read.trading_capacity == new_order_request_message_written.trading_capacity);
  assert(new_order_request_message_read.liquidity_provision == new_order_request_message_written.liquidity_provision);
  assert(new_order_request_message_read.commodity_deriv_indicator == new_order_request_message_written.commodity_deriv_indicator);
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.investment_decision[new_order_request_message_at] == new_order_request_message_written.investment_decision[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.execution_decision[new_order_request_message_at] == new_order_request_message_written.execution_decision[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.client_id_code[new_order_request_message_at] == new_order_request_message_written.client_id_code[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 8 -> assert(new_order_request_message_read.mifid_id[new_order_request_message_at] == new_order_request_message_written.mifid_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  assert(new_order_request_message_read.cust_order_handling_inst == new_order_request_message_written.cust_order_handling_inst);
  assert(new_order_request_message_read.position_effect == new_order_request_message_written.position_effect);
  assert(new_order_request_message_read.alloc_handl_inst == new_order_request_message_written.alloc_handl_inst);
  assert(new_order_request_message_read.price_type == new_order_request_message_written.price_type);
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 14 -> assert(new_order_request_message_read.clearing_account[new_order_request_message_at] == new_order_request_message_written.clearing_account[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 12 -> assert(new_order_request_message_read.customer_account_ref_id[new_order_request_message_at] == new_order_request_message_written.customer_account_ref_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 30 -> assert(new_order_request_message_read.memo[new_order_request_message_at] == new_order_request_message_written.memo[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 20 -> assert(new_order_request_message_read.allocation_account[new_order_request_message_at] == new_order_request_message_written.allocation_account[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> assert(new_order_request_message_read.on_behalf_of_comp_id[new_order_request_message_at] == new_order_request_message_written.on_behalf_of_comp_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> assert(new_order_request_message_read.on_behalf_of_sub_id[new_order_request_message_at] == new_order_request_message_written.on_behalf_of_sub_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  new_order_request_message_at = 0;
  do
  :: new_order_request_message_at < 41 -> assert(new_order_request_message_read.on_behalf_of_location_id[new_order_request_message_at] == new_order_request_message_written.on_behalf_of_location_id[new_order_request_message_at]); new_order_request_message_at = new_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Replace Request Message: 333 bytes ------------------------------- */

/* CancelReplaceRequestMessage */
typedef CancelReplaceRequestMessage {
  byte price_optional[8];
  byte order_qty[8];
  byte symbol[4];
  byte time_in_force;
  byte side;
  byte originator_user_id[20];
  byte ord_type;
  byte manual_order_indicator;
  byte cl_ord_id[8];
  byte orig_cl_ord_id[8];
  byte max_show[8];
  byte stop_px[8];
  byte give_up_clearing_firm[4];
  byte clearing_firm[4];
  byte self_match_prevention_id[8];
  byte expire_date[2];
  byte self_match_prevention_instruction;
  byte exec_inst;
  byte direct_electronic_access;
  byte trading_capacity;
  byte liquidity_provision;
  byte commodity_deriv_indicator;
  byte investment_decision[8];
  byte execution_decision[8];
  byte client_id_code[8];
  byte mifid_id[8];
  byte alloc_handl_inst;
  byte price_type;
  byte clearing_account[14];
  byte customer_account_ref_id[12];
  byte memo[30];
  byte allocation_account[20];
  byte on_behalf_of_comp_id[41];
  byte on_behalf_of_sub_id[41];
  byte on_behalf_of_location_id[41]
};

int cancel_replace_request_message_at;

/* every byte of Cancel Replace Request Message set to one value */
inline fill_cancel_replace_request_message(cancel_replace_request_message_record, cancel_replace_request_message_value) {
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.price_optional[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.order_qty[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.symbol[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.time_in_force = cancel_replace_request_message_value;
  cancel_replace_request_message_record.side = cancel_replace_request_message_value;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> cancel_replace_request_message_record.originator_user_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.ord_type = cancel_replace_request_message_value;
  cancel_replace_request_message_record.manual_order_indicator = cancel_replace_request_message_value;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.cl_ord_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.orig_cl_ord_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.max_show[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.stop_px[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.give_up_clearing_firm[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.clearing_firm[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.self_match_prevention_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 2 -> cancel_replace_request_message_record.expire_date[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.self_match_prevention_instruction = cancel_replace_request_message_value;
  cancel_replace_request_message_record.exec_inst = cancel_replace_request_message_value;
  cancel_replace_request_message_record.direct_electronic_access = cancel_replace_request_message_value;
  cancel_replace_request_message_record.trading_capacity = cancel_replace_request_message_value;
  cancel_replace_request_message_record.liquidity_provision = cancel_replace_request_message_value;
  cancel_replace_request_message_record.commodity_deriv_indicator = cancel_replace_request_message_value;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.investment_decision[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.execution_decision[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.client_id_code[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.mifid_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.alloc_handl_inst = cancel_replace_request_message_value;
  cancel_replace_request_message_record.price_type = cancel_replace_request_message_value;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 14 -> cancel_replace_request_message_record.clearing_account[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 12 -> cancel_replace_request_message_record.customer_account_ref_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 30 -> cancel_replace_request_message_record.memo[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> cancel_replace_request_message_record.allocation_account[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_comp_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_sub_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_location_id[cancel_replace_request_message_at] = cancel_replace_request_message_value; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Replace Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_replace_request_message(cancel_replace_request_message_record, cancel_replace_request_message_base) {
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.price_optional[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 0 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.order_qty[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 8 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.symbol[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 16 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.time_in_force = (cancel_replace_request_message_base + 20 + 1) % 256;
  cancel_replace_request_message_record.side = (cancel_replace_request_message_base + 21 + 1) % 256;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> cancel_replace_request_message_record.originator_user_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 22 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.ord_type = (cancel_replace_request_message_base + 42 + 1) % 256;
  cancel_replace_request_message_record.manual_order_indicator = (cancel_replace_request_message_base + 43 + 1) % 256;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.cl_ord_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 44 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.orig_cl_ord_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 52 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.max_show[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 60 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.stop_px[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 68 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.give_up_clearing_firm[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 76 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.clearing_firm[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 80 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.self_match_prevention_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 84 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 2 -> cancel_replace_request_message_record.expire_date[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 92 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.self_match_prevention_instruction = (cancel_replace_request_message_base + 94 + 1) % 256;
  cancel_replace_request_message_record.exec_inst = (cancel_replace_request_message_base + 95 + 1) % 256;
  cancel_replace_request_message_record.direct_electronic_access = (cancel_replace_request_message_base + 96 + 1) % 256;
  cancel_replace_request_message_record.trading_capacity = (cancel_replace_request_message_base + 97 + 1) % 256;
  cancel_replace_request_message_record.liquidity_provision = (cancel_replace_request_message_base + 98 + 1) % 256;
  cancel_replace_request_message_record.commodity_deriv_indicator = (cancel_replace_request_message_base + 99 + 1) % 256;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.investment_decision[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 100 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.execution_decision[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 108 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.client_id_code[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 116 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.mifid_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 124 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.alloc_handl_inst = (cancel_replace_request_message_base + 132 + 1) % 256;
  cancel_replace_request_message_record.price_type = (cancel_replace_request_message_base + 133 + 1) % 256;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 14 -> cancel_replace_request_message_record.clearing_account[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 134 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 12 -> cancel_replace_request_message_record.customer_account_ref_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 148 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 30 -> cancel_replace_request_message_record.memo[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 160 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> cancel_replace_request_message_record.allocation_account[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 190 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_comp_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 210 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_sub_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 251 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_location_id[cancel_replace_request_message_at] = (cancel_replace_request_message_base + 292 + cancel_replace_request_message_at + 1) % 256; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Replace Request Message to the wire, 333 bytes from where the cursor stands */
inline encode_cancel_replace_request_message(cancel_replace_request_message_record) {
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.price_optional[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.order_qty[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> wire[at] = cancel_replace_request_message_record.symbol[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_replace_request_message_record.time_in_force; at = at + 1;
  wire[at] = cancel_replace_request_message_record.side; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> wire[at] = cancel_replace_request_message_record.originator_user_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_replace_request_message_record.ord_type; at = at + 1;
  wire[at] = cancel_replace_request_message_record.manual_order_indicator; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.cl_ord_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.orig_cl_ord_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.max_show[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.stop_px[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> wire[at] = cancel_replace_request_message_record.give_up_clearing_firm[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> wire[at] = cancel_replace_request_message_record.clearing_firm[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.self_match_prevention_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 2 -> wire[at] = cancel_replace_request_message_record.expire_date[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_replace_request_message_record.self_match_prevention_instruction; at = at + 1;
  wire[at] = cancel_replace_request_message_record.exec_inst; at = at + 1;
  wire[at] = cancel_replace_request_message_record.direct_electronic_access; at = at + 1;
  wire[at] = cancel_replace_request_message_record.trading_capacity; at = at + 1;
  wire[at] = cancel_replace_request_message_record.liquidity_provision; at = at + 1;
  wire[at] = cancel_replace_request_message_record.commodity_deriv_indicator; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.investment_decision[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.execution_decision[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.client_id_code[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> wire[at] = cancel_replace_request_message_record.mifid_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_replace_request_message_record.alloc_handl_inst; at = at + 1;
  wire[at] = cancel_replace_request_message_record.price_type; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 14 -> wire[at] = cancel_replace_request_message_record.clearing_account[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 12 -> wire[at] = cancel_replace_request_message_record.customer_account_ref_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 30 -> wire[at] = cancel_replace_request_message_record.memo[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> wire[at] = cancel_replace_request_message_record.allocation_account[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> wire[at] = cancel_replace_request_message_record.on_behalf_of_comp_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> wire[at] = cancel_replace_request_message_record.on_behalf_of_sub_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> wire[at] = cancel_replace_request_message_record.on_behalf_of_location_id[cancel_replace_request_message_at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Replace Request Message off the wire, 333 bytes from where the cursor stands */
inline decode_cancel_replace_request_message(cancel_replace_request_message_record) {
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.price_optional[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.order_qty[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.symbol[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.time_in_force = wire[at]; at = at + 1;
  cancel_replace_request_message_record.side = wire[at]; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> cancel_replace_request_message_record.originator_user_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.ord_type = wire[at]; at = at + 1;
  cancel_replace_request_message_record.manual_order_indicator = wire[at]; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.cl_ord_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.orig_cl_ord_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.max_show[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.stop_px[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.give_up_clearing_firm[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> cancel_replace_request_message_record.clearing_firm[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.self_match_prevention_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 2 -> cancel_replace_request_message_record.expire_date[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.self_match_prevention_instruction = wire[at]; at = at + 1;
  cancel_replace_request_message_record.exec_inst = wire[at]; at = at + 1;
  cancel_replace_request_message_record.direct_electronic_access = wire[at]; at = at + 1;
  cancel_replace_request_message_record.trading_capacity = wire[at]; at = at + 1;
  cancel_replace_request_message_record.liquidity_provision = wire[at]; at = at + 1;
  cancel_replace_request_message_record.commodity_deriv_indicator = wire[at]; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.investment_decision[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.execution_decision[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.client_id_code[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> cancel_replace_request_message_record.mifid_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_record.alloc_handl_inst = wire[at]; at = at + 1;
  cancel_replace_request_message_record.price_type = wire[at]; at = at + 1;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 14 -> cancel_replace_request_message_record.clearing_account[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 12 -> cancel_replace_request_message_record.customer_account_ref_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 30 -> cancel_replace_request_message_record.memo[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> cancel_replace_request_message_record.allocation_account[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_comp_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_sub_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> cancel_replace_request_message_record.on_behalf_of_location_id[cancel_replace_request_message_at] = wire[at]; at = at + 1; cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Replace Request Message is what was written, byte for byte */
inline equal_cancel_replace_request_message(cancel_replace_request_message_read, cancel_replace_request_message_written) {
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.price_optional[cancel_replace_request_message_at] == cancel_replace_request_message_written.price_optional[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.order_qty[cancel_replace_request_message_at] == cancel_replace_request_message_written.order_qty[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> assert(cancel_replace_request_message_read.symbol[cancel_replace_request_message_at] == cancel_replace_request_message_written.symbol[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(cancel_replace_request_message_read.time_in_force == cancel_replace_request_message_written.time_in_force);
  assert(cancel_replace_request_message_read.side == cancel_replace_request_message_written.side);
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> assert(cancel_replace_request_message_read.originator_user_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.originator_user_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(cancel_replace_request_message_read.ord_type == cancel_replace_request_message_written.ord_type);
  assert(cancel_replace_request_message_read.manual_order_indicator == cancel_replace_request_message_written.manual_order_indicator);
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.cl_ord_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.cl_ord_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.orig_cl_ord_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.orig_cl_ord_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.max_show[cancel_replace_request_message_at] == cancel_replace_request_message_written.max_show[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.stop_px[cancel_replace_request_message_at] == cancel_replace_request_message_written.stop_px[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> assert(cancel_replace_request_message_read.give_up_clearing_firm[cancel_replace_request_message_at] == cancel_replace_request_message_written.give_up_clearing_firm[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 4 -> assert(cancel_replace_request_message_read.clearing_firm[cancel_replace_request_message_at] == cancel_replace_request_message_written.clearing_firm[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.self_match_prevention_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.self_match_prevention_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 2 -> assert(cancel_replace_request_message_read.expire_date[cancel_replace_request_message_at] == cancel_replace_request_message_written.expire_date[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(cancel_replace_request_message_read.self_match_prevention_instruction == cancel_replace_request_message_written.self_match_prevention_instruction);
  assert(cancel_replace_request_message_read.exec_inst == cancel_replace_request_message_written.exec_inst);
  assert(cancel_replace_request_message_read.direct_electronic_access == cancel_replace_request_message_written.direct_electronic_access);
  assert(cancel_replace_request_message_read.trading_capacity == cancel_replace_request_message_written.trading_capacity);
  assert(cancel_replace_request_message_read.liquidity_provision == cancel_replace_request_message_written.liquidity_provision);
  assert(cancel_replace_request_message_read.commodity_deriv_indicator == cancel_replace_request_message_written.commodity_deriv_indicator);
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.investment_decision[cancel_replace_request_message_at] == cancel_replace_request_message_written.investment_decision[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.execution_decision[cancel_replace_request_message_at] == cancel_replace_request_message_written.execution_decision[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.client_id_code[cancel_replace_request_message_at] == cancel_replace_request_message_written.client_id_code[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 8 -> assert(cancel_replace_request_message_read.mifid_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.mifid_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(cancel_replace_request_message_read.alloc_handl_inst == cancel_replace_request_message_written.alloc_handl_inst);
  assert(cancel_replace_request_message_read.price_type == cancel_replace_request_message_written.price_type);
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 14 -> assert(cancel_replace_request_message_read.clearing_account[cancel_replace_request_message_at] == cancel_replace_request_message_written.clearing_account[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 12 -> assert(cancel_replace_request_message_read.customer_account_ref_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.customer_account_ref_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 30 -> assert(cancel_replace_request_message_read.memo[cancel_replace_request_message_at] == cancel_replace_request_message_written.memo[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 20 -> assert(cancel_replace_request_message_read.allocation_account[cancel_replace_request_message_at] == cancel_replace_request_message_written.allocation_account[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> assert(cancel_replace_request_message_read.on_behalf_of_comp_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.on_behalf_of_comp_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> assert(cancel_replace_request_message_read.on_behalf_of_sub_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.on_behalf_of_sub_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  cancel_replace_request_message_at = 0;
  do
  :: cancel_replace_request_message_at < 41 -> assert(cancel_replace_request_message_read.on_behalf_of_location_id[cancel_replace_request_message_at] == cancel_replace_request_message_written.on_behalf_of_location_id[cancel_replace_request_message_at]); cancel_replace_request_message_at = cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Request Message: 41 bytes ---------------------------------------- */

/* CancelRequestMessage */
typedef CancelRequestMessage {
  byte symbol[4];
  byte originator_user_id[20];
  byte cl_ord_id[8];
  byte orig_cl_ord_id[8];
  byte side
};

int cancel_request_message_at;

/* every byte of Cancel Request Message set to one value */
inline fill_cancel_request_message(cancel_request_message_record, cancel_request_message_value) {
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 4 -> cancel_request_message_record.symbol[cancel_request_message_at] = cancel_request_message_value; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 20 -> cancel_request_message_record.originator_user_id[cancel_request_message_at] = cancel_request_message_value; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> cancel_request_message_record.cl_ord_id[cancel_request_message_at] = cancel_request_message_value; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> cancel_request_message_record.orig_cl_ord_id[cancel_request_message_at] = cancel_request_message_value; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_record.side = cancel_request_message_value;
  skip
}

/* each byte of Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_request_message(cancel_request_message_record, cancel_request_message_base) {
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 4 -> cancel_request_message_record.symbol[cancel_request_message_at] = (cancel_request_message_base + 0 + cancel_request_message_at + 1) % 256; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 20 -> cancel_request_message_record.originator_user_id[cancel_request_message_at] = (cancel_request_message_base + 4 + cancel_request_message_at + 1) % 256; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> cancel_request_message_record.cl_ord_id[cancel_request_message_at] = (cancel_request_message_base + 24 + cancel_request_message_at + 1) % 256; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> cancel_request_message_record.orig_cl_ord_id[cancel_request_message_at] = (cancel_request_message_base + 32 + cancel_request_message_at + 1) % 256; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_record.side = (cancel_request_message_base + 40 + 1) % 256;
  skip
}

/* Cancel Request Message to the wire, 41 bytes from where the cursor stands */
inline encode_cancel_request_message(cancel_request_message_record) {
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 4 -> wire[at] = cancel_request_message_record.symbol[cancel_request_message_at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 20 -> wire[at] = cancel_request_message_record.originator_user_id[cancel_request_message_at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> wire[at] = cancel_request_message_record.cl_ord_id[cancel_request_message_at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> wire[at] = cancel_request_message_record.orig_cl_ord_id[cancel_request_message_at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_request_message_record.side; at = at + 1;
  skip
}

/* Cancel Request Message off the wire, 41 bytes from where the cursor stands */
inline decode_cancel_request_message(cancel_request_message_record) {
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 4 -> cancel_request_message_record.symbol[cancel_request_message_at] = wire[at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 20 -> cancel_request_message_record.originator_user_id[cancel_request_message_at] = wire[at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> cancel_request_message_record.cl_ord_id[cancel_request_message_at] = wire[at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> cancel_request_message_record.orig_cl_ord_id[cancel_request_message_at] = wire[at]; at = at + 1; cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancel Request Message is what was written, byte for byte */
inline equal_cancel_request_message(cancel_request_message_read, cancel_request_message_written) {
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 4 -> assert(cancel_request_message_read.symbol[cancel_request_message_at] == cancel_request_message_written.symbol[cancel_request_message_at]); cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 20 -> assert(cancel_request_message_read.originator_user_id[cancel_request_message_at] == cancel_request_message_written.originator_user_id[cancel_request_message_at]); cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> assert(cancel_request_message_read.cl_ord_id[cancel_request_message_at] == cancel_request_message_written.cl_ord_id[cancel_request_message_at]); cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  cancel_request_message_at = 0;
  do
  :: cancel_request_message_at < 8 -> assert(cancel_request_message_read.orig_cl_ord_id[cancel_request_message_at] == cancel_request_message_written.orig_cl_ord_id[cancel_request_message_at]); cancel_request_message_at = cancel_request_message_at + 1
  :: else -> break
  od;
  assert(cancel_request_message_read.side == cancel_request_message_written.side);
  skip
}

/* ---- Quote Request Message: 182 bytes ---------------------------------------- */

/* QuoteRequestMessage */
typedef QuoteRequestMessage {
  byte originator_user_id[20];
  byte side_optional;
  byte order_qty_optional[8];
  byte rfq_req_id[8];
  byte symbol[4];
  byte clearing_firm_optional[4];
  byte clearing_account_optional[14];
  byte on_behalf_of_comp_id[41];
  byte on_behalf_of_sub_id[41];
  byte on_behalf_of_location_id[41]
};

int quote_request_message_at;

/* every byte of Quote Request Message set to one value */
inline fill_quote_request_message(quote_request_message_record, quote_request_message_value) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 20 -> quote_request_message_record.originator_user_id[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.side_optional = quote_request_message_value;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.order_qty_optional[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.rfq_req_id[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.symbol[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.clearing_firm_optional[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 14 -> quote_request_message_record.clearing_account_optional[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_comp_id[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_sub_id[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_location_id[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request Message set to where it lies, so a field read out of place says so */
inline ramp_quote_request_message(quote_request_message_record, quote_request_message_base) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 20 -> quote_request_message_record.originator_user_id[quote_request_message_at] = (quote_request_message_base + 0 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.side_optional = (quote_request_message_base + 20 + 1) % 256;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.order_qty_optional[quote_request_message_at] = (quote_request_message_base + 21 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.rfq_req_id[quote_request_message_at] = (quote_request_message_base + 29 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.symbol[quote_request_message_at] = (quote_request_message_base + 37 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.clearing_firm_optional[quote_request_message_at] = (quote_request_message_base + 41 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 14 -> quote_request_message_record.clearing_account_optional[quote_request_message_at] = (quote_request_message_base + 45 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_comp_id[quote_request_message_at] = (quote_request_message_base + 59 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_sub_id[quote_request_message_at] = (quote_request_message_base + 100 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_location_id[quote_request_message_at] = (quote_request_message_base + 141 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Message to the wire, 182 bytes from where the cursor stands */
inline encode_quote_request_message(quote_request_message_record) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 20 -> wire[at] = quote_request_message_record.originator_user_id[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_message_record.side_optional; at = at + 1;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> wire[at] = quote_request_message_record.order_qty_optional[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> wire[at] = quote_request_message_record.rfq_req_id[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.symbol[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.clearing_firm_optional[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 14 -> wire[at] = quote_request_message_record.clearing_account_optional[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> wire[at] = quote_request_message_record.on_behalf_of_comp_id[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> wire[at] = quote_request_message_record.on_behalf_of_sub_id[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> wire[at] = quote_request_message_record.on_behalf_of_location_id[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Message off the wire, 182 bytes from where the cursor stands */
inline decode_quote_request_message(quote_request_message_record) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 20 -> quote_request_message_record.originator_user_id[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.side_optional = wire[at]; at = at + 1;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.order_qty_optional[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.rfq_req_id[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.symbol[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.clearing_firm_optional[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 14 -> quote_request_message_record.clearing_account_optional[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_comp_id[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_sub_id[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> quote_request_message_record.on_behalf_of_location_id[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request Message is what was written, byte for byte */
inline equal_quote_request_message(quote_request_message_read, quote_request_message_written) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 20 -> assert(quote_request_message_read.originator_user_id[quote_request_message_at] == quote_request_message_written.originator_user_id[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  assert(quote_request_message_read.side_optional == quote_request_message_written.side_optional);
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> assert(quote_request_message_read.order_qty_optional[quote_request_message_at] == quote_request_message_written.order_qty_optional[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> assert(quote_request_message_read.rfq_req_id[quote_request_message_at] == quote_request_message_written.rfq_req_id[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.symbol[quote_request_message_at] == quote_request_message_written.symbol[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.clearing_firm_optional[quote_request_message_at] == quote_request_message_written.clearing_firm_optional[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 14 -> assert(quote_request_message_read.clearing_account_optional[quote_request_message_at] == quote_request_message_written.clearing_account_optional[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> assert(quote_request_message_read.on_behalf_of_comp_id[quote_request_message_at] == quote_request_message_written.on_behalf_of_comp_id[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> assert(quote_request_message_read.on_behalf_of_sub_id[quote_request_message_at] == quote_request_message_written.on_behalf_of_sub_id[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 41 -> assert(quote_request_message_read.on_behalf_of_location_id[quote_request_message_at] == quote_request_message_written.on_behalf_of_location_id[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel Request Message: 89 bytes ----------------------------- */

/* OrderMassCancelRequestMessage */
typedef OrderMassCancelRequestMessage {
  byte originator_user_id[20];
  byte ord_type_optional;
  byte side_optional;
  byte symbol_optional[4];
  byte cl_ord_id[8];
  byte market_type_i_d_optional[4];
  byte price_optional[8];
  byte mass_cancel_request_type;
  byte time_in_force_optional;
  byte on_behalf_of_sub_i_d_optional[41]
};

int order_mass_cancel_request_message_at;

/* every byte of Order Mass Cancel Request Message set to one value */
inline fill_order_mass_cancel_request_message(order_mass_cancel_request_message_record, order_mass_cancel_request_message_value) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> order_mass_cancel_request_message_record.originator_user_id[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.ord_type_optional = order_mass_cancel_request_message_value;
  order_mass_cancel_request_message_record.side_optional = order_mass_cancel_request_message_value;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.symbol_optional[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> order_mass_cancel_request_message_record.cl_ord_id[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.market_type_i_d_optional[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> order_mass_cancel_request_message_record.price_optional[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.mass_cancel_request_type = order_mass_cancel_request_message_value;
  order_mass_cancel_request_message_record.time_in_force_optional = order_mass_cancel_request_message_value;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 41 -> order_mass_cancel_request_message_record.on_behalf_of_sub_i_d_optional[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel_request_message(order_mass_cancel_request_message_record, order_mass_cancel_request_message_base) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> order_mass_cancel_request_message_record.originator_user_id[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 0 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.ord_type_optional = (order_mass_cancel_request_message_base + 20 + 1) % 256;
  order_mass_cancel_request_message_record.side_optional = (order_mass_cancel_request_message_base + 21 + 1) % 256;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.symbol_optional[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 22 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> order_mass_cancel_request_message_record.cl_ord_id[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 26 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.market_type_i_d_optional[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 34 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> order_mass_cancel_request_message_record.price_optional[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 38 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.mass_cancel_request_type = (order_mass_cancel_request_message_base + 46 + 1) % 256;
  order_mass_cancel_request_message_record.time_in_force_optional = (order_mass_cancel_request_message_base + 47 + 1) % 256;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 41 -> order_mass_cancel_request_message_record.on_behalf_of_sub_i_d_optional[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 48 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Request Message to the wire, 89 bytes from where the cursor stands */
inline encode_order_mass_cancel_request_message(order_mass_cancel_request_message_record) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> wire[at] = order_mass_cancel_request_message_record.originator_user_id[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_cancel_request_message_record.ord_type_optional; at = at + 1;
  wire[at] = order_mass_cancel_request_message_record.side_optional; at = at + 1;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> wire[at] = order_mass_cancel_request_message_record.symbol_optional[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> wire[at] = order_mass_cancel_request_message_record.cl_ord_id[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> wire[at] = order_mass_cancel_request_message_record.market_type_i_d_optional[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> wire[at] = order_mass_cancel_request_message_record.price_optional[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_cancel_request_message_record.mass_cancel_request_type; at = at + 1;
  wire[at] = order_mass_cancel_request_message_record.time_in_force_optional; at = at + 1;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 41 -> wire[at] = order_mass_cancel_request_message_record.on_behalf_of_sub_i_d_optional[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Request Message off the wire, 89 bytes from where the cursor stands */
inline decode_order_mass_cancel_request_message(order_mass_cancel_request_message_record) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> order_mass_cancel_request_message_record.originator_user_id[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.ord_type_optional = wire[at]; at = at + 1;
  order_mass_cancel_request_message_record.side_optional = wire[at]; at = at + 1;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.symbol_optional[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> order_mass_cancel_request_message_record.cl_ord_id[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.market_type_i_d_optional[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> order_mass_cancel_request_message_record.price_optional[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.mass_cancel_request_type = wire[at]; at = at + 1;
  order_mass_cancel_request_message_record.time_in_force_optional = wire[at]; at = at + 1;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 41 -> order_mass_cancel_request_message_record.on_behalf_of_sub_i_d_optional[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Cancel Request Message is what was written, byte for byte */
inline equal_order_mass_cancel_request_message(order_mass_cancel_request_message_read, order_mass_cancel_request_message_written) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> assert(order_mass_cancel_request_message_read.originator_user_id[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.originator_user_id[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(order_mass_cancel_request_message_read.ord_type_optional == order_mass_cancel_request_message_written.ord_type_optional);
  assert(order_mass_cancel_request_message_read.side_optional == order_mass_cancel_request_message_written.side_optional);
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> assert(order_mass_cancel_request_message_read.symbol_optional[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.symbol_optional[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> assert(order_mass_cancel_request_message_read.cl_ord_id[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.cl_ord_id[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> assert(order_mass_cancel_request_message_read.market_type_i_d_optional[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.market_type_i_d_optional[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 8 -> assert(order_mass_cancel_request_message_read.price_optional[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.price_optional[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(order_mass_cancel_request_message_read.mass_cancel_request_type == order_mass_cancel_request_message_written.mass_cancel_request_type);
  assert(order_mass_cancel_request_message_read.time_in_force_optional == order_mass_cancel_request_message_written.time_in_force_optional);
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 41 -> assert(order_mass_cancel_request_message_read.on_behalf_of_sub_i_d_optional[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.on_behalf_of_sub_i_d_optional[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Definition Request Create Flex Message: 28 bytes --------------- */

/* SecurityDefinitionRequest_CreateFlexMessage */
typedef SecurityDefinitionRequestCreateFlexMessage {
  byte security_req_id[4];
  byte security_request_type;
  byte market_type_id[4];
  byte security_type;
  byte maturity_date[2];
  byte product_i_d_optional[4];
  byte symbol_optional[4];
  byte strike_price[8]
};

int security_definition_request_create_flex_message_at;

/* every byte of Security Definition Request Create Flex Message set to one value */
inline fill_security_definition_request_create_flex_message(security_definition_request_create_flex_message_record, security_definition_request_create_flex_message_value) {
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.security_req_id[security_definition_request_create_flex_message_at] = security_definition_request_create_flex_message_value; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_record.security_request_type = security_definition_request_create_flex_message_value;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.market_type_id[security_definition_request_create_flex_message_at] = security_definition_request_create_flex_message_value; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_record.security_type = security_definition_request_create_flex_message_value;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 2 -> security_definition_request_create_flex_message_record.maturity_date[security_definition_request_create_flex_message_at] = security_definition_request_create_flex_message_value; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.product_i_d_optional[security_definition_request_create_flex_message_at] = security_definition_request_create_flex_message_value; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.symbol_optional[security_definition_request_create_flex_message_at] = security_definition_request_create_flex_message_value; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 8 -> security_definition_request_create_flex_message_record.strike_price[security_definition_request_create_flex_message_at] = security_definition_request_create_flex_message_value; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Definition Request Create Flex Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_request_create_flex_message(security_definition_request_create_flex_message_record, security_definition_request_create_flex_message_base) {
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.security_req_id[security_definition_request_create_flex_message_at] = (security_definition_request_create_flex_message_base + 0 + security_definition_request_create_flex_message_at + 1) % 256; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_record.security_request_type = (security_definition_request_create_flex_message_base + 4 + 1) % 256;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.market_type_id[security_definition_request_create_flex_message_at] = (security_definition_request_create_flex_message_base + 5 + security_definition_request_create_flex_message_at + 1) % 256; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_record.security_type = (security_definition_request_create_flex_message_base + 9 + 1) % 256;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 2 -> security_definition_request_create_flex_message_record.maturity_date[security_definition_request_create_flex_message_at] = (security_definition_request_create_flex_message_base + 10 + security_definition_request_create_flex_message_at + 1) % 256; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.product_i_d_optional[security_definition_request_create_flex_message_at] = (security_definition_request_create_flex_message_base + 12 + security_definition_request_create_flex_message_at + 1) % 256; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.symbol_optional[security_definition_request_create_flex_message_at] = (security_definition_request_create_flex_message_base + 16 + security_definition_request_create_flex_message_at + 1) % 256; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 8 -> security_definition_request_create_flex_message_record.strike_price[security_definition_request_create_flex_message_at] = (security_definition_request_create_flex_message_base + 20 + security_definition_request_create_flex_message_at + 1) % 256; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Request Create Flex Message to the wire, 28 bytes from where the cursor stands */
inline encode_security_definition_request_create_flex_message(security_definition_request_create_flex_message_record) {
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> wire[at] = security_definition_request_create_flex_message_record.security_req_id[security_definition_request_create_flex_message_at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_request_create_flex_message_record.security_request_type; at = at + 1;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> wire[at] = security_definition_request_create_flex_message_record.market_type_id[security_definition_request_create_flex_message_at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_request_create_flex_message_record.security_type; at = at + 1;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 2 -> wire[at] = security_definition_request_create_flex_message_record.maturity_date[security_definition_request_create_flex_message_at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> wire[at] = security_definition_request_create_flex_message_record.product_i_d_optional[security_definition_request_create_flex_message_at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> wire[at] = security_definition_request_create_flex_message_record.symbol_optional[security_definition_request_create_flex_message_at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 8 -> wire[at] = security_definition_request_create_flex_message_record.strike_price[security_definition_request_create_flex_message_at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Request Create Flex Message off the wire, 28 bytes from where the cursor stands */
inline decode_security_definition_request_create_flex_message(security_definition_request_create_flex_message_record) {
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.security_req_id[security_definition_request_create_flex_message_at] = wire[at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_record.security_request_type = wire[at]; at = at + 1;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.market_type_id[security_definition_request_create_flex_message_at] = wire[at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_record.security_type = wire[at]; at = at + 1;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 2 -> security_definition_request_create_flex_message_record.maturity_date[security_definition_request_create_flex_message_at] = wire[at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.product_i_d_optional[security_definition_request_create_flex_message_at] = wire[at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> security_definition_request_create_flex_message_record.symbol_optional[security_definition_request_create_flex_message_at] = wire[at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 8 -> security_definition_request_create_flex_message_record.strike_price[security_definition_request_create_flex_message_at] = wire[at]; at = at + 1; security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Definition Request Create Flex Message is what was written, byte for byte */
inline equal_security_definition_request_create_flex_message(security_definition_request_create_flex_message_read, security_definition_request_create_flex_message_written) {
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> assert(security_definition_request_create_flex_message_read.security_req_id[security_definition_request_create_flex_message_at] == security_definition_request_create_flex_message_written.security_req_id[security_definition_request_create_flex_message_at]); security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  assert(security_definition_request_create_flex_message_read.security_request_type == security_definition_request_create_flex_message_written.security_request_type);
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> assert(security_definition_request_create_flex_message_read.market_type_id[security_definition_request_create_flex_message_at] == security_definition_request_create_flex_message_written.market_type_id[security_definition_request_create_flex_message_at]); security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  assert(security_definition_request_create_flex_message_read.security_type == security_definition_request_create_flex_message_written.security_type);
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 2 -> assert(security_definition_request_create_flex_message_read.maturity_date[security_definition_request_create_flex_message_at] == security_definition_request_create_flex_message_written.maturity_date[security_definition_request_create_flex_message_at]); security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> assert(security_definition_request_create_flex_message_read.product_i_d_optional[security_definition_request_create_flex_message_at] == security_definition_request_create_flex_message_written.product_i_d_optional[security_definition_request_create_flex_message_at]); security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 4 -> assert(security_definition_request_create_flex_message_read.symbol_optional[security_definition_request_create_flex_message_at] == security_definition_request_create_flex_message_written.symbol_optional[security_definition_request_create_flex_message_at]); security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  security_definition_request_create_flex_message_at = 0;
  do
  :: security_definition_request_create_flex_message_at < 8 -> assert(security_definition_request_create_flex_message_read.strike_price[security_definition_request_create_flex_message_at] == security_definition_request_create_flex_message_written.strike_price[security_definition_request_create_flex_message_at]); security_definition_request_create_flex_message_at = security_definition_request_create_flex_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Exec I D order Exec Id: 20 bytes ---------------------------------------- */

/* ExecutionReport_NewMessage */
typedef ExecIDOrderExecId {
  byte system_id[8];
  byte system_sequence_id[4];
  byte transact_time_utc_timestamp[8]
};

int exec_i_d_order_exec_id_at;

/* every byte of Exec I D order Exec Id set to one value */
inline fill_exec_i_d_order_exec_id(exec_i_d_order_exec_id_record, exec_i_d_order_exec_id_value) {
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> exec_i_d_order_exec_id_record.system_id[exec_i_d_order_exec_id_at] = exec_i_d_order_exec_id_value; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 4 -> exec_i_d_order_exec_id_record.system_sequence_id[exec_i_d_order_exec_id_at] = exec_i_d_order_exec_id_value; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> exec_i_d_order_exec_id_record.transact_time_utc_timestamp[exec_i_d_order_exec_id_at] = exec_i_d_order_exec_id_value; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Exec I D order Exec Id set to where it lies, so a field read out of place says so */
inline ramp_exec_i_d_order_exec_id(exec_i_d_order_exec_id_record, exec_i_d_order_exec_id_base) {
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> exec_i_d_order_exec_id_record.system_id[exec_i_d_order_exec_id_at] = (exec_i_d_order_exec_id_base + 0 + exec_i_d_order_exec_id_at + 1) % 256; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 4 -> exec_i_d_order_exec_id_record.system_sequence_id[exec_i_d_order_exec_id_at] = (exec_i_d_order_exec_id_base + 8 + exec_i_d_order_exec_id_at + 1) % 256; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> exec_i_d_order_exec_id_record.transact_time_utc_timestamp[exec_i_d_order_exec_id_at] = (exec_i_d_order_exec_id_base + 12 + exec_i_d_order_exec_id_at + 1) % 256; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  skip
}

/* Exec I D order Exec Id to the wire, 20 bytes from where the cursor stands */
inline encode_exec_i_d_order_exec_id(exec_i_d_order_exec_id_record) {
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> wire[at] = exec_i_d_order_exec_id_record.system_id[exec_i_d_order_exec_id_at]; at = at + 1; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 4 -> wire[at] = exec_i_d_order_exec_id_record.system_sequence_id[exec_i_d_order_exec_id_at]; at = at + 1; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> wire[at] = exec_i_d_order_exec_id_record.transact_time_utc_timestamp[exec_i_d_order_exec_id_at]; at = at + 1; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  skip
}

/* Exec I D order Exec Id off the wire, 20 bytes from where the cursor stands */
inline decode_exec_i_d_order_exec_id(exec_i_d_order_exec_id_record) {
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> exec_i_d_order_exec_id_record.system_id[exec_i_d_order_exec_id_at] = wire[at]; at = at + 1; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 4 -> exec_i_d_order_exec_id_record.system_sequence_id[exec_i_d_order_exec_id_at] = wire[at]; at = at + 1; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> exec_i_d_order_exec_id_record.transact_time_utc_timestamp[exec_i_d_order_exec_id_at] = wire[at]; at = at + 1; exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Exec I D order Exec Id is what was written, byte for byte */
inline equal_exec_i_d_order_exec_id(exec_i_d_order_exec_id_read, exec_i_d_order_exec_id_written) {
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> assert(exec_i_d_order_exec_id_read.system_id[exec_i_d_order_exec_id_at] == exec_i_d_order_exec_id_written.system_id[exec_i_d_order_exec_id_at]); exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 4 -> assert(exec_i_d_order_exec_id_read.system_sequence_id[exec_i_d_order_exec_id_at] == exec_i_d_order_exec_id_written.system_sequence_id[exec_i_d_order_exec_id_at]); exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  exec_i_d_order_exec_id_at = 0;
  do
  :: exec_i_d_order_exec_id_at < 8 -> assert(exec_i_d_order_exec_id_read.transact_time_utc_timestamp[exec_i_d_order_exec_id_at] == exec_i_d_order_exec_id_written.transact_time_utc_timestamp[exec_i_d_order_exec_id_at]); exec_i_d_order_exec_id_at = exec_i_d_order_exec_id_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orig Order Id: 16 bytes ------------------------------------------------- */

/* ExecutionReport_NewMessage */
typedef OrigOrderId {
  byte original_system_id[8];
  byte original_creation_timestamp[8]
};

int orig_order_id_at;

/* every byte of Orig Order Id set to one value */
inline fill_orig_order_id(orig_order_id_record, orig_order_id_value) {
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> orig_order_id_record.original_system_id[orig_order_id_at] = orig_order_id_value; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> orig_order_id_record.original_creation_timestamp[orig_order_id_at] = orig_order_id_value; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orig Order Id set to where it lies, so a field read out of place says so */
inline ramp_orig_order_id(orig_order_id_record, orig_order_id_base) {
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> orig_order_id_record.original_system_id[orig_order_id_at] = (orig_order_id_base + 0 + orig_order_id_at + 1) % 256; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> orig_order_id_record.original_creation_timestamp[orig_order_id_at] = (orig_order_id_base + 8 + orig_order_id_at + 1) % 256; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* Orig Order Id to the wire, 16 bytes from where the cursor stands */
inline encode_orig_order_id(orig_order_id_record) {
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> wire[at] = orig_order_id_record.original_system_id[orig_order_id_at]; at = at + 1; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> wire[at] = orig_order_id_record.original_creation_timestamp[orig_order_id_at]; at = at + 1; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* Orig Order Id off the wire, 16 bytes from where the cursor stands */
inline decode_orig_order_id(orig_order_id_record) {
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> orig_order_id_record.original_system_id[orig_order_id_at] = wire[at]; at = at + 1; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> orig_order_id_record.original_creation_timestamp[orig_order_id_at] = wire[at]; at = at + 1; orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orig Order Id is what was written, byte for byte */
inline equal_orig_order_id(orig_order_id_read, orig_order_id_written) {
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> assert(orig_order_id_read.original_system_id[orig_order_id_at] == orig_order_id_written.original_system_id[orig_order_id_at]); orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  orig_order_id_at = 0;
  do
  :: orig_order_id_at < 8 -> assert(orig_order_id_read.original_creation_timestamp[orig_order_id_at] == orig_order_id_written.original_creation_timestamp[orig_order_id_at]); orig_order_id_at = orig_order_id_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report New Message: 133 bytes --------------------------------- */

/* ExecutionReport_NewMessage */
typedef ExecutionReportNewMessage {
  byte originator_user_id[20];
  ExecIDOrderExecId exec_i_d_order_exec_id;
  byte cl_ord_id[8];
  byte symbol[4];
  byte ord_type;
  byte side;
  OrigOrderId orig_order_id;
  byte leaves_qty[8];
  byte price_optional[8];
  byte me_acceptance_time[8];
  byte time_priority[8];
  byte order_status;
  byte memo[30]
};

int execution_report_new_message_at;

/* every byte of Execution Report New Message set to one value */
inline fill_execution_report_new_message(execution_report_new_message_record, execution_report_new_message_value) {
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 20 -> execution_report_new_message_record.originator_user_id[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  fill_exec_i_d_order_exec_id(execution_report_new_message_record.exec_i_d_order_exec_id, execution_report_new_message_value);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.cl_ord_id[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 4 -> execution_report_new_message_record.symbol[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_record.ord_type = execution_report_new_message_value;
  execution_report_new_message_record.side = execution_report_new_message_value;
  fill_orig_order_id(execution_report_new_message_record.orig_order_id, execution_report_new_message_value);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.leaves_qty[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.price_optional[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.me_acceptance_time[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.time_priority[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_record.order_status = execution_report_new_message_value;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 30 -> execution_report_new_message_record.memo[execution_report_new_message_at] = execution_report_new_message_value; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report New Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_new_message(execution_report_new_message_record, execution_report_new_message_base) {
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 20 -> execution_report_new_message_record.originator_user_id[execution_report_new_message_at] = (execution_report_new_message_base + 0 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  ramp_exec_i_d_order_exec_id(execution_report_new_message_record.exec_i_d_order_exec_id, execution_report_new_message_base + 20);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.cl_ord_id[execution_report_new_message_at] = (execution_report_new_message_base + 40 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 4 -> execution_report_new_message_record.symbol[execution_report_new_message_at] = (execution_report_new_message_base + 48 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_record.ord_type = (execution_report_new_message_base + 52 + 1) % 256;
  execution_report_new_message_record.side = (execution_report_new_message_base + 53 + 1) % 256;
  ramp_orig_order_id(execution_report_new_message_record.orig_order_id, execution_report_new_message_base + 54);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.leaves_qty[execution_report_new_message_at] = (execution_report_new_message_base + 70 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.price_optional[execution_report_new_message_at] = (execution_report_new_message_base + 78 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.me_acceptance_time[execution_report_new_message_at] = (execution_report_new_message_base + 86 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.time_priority[execution_report_new_message_at] = (execution_report_new_message_base + 94 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_record.order_status = (execution_report_new_message_base + 102 + 1) % 256;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 30 -> execution_report_new_message_record.memo[execution_report_new_message_at] = (execution_report_new_message_base + 103 + execution_report_new_message_at + 1) % 256; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report New Message to the wire, 133 bytes from where the cursor stands */
inline encode_execution_report_new_message(execution_report_new_message_record) {
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 20 -> wire[at] = execution_report_new_message_record.originator_user_id[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  encode_exec_i_d_order_exec_id(execution_report_new_message_record.exec_i_d_order_exec_id);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> wire[at] = execution_report_new_message_record.cl_ord_id[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 4 -> wire[at] = execution_report_new_message_record.symbol[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_new_message_record.ord_type; at = at + 1;
  wire[at] = execution_report_new_message_record.side; at = at + 1;
  encode_orig_order_id(execution_report_new_message_record.orig_order_id);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> wire[at] = execution_report_new_message_record.leaves_qty[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> wire[at] = execution_report_new_message_record.price_optional[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> wire[at] = execution_report_new_message_record.me_acceptance_time[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> wire[at] = execution_report_new_message_record.time_priority[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_new_message_record.order_status; at = at + 1;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 30 -> wire[at] = execution_report_new_message_record.memo[execution_report_new_message_at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report New Message off the wire, 133 bytes from where the cursor stands */
inline decode_execution_report_new_message(execution_report_new_message_record) {
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 20 -> execution_report_new_message_record.originator_user_id[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  decode_exec_i_d_order_exec_id(execution_report_new_message_record.exec_i_d_order_exec_id);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.cl_ord_id[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 4 -> execution_report_new_message_record.symbol[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_record.ord_type = wire[at]; at = at + 1;
  execution_report_new_message_record.side = wire[at]; at = at + 1;
  decode_orig_order_id(execution_report_new_message_record.orig_order_id);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.leaves_qty[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.price_optional[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.me_acceptance_time[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> execution_report_new_message_record.time_priority[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_record.order_status = wire[at]; at = at + 1;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 30 -> execution_report_new_message_record.memo[execution_report_new_message_at] = wire[at]; at = at + 1; execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report New Message is what was written, byte for byte */
inline equal_execution_report_new_message(execution_report_new_message_read, execution_report_new_message_written) {
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 20 -> assert(execution_report_new_message_read.originator_user_id[execution_report_new_message_at] == execution_report_new_message_written.originator_user_id[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  equal_exec_i_d_order_exec_id(execution_report_new_message_read.exec_i_d_order_exec_id, execution_report_new_message_written.exec_i_d_order_exec_id);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> assert(execution_report_new_message_read.cl_ord_id[execution_report_new_message_at] == execution_report_new_message_written.cl_ord_id[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 4 -> assert(execution_report_new_message_read.symbol[execution_report_new_message_at] == execution_report_new_message_written.symbol[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  assert(execution_report_new_message_read.ord_type == execution_report_new_message_written.ord_type);
  assert(execution_report_new_message_read.side == execution_report_new_message_written.side);
  equal_orig_order_id(execution_report_new_message_read.orig_order_id, execution_report_new_message_written.orig_order_id);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> assert(execution_report_new_message_read.leaves_qty[execution_report_new_message_at] == execution_report_new_message_written.leaves_qty[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> assert(execution_report_new_message_read.price_optional[execution_report_new_message_at] == execution_report_new_message_written.price_optional[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> assert(execution_report_new_message_read.me_acceptance_time[execution_report_new_message_at] == execution_report_new_message_written.me_acceptance_time[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 8 -> assert(execution_report_new_message_read.time_priority[execution_report_new_message_at] == execution_report_new_message_written.time_priority[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  assert(execution_report_new_message_read.order_status == execution_report_new_message_written.order_status);
  execution_report_new_message_at = 0;
  do
  :: execution_report_new_message_at < 30 -> assert(execution_report_new_message_read.memo[execution_report_new_message_at] == execution_report_new_message_written.memo[execution_report_new_message_at]); execution_report_new_message_at = execution_report_new_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Cancel Message: 199 bytes ------------------------------ */

/* ExecutionReport_CancelMessage */
typedef ExecutionReportCancelMessage {
  byte originator_user_id[20];
  ExecIDOrderExecId exec_i_d_order_exec_id;
  byte cl_ord_id[8];
  byte symbol[4];
  byte ord_type;
  byte side;
  OrigOrderId orig_order_id;
  byte orig_cl_ord_i_d_optional[8];
  byte me_acceptance_time[8];
  byte exchange_code[4];
  byte cancel_reason;
  byte cross_i_d_optional[8];
  byte text[100]
};

int execution_report_cancel_message_at;

/* every byte of Execution Report Cancel Message set to one value */
inline fill_execution_report_cancel_message(execution_report_cancel_message_record, execution_report_cancel_message_value) {
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 20 -> execution_report_cancel_message_record.originator_user_id[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  fill_exec_i_d_order_exec_id(execution_report_cancel_message_record.exec_i_d_order_exec_id, execution_report_cancel_message_value);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.cl_ord_id[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> execution_report_cancel_message_record.symbol[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_record.ord_type = execution_report_cancel_message_value;
  execution_report_cancel_message_record.side = execution_report_cancel_message_value;
  fill_orig_order_id(execution_report_cancel_message_record.orig_order_id, execution_report_cancel_message_value);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.orig_cl_ord_i_d_optional[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.me_acceptance_time[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> execution_report_cancel_message_record.exchange_code[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_record.cancel_reason = execution_report_cancel_message_value;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.cross_i_d_optional[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 100 -> execution_report_cancel_message_record.text[execution_report_cancel_message_at] = execution_report_cancel_message_value; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_cancel_message(execution_report_cancel_message_record, execution_report_cancel_message_base) {
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 20 -> execution_report_cancel_message_record.originator_user_id[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 0 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  ramp_exec_i_d_order_exec_id(execution_report_cancel_message_record.exec_i_d_order_exec_id, execution_report_cancel_message_base + 20);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.cl_ord_id[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 40 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> execution_report_cancel_message_record.symbol[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 48 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_record.ord_type = (execution_report_cancel_message_base + 52 + 1) % 256;
  execution_report_cancel_message_record.side = (execution_report_cancel_message_base + 53 + 1) % 256;
  ramp_orig_order_id(execution_report_cancel_message_record.orig_order_id, execution_report_cancel_message_base + 54);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.orig_cl_ord_i_d_optional[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 70 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.me_acceptance_time[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 78 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> execution_report_cancel_message_record.exchange_code[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 86 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_record.cancel_reason = (execution_report_cancel_message_base + 90 + 1) % 256;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.cross_i_d_optional[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 91 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 100 -> execution_report_cancel_message_record.text[execution_report_cancel_message_at] = (execution_report_cancel_message_base + 99 + execution_report_cancel_message_at + 1) % 256; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Cancel Message to the wire, 199 bytes from where the cursor stands */
inline encode_execution_report_cancel_message(execution_report_cancel_message_record) {
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 20 -> wire[at] = execution_report_cancel_message_record.originator_user_id[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  encode_exec_i_d_order_exec_id(execution_report_cancel_message_record.exec_i_d_order_exec_id);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> wire[at] = execution_report_cancel_message_record.cl_ord_id[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> wire[at] = execution_report_cancel_message_record.symbol[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_cancel_message_record.ord_type; at = at + 1;
  wire[at] = execution_report_cancel_message_record.side; at = at + 1;
  encode_orig_order_id(execution_report_cancel_message_record.orig_order_id);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> wire[at] = execution_report_cancel_message_record.orig_cl_ord_i_d_optional[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> wire[at] = execution_report_cancel_message_record.me_acceptance_time[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> wire[at] = execution_report_cancel_message_record.exchange_code[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_cancel_message_record.cancel_reason; at = at + 1;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> wire[at] = execution_report_cancel_message_record.cross_i_d_optional[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 100 -> wire[at] = execution_report_cancel_message_record.text[execution_report_cancel_message_at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Cancel Message off the wire, 199 bytes from where the cursor stands */
inline decode_execution_report_cancel_message(execution_report_cancel_message_record) {
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 20 -> execution_report_cancel_message_record.originator_user_id[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  decode_exec_i_d_order_exec_id(execution_report_cancel_message_record.exec_i_d_order_exec_id);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.cl_ord_id[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> execution_report_cancel_message_record.symbol[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_record.ord_type = wire[at]; at = at + 1;
  execution_report_cancel_message_record.side = wire[at]; at = at + 1;
  decode_orig_order_id(execution_report_cancel_message_record.orig_order_id);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.orig_cl_ord_i_d_optional[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.me_acceptance_time[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> execution_report_cancel_message_record.exchange_code[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_record.cancel_reason = wire[at]; at = at + 1;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> execution_report_cancel_message_record.cross_i_d_optional[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 100 -> execution_report_cancel_message_record.text[execution_report_cancel_message_at] = wire[at]; at = at + 1; execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Cancel Message is what was written, byte for byte */
inline equal_execution_report_cancel_message(execution_report_cancel_message_read, execution_report_cancel_message_written) {
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 20 -> assert(execution_report_cancel_message_read.originator_user_id[execution_report_cancel_message_at] == execution_report_cancel_message_written.originator_user_id[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  equal_exec_i_d_order_exec_id(execution_report_cancel_message_read.exec_i_d_order_exec_id, execution_report_cancel_message_written.exec_i_d_order_exec_id);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> assert(execution_report_cancel_message_read.cl_ord_id[execution_report_cancel_message_at] == execution_report_cancel_message_written.cl_ord_id[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> assert(execution_report_cancel_message_read.symbol[execution_report_cancel_message_at] == execution_report_cancel_message_written.symbol[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  assert(execution_report_cancel_message_read.ord_type == execution_report_cancel_message_written.ord_type);
  assert(execution_report_cancel_message_read.side == execution_report_cancel_message_written.side);
  equal_orig_order_id(execution_report_cancel_message_read.orig_order_id, execution_report_cancel_message_written.orig_order_id);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> assert(execution_report_cancel_message_read.orig_cl_ord_i_d_optional[execution_report_cancel_message_at] == execution_report_cancel_message_written.orig_cl_ord_i_d_optional[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> assert(execution_report_cancel_message_read.me_acceptance_time[execution_report_cancel_message_at] == execution_report_cancel_message_written.me_acceptance_time[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 4 -> assert(execution_report_cancel_message_read.exchange_code[execution_report_cancel_message_at] == execution_report_cancel_message_written.exchange_code[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  assert(execution_report_cancel_message_read.cancel_reason == execution_report_cancel_message_written.cancel_reason);
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 8 -> assert(execution_report_cancel_message_read.cross_i_d_optional[execution_report_cancel_message_at] == execution_report_cancel_message_written.cross_i_d_optional[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  execution_report_cancel_message_at = 0;
  do
  :: execution_report_cancel_message_at < 100 -> assert(execution_report_cancel_message_read.text[execution_report_cancel_message_at] == execution_report_cancel_message_written.text[execution_report_cancel_message_at]); execution_report_cancel_message_at = execution_report_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Reject Message: 215 bytes ------------------------------ */

/* ExecutionReport_RejectMessage */
typedef ExecutionReportRejectMessage {
  byte originator_user_id[20];
  ExecIDOrderExecId exec_i_d_order_exec_id;
  byte cl_ord_id[8];
  byte symbol[4];
  byte ord_type_optional;
  byte side;
  OrigOrderId orig_order_id;
  byte orig_cl_ord_i_d_optional[8];
  byte order_status;
  byte reject_response_to;
  byte reject_reason;
  byte exchange_code[4];
  byte memo[30];
  byte text[100]
};

int execution_report_reject_message_at;

/* every byte of Execution Report Reject Message set to one value */
inline fill_execution_report_reject_message(execution_report_reject_message_record, execution_report_reject_message_value) {
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 20 -> execution_report_reject_message_record.originator_user_id[execution_report_reject_message_at] = execution_report_reject_message_value; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  fill_exec_i_d_order_exec_id(execution_report_reject_message_record.exec_i_d_order_exec_id, execution_report_reject_message_value);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> execution_report_reject_message_record.cl_ord_id[execution_report_reject_message_at] = execution_report_reject_message_value; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> execution_report_reject_message_record.symbol[execution_report_reject_message_at] = execution_report_reject_message_value; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_record.ord_type_optional = execution_report_reject_message_value;
  execution_report_reject_message_record.side = execution_report_reject_message_value;
  fill_orig_order_id(execution_report_reject_message_record.orig_order_id, execution_report_reject_message_value);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> execution_report_reject_message_record.orig_cl_ord_i_d_optional[execution_report_reject_message_at] = execution_report_reject_message_value; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_record.order_status = execution_report_reject_message_value;
  execution_report_reject_message_record.reject_response_to = execution_report_reject_message_value;
  execution_report_reject_message_record.reject_reason = execution_report_reject_message_value;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> execution_report_reject_message_record.exchange_code[execution_report_reject_message_at] = execution_report_reject_message_value; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 30 -> execution_report_reject_message_record.memo[execution_report_reject_message_at] = execution_report_reject_message_value; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 100 -> execution_report_reject_message_record.text[execution_report_reject_message_at] = execution_report_reject_message_value; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Reject Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_reject_message(execution_report_reject_message_record, execution_report_reject_message_base) {
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 20 -> execution_report_reject_message_record.originator_user_id[execution_report_reject_message_at] = (execution_report_reject_message_base + 0 + execution_report_reject_message_at + 1) % 256; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  ramp_exec_i_d_order_exec_id(execution_report_reject_message_record.exec_i_d_order_exec_id, execution_report_reject_message_base + 20);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> execution_report_reject_message_record.cl_ord_id[execution_report_reject_message_at] = (execution_report_reject_message_base + 40 + execution_report_reject_message_at + 1) % 256; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> execution_report_reject_message_record.symbol[execution_report_reject_message_at] = (execution_report_reject_message_base + 48 + execution_report_reject_message_at + 1) % 256; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_record.ord_type_optional = (execution_report_reject_message_base + 52 + 1) % 256;
  execution_report_reject_message_record.side = (execution_report_reject_message_base + 53 + 1) % 256;
  ramp_orig_order_id(execution_report_reject_message_record.orig_order_id, execution_report_reject_message_base + 54);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> execution_report_reject_message_record.orig_cl_ord_i_d_optional[execution_report_reject_message_at] = (execution_report_reject_message_base + 70 + execution_report_reject_message_at + 1) % 256; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_record.order_status = (execution_report_reject_message_base + 78 + 1) % 256;
  execution_report_reject_message_record.reject_response_to = (execution_report_reject_message_base + 79 + 1) % 256;
  execution_report_reject_message_record.reject_reason = (execution_report_reject_message_base + 80 + 1) % 256;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> execution_report_reject_message_record.exchange_code[execution_report_reject_message_at] = (execution_report_reject_message_base + 81 + execution_report_reject_message_at + 1) % 256; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 30 -> execution_report_reject_message_record.memo[execution_report_reject_message_at] = (execution_report_reject_message_base + 85 + execution_report_reject_message_at + 1) % 256; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 100 -> execution_report_reject_message_record.text[execution_report_reject_message_at] = (execution_report_reject_message_base + 115 + execution_report_reject_message_at + 1) % 256; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Reject Message to the wire, 215 bytes from where the cursor stands */
inline encode_execution_report_reject_message(execution_report_reject_message_record) {
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 20 -> wire[at] = execution_report_reject_message_record.originator_user_id[execution_report_reject_message_at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  encode_exec_i_d_order_exec_id(execution_report_reject_message_record.exec_i_d_order_exec_id);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> wire[at] = execution_report_reject_message_record.cl_ord_id[execution_report_reject_message_at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> wire[at] = execution_report_reject_message_record.symbol[execution_report_reject_message_at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_reject_message_record.ord_type_optional; at = at + 1;
  wire[at] = execution_report_reject_message_record.side; at = at + 1;
  encode_orig_order_id(execution_report_reject_message_record.orig_order_id);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> wire[at] = execution_report_reject_message_record.orig_cl_ord_i_d_optional[execution_report_reject_message_at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_reject_message_record.order_status; at = at + 1;
  wire[at] = execution_report_reject_message_record.reject_response_to; at = at + 1;
  wire[at] = execution_report_reject_message_record.reject_reason; at = at + 1;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> wire[at] = execution_report_reject_message_record.exchange_code[execution_report_reject_message_at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 30 -> wire[at] = execution_report_reject_message_record.memo[execution_report_reject_message_at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 100 -> wire[at] = execution_report_reject_message_record.text[execution_report_reject_message_at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Reject Message off the wire, 215 bytes from where the cursor stands */
inline decode_execution_report_reject_message(execution_report_reject_message_record) {
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 20 -> execution_report_reject_message_record.originator_user_id[execution_report_reject_message_at] = wire[at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  decode_exec_i_d_order_exec_id(execution_report_reject_message_record.exec_i_d_order_exec_id);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> execution_report_reject_message_record.cl_ord_id[execution_report_reject_message_at] = wire[at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> execution_report_reject_message_record.symbol[execution_report_reject_message_at] = wire[at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_record.ord_type_optional = wire[at]; at = at + 1;
  execution_report_reject_message_record.side = wire[at]; at = at + 1;
  decode_orig_order_id(execution_report_reject_message_record.orig_order_id);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> execution_report_reject_message_record.orig_cl_ord_i_d_optional[execution_report_reject_message_at] = wire[at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_record.order_status = wire[at]; at = at + 1;
  execution_report_reject_message_record.reject_response_to = wire[at]; at = at + 1;
  execution_report_reject_message_record.reject_reason = wire[at]; at = at + 1;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> execution_report_reject_message_record.exchange_code[execution_report_reject_message_at] = wire[at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 30 -> execution_report_reject_message_record.memo[execution_report_reject_message_at] = wire[at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 100 -> execution_report_reject_message_record.text[execution_report_reject_message_at] = wire[at]; at = at + 1; execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Reject Message is what was written, byte for byte */
inline equal_execution_report_reject_message(execution_report_reject_message_read, execution_report_reject_message_written) {
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 20 -> assert(execution_report_reject_message_read.originator_user_id[execution_report_reject_message_at] == execution_report_reject_message_written.originator_user_id[execution_report_reject_message_at]); execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  equal_exec_i_d_order_exec_id(execution_report_reject_message_read.exec_i_d_order_exec_id, execution_report_reject_message_written.exec_i_d_order_exec_id);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> assert(execution_report_reject_message_read.cl_ord_id[execution_report_reject_message_at] == execution_report_reject_message_written.cl_ord_id[execution_report_reject_message_at]); execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> assert(execution_report_reject_message_read.symbol[execution_report_reject_message_at] == execution_report_reject_message_written.symbol[execution_report_reject_message_at]); execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  assert(execution_report_reject_message_read.ord_type_optional == execution_report_reject_message_written.ord_type_optional);
  assert(execution_report_reject_message_read.side == execution_report_reject_message_written.side);
  equal_orig_order_id(execution_report_reject_message_read.orig_order_id, execution_report_reject_message_written.orig_order_id);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 8 -> assert(execution_report_reject_message_read.orig_cl_ord_i_d_optional[execution_report_reject_message_at] == execution_report_reject_message_written.orig_cl_ord_i_d_optional[execution_report_reject_message_at]); execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  assert(execution_report_reject_message_read.order_status == execution_report_reject_message_written.order_status);
  assert(execution_report_reject_message_read.reject_response_to == execution_report_reject_message_written.reject_response_to);
  assert(execution_report_reject_message_read.reject_reason == execution_report_reject_message_written.reject_reason);
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 4 -> assert(execution_report_reject_message_read.exchange_code[execution_report_reject_message_at] == execution_report_reject_message_written.exchange_code[execution_report_reject_message_at]); execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 30 -> assert(execution_report_reject_message_read.memo[execution_report_reject_message_at] == execution_report_reject_message_written.memo[execution_report_reject_message_at]); execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  execution_report_reject_message_at = 0;
  do
  :: execution_report_reject_message_at < 100 -> assert(execution_report_reject_message_read.text[execution_report_reject_message_at] == execution_report_reject_message_written.text[execution_report_reject_message_at]); execution_report_reject_message_at = execution_report_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Report Snapshot Message: 380 bytes ---------------------------- */

/* ExecutionReport_SnapshotMessage */
typedef ExecutionReportSnapshotMessage {
  byte originator_user_id[20];
  ExecIDOrderExecId exec_i_d_order_exec_id;
  byte cl_ord_id[8];
  byte symbol[4];
  byte ord_type;
  byte side;
  OrigOrderId orig_order_id;
  byte max_show[8];
  byte leaves_qty[8];
  byte cum_qty[8];
  byte price_optional[8];
  byte stop_px[8];
  byte expire_date[2];
  byte time_priority[8];
  byte time_in_force;
  byte order_status;
  byte order_state;
  byte give_up_clearing_firm[4];
  byte clearing_firm_optional[4];
  byte direct_electronic_access;
  byte trading_capacity;
  byte liquidity_provision;
  byte commodity_deriv_indicator;
  byte investment_decision[8];
  byte execution_decision[8];
  byte client_id_code[8];
  byte mifid_id[8];
  byte self_match_prevention_id[8];
  byte self_match_prevention_instruction;
  byte manual_order_indicator;
  byte exec_inst;
  byte cust_order_handling_inst;
  byte position_effect;
  byte alloc_handl_inst;
  byte clearing_account_optional[14];
  byte customer_account_ref_id[12];
  byte memo[30];
  byte allocation_account[20];
  byte on_behalf_of_comp_id[41];
  byte on_behalf_of_sub_i_d_optional[41];
  byte on_behalf_of_location_i_d_optional[41]
};

int execution_report_snapshot_message_at;

/* every byte of Execution Report Snapshot Message set to one value */
inline fill_execution_report_snapshot_message(execution_report_snapshot_message_record, execution_report_snapshot_message_value) {
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> execution_report_snapshot_message_record.originator_user_id[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  fill_exec_i_d_order_exec_id(execution_report_snapshot_message_record.exec_i_d_order_exec_id, execution_report_snapshot_message_value);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.cl_ord_id[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.symbol[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.ord_type = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.side = execution_report_snapshot_message_value;
  fill_orig_order_id(execution_report_snapshot_message_record.orig_order_id, execution_report_snapshot_message_value);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.max_show[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.leaves_qty[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.cum_qty[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.price_optional[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.stop_px[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 2 -> execution_report_snapshot_message_record.expire_date[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.time_priority[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.time_in_force = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.order_status = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.order_state = execution_report_snapshot_message_value;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.give_up_clearing_firm[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.clearing_firm_optional[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.direct_electronic_access = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.trading_capacity = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.liquidity_provision = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.commodity_deriv_indicator = execution_report_snapshot_message_value;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.investment_decision[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.execution_decision[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.client_id_code[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.mifid_id[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.self_match_prevention_id[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.self_match_prevention_instruction = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.manual_order_indicator = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.exec_inst = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.cust_order_handling_inst = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.position_effect = execution_report_snapshot_message_value;
  execution_report_snapshot_message_record.alloc_handl_inst = execution_report_snapshot_message_value;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 14 -> execution_report_snapshot_message_record.clearing_account_optional[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 12 -> execution_report_snapshot_message_record.customer_account_ref_id[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 30 -> execution_report_snapshot_message_record.memo[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> execution_report_snapshot_message_record.allocation_account[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_comp_id[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_sub_i_d_optional[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_location_i_d_optional[execution_report_snapshot_message_at] = execution_report_snapshot_message_value; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_snapshot_message(execution_report_snapshot_message_record, execution_report_snapshot_message_base) {
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> execution_report_snapshot_message_record.originator_user_id[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 0 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  ramp_exec_i_d_order_exec_id(execution_report_snapshot_message_record.exec_i_d_order_exec_id, execution_report_snapshot_message_base + 20);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.cl_ord_id[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 40 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.symbol[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 48 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.ord_type = (execution_report_snapshot_message_base + 52 + 1) % 256;
  execution_report_snapshot_message_record.side = (execution_report_snapshot_message_base + 53 + 1) % 256;
  ramp_orig_order_id(execution_report_snapshot_message_record.orig_order_id, execution_report_snapshot_message_base + 54);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.max_show[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 70 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.leaves_qty[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 78 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.cum_qty[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 86 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.price_optional[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 94 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.stop_px[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 102 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 2 -> execution_report_snapshot_message_record.expire_date[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 110 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.time_priority[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 112 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.time_in_force = (execution_report_snapshot_message_base + 120 + 1) % 256;
  execution_report_snapshot_message_record.order_status = (execution_report_snapshot_message_base + 121 + 1) % 256;
  execution_report_snapshot_message_record.order_state = (execution_report_snapshot_message_base + 122 + 1) % 256;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.give_up_clearing_firm[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 123 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.clearing_firm_optional[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 127 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.direct_electronic_access = (execution_report_snapshot_message_base + 131 + 1) % 256;
  execution_report_snapshot_message_record.trading_capacity = (execution_report_snapshot_message_base + 132 + 1) % 256;
  execution_report_snapshot_message_record.liquidity_provision = (execution_report_snapshot_message_base + 133 + 1) % 256;
  execution_report_snapshot_message_record.commodity_deriv_indicator = (execution_report_snapshot_message_base + 134 + 1) % 256;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.investment_decision[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 135 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.execution_decision[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 143 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.client_id_code[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 151 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.mifid_id[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 159 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.self_match_prevention_id[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 167 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.self_match_prevention_instruction = (execution_report_snapshot_message_base + 175 + 1) % 256;
  execution_report_snapshot_message_record.manual_order_indicator = (execution_report_snapshot_message_base + 176 + 1) % 256;
  execution_report_snapshot_message_record.exec_inst = (execution_report_snapshot_message_base + 177 + 1) % 256;
  execution_report_snapshot_message_record.cust_order_handling_inst = (execution_report_snapshot_message_base + 178 + 1) % 256;
  execution_report_snapshot_message_record.position_effect = (execution_report_snapshot_message_base + 179 + 1) % 256;
  execution_report_snapshot_message_record.alloc_handl_inst = (execution_report_snapshot_message_base + 180 + 1) % 256;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 14 -> execution_report_snapshot_message_record.clearing_account_optional[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 181 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 12 -> execution_report_snapshot_message_record.customer_account_ref_id[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 195 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 30 -> execution_report_snapshot_message_record.memo[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 207 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> execution_report_snapshot_message_record.allocation_account[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 237 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_comp_id[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 257 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_sub_i_d_optional[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 298 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_location_i_d_optional[execution_report_snapshot_message_at] = (execution_report_snapshot_message_base + 339 + execution_report_snapshot_message_at + 1) % 256; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Snapshot Message to the wire, 380 bytes from where the cursor stands */
inline encode_execution_report_snapshot_message(execution_report_snapshot_message_record) {
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> wire[at] = execution_report_snapshot_message_record.originator_user_id[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  encode_exec_i_d_order_exec_id(execution_report_snapshot_message_record.exec_i_d_order_exec_id);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.cl_ord_id[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> wire[at] = execution_report_snapshot_message_record.symbol[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_snapshot_message_record.ord_type; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.side; at = at + 1;
  encode_orig_order_id(execution_report_snapshot_message_record.orig_order_id);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.max_show[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.leaves_qty[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.cum_qty[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.price_optional[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.stop_px[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 2 -> wire[at] = execution_report_snapshot_message_record.expire_date[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.time_priority[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_snapshot_message_record.time_in_force; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.order_status; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.order_state; at = at + 1;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> wire[at] = execution_report_snapshot_message_record.give_up_clearing_firm[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> wire[at] = execution_report_snapshot_message_record.clearing_firm_optional[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_snapshot_message_record.direct_electronic_access; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.trading_capacity; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.liquidity_provision; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.commodity_deriv_indicator; at = at + 1;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.investment_decision[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.execution_decision[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.client_id_code[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.mifid_id[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> wire[at] = execution_report_snapshot_message_record.self_match_prevention_id[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_snapshot_message_record.self_match_prevention_instruction; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.manual_order_indicator; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.exec_inst; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.cust_order_handling_inst; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.position_effect; at = at + 1;
  wire[at] = execution_report_snapshot_message_record.alloc_handl_inst; at = at + 1;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 14 -> wire[at] = execution_report_snapshot_message_record.clearing_account_optional[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 12 -> wire[at] = execution_report_snapshot_message_record.customer_account_ref_id[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 30 -> wire[at] = execution_report_snapshot_message_record.memo[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> wire[at] = execution_report_snapshot_message_record.allocation_account[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> wire[at] = execution_report_snapshot_message_record.on_behalf_of_comp_id[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> wire[at] = execution_report_snapshot_message_record.on_behalf_of_sub_i_d_optional[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> wire[at] = execution_report_snapshot_message_record.on_behalf_of_location_i_d_optional[execution_report_snapshot_message_at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Snapshot Message off the wire, 380 bytes from where the cursor stands */
inline decode_execution_report_snapshot_message(execution_report_snapshot_message_record) {
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> execution_report_snapshot_message_record.originator_user_id[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  decode_exec_i_d_order_exec_id(execution_report_snapshot_message_record.exec_i_d_order_exec_id);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.cl_ord_id[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.symbol[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.ord_type = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.side = wire[at]; at = at + 1;
  decode_orig_order_id(execution_report_snapshot_message_record.orig_order_id);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.max_show[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.leaves_qty[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.cum_qty[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.price_optional[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.stop_px[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 2 -> execution_report_snapshot_message_record.expire_date[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.time_priority[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.time_in_force = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.order_status = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.order_state = wire[at]; at = at + 1;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.give_up_clearing_firm[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> execution_report_snapshot_message_record.clearing_firm_optional[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.direct_electronic_access = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.trading_capacity = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.liquidity_provision = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.commodity_deriv_indicator = wire[at]; at = at + 1;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.investment_decision[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.execution_decision[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.client_id_code[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.mifid_id[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> execution_report_snapshot_message_record.self_match_prevention_id[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_record.self_match_prevention_instruction = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.manual_order_indicator = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.exec_inst = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.cust_order_handling_inst = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.position_effect = wire[at]; at = at + 1;
  execution_report_snapshot_message_record.alloc_handl_inst = wire[at]; at = at + 1;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 14 -> execution_report_snapshot_message_record.clearing_account_optional[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 12 -> execution_report_snapshot_message_record.customer_account_ref_id[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 30 -> execution_report_snapshot_message_record.memo[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> execution_report_snapshot_message_record.allocation_account[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_comp_id[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_sub_i_d_optional[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> execution_report_snapshot_message_record.on_behalf_of_location_i_d_optional[execution_report_snapshot_message_at] = wire[at]; at = at + 1; execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Snapshot Message is what was written, byte for byte */
inline equal_execution_report_snapshot_message(execution_report_snapshot_message_read, execution_report_snapshot_message_written) {
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> assert(execution_report_snapshot_message_read.originator_user_id[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.originator_user_id[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  equal_exec_i_d_order_exec_id(execution_report_snapshot_message_read.exec_i_d_order_exec_id, execution_report_snapshot_message_written.exec_i_d_order_exec_id);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.cl_ord_id[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.cl_ord_id[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> assert(execution_report_snapshot_message_read.symbol[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.symbol[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  assert(execution_report_snapshot_message_read.ord_type == execution_report_snapshot_message_written.ord_type);
  assert(execution_report_snapshot_message_read.side == execution_report_snapshot_message_written.side);
  equal_orig_order_id(execution_report_snapshot_message_read.orig_order_id, execution_report_snapshot_message_written.orig_order_id);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.max_show[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.max_show[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.leaves_qty[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.leaves_qty[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.cum_qty[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.cum_qty[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.price_optional[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.price_optional[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.stop_px[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.stop_px[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 2 -> assert(execution_report_snapshot_message_read.expire_date[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.expire_date[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.time_priority[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.time_priority[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  assert(execution_report_snapshot_message_read.time_in_force == execution_report_snapshot_message_written.time_in_force);
  assert(execution_report_snapshot_message_read.order_status == execution_report_snapshot_message_written.order_status);
  assert(execution_report_snapshot_message_read.order_state == execution_report_snapshot_message_written.order_state);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> assert(execution_report_snapshot_message_read.give_up_clearing_firm[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.give_up_clearing_firm[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 4 -> assert(execution_report_snapshot_message_read.clearing_firm_optional[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.clearing_firm_optional[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  assert(execution_report_snapshot_message_read.direct_electronic_access == execution_report_snapshot_message_written.direct_electronic_access);
  assert(execution_report_snapshot_message_read.trading_capacity == execution_report_snapshot_message_written.trading_capacity);
  assert(execution_report_snapshot_message_read.liquidity_provision == execution_report_snapshot_message_written.liquidity_provision);
  assert(execution_report_snapshot_message_read.commodity_deriv_indicator == execution_report_snapshot_message_written.commodity_deriv_indicator);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.investment_decision[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.investment_decision[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.execution_decision[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.execution_decision[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.client_id_code[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.client_id_code[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.mifid_id[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.mifid_id[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 8 -> assert(execution_report_snapshot_message_read.self_match_prevention_id[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.self_match_prevention_id[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  assert(execution_report_snapshot_message_read.self_match_prevention_instruction == execution_report_snapshot_message_written.self_match_prevention_instruction);
  assert(execution_report_snapshot_message_read.manual_order_indicator == execution_report_snapshot_message_written.manual_order_indicator);
  assert(execution_report_snapshot_message_read.exec_inst == execution_report_snapshot_message_written.exec_inst);
  assert(execution_report_snapshot_message_read.cust_order_handling_inst == execution_report_snapshot_message_written.cust_order_handling_inst);
  assert(execution_report_snapshot_message_read.position_effect == execution_report_snapshot_message_written.position_effect);
  assert(execution_report_snapshot_message_read.alloc_handl_inst == execution_report_snapshot_message_written.alloc_handl_inst);
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 14 -> assert(execution_report_snapshot_message_read.clearing_account_optional[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.clearing_account_optional[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 12 -> assert(execution_report_snapshot_message_read.customer_account_ref_id[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.customer_account_ref_id[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 30 -> assert(execution_report_snapshot_message_read.memo[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.memo[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 20 -> assert(execution_report_snapshot_message_read.allocation_account[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.allocation_account[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> assert(execution_report_snapshot_message_read.on_behalf_of_comp_id[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.on_behalf_of_comp_id[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> assert(execution_report_snapshot_message_read.on_behalf_of_sub_i_d_optional[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.on_behalf_of_sub_i_d_optional[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  execution_report_snapshot_message_at = 0;
  do
  :: execution_report_snapshot_message_at < 41 -> assert(execution_report_snapshot_message_read.on_behalf_of_location_i_d_optional[execution_report_snapshot_message_at] == execution_report_snapshot_message_written.on_behalf_of_location_i_d_optional[execution_report_snapshot_message_at]); execution_report_snapshot_message_at = execution_report_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Report Message: 60 bytes ------------------------------------------ */

/* QuoteReportMessage */
typedef QuoteReportMessage {
  byte originator_user_id[20];
  byte side_optional;
  byte symbol[4];
  byte rfq_req_id[8];
  byte rfq_system_id[8];
  byte transact_time[8];
  byte order_qty_optional[8];
  byte quote_ack_status[2];
  byte quote_reject_reason
};

int quote_report_message_at;

/* every byte of Quote Report Message set to one value */
inline fill_quote_report_message(quote_report_message_record, quote_report_message_value) {
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 20 -> quote_report_message_record.originator_user_id[quote_report_message_at] = quote_report_message_value; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_record.side_optional = quote_report_message_value;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 4 -> quote_report_message_record.symbol[quote_report_message_at] = quote_report_message_value; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.rfq_req_id[quote_report_message_at] = quote_report_message_value; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.rfq_system_id[quote_report_message_at] = quote_report_message_value; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.transact_time[quote_report_message_at] = quote_report_message_value; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.order_qty_optional[quote_report_message_at] = quote_report_message_value; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 2 -> quote_report_message_record.quote_ack_status[quote_report_message_at] = quote_report_message_value; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_record.quote_reject_reason = quote_report_message_value;
  skip
}

/* each byte of Quote Report Message set to where it lies, so a field read out of place says so */
inline ramp_quote_report_message(quote_report_message_record, quote_report_message_base) {
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 20 -> quote_report_message_record.originator_user_id[quote_report_message_at] = (quote_report_message_base + 0 + quote_report_message_at + 1) % 256; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_record.side_optional = (quote_report_message_base + 20 + 1) % 256;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 4 -> quote_report_message_record.symbol[quote_report_message_at] = (quote_report_message_base + 21 + quote_report_message_at + 1) % 256; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.rfq_req_id[quote_report_message_at] = (quote_report_message_base + 25 + quote_report_message_at + 1) % 256; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.rfq_system_id[quote_report_message_at] = (quote_report_message_base + 33 + quote_report_message_at + 1) % 256; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.transact_time[quote_report_message_at] = (quote_report_message_base + 41 + quote_report_message_at + 1) % 256; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.order_qty_optional[quote_report_message_at] = (quote_report_message_base + 49 + quote_report_message_at + 1) % 256; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 2 -> quote_report_message_record.quote_ack_status[quote_report_message_at] = (quote_report_message_base + 57 + quote_report_message_at + 1) % 256; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_record.quote_reject_reason = (quote_report_message_base + 59 + 1) % 256;
  skip
}

/* Quote Report Message to the wire, 60 bytes from where the cursor stands */
inline encode_quote_report_message(quote_report_message_record) {
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 20 -> wire[at] = quote_report_message_record.originator_user_id[quote_report_message_at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_report_message_record.side_optional; at = at + 1;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 4 -> wire[at] = quote_report_message_record.symbol[quote_report_message_at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> wire[at] = quote_report_message_record.rfq_req_id[quote_report_message_at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> wire[at] = quote_report_message_record.rfq_system_id[quote_report_message_at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> wire[at] = quote_report_message_record.transact_time[quote_report_message_at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> wire[at] = quote_report_message_record.order_qty_optional[quote_report_message_at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 2 -> wire[at] = quote_report_message_record.quote_ack_status[quote_report_message_at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_report_message_record.quote_reject_reason; at = at + 1;
  skip
}

/* Quote Report Message off the wire, 60 bytes from where the cursor stands */
inline decode_quote_report_message(quote_report_message_record) {
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 20 -> quote_report_message_record.originator_user_id[quote_report_message_at] = wire[at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_record.side_optional = wire[at]; at = at + 1;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 4 -> quote_report_message_record.symbol[quote_report_message_at] = wire[at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.rfq_req_id[quote_report_message_at] = wire[at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.rfq_system_id[quote_report_message_at] = wire[at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.transact_time[quote_report_message_at] = wire[at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> quote_report_message_record.order_qty_optional[quote_report_message_at] = wire[at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 2 -> quote_report_message_record.quote_ack_status[quote_report_message_at] = wire[at]; at = at + 1; quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_record.quote_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Report Message is what was written, byte for byte */
inline equal_quote_report_message(quote_report_message_read, quote_report_message_written) {
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 20 -> assert(quote_report_message_read.originator_user_id[quote_report_message_at] == quote_report_message_written.originator_user_id[quote_report_message_at]); quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  assert(quote_report_message_read.side_optional == quote_report_message_written.side_optional);
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 4 -> assert(quote_report_message_read.symbol[quote_report_message_at] == quote_report_message_written.symbol[quote_report_message_at]); quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> assert(quote_report_message_read.rfq_req_id[quote_report_message_at] == quote_report_message_written.rfq_req_id[quote_report_message_at]); quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> assert(quote_report_message_read.rfq_system_id[quote_report_message_at] == quote_report_message_written.rfq_system_id[quote_report_message_at]); quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> assert(quote_report_message_read.transact_time[quote_report_message_at] == quote_report_message_written.transact_time[quote_report_message_at]); quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 8 -> assert(quote_report_message_read.order_qty_optional[quote_report_message_at] == quote_report_message_written.order_qty_optional[quote_report_message_at]); quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  quote_report_message_at = 0;
  do
  :: quote_report_message_at < 2 -> assert(quote_report_message_read.quote_ack_status[quote_report_message_at] == quote_report_message_written.quote_ack_status[quote_report_message_at]); quote_report_message_at = quote_report_message_at + 1
  :: else -> break
  od;
  assert(quote_report_message_read.quote_reject_reason == quote_report_message_written.quote_reject_reason);
  skip
}

/* ---- New Order Cross Report Message: 145 bytes ------------------------------- */

/* NewOrderCrossReportMessage */
typedef NewOrderCrossReportMessage {
  byte originator_user_id[20];
  byte symbol[4];
  byte cross_id[8];
  byte transact_time[8];
  byte rfc_status;
  byte exchange_code[4];
  byte text[100]
};

int new_order_cross_report_message_at;

/* every byte of New Order Cross Report Message set to one value */
inline fill_new_order_cross_report_message(new_order_cross_report_message_record, new_order_cross_report_message_value) {
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 20 -> new_order_cross_report_message_record.originator_user_id[new_order_cross_report_message_at] = new_order_cross_report_message_value; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> new_order_cross_report_message_record.symbol[new_order_cross_report_message_at] = new_order_cross_report_message_value; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> new_order_cross_report_message_record.cross_id[new_order_cross_report_message_at] = new_order_cross_report_message_value; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> new_order_cross_report_message_record.transact_time[new_order_cross_report_message_at] = new_order_cross_report_message_value; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_record.rfc_status = new_order_cross_report_message_value;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> new_order_cross_report_message_record.exchange_code[new_order_cross_report_message_at] = new_order_cross_report_message_value; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 100 -> new_order_cross_report_message_record.text[new_order_cross_report_message_at] = new_order_cross_report_message_value; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Cross Report Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_cross_report_message(new_order_cross_report_message_record, new_order_cross_report_message_base) {
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 20 -> new_order_cross_report_message_record.originator_user_id[new_order_cross_report_message_at] = (new_order_cross_report_message_base + 0 + new_order_cross_report_message_at + 1) % 256; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> new_order_cross_report_message_record.symbol[new_order_cross_report_message_at] = (new_order_cross_report_message_base + 20 + new_order_cross_report_message_at + 1) % 256; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> new_order_cross_report_message_record.cross_id[new_order_cross_report_message_at] = (new_order_cross_report_message_base + 24 + new_order_cross_report_message_at + 1) % 256; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> new_order_cross_report_message_record.transact_time[new_order_cross_report_message_at] = (new_order_cross_report_message_base + 32 + new_order_cross_report_message_at + 1) % 256; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_record.rfc_status = (new_order_cross_report_message_base + 40 + 1) % 256;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> new_order_cross_report_message_record.exchange_code[new_order_cross_report_message_at] = (new_order_cross_report_message_base + 41 + new_order_cross_report_message_at + 1) % 256; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 100 -> new_order_cross_report_message_record.text[new_order_cross_report_message_at] = (new_order_cross_report_message_base + 45 + new_order_cross_report_message_at + 1) % 256; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Cross Report Message to the wire, 145 bytes from where the cursor stands */
inline encode_new_order_cross_report_message(new_order_cross_report_message_record) {
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 20 -> wire[at] = new_order_cross_report_message_record.originator_user_id[new_order_cross_report_message_at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> wire[at] = new_order_cross_report_message_record.symbol[new_order_cross_report_message_at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> wire[at] = new_order_cross_report_message_record.cross_id[new_order_cross_report_message_at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> wire[at] = new_order_cross_report_message_record.transact_time[new_order_cross_report_message_at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_cross_report_message_record.rfc_status; at = at + 1;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> wire[at] = new_order_cross_report_message_record.exchange_code[new_order_cross_report_message_at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 100 -> wire[at] = new_order_cross_report_message_record.text[new_order_cross_report_message_at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Cross Report Message off the wire, 145 bytes from where the cursor stands */
inline decode_new_order_cross_report_message(new_order_cross_report_message_record) {
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 20 -> new_order_cross_report_message_record.originator_user_id[new_order_cross_report_message_at] = wire[at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> new_order_cross_report_message_record.symbol[new_order_cross_report_message_at] = wire[at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> new_order_cross_report_message_record.cross_id[new_order_cross_report_message_at] = wire[at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> new_order_cross_report_message_record.transact_time[new_order_cross_report_message_at] = wire[at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_record.rfc_status = wire[at]; at = at + 1;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> new_order_cross_report_message_record.exchange_code[new_order_cross_report_message_at] = wire[at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 100 -> new_order_cross_report_message_record.text[new_order_cross_report_message_at] = wire[at]; at = at + 1; new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Cross Report Message is what was written, byte for byte */
inline equal_new_order_cross_report_message(new_order_cross_report_message_read, new_order_cross_report_message_written) {
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 20 -> assert(new_order_cross_report_message_read.originator_user_id[new_order_cross_report_message_at] == new_order_cross_report_message_written.originator_user_id[new_order_cross_report_message_at]); new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> assert(new_order_cross_report_message_read.symbol[new_order_cross_report_message_at] == new_order_cross_report_message_written.symbol[new_order_cross_report_message_at]); new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> assert(new_order_cross_report_message_read.cross_id[new_order_cross_report_message_at] == new_order_cross_report_message_written.cross_id[new_order_cross_report_message_at]); new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 8 -> assert(new_order_cross_report_message_read.transact_time[new_order_cross_report_message_at] == new_order_cross_report_message_written.transact_time[new_order_cross_report_message_at]); new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  assert(new_order_cross_report_message_read.rfc_status == new_order_cross_report_message_written.rfc_status);
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 4 -> assert(new_order_cross_report_message_read.exchange_code[new_order_cross_report_message_at] == new_order_cross_report_message_written.exchange_code[new_order_cross_report_message_at]); new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  new_order_cross_report_message_at = 0;
  do
  :: new_order_cross_report_message_at < 100 -> assert(new_order_cross_report_message_read.text[new_order_cross_report_message_at] == new_order_cross_report_message_written.text[new_order_cross_report_message_at]); new_order_cross_report_message_at = new_order_cross_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel Report Message: 151 bytes ----------------------------- */

/* OrderMassCancelReportMessage */
typedef OrderMassCancelReportMessage {
  byte originator_user_id[20];
  byte symbol_optional[4];
  byte cl_ord_id[8];
  byte transact_time[8];
  byte market_type_i_d_optional[4];
  byte mass_cancel_request_type;
  byte mass_cancel_response;
  byte mass_cancel_reject_reason;
  byte exchange_code[4];
  byte text[100]
};

int order_mass_cancel_report_message_at;

/* every byte of Order Mass Cancel Report Message set to one value */
inline fill_order_mass_cancel_report_message(order_mass_cancel_report_message_record, order_mass_cancel_report_message_value) {
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.originator_user_id[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.symbol_optional[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> order_mass_cancel_report_message_record.cl_ord_id[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> order_mass_cancel_report_message_record.transact_time[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.market_type_i_d_optional[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_request_type = order_mass_cancel_report_message_value;
  order_mass_cancel_report_message_record.mass_cancel_response = order_mass_cancel_report_message_value;
  order_mass_cancel_report_message_record.mass_cancel_reject_reason = order_mass_cancel_report_message_value;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.exchange_code[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 100 -> order_mass_cancel_report_message_record.text[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Cancel Report Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel_report_message(order_mass_cancel_report_message_record, order_mass_cancel_report_message_base) {
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.originator_user_id[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 0 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.symbol_optional[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 20 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> order_mass_cancel_report_message_record.cl_ord_id[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 24 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> order_mass_cancel_report_message_record.transact_time[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 32 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.market_type_i_d_optional[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 40 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_request_type = (order_mass_cancel_report_message_base + 44 + 1) % 256;
  order_mass_cancel_report_message_record.mass_cancel_response = (order_mass_cancel_report_message_base + 45 + 1) % 256;
  order_mass_cancel_report_message_record.mass_cancel_reject_reason = (order_mass_cancel_report_message_base + 46 + 1) % 256;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.exchange_code[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 47 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 100 -> order_mass_cancel_report_message_record.text[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 51 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Report Message to the wire, 151 bytes from where the cursor stands */
inline encode_order_mass_cancel_report_message(order_mass_cancel_report_message_record) {
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> wire[at] = order_mass_cancel_report_message_record.originator_user_id[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.symbol_optional[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> wire[at] = order_mass_cancel_report_message_record.cl_ord_id[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> wire[at] = order_mass_cancel_report_message_record.transact_time[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.market_type_i_d_optional[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_cancel_report_message_record.mass_cancel_request_type; at = at + 1;
  wire[at] = order_mass_cancel_report_message_record.mass_cancel_response; at = at + 1;
  wire[at] = order_mass_cancel_report_message_record.mass_cancel_reject_reason; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.exchange_code[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 100 -> wire[at] = order_mass_cancel_report_message_record.text[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Report Message off the wire, 151 bytes from where the cursor stands */
inline decode_order_mass_cancel_report_message(order_mass_cancel_report_message_record) {
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.originator_user_id[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.symbol_optional[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> order_mass_cancel_report_message_record.cl_ord_id[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> order_mass_cancel_report_message_record.transact_time[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.market_type_i_d_optional[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_request_type = wire[at]; at = at + 1;
  order_mass_cancel_report_message_record.mass_cancel_response = wire[at]; at = at + 1;
  order_mass_cancel_report_message_record.mass_cancel_reject_reason = wire[at]; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.exchange_code[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 100 -> order_mass_cancel_report_message_record.text[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Cancel Report Message is what was written, byte for byte */
inline equal_order_mass_cancel_report_message(order_mass_cancel_report_message_read, order_mass_cancel_report_message_written) {
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> assert(order_mass_cancel_report_message_read.originator_user_id[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.originator_user_id[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.symbol_optional[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.symbol_optional[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> assert(order_mass_cancel_report_message_read.cl_ord_id[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.cl_ord_id[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 8 -> assert(order_mass_cancel_report_message_read.transact_time[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.transact_time[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.market_type_i_d_optional[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.market_type_i_d_optional[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  assert(order_mass_cancel_report_message_read.mass_cancel_request_type == order_mass_cancel_report_message_written.mass_cancel_request_type);
  assert(order_mass_cancel_report_message_read.mass_cancel_response == order_mass_cancel_report_message_written.mass_cancel_response);
  assert(order_mass_cancel_report_message_read.mass_cancel_reject_reason == order_mass_cancel_report_message_written.mass_cancel_reject_reason);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.exchange_code[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.exchange_code[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 100 -> assert(order_mass_cancel_report_message_read.text[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.text[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Resend Request Message: 8 bytes ----------------------------------------- */

/* ResendRequestMessage */
typedef ResendRequestMessage {
  byte begin_seq_no[4];
  byte end_seq_no[4]
};

int resend_request_message_at;

/* every byte of Resend Request Message set to one value */
inline fill_resend_request_message(resend_request_message_record, resend_request_message_value) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.begin_seq_no[resend_request_message_at] = resend_request_message_value; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.end_seq_no[resend_request_message_at] = resend_request_message_value; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Resend Request Message set to where it lies, so a field read out of place says so */
inline ramp_resend_request_message(resend_request_message_record, resend_request_message_base) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.begin_seq_no[resend_request_message_at] = (resend_request_message_base + 0 + resend_request_message_at + 1) % 256; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.end_seq_no[resend_request_message_at] = (resend_request_message_base + 4 + resend_request_message_at + 1) % 256; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_resend_request_message(resend_request_message_record) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> wire[at] = resend_request_message_record.begin_seq_no[resend_request_message_at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> wire[at] = resend_request_message_record.end_seq_no[resend_request_message_at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_resend_request_message(resend_request_message_record) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.begin_seq_no[resend_request_message_at] = wire[at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> resend_request_message_record.end_seq_no[resend_request_message_at] = wire[at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Resend Request Message is what was written, byte for byte */
inline equal_resend_request_message(resend_request_message_read, resend_request_message_written) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> assert(resend_request_message_read.begin_seq_no[resend_request_message_at] == resend_request_message_written.begin_seq_no[resend_request_message_at]); resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 4 -> assert(resend_request_message_read.end_seq_no[resend_request_message_at] == resend_request_message_written.end_seq_no[resend_request_message_at]); resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Resend Report Message: 113 bytes ---------------------------------------- */

/* ResendReportMessage */
typedef ResendReportMessage {
  byte begin_seq_no[4];
  byte end_seq_no[4];
  byte status;
  byte exchange_code[4];
  byte text[100]
};

int resend_report_message_at;

/* every byte of Resend Report Message set to one value */
inline fill_resend_report_message(resend_report_message_record, resend_report_message_value) {
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.begin_seq_no[resend_report_message_at] = resend_report_message_value; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.end_seq_no[resend_report_message_at] = resend_report_message_value; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_record.status = resend_report_message_value;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.exchange_code[resend_report_message_at] = resend_report_message_value; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 100 -> resend_report_message_record.text[resend_report_message_at] = resend_report_message_value; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Resend Report Message set to where it lies, so a field read out of place says so */
inline ramp_resend_report_message(resend_report_message_record, resend_report_message_base) {
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.begin_seq_no[resend_report_message_at] = (resend_report_message_base + 0 + resend_report_message_at + 1) % 256; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.end_seq_no[resend_report_message_at] = (resend_report_message_base + 4 + resend_report_message_at + 1) % 256; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_record.status = (resend_report_message_base + 8 + 1) % 256;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.exchange_code[resend_report_message_at] = (resend_report_message_base + 9 + resend_report_message_at + 1) % 256; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 100 -> resend_report_message_record.text[resend_report_message_at] = (resend_report_message_base + 13 + resend_report_message_at + 1) % 256; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Report Message to the wire, 113 bytes from where the cursor stands */
inline encode_resend_report_message(resend_report_message_record) {
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> wire[at] = resend_report_message_record.begin_seq_no[resend_report_message_at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> wire[at] = resend_report_message_record.end_seq_no[resend_report_message_at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  wire[at] = resend_report_message_record.status; at = at + 1;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> wire[at] = resend_report_message_record.exchange_code[resend_report_message_at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 100 -> wire[at] = resend_report_message_record.text[resend_report_message_at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Report Message off the wire, 113 bytes from where the cursor stands */
inline decode_resend_report_message(resend_report_message_record) {
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.begin_seq_no[resend_report_message_at] = wire[at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.end_seq_no[resend_report_message_at] = wire[at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_record.status = wire[at]; at = at + 1;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> resend_report_message_record.exchange_code[resend_report_message_at] = wire[at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 100 -> resend_report_message_record.text[resend_report_message_at] = wire[at]; at = at + 1; resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Resend Report Message is what was written, byte for byte */
inline equal_resend_report_message(resend_report_message_read, resend_report_message_written) {
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> assert(resend_report_message_read.begin_seq_no[resend_report_message_at] == resend_report_message_written.begin_seq_no[resend_report_message_at]); resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> assert(resend_report_message_read.end_seq_no[resend_report_message_at] == resend_report_message_written.end_seq_no[resend_report_message_at]); resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  assert(resend_report_message_read.status == resend_report_message_written.status);
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 4 -> assert(resend_report_message_read.exchange_code[resend_report_message_at] == resend_report_message_written.exchange_code[resend_report_message_at]); resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  resend_report_message_at = 0;
  do
  :: resend_report_message_at < 100 -> assert(resend_report_message_read.text[resend_report_message_at] == resend_report_message_written.text[resend_report_message_at]); resend_report_message_at = resend_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset Message: 5 bytes ----------------------------------------- */

/* SequenceResetMessage */
typedef SequenceResetMessage {
  byte new_seq_no[4];
  byte gap_fill_flag
};

int sequence_reset_message_at;

/* every byte of Sequence Reset Message set to one value */
inline fill_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_value) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = sequence_reset_message_value; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  sequence_reset_message_record.gap_fill_flag = sequence_reset_message_value;
  skip
}

/* each byte of Sequence Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_base) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = (sequence_reset_message_base + 0 + sequence_reset_message_at + 1) % 256; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  sequence_reset_message_record.gap_fill_flag = (sequence_reset_message_base + 4 + 1) % 256;
  skip
}

/* Sequence Reset Message to the wire, 5 bytes from where the cursor stands */
inline encode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> wire[at] = sequence_reset_message_record.new_seq_no[sequence_reset_message_at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  wire[at] = sequence_reset_message_record.gap_fill_flag; at = at + 1;
  skip
}

/* Sequence Reset Message off the wire, 5 bytes from where the cursor stands */
inline decode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = wire[at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  sequence_reset_message_record.gap_fill_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequence Reset Message is what was written, byte for byte */
inline equal_sequence_reset_message(sequence_reset_message_read, sequence_reset_message_written) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> assert(sequence_reset_message_read.new_seq_no[sequence_reset_message_at] == sequence_reset_message_written.new_seq_no[sequence_reset_message_at]); sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  assert(sequence_reset_message_read.gap_fill_flag == sequence_reset_message_written.gap_fill_flag);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Simple Open Framing Header: encoded, read back, and compared */
proctype check_simple_open_framing_header() {
  SimpleOpenFramingHeader simple_open_framing_header_sent;
  SimpleOpenFramingHeader simple_open_framing_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_open_framing_header(simple_open_framing_header_sent, 0)
  :: pattern == 1 -> fill_simple_open_framing_header(simple_open_framing_header_sent, 32)
  :: pattern == 2 -> fill_simple_open_framing_header(simple_open_framing_header_sent, 255)
  :: else -> ramp_simple_open_framing_header(simple_open_framing_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_open_framing_header(simple_open_framing_header_sent);
    assert(at == 4);
    at = 0;
    decode_simple_open_framing_header(simple_open_framing_header_got);
    assert(at == 4);
    equal_simple_open_framing_header(simple_open_framing_header_got, simple_open_framing_header_sent)
  }
}

/* Framing Header: encoded, read back, and compared */
proctype check_framing_header() {
  FramingHeader framing_header_sent;
  FramingHeader framing_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_framing_header(framing_header_sent, 0)
  :: pattern == 1 -> fill_framing_header(framing_header_sent, 32)
  :: pattern == 2 -> fill_framing_header(framing_header_sent, 255)
  :: else -> ramp_framing_header(framing_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_framing_header(framing_header_sent);
    assert(at == 4);
    at = 0;
    decode_framing_header(framing_header_got);
    assert(at == 4);
    equal_framing_header(framing_header_got, framing_header_sent)
  }
}

/* Simple Open Framing Header Message: encoded, read back, and compared */
proctype check_simple_open_framing_header_message() {
  SimpleOpenFramingHeaderMessage simple_open_framing_header_message_sent;
  SimpleOpenFramingHeaderMessage simple_open_framing_header_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_open_framing_header_message(simple_open_framing_header_message_sent, 0)
  :: pattern == 1 -> fill_simple_open_framing_header_message(simple_open_framing_header_message_sent, 32)
  :: pattern == 2 -> fill_simple_open_framing_header_message(simple_open_framing_header_message_sent, 255)
  :: else -> ramp_simple_open_framing_header_message(simple_open_framing_header_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_open_framing_header_message(simple_open_framing_header_message_sent);
    assert(at == 4);
    at = 0;
    decode_simple_open_framing_header_message(simple_open_framing_header_message_got);
    assert(at == 4);
    equal_simple_open_framing_header_message(simple_open_framing_header_message_got, simple_open_framing_header_message_sent)
  }
}

/* Logon Request Message: encoded, read back, and compared */
proctype check_logon_request_message() {
  LogonRequestMessage logon_request_message_sent;
  LogonRequestMessage logon_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_request_message(logon_request_message_sent, 0)
  :: pattern == 1 -> fill_logon_request_message(logon_request_message_sent, 32)
  :: pattern == 2 -> fill_logon_request_message(logon_request_message_sent, 255)
  :: else -> ramp_logon_request_message(logon_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_request_message(logon_request_message_sent);
    assert(at == 236);
    at = 0;
    decode_logon_request_message(logon_request_message_got);
    assert(at == 236);
    equal_logon_request_message(logon_request_message_got, logon_request_message_sent)
  }
}

/* Logon Report Message: encoded, read back, and compared */
proctype check_logon_report_message() {
  LogonReportMessage logon_report_message_sent;
  LogonReportMessage logon_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_report_message(logon_report_message_sent, 0)
  :: pattern == 1 -> fill_logon_report_message(logon_report_message_sent, 32)
  :: pattern == 2 -> fill_logon_report_message(logon_report_message_sent, 255)
  :: else -> ramp_logon_report_message(logon_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_report_message(logon_report_message_sent);
    assert(at == 127);
    at = 0;
    decode_logon_report_message(logon_report_message_got);
    assert(at == 127);
    equal_logon_report_message(logon_report_message_got, logon_report_message_sent)
  }
}

/* Logout Request Message: encoded, read back, and compared */
proctype check_logout_request_message() {
  LogoutRequestMessage logout_request_message_sent;
  LogoutRequestMessage logout_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_request_message(logout_request_message_sent, 0)
  :: pattern == 1 -> fill_logout_request_message(logout_request_message_sent, 32)
  :: pattern == 2 -> fill_logout_request_message(logout_request_message_sent, 255)
  :: else -> ramp_logout_request_message(logout_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_request_message(logout_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_logout_request_message(logout_request_message_got);
    assert(at == 20);
    equal_logout_request_message(logout_request_message_got, logout_request_message_sent)
  }
}

/* Logout Report Message: encoded, read back, and compared */
proctype check_logout_report_message() {
  LogoutReportMessage logout_report_message_sent;
  LogoutReportMessage logout_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_report_message(logout_report_message_sent, 0)
  :: pattern == 1 -> fill_logout_report_message(logout_report_message_sent, 32)
  :: pattern == 2 -> fill_logout_report_message(logout_report_message_sent, 255)
  :: else -> ramp_logout_report_message(logout_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_report_message(logout_report_message_sent);
    assert(at == 124);
    at = 0;
    decode_logout_report_message(logout_report_message_got);
    assert(at == 124);
    equal_logout_report_message(logout_report_message_got, logout_report_message_sent)
  }
}

/* Error Message: encoded, read back, and compared */
proctype check_error_message() {
  ErrorMessage error_message_sent;
  ErrorMessage error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_error_message(error_message_sent, 0)
  :: pattern == 1 -> fill_error_message(error_message_sent, 32)
  :: pattern == 2 -> fill_error_message(error_message_sent, 255)
  :: else -> ramp_error_message(error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_error_message(error_message_sent);
    assert(at == 129);
    at = 0;
    decode_error_message(error_message_got);
    assert(at == 129);
    equal_error_message(error_message_got, error_message_sent)
  }
}

/* Group Size Encoding: encoded, read back, and compared */
proctype check_group_size_encoding() {
  GroupSizeEncoding group_size_encoding_sent;
  GroupSizeEncoding group_size_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size_encoding(group_size_encoding_sent, 0)
  :: pattern == 1 -> fill_group_size_encoding(group_size_encoding_sent, 32)
  :: pattern == 2 -> fill_group_size_encoding(group_size_encoding_sent, 255)
  :: else -> ramp_group_size_encoding(group_size_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size_encoding(group_size_encoding_sent);
    assert(at == 4);
    at = 0;
    decode_group_size_encoding(group_size_encoding_got);
    assert(at == 4);
    equal_group_size_encoding(group_size_encoding_got, group_size_encoding_sent)
  }
}

/* Security Definition Reject Message: encoded, read back, and compared */
proctype check_security_definition_reject_message() {
  SecurityDefinitionRejectMessage security_definition_reject_message_sent;
  SecurityDefinitionRejectMessage security_definition_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_reject_message(security_definition_reject_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_reject_message(security_definition_reject_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_reject_message(security_definition_reject_message_sent, 255)
  :: else -> ramp_security_definition_reject_message(security_definition_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_reject_message(security_definition_reject_message_sent);
    assert(at == 115);
    at = 0;
    decode_security_definition_reject_message(security_definition_reject_message_got);
    assert(at == 115);
    equal_security_definition_reject_message(security_definition_reject_message_got, security_definition_reject_message_sent)
  }
}

/* Security Definition Request Message: encoded, read back, and compared */
proctype check_security_definition_request_message() {
  SecurityDefinitionRequestMessage security_definition_request_message_sent;
  SecurityDefinitionRequestMessage security_definition_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_request_message(security_definition_request_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_request_message(security_definition_request_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_request_message(security_definition_request_message_sent, 255)
  :: else -> ramp_security_definition_request_message(security_definition_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_request_message(security_definition_request_message_sent);
    assert(at == 9);
    at = 0;
    decode_security_definition_request_message(security_definition_request_message_got);
    assert(at == 9);
    equal_security_definition_request_message(security_definition_request_message_got, security_definition_request_message_sent)
  }
}

/* Trader Logon Request Message: encoded, read back, and compared */
proctype check_trader_logon_request_message() {
  TraderLogonRequestMessage trader_logon_request_message_sent;
  TraderLogonRequestMessage trader_logon_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trader_logon_request_message(trader_logon_request_message_sent, 0)
  :: pattern == 1 -> fill_trader_logon_request_message(trader_logon_request_message_sent, 32)
  :: pattern == 2 -> fill_trader_logon_request_message(trader_logon_request_message_sent, 255)
  :: else -> ramp_trader_logon_request_message(trader_logon_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trader_logon_request_message(trader_logon_request_message_sent);
    assert(at == 106);
    at = 0;
    decode_trader_logon_request_message(trader_logon_request_message_got);
    assert(at == 106);
    equal_trader_logon_request_message(trader_logon_request_message_got, trader_logon_request_message_sent)
  }
}

/* Trader Logon Report Message: encoded, read back, and compared */
proctype check_trader_logon_report_message() {
  TraderLogonReportMessage trader_logon_report_message_sent;
  TraderLogonReportMessage trader_logon_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trader_logon_report_message(trader_logon_report_message_sent, 0)
  :: pattern == 1 -> fill_trader_logon_report_message(trader_logon_report_message_sent, 32)
  :: pattern == 2 -> fill_trader_logon_report_message(trader_logon_report_message_sent, 255)
  :: else -> ramp_trader_logon_report_message(trader_logon_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trader_logon_report_message(trader_logon_report_message_sent);
    assert(at == 128);
    at = 0;
    decode_trader_logon_report_message(trader_logon_report_message_got);
    assert(at == 128);
    equal_trader_logon_report_message(trader_logon_report_message_got, trader_logon_report_message_sent)
  }
}

/* Trader Logout Request Message: encoded, read back, and compared */
proctype check_trader_logout_request_message() {
  TraderLogoutRequestMessage trader_logout_request_message_sent;
  TraderLogoutRequestMessage trader_logout_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trader_logout_request_message(trader_logout_request_message_sent, 0)
  :: pattern == 1 -> fill_trader_logout_request_message(trader_logout_request_message_sent, 32)
  :: pattern == 2 -> fill_trader_logout_request_message(trader_logout_request_message_sent, 255)
  :: else -> ramp_trader_logout_request_message(trader_logout_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trader_logout_request_message(trader_logout_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_trader_logout_request_message(trader_logout_request_message_got);
    assert(at == 20);
    equal_trader_logout_request_message(trader_logout_request_message_got, trader_logout_request_message_sent)
  }
}

/* Trader Logout Report Message: encoded, read back, and compared */
proctype check_trader_logout_report_message() {
  TraderLogoutReportMessage trader_logout_report_message_sent;
  TraderLogoutReportMessage trader_logout_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trader_logout_report_message(trader_logout_report_message_sent, 0)
  :: pattern == 1 -> fill_trader_logout_report_message(trader_logout_report_message_sent, 32)
  :: pattern == 2 -> fill_trader_logout_report_message(trader_logout_report_message_sent, 255)
  :: else -> ramp_trader_logout_report_message(trader_logout_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trader_logout_report_message(trader_logout_report_message_sent);
    assert(at == 124);
    at = 0;
    decode_trader_logout_report_message(trader_logout_report_message_got);
    assert(at == 124);
    equal_trader_logout_report_message(trader_logout_report_message_got, trader_logout_report_message_sent)
  }
}

/* New Order Request Message: encoded, read back, and compared */
proctype check_new_order_request_message() {
  NewOrderRequestMessage new_order_request_message_sent;
  NewOrderRequestMessage new_order_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_request_message(new_order_request_message_sent, 0)
  :: pattern == 1 -> fill_new_order_request_message(new_order_request_message_sent, 32)
  :: pattern == 2 -> fill_new_order_request_message(new_order_request_message_sent, 255)
  :: else -> ramp_new_order_request_message(new_order_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_request_message(new_order_request_message_sent);
    assert(at == 327);
    at = 0;
    decode_new_order_request_message(new_order_request_message_got);
    assert(at == 327);
    equal_new_order_request_message(new_order_request_message_got, new_order_request_message_sent)
  }
}

/* Cancel Replace Request Message: encoded, read back, and compared */
proctype check_cancel_replace_request_message() {
  CancelReplaceRequestMessage cancel_replace_request_message_sent;
  CancelReplaceRequestMessage cancel_replace_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_replace_request_message(cancel_replace_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_replace_request_message(cancel_replace_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_replace_request_message(cancel_replace_request_message_sent, 255)
  :: else -> ramp_cancel_replace_request_message(cancel_replace_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_replace_request_message(cancel_replace_request_message_sent);
    assert(at == 333);
    at = 0;
    decode_cancel_replace_request_message(cancel_replace_request_message_got);
    assert(at == 333);
    equal_cancel_replace_request_message(cancel_replace_request_message_got, cancel_replace_request_message_sent)
  }
}

/* Cancel Request Message: encoded, read back, and compared */
proctype check_cancel_request_message() {
  CancelRequestMessage cancel_request_message_sent;
  CancelRequestMessage cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_request_message(cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_request_message(cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_request_message(cancel_request_message_sent, 255)
  :: else -> ramp_cancel_request_message(cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_request_message(cancel_request_message_sent);
    assert(at == 41);
    at = 0;
    decode_cancel_request_message(cancel_request_message_got);
    assert(at == 41);
    equal_cancel_request_message(cancel_request_message_got, cancel_request_message_sent)
  }
}

/* Quote Request Message: encoded, read back, and compared */
proctype check_quote_request_message() {
  QuoteRequestMessage quote_request_message_sent;
  QuoteRequestMessage quote_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request_message(quote_request_message_sent, 0)
  :: pattern == 1 -> fill_quote_request_message(quote_request_message_sent, 32)
  :: pattern == 2 -> fill_quote_request_message(quote_request_message_sent, 255)
  :: else -> ramp_quote_request_message(quote_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request_message(quote_request_message_sent);
    assert(at == 182);
    at = 0;
    decode_quote_request_message(quote_request_message_got);
    assert(at == 182);
    equal_quote_request_message(quote_request_message_got, quote_request_message_sent)
  }
}

/* Order Mass Cancel Request Message: encoded, read back, and compared */
proctype check_order_mass_cancel_request_message() {
  OrderMassCancelRequestMessage order_mass_cancel_request_message_sent;
  OrderMassCancelRequestMessage order_mass_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 255)
  :: else -> ramp_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_cancel_request_message(order_mass_cancel_request_message_sent);
    assert(at == 89);
    at = 0;
    decode_order_mass_cancel_request_message(order_mass_cancel_request_message_got);
    assert(at == 89);
    equal_order_mass_cancel_request_message(order_mass_cancel_request_message_got, order_mass_cancel_request_message_sent)
  }
}

/* Security Definition Request Create Flex Message: encoded, read back, and compared */
proctype check_security_definition_request_create_flex_message() {
  SecurityDefinitionRequestCreateFlexMessage security_definition_request_create_flex_message_sent;
  SecurityDefinitionRequestCreateFlexMessage security_definition_request_create_flex_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_request_create_flex_message(security_definition_request_create_flex_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_request_create_flex_message(security_definition_request_create_flex_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_request_create_flex_message(security_definition_request_create_flex_message_sent, 255)
  :: else -> ramp_security_definition_request_create_flex_message(security_definition_request_create_flex_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_request_create_flex_message(security_definition_request_create_flex_message_sent);
    assert(at == 28);
    at = 0;
    decode_security_definition_request_create_flex_message(security_definition_request_create_flex_message_got);
    assert(at == 28);
    equal_security_definition_request_create_flex_message(security_definition_request_create_flex_message_got, security_definition_request_create_flex_message_sent)
  }
}

/* Exec I D order Exec Id: encoded, read back, and compared */
proctype check_exec_i_d_order_exec_id() {
  ExecIDOrderExecId exec_i_d_order_exec_id_sent;
  ExecIDOrderExecId exec_i_d_order_exec_id_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_exec_i_d_order_exec_id(exec_i_d_order_exec_id_sent, 0)
  :: pattern == 1 -> fill_exec_i_d_order_exec_id(exec_i_d_order_exec_id_sent, 32)
  :: pattern == 2 -> fill_exec_i_d_order_exec_id(exec_i_d_order_exec_id_sent, 255)
  :: else -> ramp_exec_i_d_order_exec_id(exec_i_d_order_exec_id_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_exec_i_d_order_exec_id(exec_i_d_order_exec_id_sent);
    assert(at == 20);
    at = 0;
    decode_exec_i_d_order_exec_id(exec_i_d_order_exec_id_got);
    assert(at == 20);
    equal_exec_i_d_order_exec_id(exec_i_d_order_exec_id_got, exec_i_d_order_exec_id_sent)
  }
}

/* Orig Order Id: encoded, read back, and compared */
proctype check_orig_order_id() {
  OrigOrderId orig_order_id_sent;
  OrigOrderId orig_order_id_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orig_order_id(orig_order_id_sent, 0)
  :: pattern == 1 -> fill_orig_order_id(orig_order_id_sent, 32)
  :: pattern == 2 -> fill_orig_order_id(orig_order_id_sent, 255)
  :: else -> ramp_orig_order_id(orig_order_id_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orig_order_id(orig_order_id_sent);
    assert(at == 16);
    at = 0;
    decode_orig_order_id(orig_order_id_got);
    assert(at == 16);
    equal_orig_order_id(orig_order_id_got, orig_order_id_sent)
  }
}

/* Execution Report New Message: encoded, read back, and compared */
proctype check_execution_report_new_message() {
  ExecutionReportNewMessage execution_report_new_message_sent;
  ExecutionReportNewMessage execution_report_new_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_new_message(execution_report_new_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_new_message(execution_report_new_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_new_message(execution_report_new_message_sent, 255)
  :: else -> ramp_execution_report_new_message(execution_report_new_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_new_message(execution_report_new_message_sent);
    assert(at == 133);
    at = 0;
    decode_execution_report_new_message(execution_report_new_message_got);
    assert(at == 133);
    equal_execution_report_new_message(execution_report_new_message_got, execution_report_new_message_sent)
  }
}

/* Execution Report Cancel Message: encoded, read back, and compared */
proctype check_execution_report_cancel_message() {
  ExecutionReportCancelMessage execution_report_cancel_message_sent;
  ExecutionReportCancelMessage execution_report_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_cancel_message(execution_report_cancel_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_cancel_message(execution_report_cancel_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_cancel_message(execution_report_cancel_message_sent, 255)
  :: else -> ramp_execution_report_cancel_message(execution_report_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_cancel_message(execution_report_cancel_message_sent);
    assert(at == 199);
    at = 0;
    decode_execution_report_cancel_message(execution_report_cancel_message_got);
    assert(at == 199);
    equal_execution_report_cancel_message(execution_report_cancel_message_got, execution_report_cancel_message_sent)
  }
}

/* Execution Report Reject Message: encoded, read back, and compared */
proctype check_execution_report_reject_message() {
  ExecutionReportRejectMessage execution_report_reject_message_sent;
  ExecutionReportRejectMessage execution_report_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_reject_message(execution_report_reject_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_reject_message(execution_report_reject_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_reject_message(execution_report_reject_message_sent, 255)
  :: else -> ramp_execution_report_reject_message(execution_report_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_reject_message(execution_report_reject_message_sent);
    assert(at == 215);
    at = 0;
    decode_execution_report_reject_message(execution_report_reject_message_got);
    assert(at == 215);
    equal_execution_report_reject_message(execution_report_reject_message_got, execution_report_reject_message_sent)
  }
}

/* Execution Report Snapshot Message: encoded, read back, and compared */
proctype check_execution_report_snapshot_message() {
  ExecutionReportSnapshotMessage execution_report_snapshot_message_sent;
  ExecutionReportSnapshotMessage execution_report_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_snapshot_message(execution_report_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_snapshot_message(execution_report_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_snapshot_message(execution_report_snapshot_message_sent, 255)
  :: else -> ramp_execution_report_snapshot_message(execution_report_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_snapshot_message(execution_report_snapshot_message_sent);
    assert(at == 380);
    at = 0;
    decode_execution_report_snapshot_message(execution_report_snapshot_message_got);
    assert(at == 380);
    equal_execution_report_snapshot_message(execution_report_snapshot_message_got, execution_report_snapshot_message_sent)
  }
}

/* Quote Report Message: encoded, read back, and compared */
proctype check_quote_report_message() {
  QuoteReportMessage quote_report_message_sent;
  QuoteReportMessage quote_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_report_message(quote_report_message_sent, 0)
  :: pattern == 1 -> fill_quote_report_message(quote_report_message_sent, 32)
  :: pattern == 2 -> fill_quote_report_message(quote_report_message_sent, 255)
  :: else -> ramp_quote_report_message(quote_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_report_message(quote_report_message_sent);
    assert(at == 60);
    at = 0;
    decode_quote_report_message(quote_report_message_got);
    assert(at == 60);
    equal_quote_report_message(quote_report_message_got, quote_report_message_sent)
  }
}

/* New Order Cross Report Message: encoded, read back, and compared */
proctype check_new_order_cross_report_message() {
  NewOrderCrossReportMessage new_order_cross_report_message_sent;
  NewOrderCrossReportMessage new_order_cross_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_cross_report_message(new_order_cross_report_message_sent, 0)
  :: pattern == 1 -> fill_new_order_cross_report_message(new_order_cross_report_message_sent, 32)
  :: pattern == 2 -> fill_new_order_cross_report_message(new_order_cross_report_message_sent, 255)
  :: else -> ramp_new_order_cross_report_message(new_order_cross_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_cross_report_message(new_order_cross_report_message_sent);
    assert(at == 145);
    at = 0;
    decode_new_order_cross_report_message(new_order_cross_report_message_got);
    assert(at == 145);
    equal_new_order_cross_report_message(new_order_cross_report_message_got, new_order_cross_report_message_sent)
  }
}

/* Order Mass Cancel Report Message: encoded, read back, and compared */
proctype check_order_mass_cancel_report_message() {
  OrderMassCancelReportMessage order_mass_cancel_report_message_sent;
  OrderMassCancelReportMessage order_mass_cancel_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 255)
  :: else -> ramp_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_cancel_report_message(order_mass_cancel_report_message_sent);
    assert(at == 151);
    at = 0;
    decode_order_mass_cancel_report_message(order_mass_cancel_report_message_got);
    assert(at == 151);
    equal_order_mass_cancel_report_message(order_mass_cancel_report_message_got, order_mass_cancel_report_message_sent)
  }
}

/* Resend Request Message: encoded, read back, and compared */
proctype check_resend_request_message() {
  ResendRequestMessage resend_request_message_sent;
  ResendRequestMessage resend_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_resend_request_message(resend_request_message_sent, 0)
  :: pattern == 1 -> fill_resend_request_message(resend_request_message_sent, 32)
  :: pattern == 2 -> fill_resend_request_message(resend_request_message_sent, 255)
  :: else -> ramp_resend_request_message(resend_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_resend_request_message(resend_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_resend_request_message(resend_request_message_got);
    assert(at == 8);
    equal_resend_request_message(resend_request_message_got, resend_request_message_sent)
  }
}

/* Resend Report Message: encoded, read back, and compared */
proctype check_resend_report_message() {
  ResendReportMessage resend_report_message_sent;
  ResendReportMessage resend_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_resend_report_message(resend_report_message_sent, 0)
  :: pattern == 1 -> fill_resend_report_message(resend_report_message_sent, 32)
  :: pattern == 2 -> fill_resend_report_message(resend_report_message_sent, 255)
  :: else -> ramp_resend_report_message(resend_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_resend_report_message(resend_report_message_sent);
    assert(at == 113);
    at = 0;
    decode_resend_report_message(resend_report_message_got);
    assert(at == 113);
    equal_resend_report_message(resend_report_message_got, resend_report_message_sent)
  }
}

/* Sequence Reset Message: encoded, read back, and compared */
proctype check_sequence_reset_message() {
  SequenceResetMessage sequence_reset_message_sent;
  SequenceResetMessage sequence_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_reset_message(sequence_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_reset_message(sequence_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_reset_message(sequence_reset_message_sent, 255)
  :: else -> ramp_sequence_reset_message(sequence_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_reset_message(sequence_reset_message_sent);
    assert(at == 5);
    at = 0;
    decode_sequence_reset_message(sequence_reset_message_got);
    assert(at == 5);
    equal_sequence_reset_message(sequence_reset_message_got, sequence_reset_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_simple_open_framing_header()
  :: run check_framing_header()
  :: run check_simple_open_framing_header_message()
  :: run check_logon_request_message()
  :: run check_logon_report_message()
  :: run check_logout_request_message()
  :: run check_logout_report_message()
  :: run check_error_message()
  :: run check_group_size_encoding()
  :: run check_security_definition_reject_message()
  :: run check_security_definition_request_message()
  :: run check_trader_logon_request_message()
  :: run check_trader_logon_report_message()
  :: run check_trader_logout_request_message()
  :: run check_trader_logout_report_message()
  :: run check_new_order_request_message()
  :: run check_cancel_replace_request_message()
  :: run check_cancel_request_message()
  :: run check_quote_request_message()
  :: run check_order_mass_cancel_request_message()
  :: run check_security_definition_request_create_flex_message()
  :: run check_exec_i_d_order_exec_id()
  :: run check_orig_order_id()
  :: run check_execution_report_new_message()
  :: run check_execution_report_cancel_message()
  :: run check_execution_report_reject_message()
  :: run check_execution_report_snapshot_message()
  :: run check_quote_report_message()
  :: run check_new_order_cross_report_message()
  :: run check_order_mass_cancel_report_message()
  :: run check_resend_request_message()
  :: run check_resend_report_message()
  :: run check_sequence_reset_message()
  fi
}
