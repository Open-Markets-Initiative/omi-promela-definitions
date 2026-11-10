/*
 * JSE Limited Market Data
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 1063

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Unit Header: 8 bytes ---------------------------------------------------- */

/* Jse Mitch Udp Unit Header */
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

/* Jse Mitch Udp Message Header */
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

/* ---- Login Request Message: 16 bytes ----------------------------------------- */

/* Sent by the client to log in to the market data gateway. */
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

/* ---- Replay Request Message: 7 bytes ----------------------------------------- */

/* Sent by the client on the replay channel to request retransmission of a range of messages. */
typedef ReplayRequestMessage {
  byte market_data_group;
  byte first_message[4];
  byte count[2]
};

int replay_request_message_at;

/* every byte of Replay Request Message set to one value */
inline fill_replay_request_message(replay_request_message_record, replay_request_message_value) {
  replay_request_message_record.market_data_group = replay_request_message_value;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.first_message[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 2 -> replay_request_message_record.count[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Request Message set to where it lies, so a field read out of place says so */
inline ramp_replay_request_message(replay_request_message_record, replay_request_message_base) {
  replay_request_message_record.market_data_group = (replay_request_message_base + 0 + 1) % 256;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.first_message[replay_request_message_at] = (replay_request_message_base + 1 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 2 -> replay_request_message_record.count[replay_request_message_at] = (replay_request_message_base + 5 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message to the wire, 7 bytes from where the cursor stands */
inline encode_replay_request_message(replay_request_message_record) {
  wire[at] = replay_request_message_record.market_data_group; at = at + 1;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.first_message[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 2 -> wire[at] = replay_request_message_record.count[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message off the wire, 7 bytes from where the cursor stands */
inline decode_replay_request_message(replay_request_message_record) {
  replay_request_message_record.market_data_group = wire[at]; at = at + 1;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.first_message[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 2 -> replay_request_message_record.count[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Request Message is what was written, byte for byte */
inline equal_replay_request_message(replay_request_message_read, replay_request_message_written) {
  assert(replay_request_message_read.market_data_group == replay_request_message_written.market_data_group);
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.first_message[replay_request_message_at] == replay_request_message_written.first_message[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 2 -> assert(replay_request_message_read.count[replay_request_message_at] == replay_request_message_written.count[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* Sent by the server in response to a Login Request. */
typedef LoginResponseMessage {
  byte status
};

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.status = (login_response_message_base + 0 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.status == login_response_message_written.status);
  skip
}

/* ---- Replay Response Message: 8 bytes ---------------------------------------- */

/* Sent by the server in response to a Replay Request. */
typedef ReplayResponseMessage {
  byte market_data_group;
  byte first_message[4];
  byte count[2];
  byte status
};

int replay_response_message_at;

/* every byte of Replay Response Message set to one value */
inline fill_replay_response_message(replay_response_message_record, replay_response_message_value) {
  replay_response_message_record.market_data_group = replay_response_message_value;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.first_message[replay_response_message_at] = replay_response_message_value; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 2 -> replay_response_message_record.count[replay_response_message_at] = replay_response_message_value; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.status = replay_response_message_value;
  skip
}

/* each byte of Replay Response Message set to where it lies, so a field read out of place says so */
inline ramp_replay_response_message(replay_response_message_record, replay_response_message_base) {
  replay_response_message_record.market_data_group = (replay_response_message_base + 0 + 1) % 256;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.first_message[replay_response_message_at] = (replay_response_message_base + 1 + replay_response_message_at + 1) % 256; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 2 -> replay_response_message_record.count[replay_response_message_at] = (replay_response_message_base + 5 + replay_response_message_at + 1) % 256; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.status = (replay_response_message_base + 7 + 1) % 256;
  skip
}

/* Replay Response Message to the wire, 8 bytes from where the cursor stands */
inline encode_replay_response_message(replay_response_message_record) {
  wire[at] = replay_response_message_record.market_data_group; at = at + 1;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> wire[at] = replay_response_message_record.first_message[replay_response_message_at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 2 -> wire[at] = replay_response_message_record.count[replay_response_message_at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  wire[at] = replay_response_message_record.status; at = at + 1;
  skip
}

/* Replay Response Message off the wire, 8 bytes from where the cursor stands */
inline decode_replay_response_message(replay_response_message_record) {
  replay_response_message_record.market_data_group = wire[at]; at = at + 1;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.first_message[replay_response_message_at] = wire[at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 2 -> replay_response_message_record.count[replay_response_message_at] = wire[at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Replay Response Message is what was written, byte for byte */
inline equal_replay_response_message(replay_response_message_read, replay_response_message_written) {
  assert(replay_response_message_read.market_data_group == replay_response_message_written.market_data_group);
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> assert(replay_response_message_read.first_message[replay_response_message_at] == replay_response_message_written.first_message[replay_response_message_at]); replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 2 -> assert(replay_response_message_read.count[replay_response_message_at] == replay_response_message_written.count[replay_response_message_at]); replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  assert(replay_response_message_read.status == replay_response_message_written.status);
  skip
}

/* ---- Snapshot Response Message: 14 bytes ------------------------------------- */

/* Sent by the server in response to a Snapshot Request. */
typedef SnapshotResponseMessage {
  byte sequence_number[4];
  byte order_count[4];
  byte status;
  byte snapshot_type;
  byte request_id[4]
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
  snapshot_response_message_record.status = snapshot_response_message_value;
  snapshot_response_message_record.snapshot_type = snapshot_response_message_value;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.request_id[snapshot_response_message_at] = snapshot_response_message_value; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
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
  snapshot_response_message_record.status = (snapshot_response_message_base + 8 + 1) % 256;
  snapshot_response_message_record.snapshot_type = (snapshot_response_message_base + 9 + 1) % 256;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.request_id[snapshot_response_message_at] = (snapshot_response_message_base + 10 + snapshot_response_message_at + 1) % 256; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Response Message to the wire, 14 bytes from where the cursor stands */
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
  wire[at] = snapshot_response_message_record.status; at = at + 1;
  wire[at] = snapshot_response_message_record.snapshot_type; at = at + 1;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> wire[at] = snapshot_response_message_record.request_id[snapshot_response_message_at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Response Message off the wire, 14 bytes from where the cursor stands */
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
  snapshot_response_message_record.status = wire[at]; at = at + 1;
  snapshot_response_message_record.snapshot_type = wire[at]; at = at + 1;
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.request_id[snapshot_response_message_at] = wire[at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
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
  assert(snapshot_response_message_read.status == snapshot_response_message_written.status);
  assert(snapshot_response_message_read.snapshot_type == snapshot_response_message_written.snapshot_type);
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> assert(snapshot_response_message_read.request_id[snapshot_response_message_at] == snapshot_response_message_written.request_id[snapshot_response_message_at]); snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Time Message: 4 bytes --------------------------------------------------- */

/* Sent for every second in which at least one application message is generated. All subsequent messages carry a nanosecond offset from this time. */
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

/* ---- System Event Message: 5 bytes ------------------------------------------- */

/* Sent to signal the start and end of the trading day. */
typedef SystemEventMessage {
  byte nanosecond[4];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanosecond[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanosecond[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 4 + 1) % 256;
  skip
}

/* System Event Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanosecond[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanosecond[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.nanosecond[system_event_message_at] == system_event_message_written.nanosecond[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Order Deleted Message: 12 bytes ----------------------------------------- */

/* Sent when an order is removed from the order book. */
typedef OrderDeletedMessage {
  byte nanosecond[4];
  byte order_id[8]
};

int order_deleted_message_at;

/* every byte of Order Deleted Message set to one value */
inline fill_order_deleted_message(order_deleted_message_record, order_deleted_message_value) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanosecond[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_order_deleted_message(order_deleted_message_record, order_deleted_message_base) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanosecond[order_deleted_message_at] = (order_deleted_message_base + 0 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = (order_deleted_message_base + 4 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> wire[at] = order_deleted_message_record.nanosecond[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> wire[at] = order_deleted_message_record.order_id[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanosecond[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Deleted Message is what was written, byte for byte */
inline equal_order_deleted_message(order_deleted_message_read, order_deleted_message_written) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> assert(order_deleted_message_read.nanosecond[order_deleted_message_at] == order_deleted_message_written.nanosecond[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> assert(order_deleted_message_read.order_id[order_deleted_message_at] == order_deleted_message_written.order_id[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Clear Message: 10 bytes -------------------------------------- */

/* Sent to instruct the recipient to discard every order held for an instrument on the named book. */
typedef OrderBookClearMessage {
  byte nanosecond[4];
  byte instrument_id[4];
  byte sub_book;
  byte book_level
};

int order_book_clear_message_at;

/* every byte of Order Book Clear Message set to one value */
inline fill_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_value) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.nanosecond[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.instrument_id[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.sub_book = order_book_clear_message_value;
  order_book_clear_message_record.book_level = order_book_clear_message_value;
  skip
}

/* each byte of Order Book Clear Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_base) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.nanosecond[order_book_clear_message_at] = (order_book_clear_message_base + 0 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.instrument_id[order_book_clear_message_at] = (order_book_clear_message_base + 4 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.sub_book = (order_book_clear_message_base + 8 + 1) % 256;
  order_book_clear_message_record.book_level = (order_book_clear_message_base + 9 + 1) % 256;
  skip
}

/* Order Book Clear Message to the wire, 10 bytes from where the cursor stands */
inline encode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> wire[at] = order_book_clear_message_record.nanosecond[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> wire[at] = order_book_clear_message_record.instrument_id[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_clear_message_record.sub_book; at = at + 1;
  wire[at] = order_book_clear_message_record.book_level; at = at + 1;
  skip
}

/* Order Book Clear Message off the wire, 10 bytes from where the cursor stands */
inline decode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.nanosecond[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.instrument_id[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.sub_book = wire[at]; at = at + 1;
  order_book_clear_message_record.book_level = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Clear Message is what was written, byte for byte */
inline equal_order_book_clear_message(order_book_clear_message_read, order_book_clear_message_written) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> assert(order_book_clear_message_read.nanosecond[order_book_clear_message_at] == order_book_clear_message_written.nanosecond[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> assert(order_book_clear_message_read.instrument_id[order_book_clear_message_at] == order_book_clear_message_written.instrument_id[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  assert(order_book_clear_message_read.sub_book == order_book_clear_message_written.sub_book);
  assert(order_book_clear_message_read.book_level == order_book_clear_message_written.book_level);
  skip
}

/* ---- Order Executed Message: 52 bytes ---------------------------------------- */

/* Sent when an order on the book executes in full or in part at its display price. */
typedef OrderExecutedMessage {
  byte nanosecond[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte trade_id[8];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8];
  byte venue_of_execution[4]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanosecond[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.last_opt_px[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.volatility[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.underlying_reference_price[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.venue_of_execution[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanosecond[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_id[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.last_opt_px[order_executed_message_at] = (order_executed_message_base + 24 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.volatility[order_executed_message_at] = (order_executed_message_base + 32 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.underlying_reference_price[order_executed_message_at] = (order_executed_message_base + 40 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.venue_of_execution[order_executed_message_at] = (order_executed_message_base + 48 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 52 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanosecond[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.trade_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.last_opt_px[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.volatility[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.underlying_reference_price[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.venue_of_execution[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 52 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanosecond[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.last_opt_px[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.volatility[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.underlying_reference_price[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.venue_of_execution[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.nanosecond[order_executed_message_at] == order_executed_message_written.nanosecond[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.trade_id[order_executed_message_at] == order_executed_message_written.trade_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.last_opt_px[order_executed_message_at] == order_executed_message_written.last_opt_px[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.volatility[order_executed_message_at] == order_executed_message_written.volatility[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.underlying_reference_price[order_executed_message_at] == order_executed_message_written.underlying_reference_price[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.venue_of_execution[order_executed_message_at] == order_executed_message_written.venue_of_execution[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Size Message: 65 bytes ------------------------ */

/* Sent when an order on the book executes at a price other than its display price, or when the execution is not printable. */
typedef OrderExecutedWithPriceSizeMessage {
  byte nanosecond[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte display_quantity[4];
  byte trade_id[8];
  byte printable;
  byte price[8];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8];
  byte venue_of_execution[4]
};

int order_executed_with_price_size_message_at;

/* every byte of Order Executed With Price Size Message set to one value */
inline fill_order_executed_with_price_size_message(order_executed_with_price_size_message_record, order_executed_with_price_size_message_value) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.trade_id[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_record.printable = order_executed_with_price_size_message_value;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.last_opt_px[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.volatility[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.underlying_reference_price[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.venue_of_execution[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed With Price Size Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_size_message(order_executed_with_price_size_message_record, order_executed_with_price_size_message_base) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 0 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 4 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 12 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 16 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.trade_id[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 20 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_record.printable = (order_executed_with_price_size_message_base + 28 + 1) % 256;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 29 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.last_opt_px[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 37 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.volatility[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 45 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.underlying_reference_price[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 53 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.venue_of_execution[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 61 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Size Message to the wire, 65 bytes from where the cursor stands */
inline encode_order_executed_with_price_size_message(order_executed_with_price_size_message_record) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.trade_id[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_size_message_record.printable; at = at + 1;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.last_opt_px[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.volatility[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.underlying_reference_price[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.venue_of_execution[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Size Message off the wire, 65 bytes from where the cursor stands */
inline decode_order_executed_with_price_size_message(order_executed_with_price_size_message_record) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.trade_id[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_record.printable = wire[at]; at = at + 1;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.last_opt_px[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.volatility[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.underlying_reference_price[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.venue_of_execution[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed With Price Size Message is what was written, byte for byte */
inline equal_order_executed_with_price_size_message(order_executed_with_price_size_message_read, order_executed_with_price_size_message_written) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.nanosecond[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.nanosecond[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.order_id[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.order_id[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.executed_quantity[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.executed_quantity[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.display_quantity[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.display_quantity[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.trade_id[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.trade_id[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_size_message_read.printable == order_executed_with_price_size_message_written.printable);
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.price[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.price[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.last_opt_px[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.last_opt_px[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.volatility[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.volatility[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.underlying_reference_price[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.underlying_reference_price[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.venue_of_execution[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.venue_of_execution[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Trade Message: 67 bytes ----------------------------------------- */

/* Sent for a trade that results from an auction uncrossing. */
typedef AuctionTradeMessage {
  byte nanosecond[4];
  byte quantity[4];
  byte instrument_id[4];
  byte reserved_a;
  byte reserved_b;
  byte price[8];
  byte trade_id[8];
  byte auction_type;
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8];
  byte pt_cancellation_flag[4];
  byte pt_amendment_flag[4];
  byte venue_of_execution[4]
};

int auction_trade_message_at;

/* every byte of Auction Trade Message set to one value */
inline fill_auction_trade_message(auction_trade_message_record, auction_trade_message_value) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.nanosecond[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.quantity[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.instrument_id[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_record.reserved_a = auction_trade_message_value;
  auction_trade_message_record.reserved_b = auction_trade_message_value;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.trade_id[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_record.auction_type = auction_trade_message_value;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.last_opt_px[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.volatility[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.underlying_reference_price[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.pt_cancellation_flag[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.pt_amendment_flag[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.venue_of_execution[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Trade Message set to where it lies, so a field read out of place says so */
inline ramp_auction_trade_message(auction_trade_message_record, auction_trade_message_base) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.nanosecond[auction_trade_message_at] = (auction_trade_message_base + 0 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.quantity[auction_trade_message_at] = (auction_trade_message_base + 4 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.instrument_id[auction_trade_message_at] = (auction_trade_message_base + 8 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_record.reserved_a = (auction_trade_message_base + 12 + 1) % 256;
  auction_trade_message_record.reserved_b = (auction_trade_message_base + 13 + 1) % 256;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price[auction_trade_message_at] = (auction_trade_message_base + 14 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.trade_id[auction_trade_message_at] = (auction_trade_message_base + 22 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_record.auction_type = (auction_trade_message_base + 30 + 1) % 256;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.last_opt_px[auction_trade_message_at] = (auction_trade_message_base + 31 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.volatility[auction_trade_message_at] = (auction_trade_message_base + 39 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.underlying_reference_price[auction_trade_message_at] = (auction_trade_message_base + 47 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.pt_cancellation_flag[auction_trade_message_at] = (auction_trade_message_base + 55 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.pt_amendment_flag[auction_trade_message_at] = (auction_trade_message_base + 59 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.venue_of_execution[auction_trade_message_at] = (auction_trade_message_base + 63 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Trade Message to the wire, 67 bytes from where the cursor stands */
inline encode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.nanosecond[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.quantity[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.instrument_id[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_trade_message_record.reserved_a; at = at + 1;
  wire[at] = auction_trade_message_record.reserved_b; at = at + 1;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.price[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.trade_id[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_trade_message_record.auction_type; at = at + 1;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.last_opt_px[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.volatility[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> wire[at] = auction_trade_message_record.underlying_reference_price[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.pt_cancellation_flag[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.pt_amendment_flag[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.venue_of_execution[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Trade Message off the wire, 67 bytes from where the cursor stands */
inline decode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.nanosecond[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.quantity[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.instrument_id[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_record.reserved_a = wire[at]; at = at + 1;
  auction_trade_message_record.reserved_b = wire[at]; at = at + 1;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.price[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.trade_id[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_record.auction_type = wire[at]; at = at + 1;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.last_opt_px[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.volatility[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.underlying_reference_price[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.pt_cancellation_flag[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.pt_amendment_flag[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.venue_of_execution[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Trade Message is what was written, byte for byte */
inline equal_auction_trade_message(auction_trade_message_read, auction_trade_message_written) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.nanosecond[auction_trade_message_at] == auction_trade_message_written.nanosecond[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.quantity[auction_trade_message_at] == auction_trade_message_written.quantity[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.instrument_id[auction_trade_message_at] == auction_trade_message_written.instrument_id[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  assert(auction_trade_message_read.reserved_a == auction_trade_message_written.reserved_a);
  assert(auction_trade_message_read.reserved_b == auction_trade_message_written.reserved_b);
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.price[auction_trade_message_at] == auction_trade_message_written.price[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.trade_id[auction_trade_message_at] == auction_trade_message_written.trade_id[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  assert(auction_trade_message_read.auction_type == auction_trade_message_written.auction_type);
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.last_opt_px[auction_trade_message_at] == auction_trade_message_written.last_opt_px[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.volatility[auction_trade_message_at] == auction_trade_message_written.volatility[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> assert(auction_trade_message_read.underlying_reference_price[auction_trade_message_at] == auction_trade_message_written.underlying_reference_price[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.pt_cancellation_flag[auction_trade_message_at] == auction_trade_message_written.pt_cancellation_flag[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.pt_amendment_flag[auction_trade_message_at] == auction_trade_message_written.pt_amendment_flag[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.venue_of_execution[auction_trade_message_at] == auction_trade_message_written.venue_of_execution[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Off Book Trade Message: 78 bytes ---------------------------------------- */

/* Sent for a trade agreed away from the order book and reported to the exchange. */
typedef OffBookTradeMessage {
  byte nanosecond[4];
  byte executed_quantity[4];
  byte instrument_id[4];
  byte reserved_a;
  byte reserved_b;
  byte price[8];
  byte trade_id[8];
  byte off_book_trade_type[4];
  byte trade_time[8];
  byte trade_date[8];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8];
  byte pt_cancellation_flag[4]
};

int off_book_trade_message_at;

/* every byte of Off Book Trade Message set to one value */
inline fill_off_book_trade_message(off_book_trade_message_record, off_book_trade_message_value) {
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.nanosecond[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.executed_quantity[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.instrument_id[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_record.reserved_a = off_book_trade_message_value;
  off_book_trade_message_record.reserved_b = off_book_trade_message_value;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.price[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_id[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.off_book_trade_type[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_time[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_date[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.last_opt_px[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.volatility[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.underlying_reference_price[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.pt_cancellation_flag[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Off Book Trade Message set to where it lies, so a field read out of place says so */
inline ramp_off_book_trade_message(off_book_trade_message_record, off_book_trade_message_base) {
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.nanosecond[off_book_trade_message_at] = (off_book_trade_message_base + 0 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.executed_quantity[off_book_trade_message_at] = (off_book_trade_message_base + 4 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.instrument_id[off_book_trade_message_at] = (off_book_trade_message_base + 8 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_record.reserved_a = (off_book_trade_message_base + 12 + 1) % 256;
  off_book_trade_message_record.reserved_b = (off_book_trade_message_base + 13 + 1) % 256;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.price[off_book_trade_message_at] = (off_book_trade_message_base + 14 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_id[off_book_trade_message_at] = (off_book_trade_message_base + 22 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.off_book_trade_type[off_book_trade_message_at] = (off_book_trade_message_base + 30 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_time[off_book_trade_message_at] = (off_book_trade_message_base + 34 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_date[off_book_trade_message_at] = (off_book_trade_message_base + 42 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.last_opt_px[off_book_trade_message_at] = (off_book_trade_message_base + 50 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.volatility[off_book_trade_message_at] = (off_book_trade_message_base + 58 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.underlying_reference_price[off_book_trade_message_at] = (off_book_trade_message_base + 66 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.pt_cancellation_flag[off_book_trade_message_at] = (off_book_trade_message_base + 74 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Off Book Trade Message to the wire, 78 bytes from where the cursor stands */
inline encode_off_book_trade_message(off_book_trade_message_record) {
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> wire[at] = off_book_trade_message_record.nanosecond[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> wire[at] = off_book_trade_message_record.executed_quantity[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> wire[at] = off_book_trade_message_record.instrument_id[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = off_book_trade_message_record.reserved_a; at = at + 1;
  wire[at] = off_book_trade_message_record.reserved_b; at = at + 1;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> wire[at] = off_book_trade_message_record.price[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> wire[at] = off_book_trade_message_record.trade_id[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> wire[at] = off_book_trade_message_record.off_book_trade_type[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> wire[at] = off_book_trade_message_record.trade_time[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> wire[at] = off_book_trade_message_record.trade_date[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> wire[at] = off_book_trade_message_record.last_opt_px[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> wire[at] = off_book_trade_message_record.volatility[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> wire[at] = off_book_trade_message_record.underlying_reference_price[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> wire[at] = off_book_trade_message_record.pt_cancellation_flag[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Off Book Trade Message off the wire, 78 bytes from where the cursor stands */
inline decode_off_book_trade_message(off_book_trade_message_record) {
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.nanosecond[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.executed_quantity[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.instrument_id[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_record.reserved_a = wire[at]; at = at + 1;
  off_book_trade_message_record.reserved_b = wire[at]; at = at + 1;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.price[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_id[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.off_book_trade_type[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_time[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_date[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.last_opt_px[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.volatility[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.underlying_reference_price[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.pt_cancellation_flag[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Off Book Trade Message is what was written, byte for byte */
inline equal_off_book_trade_message(off_book_trade_message_read, off_book_trade_message_written) {
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> assert(off_book_trade_message_read.nanosecond[off_book_trade_message_at] == off_book_trade_message_written.nanosecond[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> assert(off_book_trade_message_read.executed_quantity[off_book_trade_message_at] == off_book_trade_message_written.executed_quantity[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> assert(off_book_trade_message_read.instrument_id[off_book_trade_message_at] == off_book_trade_message_written.instrument_id[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  assert(off_book_trade_message_read.reserved_a == off_book_trade_message_written.reserved_a);
  assert(off_book_trade_message_read.reserved_b == off_book_trade_message_written.reserved_b);
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> assert(off_book_trade_message_read.price[off_book_trade_message_at] == off_book_trade_message_written.price[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> assert(off_book_trade_message_read.trade_id[off_book_trade_message_at] == off_book_trade_message_written.trade_id[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> assert(off_book_trade_message_read.off_book_trade_type[off_book_trade_message_at] == off_book_trade_message_written.off_book_trade_type[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> assert(off_book_trade_message_read.trade_time[off_book_trade_message_at] == off_book_trade_message_written.trade_time[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> assert(off_book_trade_message_read.trade_date[off_book_trade_message_at] == off_book_trade_message_written.trade_date[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> assert(off_book_trade_message_read.last_opt_px[off_book_trade_message_at] == off_book_trade_message_written.last_opt_px[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> assert(off_book_trade_message_read.volatility[off_book_trade_message_at] == off_book_trade_message_written.volatility[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> assert(off_book_trade_message_read.underlying_reference_price[off_book_trade_message_at] == off_book_trade_message_written.underlying_reference_price[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> assert(off_book_trade_message_read.pt_cancellation_flag[off_book_trade_message_at] == off_book_trade_message_written.pt_cancellation_flag[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Info Message: 28 bytes ------------------------------------------ */

/* Disseminates the indicative price and paired quantity of an instrument in an auction call. */
typedef AuctionInfoMessage {
  byte nanosecond[4];
  byte paired_quantity[4];
  byte reserved_4[4];
  byte imbalance_direction;
  byte instrument_id[4];
  byte reserved_a;
  byte reserved_b;
  byte price[8];
  byte auction_type
};

int auction_info_message_at;

/* every byte of Auction Info Message set to one value */
inline fill_auction_info_message(auction_info_message_record, auction_info_message_value) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.nanosecond[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.paired_quantity[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.reserved_4[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.imbalance_direction = auction_info_message_value;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.instrument_id[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_a = auction_info_message_value;
  auction_info_message_record.reserved_b = auction_info_message_value;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> auction_info_message_record.price[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.auction_type = auction_info_message_value;
  skip
}

/* each byte of Auction Info Message set to where it lies, so a field read out of place says so */
inline ramp_auction_info_message(auction_info_message_record, auction_info_message_base) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.nanosecond[auction_info_message_at] = (auction_info_message_base + 0 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.paired_quantity[auction_info_message_at] = (auction_info_message_base + 4 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.reserved_4[auction_info_message_at] = (auction_info_message_base + 8 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.imbalance_direction = (auction_info_message_base + 12 + 1) % 256;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.instrument_id[auction_info_message_at] = (auction_info_message_base + 13 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_a = (auction_info_message_base + 17 + 1) % 256;
  auction_info_message_record.reserved_b = (auction_info_message_base + 18 + 1) % 256;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> auction_info_message_record.price[auction_info_message_at] = (auction_info_message_base + 19 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.auction_type = (auction_info_message_base + 27 + 1) % 256;
  skip
}

/* Auction Info Message to the wire, 28 bytes from where the cursor stands */
inline encode_auction_info_message(auction_info_message_record) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.nanosecond[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.paired_quantity[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.reserved_4[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.imbalance_direction; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.instrument_id[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.reserved_a; at = at + 1;
  wire[at] = auction_info_message_record.reserved_b; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> wire[at] = auction_info_message_record.price[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.auction_type; at = at + 1;
  skip
}

/* Auction Info Message off the wire, 28 bytes from where the cursor stands */
inline decode_auction_info_message(auction_info_message_record) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.nanosecond[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.paired_quantity[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.reserved_4[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.imbalance_direction = wire[at]; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.instrument_id[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_a = wire[at]; at = at + 1;
  auction_info_message_record.reserved_b = wire[at]; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> auction_info_message_record.price[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.auction_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Info Message is what was written, byte for byte */
inline equal_auction_info_message(auction_info_message_read, auction_info_message_written) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.nanosecond[auction_info_message_at] == auction_info_message_written.nanosecond[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.paired_quantity[auction_info_message_at] == auction_info_message_written.paired_quantity[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.reserved_4[auction_info_message_at] == auction_info_message_written.reserved_4[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.imbalance_direction == auction_info_message_written.imbalance_direction);
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.instrument_id[auction_info_message_at] == auction_info_message_written.instrument_id[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.reserved_a == auction_info_message_written.reserved_a);
  assert(auction_info_message_read.reserved_b == auction_info_message_written.reserved_b);
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> assert(auction_info_message_read.price[auction_info_message_at] == auction_info_message_written.price[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.auction_type == auction_info_message_written.auction_type);
  skip
}

/* ---- Statistics Message: 21 bytes -------------------------------------------- */

/* Disseminates the opening or closing price of an instrument. */
typedef StatisticsMessage {
  byte nanosecond[4];
  byte instrument_id[4];
  byte reserved_a;
  byte reserved_b;
  byte statistic_type;
  byte price[8];
  byte open_close_indicator;
  byte sub_book
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.nanosecond[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.instrument_id[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.reserved_a = statistics_message_value;
  statistics_message_record.reserved_b = statistics_message_value;
  statistics_message_record.statistic_type = statistics_message_value;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.open_close_indicator = statistics_message_value;
  statistics_message_record.sub_book = statistics_message_value;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.nanosecond[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.instrument_id[statistics_message_at] = (statistics_message_base + 4 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.reserved_a = (statistics_message_base + 8 + 1) % 256;
  statistics_message_record.reserved_b = (statistics_message_base + 9 + 1) % 256;
  statistics_message_record.statistic_type = (statistics_message_base + 10 + 1) % 256;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.price[statistics_message_at] = (statistics_message_base + 11 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.open_close_indicator = (statistics_message_base + 19 + 1) % 256;
  statistics_message_record.sub_book = (statistics_message_base + 20 + 1) % 256;
  skip
}

/* Statistics Message to the wire, 21 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.nanosecond[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.instrument_id[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_message_record.reserved_a; at = at + 1;
  wire[at] = statistics_message_record.reserved_b; at = at + 1;
  wire[at] = statistics_message_record.statistic_type; at = at + 1;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_message_record.open_close_indicator; at = at + 1;
  wire[at] = statistics_message_record.sub_book; at = at + 1;
  skip
}

/* Statistics Message off the wire, 21 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.nanosecond[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.instrument_id[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.reserved_a = wire[at]; at = at + 1;
  statistics_message_record.reserved_b = wire[at]; at = at + 1;
  statistics_message_record.statistic_type = wire[at]; at = at + 1;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.open_close_indicator = wire[at]; at = at + 1;
  statistics_message_record.sub_book = wire[at]; at = at + 1;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.nanosecond[statistics_message_at] == statistics_message_written.nanosecond[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.instrument_id[statistics_message_at] == statistics_message_written.instrument_id[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  assert(statistics_message_read.reserved_a == statistics_message_written.reserved_a);
  assert(statistics_message_read.reserved_b == statistics_message_written.reserved_b);
  assert(statistics_message_read.statistic_type == statistics_message_written.statistic_type);
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.price[statistics_message_at] == statistics_message_written.price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  assert(statistics_message_read.open_close_indicator == statistics_message_written.open_close_indicator);
  assert(statistics_message_read.sub_book == statistics_message_written.sub_book);
  skip
}

/* ---- Extended Statistics Message: 137 bytes ---------------------------------- */

/* Disseminates the intraday statistics of an instrument. Values that are not set or have been withdrawn are negative, except Volume and Number of Trades which are zero. */
typedef ExtendedStatisticsMessage {
  byte nanosecond[4];
  byte instrument_id[4];
  byte high_price[8];
  byte low_price[8];
  byte vwap[8];
  byte volume[4];
  byte turnover[8];
  byte number_of_trades[4];
  byte reserved_8[8];
  byte sub_book;
  byte notional_exposure[8];
  byte notional_delta_exposure[8];
  byte open_interest[8];
  byte theoretical_price[8];
  byte delta[8];
  byte gamma[8];
  byte vega[8];
  byte theta[8];
  byte rho[8];
  byte volatility[8]
};

int extended_statistics_message_at;

/* every byte of Extended Statistics Message set to one value */
inline fill_extended_statistics_message(extended_statistics_message_record, extended_statistics_message_value) {
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.nanosecond[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.instrument_id[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.high_price[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.low_price[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.vwap[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.volume[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.turnover[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.number_of_trades[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.reserved_8[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_record.sub_book = extended_statistics_message_value;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_exposure[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_delta_exposure[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.open_interest[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.theoretical_price[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.delta[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.gamma[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.vega[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.theta[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.rho[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.volatility[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_extended_statistics_message(extended_statistics_message_record, extended_statistics_message_base) {
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.nanosecond[extended_statistics_message_at] = (extended_statistics_message_base + 0 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.instrument_id[extended_statistics_message_at] = (extended_statistics_message_base + 4 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.high_price[extended_statistics_message_at] = (extended_statistics_message_base + 8 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.low_price[extended_statistics_message_at] = (extended_statistics_message_base + 16 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.vwap[extended_statistics_message_at] = (extended_statistics_message_base + 24 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.volume[extended_statistics_message_at] = (extended_statistics_message_base + 32 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.turnover[extended_statistics_message_at] = (extended_statistics_message_base + 36 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.number_of_trades[extended_statistics_message_at] = (extended_statistics_message_base + 44 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.reserved_8[extended_statistics_message_at] = (extended_statistics_message_base + 48 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_record.sub_book = (extended_statistics_message_base + 56 + 1) % 256;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_exposure[extended_statistics_message_at] = (extended_statistics_message_base + 57 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_delta_exposure[extended_statistics_message_at] = (extended_statistics_message_base + 65 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.open_interest[extended_statistics_message_at] = (extended_statistics_message_base + 73 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.theoretical_price[extended_statistics_message_at] = (extended_statistics_message_base + 81 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.delta[extended_statistics_message_at] = (extended_statistics_message_base + 89 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.gamma[extended_statistics_message_at] = (extended_statistics_message_base + 97 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.vega[extended_statistics_message_at] = (extended_statistics_message_base + 105 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.theta[extended_statistics_message_at] = (extended_statistics_message_base + 113 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.rho[extended_statistics_message_at] = (extended_statistics_message_base + 121 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.volatility[extended_statistics_message_at] = (extended_statistics_message_base + 129 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Statistics Message to the wire, 137 bytes from where the cursor stands */
inline encode_extended_statistics_message(extended_statistics_message_record) {
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.nanosecond[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.instrument_id[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.high_price[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.low_price[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.vwap[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.volume[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.turnover[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.number_of_trades[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.reserved_8[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_statistics_message_record.sub_book; at = at + 1;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.notional_exposure[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.notional_delta_exposure[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.open_interest[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.theoretical_price[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.delta[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.gamma[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.vega[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.theta[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.rho[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.volatility[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Statistics Message off the wire, 137 bytes from where the cursor stands */
inline decode_extended_statistics_message(extended_statistics_message_record) {
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.nanosecond[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.instrument_id[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.high_price[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.low_price[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.vwap[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.volume[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.turnover[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.number_of_trades[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.reserved_8[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_record.sub_book = wire[at]; at = at + 1;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_exposure[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_delta_exposure[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.open_interest[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.theoretical_price[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.delta[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.gamma[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.vega[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.theta[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.rho[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.volatility[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Statistics Message is what was written, byte for byte */
inline equal_extended_statistics_message(extended_statistics_message_read, extended_statistics_message_written) {
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.nanosecond[extended_statistics_message_at] == extended_statistics_message_written.nanosecond[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.instrument_id[extended_statistics_message_at] == extended_statistics_message_written.instrument_id[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.high_price[extended_statistics_message_at] == extended_statistics_message_written.high_price[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.low_price[extended_statistics_message_at] == extended_statistics_message_written.low_price[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.vwap[extended_statistics_message_at] == extended_statistics_message_written.vwap[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.volume[extended_statistics_message_at] == extended_statistics_message_written.volume[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.turnover[extended_statistics_message_at] == extended_statistics_message_written.turnover[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.number_of_trades[extended_statistics_message_at] == extended_statistics_message_written.number_of_trades[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.reserved_8[extended_statistics_message_at] == extended_statistics_message_written.reserved_8[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  assert(extended_statistics_message_read.sub_book == extended_statistics_message_written.sub_book);
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.notional_exposure[extended_statistics_message_at] == extended_statistics_message_written.notional_exposure[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.notional_delta_exposure[extended_statistics_message_at] == extended_statistics_message_written.notional_delta_exposure[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.open_interest[extended_statistics_message_at] == extended_statistics_message_written.open_interest[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.theoretical_price[extended_statistics_message_at] == extended_statistics_message_written.theoretical_price[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.delta[extended_statistics_message_at] == extended_statistics_message_written.delta[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.gamma[extended_statistics_message_at] == extended_statistics_message_written.gamma[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.vega[extended_statistics_message_at] == extended_statistics_message_written.vega[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.theta[extended_statistics_message_at] == extended_statistics_message_written.theta[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.rho[extended_statistics_message_at] == extended_statistics_message_written.rho[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.volatility[extended_statistics_message_at] == extended_statistics_message_written.volatility[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- News Message: 1063 bytes ------------------------------------------------ */

/* Carries an exchange announcement and the instruments it relates to. */
typedef NewsMessage {
  byte nanosecond[4];
  byte time[8];
  byte urgency;
  byte headline[100];
  byte text[750];
  byte instruments[100];
  byte underlyings[100]
};

int news_message_at;

/* every byte of News Message set to one value */
inline fill_news_message(news_message_record, news_message_value) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.nanosecond[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 8 -> news_message_record.time[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_record.urgency = news_message_value;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.headline[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> news_message_record.text[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.instruments[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.underlyings[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of News Message set to where it lies, so a field read out of place says so */
inline ramp_news_message(news_message_record, news_message_base) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.nanosecond[news_message_at] = (news_message_base + 0 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 8 -> news_message_record.time[news_message_at] = (news_message_base + 4 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_record.urgency = (news_message_base + 12 + 1) % 256;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.headline[news_message_at] = (news_message_base + 13 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> news_message_record.text[news_message_at] = (news_message_base + 113 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.instruments[news_message_at] = (news_message_base + 863 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.underlyings[news_message_at] = (news_message_base + 963 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message to the wire, 1063 bytes from where the cursor stands */
inline encode_news_message(news_message_record) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> wire[at] = news_message_record.nanosecond[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 8 -> wire[at] = news_message_record.time[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  wire[at] = news_message_record.urgency; at = at + 1;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> wire[at] = news_message_record.headline[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> wire[at] = news_message_record.text[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> wire[at] = news_message_record.instruments[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> wire[at] = news_message_record.underlyings[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message off the wire, 1063 bytes from where the cursor stands */
inline decode_news_message(news_message_record) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.nanosecond[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 8 -> news_message_record.time[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_record.urgency = wire[at]; at = at + 1;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.headline[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> news_message_record.text[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.instruments[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.underlyings[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of News Message is what was written, byte for byte */
inline equal_news_message(news_message_read, news_message_written) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> assert(news_message_read.nanosecond[news_message_at] == news_message_written.nanosecond[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 8 -> assert(news_message_read.time[news_message_at] == news_message_written.time[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  assert(news_message_read.urgency == news_message_written.urgency);
  news_message_at = 0;
  do
  :: news_message_at < 100 -> assert(news_message_read.headline[news_message_at] == news_message_written.headline[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> assert(news_message_read.text[news_message_at] == news_message_written.text[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> assert(news_message_read.instruments[news_message_at] == news_message_written.instruments[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> assert(news_message_read.underlyings[news_message_at] == news_message_written.underlyings[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Quote Info Message: 34 bytes --------------------------------- */

/* Disseminates the indicative bid and offer of a request for quote. */
typedef IndicativeQuoteInfoMessage {
  byte nanosecond[4];
  byte instrument_id[4];
  byte rfq_id[10];
  byte indicative_bid_price[8];
  byte indicative_offer_price[8]
};

int indicative_quote_info_message_at;

/* every byte of Indicative Quote Info Message set to one value */
inline fill_indicative_quote_info_message(indicative_quote_info_message_record, indicative_quote_info_message_value) {
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> indicative_quote_info_message_record.nanosecond[indicative_quote_info_message_at] = indicative_quote_info_message_value; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> indicative_quote_info_message_record.instrument_id[indicative_quote_info_message_at] = indicative_quote_info_message_value; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 10 -> indicative_quote_info_message_record.rfq_id[indicative_quote_info_message_at] = indicative_quote_info_message_value; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> indicative_quote_info_message_record.indicative_bid_price[indicative_quote_info_message_at] = indicative_quote_info_message_value; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> indicative_quote_info_message_record.indicative_offer_price[indicative_quote_info_message_at] = indicative_quote_info_message_value; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Quote Info Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_quote_info_message(indicative_quote_info_message_record, indicative_quote_info_message_base) {
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> indicative_quote_info_message_record.nanosecond[indicative_quote_info_message_at] = (indicative_quote_info_message_base + 0 + indicative_quote_info_message_at + 1) % 256; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> indicative_quote_info_message_record.instrument_id[indicative_quote_info_message_at] = (indicative_quote_info_message_base + 4 + indicative_quote_info_message_at + 1) % 256; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 10 -> indicative_quote_info_message_record.rfq_id[indicative_quote_info_message_at] = (indicative_quote_info_message_base + 8 + indicative_quote_info_message_at + 1) % 256; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> indicative_quote_info_message_record.indicative_bid_price[indicative_quote_info_message_at] = (indicative_quote_info_message_base + 18 + indicative_quote_info_message_at + 1) % 256; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> indicative_quote_info_message_record.indicative_offer_price[indicative_quote_info_message_at] = (indicative_quote_info_message_base + 26 + indicative_quote_info_message_at + 1) % 256; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Quote Info Message to the wire, 34 bytes from where the cursor stands */
inline encode_indicative_quote_info_message(indicative_quote_info_message_record) {
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> wire[at] = indicative_quote_info_message_record.nanosecond[indicative_quote_info_message_at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> wire[at] = indicative_quote_info_message_record.instrument_id[indicative_quote_info_message_at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 10 -> wire[at] = indicative_quote_info_message_record.rfq_id[indicative_quote_info_message_at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> wire[at] = indicative_quote_info_message_record.indicative_bid_price[indicative_quote_info_message_at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> wire[at] = indicative_quote_info_message_record.indicative_offer_price[indicative_quote_info_message_at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Quote Info Message off the wire, 34 bytes from where the cursor stands */
inline decode_indicative_quote_info_message(indicative_quote_info_message_record) {
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> indicative_quote_info_message_record.nanosecond[indicative_quote_info_message_at] = wire[at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> indicative_quote_info_message_record.instrument_id[indicative_quote_info_message_at] = wire[at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 10 -> indicative_quote_info_message_record.rfq_id[indicative_quote_info_message_at] = wire[at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> indicative_quote_info_message_record.indicative_bid_price[indicative_quote_info_message_at] = wire[at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> indicative_quote_info_message_record.indicative_offer_price[indicative_quote_info_message_at] = wire[at]; at = at + 1; indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Quote Info Message is what was written, byte for byte */
inline equal_indicative_quote_info_message(indicative_quote_info_message_read, indicative_quote_info_message_written) {
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> assert(indicative_quote_info_message_read.nanosecond[indicative_quote_info_message_at] == indicative_quote_info_message_written.nanosecond[indicative_quote_info_message_at]); indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 4 -> assert(indicative_quote_info_message_read.instrument_id[indicative_quote_info_message_at] == indicative_quote_info_message_written.instrument_id[indicative_quote_info_message_at]); indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 10 -> assert(indicative_quote_info_message_read.rfq_id[indicative_quote_info_message_at] == indicative_quote_info_message_written.rfq_id[indicative_quote_info_message_at]); indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> assert(indicative_quote_info_message_read.indicative_bid_price[indicative_quote_info_message_at] == indicative_quote_info_message_written.indicative_bid_price[indicative_quote_info_message_at]); indicative_quote_info_message_at = indicative_quote_info_message_at + 1
  :: else -> break
  od;
  indicative_quote_info_message_at = 0;
  do
  :: indicative_quote_info_message_at < 8 -> assert(indicative_quote_info_message_read.indicative_offer_price[indicative_quote_info_message_at] == indicative_quote_info_message_written.indicative_offer_price[indicative_quote_info_message_at]); indicative_quote_info_message_at = indicative_quote_info_message_at + 1
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
    assert(at == 16);
    at = 0;
    decode_login_request_message(login_request_message_got);
    assert(at == 16);
    equal_login_request_message(login_request_message_got, login_request_message_sent)
  }
}

/* Replay Request Message: encoded, read back, and compared */
proctype check_replay_request_message() {
  ReplayRequestMessage replay_request_message_sent;
  ReplayRequestMessage replay_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_request_message(replay_request_message_sent, 0)
  :: pattern == 1 -> fill_replay_request_message(replay_request_message_sent, 32)
  :: pattern == 2 -> fill_replay_request_message(replay_request_message_sent, 255)
  :: else -> ramp_replay_request_message(replay_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_request_message(replay_request_message_sent);
    assert(at == 7);
    at = 0;
    decode_replay_request_message(replay_request_message_got);
    assert(at == 7);
    equal_replay_request_message(replay_request_message_got, replay_request_message_sent)
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

/* Replay Response Message: encoded, read back, and compared */
proctype check_replay_response_message() {
  ReplayResponseMessage replay_response_message_sent;
  ReplayResponseMessage replay_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_response_message(replay_response_message_sent, 0)
  :: pattern == 1 -> fill_replay_response_message(replay_response_message_sent, 32)
  :: pattern == 2 -> fill_replay_response_message(replay_response_message_sent, 255)
  :: else -> ramp_replay_response_message(replay_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_response_message(replay_response_message_sent);
    assert(at == 8);
    at = 0;
    decode_replay_response_message(replay_response_message_got);
    assert(at == 8);
    equal_replay_response_message(replay_response_message_got, replay_response_message_sent)
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
    assert(at == 14);
    at = 0;
    decode_snapshot_response_message(snapshot_response_message_got);
    assert(at == 14);
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
    assert(at == 5);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 5);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Order Deleted Message: encoded, read back, and compared */
proctype check_order_deleted_message() {
  OrderDeletedMessage order_deleted_message_sent;
  OrderDeletedMessage order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_deleted_message(order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_order_deleted_message(order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_order_deleted_message(order_deleted_message_sent, 255)
  :: else -> ramp_order_deleted_message(order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_deleted_message(order_deleted_message_sent);
    assert(at == 12);
    at = 0;
    decode_order_deleted_message(order_deleted_message_got);
    assert(at == 12);
    equal_order_deleted_message(order_deleted_message_got, order_deleted_message_sent)
  }
}

/* Order Book Clear Message: encoded, read back, and compared */
proctype check_order_book_clear_message() {
  OrderBookClearMessage order_book_clear_message_sent;
  OrderBookClearMessage order_book_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_clear_message(order_book_clear_message_sent, 0)
  :: pattern == 1 -> fill_order_book_clear_message(order_book_clear_message_sent, 32)
  :: pattern == 2 -> fill_order_book_clear_message(order_book_clear_message_sent, 255)
  :: else -> ramp_order_book_clear_message(order_book_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_clear_message(order_book_clear_message_sent);
    assert(at == 10);
    at = 0;
    decode_order_book_clear_message(order_book_clear_message_got);
    assert(at == 10);
    equal_order_book_clear_message(order_book_clear_message_got, order_book_clear_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 52);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 52);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Size Message: encoded, read back, and compared */
proctype check_order_executed_with_price_size_message() {
  OrderExecutedWithPriceSizeMessage order_executed_with_price_size_message_sent;
  OrderExecutedWithPriceSizeMessage order_executed_with_price_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 255)
  :: else -> ramp_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_size_message(order_executed_with_price_size_message_sent);
    assert(at == 65);
    at = 0;
    decode_order_executed_with_price_size_message(order_executed_with_price_size_message_got);
    assert(at == 65);
    equal_order_executed_with_price_size_message(order_executed_with_price_size_message_got, order_executed_with_price_size_message_sent)
  }
}

/* Auction Trade Message: encoded, read back, and compared */
proctype check_auction_trade_message() {
  AuctionTradeMessage auction_trade_message_sent;
  AuctionTradeMessage auction_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_trade_message(auction_trade_message_sent, 0)
  :: pattern == 1 -> fill_auction_trade_message(auction_trade_message_sent, 32)
  :: pattern == 2 -> fill_auction_trade_message(auction_trade_message_sent, 255)
  :: else -> ramp_auction_trade_message(auction_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_trade_message(auction_trade_message_sent);
    assert(at == 67);
    at = 0;
    decode_auction_trade_message(auction_trade_message_got);
    assert(at == 67);
    equal_auction_trade_message(auction_trade_message_got, auction_trade_message_sent)
  }
}

/* Off Book Trade Message: encoded, read back, and compared */
proctype check_off_book_trade_message() {
  OffBookTradeMessage off_book_trade_message_sent;
  OffBookTradeMessage off_book_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_off_book_trade_message(off_book_trade_message_sent, 0)
  :: pattern == 1 -> fill_off_book_trade_message(off_book_trade_message_sent, 32)
  :: pattern == 2 -> fill_off_book_trade_message(off_book_trade_message_sent, 255)
  :: else -> ramp_off_book_trade_message(off_book_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_off_book_trade_message(off_book_trade_message_sent);
    assert(at == 78);
    at = 0;
    decode_off_book_trade_message(off_book_trade_message_got);
    assert(at == 78);
    equal_off_book_trade_message(off_book_trade_message_got, off_book_trade_message_sent)
  }
}

/* Auction Info Message: encoded, read back, and compared */
proctype check_auction_info_message() {
  AuctionInfoMessage auction_info_message_sent;
  AuctionInfoMessage auction_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_info_message(auction_info_message_sent, 0)
  :: pattern == 1 -> fill_auction_info_message(auction_info_message_sent, 32)
  :: pattern == 2 -> fill_auction_info_message(auction_info_message_sent, 255)
  :: else -> ramp_auction_info_message(auction_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_info_message(auction_info_message_sent);
    assert(at == 28);
    at = 0;
    decode_auction_info_message(auction_info_message_got);
    assert(at == 28);
    equal_auction_info_message(auction_info_message_got, auction_info_message_sent)
  }
}

/* Statistics Message: encoded, read back, and compared */
proctype check_statistics_message() {
  StatisticsMessage statistics_message_sent;
  StatisticsMessage statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_message(statistics_message_sent, 0)
  :: pattern == 1 -> fill_statistics_message(statistics_message_sent, 32)
  :: pattern == 2 -> fill_statistics_message(statistics_message_sent, 255)
  :: else -> ramp_statistics_message(statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_message(statistics_message_sent);
    assert(at == 21);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 21);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
  }
}

/* Extended Statistics Message: encoded, read back, and compared */
proctype check_extended_statistics_message() {
  ExtendedStatisticsMessage extended_statistics_message_sent;
  ExtendedStatisticsMessage extended_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_statistics_message(extended_statistics_message_sent, 0)
  :: pattern == 1 -> fill_extended_statistics_message(extended_statistics_message_sent, 32)
  :: pattern == 2 -> fill_extended_statistics_message(extended_statistics_message_sent, 255)
  :: else -> ramp_extended_statistics_message(extended_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_statistics_message(extended_statistics_message_sent);
    assert(at == 137);
    at = 0;
    decode_extended_statistics_message(extended_statistics_message_got);
    assert(at == 137);
    equal_extended_statistics_message(extended_statistics_message_got, extended_statistics_message_sent)
  }
}

/* News Message: encoded, read back, and compared */
proctype check_news_message() {
  NewsMessage news_message_sent;
  NewsMessage news_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_news_message(news_message_sent, 0)
  :: pattern == 1 -> fill_news_message(news_message_sent, 32)
  :: pattern == 2 -> fill_news_message(news_message_sent, 255)
  :: else -> ramp_news_message(news_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_news_message(news_message_sent);
    assert(at == 1063);
    at = 0;
    decode_news_message(news_message_got);
    assert(at == 1063);
    equal_news_message(news_message_got, news_message_sent)
  }
}

/* Indicative Quote Info Message: encoded, read back, and compared */
proctype check_indicative_quote_info_message() {
  IndicativeQuoteInfoMessage indicative_quote_info_message_sent;
  IndicativeQuoteInfoMessage indicative_quote_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_quote_info_message(indicative_quote_info_message_sent, 0)
  :: pattern == 1 -> fill_indicative_quote_info_message(indicative_quote_info_message_sent, 32)
  :: pattern == 2 -> fill_indicative_quote_info_message(indicative_quote_info_message_sent, 255)
  :: else -> ramp_indicative_quote_info_message(indicative_quote_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_quote_info_message(indicative_quote_info_message_sent);
    assert(at == 34);
    at = 0;
    decode_indicative_quote_info_message(indicative_quote_info_message_got);
    assert(at == 34);
    equal_indicative_quote_info_message(indicative_quote_info_message_got, indicative_quote_info_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_unit_header()
  :: run check_message_header()
  :: run check_login_request_message()
  :: run check_replay_request_message()
  :: run check_login_response_message()
  :: run check_replay_response_message()
  :: run check_snapshot_response_message()
  :: run check_time_message()
  :: run check_system_event_message()
  :: run check_order_deleted_message()
  :: run check_order_book_clear_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_size_message()
  :: run check_auction_trade_message()
  :: run check_off_book_trade_message()
  :: run check_auction_info_message()
  :: run check_statistics_message()
  :: run check_extended_statistics_message()
  :: run check_news_message()
  :: run check_indicative_quote_info_message()
  fi
}
