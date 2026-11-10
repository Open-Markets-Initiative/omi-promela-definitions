/*
 * London Stock Exchange Level 2 Incremental Replay
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
#define WIRE 81

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

/* Used by the client to log in to the replay or recovery channel */
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

/* ---- Replay Request Message: 12 bytes ---------------------------------------- */

/* Used by the client to request a retransmission of messages on the replay channel */
typedef ReplayRequestMessage {
  byte first_message[4];
  byte count[4];
  byte request_id[4]
};

int replay_request_message_at;

/* every byte of Replay Request Message set to one value */
inline fill_replay_request_message(replay_request_message_record, replay_request_message_value) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.first_message[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.request_id[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Request Message set to where it lies, so a field read out of place says so */
inline ramp_replay_request_message(replay_request_message_record, replay_request_message_base) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.first_message[replay_request_message_at] = (replay_request_message_base + 0 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = (replay_request_message_base + 4 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.request_id[replay_request_message_at] = (replay_request_message_base + 8 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.first_message[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.count[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.request_id[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.first_message[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.request_id[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Request Message is what was written, byte for byte */
inline equal_replay_request_message(replay_request_message_read, replay_request_message_written) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.first_message[replay_request_message_at] == replay_request_message_written.first_message[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.count[replay_request_message_at] == replay_request_message_written.count[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.request_id[replay_request_message_at] == replay_request_message_written.request_id[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* Used by the server to accept or reject a login request to the replay or recovery channel */
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

/* ---- Replay Response Message: 13 bytes --------------------------------------- */

/* Used by the server to respond to a retransmission request on the replay channel */
typedef ReplayResponseMessage {
  byte first_message[4];
  byte count[4];
  byte replay_status;
  byte request_id[4]
};

int replay_response_message_at;

/* every byte of Replay Response Message set to one value */
inline fill_replay_response_message(replay_response_message_record, replay_response_message_value) {
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.first_message[replay_response_message_at] = replay_response_message_value; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.count[replay_response_message_at] = replay_response_message_value; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.replay_status = replay_response_message_value;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.request_id[replay_response_message_at] = replay_response_message_value; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Response Message set to where it lies, so a field read out of place says so */
inline ramp_replay_response_message(replay_response_message_record, replay_response_message_base) {
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.first_message[replay_response_message_at] = (replay_response_message_base + 0 + replay_response_message_at + 1) % 256; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.count[replay_response_message_at] = (replay_response_message_base + 4 + replay_response_message_at + 1) % 256; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.replay_status = (replay_response_message_base + 8 + 1) % 256;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.request_id[replay_response_message_at] = (replay_response_message_base + 9 + replay_response_message_at + 1) % 256; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Response Message to the wire, 13 bytes from where the cursor stands */
inline encode_replay_response_message(replay_response_message_record) {
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> wire[at] = replay_response_message_record.first_message[replay_response_message_at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> wire[at] = replay_response_message_record.count[replay_response_message_at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  wire[at] = replay_response_message_record.replay_status; at = at + 1;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> wire[at] = replay_response_message_record.request_id[replay_response_message_at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Response Message off the wire, 13 bytes from where the cursor stands */
inline decode_replay_response_message(replay_response_message_record) {
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.first_message[replay_response_message_at] = wire[at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.count[replay_response_message_at] = wire[at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.replay_status = wire[at]; at = at + 1;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> replay_response_message_record.request_id[replay_response_message_at] = wire[at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Response Message is what was written, byte for byte */
inline equal_replay_response_message(replay_response_message_read, replay_response_message_written) {
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> assert(replay_response_message_read.first_message[replay_response_message_at] == replay_response_message_written.first_message[replay_response_message_at]); replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> assert(replay_response_message_read.count[replay_response_message_at] == replay_response_message_written.count[replay_response_message_at]); replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  assert(replay_response_message_read.replay_status == replay_response_message_written.replay_status);
  replay_response_message_at = 0;
  do
  :: replay_response_message_at < 4 -> assert(replay_response_message_read.request_id[replay_response_message_at] == replay_response_message_written.request_id[replay_response_message_at]); replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay And Recovery Complete Message: 5 bytes --------------------------- */

/* Used by the server to indicate the successful completion of servicing a message replay or a recovery request */
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

/* Broadcast at the start and end of day on TRADEcho. Customers should consider the SI Quote book to be empty following receipt of this message; no explicit Order Book Clear or delete order messages will be sent */
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

/* Used to communicate status of an instrument. Instrument status messages are disseminated prior to system event start of day message */
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

/* ---- Delete Order Message: 52 bytes ------------------------------------------ */

/* Sent to instruct recipients to delete a quote */
typedef DeleteOrderMessage {
  byte timestamp[8];
  byte order_id[8];
  byte instrument[8];
  byte side;
  byte order_book_type;
  byte source_venue[2];
  byte previous_price[8];
  byte previous_quantity[8];
  byte internal_id[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.instrument[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.side = delete_order_message_value;
  delete_order_message_record.order_book_type = delete_order_message_value;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.source_venue[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.previous_price[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.previous_quantity[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.internal_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.instrument[delete_order_message_at] = (delete_order_message_base + 16 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.side = (delete_order_message_base + 24 + 1) % 256;
  delete_order_message_record.order_book_type = (delete_order_message_base + 25 + 1) % 256;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.source_venue[delete_order_message_at] = (delete_order_message_base + 26 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.previous_price[delete_order_message_at] = (delete_order_message_base + 28 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.previous_quantity[delete_order_message_at] = (delete_order_message_base + 36 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.internal_id[delete_order_message_at] = (delete_order_message_base + 44 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 52 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.timestamp[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.instrument[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  wire[at] = delete_order_message_record.side; at = at + 1;
  wire[at] = delete_order_message_record.order_book_type; at = at + 1;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> wire[at] = delete_order_message_record.source_venue[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.previous_price[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.previous_quantity[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.internal_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 52 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.instrument[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.side = wire[at]; at = at + 1;
  delete_order_message_record.order_book_type = wire[at]; at = at + 1;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> delete_order_message_record.source_venue[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.previous_price[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.previous_quantity[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.internal_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.timestamp[delete_order_message_at] == delete_order_message_written.timestamp[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.instrument[delete_order_message_at] == delete_order_message_written.instrument[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  assert(delete_order_message_read.side == delete_order_message_written.side);
  assert(delete_order_message_read.order_book_type == delete_order_message_written.order_book_type);
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 2 -> assert(delete_order_message_read.source_venue[delete_order_message_at] == delete_order_message_written.source_venue[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.previous_price[delete_order_message_at] == delete_order_message_written.previous_price[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.previous_quantity[delete_order_message_at] == delete_order_message_written.previous_quantity[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.internal_id[delete_order_message_at] == delete_order_message_written.internal_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Clear Message: 19 bytes -------------------------------------- */

/* Sent to instruct recipients to remove all quotes from the book for the specified instrument */
typedef OrderBookClearMessage {
  byte timestamp[8];
  byte source_venue[2];
  byte instrument[8];
  byte order_book_type
};

int order_book_clear_message_at;

/* every byte of Order Book Clear Message set to one value */
inline fill_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_value) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.timestamp[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.source_venue[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.instrument[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.order_book_type = order_book_clear_message_value;
  skip
}

/* each byte of Order Book Clear Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_base) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.timestamp[order_book_clear_message_at] = (order_book_clear_message_base + 0 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.source_venue[order_book_clear_message_at] = (order_book_clear_message_base + 8 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.instrument[order_book_clear_message_at] = (order_book_clear_message_base + 10 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.order_book_type = (order_book_clear_message_base + 18 + 1) % 256;
  skip
}

/* Order Book Clear Message to the wire, 19 bytes from where the cursor stands */
inline encode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> wire[at] = order_book_clear_message_record.timestamp[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> wire[at] = order_book_clear_message_record.source_venue[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> wire[at] = order_book_clear_message_record.instrument[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_clear_message_record.order_book_type; at = at + 1;
  skip
}

/* Order Book Clear Message off the wire, 19 bytes from where the cursor stands */
inline decode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.timestamp[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.source_venue[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.instrument[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.order_book_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Clear Message is what was written, byte for byte */
inline equal_order_book_clear_message(order_book_clear_message_read, order_book_clear_message_written) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> assert(order_book_clear_message_read.timestamp[order_book_clear_message_at] == order_book_clear_message_written.timestamp[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> assert(order_book_clear_message_read.source_venue[order_book_clear_message_at] == order_book_clear_message_written.source_venue[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> assert(order_book_clear_message_read.instrument[order_book_clear_message_at] == order_book_clear_message_written.instrument[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  assert(order_book_clear_message_read.order_book_type == order_book_clear_message_written.order_book_type);
  skip
}

/* ---- Si Quote Message: 81 bytes ---------------------------------------------- */

/* Publishing Systematic Internaliser (SI) Quotes */
typedef SiQuoteMessage {
  byte timestamp[8];
  byte order_id[8];
  byte side;
  byte size[8];
  byte instrument[8];
  byte price[8];
  byte internal_id[8];
  byte source_venue[2];
  byte order_book_type;
  byte participant[11];
  byte order_type;
  byte reserved_10[10];
  byte currency[3];
  byte venue_of_publication[4]
};

int si_quote_message_at;

/* every byte of Si Quote Message set to one value */
inline fill_si_quote_message(si_quote_message_record, si_quote_message_value) {
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.timestamp[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.order_id[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.side = si_quote_message_value;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.size[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.instrument[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.price[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.internal_id[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 2 -> si_quote_message_record.source_venue[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.order_book_type = si_quote_message_value;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 11 -> si_quote_message_record.participant[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.order_type = si_quote_message_value;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 10 -> si_quote_message_record.reserved_10[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 3 -> si_quote_message_record.currency[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 4 -> si_quote_message_record.venue_of_publication[si_quote_message_at] = si_quote_message_value; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Si Quote Message set to where it lies, so a field read out of place says so */
inline ramp_si_quote_message(si_quote_message_record, si_quote_message_base) {
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.timestamp[si_quote_message_at] = (si_quote_message_base + 0 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.order_id[si_quote_message_at] = (si_quote_message_base + 8 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.side = (si_quote_message_base + 16 + 1) % 256;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.size[si_quote_message_at] = (si_quote_message_base + 17 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.instrument[si_quote_message_at] = (si_quote_message_base + 25 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.price[si_quote_message_at] = (si_quote_message_base + 33 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.internal_id[si_quote_message_at] = (si_quote_message_base + 41 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 2 -> si_quote_message_record.source_venue[si_quote_message_at] = (si_quote_message_base + 49 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.order_book_type = (si_quote_message_base + 51 + 1) % 256;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 11 -> si_quote_message_record.participant[si_quote_message_at] = (si_quote_message_base + 52 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.order_type = (si_quote_message_base + 63 + 1) % 256;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 10 -> si_quote_message_record.reserved_10[si_quote_message_at] = (si_quote_message_base + 64 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 3 -> si_quote_message_record.currency[si_quote_message_at] = (si_quote_message_base + 74 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 4 -> si_quote_message_record.venue_of_publication[si_quote_message_at] = (si_quote_message_base + 77 + si_quote_message_at + 1) % 256; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Si Quote Message to the wire, 81 bytes from where the cursor stands */
inline encode_si_quote_message(si_quote_message_record) {
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> wire[at] = si_quote_message_record.timestamp[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> wire[at] = si_quote_message_record.order_id[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = si_quote_message_record.side; at = at + 1;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> wire[at] = si_quote_message_record.size[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> wire[at] = si_quote_message_record.instrument[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> wire[at] = si_quote_message_record.price[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> wire[at] = si_quote_message_record.internal_id[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 2 -> wire[at] = si_quote_message_record.source_venue[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = si_quote_message_record.order_book_type; at = at + 1;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 11 -> wire[at] = si_quote_message_record.participant[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = si_quote_message_record.order_type; at = at + 1;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 10 -> wire[at] = si_quote_message_record.reserved_10[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 3 -> wire[at] = si_quote_message_record.currency[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 4 -> wire[at] = si_quote_message_record.venue_of_publication[si_quote_message_at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Si Quote Message off the wire, 81 bytes from where the cursor stands */
inline decode_si_quote_message(si_quote_message_record) {
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.timestamp[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.order_id[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.side = wire[at]; at = at + 1;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.size[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.instrument[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.price[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> si_quote_message_record.internal_id[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 2 -> si_quote_message_record.source_venue[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.order_book_type = wire[at]; at = at + 1;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 11 -> si_quote_message_record.participant[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_record.order_type = wire[at]; at = at + 1;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 10 -> si_quote_message_record.reserved_10[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 3 -> si_quote_message_record.currency[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 4 -> si_quote_message_record.venue_of_publication[si_quote_message_at] = wire[at]; at = at + 1; si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Si Quote Message is what was written, byte for byte */
inline equal_si_quote_message(si_quote_message_read, si_quote_message_written) {
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> assert(si_quote_message_read.timestamp[si_quote_message_at] == si_quote_message_written.timestamp[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> assert(si_quote_message_read.order_id[si_quote_message_at] == si_quote_message_written.order_id[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  assert(si_quote_message_read.side == si_quote_message_written.side);
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> assert(si_quote_message_read.size[si_quote_message_at] == si_quote_message_written.size[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> assert(si_quote_message_read.instrument[si_quote_message_at] == si_quote_message_written.instrument[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> assert(si_quote_message_read.price[si_quote_message_at] == si_quote_message_written.price[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 8 -> assert(si_quote_message_read.internal_id[si_quote_message_at] == si_quote_message_written.internal_id[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 2 -> assert(si_quote_message_read.source_venue[si_quote_message_at] == si_quote_message_written.source_venue[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  assert(si_quote_message_read.order_book_type == si_quote_message_written.order_book_type);
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 11 -> assert(si_quote_message_read.participant[si_quote_message_at] == si_quote_message_written.participant[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  assert(si_quote_message_read.order_type == si_quote_message_written.order_type);
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 10 -> assert(si_quote_message_read.reserved_10[si_quote_message_at] == si_quote_message_written.reserved_10[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 3 -> assert(si_quote_message_read.currency[si_quote_message_at] == si_quote_message_written.currency[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
  :: else -> break
  od;
  si_quote_message_at = 0;
  do
  :: si_quote_message_at < 4 -> assert(si_quote_message_read.venue_of_publication[si_quote_message_at] == si_quote_message_written.venue_of_publication[si_quote_message_at]); si_quote_message_at = si_quote_message_at + 1
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
    assert(at == 12);
    at = 0;
    decode_replay_request_message(replay_request_message_got);
    assert(at == 12);
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
    assert(at == 13);
    at = 0;
    decode_replay_response_message(replay_response_message_got);
    assert(at == 13);
    equal_replay_response_message(replay_response_message_got, replay_response_message_sent)
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

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 52);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 52);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
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
    assert(at == 19);
    at = 0;
    decode_order_book_clear_message(order_book_clear_message_got);
    assert(at == 19);
    equal_order_book_clear_message(order_book_clear_message_got, order_book_clear_message_sent)
  }
}

/* Si Quote Message: encoded, read back, and compared */
proctype check_si_quote_message() {
  SiQuoteMessage si_quote_message_sent;
  SiQuoteMessage si_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_si_quote_message(si_quote_message_sent, 0)
  :: pattern == 1 -> fill_si_quote_message(si_quote_message_sent, 32)
  :: pattern == 2 -> fill_si_quote_message(si_quote_message_sent, 255)
  :: else -> ramp_si_quote_message(si_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_si_quote_message(si_quote_message_sent);
    assert(at == 81);
    at = 0;
    decode_si_quote_message(si_quote_message_got);
    assert(at == 81);
    equal_si_quote_message(si_quote_message_got, si_quote_message_sent)
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
  :: run check_replay_and_recovery_complete_message()
  :: run check_system_event_message()
  :: run check_instrument_status_message()
  :: run check_delete_order_message()
  :: run check_order_book_clear_message()
  :: run check_si_quote_message()
  fi
}
