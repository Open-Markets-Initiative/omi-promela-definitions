/*
 * London Stock Exchange 
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
#define WIRE 16

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Unit Header: 8 bytes ---------------------------------------------------- */

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

/* ---- Message Header: 2 bytes ------------------------------------------------- */

/* Mitch Tcp Message Header */
typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Login Request Message: 16 bytes ----------------------------------------- */

/* Used by the client to log in to the recovery channel. */
typedef LoginRequestMessage {
  byte username[6];
  byte password[10]
};

int login_request_message_at;

/* every byte of Login Request Message set to one value */
inline fill_login_request_message(login_request_message_record, login_request_message_value) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 6 -> login_request_message_record.username[login_request_message_at] = login_request_message_value; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 10 -> login_request_message_record.password[login_request_message_at] = login_request_message_value; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_message(login_request_message_record, login_request_message_base) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 6 -> login_request_message_record.username[login_request_message_at] = (login_request_message_base + 0 + login_request_message_at + 1) % 256; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 10 -> login_request_message_record.password[login_request_message_at] = (login_request_message_base + 6 + login_request_message_at + 1) % 256; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 6 -> wire[at] = login_request_message_record.username[login_request_message_at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 10 -> wire[at] = login_request_message_record.password[login_request_message_at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 6 -> login_request_message_record.username[login_request_message_at] = wire[at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 10 -> login_request_message_record.password[login_request_message_at] = wire[at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Message is what was written, byte for byte */
inline equal_login_request_message(login_request_message_read, login_request_message_written) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 6 -> assert(login_request_message_read.username[login_request_message_at] == login_request_message_written.username[login_request_message_at]); login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 10 -> assert(login_request_message_read.password[login_request_message_at] == login_request_message_written.password[login_request_message_at]); login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* Used by the server to accept or reject a login request. */
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

/* ---- Snapshot Request Message: 14 bytes -------------------------------------- */

/* Used by the client to request a snapshot of the order book for a segment or an instrument. */
typedef SnapshotRequestMessage {
  byte sequence_number[4];
  byte segment[6];
  byte instrument_id[4]
};

int snapshot_request_message_at;

/* every byte of Snapshot Request Message set to one value */
inline fill_snapshot_request_message(snapshot_request_message_record, snapshot_request_message_value) {
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.sequence_number[snapshot_request_message_at] = snapshot_request_message_value; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 6 -> snapshot_request_message_record.segment[snapshot_request_message_at] = snapshot_request_message_value; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.instrument_id[snapshot_request_message_at] = snapshot_request_message_value; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Request Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_request_message(snapshot_request_message_record, snapshot_request_message_base) {
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.sequence_number[snapshot_request_message_at] = (snapshot_request_message_base + 0 + snapshot_request_message_at + 1) % 256; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 6 -> snapshot_request_message_record.segment[snapshot_request_message_at] = (snapshot_request_message_base + 4 + snapshot_request_message_at + 1) % 256; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.instrument_id[snapshot_request_message_at] = (snapshot_request_message_base + 10 + snapshot_request_message_at + 1) % 256; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Request Message to the wire, 14 bytes from where the cursor stands */
inline encode_snapshot_request_message(snapshot_request_message_record) {
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> wire[at] = snapshot_request_message_record.sequence_number[snapshot_request_message_at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 6 -> wire[at] = snapshot_request_message_record.segment[snapshot_request_message_at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> wire[at] = snapshot_request_message_record.instrument_id[snapshot_request_message_at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Request Message off the wire, 14 bytes from where the cursor stands */
inline decode_snapshot_request_message(snapshot_request_message_record) {
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.sequence_number[snapshot_request_message_at] = wire[at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 6 -> snapshot_request_message_record.segment[snapshot_request_message_at] = wire[at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.instrument_id[snapshot_request_message_at] = wire[at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Request Message is what was written, byte for byte */
inline equal_snapshot_request_message(snapshot_request_message_read, snapshot_request_message_written) {
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> assert(snapshot_request_message_read.sequence_number[snapshot_request_message_at] == snapshot_request_message_written.sequence_number[snapshot_request_message_at]); snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 6 -> assert(snapshot_request_message_read.segment[snapshot_request_message_at] == snapshot_request_message_written.segment[snapshot_request_message_at]); snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> assert(snapshot_request_message_read.instrument_id[snapshot_request_message_at] == snapshot_request_message_written.instrument_id[snapshot_request_message_at]); snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Response Message: 9 bytes -------------------------------------- */

/* Used by the server to accept or reject a snapshot request. */
typedef SnapshotResponseMessage {
  byte sequence_number[4];
  byte order_count[4];
  byte snapshot_status
};

int snapshot_response_message_at;

/* every byte of Snapshot Response Message set to one value */
inline fill_snapshot_response_message(snapshot_response_message_record, snapshot_response_message_value) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.sequence_number[snapshot_response_message_at] = snapshot_response_message_value; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.order_count[snapshot_response_message_at] = snapshot_response_message_value; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_record.snapshot_status = snapshot_response_message_value;
  skip
}

/* each byte of Snapshot Response Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_response_message(snapshot_response_message_record, snapshot_response_message_base) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.sequence_number[snapshot_response_message_at] = (snapshot_response_message_base + 0 + snapshot_response_message_at + 1) % 256; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.order_count[snapshot_response_message_at] = (snapshot_response_message_base + 4 + snapshot_response_message_at + 1) % 256; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_record.snapshot_status = (snapshot_response_message_base + 8 + 1) % 256;
  skip
}

/* Snapshot Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_snapshot_response_message(snapshot_response_message_record) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> wire[at] = snapshot_response_message_record.sequence_number[snapshot_response_message_at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> wire[at] = snapshot_response_message_record.order_count[snapshot_response_message_at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  wire[at] = snapshot_response_message_record.snapshot_status; at = at + 1;
  skip
}

/* Snapshot Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_snapshot_response_message(snapshot_response_message_record) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.sequence_number[snapshot_response_message_at] = wire[at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.order_count[snapshot_response_message_at] = wire[at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_record.snapshot_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Snapshot Response Message is what was written, byte for byte */
inline equal_snapshot_response_message(snapshot_response_message_read, snapshot_response_message_written) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> assert(snapshot_response_message_read.sequence_number[snapshot_response_message_at] == snapshot_response_message_written.sequence_number[snapshot_response_message_at]); snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> assert(snapshot_response_message_read.order_count[snapshot_response_message_at] == snapshot_response_message_written.order_count[snapshot_response_message_at]); snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  assert(snapshot_response_message_read.snapshot_status == snapshot_response_message_written.snapshot_status);
  skip
}

/* ---- Time Message: 4 bytes --------------------------------------------------- */

/* Sent by the server for every second for which at least one application message is generated. */
typedef TimeMessage {
  byte seconds[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.seconds[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.seconds[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.seconds[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.seconds[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.seconds[time_message_at] == time_message_written.seconds[time_message_at]); time_message_at = time_message_at + 1
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
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
    assert(at == 16);
    at = 0;
    decode_login_request_message(login_request_message_got);
    assert(at == 16);
    equal_login_request_message(login_request_message_got, login_request_message_sent)
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

/* Snapshot Request Message: encoded, read back, and compared */
proctype check_snapshot_request_message() {
  SnapshotRequestMessage snapshot_request_message_sent;
  SnapshotRequestMessage snapshot_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_request_message(snapshot_request_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_request_message(snapshot_request_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_request_message(snapshot_request_message_sent, 255)
  :: else -> ramp_snapshot_request_message(snapshot_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_request_message(snapshot_request_message_sent);
    assert(at == 14);
    at = 0;
    decode_snapshot_request_message(snapshot_request_message_got);
    assert(at == 14);
    equal_snapshot_request_message(snapshot_request_message_got, snapshot_request_message_sent)
  }
}

/* Snapshot Response Message: encoded, read back, and compared */
proctype check_snapshot_response_message() {
  SnapshotResponseMessage snapshot_response_message_sent;
  SnapshotResponseMessage snapshot_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_response_message(snapshot_response_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_response_message(snapshot_response_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_response_message(snapshot_response_message_sent, 255)
  :: else -> ramp_snapshot_response_message(snapshot_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_response_message(snapshot_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_snapshot_response_message(snapshot_response_message_got);
    assert(at == 9);
    equal_snapshot_response_message(snapshot_response_message_got, snapshot_response_message_sent)
  }
}

/* Time Message: encoded, read back, and compared */
proctype check_time_message() {
  TimeMessage time_message_sent;
  TimeMessage time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_message(time_message_sent, 0)
  :: pattern == 1 -> fill_time_message(time_message_sent, 32)
  :: pattern == 2 -> fill_time_message(time_message_sent, 255)
  :: else -> ramp_time_message(time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_message(time_message_sent);
    assert(at == 4);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 4);
    equal_time_message(time_message_got, time_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_unit_header()
  :: run check_message_header()
  :: run check_login_request_message()
  :: run check_login_response_message()
  :: run check_snapshot_request_message()
  :: run check_snapshot_response_message()
  :: run check_time_message()
  fi
}
