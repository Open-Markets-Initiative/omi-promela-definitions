/*
 * Nairobi Securities Exchange Nairobi Equities Replay
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
#define WIRE 1063

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Unit Header: 8 bytes ---------------------------------------------------- */

/* Nairobi Mitch Unit Header, defining the length of a unit, its message count, market data group and first sequence number */
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

/* Nairobi Mitch Tcp Message Header */
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

/* Used by the client to login to the Replay or Snapshot channel. */
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

/* Used by the server to accept or reject a login request to the Replay or Snapshot channel. */
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

/* ---- Replay Request Message: 7 bytes ----------------------------------------- */

/* Used by the client to request a retransmission of messages on the Replay channel. */
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

/* ---- Replay Response Message: 8 bytes ---------------------------------------- */

/* Used by the server to respond to a retransmission request on the Replay channel. */
typedef ReplayResponseMessage {
  byte market_data_group;
  byte first_message[4];
  byte count[2];
  byte replay_status
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
  replay_response_message_record.replay_status = replay_response_message_value;
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
  replay_response_message_record.replay_status = (replay_response_message_base + 7 + 1) % 256;
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
  wire[at] = replay_response_message_record.replay_status; at = at + 1;
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
  replay_response_message_record.replay_status = wire[at]; at = at + 1;
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
  assert(replay_response_message_read.replay_status == replay_response_message_written.replay_status);
  skip
}

/* ---- Time Message: 4 bytes --------------------------------------------------- */

/* Sent by the server for every second for which at least one application message is generated; its time is the reference for the nanosecond offsets of every other application message. */
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

/* Sent to indicate the start and end of the day. */
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

/* Sent to indicate that the remainder of a displayed order is cancelled. */
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

/* ---- Order Book Clear Message: 18 bytes -------------------------------------- */

