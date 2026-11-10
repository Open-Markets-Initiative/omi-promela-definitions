/*
 * London Stock Exchange Replay
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
#define WIRE 301

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

/* ---- Replay Request Message: 12 bytes ---------------------------------------- */

/* Used by the client to request a retransmission of messages on the replay channel. */
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

/* ---- Replay Response Message: 13 bytes --------------------------------------- */

/* Used by the server to respond to a retransmission request on the replay channel. */
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

/* Sent to indicate the start and end of the day. */
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

/* Used to communicate scheduled and unscheduled session changes */
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

/* ---- Add Order Incremental Message: 74 bytes --------------------------------- */

/* Sent to instruct recipients to add a new displayable order to the retrospective order book */
typedef AddOrderIncrementalMessage {
  byte timestamp[8];
  byte order_id[8];
  byte side;
  byte size[8];
  byte instrument[8];
  byte price[8];
  byte transaction_time[8];
  byte source_venue[2];
  byte order_book_type;
  byte participant[11];
  byte order_type;
  byte rfq_id[10]
};

int add_order_incremental_message_at;

/* every byte of Add Order Incremental Message set to one value */
inline fill_add_order_incremental_message(add_order_incremental_message_record, add_order_incremental_message_value) {
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.timestamp[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.order_id[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.side = add_order_incremental_message_value;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.size[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.instrument[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.price[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.transaction_time[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 2 -> add_order_incremental_message_record.source_venue[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.order_book_type = add_order_incremental_message_value;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 11 -> add_order_incremental_message_record.participant[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.order_type = add_order_incremental_message_value;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 10 -> add_order_incremental_message_record.rfq_id[add_order_incremental_message_at] = add_order_incremental_message_value; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Incremental Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_incremental_message(add_order_incremental_message_record, add_order_incremental_message_base) {
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.timestamp[add_order_incremental_message_at] = (add_order_incremental_message_base + 0 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.order_id[add_order_incremental_message_at] = (add_order_incremental_message_base + 8 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.side = (add_order_incremental_message_base + 16 + 1) % 256;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.size[add_order_incremental_message_at] = (add_order_incremental_message_base + 17 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.instrument[add_order_incremental_message_at] = (add_order_incremental_message_base + 25 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.price[add_order_incremental_message_at] = (add_order_incremental_message_base + 33 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.transaction_time[add_order_incremental_message_at] = (add_order_incremental_message_base + 41 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 2 -> add_order_incremental_message_record.source_venue[add_order_incremental_message_at] = (add_order_incremental_message_base + 49 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.order_book_type = (add_order_incremental_message_base + 51 + 1) % 256;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 11 -> add_order_incremental_message_record.participant[add_order_incremental_message_at] = (add_order_incremental_message_base + 52 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.order_type = (add_order_incremental_message_base + 63 + 1) % 256;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 10 -> add_order_incremental_message_record.rfq_id[add_order_incremental_message_at] = (add_order_incremental_message_base + 64 + add_order_incremental_message_at + 1) % 256; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Incremental Message to the wire, 74 bytes from where the cursor stands */
inline encode_add_order_incremental_message(add_order_incremental_message_record) {
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> wire[at] = add_order_incremental_message_record.timestamp[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> wire[at] = add_order_incremental_message_record.order_id[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_incremental_message_record.side; at = at + 1;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> wire[at] = add_order_incremental_message_record.size[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> wire[at] = add_order_incremental_message_record.instrument[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> wire[at] = add_order_incremental_message_record.price[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> wire[at] = add_order_incremental_message_record.transaction_time[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 2 -> wire[at] = add_order_incremental_message_record.source_venue[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_incremental_message_record.order_book_type; at = at + 1;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 11 -> wire[at] = add_order_incremental_message_record.participant[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_incremental_message_record.order_type; at = at + 1;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 10 -> wire[at] = add_order_incremental_message_record.rfq_id[add_order_incremental_message_at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Incremental Message off the wire, 74 bytes from where the cursor stands */
inline decode_add_order_incremental_message(add_order_incremental_message_record) {
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.timestamp[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.order_id[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.side = wire[at]; at = at + 1;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.size[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.instrument[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.price[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> add_order_incremental_message_record.transaction_time[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 2 -> add_order_incremental_message_record.source_venue[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.order_book_type = wire[at]; at = at + 1;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 11 -> add_order_incremental_message_record.participant[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_record.order_type = wire[at]; at = at + 1;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 10 -> add_order_incremental_message_record.rfq_id[add_order_incremental_message_at] = wire[at]; at = at + 1; add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Incremental Message is what was written, byte for byte */
inline equal_add_order_incremental_message(add_order_incremental_message_read, add_order_incremental_message_written) {
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> assert(add_order_incremental_message_read.timestamp[add_order_incremental_message_at] == add_order_incremental_message_written.timestamp[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> assert(add_order_incremental_message_read.order_id[add_order_incremental_message_at] == add_order_incremental_message_written.order_id[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  assert(add_order_incremental_message_read.side == add_order_incremental_message_written.side);
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> assert(add_order_incremental_message_read.size[add_order_incremental_message_at] == add_order_incremental_message_written.size[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> assert(add_order_incremental_message_read.instrument[add_order_incremental_message_at] == add_order_incremental_message_written.instrument[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> assert(add_order_incremental_message_read.price[add_order_incremental_message_at] == add_order_incremental_message_written.price[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 8 -> assert(add_order_incremental_message_read.transaction_time[add_order_incremental_message_at] == add_order_incremental_message_written.transaction_time[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 2 -> assert(add_order_incremental_message_read.source_venue[add_order_incremental_message_at] == add_order_incremental_message_written.source_venue[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  assert(add_order_incremental_message_read.order_book_type == add_order_incremental_message_written.order_book_type);
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 11 -> assert(add_order_incremental_message_read.participant[add_order_incremental_message_at] == add_order_incremental_message_written.participant[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  assert(add_order_incremental_message_read.order_type == add_order_incremental_message_written.order_type);
  add_order_incremental_message_at = 0;
  do
  :: add_order_incremental_message_at < 10 -> assert(add_order_incremental_message_read.rfq_id[add_order_incremental_message_at] == add_order_incremental_message_written.rfq_id[add_order_incremental_message_at]); add_order_incremental_message_at = add_order_incremental_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Delete Message: 52 bytes ------------------------------------------ */

/* Sent to instruct recipients to delete an order from the retrospective order book */
typedef OrderDeleteMessage {
  byte timestamp[8];
  byte order_id[8];
  byte instrument[8];
  byte side;
  byte order_book_type;
  byte source_venue[2];
  byte previous_price[8];
  byte previous_quantity[8];
  byte transaction_time[8]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.instrument[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = order_delete_message_value;
  order_delete_message_record.order_book_type = order_delete_message_value;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.source_venue[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.previous_price[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.previous_quantity[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.transaction_time[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = (order_delete_message_base + 8 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.instrument[order_delete_message_at] = (order_delete_message_base + 16 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = (order_delete_message_base + 24 + 1) % 256;
  order_delete_message_record.order_book_type = (order_delete_message_base + 25 + 1) % 256;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.source_venue[order_delete_message_at] = (order_delete_message_base + 26 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.previous_price[order_delete_message_at] = (order_delete_message_base + 28 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.previous_quantity[order_delete_message_at] = (order_delete_message_base + 36 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.transaction_time[order_delete_message_at] = (order_delete_message_base + 44 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 52 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.timestamp[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.instrument[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  wire[at] = order_delete_message_record.side; at = at + 1;
  wire[at] = order_delete_message_record.order_book_type; at = at + 1;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> wire[at] = order_delete_message_record.source_venue[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.previous_price[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.previous_quantity[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.transaction_time[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 52 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.instrument[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = wire[at]; at = at + 1;
  order_delete_message_record.order_book_type = wire[at]; at = at + 1;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.source_venue[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.previous_price[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.previous_quantity[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.transaction_time[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.timestamp[order_delete_message_at] == order_delete_message_written.timestamp[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_id[order_delete_message_at] == order_delete_message_written.order_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.instrument[order_delete_message_at] == order_delete_message_written.instrument[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  assert(order_delete_message_read.side == order_delete_message_written.side);
  assert(order_delete_message_read.order_book_type == order_delete_message_written.order_book_type);
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> assert(order_delete_message_read.source_venue[order_delete_message_at] == order_delete_message_written.source_venue[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.previous_price[order_delete_message_at] == order_delete_message_written.previous_price[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.previous_quantity[order_delete_message_at] == order_delete_message_written.previous_quantity[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.transaction_time[order_delete_message_at] == order_delete_message_written.transaction_time[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Clear Message: 19 bytes -------------------------------------- */

/* Sent to instruct recipients to remove all orders from the order book for the specified instrument */
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

/* ---- Statistics Message: 74 bytes -------------------------------------------- */

/* Contains a set of statistics that are updated frequently, usually as a result of executions */
typedef StatisticsMessage {
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
  byte turnover_on_book_only[8]
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.timestamp[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.instrument[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> statistics_message_record.source_venue[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.timestamp[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.instrument[statistics_message_at] = (statistics_message_base + 8 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> statistics_message_record.source_venue[statistics_message_at] = (statistics_message_base + 16 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume[statistics_message_at] = (statistics_message_base + 18 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume_on_book_only[statistics_message_at] = (statistics_message_base + 26 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap[statistics_message_at] = (statistics_message_base + 34 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap_on_book_only[statistics_message_at] = (statistics_message_base + 42 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades[statistics_message_at] = (statistics_message_base + 50 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades_on_book_only[statistics_message_at] = (statistics_message_base + 54 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = (statistics_message_base + 58 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover_on_book_only[statistics_message_at] = (statistics_message_base + 66 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message to the wire, 74 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.timestamp[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.instrument[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> wire[at] = statistics_message_record.source_venue[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.volume[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.volume_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.vwap[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.vwap_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.number_of_trades[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.number_of_trades_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.turnover[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.turnover_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message off the wire, 74 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.timestamp[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.instrument[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> statistics_message_record.source_venue[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.timestamp[statistics_message_at] == statistics_message_written.timestamp[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.instrument[statistics_message_at] == statistics_message_written.instrument[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> assert(statistics_message_read.source_venue[statistics_message_at] == statistics_message_written.source_venue[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.volume[statistics_message_at] == statistics_message_written.volume[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.volume_on_book_only[statistics_message_at] == statistics_message_written.volume_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.vwap[statistics_message_at] == statistics_message_written.vwap[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.vwap_on_book_only[statistics_message_at] == statistics_message_written.vwap_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.number_of_trades[statistics_message_at] == statistics_message_written.number_of_trades[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.number_of_trades_on_book_only[statistics_message_at] == statistics_message_written.number_of_trades_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.turnover[statistics_message_at] == statistics_message_written.turnover[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.turnover_on_book_only[statistics_message_at] == statistics_message_written.turnover_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Update Message: 47 bytes ------------------------------------- */

/* Contains a set of statistics that are not updated frequently */
typedef StatisticsUpdateMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte statistic_type[2];
  byte statistic_price[8];
  byte statistic_size[8];
  byte auction_type;
  byte imbalance_quantity[8];
  byte auction_info;
  byte opening_closing_price_indicator
};

int statistics_update_message_at;

/* every byte of Statistics Update Message set to one value */
inline fill_statistics_update_message(statistics_update_message_record, statistics_update_message_value) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.timestamp[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.instrument[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.source_venue[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.statistic_type[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_price[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_size[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_type = statistics_update_message_value;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.imbalance_quantity[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_info = statistics_update_message_value;
  statistics_update_message_record.opening_closing_price_indicator = statistics_update_message_value;
  skip
}

/* each byte of Statistics Update Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_update_message(statistics_update_message_record, statistics_update_message_base) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.timestamp[statistics_update_message_at] = (statistics_update_message_base + 0 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.instrument[statistics_update_message_at] = (statistics_update_message_base + 8 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.source_venue[statistics_update_message_at] = (statistics_update_message_base + 16 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.statistic_type[statistics_update_message_at] = (statistics_update_message_base + 18 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_price[statistics_update_message_at] = (statistics_update_message_base + 20 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_size[statistics_update_message_at] = (statistics_update_message_base + 28 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_type = (statistics_update_message_base + 36 + 1) % 256;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.imbalance_quantity[statistics_update_message_at] = (statistics_update_message_base + 37 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_info = (statistics_update_message_base + 45 + 1) % 256;
  statistics_update_message_record.opening_closing_price_indicator = (statistics_update_message_base + 46 + 1) % 256;
  skip
}

/* Statistics Update Message to the wire, 47 bytes from where the cursor stands */
inline encode_statistics_update_message(statistics_update_message_record) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.timestamp[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.instrument[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> wire[at] = statistics_update_message_record.source_venue[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> wire[at] = statistics_update_message_record.statistic_type[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.statistic_price[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.statistic_size[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_update_message_record.auction_type; at = at + 1;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.imbalance_quantity[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_update_message_record.auction_info; at = at + 1;
  wire[at] = statistics_update_message_record.opening_closing_price_indicator; at = at + 1;
  skip
}

/* Statistics Update Message off the wire, 47 bytes from where the cursor stands */
inline decode_statistics_update_message(statistics_update_message_record) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.timestamp[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.instrument[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.source_venue[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.statistic_type[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_price[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_size[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_type = wire[at]; at = at + 1;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.imbalance_quantity[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_info = wire[at]; at = at + 1;
  statistics_update_message_record.opening_closing_price_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Statistics Update Message is what was written, byte for byte */
inline equal_statistics_update_message(statistics_update_message_read, statistics_update_message_written) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.timestamp[statistics_update_message_at] == statistics_update_message_written.timestamp[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.instrument[statistics_update_message_at] == statistics_update_message_written.instrument[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> assert(statistics_update_message_read.source_venue[statistics_update_message_at] == statistics_update_message_written.source_venue[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> assert(statistics_update_message_read.statistic_type[statistics_update_message_at] == statistics_update_message_written.statistic_type[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.statistic_price[statistics_update_message_at] == statistics_update_message_written.statistic_price[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.statistic_size[statistics_update_message_at] == statistics_update_message_written.statistic_size[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  assert(statistics_update_message_read.auction_type == statistics_update_message_written.auction_type);
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.imbalance_quantity[statistics_update_message_at] == statistics_update_message_written.imbalance_quantity[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  assert(statistics_update_message_read.auction_info == statistics_update_message_written.auction_info);
  assert(statistics_update_message_read.opening_closing_price_indicator == statistics_update_message_written.opening_closing_price_indicator);
  skip
}

/* ---- Mifid Ii Trade Message: 283 bytes --------------------------------------- */

/* Sent to represent different types of MiFID compliant trades published by markets */
typedef MifidIiTradeMessage {
  byte timestamp[8];
  byte source_venue[2];
  byte instrument[8];
  byte transaction_identification_code[52];
  byte trade_type;
  byte auction_type;
  byte mi_fid_price[20];
  byte mi_fid_quantity[20];
  byte trading_date_and_time[27];
  byte instrument_identification_code_type[4];
  byte instrument_identification_code[12];
  byte price_notation[4];
  byte price_major_currency[3];
  byte notional_amount[20];
  byte notional_currency[3];
  byte venue_of_execution[4];
  byte publication_date_and_time[27];
  byte pt_ref_price_waiver_flag[4];
  byte reserved_4[4];
  byte market_closing_price_flag[4];
  byte pt_algo_trade[4];
  byte pt_cancellation_flag[4];
  byte pt_amendment_flag[4];
  byte reserved_1;
  byte reserved_3[3];
  byte reserved_20[20];
  byte second_reserved_4[4];
  byte trade_qualifier;
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
  byte duplicative_indicator
};

int mifid_ii_trade_message_at;

/* every byte of Mifid Ii Trade Message set to one value */
inline fill_mifid_ii_trade_message(mifid_ii_trade_message_record, mifid_ii_trade_message_value) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_type = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.auction_type = mifid_ii_trade_message_value;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.reserved_1 = mifid_ii_trade_message_value;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.second_reserved_4[mifid_ii_trade_message_at] = mifid_ii_trade_message_value; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_qualifier = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.market_mechanism = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.trading_mode = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.transaction_category = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.negotiation_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.agency_cross_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.modification_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.reference_price_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.special_dividend_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.off_book_automated_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.price_formation_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.algorithmic_indicator = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.post_trade_deferral_reason = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.deferral_enrichment_type = mifid_ii_trade_message_value;
  mifid_ii_trade_message_record.duplicative_indicator = mifid_ii_trade_message_value;
  skip
}

/* each byte of Mifid Ii Trade Message set to where it lies, so a field read out of place says so */
inline ramp_mifid_ii_trade_message(mifid_ii_trade_message_record, mifid_ii_trade_message_base) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 0 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 8 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 10 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 18 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_type = (mifid_ii_trade_message_base + 70 + 1) % 256;
  mifid_ii_trade_message_record.auction_type = (mifid_ii_trade_message_base + 71 + 1) % 256;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 72 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 92 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 112 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 139 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 143 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 155 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 159 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 162 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 182 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 185 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 189 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 216 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 220 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 224 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 228 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 232 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 236 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.reserved_1 = (mifid_ii_trade_message_base + 240 + 1) % 256;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 241 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 244 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.second_reserved_4[mifid_ii_trade_message_at] = (mifid_ii_trade_message_base + 264 + mifid_ii_trade_message_at + 1) % 256; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_qualifier = (mifid_ii_trade_message_base + 268 + 1) % 256;
  mifid_ii_trade_message_record.market_mechanism = (mifid_ii_trade_message_base + 269 + 1) % 256;
  mifid_ii_trade_message_record.trading_mode = (mifid_ii_trade_message_base + 270 + 1) % 256;
  mifid_ii_trade_message_record.transaction_category = (mifid_ii_trade_message_base + 271 + 1) % 256;
  mifid_ii_trade_message_record.negotiation_indicator = (mifid_ii_trade_message_base + 272 + 1) % 256;
  mifid_ii_trade_message_record.agency_cross_indicator = (mifid_ii_trade_message_base + 273 + 1) % 256;
  mifid_ii_trade_message_record.modification_indicator = (mifid_ii_trade_message_base + 274 + 1) % 256;
  mifid_ii_trade_message_record.reference_price_indicator = (mifid_ii_trade_message_base + 275 + 1) % 256;
  mifid_ii_trade_message_record.special_dividend_indicator = (mifid_ii_trade_message_base + 276 + 1) % 256;
  mifid_ii_trade_message_record.off_book_automated_indicator = (mifid_ii_trade_message_base + 277 + 1) % 256;
  mifid_ii_trade_message_record.price_formation_indicator = (mifid_ii_trade_message_base + 278 + 1) % 256;
  mifid_ii_trade_message_record.algorithmic_indicator = (mifid_ii_trade_message_base + 279 + 1) % 256;
  mifid_ii_trade_message_record.post_trade_deferral_reason = (mifid_ii_trade_message_base + 280 + 1) % 256;
  mifid_ii_trade_message_record.deferral_enrichment_type = (mifid_ii_trade_message_base + 281 + 1) % 256;
  mifid_ii_trade_message_record.duplicative_indicator = (mifid_ii_trade_message_base + 282 + 1) % 256;
  skip
}

/* Mifid Ii Trade Message to the wire, 283 bytes from where the cursor stands */
inline encode_mifid_ii_trade_message(mifid_ii_trade_message_record) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> wire[at] = mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> wire[at] = mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> wire[at] = mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> wire[at] = mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_message_record.trade_type; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.auction_type; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> wire[at] = mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> wire[at] = mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> wire[at] = mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> wire[at] = mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> wire[at] = mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_message_record.reserved_1; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> wire[at] = mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> wire[at] = mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> wire[at] = mifid_ii_trade_message_record.second_reserved_4[mifid_ii_trade_message_at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = mifid_ii_trade_message_record.trade_qualifier; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.market_mechanism; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.trading_mode; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.transaction_category; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.negotiation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.agency_cross_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.modification_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.reference_price_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.special_dividend_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.off_book_automated_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.price_formation_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.algorithmic_indicator; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.post_trade_deferral_reason; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.deferral_enrichment_type; at = at + 1;
  wire[at] = mifid_ii_trade_message_record.duplicative_indicator; at = at + 1;
  skip
}

/* Mifid Ii Trade Message off the wire, 283 bytes from where the cursor stands */
inline decode_mifid_ii_trade_message(mifid_ii_trade_message_record) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.timestamp[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> mifid_ii_trade_message_record.source_venue[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> mifid_ii_trade_message_record.instrument[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> mifid_ii_trade_message_record.transaction_identification_code[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_type = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.auction_type = wire[at]; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_price[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.mi_fid_quantity[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> mifid_ii_trade_message_record.trading_date_and_time[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.instrument_identification_code_type[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> mifid_ii_trade_message_record.instrument_identification_code[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.price_notation[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.price_major_currency[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.notional_amount[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.notional_currency[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.venue_of_execution[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> mifid_ii_trade_message_record.publication_date_and_time[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.reserved_4[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.market_closing_price_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_algo_trade[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_cancellation_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.pt_amendment_flag[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.reserved_1 = wire[at]; at = at + 1;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> mifid_ii_trade_message_record.reserved_3[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> mifid_ii_trade_message_record.reserved_20[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> mifid_ii_trade_message_record.second_reserved_4[mifid_ii_trade_message_at] = wire[at]; at = at + 1; mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_record.trade_qualifier = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.market_mechanism = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.trading_mode = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.transaction_category = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.negotiation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.agency_cross_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.modification_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.reference_price_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.special_dividend_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.off_book_automated_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.price_formation_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.algorithmic_indicator = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.post_trade_deferral_reason = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.deferral_enrichment_type = wire[at]; at = at + 1;
  mifid_ii_trade_message_record.duplicative_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Mifid Ii Trade Message is what was written, byte for byte */
inline equal_mifid_ii_trade_message(mifid_ii_trade_message_read, mifid_ii_trade_message_written) {
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> assert(mifid_ii_trade_message_read.timestamp[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.timestamp[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 2 -> assert(mifid_ii_trade_message_read.source_venue[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.source_venue[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 8 -> assert(mifid_ii_trade_message_read.instrument[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.instrument[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 52 -> assert(mifid_ii_trade_message_read.transaction_identification_code[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.transaction_identification_code[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_message_read.trade_type == mifid_ii_trade_message_written.trade_type);
  assert(mifid_ii_trade_message_read.auction_type == mifid_ii_trade_message_written.auction_type);
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.mi_fid_price[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.mi_fid_price[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.mi_fid_quantity[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.mi_fid_quantity[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> assert(mifid_ii_trade_message_read.trading_date_and_time[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.trading_date_and_time[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.instrument_identification_code_type[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.instrument_identification_code_type[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 12 -> assert(mifid_ii_trade_message_read.instrument_identification_code[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.instrument_identification_code[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.price_notation[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.price_notation[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> assert(mifid_ii_trade_message_read.price_major_currency[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.price_major_currency[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.notional_amount[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.notional_amount[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> assert(mifid_ii_trade_message_read.notional_currency[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.notional_currency[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.venue_of_execution[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.venue_of_execution[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 27 -> assert(mifid_ii_trade_message_read.publication_date_and_time[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.publication_date_and_time[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_ref_price_waiver_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_ref_price_waiver_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.reserved_4[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.reserved_4[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.market_closing_price_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.market_closing_price_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_algo_trade[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_algo_trade[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_cancellation_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_cancellation_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.pt_amendment_flag[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.pt_amendment_flag[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_message_read.reserved_1 == mifid_ii_trade_message_written.reserved_1);
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 3 -> assert(mifid_ii_trade_message_read.reserved_3[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.reserved_3[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 20 -> assert(mifid_ii_trade_message_read.reserved_20[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.reserved_20[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  mifid_ii_trade_message_at = 0;
  do
  :: mifid_ii_trade_message_at < 4 -> assert(mifid_ii_trade_message_read.second_reserved_4[mifid_ii_trade_message_at] == mifid_ii_trade_message_written.second_reserved_4[mifid_ii_trade_message_at]); mifid_ii_trade_message_at = mifid_ii_trade_message_at + 1
  :: else -> break
  od;
  assert(mifid_ii_trade_message_read.trade_qualifier == mifid_ii_trade_message_written.trade_qualifier);
  assert(mifid_ii_trade_message_read.market_mechanism == mifid_ii_trade_message_written.market_mechanism);
  assert(mifid_ii_trade_message_read.trading_mode == mifid_ii_trade_message_written.trading_mode);
  assert(mifid_ii_trade_message_read.transaction_category == mifid_ii_trade_message_written.transaction_category);
  assert(mifid_ii_trade_message_read.negotiation_indicator == mifid_ii_trade_message_written.negotiation_indicator);
  assert(mifid_ii_trade_message_read.agency_cross_indicator == mifid_ii_trade_message_written.agency_cross_indicator);
  assert(mifid_ii_trade_message_read.modification_indicator == mifid_ii_trade_message_written.modification_indicator);
  assert(mifid_ii_trade_message_read.reference_price_indicator == mifid_ii_trade_message_written.reference_price_indicator);
  assert(mifid_ii_trade_message_read.special_dividend_indicator == mifid_ii_trade_message_written.special_dividend_indicator);
  assert(mifid_ii_trade_message_read.off_book_automated_indicator == mifid_ii_trade_message_written.off_book_automated_indicator);
  assert(mifid_ii_trade_message_read.price_formation_indicator == mifid_ii_trade_message_written.price_formation_indicator);
  assert(mifid_ii_trade_message_read.algorithmic_indicator == mifid_ii_trade_message_written.algorithmic_indicator);
  assert(mifid_ii_trade_message_read.post_trade_deferral_reason == mifid_ii_trade_message_written.post_trade_deferral_reason);
  assert(mifid_ii_trade_message_read.deferral_enrichment_type == mifid_ii_trade_message_written.deferral_enrichment_type);
  assert(mifid_ii_trade_message_read.duplicative_indicator == mifid_ii_trade_message_written.duplicative_indicator);
  skip
}

/* ---- Mi Fid Ii Trade Cross Message: 301 bytes -------------------------------- */

/* Sent to indicate a MiFID compliant cross trade */
typedef MiFidIiTradeCrossMessage {
  byte timestamp[8];
  byte source_venue[2];
  byte instrument[8];
  byte transaction_identification_code[52];
  byte cross_id[20];
  byte cross_type;
  byte mi_fid_price[20];
  byte mi_fid_quantity[20];
  byte trading_date_and_time[27];
  byte instrument_identification_code_type[4];
  byte instrument_identification_code[12];
  byte price_notation[4];
  byte price_major_currency[3];
  byte notional_amount[20];
  byte notional_currency[3];
  byte venue_of_execution[4];
  byte publication_date_and_time[27];
  byte reserved_4[4];
  byte nt_pre_trade_waiver_flag[4];
  byte pt_algo_trade[4];
  byte second_reserved_4[4];
  byte pt_cancellation_flag[4];
  byte pt_amendment_flag[4];
  byte reserved_1;
  byte reserved_3[3];
  byte reserved_20[20];
  byte third_reserved_4[4];
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
  byte duplicative_indicator
};

int mi_fid_ii_trade_cross_message_at;

/* every byte of Mi Fid Ii Trade Cross Message set to one value */
inline fill_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_record, mi_fid_ii_trade_cross_message_value) {
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> mi_fid_ii_trade_cross_message_record.timestamp[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 2 -> mi_fid_ii_trade_cross_message_record.source_venue[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> mi_fid_ii_trade_cross_message_record.instrument[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 52 -> mi_fid_ii_trade_cross_message_record.transaction_identification_code[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.cross_id[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.cross_type = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.mi_fid_price[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.mi_fid_quantity[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> mi_fid_ii_trade_cross_message_record.trading_date_and_time[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.instrument_identification_code_type[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 12 -> mi_fid_ii_trade_cross_message_record.instrument_identification_code[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.price_notation[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.price_major_currency[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.notional_amount[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.notional_currency[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.venue_of_execution[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> mi_fid_ii_trade_cross_message_record.publication_date_and_time[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.reserved_4[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_algo_trade[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.second_reserved_4[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_cancellation_flag[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_amendment_flag[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.reserved_1 = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.reserved_3[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.reserved_20[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.third_reserved_4[mi_fid_ii_trade_cross_message_at] = mi_fid_ii_trade_cross_message_value; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.market_mechanism = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.trading_mode = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.transaction_category = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.negotiation_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.agency_cross_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.modification_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.reference_price_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.special_dividend_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.off_book_automated_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.price_formation_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.algorithmic_indicator = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.post_trade_deferral_reason = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.deferral_enrichment_type = mi_fid_ii_trade_cross_message_value;
  mi_fid_ii_trade_cross_message_record.duplicative_indicator = mi_fid_ii_trade_cross_message_value;
  skip
}

/* each byte of Mi Fid Ii Trade Cross Message set to where it lies, so a field read out of place says so */
inline ramp_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_record, mi_fid_ii_trade_cross_message_base) {
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> mi_fid_ii_trade_cross_message_record.timestamp[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 0 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 2 -> mi_fid_ii_trade_cross_message_record.source_venue[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 8 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> mi_fid_ii_trade_cross_message_record.instrument[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 10 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 52 -> mi_fid_ii_trade_cross_message_record.transaction_identification_code[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 18 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.cross_id[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 70 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.cross_type = (mi_fid_ii_trade_cross_message_base + 90 + 1) % 256;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.mi_fid_price[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 91 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.mi_fid_quantity[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 111 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> mi_fid_ii_trade_cross_message_record.trading_date_and_time[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 131 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.instrument_identification_code_type[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 158 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 12 -> mi_fid_ii_trade_cross_message_record.instrument_identification_code[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 162 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.price_notation[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 174 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.price_major_currency[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 178 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.notional_amount[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 181 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.notional_currency[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 201 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.venue_of_execution[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 204 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> mi_fid_ii_trade_cross_message_record.publication_date_and_time[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 208 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.reserved_4[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 235 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 239 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_algo_trade[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 243 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.second_reserved_4[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 247 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_cancellation_flag[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 251 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_amendment_flag[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 255 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.reserved_1 = (mi_fid_ii_trade_cross_message_base + 259 + 1) % 256;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.reserved_3[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 260 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.reserved_20[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 263 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.third_reserved_4[mi_fid_ii_trade_cross_message_at] = (mi_fid_ii_trade_cross_message_base + 283 + mi_fid_ii_trade_cross_message_at + 1) % 256; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.market_mechanism = (mi_fid_ii_trade_cross_message_base + 287 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.trading_mode = (mi_fid_ii_trade_cross_message_base + 288 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.transaction_category = (mi_fid_ii_trade_cross_message_base + 289 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.negotiation_indicator = (mi_fid_ii_trade_cross_message_base + 290 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.agency_cross_indicator = (mi_fid_ii_trade_cross_message_base + 291 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.modification_indicator = (mi_fid_ii_trade_cross_message_base + 292 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.reference_price_indicator = (mi_fid_ii_trade_cross_message_base + 293 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.special_dividend_indicator = (mi_fid_ii_trade_cross_message_base + 294 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.off_book_automated_indicator = (mi_fid_ii_trade_cross_message_base + 295 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.price_formation_indicator = (mi_fid_ii_trade_cross_message_base + 296 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.algorithmic_indicator = (mi_fid_ii_trade_cross_message_base + 297 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.post_trade_deferral_reason = (mi_fid_ii_trade_cross_message_base + 298 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.deferral_enrichment_type = (mi_fid_ii_trade_cross_message_base + 299 + 1) % 256;
  mi_fid_ii_trade_cross_message_record.duplicative_indicator = (mi_fid_ii_trade_cross_message_base + 300 + 1) % 256;
  skip
}

/* Mi Fid Ii Trade Cross Message to the wire, 301 bytes from where the cursor stands */
inline encode_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_record) {
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> wire[at] = mi_fid_ii_trade_cross_message_record.timestamp[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 2 -> wire[at] = mi_fid_ii_trade_cross_message_record.source_venue[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> wire[at] = mi_fid_ii_trade_cross_message_record.instrument[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 52 -> wire[at] = mi_fid_ii_trade_cross_message_record.transaction_identification_code[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> wire[at] = mi_fid_ii_trade_cross_message_record.cross_id[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  wire[at] = mi_fid_ii_trade_cross_message_record.cross_type; at = at + 1;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> wire[at] = mi_fid_ii_trade_cross_message_record.mi_fid_price[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> wire[at] = mi_fid_ii_trade_cross_message_record.mi_fid_quantity[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> wire[at] = mi_fid_ii_trade_cross_message_record.trading_date_and_time[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.instrument_identification_code_type[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 12 -> wire[at] = mi_fid_ii_trade_cross_message_record.instrument_identification_code[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.price_notation[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> wire[at] = mi_fid_ii_trade_cross_message_record.price_major_currency[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> wire[at] = mi_fid_ii_trade_cross_message_record.notional_amount[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> wire[at] = mi_fid_ii_trade_cross_message_record.notional_currency[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.venue_of_execution[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> wire[at] = mi_fid_ii_trade_cross_message_record.publication_date_and_time[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.reserved_4[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.pt_algo_trade[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.second_reserved_4[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.pt_cancellation_flag[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.pt_amendment_flag[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  wire[at] = mi_fid_ii_trade_cross_message_record.reserved_1; at = at + 1;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> wire[at] = mi_fid_ii_trade_cross_message_record.reserved_3[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> wire[at] = mi_fid_ii_trade_cross_message_record.reserved_20[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> wire[at] = mi_fid_ii_trade_cross_message_record.third_reserved_4[mi_fid_ii_trade_cross_message_at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  wire[at] = mi_fid_ii_trade_cross_message_record.market_mechanism; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.trading_mode; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.transaction_category; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.negotiation_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.agency_cross_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.modification_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.reference_price_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.special_dividend_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.off_book_automated_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.price_formation_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.algorithmic_indicator; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.post_trade_deferral_reason; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.deferral_enrichment_type; at = at + 1;
  wire[at] = mi_fid_ii_trade_cross_message_record.duplicative_indicator; at = at + 1;
  skip
}

/* Mi Fid Ii Trade Cross Message off the wire, 301 bytes from where the cursor stands */
inline decode_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_record) {
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> mi_fid_ii_trade_cross_message_record.timestamp[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 2 -> mi_fid_ii_trade_cross_message_record.source_venue[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> mi_fid_ii_trade_cross_message_record.instrument[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 52 -> mi_fid_ii_trade_cross_message_record.transaction_identification_code[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.cross_id[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.cross_type = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.mi_fid_price[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.mi_fid_quantity[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> mi_fid_ii_trade_cross_message_record.trading_date_and_time[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.instrument_identification_code_type[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 12 -> mi_fid_ii_trade_cross_message_record.instrument_identification_code[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.price_notation[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.price_major_currency[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.notional_amount[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.notional_currency[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.venue_of_execution[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> mi_fid_ii_trade_cross_message_record.publication_date_and_time[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.reserved_4[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.nt_pre_trade_waiver_flag[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_algo_trade[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.second_reserved_4[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_cancellation_flag[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.pt_amendment_flag[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.reserved_1 = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> mi_fid_ii_trade_cross_message_record.reserved_3[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> mi_fid_ii_trade_cross_message_record.reserved_20[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> mi_fid_ii_trade_cross_message_record.third_reserved_4[mi_fid_ii_trade_cross_message_at] = wire[at]; at = at + 1; mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_record.market_mechanism = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.trading_mode = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.transaction_category = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.negotiation_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.agency_cross_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.modification_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.reference_price_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.special_dividend_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.off_book_automated_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.price_formation_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.algorithmic_indicator = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.post_trade_deferral_reason = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.deferral_enrichment_type = wire[at]; at = at + 1;
  mi_fid_ii_trade_cross_message_record.duplicative_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Mi Fid Ii Trade Cross Message is what was written, byte for byte */
inline equal_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_read, mi_fid_ii_trade_cross_message_written) {
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> assert(mi_fid_ii_trade_cross_message_read.timestamp[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.timestamp[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 2 -> assert(mi_fid_ii_trade_cross_message_read.source_venue[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.source_venue[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 8 -> assert(mi_fid_ii_trade_cross_message_read.instrument[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.instrument[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 52 -> assert(mi_fid_ii_trade_cross_message_read.transaction_identification_code[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.transaction_identification_code[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> assert(mi_fid_ii_trade_cross_message_read.cross_id[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.cross_id[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  assert(mi_fid_ii_trade_cross_message_read.cross_type == mi_fid_ii_trade_cross_message_written.cross_type);
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> assert(mi_fid_ii_trade_cross_message_read.mi_fid_price[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.mi_fid_price[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> assert(mi_fid_ii_trade_cross_message_read.mi_fid_quantity[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.mi_fid_quantity[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> assert(mi_fid_ii_trade_cross_message_read.trading_date_and_time[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.trading_date_and_time[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.instrument_identification_code_type[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.instrument_identification_code_type[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 12 -> assert(mi_fid_ii_trade_cross_message_read.instrument_identification_code[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.instrument_identification_code[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.price_notation[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.price_notation[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> assert(mi_fid_ii_trade_cross_message_read.price_major_currency[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.price_major_currency[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> assert(mi_fid_ii_trade_cross_message_read.notional_amount[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.notional_amount[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> assert(mi_fid_ii_trade_cross_message_read.notional_currency[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.notional_currency[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.venue_of_execution[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.venue_of_execution[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 27 -> assert(mi_fid_ii_trade_cross_message_read.publication_date_and_time[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.publication_date_and_time[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.reserved_4[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.reserved_4[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.nt_pre_trade_waiver_flag[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.nt_pre_trade_waiver_flag[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.pt_algo_trade[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.pt_algo_trade[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.second_reserved_4[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.second_reserved_4[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.pt_cancellation_flag[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.pt_cancellation_flag[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.pt_amendment_flag[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.pt_amendment_flag[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  assert(mi_fid_ii_trade_cross_message_read.reserved_1 == mi_fid_ii_trade_cross_message_written.reserved_1);
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 3 -> assert(mi_fid_ii_trade_cross_message_read.reserved_3[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.reserved_3[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 20 -> assert(mi_fid_ii_trade_cross_message_read.reserved_20[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.reserved_20[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  mi_fid_ii_trade_cross_message_at = 0;
  do
  :: mi_fid_ii_trade_cross_message_at < 4 -> assert(mi_fid_ii_trade_cross_message_read.third_reserved_4[mi_fid_ii_trade_cross_message_at] == mi_fid_ii_trade_cross_message_written.third_reserved_4[mi_fid_ii_trade_cross_message_at]); mi_fid_ii_trade_cross_message_at = mi_fid_ii_trade_cross_message_at + 1
  :: else -> break
  od;
  assert(mi_fid_ii_trade_cross_message_read.market_mechanism == mi_fid_ii_trade_cross_message_written.market_mechanism);
  assert(mi_fid_ii_trade_cross_message_read.trading_mode == mi_fid_ii_trade_cross_message_written.trading_mode);
  assert(mi_fid_ii_trade_cross_message_read.transaction_category == mi_fid_ii_trade_cross_message_written.transaction_category);
  assert(mi_fid_ii_trade_cross_message_read.negotiation_indicator == mi_fid_ii_trade_cross_message_written.negotiation_indicator);
  assert(mi_fid_ii_trade_cross_message_read.agency_cross_indicator == mi_fid_ii_trade_cross_message_written.agency_cross_indicator);
  assert(mi_fid_ii_trade_cross_message_read.modification_indicator == mi_fid_ii_trade_cross_message_written.modification_indicator);
  assert(mi_fid_ii_trade_cross_message_read.reference_price_indicator == mi_fid_ii_trade_cross_message_written.reference_price_indicator);
  assert(mi_fid_ii_trade_cross_message_read.special_dividend_indicator == mi_fid_ii_trade_cross_message_written.special_dividend_indicator);
  assert(mi_fid_ii_trade_cross_message_read.off_book_automated_indicator == mi_fid_ii_trade_cross_message_written.off_book_automated_indicator);
  assert(mi_fid_ii_trade_cross_message_read.price_formation_indicator == mi_fid_ii_trade_cross_message_written.price_formation_indicator);
  assert(mi_fid_ii_trade_cross_message_read.algorithmic_indicator == mi_fid_ii_trade_cross_message_written.algorithmic_indicator);
  assert(mi_fid_ii_trade_cross_message_read.post_trade_deferral_reason == mi_fid_ii_trade_cross_message_written.post_trade_deferral_reason);
  assert(mi_fid_ii_trade_cross_message_read.deferral_enrichment_type == mi_fid_ii_trade_cross_message_written.deferral_enrichment_type);
  assert(mi_fid_ii_trade_cross_message_read.duplicative_indicator == mi_fid_ii_trade_cross_message_written.duplicative_indicator);
  skip
}

/* ---- Trade Summary Message: 91 bytes ----------------------------------------- */

/* Trade Summary message is used to disseminate results of multi and single fill trade events */
typedef TradeSummaryMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte transaction_time[8];
  byte far_price[8];
  byte total_executed_quantity[8];
  byte total_hidden_executed_quantity[8];
  byte deleted_order_quantity[8];
  byte side;
  byte best_bid_size[8];
  byte best_bid_price[8];
  byte best_offer_size[8];
  byte best_offer_price[8]
};

int trade_summary_message_at;

/* every byte of Trade Summary Message set to one value */
inline fill_trade_summary_message(trade_summary_message_record, trade_summary_message_value) {
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.timestamp[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.instrument[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 2 -> trade_summary_message_record.source_venue[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.transaction_time[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.far_price[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.total_executed_quantity[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.total_hidden_executed_quantity[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.deleted_order_quantity[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_record.side = trade_summary_message_value;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_bid_size[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_bid_price[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_offer_size[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_offer_price[trade_summary_message_at] = trade_summary_message_value; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Summary Message set to where it lies, so a field read out of place says so */
inline ramp_trade_summary_message(trade_summary_message_record, trade_summary_message_base) {
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.timestamp[trade_summary_message_at] = (trade_summary_message_base + 0 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.instrument[trade_summary_message_at] = (trade_summary_message_base + 8 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 2 -> trade_summary_message_record.source_venue[trade_summary_message_at] = (trade_summary_message_base + 16 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.transaction_time[trade_summary_message_at] = (trade_summary_message_base + 18 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.far_price[trade_summary_message_at] = (trade_summary_message_base + 26 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.total_executed_quantity[trade_summary_message_at] = (trade_summary_message_base + 34 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.total_hidden_executed_quantity[trade_summary_message_at] = (trade_summary_message_base + 42 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.deleted_order_quantity[trade_summary_message_at] = (trade_summary_message_base + 50 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_record.side = (trade_summary_message_base + 58 + 1) % 256;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_bid_size[trade_summary_message_at] = (trade_summary_message_base + 59 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_bid_price[trade_summary_message_at] = (trade_summary_message_base + 67 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_offer_size[trade_summary_message_at] = (trade_summary_message_base + 75 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_offer_price[trade_summary_message_at] = (trade_summary_message_base + 83 + trade_summary_message_at + 1) % 256; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Summary Message to the wire, 91 bytes from where the cursor stands */
inline encode_trade_summary_message(trade_summary_message_record) {
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.timestamp[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.instrument[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 2 -> wire[at] = trade_summary_message_record.source_venue[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.transaction_time[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.far_price[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.total_executed_quantity[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.total_hidden_executed_quantity[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.deleted_order_quantity[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_summary_message_record.side; at = at + 1;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.best_bid_size[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.best_bid_price[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.best_offer_size[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> wire[at] = trade_summary_message_record.best_offer_price[trade_summary_message_at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Summary Message off the wire, 91 bytes from where the cursor stands */
inline decode_trade_summary_message(trade_summary_message_record) {
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.timestamp[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.instrument[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 2 -> trade_summary_message_record.source_venue[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.transaction_time[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.far_price[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.total_executed_quantity[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.total_hidden_executed_quantity[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.deleted_order_quantity[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_record.side = wire[at]; at = at + 1;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_bid_size[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_bid_price[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_offer_size[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> trade_summary_message_record.best_offer_price[trade_summary_message_at] = wire[at]; at = at + 1; trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Summary Message is what was written, byte for byte */
inline equal_trade_summary_message(trade_summary_message_read, trade_summary_message_written) {
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.timestamp[trade_summary_message_at] == trade_summary_message_written.timestamp[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.instrument[trade_summary_message_at] == trade_summary_message_written.instrument[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 2 -> assert(trade_summary_message_read.source_venue[trade_summary_message_at] == trade_summary_message_written.source_venue[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.transaction_time[trade_summary_message_at] == trade_summary_message_written.transaction_time[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.far_price[trade_summary_message_at] == trade_summary_message_written.far_price[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.total_executed_quantity[trade_summary_message_at] == trade_summary_message_written.total_executed_quantity[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.total_hidden_executed_quantity[trade_summary_message_at] == trade_summary_message_written.total_hidden_executed_quantity[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.deleted_order_quantity[trade_summary_message_at] == trade_summary_message_written.deleted_order_quantity[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  assert(trade_summary_message_read.side == trade_summary_message_written.side);
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.best_bid_size[trade_summary_message_at] == trade_summary_message_written.best_bid_size[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.best_bid_price[trade_summary_message_at] == trade_summary_message_written.best_bid_price[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.best_offer_size[trade_summary_message_at] == trade_summary_message_written.best_offer_size[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  trade_summary_message_at = 0;
  do
  :: trade_summary_message_at < 8 -> assert(trade_summary_message_read.best_offer_price[trade_summary_message_at] == trade_summary_message_written.best_offer_price[trade_summary_message_at]); trade_summary_message_at = trade_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Analytics Message: 106 bytes -------------------------------------------- */

/* Used to disseminate additional statistics including order book activity statistics */
typedef AnalyticsMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte start_time[8];
  byte end_time[8];
  byte buy_order_count[4];
  byte sell_order_count[4];
  byte buy_order_size[8];
  byte sell_order_size[8];
  byte buy_order_cancellations[4];
  byte sell_order_cancellations[4];
  byte buy_limit_order_cancellations[4];
  byte buy_market_order_cancellations[4];
  byte sell_limit_order_cancellations[4];
  byte sell_market_order_cancellations[4];
  byte bid_ask_spread[8];
  byte vwap_buy[8];
  byte vwap_sell[8]
};

int analytics_message_at;

/* every byte of Analytics Message set to one value */
inline fill_analytics_message(analytics_message_record, analytics_message_value) {
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.timestamp[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.instrument[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 2 -> analytics_message_record.source_venue[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.start_time[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.end_time[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_order_count[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_order_count[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.buy_order_size[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.sell_order_size[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_order_cancellations[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_order_cancellations[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_limit_order_cancellations[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_market_order_cancellations[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_limit_order_cancellations[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_market_order_cancellations[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.bid_ask_spread[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.vwap_buy[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.vwap_sell[analytics_message_at] = analytics_message_value; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Analytics Message set to where it lies, so a field read out of place says so */
inline ramp_analytics_message(analytics_message_record, analytics_message_base) {
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.timestamp[analytics_message_at] = (analytics_message_base + 0 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.instrument[analytics_message_at] = (analytics_message_base + 8 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 2 -> analytics_message_record.source_venue[analytics_message_at] = (analytics_message_base + 16 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.start_time[analytics_message_at] = (analytics_message_base + 18 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.end_time[analytics_message_at] = (analytics_message_base + 26 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_order_count[analytics_message_at] = (analytics_message_base + 34 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_order_count[analytics_message_at] = (analytics_message_base + 38 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.buy_order_size[analytics_message_at] = (analytics_message_base + 42 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.sell_order_size[analytics_message_at] = (analytics_message_base + 50 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_order_cancellations[analytics_message_at] = (analytics_message_base + 58 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_order_cancellations[analytics_message_at] = (analytics_message_base + 62 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_limit_order_cancellations[analytics_message_at] = (analytics_message_base + 66 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_market_order_cancellations[analytics_message_at] = (analytics_message_base + 70 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_limit_order_cancellations[analytics_message_at] = (analytics_message_base + 74 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_market_order_cancellations[analytics_message_at] = (analytics_message_base + 78 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.bid_ask_spread[analytics_message_at] = (analytics_message_base + 82 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.vwap_buy[analytics_message_at] = (analytics_message_base + 90 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.vwap_sell[analytics_message_at] = (analytics_message_base + 98 + analytics_message_at + 1) % 256; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Analytics Message to the wire, 106 bytes from where the cursor stands */
inline encode_analytics_message(analytics_message_record) {
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.timestamp[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.instrument[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 2 -> wire[at] = analytics_message_record.source_venue[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.start_time[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.end_time[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.buy_order_count[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.sell_order_count[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.buy_order_size[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.sell_order_size[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.buy_order_cancellations[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.sell_order_cancellations[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.buy_limit_order_cancellations[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.buy_market_order_cancellations[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.sell_limit_order_cancellations[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> wire[at] = analytics_message_record.sell_market_order_cancellations[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.bid_ask_spread[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.vwap_buy[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> wire[at] = analytics_message_record.vwap_sell[analytics_message_at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Analytics Message off the wire, 106 bytes from where the cursor stands */
inline decode_analytics_message(analytics_message_record) {
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.timestamp[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.instrument[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 2 -> analytics_message_record.source_venue[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.start_time[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.end_time[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_order_count[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_order_count[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.buy_order_size[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.sell_order_size[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_order_cancellations[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_order_cancellations[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_limit_order_cancellations[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.buy_market_order_cancellations[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_limit_order_cancellations[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> analytics_message_record.sell_market_order_cancellations[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.bid_ask_spread[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.vwap_buy[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> analytics_message_record.vwap_sell[analytics_message_at] = wire[at]; at = at + 1; analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Analytics Message is what was written, byte for byte */
inline equal_analytics_message(analytics_message_read, analytics_message_written) {
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.timestamp[analytics_message_at] == analytics_message_written.timestamp[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.instrument[analytics_message_at] == analytics_message_written.instrument[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 2 -> assert(analytics_message_read.source_venue[analytics_message_at] == analytics_message_written.source_venue[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.start_time[analytics_message_at] == analytics_message_written.start_time[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.end_time[analytics_message_at] == analytics_message_written.end_time[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.buy_order_count[analytics_message_at] == analytics_message_written.buy_order_count[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.sell_order_count[analytics_message_at] == analytics_message_written.sell_order_count[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.buy_order_size[analytics_message_at] == analytics_message_written.buy_order_size[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.sell_order_size[analytics_message_at] == analytics_message_written.sell_order_size[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.buy_order_cancellations[analytics_message_at] == analytics_message_written.buy_order_cancellations[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.sell_order_cancellations[analytics_message_at] == analytics_message_written.sell_order_cancellations[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.buy_limit_order_cancellations[analytics_message_at] == analytics_message_written.buy_limit_order_cancellations[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.buy_market_order_cancellations[analytics_message_at] == analytics_message_written.buy_market_order_cancellations[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.sell_limit_order_cancellations[analytics_message_at] == analytics_message_written.sell_limit_order_cancellations[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 4 -> assert(analytics_message_read.sell_market_order_cancellations[analytics_message_at] == analytics_message_written.sell_market_order_cancellations[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.bid_ask_spread[analytics_message_at] == analytics_message_written.bid_ask_spread[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.vwap_buy[analytics_message_at] == analytics_message_written.vwap_buy[analytics_message_at]); analytics_message_at = analytics_message_at + 1
  :: else -> break
  od;
  analytics_message_at = 0;
  do
  :: analytics_message_at < 8 -> assert(analytics_message_read.vwap_sell[analytics_message_at] == analytics_message_written.vwap_sell[analytics_message_at]); analytics_message_at = analytics_message_at + 1
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

/* Add Order Incremental Message: encoded, read back, and compared */
proctype check_add_order_incremental_message() {
  AddOrderIncrementalMessage add_order_incremental_message_sent;
  AddOrderIncrementalMessage add_order_incremental_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_incremental_message(add_order_incremental_message_sent, 0)
  :: pattern == 1 -> fill_add_order_incremental_message(add_order_incremental_message_sent, 32)
  :: pattern == 2 -> fill_add_order_incremental_message(add_order_incremental_message_sent, 255)
  :: else -> ramp_add_order_incremental_message(add_order_incremental_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_incremental_message(add_order_incremental_message_sent);
    assert(at == 74);
    at = 0;
    decode_add_order_incremental_message(add_order_incremental_message_got);
    assert(at == 74);
    equal_add_order_incremental_message(add_order_incremental_message_got, add_order_incremental_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 52);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 52);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
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
    assert(at == 74);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 74);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
  }
}

/* Statistics Update Message: encoded, read back, and compared */
proctype check_statistics_update_message() {
  StatisticsUpdateMessage statistics_update_message_sent;
  StatisticsUpdateMessage statistics_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_update_message(statistics_update_message_sent, 0)
  :: pattern == 1 -> fill_statistics_update_message(statistics_update_message_sent, 32)
  :: pattern == 2 -> fill_statistics_update_message(statistics_update_message_sent, 255)
  :: else -> ramp_statistics_update_message(statistics_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_update_message(statistics_update_message_sent);
    assert(at == 47);
    at = 0;
    decode_statistics_update_message(statistics_update_message_got);
    assert(at == 47);
    equal_statistics_update_message(statistics_update_message_got, statistics_update_message_sent)
  }
}

/* Mifid Ii Trade Message: encoded, read back, and compared */
proctype check_mifid_ii_trade_message() {
  MifidIiTradeMessage mifid_ii_trade_message_sent;
  MifidIiTradeMessage mifid_ii_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mifid_ii_trade_message(mifid_ii_trade_message_sent, 0)
  :: pattern == 1 -> fill_mifid_ii_trade_message(mifid_ii_trade_message_sent, 32)
  :: pattern == 2 -> fill_mifid_ii_trade_message(mifid_ii_trade_message_sent, 255)
  :: else -> ramp_mifid_ii_trade_message(mifid_ii_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mifid_ii_trade_message(mifid_ii_trade_message_sent);
    assert(at == 283);
    at = 0;
    decode_mifid_ii_trade_message(mifid_ii_trade_message_got);
    assert(at == 283);
    equal_mifid_ii_trade_message(mifid_ii_trade_message_got, mifid_ii_trade_message_sent)
  }
}

/* Mi Fid Ii Trade Cross Message: encoded, read back, and compared */
proctype check_mi_fid_ii_trade_cross_message() {
  MiFidIiTradeCrossMessage mi_fid_ii_trade_cross_message_sent;
  MiFidIiTradeCrossMessage mi_fid_ii_trade_cross_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_sent, 0)
  :: pattern == 1 -> fill_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_sent, 32)
  :: pattern == 2 -> fill_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_sent, 255)
  :: else -> ramp_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_sent);
    assert(at == 301);
    at = 0;
    decode_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_got);
    assert(at == 301);
    equal_mi_fid_ii_trade_cross_message(mi_fid_ii_trade_cross_message_got, mi_fid_ii_trade_cross_message_sent)
  }
}

/* Trade Summary Message: encoded, read back, and compared */
proctype check_trade_summary_message() {
  TradeSummaryMessage trade_summary_message_sent;
  TradeSummaryMessage trade_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_summary_message(trade_summary_message_sent, 0)
  :: pattern == 1 -> fill_trade_summary_message(trade_summary_message_sent, 32)
  :: pattern == 2 -> fill_trade_summary_message(trade_summary_message_sent, 255)
  :: else -> ramp_trade_summary_message(trade_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_summary_message(trade_summary_message_sent);
    assert(at == 91);
    at = 0;
    decode_trade_summary_message(trade_summary_message_got);
    assert(at == 91);
    equal_trade_summary_message(trade_summary_message_got, trade_summary_message_sent)
  }
}

/* Analytics Message: encoded, read back, and compared */
proctype check_analytics_message() {
  AnalyticsMessage analytics_message_sent;
  AnalyticsMessage analytics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_analytics_message(analytics_message_sent, 0)
  :: pattern == 1 -> fill_analytics_message(analytics_message_sent, 32)
  :: pattern == 2 -> fill_analytics_message(analytics_message_sent, 255)
  :: else -> ramp_analytics_message(analytics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_analytics_message(analytics_message_sent);
    assert(at == 106);
    at = 0;
    decode_analytics_message(analytics_message_got);
    assert(at == 106);
    equal_analytics_message(analytics_message_got, analytics_message_sent)
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
  :: run check_add_order_incremental_message()
  :: run check_order_delete_message()
  :: run check_order_book_clear_message()
  :: run check_statistics_message()
  :: run check_statistics_update_message()
  :: run check_mifid_ii_trade_message()
  :: run check_mi_fid_ii_trade_cross_message()
  :: run check_trade_summary_message()
  :: run check_analytics_message()
  fi
}
