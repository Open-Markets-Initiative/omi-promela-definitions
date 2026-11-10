/*
 * London Stock Exchange MiFID II Post Trade Recovery
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
 *   - a run counted by a field
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 533

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Unit Header: 8 bytes ---------------------------------------------------- */

/* Gtp Tcp Unit Header */
typedef UnitHeader {
  byte length[2];
  byte message_count;
  byte market_data_group;
  byte sequence_number[4]
};

int unit_header_at;

/* every byte of Unit Header set to one value */
inline fill_unit_header(unit_header_record, unit_header_value) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = unit_header_value; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = unit_header_value;
  unit_header_record.market_data_group = unit_header_value;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = unit_header_value; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Header set to where it lies, so a field read out of place says so */
inline ramp_unit_header(unit_header_record, unit_header_base) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = (unit_header_base + 0 + unit_header_at + 1) % 256; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = (unit_header_base + 2 + 1) % 256;
  unit_header_record.market_data_group = (unit_header_base + 3 + 1) % 256;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = (unit_header_base + 4 + unit_header_at + 1) % 256; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Header to the wire, 8 bytes from where the cursor stands */
inline encode_unit_header(unit_header_record) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> wire[at] = unit_header_record.length[unit_header_at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  wire[at] = unit_header_record.message_count; at = at + 1;
  wire[at] = unit_header_record.market_data_group; at = at + 1;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> wire[at] = unit_header_record.sequence_number[unit_header_at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Header off the wire, 8 bytes from where the cursor stands */
inline decode_unit_header(unit_header_record) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = wire[at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = wire[at]; at = at + 1;
  unit_header_record.market_data_group = wire[at]; at = at + 1;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = wire[at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Header is what was written, byte for byte */
inline equal_unit_header(unit_header_read, unit_header_written) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> assert(unit_header_read.length[unit_header_at] == unit_header_written.length[unit_header_at]); unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  assert(unit_header_read.message_count == unit_header_written.message_count);
  assert(unit_header_read.market_data_group == unit_header_written.market_data_group);
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> assert(unit_header_read.sequence_number[unit_header_at] == unit_header_written.sequence_number[unit_header_at]); unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Gtp Tcp Message Header */
typedef MessageHeader {
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Login Request Message: 8 bytes ------------------------------------------ */

/* Used by the client to log in to the replay or recovery channel. */
typedef LoginRequestMessage {
  byte username[8]
};

int login_request_message_at;

/* every byte of Login Request Message set to one value */
inline fill_login_request_message(login_request_message_record, login_request_message_value) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 8 -> login_request_message_record.username[login_request_message_at] = login_request_message_value; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_message(login_request_message_record, login_request_message_base) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 8 -> login_request_message_record.username[login_request_message_at] = (login_request_message_base + 0 + login_request_message_at + 1) % 256; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 8 -> wire[at] = login_request_message_record.username[login_request_message_at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 8 -> login_request_message_record.username[login_request_message_at] = wire[at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Message is what was written, byte for byte */
inline equal_login_request_message(login_request_message_read, login_request_message_written) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 8 -> assert(login_request_message_read.username[login_request_message_at] == login_request_message_written.username[login_request_message_at]); login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Recovery Request Message: 27 bytes -------------------------------------- */

/* Used by the client to request data on the recovery channel. */
typedef RecoveryRequestMessage {
  byte request_level;
  byte instrument[8];
  byte group_id[6];
  byte request_order_book_type;
  byte source_venue[2];
  byte recovery_type;
  byte sequence_number[4];
  byte request_id[4]
};

int recovery_request_message_at;

/* every byte of Recovery Request Message set to one value */
inline fill_recovery_request_message(recovery_request_message_record, recovery_request_message_value) {
  recovery_request_message_record.request_level = recovery_request_message_value;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 8 -> recovery_request_message_record.instrument[recovery_request_message_at] = recovery_request_message_value; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 6 -> recovery_request_message_record.group_id[recovery_request_message_at] = recovery_request_message_value; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_record.request_order_book_type = recovery_request_message_value;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 2 -> recovery_request_message_record.source_venue[recovery_request_message_at] = recovery_request_message_value; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_record.recovery_type = recovery_request_message_value;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> recovery_request_message_record.sequence_number[recovery_request_message_at] = recovery_request_message_value; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> recovery_request_message_record.request_id[recovery_request_message_at] = recovery_request_message_value; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Recovery Request Message set to where it lies, so a field read out of place says so */
inline ramp_recovery_request_message(recovery_request_message_record, recovery_request_message_base) {
  recovery_request_message_record.request_level = (recovery_request_message_base + 0 + 1) % 256;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 8 -> recovery_request_message_record.instrument[recovery_request_message_at] = (recovery_request_message_base + 1 + recovery_request_message_at + 1) % 256; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 6 -> recovery_request_message_record.group_id[recovery_request_message_at] = (recovery_request_message_base + 9 + recovery_request_message_at + 1) % 256; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_record.request_order_book_type = (recovery_request_message_base + 15 + 1) % 256;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 2 -> recovery_request_message_record.source_venue[recovery_request_message_at] = (recovery_request_message_base + 16 + recovery_request_message_at + 1) % 256; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_record.recovery_type = (recovery_request_message_base + 18 + 1) % 256;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> recovery_request_message_record.sequence_number[recovery_request_message_at] = (recovery_request_message_base + 19 + recovery_request_message_at + 1) % 256; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> recovery_request_message_record.request_id[recovery_request_message_at] = (recovery_request_message_base + 23 + recovery_request_message_at + 1) % 256; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Recovery Request Message to the wire, 27 bytes from where the cursor stands */
inline encode_recovery_request_message(recovery_request_message_record) {
  wire[at] = recovery_request_message_record.request_level; at = at + 1;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 8 -> wire[at] = recovery_request_message_record.instrument[recovery_request_message_at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 6 -> wire[at] = recovery_request_message_record.group_id[recovery_request_message_at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  wire[at] = recovery_request_message_record.request_order_book_type; at = at + 1;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 2 -> wire[at] = recovery_request_message_record.source_venue[recovery_request_message_at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  wire[at] = recovery_request_message_record.recovery_type; at = at + 1;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> wire[at] = recovery_request_message_record.sequence_number[recovery_request_message_at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> wire[at] = recovery_request_message_record.request_id[recovery_request_message_at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Recovery Request Message off the wire, 27 bytes from where the cursor stands */
inline decode_recovery_request_message(recovery_request_message_record) {
  recovery_request_message_record.request_level = wire[at]; at = at + 1;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 8 -> recovery_request_message_record.instrument[recovery_request_message_at] = wire[at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 6 -> recovery_request_message_record.group_id[recovery_request_message_at] = wire[at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_record.request_order_book_type = wire[at]; at = at + 1;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 2 -> recovery_request_message_record.source_venue[recovery_request_message_at] = wire[at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_record.recovery_type = wire[at]; at = at + 1;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> recovery_request_message_record.sequence_number[recovery_request_message_at] = wire[at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> recovery_request_message_record.request_id[recovery_request_message_at] = wire[at]; at = at + 1; recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Recovery Request Message is what was written, byte for byte */
inline equal_recovery_request_message(recovery_request_message_read, recovery_request_message_written) {
  assert(recovery_request_message_read.request_level == recovery_request_message_written.request_level);
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 8 -> assert(recovery_request_message_read.instrument[recovery_request_message_at] == recovery_request_message_written.instrument[recovery_request_message_at]); recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 6 -> assert(recovery_request_message_read.group_id[recovery_request_message_at] == recovery_request_message_written.group_id[recovery_request_message_at]); recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  assert(recovery_request_message_read.request_order_book_type == recovery_request_message_written.request_order_book_type);
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 2 -> assert(recovery_request_message_read.source_venue[recovery_request_message_at] == recovery_request_message_written.source_venue[recovery_request_message_at]); recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  assert(recovery_request_message_read.recovery_type == recovery_request_message_written.recovery_type);
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> assert(recovery_request_message_read.sequence_number[recovery_request_message_at] == recovery_request_message_written.sequence_number[recovery_request_message_at]); recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  recovery_request_message_at = 0;
  do
  :: recovery_request_message_at < 4 -> assert(recovery_request_message_read.request_id[recovery_request_message_at] == recovery_request_message_written.request_id[recovery_request_message_at]); recovery_request_message_at = recovery_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* Used by the server to accept or reject a login request to the replay or recovery channel. */
typedef LoginResponseMessage {
  byte login_status
};

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.login_status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.login_status = (login_response_message_base + 0 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.login_status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.login_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.login_status == login_response_message_written.login_status);
  skip
}

/* ---- Recovery Response Message: 13 bytes ------------------------------------- */

/* Used by the server to respond to a snapshot request on the recovery channel. */
typedef RecoveryResponseMessage {
  byte sequence_number[4];
  byte count[4];
  byte recovery_status;
  byte request_id[4]
};

int recovery_response_message_at;

/* every byte of Recovery Response Message set to one value */
inline fill_recovery_response_message(recovery_response_message_record, recovery_response_message_value) {
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.sequence_number[recovery_response_message_at] = recovery_response_message_value; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.count[recovery_response_message_at] = recovery_response_message_value; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_record.recovery_status = recovery_response_message_value;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.request_id[recovery_response_message_at] = recovery_response_message_value; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Recovery Response Message set to where it lies, so a field read out of place says so */
inline ramp_recovery_response_message(recovery_response_message_record, recovery_response_message_base) {
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.sequence_number[recovery_response_message_at] = (recovery_response_message_base + 0 + recovery_response_message_at + 1) % 256; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.count[recovery_response_message_at] = (recovery_response_message_base + 4 + recovery_response_message_at + 1) % 256; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_record.recovery_status = (recovery_response_message_base + 8 + 1) % 256;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.request_id[recovery_response_message_at] = (recovery_response_message_base + 9 + recovery_response_message_at + 1) % 256; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Recovery Response Message to the wire, 13 bytes from where the cursor stands */
inline encode_recovery_response_message(recovery_response_message_record) {
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> wire[at] = recovery_response_message_record.sequence_number[recovery_response_message_at]; at = at + 1; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> wire[at] = recovery_response_message_record.count[recovery_response_message_at]; at = at + 1; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  wire[at] = recovery_response_message_record.recovery_status; at = at + 1;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> wire[at] = recovery_response_message_record.request_id[recovery_response_message_at]; at = at + 1; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Recovery Response Message off the wire, 13 bytes from where the cursor stands */
inline decode_recovery_response_message(recovery_response_message_record) {
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.sequence_number[recovery_response_message_at] = wire[at]; at = at + 1; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.count[recovery_response_message_at] = wire[at]; at = at + 1; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_record.recovery_status = wire[at]; at = at + 1;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> recovery_response_message_record.request_id[recovery_response_message_at] = wire[at]; at = at + 1; recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Recovery Response Message is what was written, byte for byte */
inline equal_recovery_response_message(recovery_response_message_read, recovery_response_message_written) {
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> assert(recovery_response_message_read.sequence_number[recovery_response_message_at] == recovery_response_message_written.sequence_number[recovery_response_message_at]); recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> assert(recovery_response_message_read.count[recovery_response_message_at] == recovery_response_message_written.count[recovery_response_message_at]); recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  assert(recovery_response_message_read.recovery_status == recovery_response_message_written.recovery_status);
  recovery_response_message_at = 0;
  do
  :: recovery_response_message_at < 4 -> assert(recovery_response_message_read.request_id[recovery_response_message_at] == recovery_response_message_written.request_id[recovery_response_message_at]); recovery_response_message_at = recovery_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay And Recovery Complete Message: 5 bytes --------------------------- */

/* Used by the server to indicate the successful completion of servicing a message replay or a recovery request. */
typedef ReplayAndRecoveryCompleteMessage {
  byte request_id[4];
  byte trading_status
};

int replay_and_recovery_complete_message_at;

/* every byte of Replay And Recovery Complete Message set to one value */
inline fill_replay_and_recovery_complete_message(replay_and_recovery_complete_message_record, replay_and_recovery_complete_message_value) {
  replay_and_recovery_complete_message_at = 0;
  do
  :: replay_and_recovery_complete_message_at < 4 -> replay_and_recovery_complete_message_record.request_id[replay_and_recovery_complete_message_at] = replay_and_recovery_complete_message_value; replay_and_recovery_complete_message_at = replay_and_recovery_complete_message_at + 1
  :: else -> break
  od;
  replay_and_recovery_complete_message_record.trading_status = replay_and_recovery_complete_message_value;
  skip
}

/* each byte of Replay And Recovery Complete Message set to where it lies, so a field read out of place says so */
inline ramp_replay_and_recovery_complete_message(replay_and_recovery_complete_message_record, replay_and_recovery_complete_message_base) {
  replay_and_recovery_complete_message_at = 0;
  do
  :: replay_and_recovery_complete_message_at < 4 -> replay_and_recovery_complete_message_record.request_id[replay_and_recovery_complete_message_at] = (replay_and_recovery_complete_message_base + 0 + replay_and_recovery_complete_message_at + 1) % 256; replay_and_recovery_complete_message_at = replay_and_recovery_complete_message_at + 1
  :: else -> break
  od;
  replay_and_recovery_complete_message_record.trading_status = (replay_and_recovery_complete_message_base + 4 + 1) % 256;
  skip
}

/* Replay And Recovery Complete Message to the wire, 5 bytes from where the cursor stands */
inline encode_replay_and_recovery_complete_message(replay_and_recovery_complete_message_record) {
  replay_and_recovery_complete_message_at = 0;
  do
  :: replay_and_recovery_complete_message_at < 4 -> wire[at] = replay_and_recovery_complete_message_record.request_id[replay_and_recovery_complete_message_at]; at = at + 1; replay_and_recovery_complete_message_at = replay_and_recovery_complete_message_at + 1
  :: else -> break
  od;
  wire[at] = replay_and_recovery_complete_message_record.trading_status; at = at + 1;
  skip
}

/* Replay And Recovery Complete Message off the wire, 5 bytes from where the cursor stands */
inline decode_replay_and_recovery_complete_message(replay_and_recovery_complete_message_record) {
  replay_and_recovery_complete_message_at = 0;
  do
  :: replay_and_recovery_complete_message_at < 4 -> replay_and_recovery_complete_message_record.request_id[replay_and_recovery_complete_message_at] = wire[at]; at = at + 1; replay_and_recovery_complete_message_at = replay_and_recovery_complete_message_at + 1
  :: else -> break
  od;
  replay_and_recovery_complete_message_record.trading_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Replay And Recovery Complete Message is what was written, byte for byte */
inline equal_replay_and_recovery_complete_message(replay_and_recovery_complete_message_read, replay_and_recovery_complete_message_written) {
  replay_and_recovery_complete_message_at = 0;
  do
  :: replay_and_recovery_complete_message_at < 4 -> assert(replay_and_recovery_complete_message_read.request_id[replay_and_recovery_complete_message_at] == replay_and_recovery_complete_message_written.request_id[replay_and_recovery_complete_message_at]); replay_and_recovery_complete_message_at = replay_and_recovery_complete_message_at + 1
  :: else -> break
  od;
  assert(replay_and_recovery_complete_message_read.trading_status == replay_and_recovery_complete_message_written.trading_status);
  skip
}

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* Broadcast at the start and end of day on TRADEcho. Session transition is advertised via one system event message for all instruments allocated to the same multicast channel */
typedef SystemEventMessage {
  byte timestamp[8];
  byte event_code;
  byte source_venue[2]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = (system_event_message_base + 9 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.source_venue[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.source_venue[system_event_message_at] == system_event_message_written.source_venue[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Status Message: 27 bytes ------------------------------------- */

/* Should a specific instrument be subject to individual status change, such as suspension or halt, this will be communicated by the instrument status message */
typedef InstrumentStatusMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte trading_status;
  byte session_change_reason;
  byte new_end_time[6];
  byte order_book_type
};

int instrument_status_message_at;

/* every byte of Instrument Status Message set to one value */
inline fill_instrument_status_message(instrument_status_message_record, instrument_status_message_value) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = instrument_status_message_value;
  instrument_status_message_record.session_change_reason = instrument_status_message_value;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = instrument_status_message_value;
  skip
}

/* each byte of Instrument Status Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_status_message(instrument_status_message_record, instrument_status_message_base) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = (instrument_status_message_base + 0 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = (instrument_status_message_base + 8 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = (instrument_status_message_base + 16 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = (instrument_status_message_base + 18 + 1) % 256;
  instrument_status_message_record.session_change_reason = (instrument_status_message_base + 19 + 1) % 256;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = (instrument_status_message_base + 20 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = (instrument_status_message_base + 26 + 1) % 256;
  skip
}

/* Instrument Status Message to the wire, 27 bytes from where the cursor stands */
inline encode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> wire[at] = instrument_status_message_record.timestamp[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> wire[at] = instrument_status_message_record.instrument[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> wire[at] = instrument_status_message_record.source_venue[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_message_record.trading_status; at = at + 1;
  wire[at] = instrument_status_message_record.session_change_reason; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> wire[at] = instrument_status_message_record.new_end_time[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_message_record.order_book_type; at = at + 1;
  skip
}

/* Instrument Status Message off the wire, 27 bytes from where the cursor stands */
inline decode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = wire[at]; at = at + 1;
  instrument_status_message_record.session_change_reason = wire[at]; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Status Message is what was written, byte for byte */
inline equal_instrument_status_message(instrument_status_message_read, instrument_status_message_written) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> assert(instrument_status_message_read.timestamp[instrument_status_message_at] == instrument_status_message_written.timestamp[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> assert(instrument_status_message_read.instrument[instrument_status_message_at] == instrument_status_message_written.instrument[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> assert(instrument_status_message_read.source_venue[instrument_status_message_at] == instrument_status_message_written.source_venue[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_status_message_read.trading_status == instrument_status_message_written.trading_status);
  assert(instrument_status_message_read.session_change_reason == instrument_status_message_written.session_change_reason);
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> assert(instrument_status_message_read.new_end_time[instrument_status_message_at] == instrument_status_message_written.new_end_time[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_status_message_read.order_book_type == instrument_status_message_written.order_book_type);
  skip
}

/* ---- Statistics Snapshot Message: 270 bytes ---------------------------------- */

/* A snapshot of an instrument's statistics that is used for recovery */
typedef StatisticsSnapshotMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte volume[8];
  byte volume_on_book_only[8];
  byte vwap[8];
  byte vwap_on_book_only[8];
  byte number_of_trades[4];
  byte number_of_trades_on_book_only[4];
  byte turnover[8];
  byte turnover_on_book_only[8];
  byte official_opening_price[8];
  byte official_closing_price[8];
  byte trade_high_on_book_only[8];
  byte trade_low_on_book_only[8];
  byte trade_high[8];
  byte trade_low[8];
  byte fifty_two_week_trade_high[8];
  byte fifty_two_week_trade_low[8];
  byte opening_price_indicator;
  byte closing_price_indicator;
  byte iau_price[8];
  byte iau_paired_size[8];
  byte imbalance_quantity[8];
  byte imbalance_direction;
  byte best_closing_bid_price[8];
  byte best_closing_ask_price[8];
  byte best_closing_bid_size[8];
  byte best_closing_ask_size[8];
  byte trade_high_off_book[8];
  byte trade_low_off_book[8];
  byte reserved_8[8];
  byte second_reserved_8[8];
  byte auction_type;
  byte last_trade_price[8];
  byte last_trade_quantity[8];
  byte last_trade_time[8];
  byte static_reference_price[8];
  byte dynamic_reference_price[8]
};

int statistics_snapshot_message_at;

/* every byte of Statistics Snapshot Message set to one value */
inline fill_statistics_snapshot_message(statistics_snapshot_message_record, statistics_snapshot_message_value) {
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.timestamp[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.instrument[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 2 -> statistics_snapshot_message_record.source_venue[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.volume[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.volume_on_book_only[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.vwap[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.vwap_on_book_only[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> statistics_snapshot_message_record.number_of_trades[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> statistics_snapshot_message_record.number_of_trades_on_book_only[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.turnover[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.turnover_on_book_only[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.official_opening_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.official_closing_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high_on_book_only[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low_on_book_only[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.fifty_two_week_trade_high[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.fifty_two_week_trade_low[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.opening_price_indicator = statistics_snapshot_message_value;
  statistics_snapshot_message_record.closing_price_indicator = statistics_snapshot_message_value;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.iau_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.iau_paired_size[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.imbalance_quantity[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.imbalance_direction = statistics_snapshot_message_value;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_bid_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_ask_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_bid_size[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_ask_size[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high_off_book[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low_off_book[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.reserved_8[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.second_reserved_8[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.auction_type = statistics_snapshot_message_value;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_quantity[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_time[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.static_reference_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.dynamic_reference_price[statistics_snapshot_message_at] = statistics_snapshot_message_value; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_snapshot_message(statistics_snapshot_message_record, statistics_snapshot_message_base) {
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.timestamp[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 0 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.instrument[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 8 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 2 -> statistics_snapshot_message_record.source_venue[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 16 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.volume[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 18 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.volume_on_book_only[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 26 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.vwap[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 34 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.vwap_on_book_only[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 42 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> statistics_snapshot_message_record.number_of_trades[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 50 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> statistics_snapshot_message_record.number_of_trades_on_book_only[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 54 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.turnover[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 58 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.turnover_on_book_only[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 66 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.official_opening_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 74 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.official_closing_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 82 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high_on_book_only[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 90 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low_on_book_only[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 98 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 106 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 114 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.fifty_two_week_trade_high[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 122 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.fifty_two_week_trade_low[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 130 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.opening_price_indicator = (statistics_snapshot_message_base + 138 + 1) % 256;
  statistics_snapshot_message_record.closing_price_indicator = (statistics_snapshot_message_base + 139 + 1) % 256;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.iau_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 140 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.iau_paired_size[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 148 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.imbalance_quantity[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 156 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.imbalance_direction = (statistics_snapshot_message_base + 164 + 1) % 256;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_bid_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 165 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_ask_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 173 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_bid_size[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 181 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_ask_size[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 189 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high_off_book[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 197 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low_off_book[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 205 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.reserved_8[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 213 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.second_reserved_8[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 221 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.auction_type = (statistics_snapshot_message_base + 229 + 1) % 256;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 230 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_quantity[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 238 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_time[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 246 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.static_reference_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 254 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.dynamic_reference_price[statistics_snapshot_message_at] = (statistics_snapshot_message_base + 262 + statistics_snapshot_message_at + 1) % 256; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Snapshot Message to the wire, 270 bytes from where the cursor stands */
inline encode_statistics_snapshot_message(statistics_snapshot_message_record) {
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.timestamp[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.instrument[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 2 -> wire[at] = statistics_snapshot_message_record.source_venue[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.volume[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.volume_on_book_only[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.vwap[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.vwap_on_book_only[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> wire[at] = statistics_snapshot_message_record.number_of_trades[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> wire[at] = statistics_snapshot_message_record.number_of_trades_on_book_only[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.turnover[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.turnover_on_book_only[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.official_opening_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.official_closing_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.trade_high_on_book_only[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.trade_low_on_book_only[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.trade_high[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.trade_low[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.fifty_two_week_trade_high[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.fifty_two_week_trade_low[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_snapshot_message_record.opening_price_indicator; at = at + 1;
  wire[at] = statistics_snapshot_message_record.closing_price_indicator; at = at + 1;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.iau_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.iau_paired_size[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.imbalance_quantity[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_snapshot_message_record.imbalance_direction; at = at + 1;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.best_closing_bid_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.best_closing_ask_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.best_closing_bid_size[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.best_closing_ask_size[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.trade_high_off_book[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.trade_low_off_book[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.reserved_8[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.second_reserved_8[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_snapshot_message_record.auction_type; at = at + 1;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.last_trade_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.last_trade_quantity[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.last_trade_time[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.static_reference_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> wire[at] = statistics_snapshot_message_record.dynamic_reference_price[statistics_snapshot_message_at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Snapshot Message off the wire, 270 bytes from where the cursor stands */
inline decode_statistics_snapshot_message(statistics_snapshot_message_record) {
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.timestamp[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.instrument[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 2 -> statistics_snapshot_message_record.source_venue[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.volume[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.volume_on_book_only[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.vwap[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.vwap_on_book_only[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> statistics_snapshot_message_record.number_of_trades[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> statistics_snapshot_message_record.number_of_trades_on_book_only[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.turnover[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.turnover_on_book_only[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.official_opening_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.official_closing_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high_on_book_only[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low_on_book_only[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.fifty_two_week_trade_high[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.fifty_two_week_trade_low[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.opening_price_indicator = wire[at]; at = at + 1;
  statistics_snapshot_message_record.closing_price_indicator = wire[at]; at = at + 1;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.iau_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.iau_paired_size[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.imbalance_quantity[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.imbalance_direction = wire[at]; at = at + 1;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_bid_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_ask_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_bid_size[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.best_closing_ask_size[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_high_off_book[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.trade_low_off_book[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.reserved_8[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.second_reserved_8[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_record.auction_type = wire[at]; at = at + 1;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_quantity[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.last_trade_time[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.static_reference_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> statistics_snapshot_message_record.dynamic_reference_price[statistics_snapshot_message_at] = wire[at]; at = at + 1; statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Snapshot Message is what was written, byte for byte */
inline equal_statistics_snapshot_message(statistics_snapshot_message_read, statistics_snapshot_message_written) {
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.timestamp[statistics_snapshot_message_at] == statistics_snapshot_message_written.timestamp[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.instrument[statistics_snapshot_message_at] == statistics_snapshot_message_written.instrument[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 2 -> assert(statistics_snapshot_message_read.source_venue[statistics_snapshot_message_at] == statistics_snapshot_message_written.source_venue[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.volume[statistics_snapshot_message_at] == statistics_snapshot_message_written.volume[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.volume_on_book_only[statistics_snapshot_message_at] == statistics_snapshot_message_written.volume_on_book_only[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.vwap[statistics_snapshot_message_at] == statistics_snapshot_message_written.vwap[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.vwap_on_book_only[statistics_snapshot_message_at] == statistics_snapshot_message_written.vwap_on_book_only[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> assert(statistics_snapshot_message_read.number_of_trades[statistics_snapshot_message_at] == statistics_snapshot_message_written.number_of_trades[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 4 -> assert(statistics_snapshot_message_read.number_of_trades_on_book_only[statistics_snapshot_message_at] == statistics_snapshot_message_written.number_of_trades_on_book_only[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.turnover[statistics_snapshot_message_at] == statistics_snapshot_message_written.turnover[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.turnover_on_book_only[statistics_snapshot_message_at] == statistics_snapshot_message_written.turnover_on_book_only[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.official_opening_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.official_opening_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.official_closing_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.official_closing_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.trade_high_on_book_only[statistics_snapshot_message_at] == statistics_snapshot_message_written.trade_high_on_book_only[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.trade_low_on_book_only[statistics_snapshot_message_at] == statistics_snapshot_message_written.trade_low_on_book_only[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.trade_high[statistics_snapshot_message_at] == statistics_snapshot_message_written.trade_high[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.trade_low[statistics_snapshot_message_at] == statistics_snapshot_message_written.trade_low[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.fifty_two_week_trade_high[statistics_snapshot_message_at] == statistics_snapshot_message_written.fifty_two_week_trade_high[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.fifty_two_week_trade_low[statistics_snapshot_message_at] == statistics_snapshot_message_written.fifty_two_week_trade_low[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  assert(statistics_snapshot_message_read.opening_price_indicator == statistics_snapshot_message_written.opening_price_indicator);
  assert(statistics_snapshot_message_read.closing_price_indicator == statistics_snapshot_message_written.closing_price_indicator);
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.iau_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.iau_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.iau_paired_size[statistics_snapshot_message_at] == statistics_snapshot_message_written.iau_paired_size[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.imbalance_quantity[statistics_snapshot_message_at] == statistics_snapshot_message_written.imbalance_quantity[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  assert(statistics_snapshot_message_read.imbalance_direction == statistics_snapshot_message_written.imbalance_direction);
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.best_closing_bid_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.best_closing_bid_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.best_closing_ask_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.best_closing_ask_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.best_closing_bid_size[statistics_snapshot_message_at] == statistics_snapshot_message_written.best_closing_bid_size[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.best_closing_ask_size[statistics_snapshot_message_at] == statistics_snapshot_message_written.best_closing_ask_size[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.trade_high_off_book[statistics_snapshot_message_at] == statistics_snapshot_message_written.trade_high_off_book[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.trade_low_off_book[statistics_snapshot_message_at] == statistics_snapshot_message_written.trade_low_off_book[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.reserved_8[statistics_snapshot_message_at] == statistics_snapshot_message_written.reserved_8[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.second_reserved_8[statistics_snapshot_message_at] == statistics_snapshot_message_written.second_reserved_8[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  assert(statistics_snapshot_message_read.auction_type == statistics_snapshot_message_written.auction_type);
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.last_trade_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.last_trade_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.last_trade_quantity[statistics_snapshot_message_at] == statistics_snapshot_message_written.last_trade_quantity[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.last_trade_time[statistics_snapshot_message_at] == statistics_snapshot_message_written.last_trade_time[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.static_reference_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.static_reference_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  statistics_snapshot_message_at = 0;
  do
  :: statistics_snapshot_message_at < 8 -> assert(statistics_snapshot_message_read.dynamic_reference_price[statistics_snapshot_message_at] == statistics_snapshot_message_written.dynamic_reference_price[statistics_snapshot_message_at]); statistics_snapshot_message_at = statistics_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mifid Ii Trade Report Message: 533 bytes -------------------------------- */

/* Sent to report the MiFID compliant details of a privately negotiated trade */
typedef MifidIiTradeReportMessage {
  byte timestamp[8];
  byte instrument[8];
  byte transaction_identification_code[52];
  byte total_number_of_transactions[4];
  byte reserved_8[8];
  byte source_venue[2];
  byte price[20];
  byte quantity[20];
  byte trading_date_and_time[27];
  byte instrument_identification_code_type[4];
  byte instrument_identification_code[12];
  byte price_notation[4];
  byte price_major_currency_price_currency[3];
  byte notional_amount[20];
  byte notional_currency[3];
  byte venue_of_execution[4];
  byte publication_date_and_time[27];
  byte benchmark_transaction_flag[4];
  byte agency_cross_trade_flag[4];
  byte non_price_forming_transactions_flag[4];
  byte non_price_contribution_to_discovery[4];
  byte special_dividend_flag[4];
  byte pt_deferral_reason_flag[4];
  byte reference_price_transaction_flag[4];
  byte nt_liquidity_flag[4];
  byte nt_price_conditions_flag[4];
  byte algo_transaction_flag[4];
  byte pt_illiquid_flag[4];
  byte price_improvement_flag[4];
  byte cancellation_flag[4];
  byte amendment_flag[4];
  byte duplicate_flag[4];
  byte exchange_for_physicals_flag[4];
  byte limited_details_flag[4];
  byte ld_full_details_flag[4];
  byte daily_aggregated_transaction_flag[4];
  byte da_full_details_flag[4];
  byte volume_omission_flag[4];
  byte vo_full_details_flag[4];
  byte four_weeks_aggregation_flag[4];
  byte fa_full_details_flag[4];
  byte indefinite_aggregation_flag[4];
  byte volume_omission_for_sovereign_debt_flag[4];
  byte consecutive_aggregation_flag[4];
  byte reserved_1;
  byte venue_type;
  byte venue_book_definition_id;
  byte notation_of_the_quantity_in_measurement_unit[25];
  byte quantity_in_measurement_unit[20];
  byte transaction_to_be_cleared;
  byte emission_allowance_type[4];
  byte venue_of_publication[4];
  byte market_mechanism;
  byte trading_mode;
  byte transaction_category;
  byte negotiation_indicator;
  byte agency_cross_indicator;
  byte modification_indicator;
  byte reference_price_indicator;
  byte special_dividend_indicator;
  byte off_book_automated_indicator;
  byte price_formation_indicator;
  byte algorithmic_indicator;
  byte post_trade_deferral_reason;
  byte deferral_enrichment_type;
  byte duplicative_indicator;
  byte third_country_trading_venue_of_execution[4];
  byte portfolio_transaction_flag[4];
  byte contingent_transaction_flag[4];
  byte missing_price_price_conditions[4];
  byte market_closing_price_flag[4];
  byte nt_large_in_scale_flag[4];
  byte nt_pre_trade_transparency_flag[4];
  byte effective_date_of_the_contract[10];
  byte maturity_date_of_the_contract[10];
  byte spread[20];
  byte upfront_payment[20];
  byte lei_of_clearing_house[20];
  byte matched_principal_trade_flag[4];
  byte esma_standard_deferral_flags[4];
  byte negotiation_trade_flag[4];
  byte esma_supplementary_deferral_flags[4];
  byte trading_system[4]
};

int mifid_ii_trade_report_message_at;

/* every byte of Mifid Ii Trade Report Message set to one value */
inline fill_mifid_ii_trade_report_message(mifid_ii_trade_report_message_record, mifid_ii_trade_report_message_value) {
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.timestamp[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.instrument[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 52 -> mifid_ii_trade_report_message_record.transaction_identification_code[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.total_number_of_transactions[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.reserved_8[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 2 -> mifid_ii_trade_report_message_record.source_venue[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.price[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.quantity[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> mifid_ii_trade_report_message_record.trading_date_and_time[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.instrument_identification_code_type[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 12 -> mifid_ii_trade_report_message_record.instrument_identification_code[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.price_notation[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> mifid_ii_trade_report_message_record.price_major_currency_price_currency[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.notional_amount[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> mifid_ii_trade_report_message_record.notional_currency[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.venue_of_execution[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> mifid_ii_trade_report_message_record.publication_date_and_time[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.benchmark_transaction_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.agency_cross_trade_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.non_price_forming_transactions_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.non_price_contribution_to_discovery[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.special_dividend_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.pt_deferral_reason_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.reference_price_transaction_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_liquidity_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_price_conditions_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.algo_transaction_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.pt_illiquid_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.price_improvement_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.cancellation_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.amendment_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.duplicate_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.exchange_for_physicals_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.limited_details_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.ld_full_details_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.daily_aggregated_transaction_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.da_full_details_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.volume_omission_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.vo_full_details_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.four_weeks_aggregation_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.fa_full_details_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.indefinite_aggregation_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.volume_omission_for_sovereign_debt_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.consecutive_aggregation_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.reserved_1 = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.venue_type = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.venue_book_definition_id = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 25 -> mifid_ii_trade_report_message_record.notation_of_the_quantity_in_measurement_unit[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.quantity_in_measurement_unit[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.transaction_to_be_cleared = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.emission_allowance_type[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.venue_of_publication[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.market_mechanism = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.trading_mode = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.transaction_category = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.negotiation_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.agency_cross_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.modification_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.reference_price_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.special_dividend_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.off_book_automated_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.price_formation_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.algorithmic_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.post_trade_deferral_reason = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.deferral_enrichment_type = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_record.duplicative_indicator = mifid_ii_trade_report_message_value;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.third_country_trading_venue_of_execution[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.portfolio_transaction_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.contingent_transaction_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.missing_price_price_conditions[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.market_closing_price_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_large_in_scale_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_pre_trade_transparency_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> mifid_ii_trade_report_message_record.effective_date_of_the_contract[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> mifid_ii_trade_report_message_record.maturity_date_of_the_contract[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.spread[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.upfront_payment[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.lei_of_clearing_house[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.matched_principal_trade_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.esma_standard_deferral_flags[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.negotiation_trade_flag[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.esma_supplementary_deferral_flags[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.trading_system[mifid_ii_trade_report_message_at] = mifid_ii_trade_report_message_value; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mifid Ii Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_mifid_ii_trade_report_message(mifid_ii_trade_report_message_record, mifid_ii_trade_report_message_base) {
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.timestamp[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 0 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.instrument[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 8 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 52 -> mifid_ii_trade_report_message_record.transaction_identification_code[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 16 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.total_number_of_transactions[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 68 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.reserved_8[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 72 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 2 -> mifid_ii_trade_report_message_record.source_venue[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 80 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.price[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 82 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.quantity[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 102 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> mifid_ii_trade_report_message_record.trading_date_and_time[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 122 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.instrument_identification_code_type[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 149 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 12 -> mifid_ii_trade_report_message_record.instrument_identification_code[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 153 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.price_notation[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 165 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> mifid_ii_trade_report_message_record.price_major_currency_price_currency[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 169 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.notional_amount[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 172 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> mifid_ii_trade_report_message_record.notional_currency[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 192 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.venue_of_execution[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 195 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> mifid_ii_trade_report_message_record.publication_date_and_time[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 199 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.benchmark_transaction_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 226 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.agency_cross_trade_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 230 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.non_price_forming_transactions_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 234 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.non_price_contribution_to_discovery[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 238 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.special_dividend_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 242 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.pt_deferral_reason_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 246 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.reference_price_transaction_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 250 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_liquidity_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 254 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_price_conditions_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 258 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.algo_transaction_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 262 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.pt_illiquid_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 266 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.price_improvement_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 270 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.cancellation_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 274 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.amendment_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 278 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.duplicate_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 282 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.exchange_for_physicals_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 286 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.limited_details_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 290 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.ld_full_details_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 294 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.daily_aggregated_transaction_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 298 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.da_full_details_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 302 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.volume_omission_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 306 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.vo_full_details_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 310 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.four_weeks_aggregation_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 314 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.fa_full_details_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 318 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.indefinite_aggregation_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 322 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.volume_omission_for_sovereign_debt_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 326 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.consecutive_aggregation_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 330 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.reserved_1 = (mifid_ii_trade_report_message_base + 334 + 1) % 256;
  mifid_ii_trade_report_message_record.venue_type = (mifid_ii_trade_report_message_base + 335 + 1) % 256;
  mifid_ii_trade_report_message_record.venue_book_definition_id = (mifid_ii_trade_report_message_base + 336 + 1) % 256;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 25 -> mifid_ii_trade_report_message_record.notation_of_the_quantity_in_measurement_unit[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 337 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.quantity_in_measurement_unit[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 362 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.transaction_to_be_cleared = (mifid_ii_trade_report_message_base + 382 + 1) % 256;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.emission_allowance_type[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 383 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.venue_of_publication[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 387 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.market_mechanism = (mifid_ii_trade_report_message_base + 391 + 1) % 256;
  mifid_ii_trade_report_message_record.trading_mode = (mifid_ii_trade_report_message_base + 392 + 1) % 256;
  mifid_ii_trade_report_message_record.transaction_category = (mifid_ii_trade_report_message_base + 393 + 1) % 256;
  mifid_ii_trade_report_message_record.negotiation_indicator = (mifid_ii_trade_report_message_base + 394 + 1) % 256;
  mifid_ii_trade_report_message_record.agency_cross_indicator = (mifid_ii_trade_report_message_base + 395 + 1) % 256;
  mifid_ii_trade_report_message_record.modification_indicator = (mifid_ii_trade_report_message_base + 396 + 1) % 256;
  mifid_ii_trade_report_message_record.reference_price_indicator = (mifid_ii_trade_report_message_base + 397 + 1) % 256;
  mifid_ii_trade_report_message_record.special_dividend_indicator = (mifid_ii_trade_report_message_base + 398 + 1) % 256;
  mifid_ii_trade_report_message_record.off_book_automated_indicator = (mifid_ii_trade_report_message_base + 399 + 1) % 256;
  mifid_ii_trade_report_message_record.price_formation_indicator = (mifid_ii_trade_report_message_base + 400 + 1) % 256;
  mifid_ii_trade_report_message_record.algorithmic_indicator = (mifid_ii_trade_report_message_base + 401 + 1) % 256;
  mifid_ii_trade_report_message_record.post_trade_deferral_reason = (mifid_ii_trade_report_message_base + 402 + 1) % 256;
  mifid_ii_trade_report_message_record.deferral_enrichment_type = (mifid_ii_trade_report_message_base + 403 + 1) % 256;
  mifid_ii_trade_report_message_record.duplicative_indicator = (mifid_ii_trade_report_message_base + 404 + 1) % 256;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.third_country_trading_venue_of_execution[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 405 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.portfolio_transaction_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 409 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.contingent_transaction_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 413 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.missing_price_price_conditions[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 417 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.market_closing_price_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 421 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_large_in_scale_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 425 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_pre_trade_transparency_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 429 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> mifid_ii_trade_report_message_record.effective_date_of_the_contract[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 433 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> mifid_ii_trade_report_message_record.maturity_date_of_the_contract[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 443 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.spread[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 453 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.upfront_payment[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 473 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.lei_of_clearing_house[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 493 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.matched_principal_trade_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 513 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.esma_standard_deferral_flags[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 517 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.negotiation_trade_flag[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 521 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.esma_supplementary_deferral_flags[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 525 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.trading_system[mifid_ii_trade_report_message_at] = (mifid_ii_trade_report_message_base + 529 + mifid_ii_trade_report_message_at + 1) % 256; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mifid Ii Trade Report Message to the wire, 533 bytes from where the cursor stands */
inline encode_mifid_ii_trade_report_message(mifid_ii_trade_report_message_record) {
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> wire[at] = mifid_ii_trade_report_message_record.timestamp[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> wire[at] = mifid_ii_trade_report_message_record.instrument[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 52 -> wire[at] = mifid_ii_trade_report_message_record.transaction_identification_code[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.total_number_of_transactions[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> wire[at] = mifid_ii_trade_report_message_record.reserved_8[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 2 -> wire[at] = mifid_ii_trade_report_message_record.source_venue[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> wire[at] = mifid_ii_trade_report_message_record.price[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> wire[at] = mifid_ii_trade_report_message_record.quantity[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> wire[at] = mifid_ii_trade_report_message_record.trading_date_and_time[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.instrument_identification_code_type[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 12 -> wire[at] = mifid_ii_trade_report_message_record.instrument_identification_code[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.price_notation[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> wire[at] = mifid_ii_trade_report_message_record.price_major_currency_price_currency[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> wire[at] = mifid_ii_trade_report_message_record.notional_amount[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> wire[at] = mifid_ii_trade_report_message_record.notional_currency[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.venue_of_execution[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> wire[at] = mifid_ii_trade_report_message_record.publication_date_and_time[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.benchmark_transaction_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.agency_cross_trade_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.non_price_forming_transactions_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.non_price_contribution_to_discovery[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.special_dividend_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.pt_deferral_reason_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.reference_price_transaction_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.nt_liquidity_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.nt_price_conditions_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.algo_transaction_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.pt_illiquid_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.price_improvement_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.cancellation_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.amendment_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.duplicate_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.exchange_for_physicals_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.limited_details_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.ld_full_details_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.daily_aggregated_transaction_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.da_full_details_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.volume_omission_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.vo_full_details_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.four_weeks_aggregation_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.fa_full_details_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.indefinite_aggregation_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.volume_omission_for_sovereign_debt_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.consecutive_aggregation_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_report_message_record.reserved_1; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.venue_type; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.venue_book_definition_id; at = at + 1;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 25 -> wire[at] = mifid_ii_trade_report_message_record.notation_of_the_quantity_in_measurement_unit[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> wire[at] = mifid_ii_trade_report_message_record.quantity_in_measurement_unit[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_report_message_record.transaction_to_be_cleared; at = at + 1;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.emission_allowance_type[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.venue_of_publication[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_report_message_record.market_mechanism; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.trading_mode; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.transaction_category; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.negotiation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.agency_cross_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.modification_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.reference_price_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.special_dividend_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.off_book_automated_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.price_formation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.algorithmic_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.post_trade_deferral_reason; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.deferral_enrichment_type; at = at + 1;
  wire[at] = mifid_ii_trade_report_message_record.duplicative_indicator; at = at + 1;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.third_country_trading_venue_of_execution[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.portfolio_transaction_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.contingent_transaction_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.missing_price_price_conditions[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.market_closing_price_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.nt_large_in_scale_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.nt_pre_trade_transparency_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> wire[at] = mifid_ii_trade_report_message_record.effective_date_of_the_contract[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> wire[at] = mifid_ii_trade_report_message_record.maturity_date_of_the_contract[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> wire[at] = mifid_ii_trade_report_message_record.spread[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> wire[at] = mifid_ii_trade_report_message_record.upfront_payment[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> wire[at] = mifid_ii_trade_report_message_record.lei_of_clearing_house[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.matched_principal_trade_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.esma_standard_deferral_flags[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.negotiation_trade_flag[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.esma_supplementary_deferral_flags[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> wire[at] = mifid_ii_trade_report_message_record.trading_system[mifid_ii_trade_report_message_at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mifid Ii Trade Report Message off the wire, 533 bytes from where the cursor stands */
inline decode_mifid_ii_trade_report_message(mifid_ii_trade_report_message_record) {
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.timestamp[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.instrument[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 52 -> mifid_ii_trade_report_message_record.transaction_identification_code[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.total_number_of_transactions[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> mifid_ii_trade_report_message_record.reserved_8[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 2 -> mifid_ii_trade_report_message_record.source_venue[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.price[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.quantity[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> mifid_ii_trade_report_message_record.trading_date_and_time[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.instrument_identification_code_type[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 12 -> mifid_ii_trade_report_message_record.instrument_identification_code[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.price_notation[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> mifid_ii_trade_report_message_record.price_major_currency_price_currency[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.notional_amount[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> mifid_ii_trade_report_message_record.notional_currency[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.venue_of_execution[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> mifid_ii_trade_report_message_record.publication_date_and_time[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.benchmark_transaction_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.agency_cross_trade_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.non_price_forming_transactions_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.non_price_contribution_to_discovery[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.special_dividend_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.pt_deferral_reason_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.reference_price_transaction_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_liquidity_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_price_conditions_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.algo_transaction_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.pt_illiquid_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.price_improvement_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.cancellation_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.amendment_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.duplicate_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.exchange_for_physicals_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.limited_details_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.ld_full_details_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.daily_aggregated_transaction_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.da_full_details_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.volume_omission_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.vo_full_details_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.four_weeks_aggregation_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.fa_full_details_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.indefinite_aggregation_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.volume_omission_for_sovereign_debt_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.consecutive_aggregation_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.reserved_1 = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.venue_type = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.venue_book_definition_id = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 25 -> mifid_ii_trade_report_message_record.notation_of_the_quantity_in_measurement_unit[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.quantity_in_measurement_unit[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.transaction_to_be_cleared = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.emission_allowance_type[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.venue_of_publication[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_record.market_mechanism = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.trading_mode = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.transaction_category = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.negotiation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.agency_cross_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.modification_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.reference_price_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.special_dividend_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.off_book_automated_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.price_formation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.algorithmic_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.post_trade_deferral_reason = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.deferral_enrichment_type = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_record.duplicative_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.third_country_trading_venue_of_execution[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.portfolio_transaction_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.contingent_transaction_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.missing_price_price_conditions[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.market_closing_price_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_large_in_scale_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.nt_pre_trade_transparency_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> mifid_ii_trade_report_message_record.effective_date_of_the_contract[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> mifid_ii_trade_report_message_record.maturity_date_of_the_contract[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.spread[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.upfront_payment[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> mifid_ii_trade_report_message_record.lei_of_clearing_house[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.matched_principal_trade_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.esma_standard_deferral_flags[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.negotiation_trade_flag[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.esma_supplementary_deferral_flags[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> mifid_ii_trade_report_message_record.trading_system[mifid_ii_trade_report_message_at] = wire[at]; at = at + 1; mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mifid Ii Trade Report Message is what was written, byte for byte */
inline equal_mifid_ii_trade_report_message(mifid_ii_trade_report_message_read, mifid_ii_trade_report_message_written) {
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> assert(mifid_ii_trade_report_message_read.timestamp[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.timestamp[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> assert(mifid_ii_trade_report_message_read.instrument[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.instrument[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 52 -> assert(mifid_ii_trade_report_message_read.transaction_identification_code[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.transaction_identification_code[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.total_number_of_transactions[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.total_number_of_transactions[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 8 -> assert(mifid_ii_trade_report_message_read.reserved_8[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.reserved_8[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 2 -> assert(mifid_ii_trade_report_message_read.source_venue[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.source_venue[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> assert(mifid_ii_trade_report_message_read.price[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.price[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> assert(mifid_ii_trade_report_message_read.quantity[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.quantity[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> assert(mifid_ii_trade_report_message_read.trading_date_and_time[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.trading_date_and_time[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.instrument_identification_code_type[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.instrument_identification_code_type[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 12 -> assert(mifid_ii_trade_report_message_read.instrument_identification_code[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.instrument_identification_code[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.price_notation[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.price_notation[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> assert(mifid_ii_trade_report_message_read.price_major_currency_price_currency[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.price_major_currency_price_currency[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> assert(mifid_ii_trade_report_message_read.notional_amount[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.notional_amount[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 3 -> assert(mifid_ii_trade_report_message_read.notional_currency[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.notional_currency[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.venue_of_execution[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.venue_of_execution[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 27 -> assert(mifid_ii_trade_report_message_read.publication_date_and_time[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.publication_date_and_time[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.benchmark_transaction_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.benchmark_transaction_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.agency_cross_trade_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.agency_cross_trade_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.non_price_forming_transactions_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.non_price_forming_transactions_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.non_price_contribution_to_discovery[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.non_price_contribution_to_discovery[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.special_dividend_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.special_dividend_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.pt_deferral_reason_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.pt_deferral_reason_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.reference_price_transaction_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.reference_price_transaction_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.nt_liquidity_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.nt_liquidity_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.nt_price_conditions_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.nt_price_conditions_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.algo_transaction_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.algo_transaction_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.pt_illiquid_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.pt_illiquid_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.price_improvement_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.price_improvement_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.cancellation_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.cancellation_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.amendment_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.amendment_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.duplicate_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.duplicate_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.exchange_for_physicals_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.exchange_for_physicals_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.limited_details_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.limited_details_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.ld_full_details_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.ld_full_details_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.daily_aggregated_transaction_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.daily_aggregated_transaction_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.da_full_details_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.da_full_details_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.volume_omission_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.volume_omission_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.vo_full_details_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.vo_full_details_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.four_weeks_aggregation_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.four_weeks_aggregation_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.fa_full_details_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.fa_full_details_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.indefinite_aggregation_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.indefinite_aggregation_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.volume_omission_for_sovereign_debt_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.volume_omission_for_sovereign_debt_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.consecutive_aggregation_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.consecutive_aggregation_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_report_message_read.reserved_1 == mifid_ii_trade_report_message_written.reserved_1);
  assert(mifid_ii_trade_report_message_read.venue_type == mifid_ii_trade_report_message_written.venue_type);
  assert(mifid_ii_trade_report_message_read.venue_book_definition_id == mifid_ii_trade_report_message_written.venue_book_definition_id);
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 25 -> assert(mifid_ii_trade_report_message_read.notation_of_the_quantity_in_measurement_unit[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.notation_of_the_quantity_in_measurement_unit[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> assert(mifid_ii_trade_report_message_read.quantity_in_measurement_unit[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.quantity_in_measurement_unit[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_report_message_read.transaction_to_be_cleared == mifid_ii_trade_report_message_written.transaction_to_be_cleared);
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.emission_allowance_type[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.emission_allowance_type[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.venue_of_publication[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.venue_of_publication[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_report_message_read.market_mechanism == mifid_ii_trade_report_message_written.market_mechanism);
  assert(mifid_ii_trade_report_message_read.trading_mode == mifid_ii_trade_report_message_written.trading_mode);
  assert(mifid_ii_trade_report_message_read.transaction_category == mifid_ii_trade_report_message_written.transaction_category);
  assert(mifid_ii_trade_report_message_read.negotiation_indicator == mifid_ii_trade_report_message_written.negotiation_indicator);
  assert(mifid_ii_trade_report_message_read.agency_cross_indicator == mifid_ii_trade_report_message_written.agency_cross_indicator);
  assert(mifid_ii_trade_report_message_read.modification_indicator == mifid_ii_trade_report_message_written.modification_indicator);
  assert(mifid_ii_trade_report_message_read.reference_price_indicator == mifid_ii_trade_report_message_written.reference_price_indicator);
  assert(mifid_ii_trade_report_message_read.special_dividend_indicator == mifid_ii_trade_report_message_written.special_dividend_indicator);
  assert(mifid_ii_trade_report_message_read.off_book_automated_indicator == mifid_ii_trade_report_message_written.off_book_automated_indicator);
  assert(mifid_ii_trade_report_message_read.price_formation_indicator == mifid_ii_trade_report_message_written.price_formation_indicator);
  assert(mifid_ii_trade_report_message_read.algorithmic_indicator == mifid_ii_trade_report_message_written.algorithmic_indicator);
  assert(mifid_ii_trade_report_message_read.post_trade_deferral_reason == mifid_ii_trade_report_message_written.post_trade_deferral_reason);
  assert(mifid_ii_trade_report_message_read.deferral_enrichment_type == mifid_ii_trade_report_message_written.deferral_enrichment_type);
  assert(mifid_ii_trade_report_message_read.duplicative_indicator == mifid_ii_trade_report_message_written.duplicative_indicator);
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.third_country_trading_venue_of_execution[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.third_country_trading_venue_of_execution[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.portfolio_transaction_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.portfolio_transaction_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.contingent_transaction_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.contingent_transaction_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.missing_price_price_conditions[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.missing_price_price_conditions[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.market_closing_price_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.market_closing_price_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.nt_large_in_scale_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.nt_large_in_scale_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.nt_pre_trade_transparency_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.nt_pre_trade_transparency_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> assert(mifid_ii_trade_report_message_read.effective_date_of_the_contract[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.effective_date_of_the_contract[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 10 -> assert(mifid_ii_trade_report_message_read.maturity_date_of_the_contract[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.maturity_date_of_the_contract[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> assert(mifid_ii_trade_report_message_read.spread[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.spread[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> assert(mifid_ii_trade_report_message_read.upfront_payment[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.upfront_payment[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 20 -> assert(mifid_ii_trade_report_message_read.lei_of_clearing_house[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.lei_of_clearing_house[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.matched_principal_trade_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.matched_principal_trade_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.esma_standard_deferral_flags[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.esma_standard_deferral_flags[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.negotiation_trade_flag[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.negotiation_trade_flag[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.esma_supplementary_deferral_flags[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.esma_supplementary_deferral_flags[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_report_message_at = 0;
  do
  :: mifid_ii_trade_report_message_at < 4 -> assert(mifid_ii_trade_report_message_read.trading_system[mifid_ii_trade_report_message_at] == mifid_ii_trade_report_message_written.trading_system[mifid_ii_trade_report_message_at]); mifid_ii_trade_report_message_at = mifid_ii_trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Unit Header: encoded, read back, and compared */
proctype check_unit_header() {
  UnitHeader unit_header_sent;
  UnitHeader unit_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_header(unit_header_sent, 0)
  :: pattern == 1 -> fill_unit_header(unit_header_sent, 32)
  :: pattern == 2 -> fill_unit_header(unit_header_sent, 255)
  :: else -> ramp_unit_header(unit_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_header(unit_header_sent);
    assert(at == 8);
    at = 0;
    decode_unit_header(unit_header_got);
    assert(at == 8);
    equal_unit_header(unit_header_got, unit_header_sent)
  }
}

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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
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
    assert(at == 8);
    at = 0;
    decode_login_request_message(login_request_message_got);
    assert(at == 8);
    equal_login_request_message(login_request_message_got, login_request_message_sent)
  }
}

/* Recovery Request Message: encoded, read back, and compared */
proctype check_recovery_request_message() {
  RecoveryRequestMessage recovery_request_message_sent;
  RecoveryRequestMessage recovery_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_recovery_request_message(recovery_request_message_sent, 0)
  :: pattern == 1 -> fill_recovery_request_message(recovery_request_message_sent, 32)
  :: pattern == 2 -> fill_recovery_request_message(recovery_request_message_sent, 255)
  :: else -> ramp_recovery_request_message(recovery_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_recovery_request_message(recovery_request_message_sent);
    assert(at == 27);
    at = 0;
    decode_recovery_request_message(recovery_request_message_got);
    assert(at == 27);
    equal_recovery_request_message(recovery_request_message_got, recovery_request_message_sent)
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
    assert(at == 1);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 1);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
  }
}

/* Recovery Response Message: encoded, read back, and compared */
proctype check_recovery_response_message() {
  RecoveryResponseMessage recovery_response_message_sent;
  RecoveryResponseMessage recovery_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_recovery_response_message(recovery_response_message_sent, 0)
  :: pattern == 1 -> fill_recovery_response_message(recovery_response_message_sent, 32)
  :: pattern == 2 -> fill_recovery_response_message(recovery_response_message_sent, 255)
  :: else -> ramp_recovery_response_message(recovery_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_recovery_response_message(recovery_response_message_sent);
    assert(at == 13);
    at = 0;
    decode_recovery_response_message(recovery_response_message_got);
    assert(at == 13);
    equal_recovery_response_message(recovery_response_message_got, recovery_response_message_sent)
  }
}

/* Replay And Recovery Complete Message: encoded, read back, and compared */
proctype check_replay_and_recovery_complete_message() {
  ReplayAndRecoveryCompleteMessage replay_and_recovery_complete_message_sent;
  ReplayAndRecoveryCompleteMessage replay_and_recovery_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_and_recovery_complete_message(replay_and_recovery_complete_message_sent, 0)
  :: pattern == 1 -> fill_replay_and_recovery_complete_message(replay_and_recovery_complete_message_sent, 32)
  :: pattern == 2 -> fill_replay_and_recovery_complete_message(replay_and_recovery_complete_message_sent, 255)
  :: else -> ramp_replay_and_recovery_complete_message(replay_and_recovery_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_and_recovery_complete_message(replay_and_recovery_complete_message_sent);
    assert(at == 5);
    at = 0;
    decode_replay_and_recovery_complete_message(replay_and_recovery_complete_message_got);
    assert(at == 5);
    equal_replay_and_recovery_complete_message(replay_and_recovery_complete_message_got, replay_and_recovery_complete_message_sent)
  }
}

/* System Event Message: encoded, read back, and compared */
proctype check_system_event_message() {
  SystemEventMessage system_event_message_sent;
  SystemEventMessage system_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_message(system_event_message_sent, 0)
  :: pattern == 1 -> fill_system_event_message(system_event_message_sent, 32)
  :: pattern == 2 -> fill_system_event_message(system_event_message_sent, 255)
  :: else -> ramp_system_event_message(system_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_message(system_event_message_sent);
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Instrument Status Message: encoded, read back, and compared */
proctype check_instrument_status_message() {
  InstrumentStatusMessage instrument_status_message_sent;
  InstrumentStatusMessage instrument_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_status_message(instrument_status_message_sent, 0)
  :: pattern == 1 -> fill_instrument_status_message(instrument_status_message_sent, 32)
  :: pattern == 2 -> fill_instrument_status_message(instrument_status_message_sent, 255)
  :: else -> ramp_instrument_status_message(instrument_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_status_message(instrument_status_message_sent);
    assert(at == 27);
    at = 0;
    decode_instrument_status_message(instrument_status_message_got);
    assert(at == 27);
    equal_instrument_status_message(instrument_status_message_got, instrument_status_message_sent)
  }
}

/* Statistics Snapshot Message: encoded, read back, and compared */
proctype check_statistics_snapshot_message() {
  StatisticsSnapshotMessage statistics_snapshot_message_sent;
  StatisticsSnapshotMessage statistics_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_snapshot_message(statistics_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_statistics_snapshot_message(statistics_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_statistics_snapshot_message(statistics_snapshot_message_sent, 255)
  :: else -> ramp_statistics_snapshot_message(statistics_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_snapshot_message(statistics_snapshot_message_sent);
    assert(at == 270);
    at = 0;
    decode_statistics_snapshot_message(statistics_snapshot_message_got);
    assert(at == 270);
    equal_statistics_snapshot_message(statistics_snapshot_message_got, statistics_snapshot_message_sent)
  }
}

/* Mifid Ii Trade Report Message: encoded, read back, and compared */
proctype check_mifid_ii_trade_report_message() {
  MifidIiTradeReportMessage mifid_ii_trade_report_message_sent;
  MifidIiTradeReportMessage mifid_ii_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mifid_ii_trade_report_message(mifid_ii_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_mifid_ii_trade_report_message(mifid_ii_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_mifid_ii_trade_report_message(mifid_ii_trade_report_message_sent, 255)
  :: else -> ramp_mifid_ii_trade_report_message(mifid_ii_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mifid_ii_trade_report_message(mifid_ii_trade_report_message_sent);
    assert(at == 533);
    at = 0;
    decode_mifid_ii_trade_report_message(mifid_ii_trade_report_message_got);
    assert(at == 533);
    equal_mifid_ii_trade_report_message(mifid_ii_trade_report_message_got, mifid_ii_trade_report_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_unit_header()
  :: run check_message_header()
  :: run check_login_request_message()
  :: run check_recovery_request_message()
  :: run check_login_response_message()
  :: run check_recovery_response_message()
  :: run check_replay_and_recovery_complete_message()
  :: run check_system_event_message()
  :: run check_instrument_status_message()
  :: run check_statistics_snapshot_message()
  :: run check_mifid_ii_trade_report_message()
  fi
}