/* Sent to instruct recipients to remove all orders from the order book for the specified instrument. */
typedef OrderBookClearMessage {
  byte nanosecond[4];
  byte symbol[12];
  byte sub_book;
  byte book_type
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
  :: order_book_clear_message_at < 12 -> order_book_clear_message_record.symbol[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.sub_book = order_book_clear_message_value;
  order_book_clear_message_record.book_type = order_book_clear_message_value;
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
  :: order_book_clear_message_at < 12 -> order_book_clear_message_record.symbol[order_book_clear_message_at] = (order_book_clear_message_base + 4 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.sub_book = (order_book_clear_message_base + 16 + 1) % 256;
  order_book_clear_message_record.book_type = (order_book_clear_message_base + 17 + 1) % 256;
  skip
}

/* Order Book Clear Message to the wire, 18 bytes from where the cursor stands */
inline encode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> wire[at] = order_book_clear_message_record.nanosecond[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 12 -> wire[at] = order_book_clear_message_record.symbol[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_clear_message_record.sub_book; at = at + 1;
  wire[at] = order_book_clear_message_record.book_type; at = at + 1;
  skip
}

/* Order Book Clear Message off the wire, 18 bytes from where the cursor stands */
inline decode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.nanosecond[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 12 -> order_book_clear_message_record.symbol[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.sub_book = wire[at]; at = at + 1;
  order_book_clear_message_record.book_type = wire[at]; at = at + 1;
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
  :: order_book_clear_message_at < 12 -> assert(order_book_clear_message_read.symbol[order_book_clear_message_at] == order_book_clear_message_written.symbol[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  assert(order_book_clear_message_read.sub_book == order_book_clear_message_written.sub_book);
  assert(order_book_clear_message_read.book_type == order_book_clear_message_written.book_type);
  skip
}

/* ---- Order Executed Message: 60 bytes ---------------------------------------- */

/* Indicates that the displayed portion of an order is fully or partially filled at its displayed price. The executed quantity is included in the message. */
typedef OrderExecutedMessage {
  byte nanosecond[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte trade_id[8];
  byte buy_firm[6];
  byte sell_firm[6];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8]
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
  :: order_executed_message_at < 6 -> order_executed_message_record.buy_firm[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.sell_firm[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 6 -> order_executed_message_record.buy_firm[order_executed_message_at] = (order_executed_message_base + 24 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.sell_firm[order_executed_message_at] = (order_executed_message_base + 30 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.last_opt_px[order_executed_message_at] = (order_executed_message_base + 36 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.volatility[order_executed_message_at] = (order_executed_message_base + 44 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.underlying_reference_price[order_executed_message_at] = (order_executed_message_base + 52 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 60 bytes from where the cursor stands */
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
  :: order_executed_message_at < 6 -> wire[at] = order_executed_message_record.buy_firm[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> wire[at] = order_executed_message_record.sell_firm[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  skip
}

/* Order Executed Message off the wire, 60 bytes from where the cursor stands */
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
  :: order_executed_message_at < 6 -> order_executed_message_record.buy_firm[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.sell_firm[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 6 -> assert(order_executed_message_read.buy_firm[order_executed_message_at] == order_executed_message_written.buy_firm[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> assert(order_executed_message_read.sell_firm[order_executed_message_at] == order_executed_message_written.sell_firm[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
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
  skip
}

/* ---- Order Executed With Price Size Message: 69 bytes ------------------------ */

/* Sent if a displayed order is fully or partially filled at a price that is different from its displayed price, with an indication of whether the trade should update time and sales and statistics displays. */
typedef OrderExecutedWithPriceSizeMessage {
  byte nanosecond[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte display_quantity[4];
  byte trade_id[8];
  byte printable;
  byte price[4];
  byte buy_firm[6];
  byte sell_firm[6];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8]
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
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> order_executed_with_price_size_message_record.buy_firm[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> order_executed_with_price_size_message_record.sell_firm[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
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
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 29 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> order_executed_with_price_size_message_record.buy_firm[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 33 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> order_executed_with_price_size_message_record.sell_firm[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 39 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.last_opt_px[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 45 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.volatility[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 53 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.underlying_reference_price[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 61 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Size Message to the wire, 69 bytes from where the cursor stands */
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
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> wire[at] = order_executed_with_price_size_message_record.buy_firm[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> wire[at] = order_executed_with_price_size_message_record.sell_firm[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
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
  skip
}

/* Order Executed With Price Size Message off the wire, 69 bytes from where the cursor stands */
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
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> order_executed_with_price_size_message_record.buy_firm[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> order_executed_with_price_size_message_record.sell_firm[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
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
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.price[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.price[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> assert(order_executed_with_price_size_message_read.buy_firm[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.buy_firm[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 6 -> assert(order_executed_with_price_size_message_read.sell_firm[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.sell_firm[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
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
  skip
}

/* ---- Trade Message: 69 bytes ------------------------------------------------- */

/* Sent if the non-displayed portion of an iceberg order or a reserve order is fully or partially filled, or if the negotiated non-disclosed order in the block trade order book is executed. */
typedef TradeMessage {
  byte nanosecond[4];
  byte executed_quantity[4];
  byte symbol[12];
  byte price[4];
  byte trade_id[8];
  byte sub_book;
  byte buy_firm[6];
  byte sell_firm[6];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanosecond[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executed_quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.sub_book = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.buy_firm[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.sell_firm[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.last_opt_px[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.volatility[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.underlying_reference_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanosecond[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executed_quantity[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = (trade_message_base + 20 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_id[trade_message_at] = (trade_message_base + 24 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.sub_book = (trade_message_base + 32 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.buy_firm[trade_message_at] = (trade_message_base + 33 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.sell_firm[trade_message_at] = (trade_message_base + 39 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.last_opt_px[trade_message_at] = (trade_message_base + 45 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.volatility[trade_message_at] = (trade_message_base + 53 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.underlying_reference_price[trade_message_at] = (trade_message_base + 61 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 69 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.nanosecond[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.executed_quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.trade_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.sub_book; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.buy_firm[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.sell_firm[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.last_opt_px[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.volatility[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.underlying_reference_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 69 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanosecond[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.executed_quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.sub_book = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.buy_firm[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.sell_firm[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.last_opt_px[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.volatility[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.underlying_reference_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.nanosecond[trade_message_at] == trade_message_written.nanosecond[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.executed_quantity[trade_message_at] == trade_message_written.executed_quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.symbol[trade_message_at] == trade_message_written.symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.trade_id[trade_message_at] == trade_message_written.trade_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.sub_book == trade_message_written.sub_book);
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.buy_firm[trade_message_at] == trade_message_written.buy_firm[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.sell_firm[trade_message_at] == trade_message_written.sell_firm[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.last_opt_px[trade_message_at] == trade_message_written.last_opt_px[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.volatility[trade_message_at] == trade_message_written.volatility[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.underlying_reference_price[trade_message_at] == trade_message_written.underlying_reference_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Trade Message: 57 bytes ----------------------------------------- */

/* Sent to report details of an auction (e.g. opening, closing, intra-day, etc.). */
typedef AuctionTradeMessage {
  byte nanosecond[4];
  byte executed_quantity[4];
  byte symbol[12];
  byte price[4];
  byte trade_id[8];
  byte auction_type;
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8]
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
  :: auction_trade_message_at < 4 -> auction_trade_message_record.executed_quantity[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 12 -> auction_trade_message_record.symbol[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.price[auction_trade_message_at] = auction_trade_message_value; auction_trade_message_at = auction_trade_message_at + 1
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
  :: auction_trade_message_at < 4 -> auction_trade_message_record.executed_quantity[auction_trade_message_at] = (auction_trade_message_base + 4 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 12 -> auction_trade_message_record.symbol[auction_trade_message_at] = (auction_trade_message_base + 8 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.price[auction_trade_message_at] = (auction_trade_message_base + 20 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.trade_id[auction_trade_message_at] = (auction_trade_message_base + 24 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_record.auction_type = (auction_trade_message_base + 32 + 1) % 256;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.last_opt_px[auction_trade_message_at] = (auction_trade_message_base + 33 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.volatility[auction_trade_message_at] = (auction_trade_message_base + 41 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 8 -> auction_trade_message_record.underlying_reference_price[auction_trade_message_at] = (auction_trade_message_base + 49 + auction_trade_message_at + 1) % 256; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Trade Message to the wire, 57 bytes from where the cursor stands */
inline encode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.nanosecond[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.executed_quantity[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 12 -> wire[at] = auction_trade_message_record.symbol[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> wire[at] = auction_trade_message_record.price[auction_trade_message_at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
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
  skip
}

/* Auction Trade Message off the wire, 57 bytes from where the cursor stands */
inline decode_auction_trade_message(auction_trade_message_record) {
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.nanosecond[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.executed_quantity[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 12 -> auction_trade_message_record.symbol[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> auction_trade_message_record.price[auction_trade_message_at] = wire[at]; at = at + 1; auction_trade_message_at = auction_trade_message_at + 1
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
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.executed_quantity[auction_trade_message_at] == auction_trade_message_written.executed_quantity[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 12 -> assert(auction_trade_message_read.symbol[auction_trade_message_at] == auction_trade_message_written.symbol[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
  :: else -> break
  od;
  auction_trade_message_at = 0;
  do
  :: auction_trade_message_at < 4 -> assert(auction_trade_message_read.price[auction_trade_message_at] == auction_trade_message_written.price[auction_trade_message_at]); auction_trade_message_at = auction_trade_message_at + 1
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
  skip
}

/* ---- Off Book Trade Message: 76 bytes ---------------------------------------- */

/* Sent to report the details of an off-book trade. */
typedef OffBookTradeMessage {
  byte nanosecond[4];
  byte executed_quantity[4];
  byte symbol[12];
  byte price[4];
  byte trade_id[8];
  byte off_book_trade_type[4];
  byte trade_time[8];
  byte trade_date[8];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8]
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
  :: off_book_trade_message_at < 12 -> off_book_trade_message_record.symbol[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.price[off_book_trade_message_at] = off_book_trade_message_value; off_book_trade_message_at = off_book_trade_message_at + 1
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
  :: off_book_trade_message_at < 12 -> off_book_trade_message_record.symbol[off_book_trade_message_at] = (off_book_trade_message_base + 8 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.price[off_book_trade_message_at] = (off_book_trade_message_base + 20 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_id[off_book_trade_message_at] = (off_book_trade_message_base + 24 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.off_book_trade_type[off_book_trade_message_at] = (off_book_trade_message_base + 32 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_time[off_book_trade_message_at] = (off_book_trade_message_base + 36 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.trade_date[off_book_trade_message_at] = (off_book_trade_message_base + 44 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.last_opt_px[off_book_trade_message_at] = (off_book_trade_message_base + 52 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.volatility[off_book_trade_message_at] = (off_book_trade_message_base + 60 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 8 -> off_book_trade_message_record.underlying_reference_price[off_book_trade_message_at] = (off_book_trade_message_base + 68 + off_book_trade_message_at + 1) % 256; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Off Book Trade Message to the wire, 76 bytes from where the cursor stands */
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
  :: off_book_trade_message_at < 12 -> wire[at] = off_book_trade_message_record.symbol[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> wire[at] = off_book_trade_message_record.price[off_book_trade_message_at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
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
  skip
}

/* Off Book Trade Message off the wire, 76 bytes from where the cursor stands */
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
  :: off_book_trade_message_at < 12 -> off_book_trade_message_record.symbol[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> off_book_trade_message_record.price[off_book_trade_message_at] = wire[at]; at = at + 1; off_book_trade_message_at = off_book_trade_message_at + 1
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
  :: off_book_trade_message_at < 12 -> assert(off_book_trade_message_read.symbol[off_book_trade_message_at] == off_book_trade_message_written.symbol[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
  :: else -> break
  od;
  off_book_trade_message_at = 0;
  do
  :: off_book_trade_message_at < 4 -> assert(off_book_trade_message_read.price[off_book_trade_message_at] == off_book_trade_message_written.price[off_book_trade_message_at]); off_book_trade_message_at = off_book_trade_message_at + 1
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
  skip
}

/* ---- Trade Break Message: 13 bytes ------------------------------------------- */

/* Sent to indicate that a previously reported trade is cancelled. */
typedef TradeBreakMessage {
  byte nanosecond[4];
  byte trade_id[8];
  byte trade_type
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.nanosecond[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.trade_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.trade_type = trade_break_message_value;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.nanosecond[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.trade_id[trade_break_message_at] = (trade_break_message_base + 4 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.trade_type = (trade_break_message_base + 12 + 1) % 256;
  skip
}

/* Trade Break Message to the wire, 13 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> wire[at] = trade_break_message_record.nanosecond[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.trade_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_break_message_record.trade_type; at = at + 1;
  skip
}

/* Trade Break Message off the wire, 13 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> trade_break_message_record.nanosecond[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.trade_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.trade_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 4 -> assert(trade_break_message_read.nanosecond[trade_break_message_at] == trade_break_message_written.nanosecond[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.trade_id[trade_break_message_at] == trade_break_message_written.trade_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  assert(trade_break_message_read.trade_type == trade_break_message_written.trade_type);
  skip
}

/* ---- Trade Correction Message: 45 bytes -------------------------------------- */

/* Sent to report the correction of the executed quantity of a trade. */
typedef TradeCorrectionMessage {
  byte nanosecond[4];
  byte trade_id[8];
  byte symbol[12];
  byte price[4];
  byte quantity[4];
  byte sub_book;
  byte buy_firm[6];
  byte sell_firm[6]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.nanosecond[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_id[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.quantity[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.sub_book = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.buy_firm[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.sell_firm[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.nanosecond[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_id[trade_correction_message_at] = (trade_correction_message_base + 4 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = (trade_correction_message_base + 12 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.price[trade_correction_message_at] = (trade_correction_message_base + 24 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.quantity[trade_correction_message_at] = (trade_correction_message_base + 28 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.sub_book = (trade_correction_message_base + 32 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.buy_firm[trade_correction_message_at] = (trade_correction_message_base + 33 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.sell_firm[trade_correction_message_at] = (trade_correction_message_base + 39 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 45 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.nanosecond[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.trade_id[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> wire[at] = trade_correction_message_record.symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.quantity[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.sub_book; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> wire[at] = trade_correction_message_record.buy_firm[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> wire[at] = trade_correction_message_record.sell_firm[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 45 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.nanosecond[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.trade_id[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> trade_correction_message_record.symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.quantity[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.sub_book = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.buy_firm[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.sell_firm[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.nanosecond[trade_correction_message_at] == trade_correction_message_written.nanosecond[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.trade_id[trade_correction_message_at] == trade_correction_message_written.trade_id[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 12 -> assert(trade_correction_message_read.symbol[trade_correction_message_at] == trade_correction_message_written.symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.price[trade_correction_message_at] == trade_correction_message_written.price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.quantity[trade_correction_message_at] == trade_correction_message_written.quantity[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.sub_book == trade_correction_message_written.sub_book);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> assert(trade_correction_message_read.buy_firm[trade_correction_message_at] == trade_correction_message_written.buy_firm[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> assert(trade_correction_message_read.sell_firm[trade_correction_message_at] == trade_correction_message_written.sell_firm[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Recovery Trade Message: 92 bytes ---------------------------------------- */

/* Sent on the Snapshot channel to retransmit the trades published on the Real-Time channel. */
typedef RecoveryTradeMessage {
  byte nanosecond[4];
  byte executed_quantity[4];
  byte symbol[12];
  byte price[4];
  byte trade_id[8];
  byte auction_type;
  byte off_book_trade_type[4];
  byte trade_time[8];
  byte trade_date[8];
  byte action_type;
  byte sub_book;
  byte buy_firm[6];
  byte sell_firm[6];
  byte last_opt_px[8];
  byte volatility[8];
  byte underlying_reference_price[8];
  byte auction_trade_type
};

int recovery_trade_message_at;

/* every byte of Recovery Trade Message set to one value */
inline fill_recovery_trade_message(recovery_trade_message_record, recovery_trade_message_value) {
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.nanosecond[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.executed_quantity[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 12 -> recovery_trade_message_record.symbol[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.price[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_id[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.auction_type = recovery_trade_message_value;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.off_book_trade_type[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_time[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_date[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.action_type = recovery_trade_message_value;
  recovery_trade_message_record.sub_book = recovery_trade_message_value;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> recovery_trade_message_record.buy_firm[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> recovery_trade_message_record.sell_firm[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.last_opt_px[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.volatility[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.underlying_reference_price[recovery_trade_message_at] = recovery_trade_message_value; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.auction_trade_type = recovery_trade_message_value;
  skip
}

/* each byte of Recovery Trade Message set to where it lies, so a field read out of place says so */
inline ramp_recovery_trade_message(recovery_trade_message_record, recovery_trade_message_base) {
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.nanosecond[recovery_trade_message_at] = (recovery_trade_message_base + 0 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.executed_quantity[recovery_trade_message_at] = (recovery_trade_message_base + 4 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 12 -> recovery_trade_message_record.symbol[recovery_trade_message_at] = (recovery_trade_message_base + 8 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.price[recovery_trade_message_at] = (recovery_trade_message_base + 20 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_id[recovery_trade_message_at] = (recovery_trade_message_base + 24 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.auction_type = (recovery_trade_message_base + 32 + 1) % 256;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.off_book_trade_type[recovery_trade_message_at] = (recovery_trade_message_base + 33 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_time[recovery_trade_message_at] = (recovery_trade_message_base + 37 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_date[recovery_trade_message_at] = (recovery_trade_message_base + 45 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.action_type = (recovery_trade_message_base + 53 + 1) % 256;
  recovery_trade_message_record.sub_book = (recovery_trade_message_base + 54 + 1) % 256;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> recovery_trade_message_record.buy_firm[recovery_trade_message_at] = (recovery_trade_message_base + 55 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> recovery_trade_message_record.sell_firm[recovery_trade_message_at] = (recovery_trade_message_base + 61 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.last_opt_px[recovery_trade_message_at] = (recovery_trade_message_base + 67 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.volatility[recovery_trade_message_at] = (recovery_trade_message_base + 75 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.underlying_reference_price[recovery_trade_message_at] = (recovery_trade_message_base + 83 + recovery_trade_message_at + 1) % 256; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.auction_trade_type = (recovery_trade_message_base + 91 + 1) % 256;
  skip
}

/* Recovery Trade Message to the wire, 92 bytes from where the cursor stands */
inline encode_recovery_trade_message(recovery_trade_message_record) {
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> wire[at] = recovery_trade_message_record.nanosecond[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> wire[at] = recovery_trade_message_record.executed_quantity[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 12 -> wire[at] = recovery_trade_message_record.symbol[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> wire[at] = recovery_trade_message_record.price[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> wire[at] = recovery_trade_message_record.trade_id[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = recovery_trade_message_record.auction_type; at = at + 1;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> wire[at] = recovery_trade_message_record.off_book_trade_type[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> wire[at] = recovery_trade_message_record.trade_time[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> wire[at] = recovery_trade_message_record.trade_date[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = recovery_trade_message_record.action_type; at = at + 1;
  wire[at] = recovery_trade_message_record.sub_book; at = at + 1;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> wire[at] = recovery_trade_message_record.buy_firm[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> wire[at] = recovery_trade_message_record.sell_firm[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> wire[at] = recovery_trade_message_record.last_opt_px[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> wire[at] = recovery_trade_message_record.volatility[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> wire[at] = recovery_trade_message_record.underlying_reference_price[recovery_trade_message_at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = recovery_trade_message_record.auction_trade_type; at = at + 1;
  skip
}

/* Recovery Trade Message off the wire, 92 bytes from where the cursor stands */
inline decode_recovery_trade_message(recovery_trade_message_record) {
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.nanosecond[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.executed_quantity[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 12 -> recovery_trade_message_record.symbol[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.price[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_id[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.auction_type = wire[at]; at = at + 1;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> recovery_trade_message_record.off_book_trade_type[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_time[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.trade_date[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.action_type = wire[at]; at = at + 1;
  recovery_trade_message_record.sub_book = wire[at]; at = at + 1;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> recovery_trade_message_record.buy_firm[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> recovery_trade_message_record.sell_firm[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.last_opt_px[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.volatility[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> recovery_trade_message_record.underlying_reference_price[recovery_trade_message_at] = wire[at]; at = at + 1; recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_record.auction_trade_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Recovery Trade Message is what was written, byte for byte */
inline equal_recovery_trade_message(recovery_trade_message_read, recovery_trade_message_written) {
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> assert(recovery_trade_message_read.nanosecond[recovery_trade_message_at] == recovery_trade_message_written.nanosecond[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> assert(recovery_trade_message_read.executed_quantity[recovery_trade_message_at] == recovery_trade_message_written.executed_quantity[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 12 -> assert(recovery_trade_message_read.symbol[recovery_trade_message_at] == recovery_trade_message_written.symbol[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> assert(recovery_trade_message_read.price[recovery_trade_message_at] == recovery_trade_message_written.price[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> assert(recovery_trade_message_read.trade_id[recovery_trade_message_at] == recovery_trade_message_written.trade_id[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  assert(recovery_trade_message_read.auction_type == recovery_trade_message_written.auction_type);
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 4 -> assert(recovery_trade_message_read.off_book_trade_type[recovery_trade_message_at] == recovery_trade_message_written.off_book_trade_type[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> assert(recovery_trade_message_read.trade_time[recovery_trade_message_at] == recovery_trade_message_written.trade_time[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> assert(recovery_trade_message_read.trade_date[recovery_trade_message_at] == recovery_trade_message_written.trade_date[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  assert(recovery_trade_message_read.action_type == recovery_trade_message_written.action_type);
  assert(recovery_trade_message_read.sub_book == recovery_trade_message_written.sub_book);
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> assert(recovery_trade_message_read.buy_firm[recovery_trade_message_at] == recovery_trade_message_written.buy_firm[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 6 -> assert(recovery_trade_message_read.sell_firm[recovery_trade_message_at] == recovery_trade_message_written.sell_firm[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> assert(recovery_trade_message_read.last_opt_px[recovery_trade_message_at] == recovery_trade_message_written.last_opt_px[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> assert(recovery_trade_message_read.volatility[recovery_trade_message_at] == recovery_trade_message_written.volatility[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  recovery_trade_message_at = 0;
  do
  :: recovery_trade_message_at < 8 -> assert(recovery_trade_message_read.underlying_reference_price[recovery_trade_message_at] == recovery_trade_message_written.underlying_reference_price[recovery_trade_message_at]); recovery_trade_message_at = recovery_trade_message_at + 1
  :: else -> break
  od;
  assert(recovery_trade_message_read.auction_trade_type == recovery_trade_message_written.auction_trade_type);
  skip
}

/* ---- Auction Info Message: 30 bytes ------------------------------------------ */

/* Indicative auction information for an instrument; the document labels the message type Indicative Auction Info. */
typedef AuctionInfoMessage {
  byte nanosecond[4];
  byte paired_quantity[4];
  byte imbalance_quantity[4];
  byte imbalance_direction;
  byte symbol[12];
  byte price[4];
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
  :: auction_info_message_at < 4 -> auction_info_message_record.imbalance_quantity[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.imbalance_direction = auction_info_message_value;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 12 -> auction_info_message_record.symbol[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.price[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
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
  :: auction_info_message_at < 4 -> auction_info_message_record.imbalance_quantity[auction_info_message_at] = (auction_info_message_base + 8 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.imbalance_direction = (auction_info_message_base + 12 + 1) % 256;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 12 -> auction_info_message_record.symbol[auction_info_message_at] = (auction_info_message_base + 13 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.price[auction_info_message_at] = (auction_info_message_base + 25 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.auction_type = (auction_info_message_base + 29 + 1) % 256;
  skip
}

/* Auction Info Message to the wire, 30 bytes from where the cursor stands */
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
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.imbalance_quantity[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.imbalance_direction; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 12 -> wire[at] = auction_info_message_record.symbol[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.price[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.auction_type; at = at + 1;
  skip
}

/* Auction Info Message off the wire, 30 bytes from where the cursor stands */
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
  :: auction_info_message_at < 4 -> auction_info_message_record.imbalance_quantity[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.imbalance_direction = wire[at]; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 12 -> auction_info_message_record.symbol[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.price[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
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
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.imbalance_quantity[auction_info_message_at] == auction_info_message_written.imbalance_quantity[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.imbalance_direction == auction_info_message_written.imbalance_direction);
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 12 -> assert(auction_info_message_read.symbol[auction_info_message_at] == auction_info_message_written.symbol[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.price[auction_info_message_at] == auction_info_message_written.price[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.auction_type == auction_info_message_written.auction_type);
  skip
}

/* ---- Statistics Message: 23 bytes -------------------------------------------- */

/* Sent to disseminate the opening, closing and previous closing prices of an instrument. */
typedef StatisticsMessage {
  byte nanosecond[4];
  byte symbol[12];
  byte statistic_type;
  byte price[4];
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
  :: statistics_message_at < 12 -> statistics_message_record.symbol[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = statistics_message_value;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
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
  :: statistics_message_at < 12 -> statistics_message_record.symbol[statistics_message_at] = (statistics_message_base + 4 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = (statistics_message_base + 16 + 1) % 256;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.price[statistics_message_at] = (statistics_message_base + 17 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.open_close_indicator = (statistics_message_base + 21 + 1) % 256;
  statistics_message_record.sub_book = (statistics_message_base + 22 + 1) % 256;
  skip
}

/* Statistics Message to the wire, 23 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.nanosecond[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 12 -> wire[at] = statistics_message_record.symbol[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_message_record.statistic_type; at = at + 1;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_message_record.open_close_indicator; at = at + 1;
  wire[at] = statistics_message_record.sub_book; at = at + 1;
  skip
}

/* Statistics Message off the wire, 23 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.nanosecond[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 12 -> statistics_message_record.symbol[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = wire[at]; at = at + 1;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
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
  :: statistics_message_at < 12 -> assert(statistics_message_read.symbol[statistics_message_at] == statistics_message_written.symbol[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  assert(statistics_message_read.statistic_type == statistics_message_written.statistic_type);
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.price[statistics_message_at] == statistics_message_written.price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  assert(statistics_message_read.open_close_indicator == statistics_message_written.open_close_indicator);
  assert(statistics_message_read.sub_book == statistics_message_written.sub_book);
  skip
}

/* ---- Extended Statistics Message: 93 bytes ----------------------------------- */

/* Sent to disseminate the high, low, VWAP, volume, turnover and other statistics of an instrument for a sub book. */
typedef ExtendedStatisticsMessage {
  byte nanosecond[4];
  byte symbol[12];
  byte high_price[4];
  byte low_price[4];
  byte vwap[4];
  byte volume[4];
  byte turnover[8];
  byte trades[4];
  byte reserved_8[8];
  byte sub_book;
  byte notional_exposure[8];
  byte notional_delta_exposure[8];
  byte daily_foreign_buy_value[8];
  byte daily_foreign_sell_value[8];
  byte market_capitalization[8]
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
  :: extended_statistics_message_at < 12 -> extended_statistics_message_record.symbol[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.high_price[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.low_price[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.vwap[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.trades[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.daily_foreign_buy_value[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.daily_foreign_sell_value[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.market_capitalization[extended_statistics_message_at] = extended_statistics_message_value; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 12 -> extended_statistics_message_record.symbol[extended_statistics_message_at] = (extended_statistics_message_base + 4 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.high_price[extended_statistics_message_at] = (extended_statistics_message_base + 16 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.low_price[extended_statistics_message_at] = (extended_statistics_message_base + 20 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.vwap[extended_statistics_message_at] = (extended_statistics_message_base + 24 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.volume[extended_statistics_message_at] = (extended_statistics_message_base + 28 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.turnover[extended_statistics_message_at] = (extended_statistics_message_base + 32 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.trades[extended_statistics_message_at] = (extended_statistics_message_base + 40 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.reserved_8[extended_statistics_message_at] = (extended_statistics_message_base + 44 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_record.sub_book = (extended_statistics_message_base + 52 + 1) % 256;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_exposure[extended_statistics_message_at] = (extended_statistics_message_base + 53 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.notional_delta_exposure[extended_statistics_message_at] = (extended_statistics_message_base + 61 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.daily_foreign_buy_value[extended_statistics_message_at] = (extended_statistics_message_base + 69 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.daily_foreign_sell_value[extended_statistics_message_at] = (extended_statistics_message_base + 77 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.market_capitalization[extended_statistics_message_at] = (extended_statistics_message_base + 85 + extended_statistics_message_at + 1) % 256; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Statistics Message to the wire, 93 bytes from where the cursor stands */
inline encode_extended_statistics_message(extended_statistics_message_record) {
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.nanosecond[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 12 -> wire[at] = extended_statistics_message_record.symbol[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.high_price[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.low_price[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.vwap[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 4 -> wire[at] = extended_statistics_message_record.trades[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.daily_foreign_buy_value[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.daily_foreign_sell_value[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> wire[at] = extended_statistics_message_record.market_capitalization[extended_statistics_message_at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Statistics Message off the wire, 93 bytes from where the cursor stands */
inline decode_extended_statistics_message(extended_statistics_message_record) {
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.nanosecond[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 12 -> extended_statistics_message_record.symbol[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.high_price[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.low_price[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.vwap[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 4 -> extended_statistics_message_record.trades[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.daily_foreign_buy_value[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.daily_foreign_sell_value[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> extended_statistics_message_record.market_capitalization[extended_statistics_message_at] = wire[at]; at = at + 1; extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 12 -> assert(extended_statistics_message_read.symbol[extended_statistics_message_at] == extended_statistics_message_written.symbol[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.high_price[extended_statistics_message_at] == extended_statistics_message_written.high_price[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.low_price[extended_statistics_message_at] == extended_statistics_message_written.low_price[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.vwap[extended_statistics_message_at] == extended_statistics_message_written.vwap[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 4 -> assert(extended_statistics_message_read.trades[extended_statistics_message_at] == extended_statistics_message_written.trades[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
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
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.daily_foreign_buy_value[extended_statistics_message_at] == extended_statistics_message_written.daily_foreign_buy_value[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.daily_foreign_sell_value[extended_statistics_message_at] == extended_statistics_message_written.daily_foreign_sell_value[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  extended_statistics_message_at = 0;
  do
  :: extended_statistics_message_at < 8 -> assert(extended_statistics_message_read.market_capitalization[extended_statistics_message_at] == extended_statistics_message_written.market_capitalization[extended_statistics_message_at]); extended_statistics_message_at = extended_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated Statistics Message: 57 bytes ------------------------------- */

/* Sent to disseminate the volume, turnover and trades of a market, sector or instrument type. */
typedef ConsolidatedStatisticsMessage {
  byte nanosecond[4];
  byte statistics_type;
  byte symbol[12];
  byte volume[4];
  byte turnover[8];
  byte trades[4];
  byte daily_foreign_buy_value[8];
  byte daily_foreign_sell_value[8];
  byte market_capitalization[8]
};

int consolidated_statistics_message_at;

/* every byte of Consolidated Statistics Message set to one value */
inline fill_consolidated_statistics_message(consolidated_statistics_message_record, consolidated_statistics_message_value) {
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.nanosecond[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_record.statistics_type = consolidated_statistics_message_value;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 12 -> consolidated_statistics_message_record.symbol[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.volume[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.turnover[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.trades[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.daily_foreign_buy_value[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.daily_foreign_sell_value[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.market_capitalization[consolidated_statistics_message_at] = consolidated_statistics_message_value; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_statistics_message(consolidated_statistics_message_record, consolidated_statistics_message_base) {
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.nanosecond[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 0 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_record.statistics_type = (consolidated_statistics_message_base + 4 + 1) % 256;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 12 -> consolidated_statistics_message_record.symbol[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 5 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.volume[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 17 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.turnover[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 21 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.trades[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 29 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.daily_foreign_buy_value[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 33 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.daily_foreign_sell_value[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 41 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.market_capitalization[consolidated_statistics_message_at] = (consolidated_statistics_message_base + 49 + consolidated_statistics_message_at + 1) % 256; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Statistics Message to the wire, 57 bytes from where the cursor stands */
inline encode_consolidated_statistics_message(consolidated_statistics_message_record) {
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> wire[at] = consolidated_statistics_message_record.nanosecond[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_statistics_message_record.statistics_type; at = at + 1;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 12 -> wire[at] = consolidated_statistics_message_record.symbol[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> wire[at] = consolidated_statistics_message_record.volume[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> wire[at] = consolidated_statistics_message_record.turnover[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> wire[at] = consolidated_statistics_message_record.trades[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> wire[at] = consolidated_statistics_message_record.daily_foreign_buy_value[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> wire[at] = consolidated_statistics_message_record.daily_foreign_sell_value[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> wire[at] = consolidated_statistics_message_record.market_capitalization[consolidated_statistics_message_at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Statistics Message off the wire, 57 bytes from where the cursor stands */
inline decode_consolidated_statistics_message(consolidated_statistics_message_record) {
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.nanosecond[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_record.statistics_type = wire[at]; at = at + 1;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 12 -> consolidated_statistics_message_record.symbol[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.volume[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.turnover[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> consolidated_statistics_message_record.trades[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.daily_foreign_buy_value[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.daily_foreign_sell_value[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> consolidated_statistics_message_record.market_capitalization[consolidated_statistics_message_at] = wire[at]; at = at + 1; consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Statistics Message is what was written, byte for byte */
inline equal_consolidated_statistics_message(consolidated_statistics_message_read, consolidated_statistics_message_written) {
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> assert(consolidated_statistics_message_read.nanosecond[consolidated_statistics_message_at] == consolidated_statistics_message_written.nanosecond[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  assert(consolidated_statistics_message_read.statistics_type == consolidated_statistics_message_written.statistics_type);
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 12 -> assert(consolidated_statistics_message_read.symbol[consolidated_statistics_message_at] == consolidated_statistics_message_written.symbol[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> assert(consolidated_statistics_message_read.volume[consolidated_statistics_message_at] == consolidated_statistics_message_written.volume[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> assert(consolidated_statistics_message_read.turnover[consolidated_statistics_message_at] == consolidated_statistics_message_written.turnover[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 4 -> assert(consolidated_statistics_message_read.trades[consolidated_statistics_message_at] == consolidated_statistics_message_written.trades[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> assert(consolidated_statistics_message_read.daily_foreign_buy_value[consolidated_statistics_message_at] == consolidated_statistics_message_written.daily_foreign_buy_value[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> assert(consolidated_statistics_message_read.daily_foreign_sell_value[consolidated_statistics_message_at] == consolidated_statistics_message_written.daily_foreign_sell_value[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  consolidated_statistics_message_at = 0;
  do
  :: consolidated_statistics_message_at < 8 -> assert(consolidated_statistics_message_read.market_capitalization[consolidated_statistics_message_at] == consolidated_statistics_message_written.market_capitalization[consolidated_statistics_message_at]); consolidated_statistics_message_at = consolidated_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Message: 25 bytes ------------------------------------------------- */

/* Sent to disseminate the value of an index. */
typedef IndexMessage {
  byte nanosecond[4];
  byte symbol[12];
  byte index_value[4];
  byte update_type;
  byte perctg_diff_from_closing[4]
};

int index_message_at;

/* every byte of Index Message set to one value */
inline fill_index_message(index_message_record, index_message_value) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.nanosecond[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 12 -> index_message_record.symbol[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.index_value[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_record.update_type = index_message_value;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.perctg_diff_from_closing[index_message_at] = index_message_value; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Message set to where it lies, so a field read out of place says so */
inline ramp_index_message(index_message_record, index_message_base) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.nanosecond[index_message_at] = (index_message_base + 0 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 12 -> index_message_record.symbol[index_message_at] = (index_message_base + 4 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.index_value[index_message_at] = (index_message_base + 16 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_record.update_type = (index_message_base + 20 + 1) % 256;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.perctg_diff_from_closing[index_message_at] = (index_message_base + 21 + index_message_at + 1) % 256; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message to the wire, 25 bytes from where the cursor stands */
inline encode_index_message(index_message_record) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.nanosecond[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 12 -> wire[at] = index_message_record.symbol[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.index_value[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  wire[at] = index_message_record.update_type; at = at + 1;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> wire[at] = index_message_record.perctg_diff_from_closing[index_message_at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Message off the wire, 25 bytes from where the cursor stands */
inline decode_index_message(index_message_record) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.nanosecond[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 12 -> index_message_record.symbol[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.index_value[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_record.update_type = wire[at]; at = at + 1;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> index_message_record.perctg_diff_from_closing[index_message_at] = wire[at]; at = at + 1; index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Message is what was written, byte for byte */
inline equal_index_message(index_message_read, index_message_written) {
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.nanosecond[index_message_at] == index_message_written.nanosecond[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 12 -> assert(index_message_read.symbol[index_message_at] == index_message_written.symbol[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.index_value[index_message_at] == index_message_written.index_value[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  assert(index_message_read.update_type == index_message_written.update_type);
  index_message_at = 0;
  do
  :: index_message_at < 4 -> assert(index_message_read.perctg_diff_from_closing[index_message_at] == index_message_written.perctg_diff_from_closing[index_message_at]); index_message_at = index_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Aon Info Message: 34 bytes ---------------------------------------------- */

/* Sent to disseminate the details of an All or None auction. */
typedef AonInfoMessage {
  byte nanosecond[4];
  byte symbol[12];
  byte price[4];
  byte side;
  byte quantity[4];
  byte aon_status;
  byte date[8]
};

int aon_info_message_at;

/* every byte of Aon Info Message set to one value */
inline fill_aon_info_message(aon_info_message_record, aon_info_message_value) {
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.nanosecond[aon_info_message_at] = aon_info_message_value; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 12 -> aon_info_message_record.symbol[aon_info_message_at] = aon_info_message_value; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.price[aon_info_message_at] = aon_info_message_value; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_record.side = aon_info_message_value;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.quantity[aon_info_message_at] = aon_info_message_value; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_record.aon_status = aon_info_message_value;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 8 -> aon_info_message_record.date[aon_info_message_at] = aon_info_message_value; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Aon Info Message set to where it lies, so a field read out of place says so */
inline ramp_aon_info_message(aon_info_message_record, aon_info_message_base) {
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.nanosecond[aon_info_message_at] = (aon_info_message_base + 0 + aon_info_message_at + 1) % 256; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 12 -> aon_info_message_record.symbol[aon_info_message_at] = (aon_info_message_base + 4 + aon_info_message_at + 1) % 256; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.price[aon_info_message_at] = (aon_info_message_base + 16 + aon_info_message_at + 1) % 256; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_record.side = (aon_info_message_base + 20 + 1) % 256;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.quantity[aon_info_message_at] = (aon_info_message_base + 21 + aon_info_message_at + 1) % 256; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_record.aon_status = (aon_info_message_base + 25 + 1) % 256;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 8 -> aon_info_message_record.date[aon_info_message_at] = (aon_info_message_base + 26 + aon_info_message_at + 1) % 256; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Aon Info Message to the wire, 34 bytes from where the cursor stands */
inline encode_aon_info_message(aon_info_message_record) {
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> wire[at] = aon_info_message_record.nanosecond[aon_info_message_at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 12 -> wire[at] = aon_info_message_record.symbol[aon_info_message_at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> wire[at] = aon_info_message_record.price[aon_info_message_at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  wire[at] = aon_info_message_record.side; at = at + 1;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> wire[at] = aon_info_message_record.quantity[aon_info_message_at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  wire[at] = aon_info_message_record.aon_status; at = at + 1;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 8 -> wire[at] = aon_info_message_record.date[aon_info_message_at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Aon Info Message off the wire, 34 bytes from where the cursor stands */
inline decode_aon_info_message(aon_info_message_record) {
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.nanosecond[aon_info_message_at] = wire[at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 12 -> aon_info_message_record.symbol[aon_info_message_at] = wire[at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.price[aon_info_message_at] = wire[at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_record.side = wire[at]; at = at + 1;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> aon_info_message_record.quantity[aon_info_message_at] = wire[at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_record.aon_status = wire[at]; at = at + 1;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 8 -> aon_info_message_record.date[aon_info_message_at] = wire[at]; at = at + 1; aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Aon Info Message is what was written, byte for byte */
inline equal_aon_info_message(aon_info_message_read, aon_info_message_written) {
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> assert(aon_info_message_read.nanosecond[aon_info_message_at] == aon_info_message_written.nanosecond[aon_info_message_at]); aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 12 -> assert(aon_info_message_read.symbol[aon_info_message_at] == aon_info_message_written.symbol[aon_info_message_at]); aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> assert(aon_info_message_read.price[aon_info_message_at] == aon_info_message_written.price[aon_info_message_at]); aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  assert(aon_info_message_read.side == aon_info_message_written.side);
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 4 -> assert(aon_info_message_read.quantity[aon_info_message_at] == aon_info_message_written.quantity[aon_info_message_at]); aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  assert(aon_info_message_read.aon_status == aon_info_message_written.aon_status);
  aon_info_message_at = 0;
  do
  :: aon_info_message_at < 8 -> assert(aon_info_message_read.date[aon_info_message_at] == aon_info_message_written.date[aon_info_message_at]); aon_info_message_at = aon_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- News Message: 1063 bytes ------------------------------------------------ */

/* Sent to disseminate an announcement. */
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
    assert(at == 18);
    at = 0;
    decode_order_book_clear_message(order_book_clear_message_got);
    assert(at == 18);
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
    assert(at == 60);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 60);
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
    assert(at == 69);
    at = 0;
    decode_order_executed_with_price_size_message(order_executed_with_price_size_message_got);
    assert(at == 69);
    equal_order_executed_with_price_size_message(order_executed_with_price_size_message_got, order_executed_with_price_size_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 69);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 69);
    equal_trade_message(trade_message_got, trade_message_sent)
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
    assert(at == 57);
    at = 0;
    decode_auction_trade_message(auction_trade_message_got);
    assert(at == 57);
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
    assert(at == 76);
    at = 0;
    decode_off_book_trade_message(off_book_trade_message_got);
    assert(at == 76);
    equal_off_book_trade_message(off_book_trade_message_got, off_book_trade_message_sent)
  }
}

/* Trade Break Message: encoded, read back, and compared */
proctype check_trade_break_message() {
  TradeBreakMessage trade_break_message_sent;
  TradeBreakMessage trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_break_message(trade_break_message_sent, 0)
  :: pattern == 1 -> fill_trade_break_message(trade_break_message_sent, 32)
  :: pattern == 2 -> fill_trade_break_message(trade_break_message_sent, 255)
  :: else -> ramp_trade_break_message(trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_break_message(trade_break_message_sent);
    assert(at == 13);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 13);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
  }
}

/* Trade Correction Message: encoded, read back, and compared */
proctype check_trade_correction_message() {
  TradeCorrectionMessage trade_correction_message_sent;
  TradeCorrectionMessage trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_message(trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_message(trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_message(trade_correction_message_sent, 255)
  :: else -> ramp_trade_correction_message(trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_message(trade_correction_message_sent);
    assert(at == 45);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 45);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Recovery Trade Message: encoded, read back, and compared */
proctype check_recovery_trade_message() {
  RecoveryTradeMessage recovery_trade_message_sent;
  RecoveryTradeMessage recovery_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_recovery_trade_message(recovery_trade_message_sent, 0)
  :: pattern == 1 -> fill_recovery_trade_message(recovery_trade_message_sent, 32)
  :: pattern == 2 -> fill_recovery_trade_message(recovery_trade_message_sent, 255)
  :: else -> ramp_recovery_trade_message(recovery_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_recovery_trade_message(recovery_trade_message_sent);
    assert(at == 92);
    at = 0;
    decode_recovery_trade_message(recovery_trade_message_got);
    assert(at == 92);
    equal_recovery_trade_message(recovery_trade_message_got, recovery_trade_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_auction_info_message(auction_info_message_got);
    assert(at == 30);
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
    assert(at == 23);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 23);
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
    assert(at == 93);
    at = 0;
    decode_extended_statistics_message(extended_statistics_message_got);
    assert(at == 93);
    equal_extended_statistics_message(extended_statistics_message_got, extended_statistics_message_sent)
  }
}

/* Consolidated Statistics Message: encoded, read back, and compared */
proctype check_consolidated_statistics_message() {
  ConsolidatedStatisticsMessage consolidated_statistics_message_sent;
  ConsolidatedStatisticsMessage consolidated_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_statistics_message(consolidated_statistics_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_statistics_message(consolidated_statistics_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_statistics_message(consolidated_statistics_message_sent, 255)
  :: else -> ramp_consolidated_statistics_message(consolidated_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_statistics_message(consolidated_statistics_message_sent);
    assert(at == 57);
    at = 0;
    decode_consolidated_statistics_message(consolidated_statistics_message_got);
    assert(at == 57);
    equal_consolidated_statistics_message(consolidated_statistics_message_got, consolidated_statistics_message_sent)
  }
}

/* Index Message: encoded, read back, and compared */
proctype check_index_message() {
  IndexMessage index_message_sent;
  IndexMessage index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_message(index_message_sent, 0)
  :: pattern == 1 -> fill_index_message(index_message_sent, 32)
  :: pattern == 2 -> fill_index_message(index_message_sent, 255)
  :: else -> ramp_index_message(index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_message(index_message_sent);
    assert(at == 25);
    at = 0;
    decode_index_message(index_message_got);
    assert(at == 25);
    equal_index_message(index_message_got, index_message_sent)
  }
}

/* Aon Info Message: encoded, read back, and compared */
proctype check_aon_info_message() {
  AonInfoMessage aon_info_message_sent;
  AonInfoMessage aon_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_aon_info_message(aon_info_message_sent, 0)
  :: pattern == 1 -> fill_aon_info_message(aon_info_message_sent, 32)
  :: pattern == 2 -> fill_aon_info_message(aon_info_message_sent, 255)
  :: else -> ramp_aon_info_message(aon_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_aon_info_message(aon_info_message_sent);
    assert(at == 34);
    at = 0;
    decode_aon_info_message(aon_info_message_got);
    assert(at == 34);
    equal_aon_info_message(aon_info_message_got, aon_info_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_unit_header()
  :: run check_message_header()
  :: run check_login_request_message()
  :: run check_login_response_message()
  :: run check_replay_request_message()
  :: run check_replay_response_message()
  :: run check_time_message()
  :: run check_system_event_message()
  :: run check_order_deleted_message()
  :: run check_order_book_clear_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_size_message()
  :: run check_trade_message()
  :: run check_auction_trade_message()
  :: run check_off_book_trade_message()
  :: run check_trade_break_message()
  :: run check_trade_correction_message()
  :: run check_recovery_trade_message()
  :: run check_auction_info_message()
  :: run check_statistics_message()
  :: run check_extended_statistics_message()
  :: run check_consolidated_statistics_message()
  :: run check_index_message()
  :: run check_aon_info_message()
  :: run check_news_message()
  fi
}
