/*
 * Bolsa Mexicana de Valores Bmv Market Data Snapshot
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 149

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- INTRA Multicast Header: 17 bytes ---------------------------------------- */

/* BMV INTRA Multicast Header */
typedef INTRAMulticastHeader {
  byte length[2];
  byte total_messages;
  byte market_data_group;
  byte session;
  byte sequence_number[4];
  byte datetime[8]
};

int i_n_t_r_a_multicast_header_at;

/* every byte of INTRA Multicast Header set to one value */
inline fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_value) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.market_data_group = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.session = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of INTRA Multicast Header set to where it lies, so a field read out of place says so */
inline ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_base) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 0 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = (i_n_t_r_a_multicast_header_base + 2 + 1) % 256;
  i_n_t_r_a_multicast_header_record.market_data_group = (i_n_t_r_a_multicast_header_base + 3 + 1) % 256;
  i_n_t_r_a_multicast_header_record.session = (i_n_t_r_a_multicast_header_base + 4 + 1) % 256;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 5 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 9 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header to the wire, 17 bytes from where the cursor stands */
inline encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> wire[at] = i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  wire[at] = i_n_t_r_a_multicast_header_record.total_messages; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.market_data_group; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.session; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> wire[at] = i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> wire[at] = i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header off the wire, 17 bytes from where the cursor stands */
inline decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.market_data_group = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.session = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of INTRA Multicast Header is what was written, byte for byte */
inline equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_read, i_n_t_r_a_multicast_header_written) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> assert(i_n_t_r_a_multicast_header_read.length[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.length[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  assert(i_n_t_r_a_multicast_header_read.total_messages == i_n_t_r_a_multicast_header_written.total_messages);
  assert(i_n_t_r_a_multicast_header_read.market_data_group == i_n_t_r_a_multicast_header_written.market_data_group);
  assert(i_n_t_r_a_multicast_header_read.session == i_n_t_r_a_multicast_header_written.session);
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> assert(i_n_t_r_a_multicast_header_read.sequence_number[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.sequence_number[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> assert(i_n_t_r_a_multicast_header_read.datetime[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.datetime[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Message length and message type */
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

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* Answers a login request. */
typedef LoginResponseMessage {
  byte login_response_status
};

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.login_response_status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.login_response_status = (login_response_message_base + 0 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.login_response_status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.login_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.login_response_status == login_response_message_written.login_response_status);
  skip
}

/* ---- Replay Response Message: 8 bytes ---------------------------------------- */

/* Answers a replay request; the replayed messages follow an accepted one. */
typedef ReplayResponseMessage {
  byte market_data_group;
  byte first_message[4];
  byte quantity[2];
  byte replay_response_status
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
  :: replay_response_message_at < 2 -> replay_response_message_record.quantity[replay_response_message_at] = replay_response_message_value; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.replay_response_status = replay_response_message_value;
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
  :: replay_response_message_at < 2 -> replay_response_message_record.quantity[replay_response_message_at] = (replay_response_message_base + 5 + replay_response_message_at + 1) % 256; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.replay_response_status = (replay_response_message_base + 7 + 1) % 256;
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
  :: replay_response_message_at < 2 -> wire[at] = replay_response_message_record.quantity[replay_response_message_at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  wire[at] = replay_response_message_record.replay_response_status; at = at + 1;
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
  :: replay_response_message_at < 2 -> replay_response_message_record.quantity[replay_response_message_at] = wire[at]; at = at + 1; replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  replay_response_message_record.replay_response_status = wire[at]; at = at + 1;
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
  :: replay_response_message_at < 2 -> assert(replay_response_message_read.quantity[replay_response_message_at] == replay_response_message_written.quantity[replay_response_message_at]); replay_response_message_at = replay_response_message_at + 1
  :: else -> break
  od;
  assert(replay_response_message_read.replay_response_status == replay_response_message_written.replay_response_status);
  skip
}

/* ---- Snapshot Response Message: 6 bytes -------------------------------------- */

/* Answers a snapshot request. */
typedef SnapshotResponseMessage {
  byte quantity_of_messages[4];
  byte snapshot_response_status;
  byte snapshot_type
};

int snapshot_response_message_at;

/* every byte of Snapshot Response Message set to one value */
inline fill_snapshot_response_message(snapshot_response_message_record, snapshot_response_message_value) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.quantity_of_messages[snapshot_response_message_at] = snapshot_response_message_value; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_record.snapshot_response_status = snapshot_response_message_value;
  snapshot_response_message_record.snapshot_type = snapshot_response_message_value;
  skip
}

/* each byte of Snapshot Response Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_response_message(snapshot_response_message_record, snapshot_response_message_base) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.quantity_of_messages[snapshot_response_message_at] = (snapshot_response_message_base + 0 + snapshot_response_message_at + 1) % 256; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_record.snapshot_response_status = (snapshot_response_message_base + 4 + 1) % 256;
  snapshot_response_message_record.snapshot_type = (snapshot_response_message_base + 5 + 1) % 256;
  skip
}

/* Snapshot Response Message to the wire, 6 bytes from where the cursor stands */
inline encode_snapshot_response_message(snapshot_response_message_record) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> wire[at] = snapshot_response_message_record.quantity_of_messages[snapshot_response_message_at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  wire[at] = snapshot_response_message_record.snapshot_response_status; at = at + 1;
  wire[at] = snapshot_response_message_record.snapshot_type; at = at + 1;
  skip
}

/* Snapshot Response Message off the wire, 6 bytes from where the cursor stands */
inline decode_snapshot_response_message(snapshot_response_message_record) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> snapshot_response_message_record.quantity_of_messages[snapshot_response_message_at] = wire[at]; at = at + 1; snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  snapshot_response_message_record.snapshot_response_status = wire[at]; at = at + 1;
  snapshot_response_message_record.snapshot_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Snapshot Response Message is what was written, byte for byte */
inline equal_snapshot_response_message(snapshot_response_message_read, snapshot_response_message_written) {
  snapshot_response_message_at = 0;
  do
  :: snapshot_response_message_at < 4 -> assert(snapshot_response_message_read.quantity_of_messages[snapshot_response_message_at] == snapshot_response_message_written.quantity_of_messages[snapshot_response_message_at]); snapshot_response_message_at = snapshot_response_message_at + 1
  :: else -> break
  od;
  assert(snapshot_response_message_read.snapshot_response_status == snapshot_response_message_written.snapshot_response_status);
  assert(snapshot_response_message_read.snapshot_type == snapshot_response_message_written.snapshot_type);
  skip
}

/* ---- Snapshot Complete Message: 6 bytes -------------------------------------- */

/* Ends a snapshot with the sequence number it synchronizes with on the online channel. */
typedef SnapshotCompleteMessage {
  byte sequence_number[4];
  byte market_data_group;
  byte snapshot_type
};

int snapshot_complete_message_at;

/* every byte of Snapshot Complete Message set to one value */
inline fill_snapshot_complete_message(snapshot_complete_message_record, snapshot_complete_message_value) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 4 -> snapshot_complete_message_record.sequence_number[snapshot_complete_message_at] = snapshot_complete_message_value; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_record.market_data_group = snapshot_complete_message_value;
  snapshot_complete_message_record.snapshot_type = snapshot_complete_message_value;
  skip
}

/* each byte of Snapshot Complete Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_complete_message(snapshot_complete_message_record, snapshot_complete_message_base) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 4 -> snapshot_complete_message_record.sequence_number[snapshot_complete_message_at] = (snapshot_complete_message_base + 0 + snapshot_complete_message_at + 1) % 256; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_record.market_data_group = (snapshot_complete_message_base + 4 + 1) % 256;
  snapshot_complete_message_record.snapshot_type = (snapshot_complete_message_base + 5 + 1) % 256;
  skip
}

/* Snapshot Complete Message to the wire, 6 bytes from where the cursor stands */
inline encode_snapshot_complete_message(snapshot_complete_message_record) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 4 -> wire[at] = snapshot_complete_message_record.sequence_number[snapshot_complete_message_at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  wire[at] = snapshot_complete_message_record.market_data_group; at = at + 1;
  wire[at] = snapshot_complete_message_record.snapshot_type; at = at + 1;
  skip
}

/* Snapshot Complete Message off the wire, 6 bytes from where the cursor stands */
inline decode_snapshot_complete_message(snapshot_complete_message_record) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 4 -> snapshot_complete_message_record.sequence_number[snapshot_complete_message_at] = wire[at]; at = at + 1; snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  snapshot_complete_message_record.market_data_group = wire[at]; at = at + 1;
  snapshot_complete_message_record.snapshot_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Snapshot Complete Message is what was written, byte for byte */
inline equal_snapshot_complete_message(snapshot_complete_message_read, snapshot_complete_message_written) {
  snapshot_complete_message_at = 0;
  do
  :: snapshot_complete_message_at < 4 -> assert(snapshot_complete_message_read.sequence_number[snapshot_complete_message_at] == snapshot_complete_message_written.sequence_number[snapshot_complete_message_at]); snapshot_complete_message_at = snapshot_complete_message_at + 1
  :: else -> break
  od;
  assert(snapshot_complete_message_read.market_data_group == snapshot_complete_message_written.market_data_group);
  assert(snapshot_complete_message_read.snapshot_type == snapshot_complete_message_written.snapshot_type);
  skip
}

/* ---- Events System Message: 22 bytes ----------------------------------------- */

/* The system of events message is used to inform that an event has occurred, which needs to be of public domain. */
typedef EventsSystemMessage {
  byte instrument_number[4];
  byte event_code;
  byte market;
  byte sending_time[8];
  byte ending_time[8]
};

int events_system_message_at;

/* every byte of Events System Message set to one value */
inline fill_events_system_message(events_system_message_record, events_system_message_value) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> events_system_message_record.instrument_number[events_system_message_at] = events_system_message_value; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_record.event_code = events_system_message_value;
  events_system_message_record.market = events_system_message_value;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.sending_time[events_system_message_at] = events_system_message_value; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.ending_time[events_system_message_at] = events_system_message_value; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Events System Message set to where it lies, so a field read out of place says so */
inline ramp_events_system_message(events_system_message_record, events_system_message_base) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> events_system_message_record.instrument_number[events_system_message_at] = (events_system_message_base + 0 + events_system_message_at + 1) % 256; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_record.event_code = (events_system_message_base + 4 + 1) % 256;
  events_system_message_record.market = (events_system_message_base + 5 + 1) % 256;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.sending_time[events_system_message_at] = (events_system_message_base + 6 + events_system_message_at + 1) % 256; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.ending_time[events_system_message_at] = (events_system_message_base + 14 + events_system_message_at + 1) % 256; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* Events System Message to the wire, 22 bytes from where the cursor stands */
inline encode_events_system_message(events_system_message_record) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> wire[at] = events_system_message_record.instrument_number[events_system_message_at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  wire[at] = events_system_message_record.event_code; at = at + 1;
  wire[at] = events_system_message_record.market; at = at + 1;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> wire[at] = events_system_message_record.sending_time[events_system_message_at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> wire[at] = events_system_message_record.ending_time[events_system_message_at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* Events System Message off the wire, 22 bytes from where the cursor stands */
inline decode_events_system_message(events_system_message_record) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> events_system_message_record.instrument_number[events_system_message_at] = wire[at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_record.event_code = wire[at]; at = at + 1;
  events_system_message_record.market = wire[at]; at = at + 1;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.sending_time[events_system_message_at] = wire[at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.ending_time[events_system_message_at] = wire[at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Events System Message is what was written, byte for byte */
inline equal_events_system_message(events_system_message_read, events_system_message_written) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> assert(events_system_message_read.instrument_number[events_system_message_at] == events_system_message_written.instrument_number[events_system_message_at]); events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  assert(events_system_message_read.event_code == events_system_message_written.event_code);
  assert(events_system_message_read.market == events_system_message_written.market);
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> assert(events_system_message_read.sending_time[events_system_message_at] == events_system_message_written.sending_time[events_system_message_at]); events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> assert(events_system_message_read.ending_time[events_system_message_at] == events_system_message_written.ending_time[events_system_message_at]); events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancellation Message: 8 bytes ------------------------------------- */

/* This message is sent when a transaction is cancelled from the BMV system. */
typedef TradeCancellationMessage {
  byte instrument_number[4];
  byte trade_number[4]
};

int trade_cancellation_message_at;

/* every byte of Trade Cancellation Message set to one value */
inline fill_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_value) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.instrument_number[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.trade_number[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_base) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.instrument_number[trade_cancellation_message_at] = (trade_cancellation_message_base + 0 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.trade_number[trade_cancellation_message_at] = (trade_cancellation_message_base + 4 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message to the wire, 8 bytes from where the cursor stands */
inline encode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.instrument_number[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.trade_number[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message off the wire, 8 bytes from where the cursor stands */
inline decode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.instrument_number[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.trade_number[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Message is what was written, byte for byte */
inline equal_trade_cancellation_message(trade_cancellation_message_read, trade_cancellation_message_written) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.instrument_number[trade_cancellation_message_at] == trade_cancellation_message_written.instrument_number[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.trade_number[trade_cancellation_message_at] == trade_cancellation_message_written.trade_number[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Status Changes Message: 5 bytes ----------------------------------------- */

/* All instruments are in a certain status before and during trading session. */
typedef StatusChangesMessage {
  byte instrument_number[4];
  byte instrument_status
};

int status_changes_message_at;

/* every byte of Status Changes Message set to one value */
inline fill_status_changes_message(status_changes_message_record, status_changes_message_value) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> status_changes_message_record.instrument_number[status_changes_message_at] = status_changes_message_value; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  status_changes_message_record.instrument_status = status_changes_message_value;
  skip
}

/* each byte of Status Changes Message set to where it lies, so a field read out of place says so */
inline ramp_status_changes_message(status_changes_message_record, status_changes_message_base) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> status_changes_message_record.instrument_number[status_changes_message_at] = (status_changes_message_base + 0 + status_changes_message_at + 1) % 256; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  status_changes_message_record.instrument_status = (status_changes_message_base + 4 + 1) % 256;
  skip
}

/* Status Changes Message to the wire, 5 bytes from where the cursor stands */
inline encode_status_changes_message(status_changes_message_record) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> wire[at] = status_changes_message_record.instrument_number[status_changes_message_at]; at = at + 1; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  wire[at] = status_changes_message_record.instrument_status; at = at + 1;
  skip
}

/* Status Changes Message off the wire, 5 bytes from where the cursor stands */
inline decode_status_changes_message(status_changes_message_record) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> status_changes_message_record.instrument_number[status_changes_message_at] = wire[at]; at = at + 1; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  status_changes_message_record.instrument_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Status Changes Message is what was written, byte for byte */
inline equal_status_changes_message(status_changes_message_read, status_changes_message_written) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> assert(status_changes_message_read.instrument_number[status_changes_message_at] == status_changes_message_written.instrument_number[status_changes_message_at]); status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  assert(status_changes_message_read.instrument_status == status_changes_message_written.instrument_status);
  skip
}

/* ---- Weighted Average Price Settlement Prices Message: 20 bytes -------------- */

/* For equities market, this message will be sent for each operation containing weighted average price per instrument generated within WAP calculation period (last 20 minutes of trading). */
typedef WeightedAveragePriceSettlementPricesMessage {
  byte instrument_number[4];
  byte weighted_average_price[8];
  byte volatility[8]
};

int weighted_average_price_settlement_prices_message_at;

/* every byte of Weighted Average Price Settlement Prices Message set to one value */
inline fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record, weighted_average_price_settlement_prices_message_value) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at] = weighted_average_price_settlement_prices_message_value; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at] = weighted_average_price_settlement_prices_message_value; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at] = weighted_average_price_settlement_prices_message_value; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Weighted Average Price Settlement Prices Message set to where it lies, so a field read out of place says so */
inline ramp_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record, weighted_average_price_settlement_prices_message_base) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at] = (weighted_average_price_settlement_prices_message_base + 0 + weighted_average_price_settlement_prices_message_at + 1) % 256; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at] = (weighted_average_price_settlement_prices_message_base + 4 + weighted_average_price_settlement_prices_message_at + 1) % 256; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at] = (weighted_average_price_settlement_prices_message_base + 12 + weighted_average_price_settlement_prices_message_at + 1) % 256; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Settlement Prices Message to the wire, 20 bytes from where the cursor stands */
inline encode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> wire[at] = weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> wire[at] = weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> wire[at] = weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Settlement Prices Message off the wire, 20 bytes from where the cursor stands */
inline decode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at] = wire[at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at] = wire[at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at] = wire[at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Weighted Average Price Settlement Prices Message is what was written, byte for byte */
inline equal_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_read, weighted_average_price_settlement_prices_message_written) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> assert(weighted_average_price_settlement_prices_message_read.instrument_number[weighted_average_price_settlement_prices_message_at] == weighted_average_price_settlement_prices_message_written.instrument_number[weighted_average_price_settlement_prices_message_at]); weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> assert(weighted_average_price_settlement_prices_message_read.weighted_average_price[weighted_average_price_settlement_prices_message_at] == weighted_average_price_settlement_prices_message_written.weighted_average_price[weighted_average_price_settlement_prices_message_at]); weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> assert(weighted_average_price_settlement_prices_message_read.volatility[weighted_average_price_settlement_prices_message_at] == weighted_average_price_settlement_prices_message_written.volatility[weighted_average_price_settlement_prices_message_at]); weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Capital Trades Message: 51 bytes ---------------------------------------- */

/* Contains information on any BMV accepted transaction. */
typedef CapitalTradesMessage {
  byte instrument_number[4];
  byte trade_time[8];
  byte volume_int_324[4];
  byte price[8];
  byte concertation_type;
  byte trade_number[4];
  byte price_setter;
  byte operation_type;
  byte amount[8];
  byte buy_alpha_5[5];
  byte sell_alpha_5[5];
  byte settlement;
  byte auction_indicator
};

int capital_trades_message_at;

/* every byte of Capital Trades Message set to one value */
inline fill_capital_trades_message(capital_trades_message_record, capital_trades_message_value) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.instrument_number[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.trade_time[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.volume_int_324[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.price[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.concertation_type = capital_trades_message_value;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.trade_number[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.price_setter = capital_trades_message_value;
  capital_trades_message_record.operation_type = capital_trades_message_value;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.amount[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.buy_alpha_5[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.sell_alpha_5[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.settlement = capital_trades_message_value;
  capital_trades_message_record.auction_indicator = capital_trades_message_value;
  skip
}

/* each byte of Capital Trades Message set to where it lies, so a field read out of place says so */
inline ramp_capital_trades_message(capital_trades_message_record, capital_trades_message_base) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.instrument_number[capital_trades_message_at] = (capital_trades_message_base + 0 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.trade_time[capital_trades_message_at] = (capital_trades_message_base + 4 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.volume_int_324[capital_trades_message_at] = (capital_trades_message_base + 12 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.price[capital_trades_message_at] = (capital_trades_message_base + 16 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.concertation_type = (capital_trades_message_base + 24 + 1) % 256;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.trade_number[capital_trades_message_at] = (capital_trades_message_base + 25 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.price_setter = (capital_trades_message_base + 29 + 1) % 256;
  capital_trades_message_record.operation_type = (capital_trades_message_base + 30 + 1) % 256;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.amount[capital_trades_message_at] = (capital_trades_message_base + 31 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.buy_alpha_5[capital_trades_message_at] = (capital_trades_message_base + 39 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.sell_alpha_5[capital_trades_message_at] = (capital_trades_message_base + 44 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.settlement = (capital_trades_message_base + 49 + 1) % 256;
  capital_trades_message_record.auction_indicator = (capital_trades_message_base + 50 + 1) % 256;
  skip
}

/* Capital Trades Message to the wire, 51 bytes from where the cursor stands */
inline encode_capital_trades_message(capital_trades_message_record) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> wire[at] = capital_trades_message_record.instrument_number[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> wire[at] = capital_trades_message_record.trade_time[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> wire[at] = capital_trades_message_record.volume_int_324[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> wire[at] = capital_trades_message_record.price[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_trades_message_record.concertation_type; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> wire[at] = capital_trades_message_record.trade_number[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_trades_message_record.price_setter; at = at + 1;
  wire[at] = capital_trades_message_record.operation_type; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> wire[at] = capital_trades_message_record.amount[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> wire[at] = capital_trades_message_record.buy_alpha_5[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> wire[at] = capital_trades_message_record.sell_alpha_5[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_trades_message_record.settlement; at = at + 1;
  wire[at] = capital_trades_message_record.auction_indicator; at = at + 1;
  skip
}

/* Capital Trades Message off the wire, 51 bytes from where the cursor stands */
inline decode_capital_trades_message(capital_trades_message_record) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.instrument_number[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.trade_time[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.volume_int_324[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.price[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.concertation_type = wire[at]; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.trade_number[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.price_setter = wire[at]; at = at + 1;
  capital_trades_message_record.operation_type = wire[at]; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.amount[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.buy_alpha_5[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.sell_alpha_5[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.settlement = wire[at]; at = at + 1;
  capital_trades_message_record.auction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Capital Trades Message is what was written, byte for byte */
inline equal_capital_trades_message(capital_trades_message_read, capital_trades_message_written) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> assert(capital_trades_message_read.instrument_number[capital_trades_message_at] == capital_trades_message_written.instrument_number[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> assert(capital_trades_message_read.trade_time[capital_trades_message_at] == capital_trades_message_written.trade_time[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> assert(capital_trades_message_read.volume_int_324[capital_trades_message_at] == capital_trades_message_written.volume_int_324[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> assert(capital_trades_message_read.price[capital_trades_message_at] == capital_trades_message_written.price[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  assert(capital_trades_message_read.concertation_type == capital_trades_message_written.concertation_type);
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> assert(capital_trades_message_read.trade_number[capital_trades_message_at] == capital_trades_message_written.trade_number[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  assert(capital_trades_message_read.price_setter == capital_trades_message_written.price_setter);
  assert(capital_trades_message_read.operation_type == capital_trades_message_written.operation_type);
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> assert(capital_trades_message_read.amount[capital_trades_message_at] == capital_trades_message_written.amount[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> assert(capital_trades_message_read.buy_alpha_5[capital_trades_message_at] == capital_trades_message_written.buy_alpha_5[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> assert(capital_trades_message_read.sell_alpha_5[capital_trades_message_at] == capital_trades_message_written.sell_alpha_5[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  assert(capital_trades_message_read.settlement == capital_trades_message_written.settlement);
  assert(capital_trades_message_read.auction_indicator == capital_trades_message_written.auction_indicator);
  skip
}

/* ---- Probable Allocation Price Message: 16 bytes ----------------------------- */

/* Sent during any auction type (Opening, Continuous, Volatility and Intraday) and only on instruments where there is already a virtual match or pre-allocation. */
typedef ProbableAllocationPriceMessage {
  byte instrument_number[4];
  byte probable_allocation_price[8];
  byte volume_int_324[4]
};

int probable_allocation_price_message_at;

/* every byte of Probable Allocation Price Message set to one value */
inline fill_probable_allocation_price_message(probable_allocation_price_message_record, probable_allocation_price_message_value) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at] = probable_allocation_price_message_value; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at] = probable_allocation_price_message_value; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at] = probable_allocation_price_message_value; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Probable Allocation Price Message set to where it lies, so a field read out of place says so */
inline ramp_probable_allocation_price_message(probable_allocation_price_message_record, probable_allocation_price_message_base) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at] = (probable_allocation_price_message_base + 0 + probable_allocation_price_message_at + 1) % 256; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at] = (probable_allocation_price_message_base + 4 + probable_allocation_price_message_at + 1) % 256; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at] = (probable_allocation_price_message_base + 12 + probable_allocation_price_message_at + 1) % 256; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Allocation Price Message to the wire, 16 bytes from where the cursor stands */
inline encode_probable_allocation_price_message(probable_allocation_price_message_record) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> wire[at] = probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> wire[at] = probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> wire[at] = probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Allocation Price Message off the wire, 16 bytes from where the cursor stands */
inline decode_probable_allocation_price_message(probable_allocation_price_message_record) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at] = wire[at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at] = wire[at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at] = wire[at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Probable Allocation Price Message is what was written, byte for byte */
inline equal_probable_allocation_price_message(probable_allocation_price_message_read, probable_allocation_price_message_written) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> assert(probable_allocation_price_message_read.instrument_number[probable_allocation_price_message_at] == probable_allocation_price_message_written.instrument_number[probable_allocation_price_message_at]); probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> assert(probable_allocation_price_message_read.probable_allocation_price[probable_allocation_price_message_at] == probable_allocation_price_message_written.probable_allocation_price[probable_allocation_price_message_at]); probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> assert(probable_allocation_price_message_read.volume_int_324[probable_allocation_price_message_at] == probable_allocation_price_message_written.volume_int_324[probable_allocation_price_message_at]); probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Continuous Auctions Beginning Message: 20 bytes ------------------------- */

/* Sent at the moment one of the Continuous, Volatility or SIC auctions is generated. */
typedef ContinuousAuctionsBeginningMessage {
  byte instrument_number[4];
  byte beginning_time_of_auction[8];
  byte end_auction_time[8]
};

int continuous_auctions_beginning_message_at;

/* every byte of Continuous Auctions Beginning Message set to one value */
inline fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record, continuous_auctions_beginning_message_value) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at] = continuous_auctions_beginning_message_value; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at] = continuous_auctions_beginning_message_value; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at] = continuous_auctions_beginning_message_value; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Continuous Auctions Beginning Message set to where it lies, so a field read out of place says so */
inline ramp_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record, continuous_auctions_beginning_message_base) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at] = (continuous_auctions_beginning_message_base + 0 + continuous_auctions_beginning_message_at + 1) % 256; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at] = (continuous_auctions_beginning_message_base + 4 + continuous_auctions_beginning_message_at + 1) % 256; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at] = (continuous_auctions_beginning_message_base + 12 + continuous_auctions_beginning_message_at + 1) % 256; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Continuous Auctions Beginning Message to the wire, 20 bytes from where the cursor stands */
inline encode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> wire[at] = continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> wire[at] = continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> wire[at] = continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Continuous Auctions Beginning Message off the wire, 20 bytes from where the cursor stands */
inline decode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at] = wire[at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at] = wire[at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at] = wire[at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Continuous Auctions Beginning Message is what was written, byte for byte */
inline equal_continuous_auctions_beginning_message(continuous_auctions_beginning_message_read, continuous_auctions_beginning_message_written) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> assert(continuous_auctions_beginning_message_read.instrument_number[continuous_auctions_beginning_message_at] == continuous_auctions_beginning_message_written.instrument_number[continuous_auctions_beginning_message_at]); continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> assert(continuous_auctions_beginning_message_read.beginning_time_of_auction[continuous_auctions_beginning_message_at] == continuous_auctions_beginning_message_written.beginning_time_of_auction[continuous_auctions_beginning_message_at]); continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> assert(continuous_auctions_beginning_message_read.end_auction_time[continuous_auctions_beginning_message_at] == continuous_auctions_beginning_message_written.end_auction_time[continuous_auctions_beginning_message_at]); continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Middle Price Existing Quotes Message: 5 bytes --------------------------- */

/* Generated when an instrument enters a posture in the hidden electronic Middle Price book. */
typedef MiddlePriceExistingQuotesMessage {
  byte instrument_number[4];
  byte existing_postures
};

int middle_price_existing_quotes_message_at;

/* every byte of Middle Price Existing Quotes Message set to one value */
inline fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record, middle_price_existing_quotes_message_value) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at] = middle_price_existing_quotes_message_value; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  middle_price_existing_quotes_message_record.existing_postures = middle_price_existing_quotes_message_value;
  skip
}

/* each byte of Middle Price Existing Quotes Message set to where it lies, so a field read out of place says so */
inline ramp_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record, middle_price_existing_quotes_message_base) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at] = (middle_price_existing_quotes_message_base + 0 + middle_price_existing_quotes_message_at + 1) % 256; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  middle_price_existing_quotes_message_record.existing_postures = (middle_price_existing_quotes_message_base + 4 + 1) % 256;
  skip
}

/* Middle Price Existing Quotes Message to the wire, 5 bytes from where the cursor stands */
inline encode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> wire[at] = middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at]; at = at + 1; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  wire[at] = middle_price_existing_quotes_message_record.existing_postures; at = at + 1;
  skip
}

/* Middle Price Existing Quotes Message off the wire, 5 bytes from where the cursor stands */
inline decode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at] = wire[at]; at = at + 1; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  middle_price_existing_quotes_message_record.existing_postures = wire[at]; at = at + 1;
  skip
}

/* what was read of Middle Price Existing Quotes Message is what was written, byte for byte */
inline equal_middle_price_existing_quotes_message(middle_price_existing_quotes_message_read, middle_price_existing_quotes_message_written) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> assert(middle_price_existing_quotes_message_read.instrument_number[middle_price_existing_quotes_message_at] == middle_price_existing_quotes_message_written.instrument_number[middle_price_existing_quotes_message_at]); middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  assert(middle_price_existing_quotes_message_read.existing_postures == middle_price_existing_quotes_message_written.existing_postures);
  skip
}

/* ---- Registry Operations Message: 61 bytes ----------------------------------- */

/* Sent whenever there is a debt or capital instrument placement. */
typedef RegistryOperationsMessage {
  byte instrument_number[4];
  byte offer_type;
  byte income;
  byte value_type[4];
  byte issuer[7];
  byte series[6];
  byte maximum_volume[8];
  byte registered_volume[8];
  byte price_rate[8];
  byte settlement_date[8];
  byte firm[5];
  byte movement
};

int registry_operations_message_at;

/* every byte of Registry Operations Message set to one value */
inline fill_registry_operations_message(registry_operations_message_record, registry_operations_message_value) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.instrument_number[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.offer_type = registry_operations_message_value;
  registry_operations_message_record.income = registry_operations_message_value;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.value_type[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> registry_operations_message_record.issuer[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> registry_operations_message_record.series[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.maximum_volume[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.registered_volume[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.price_rate[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.settlement_date[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> registry_operations_message_record.firm[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.movement = registry_operations_message_value;
  skip
}

/* each byte of Registry Operations Message set to where it lies, so a field read out of place says so */
inline ramp_registry_operations_message(registry_operations_message_record, registry_operations_message_base) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.instrument_number[registry_operations_message_at] = (registry_operations_message_base + 0 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.offer_type = (registry_operations_message_base + 4 + 1) % 256;
  registry_operations_message_record.income = (registry_operations_message_base + 5 + 1) % 256;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.value_type[registry_operations_message_at] = (registry_operations_message_base + 6 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> registry_operations_message_record.issuer[registry_operations_message_at] = (registry_operations_message_base + 10 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> registry_operations_message_record.series[registry_operations_message_at] = (registry_operations_message_base + 17 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.maximum_volume[registry_operations_message_at] = (registry_operations_message_base + 23 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.registered_volume[registry_operations_message_at] = (registry_operations_message_base + 31 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.price_rate[registry_operations_message_at] = (registry_operations_message_base + 39 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.settlement_date[registry_operations_message_at] = (registry_operations_message_base + 47 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> registry_operations_message_record.firm[registry_operations_message_at] = (registry_operations_message_base + 55 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.movement = (registry_operations_message_base + 60 + 1) % 256;
  skip
}

/* Registry Operations Message to the wire, 61 bytes from where the cursor stands */
inline encode_registry_operations_message(registry_operations_message_record) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> wire[at] = registry_operations_message_record.instrument_number[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  wire[at] = registry_operations_message_record.offer_type; at = at + 1;
  wire[at] = registry_operations_message_record.income; at = at + 1;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> wire[at] = registry_operations_message_record.value_type[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> wire[at] = registry_operations_message_record.issuer[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> wire[at] = registry_operations_message_record.series[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.maximum_volume[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.registered_volume[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.price_rate[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.settlement_date[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> wire[at] = registry_operations_message_record.firm[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  wire[at] = registry_operations_message_record.movement; at = at + 1;
  skip
}

/* Registry Operations Message off the wire, 61 bytes from where the cursor stands */
inline decode_registry_operations_message(registry_operations_message_record) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.instrument_number[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.offer_type = wire[at]; at = at + 1;
  registry_operations_message_record.income = wire[at]; at = at + 1;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.value_type[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> registry_operations_message_record.issuer[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> registry_operations_message_record.series[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.maximum_volume[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.registered_volume[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.price_rate[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.settlement_date[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> registry_operations_message_record.firm[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.movement = wire[at]; at = at + 1;
  skip
}

/* what was read of Registry Operations Message is what was written, byte for byte */
inline equal_registry_operations_message(registry_operations_message_read, registry_operations_message_written) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> assert(registry_operations_message_read.instrument_number[registry_operations_message_at] == registry_operations_message_written.instrument_number[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  assert(registry_operations_message_read.offer_type == registry_operations_message_written.offer_type);
  assert(registry_operations_message_read.income == registry_operations_message_written.income);
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> assert(registry_operations_message_read.value_type[registry_operations_message_at] == registry_operations_message_written.value_type[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> assert(registry_operations_message_read.issuer[registry_operations_message_at] == registry_operations_message_written.issuer[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> assert(registry_operations_message_read.series[registry_operations_message_at] == registry_operations_message_written.series[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.maximum_volume[registry_operations_message_at] == registry_operations_message_written.maximum_volume[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.registered_volume[registry_operations_message_at] == registry_operations_message_written.registered_volume[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.price_rate[registry_operations_message_at] == registry_operations_message_written.price_rate[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.settlement_date[registry_operations_message_at] == registry_operations_message_written.settlement_date[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> assert(registry_operations_message_read.firm[registry_operations_message_at] == registry_operations_message_written.firm[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  assert(registry_operations_message_read.movement == registry_operations_message_written.movement);
  skip
}

/* ---- Mutual Fund Trades Message: 52 bytes ------------------------------------ */

/* Contains any mutual funds operation realized. */
typedef MutualFundTradesMessage {
  byte instrument_number[4];
  byte trade_date[8];
  byte price[8];
  byte book_value[8];
  byte number_of_sales_transactions[4];
  byte sales_volume[8];
  byte number_of_buy_transactions[4];
  byte buy_volume[8]
};

int mutual_fund_trades_message_at;

/* every byte of Mutual Fund Trades Message set to one value */
inline fill_mutual_fund_trades_message(mutual_fund_trades_message_record, mutual_fund_trades_message_value) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.price[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mutual Fund Trades Message set to where it lies, so a field read out of place says so */
inline ramp_mutual_fund_trades_message(mutual_fund_trades_message_record, mutual_fund_trades_message_base) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 0 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 4 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.price[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 12 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 20 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 28 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 32 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 40 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 44 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Fund Trades Message to the wire, 52 bytes from where the cursor stands */
inline encode_mutual_fund_trades_message(mutual_fund_trades_message_record) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> wire[at] = mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.price[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> wire[at] = mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> wire[at] = mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Fund Trades Message off the wire, 52 bytes from where the cursor stands */
inline decode_mutual_fund_trades_message(mutual_fund_trades_message_record) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.price[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mutual Fund Trades Message is what was written, byte for byte */
inline equal_mutual_fund_trades_message(mutual_fund_trades_message_read, mutual_fund_trades_message_written) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> assert(mutual_fund_trades_message_read.instrument_number[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.instrument_number[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.trade_date[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.trade_date[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.price[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.price[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.book_value[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.book_value[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> assert(mutual_fund_trades_message_read.number_of_sales_transactions[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.number_of_sales_transactions[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.sales_volume[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.sales_volume[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> assert(mutual_fund_trades_message_read.number_of_buy_transactions[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.number_of_buy_transactions[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.buy_volume[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.buy_volume[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tradability Message: 64 bytes ------------------------------------------- */

/* Message sent every half hour during trading session, informing general tradability by instrument. */
typedef TradabilityMessage {
  byte instrument_number[4];
  byte number_of_operations[4];
  byte volume_int_648[8];
  byte amount[8];
  byte opening_price[8];
  byte maximum[8];
  byte minimum[8];
  byte average[8];
  byte last[8]
};

int tradability_message_at;

/* every byte of Tradability Message set to one value */
inline fill_tradability_message(tradability_message_record, tradability_message_value) {
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> tradability_message_record.instrument_number[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> tradability_message_record.number_of_operations[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.volume_int_648[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.amount[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.opening_price[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.maximum[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.minimum[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.average[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.last[tradability_message_at] = tradability_message_value; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tradability Message set to where it lies, so a field read out of place says so */
inline ramp_tradability_message(tradability_message_record, tradability_message_base) {
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> tradability_message_record.instrument_number[tradability_message_at] = (tradability_message_base + 0 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> tradability_message_record.number_of_operations[tradability_message_at] = (tradability_message_base + 4 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.volume_int_648[tradability_message_at] = (tradability_message_base + 8 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.amount[tradability_message_at] = (tradability_message_base + 16 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.opening_price[tradability_message_at] = (tradability_message_base + 24 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.maximum[tradability_message_at] = (tradability_message_base + 32 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.minimum[tradability_message_at] = (tradability_message_base + 40 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.average[tradability_message_at] = (tradability_message_base + 48 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.last[tradability_message_at] = (tradability_message_base + 56 + tradability_message_at + 1) % 256; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tradability Message to the wire, 64 bytes from where the cursor stands */
inline encode_tradability_message(tradability_message_record) {
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> wire[at] = tradability_message_record.instrument_number[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> wire[at] = tradability_message_record.number_of_operations[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> wire[at] = tradability_message_record.volume_int_648[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> wire[at] = tradability_message_record.amount[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> wire[at] = tradability_message_record.opening_price[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> wire[at] = tradability_message_record.maximum[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> wire[at] = tradability_message_record.minimum[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> wire[at] = tradability_message_record.average[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> wire[at] = tradability_message_record.last[tradability_message_at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  skip
}

/* Tradability Message off the wire, 64 bytes from where the cursor stands */
inline decode_tradability_message(tradability_message_record) {
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> tradability_message_record.instrument_number[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> tradability_message_record.number_of_operations[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.volume_int_648[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.amount[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.opening_price[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.maximum[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.minimum[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.average[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> tradability_message_record.last[tradability_message_at] = wire[at]; at = at + 1; tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tradability Message is what was written, byte for byte */
inline equal_tradability_message(tradability_message_read, tradability_message_written) {
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> assert(tradability_message_read.instrument_number[tradability_message_at] == tradability_message_written.instrument_number[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 4 -> assert(tradability_message_read.number_of_operations[tradability_message_at] == tradability_message_written.number_of_operations[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> assert(tradability_message_read.volume_int_648[tradability_message_at] == tradability_message_written.volume_int_648[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> assert(tradability_message_read.amount[tradability_message_at] == tradability_message_written.amount[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> assert(tradability_message_read.opening_price[tradability_message_at] == tradability_message_written.opening_price[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> assert(tradability_message_read.maximum[tradability_message_at] == tradability_message_written.maximum[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> assert(tradability_message_read.minimum[tradability_message_at] == tradability_message_written.minimum[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> assert(tradability_message_read.average[tradability_message_at] == tradability_message_written.average[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  tradability_message_at = 0;
  do
  :: tradability_message_at < 8 -> assert(tradability_message_read.last[tradability_message_at] == tradability_message_written.last[tradability_message_at]); tradability_message_at = tradability_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Virtual Trades Message: 25 bytes ---------------------------------------- */

/* When an operation has been pre-assigned to the at closing and average day Price electronic books, a virtual trade message is sent, where also notifying of this operation. */
typedef VirtualTradesMessage {
  byte instrument_number[4];
  byte virtual_trades_status;
  byte operation_type;
  byte number[4];
  byte volume_int_324[4];
  byte concertation;
  byte buy_alpha_5[5];
  byte sell_alpha_5[5]
};

int virtual_trades_message_at;

/* every byte of Virtual Trades Message set to one value */
inline fill_virtual_trades_message(virtual_trades_message_record, virtual_trades_message_value) {
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.instrument_number[virtual_trades_message_at] = virtual_trades_message_value; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_record.virtual_trades_status = virtual_trades_message_value;
  virtual_trades_message_record.operation_type = virtual_trades_message_value;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.number[virtual_trades_message_at] = virtual_trades_message_value; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.volume_int_324[virtual_trades_message_at] = virtual_trades_message_value; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_record.concertation = virtual_trades_message_value;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> virtual_trades_message_record.buy_alpha_5[virtual_trades_message_at] = virtual_trades_message_value; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> virtual_trades_message_record.sell_alpha_5[virtual_trades_message_at] = virtual_trades_message_value; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Virtual Trades Message set to where it lies, so a field read out of place says so */
inline ramp_virtual_trades_message(virtual_trades_message_record, virtual_trades_message_base) {
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.instrument_number[virtual_trades_message_at] = (virtual_trades_message_base + 0 + virtual_trades_message_at + 1) % 256; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_record.virtual_trades_status = (virtual_trades_message_base + 4 + 1) % 256;
  virtual_trades_message_record.operation_type = (virtual_trades_message_base + 5 + 1) % 256;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.number[virtual_trades_message_at] = (virtual_trades_message_base + 6 + virtual_trades_message_at + 1) % 256; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.volume_int_324[virtual_trades_message_at] = (virtual_trades_message_base + 10 + virtual_trades_message_at + 1) % 256; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_record.concertation = (virtual_trades_message_base + 14 + 1) % 256;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> virtual_trades_message_record.buy_alpha_5[virtual_trades_message_at] = (virtual_trades_message_base + 15 + virtual_trades_message_at + 1) % 256; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> virtual_trades_message_record.sell_alpha_5[virtual_trades_message_at] = (virtual_trades_message_base + 20 + virtual_trades_message_at + 1) % 256; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Virtual Trades Message to the wire, 25 bytes from where the cursor stands */
inline encode_virtual_trades_message(virtual_trades_message_record) {
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> wire[at] = virtual_trades_message_record.instrument_number[virtual_trades_message_at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = virtual_trades_message_record.virtual_trades_status; at = at + 1;
  wire[at] = virtual_trades_message_record.operation_type; at = at + 1;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> wire[at] = virtual_trades_message_record.number[virtual_trades_message_at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> wire[at] = virtual_trades_message_record.volume_int_324[virtual_trades_message_at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = virtual_trades_message_record.concertation; at = at + 1;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> wire[at] = virtual_trades_message_record.buy_alpha_5[virtual_trades_message_at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> wire[at] = virtual_trades_message_record.sell_alpha_5[virtual_trades_message_at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Virtual Trades Message off the wire, 25 bytes from where the cursor stands */
inline decode_virtual_trades_message(virtual_trades_message_record) {
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.instrument_number[virtual_trades_message_at] = wire[at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_record.virtual_trades_status = wire[at]; at = at + 1;
  virtual_trades_message_record.operation_type = wire[at]; at = at + 1;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.number[virtual_trades_message_at] = wire[at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> virtual_trades_message_record.volume_int_324[virtual_trades_message_at] = wire[at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_record.concertation = wire[at]; at = at + 1;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> virtual_trades_message_record.buy_alpha_5[virtual_trades_message_at] = wire[at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> virtual_trades_message_record.sell_alpha_5[virtual_trades_message_at] = wire[at]; at = at + 1; virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Virtual Trades Message is what was written, byte for byte */
inline equal_virtual_trades_message(virtual_trades_message_read, virtual_trades_message_written) {
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> assert(virtual_trades_message_read.instrument_number[virtual_trades_message_at] == virtual_trades_message_written.instrument_number[virtual_trades_message_at]); virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  assert(virtual_trades_message_read.virtual_trades_status == virtual_trades_message_written.virtual_trades_status);
  assert(virtual_trades_message_read.operation_type == virtual_trades_message_written.operation_type);
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> assert(virtual_trades_message_read.number[virtual_trades_message_at] == virtual_trades_message_written.number[virtual_trades_message_at]); virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 4 -> assert(virtual_trades_message_read.volume_int_324[virtual_trades_message_at] == virtual_trades_message_written.volume_int_324[virtual_trades_message_at]); virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  assert(virtual_trades_message_read.concertation == virtual_trades_message_written.concertation);
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> assert(virtual_trades_message_read.buy_alpha_5[virtual_trades_message_at] == virtual_trades_message_written.buy_alpha_5[virtual_trades_message_at]); virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  virtual_trades_message_at = 0;
  do
  :: virtual_trades_message_at < 5 -> assert(virtual_trades_message_read.sell_alpha_5[virtual_trades_message_at] == virtual_trades_message_written.sell_alpha_5[virtual_trades_message_at]); virtual_trades_message_at = virtual_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Addition Message: 34 bytes ---------------------------------------- */

/* The moment an order is being accepted by the BMV central system; this message is diffused to the corresponding media. */
typedef OrderAdditionMessage {
  byte instrument_number[4];
  byte date_and_time[8];
  byte number[4];
  byte direction;
  byte volume_int_324[4];
  byte price[8];
  byte participant[5]
};

int order_addition_message_at;

/* every byte of Order Addition Message set to one value */
inline fill_order_addition_message(order_addition_message_record, order_addition_message_value) {
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.instrument_number[order_addition_message_at] = order_addition_message_value; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> order_addition_message_record.date_and_time[order_addition_message_at] = order_addition_message_value; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.number[order_addition_message_at] = order_addition_message_value; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_record.direction = order_addition_message_value;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.volume_int_324[order_addition_message_at] = order_addition_message_value; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> order_addition_message_record.price[order_addition_message_at] = order_addition_message_value; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 5 -> order_addition_message_record.participant[order_addition_message_at] = order_addition_message_value; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Addition Message set to where it lies, so a field read out of place says so */
inline ramp_order_addition_message(order_addition_message_record, order_addition_message_base) {
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.instrument_number[order_addition_message_at] = (order_addition_message_base + 0 + order_addition_message_at + 1) % 256; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> order_addition_message_record.date_and_time[order_addition_message_at] = (order_addition_message_base + 4 + order_addition_message_at + 1) % 256; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.number[order_addition_message_at] = (order_addition_message_base + 12 + order_addition_message_at + 1) % 256; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_record.direction = (order_addition_message_base + 16 + 1) % 256;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.volume_int_324[order_addition_message_at] = (order_addition_message_base + 17 + order_addition_message_at + 1) % 256; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> order_addition_message_record.price[order_addition_message_at] = (order_addition_message_base + 21 + order_addition_message_at + 1) % 256; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 5 -> order_addition_message_record.participant[order_addition_message_at] = (order_addition_message_base + 29 + order_addition_message_at + 1) % 256; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Addition Message to the wire, 34 bytes from where the cursor stands */
inline encode_order_addition_message(order_addition_message_record) {
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> wire[at] = order_addition_message_record.instrument_number[order_addition_message_at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> wire[at] = order_addition_message_record.date_and_time[order_addition_message_at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> wire[at] = order_addition_message_record.number[order_addition_message_at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  wire[at] = order_addition_message_record.direction; at = at + 1;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> wire[at] = order_addition_message_record.volume_int_324[order_addition_message_at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> wire[at] = order_addition_message_record.price[order_addition_message_at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 5 -> wire[at] = order_addition_message_record.participant[order_addition_message_at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Addition Message off the wire, 34 bytes from where the cursor stands */
inline decode_order_addition_message(order_addition_message_record) {
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.instrument_number[order_addition_message_at] = wire[at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> order_addition_message_record.date_and_time[order_addition_message_at] = wire[at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.number[order_addition_message_at] = wire[at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_record.direction = wire[at]; at = at + 1;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> order_addition_message_record.volume_int_324[order_addition_message_at] = wire[at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> order_addition_message_record.price[order_addition_message_at] = wire[at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 5 -> order_addition_message_record.participant[order_addition_message_at] = wire[at]; at = at + 1; order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Addition Message is what was written, byte for byte */
inline equal_order_addition_message(order_addition_message_read, order_addition_message_written) {
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> assert(order_addition_message_read.instrument_number[order_addition_message_at] == order_addition_message_written.instrument_number[order_addition_message_at]); order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> assert(order_addition_message_read.date_and_time[order_addition_message_at] == order_addition_message_written.date_and_time[order_addition_message_at]); order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> assert(order_addition_message_read.number[order_addition_message_at] == order_addition_message_written.number[order_addition_message_at]); order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  assert(order_addition_message_read.direction == order_addition_message_written.direction);
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 4 -> assert(order_addition_message_read.volume_int_324[order_addition_message_at] == order_addition_message_written.volume_int_324[order_addition_message_at]); order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 8 -> assert(order_addition_message_read.price[order_addition_message_at] == order_addition_message_written.price[order_addition_message_at]); order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  order_addition_message_at = 0;
  do
  :: order_addition_message_at < 5 -> assert(order_addition_message_read.participant[order_addition_message_at] == order_addition_message_written.participant[order_addition_message_at]); order_addition_message_at = order_addition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Of Orders Message: 32 bytes ----------------------------------- */

/* The message is disseminated at the time there is a matching or closing in BMV’s electronic system. */
typedef ExecutionOfOrdersMessage {
  byte instrument_number[4];
  byte date[8];
  byte number[4];
  byte volume_int_324[4];
  byte trade_number[4];
  byte execution_price[8]
};

int execution_of_orders_message_at;

/* every byte of Execution Of Orders Message set to one value */
inline fill_execution_of_orders_message(execution_of_orders_message_record, execution_of_orders_message_value) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.instrument_number[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.date[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.number[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.volume_int_324[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.trade_number[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.execution_price[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Of Orders Message set to where it lies, so a field read out of place says so */
inline ramp_execution_of_orders_message(execution_of_orders_message_record, execution_of_orders_message_base) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.instrument_number[execution_of_orders_message_at] = (execution_of_orders_message_base + 0 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.date[execution_of_orders_message_at] = (execution_of_orders_message_base + 4 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.number[execution_of_orders_message_at] = (execution_of_orders_message_base + 12 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.volume_int_324[execution_of_orders_message_at] = (execution_of_orders_message_base + 16 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.trade_number[execution_of_orders_message_at] = (execution_of_orders_message_base + 20 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.execution_price[execution_of_orders_message_at] = (execution_of_orders_message_base + 24 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Of Orders Message to the wire, 32 bytes from where the cursor stands */
inline encode_execution_of_orders_message(execution_of_orders_message_record) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.instrument_number[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> wire[at] = execution_of_orders_message_record.date[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.number[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.volume_int_324[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.trade_number[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> wire[at] = execution_of_orders_message_record.execution_price[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Of Orders Message off the wire, 32 bytes from where the cursor stands */
inline decode_execution_of_orders_message(execution_of_orders_message_record) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.instrument_number[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.date[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.number[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.volume_int_324[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.trade_number[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.execution_price[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Of Orders Message is what was written, byte for byte */
inline equal_execution_of_orders_message(execution_of_orders_message_read, execution_of_orders_message_written) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.instrument_number[execution_of_orders_message_at] == execution_of_orders_message_written.instrument_number[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> assert(execution_of_orders_message_read.date[execution_of_orders_message_at] == execution_of_orders_message_written.date[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.number[execution_of_orders_message_at] == execution_of_orders_message_written.number[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.volume_int_324[execution_of_orders_message_at] == execution_of_orders_message_written.volume_int_324[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.trade_number[execution_of_orders_message_at] == execution_of_orders_message_written.trade_number[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> assert(execution_of_orders_message_read.execution_price[execution_of_orders_message_at] == execution_of_orders_message_written.execution_price[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancellation Message: 16 bytes ------------------------------------ */

/* This message fully eliminates the order from the trading floor. */
typedef OrderCancellationMessage {
  byte instrument_number[4];
  byte date[8];
  byte number[4]
};

int order_cancellation_message_at;

/* every byte of Order Cancellation Message set to one value */
inline fill_order_cancellation_message(order_cancellation_message_record, order_cancellation_message_value) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.instrument_number[order_cancellation_message_at] = order_cancellation_message_value; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> order_cancellation_message_record.date[order_cancellation_message_at] = order_cancellation_message_value; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.number[order_cancellation_message_at] = order_cancellation_message_value; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation_message(order_cancellation_message_record, order_cancellation_message_base) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.instrument_number[order_cancellation_message_at] = (order_cancellation_message_base + 0 + order_cancellation_message_at + 1) % 256; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> order_cancellation_message_record.date[order_cancellation_message_at] = (order_cancellation_message_base + 4 + order_cancellation_message_at + 1) % 256; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.number[order_cancellation_message_at] = (order_cancellation_message_base + 12 + order_cancellation_message_at + 1) % 256; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Message to the wire, 16 bytes from where the cursor stands */
inline encode_order_cancellation_message(order_cancellation_message_record) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> wire[at] = order_cancellation_message_record.instrument_number[order_cancellation_message_at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> wire[at] = order_cancellation_message_record.date[order_cancellation_message_at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> wire[at] = order_cancellation_message_record.number[order_cancellation_message_at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Message off the wire, 16 bytes from where the cursor stands */
inline decode_order_cancellation_message(order_cancellation_message_record) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.instrument_number[order_cancellation_message_at] = wire[at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> order_cancellation_message_record.date[order_cancellation_message_at] = wire[at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.number[order_cancellation_message_at] = wire[at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancellation Message is what was written, byte for byte */
inline equal_order_cancellation_message(order_cancellation_message_read, order_cancellation_message_written) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> assert(order_cancellation_message_read.instrument_number[order_cancellation_message_at] == order_cancellation_message_written.instrument_number[order_cancellation_message_at]); order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> assert(order_cancellation_message_read.date[order_cancellation_message_at] == order_cancellation_message_written.date[order_cancellation_message_at]); order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> assert(order_cancellation_message_read.number[order_cancellation_message_at] == order_cancellation_message_written.number[order_cancellation_message_at]); order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Change Message: 41 bytes ------------------------------------------ */

/* Message sent when the order changes one of its data, the system allocates to it a new priority in the electronic book, the order to be replaced is identified with the original Instrument, Date and Number, the new allocation of priority in the electronic book appears in the New Date and Number fields. */
typedef OrderChangeMessage {
  byte instrument_number[4];
  byte original_date[8];
  byte original_number[4];
  byte new_date[8];
  byte new_number[4];
  byte direction;
  byte volume_int_324[4];
  byte price[8]
};

int order_change_message_at;

/* every byte of Order Change Message set to one value */
inline fill_order_change_message(order_change_message_record, order_change_message_value) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.instrument_number[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.original_date[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.original_number[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.new_date[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.new_number[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.direction = order_change_message_value;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.volume_int_324[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.price[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Change Message set to where it lies, so a field read out of place says so */
inline ramp_order_change_message(order_change_message_record, order_change_message_base) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.instrument_number[order_change_message_at] = (order_change_message_base + 0 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.original_date[order_change_message_at] = (order_change_message_base + 4 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.original_number[order_change_message_at] = (order_change_message_base + 12 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.new_date[order_change_message_at] = (order_change_message_base + 16 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.new_number[order_change_message_at] = (order_change_message_base + 24 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.direction = (order_change_message_base + 28 + 1) % 256;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.volume_int_324[order_change_message_at] = (order_change_message_base + 29 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.price[order_change_message_at] = (order_change_message_base + 33 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Change Message to the wire, 41 bytes from where the cursor stands */
inline encode_order_change_message(order_change_message_record) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.instrument_number[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> wire[at] = order_change_message_record.original_date[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.original_number[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> wire[at] = order_change_message_record.new_date[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.new_number[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  wire[at] = order_change_message_record.direction; at = at + 1;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.volume_int_324[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> wire[at] = order_change_message_record.price[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Change Message off the wire, 41 bytes from where the cursor stands */
inline decode_order_change_message(order_change_message_record) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.instrument_number[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.original_date[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.original_number[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.new_date[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.new_number[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.direction = wire[at]; at = at + 1;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.volume_int_324[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.price[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Change Message is what was written, byte for byte */
inline equal_order_change_message(order_change_message_read, order_change_message_written) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.instrument_number[order_change_message_at] == order_change_message_written.instrument_number[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> assert(order_change_message_read.original_date[order_change_message_at] == order_change_message_written.original_date[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.original_number[order_change_message_at] == order_change_message_written.original_number[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> assert(order_change_message_read.new_date[order_change_message_at] == order_change_message_written.new_date[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.new_number[order_change_message_at] == order_change_message_written.new_number[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  assert(order_change_message_read.direction == order_change_message_written.direction);
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.volume_int_324[order_change_message_at] == order_change_message_written.volume_int_324[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> assert(order_change_message_read.price[order_change_message_at] == order_change_message_written.price[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Offer Message: 18 bytes -------------------------------------------- */

/* Message sent by instrument when best offer changes in the electronic book. */
typedef BestOfferMessage {
  byte instrument_number[4];
  byte volume_int_324[4];
  byte price_rate[8];
  byte offer_direction;
  byte operation_type
};

int best_offer_message_at;

/* every byte of Best Offer Message set to one value */
inline fill_best_offer_message(best_offer_message_record, best_offer_message_value) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.instrument_number[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.volume_int_324[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.price_rate[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_record.offer_direction = best_offer_message_value;
  best_offer_message_record.operation_type = best_offer_message_value;
  skip
}

/* each byte of Best Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_offer_message(best_offer_message_record, best_offer_message_base) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.instrument_number[best_offer_message_at] = (best_offer_message_base + 0 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.volume_int_324[best_offer_message_at] = (best_offer_message_base + 4 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.price_rate[best_offer_message_at] = (best_offer_message_base + 8 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_record.offer_direction = (best_offer_message_base + 16 + 1) % 256;
  best_offer_message_record.operation_type = (best_offer_message_base + 17 + 1) % 256;
  skip
}

/* Best Offer Message to the wire, 18 bytes from where the cursor stands */
inline encode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> wire[at] = best_offer_message_record.instrument_number[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> wire[at] = best_offer_message_record.volume_int_324[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> wire[at] = best_offer_message_record.price_rate[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = best_offer_message_record.offer_direction; at = at + 1;
  wire[at] = best_offer_message_record.operation_type; at = at + 1;
  skip
}

/* Best Offer Message off the wire, 18 bytes from where the cursor stands */
inline decode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.instrument_number[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.volume_int_324[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.price_rate[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_record.offer_direction = wire[at]; at = at + 1;
  best_offer_message_record.operation_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Best Offer Message is what was written, byte for byte */
inline equal_best_offer_message(best_offer_message_read, best_offer_message_written) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> assert(best_offer_message_read.instrument_number[best_offer_message_at] == best_offer_message_written.instrument_number[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> assert(best_offer_message_read.volume_int_324[best_offer_message_at] == best_offer_message_written.volume_int_324[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> assert(best_offer_message_read.price_rate[best_offer_message_at] == best_offer_message_written.price_rate[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  assert(best_offer_message_read.offer_direction == best_offer_message_written.offer_direction);
  assert(best_offer_message_read.operation_type == best_offer_message_written.operation_type);
  skip
}

/* ---- Public Offerings Message: 66 bytes -------------------------------------- */

/* Trade from a Public offering. */
typedef PublicOfferingsMessage {
  byte instrument_number[4];
  byte number[4];
  byte volume_int_648[8];
  byte discount_rate_or_price[8];
  byte rate_of_return[4];
  byte term_days[2];
  byte currency_type;
  byte settlement;
  byte buy_alpha_5[5];
  byte sell_alpha_5[5];
  byte placement_date[8];
  byte issue_date[8];
  byte maturity_date[8]
};

int public_offerings_message_at;

/* every byte of Public Offerings Message set to one value */
inline fill_public_offerings_message(public_offerings_message_record, public_offerings_message_value) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.instrument_number[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.number[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.volume_int_648[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.discount_rate_or_price[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.rate_of_return[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> public_offerings_message_record.term_days[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_record.currency_type = public_offerings_message_value;
  public_offerings_message_record.settlement = public_offerings_message_value;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.buy_alpha_5[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.sell_alpha_5[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.placement_date[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.issue_date[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.maturity_date[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Public Offerings Message set to where it lies, so a field read out of place says so */
inline ramp_public_offerings_message(public_offerings_message_record, public_offerings_message_base) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.instrument_number[public_offerings_message_at] = (public_offerings_message_base + 0 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.number[public_offerings_message_at] = (public_offerings_message_base + 4 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.volume_int_648[public_offerings_message_at] = (public_offerings_message_base + 8 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.discount_rate_or_price[public_offerings_message_at] = (public_offerings_message_base + 16 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.rate_of_return[public_offerings_message_at] = (public_offerings_message_base + 24 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> public_offerings_message_record.term_days[public_offerings_message_at] = (public_offerings_message_base + 28 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_record.currency_type = (public_offerings_message_base + 30 + 1) % 256;
  public_offerings_message_record.settlement = (public_offerings_message_base + 31 + 1) % 256;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.buy_alpha_5[public_offerings_message_at] = (public_offerings_message_base + 32 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.sell_alpha_5[public_offerings_message_at] = (public_offerings_message_base + 37 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.placement_date[public_offerings_message_at] = (public_offerings_message_base + 42 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.issue_date[public_offerings_message_at] = (public_offerings_message_base + 50 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.maturity_date[public_offerings_message_at] = (public_offerings_message_base + 58 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* Public Offerings Message to the wire, 66 bytes from where the cursor stands */
inline encode_public_offerings_message(public_offerings_message_record) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> wire[at] = public_offerings_message_record.instrument_number[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> wire[at] = public_offerings_message_record.number[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.volume_int_648[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.discount_rate_or_price[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> wire[at] = public_offerings_message_record.rate_of_return[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> wire[at] = public_offerings_message_record.term_days[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  wire[at] = public_offerings_message_record.currency_type; at = at + 1;
  wire[at] = public_offerings_message_record.settlement; at = at + 1;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> wire[at] = public_offerings_message_record.buy_alpha_5[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> wire[at] = public_offerings_message_record.sell_alpha_5[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.placement_date[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.issue_date[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.maturity_date[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* Public Offerings Message off the wire, 66 bytes from where the cursor stands */
inline decode_public_offerings_message(public_offerings_message_record) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.instrument_number[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.number[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.volume_int_648[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.discount_rate_or_price[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.rate_of_return[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> public_offerings_message_record.term_days[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_record.currency_type = wire[at]; at = at + 1;
  public_offerings_message_record.settlement = wire[at]; at = at + 1;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.buy_alpha_5[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.sell_alpha_5[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.placement_date[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.issue_date[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.maturity_date[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Public Offerings Message is what was written, byte for byte */
inline equal_public_offerings_message(public_offerings_message_read, public_offerings_message_written) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> assert(public_offerings_message_read.instrument_number[public_offerings_message_at] == public_offerings_message_written.instrument_number[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> assert(public_offerings_message_read.number[public_offerings_message_at] == public_offerings_message_written.number[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.volume_int_648[public_offerings_message_at] == public_offerings_message_written.volume_int_648[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.discount_rate_or_price[public_offerings_message_at] == public_offerings_message_written.discount_rate_or_price[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> assert(public_offerings_message_read.rate_of_return[public_offerings_message_at] == public_offerings_message_written.rate_of_return[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> assert(public_offerings_message_read.term_days[public_offerings_message_at] == public_offerings_message_written.term_days[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  assert(public_offerings_message_read.currency_type == public_offerings_message_written.currency_type);
  assert(public_offerings_message_read.settlement == public_offerings_message_written.settlement);
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> assert(public_offerings_message_read.buy_alpha_5[public_offerings_message_at] == public_offerings_message_written.buy_alpha_5[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> assert(public_offerings_message_read.sell_alpha_5[public_offerings_message_at] == public_offerings_message_written.sell_alpha_5[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.placement_date[public_offerings_message_at] == public_offerings_message_written.placement_date[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.issue_date[public_offerings_message_at] == public_offerings_message_written.issue_date[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.maturity_date[public_offerings_message_at] == public_offerings_message_written.maturity_date[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 8 bytes ------------------------------------------ */

/* Open Interest */
typedef OpenInterestMessage {
  byte instrument_number[4];
  byte open_interest[4]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.instrument_number[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.instrument_number[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = (open_interest_message_base + 4 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 8 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.instrument_number[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.open_interest[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 8 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.instrument_number[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.instrument_number[open_interest_message_at] == open_interest_message_written.instrument_number[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.open_interest[open_interest_message_at] == open_interest_message_written.open_interest[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Derivatives Market Trades Message: 43 bytes ----------------------------- */

/* Contains information on any MexDer accepted transaction. */
typedef DerivativesMarketTradesMessage {
  byte instrument_number[4];
  byte trade_time[8];
  byte volume_int_324[4];
  byte price_rate[8];
  byte concertation_type;
  byte trade_number[4];
  byte operation_type;
  byte amount[8];
  byte parent_trade_number[4];
  byte leg_type
};

int derivatives_market_trades_message_at;

/* every byte of Derivatives Market Trades Message set to one value */
inline fill_derivatives_market_trades_message(derivatives_market_trades_message_record, derivatives_market_trades_message_value) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.volume_int_324[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.concertation_type = derivatives_market_trades_message_value;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.operation_type = derivatives_market_trades_message_value;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.leg_type = derivatives_market_trades_message_value;
  skip
}

/* each byte of Derivatives Market Trades Message set to where it lies, so a field read out of place says so */
inline ramp_derivatives_market_trades_message(derivatives_market_trades_message_record, derivatives_market_trades_message_base) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 0 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 4 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.volume_int_324[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 12 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 16 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.concertation_type = (derivatives_market_trades_message_base + 24 + 1) % 256;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 25 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.operation_type = (derivatives_market_trades_message_base + 29 + 1) % 256;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 30 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 38 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.leg_type = (derivatives_market_trades_message_base + 42 + 1) % 256;
  skip
}

/* Derivatives Market Trades Message to the wire, 43 bytes from where the cursor stands */
inline encode_derivatives_market_trades_message(derivatives_market_trades_message_record) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> wire[at] = derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.volume_int_324[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> wire[at] = derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = derivatives_market_trades_message_record.concertation_type; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = derivatives_market_trades_message_record.operation_type; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> wire[at] = derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = derivatives_market_trades_message_record.leg_type; at = at + 1;
  skip
}

/* Derivatives Market Trades Message off the wire, 43 bytes from where the cursor stands */
inline decode_derivatives_market_trades_message(derivatives_market_trades_message_record) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.volume_int_324[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.concertation_type = wire[at]; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.operation_type = wire[at]; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.leg_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Derivatives Market Trades Message is what was written, byte for byte */
inline equal_derivatives_market_trades_message(derivatives_market_trades_message_read, derivatives_market_trades_message_written) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.instrument_number[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.instrument_number[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> assert(derivatives_market_trades_message_read.trade_time[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.trade_time[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.volume_int_324[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.volume_int_324[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> assert(derivatives_market_trades_message_read.price_rate[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.price_rate[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  assert(derivatives_market_trades_message_read.concertation_type == derivatives_market_trades_message_written.concertation_type);
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.trade_number[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.trade_number[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  assert(derivatives_market_trades_message_read.operation_type == derivatives_market_trades_message_written.operation_type);
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> assert(derivatives_market_trades_message_read.amount[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.amount[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.parent_trade_number[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.parent_trade_number[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  assert(derivatives_market_trades_message_read.leg_type == derivatives_market_trades_message_written.leg_type);
  skip
}

/* ---- Statistics Of Instruments Message: 44 bytes ----------------------------- */

/* Update message from derivatives statistics sent each time there is an update on the trading floor at any level price. */
typedef StatisticsOfInstrumentsMessage {
  byte instrument_number[4];
  byte previous_settlement_price[8];
  byte opening_price[8];
  byte max_price_of_the_day[8];
  byte lower_price_of_the_day[8];
  byte last_price_of_the_day[8]
};

int statistics_of_instruments_message_at;

/* every byte of Statistics Of Instruments Message set to one value */
inline fill_statistics_of_instruments_message(statistics_of_instruments_message_record, statistics_of_instruments_message_value) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Of Instruments Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_of_instruments_message(statistics_of_instruments_message_record, statistics_of_instruments_message_base) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 0 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 4 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 12 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 20 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 28 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 36 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Of Instruments Message to the wire, 44 bytes from where the cursor stands */
inline encode_statistics_of_instruments_message(statistics_of_instruments_message_record) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> wire[at] = statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Of Instruments Message off the wire, 44 bytes from where the cursor stands */
inline decode_statistics_of_instruments_message(statistics_of_instruments_message_record) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Of Instruments Message is what was written, byte for byte */
inline equal_statistics_of_instruments_message(statistics_of_instruments_message_read, statistics_of_instruments_message_written) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> assert(statistics_of_instruments_message_read.instrument_number[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.instrument_number[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.previous_settlement_price[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.previous_settlement_price[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.opening_price[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.opening_price[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.max_price_of_the_day[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.max_price_of_the_day[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.lower_price_of_the_day[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.lower_price_of_the_day[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.last_price_of_the_day[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.last_price_of_the_day[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- General Indices Message: 33 bytes --------------------------------------- */

/* Information about the MSE Indices. */
typedef GeneralIndicesMessage {
  byte component[2];
  byte sector;
  byte indices_hour[8];
  byte volume_int_648[8];
  byte indices_price_44[4];
  byte variation[4];
  byte percentage[4];
  byte trend;
  byte indices_status
};

int general_indices_message_at;

/* every byte of General Indices Message set to one value */
inline fill_general_indices_message(general_indices_message_record, general_indices_message_value) {
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 2 -> general_indices_message_record.component[general_indices_message_at] = general_indices_message_value; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_record.sector = general_indices_message_value;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> general_indices_message_record.indices_hour[general_indices_message_at] = general_indices_message_value; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> general_indices_message_record.volume_int_648[general_indices_message_at] = general_indices_message_value; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.indices_price_44[general_indices_message_at] = general_indices_message_value; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.variation[general_indices_message_at] = general_indices_message_value; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.percentage[general_indices_message_at] = general_indices_message_value; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_record.trend = general_indices_message_value;
  general_indices_message_record.indices_status = general_indices_message_value;
  skip
}

/* each byte of General Indices Message set to where it lies, so a field read out of place says so */
inline ramp_general_indices_message(general_indices_message_record, general_indices_message_base) {
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 2 -> general_indices_message_record.component[general_indices_message_at] = (general_indices_message_base + 0 + general_indices_message_at + 1) % 256; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_record.sector = (general_indices_message_base + 2 + 1) % 256;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> general_indices_message_record.indices_hour[general_indices_message_at] = (general_indices_message_base + 3 + general_indices_message_at + 1) % 256; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> general_indices_message_record.volume_int_648[general_indices_message_at] = (general_indices_message_base + 11 + general_indices_message_at + 1) % 256; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.indices_price_44[general_indices_message_at] = (general_indices_message_base + 19 + general_indices_message_at + 1) % 256; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.variation[general_indices_message_at] = (general_indices_message_base + 23 + general_indices_message_at + 1) % 256; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.percentage[general_indices_message_at] = (general_indices_message_base + 27 + general_indices_message_at + 1) % 256; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_record.trend = (general_indices_message_base + 31 + 1) % 256;
  general_indices_message_record.indices_status = (general_indices_message_base + 32 + 1) % 256;
  skip
}

/* General Indices Message to the wire, 33 bytes from where the cursor stands */
inline encode_general_indices_message(general_indices_message_record) {
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 2 -> wire[at] = general_indices_message_record.component[general_indices_message_at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  wire[at] = general_indices_message_record.sector; at = at + 1;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> wire[at] = general_indices_message_record.indices_hour[general_indices_message_at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> wire[at] = general_indices_message_record.volume_int_648[general_indices_message_at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> wire[at] = general_indices_message_record.indices_price_44[general_indices_message_at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> wire[at] = general_indices_message_record.variation[general_indices_message_at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> wire[at] = general_indices_message_record.percentage[general_indices_message_at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  wire[at] = general_indices_message_record.trend; at = at + 1;
  wire[at] = general_indices_message_record.indices_status; at = at + 1;
  skip
}

/* General Indices Message off the wire, 33 bytes from where the cursor stands */
inline decode_general_indices_message(general_indices_message_record) {
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 2 -> general_indices_message_record.component[general_indices_message_at] = wire[at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_record.sector = wire[at]; at = at + 1;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> general_indices_message_record.indices_hour[general_indices_message_at] = wire[at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> general_indices_message_record.volume_int_648[general_indices_message_at] = wire[at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.indices_price_44[general_indices_message_at] = wire[at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.variation[general_indices_message_at] = wire[at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> general_indices_message_record.percentage[general_indices_message_at] = wire[at]; at = at + 1; general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_record.trend = wire[at]; at = at + 1;
  general_indices_message_record.indices_status = wire[at]; at = at + 1;
  skip
}

/* what was read of General Indices Message is what was written, byte for byte */
inline equal_general_indices_message(general_indices_message_read, general_indices_message_written) {
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 2 -> assert(general_indices_message_read.component[general_indices_message_at] == general_indices_message_written.component[general_indices_message_at]); general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  assert(general_indices_message_read.sector == general_indices_message_written.sector);
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> assert(general_indices_message_read.indices_hour[general_indices_message_at] == general_indices_message_written.indices_hour[general_indices_message_at]); general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 8 -> assert(general_indices_message_read.volume_int_648[general_indices_message_at] == general_indices_message_written.volume_int_648[general_indices_message_at]); general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> assert(general_indices_message_read.indices_price_44[general_indices_message_at] == general_indices_message_written.indices_price_44[general_indices_message_at]); general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> assert(general_indices_message_read.variation[general_indices_message_at] == general_indices_message_written.variation[general_indices_message_at]); general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  general_indices_message_at = 0;
  do
  :: general_indices_message_at < 4 -> assert(general_indices_message_read.percentage[general_indices_message_at] == general_indices_message_written.percentage[general_indices_message_at]); general_indices_message_at = general_indices_message_at + 1
  :: else -> break
  od;
  assert(general_indices_message_read.trend == general_indices_message_written.trend);
  assert(general_indices_message_read.indices_status == general_indices_message_written.indices_status);
  skip
}

/* ---- Indices Components Message: 57 bytes ------------------------------------ */

/* Indices components obtained during the day. */
typedef IndicesComponentsMessage {
  byte date[8];
  byte component[2];
  byte sector;
  byte type;
  byte issuer[7];
  byte series[6];
  byte indices_stocks[8];
  byte last_price[8];
  byte closing_price[8];
  byte influence[8]
};

int indices_components_message_at;

/* every byte of Indices Components Message set to one value */
inline fill_indices_components_message(indices_components_message_record, indices_components_message_value) {
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.date[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 2 -> indices_components_message_record.component[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_record.sector = indices_components_message_value;
  indices_components_message_record.type = indices_components_message_value;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 7 -> indices_components_message_record.issuer[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 6 -> indices_components_message_record.series[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.indices_stocks[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.last_price[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.closing_price[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.influence[indices_components_message_at] = indices_components_message_value; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indices Components Message set to where it lies, so a field read out of place says so */
inline ramp_indices_components_message(indices_components_message_record, indices_components_message_base) {
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.date[indices_components_message_at] = (indices_components_message_base + 0 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 2 -> indices_components_message_record.component[indices_components_message_at] = (indices_components_message_base + 8 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_record.sector = (indices_components_message_base + 10 + 1) % 256;
  indices_components_message_record.type = (indices_components_message_base + 11 + 1) % 256;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 7 -> indices_components_message_record.issuer[indices_components_message_at] = (indices_components_message_base + 12 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 6 -> indices_components_message_record.series[indices_components_message_at] = (indices_components_message_base + 19 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.indices_stocks[indices_components_message_at] = (indices_components_message_base + 25 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.last_price[indices_components_message_at] = (indices_components_message_base + 33 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.closing_price[indices_components_message_at] = (indices_components_message_base + 41 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.influence[indices_components_message_at] = (indices_components_message_base + 49 + indices_components_message_at + 1) % 256; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Components Message to the wire, 57 bytes from where the cursor stands */
inline encode_indices_components_message(indices_components_message_record) {
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> wire[at] = indices_components_message_record.date[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 2 -> wire[at] = indices_components_message_record.component[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  wire[at] = indices_components_message_record.sector; at = at + 1;
  wire[at] = indices_components_message_record.type; at = at + 1;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 7 -> wire[at] = indices_components_message_record.issuer[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 6 -> wire[at] = indices_components_message_record.series[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> wire[at] = indices_components_message_record.indices_stocks[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> wire[at] = indices_components_message_record.last_price[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> wire[at] = indices_components_message_record.closing_price[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> wire[at] = indices_components_message_record.influence[indices_components_message_at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indices Components Message off the wire, 57 bytes from where the cursor stands */
inline decode_indices_components_message(indices_components_message_record) {
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.date[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 2 -> indices_components_message_record.component[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_record.sector = wire[at]; at = at + 1;
  indices_components_message_record.type = wire[at]; at = at + 1;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 7 -> indices_components_message_record.issuer[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 6 -> indices_components_message_record.series[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.indices_stocks[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.last_price[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.closing_price[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> indices_components_message_record.influence[indices_components_message_at] = wire[at]; at = at + 1; indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indices Components Message is what was written, byte for byte */
inline equal_indices_components_message(indices_components_message_read, indices_components_message_written) {
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> assert(indices_components_message_read.date[indices_components_message_at] == indices_components_message_written.date[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 2 -> assert(indices_components_message_read.component[indices_components_message_at] == indices_components_message_written.component[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  assert(indices_components_message_read.sector == indices_components_message_written.sector);
  assert(indices_components_message_read.type == indices_components_message_written.type);
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 7 -> assert(indices_components_message_read.issuer[indices_components_message_at] == indices_components_message_written.issuer[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 6 -> assert(indices_components_message_read.series[indices_components_message_at] == indices_components_message_written.series[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> assert(indices_components_message_read.indices_stocks[indices_components_message_at] == indices_components_message_written.indices_stocks[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> assert(indices_components_message_read.last_price[indices_components_message_at] == indices_components_message_written.last_price[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> assert(indices_components_message_read.closing_price[indices_components_message_at] == indices_components_message_written.closing_price[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  indices_components_message_at = 0;
  do
  :: indices_components_message_at < 8 -> assert(indices_components_message_read.influence[indices_components_message_at] == indices_components_message_written.influence[indices_components_message_at]); indices_components_message_at = indices_components_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Inav Message: 12 bytes -------------------------------------------------- */

/* TRACS dissemination during continuous market trading hours. */
typedef InavMessage {
  byte trac_number[4];
  byte theoretical_current_price[8]
};

int inav_message_at;

/* every byte of Inav Message set to one value */
inline fill_inav_message(inav_message_record, inav_message_value) {
  inav_message_at = 0;
  do
  :: inav_message_at < 4 -> inav_message_record.trac_number[inav_message_at] = inav_message_value; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  inav_message_at = 0;
  do
  :: inav_message_at < 8 -> inav_message_record.theoretical_current_price[inav_message_at] = inav_message_value; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Inav Message set to where it lies, so a field read out of place says so */
inline ramp_inav_message(inav_message_record, inav_message_base) {
  inav_message_at = 0;
  do
  :: inav_message_at < 4 -> inav_message_record.trac_number[inav_message_at] = (inav_message_base + 0 + inav_message_at + 1) % 256; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  inav_message_at = 0;
  do
  :: inav_message_at < 8 -> inav_message_record.theoretical_current_price[inav_message_at] = (inav_message_base + 4 + inav_message_at + 1) % 256; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Inav Message to the wire, 12 bytes from where the cursor stands */
inline encode_inav_message(inav_message_record) {
  inav_message_at = 0;
  do
  :: inav_message_at < 4 -> wire[at] = inav_message_record.trac_number[inav_message_at]; at = at + 1; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  inav_message_at = 0;
  do
  :: inav_message_at < 8 -> wire[at] = inav_message_record.theoretical_current_price[inav_message_at]; at = at + 1; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Inav Message off the wire, 12 bytes from where the cursor stands */
inline decode_inav_message(inav_message_record) {
  inav_message_at = 0;
  do
  :: inav_message_at < 4 -> inav_message_record.trac_number[inav_message_at] = wire[at]; at = at + 1; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  inav_message_at = 0;
  do
  :: inav_message_at < 8 -> inav_message_record.theoretical_current_price[inav_message_at] = wire[at]; at = at + 1; inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Inav Message is what was written, byte for byte */
inline equal_inav_message(inav_message_read, inav_message_written) {
  inav_message_at = 0;
  do
  :: inav_message_at < 4 -> assert(inav_message_read.trac_number[inav_message_at] == inav_message_written.trac_number[inav_message_at]); inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  inav_message_at = 0;
  do
  :: inav_message_at < 8 -> assert(inav_message_read.theoretical_current_price[inav_message_at] == inav_message_written.theoretical_current_price[inav_message_at]); inav_message_at = inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dollar Buy Sell Message: 38 bytes --------------------------------------- */

/* Dollar Buy/Sell */
typedef DollarBuySellMessage {
  byte posture_date[8];
  byte currency[5];
  byte dollar_side;
  byte buy_precio_88[8];
  byte sell_precio_88[8];
  byte last_deal[8]
};

int dollar_buy_sell_message_at;

/* every byte of Dollar Buy Sell Message set to one value */
inline fill_dollar_buy_sell_message(dollar_buy_sell_message_record, dollar_buy_sell_message_value) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_record.dollar_side = dollar_buy_sell_message_value;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.buy_precio_88[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.sell_precio_88[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dollar Buy Sell Message set to where it lies, so a field read out of place says so */
inline ramp_dollar_buy_sell_message(dollar_buy_sell_message_record, dollar_buy_sell_message_base) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 0 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 8 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_record.dollar_side = (dollar_buy_sell_message_base + 13 + 1) % 256;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.buy_precio_88[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 14 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.sell_precio_88[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 22 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 30 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dollar Buy Sell Message to the wire, 38 bytes from where the cursor stands */
inline encode_dollar_buy_sell_message(dollar_buy_sell_message_record) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> wire[at] = dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  wire[at] = dollar_buy_sell_message_record.dollar_side; at = at + 1;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.buy_precio_88[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.sell_precio_88[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dollar Buy Sell Message off the wire, 38 bytes from where the cursor stands */
inline decode_dollar_buy_sell_message(dollar_buy_sell_message_record) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_record.dollar_side = wire[at]; at = at + 1;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.buy_precio_88[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.sell_precio_88[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dollar Buy Sell Message is what was written, byte for byte */
inline equal_dollar_buy_sell_message(dollar_buy_sell_message_read, dollar_buy_sell_message_written) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.posture_date[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.posture_date[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> assert(dollar_buy_sell_message_read.currency[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.currency[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  assert(dollar_buy_sell_message_read.dollar_side == dollar_buy_sell_message_written.dollar_side);
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.buy_precio_88[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.buy_precio_88[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.sell_precio_88[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.sell_precio_88[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.last_deal[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.last_deal[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Sales Balances Per Instrument Message: 44 bytes ------------------- */

/* Short sales balances per instrument */
typedef ShortSalesBalancesPerInstrumentMessage {
  byte instrument_number[4];
  byte date[8];
  byte previous_balance[8];
  byte amount_traded[8];
  byte buybacks[8];
  byte current_balance[8]
};

int short_sales_balances_per_instrument_message_at;

/* every byte of Short Sales Balances Per Instrument Message set to one value */
inline fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record, short_sales_balances_per_instrument_message_value) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Sales Balances Per Instrument Message set to where it lies, so a field read out of place says so */
inline ramp_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record, short_sales_balances_per_instrument_message_base) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 0 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 4 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 12 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 20 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 28 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 36 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Sales Balances Per Instrument Message to the wire, 44 bytes from where the cursor stands */
inline encode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> wire[at] = short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Sales Balances Per Instrument Message off the wire, 44 bytes from where the cursor stands */
inline decode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Sales Balances Per Instrument Message is what was written, byte for byte */
inline equal_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_read, short_sales_balances_per_instrument_message_written) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> assert(short_sales_balances_per_instrument_message_read.instrument_number[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.instrument_number[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.date[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.date[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.previous_balance[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.previous_balance[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.amount_traded[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.amount_traded[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.buybacks[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.buybacks[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.current_balance[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.current_balance[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Capital Market Multiples Message: 130 bytes ----------------------------- */

/* Capital Market Multiples */
typedef CapitalMarketMultiplesMessage {
  byte instrument_id[4];
  byte multiple_type;
  byte registry_number;
  byte sector;
  byte subsector;
  byte business_line;
  byte sub_line;
  byte pflepa_multiple[8];
  byte pfepa_multiple[8];
  byte ve_uaiida_multiple[8];
  byte p_u[8];
  byte p_vl[8];
  byte f_1_p_unoc[8];
  byte f_2_p_unoc[8];
  byte f_1_p_ue[8];
  byte f_2_p_ue[8];
  byte f_1_ve_uaiida[8];
  byte f_2_ve_uaiida[8];
  byte f_1_p_u[8];
  byte f_2_p_u[8];
  byte f_1_p_vl[8];
  byte f_2_p_vl[8]
};

int capital_market_multiples_message_at;

/* every byte of Capital Market Multiples Message set to one value */
inline fill_capital_market_multiples_message(capital_market_multiples_message_record, capital_market_multiples_message_value) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_record.multiple_type = capital_market_multiples_message_value;
  capital_market_multiples_message_record.registry_number = capital_market_multiples_message_value;
  capital_market_multiples_message_record.sector = capital_market_multiples_message_value;
  capital_market_multiples_message_record.subsector = capital_market_multiples_message_value;
  capital_market_multiples_message_record.business_line = capital_market_multiples_message_value;
  capital_market_multiples_message_record.sub_line = capital_market_multiples_message_value;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_u[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Capital Market Multiples Message set to where it lies, so a field read out of place says so */
inline ramp_capital_market_multiples_message(capital_market_multiples_message_record, capital_market_multiples_message_base) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 0 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_record.multiple_type = (capital_market_multiples_message_base + 4 + 1) % 256;
  capital_market_multiples_message_record.registry_number = (capital_market_multiples_message_base + 5 + 1) % 256;
  capital_market_multiples_message_record.sector = (capital_market_multiples_message_base + 6 + 1) % 256;
  capital_market_multiples_message_record.subsector = (capital_market_multiples_message_base + 7 + 1) % 256;
  capital_market_multiples_message_record.business_line = (capital_market_multiples_message_base + 8 + 1) % 256;
  capital_market_multiples_message_record.sub_line = (capital_market_multiples_message_base + 9 + 1) % 256;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 10 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 18 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 26 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_u[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 34 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 42 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 50 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 58 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 66 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 74 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 82 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 90 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 98 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 106 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 114 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 122 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capital Market Multiples Message to the wire, 130 bytes from where the cursor stands */
inline encode_capital_market_multiples_message(capital_market_multiples_message_record) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> wire[at] = capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_market_multiples_message_record.multiple_type; at = at + 1;
  wire[at] = capital_market_multiples_message_record.registry_number; at = at + 1;
  wire[at] = capital_market_multiples_message_record.sector; at = at + 1;
  wire[at] = capital_market_multiples_message_record.subsector; at = at + 1;
  wire[at] = capital_market_multiples_message_record.business_line; at = at + 1;
  wire[at] = capital_market_multiples_message_record.sub_line; at = at + 1;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.p_u[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capital Market Multiples Message off the wire, 130 bytes from where the cursor stands */
inline decode_capital_market_multiples_message(capital_market_multiples_message_record) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_record.multiple_type = wire[at]; at = at + 1;
  capital_market_multiples_message_record.registry_number = wire[at]; at = at + 1;
  capital_market_multiples_message_record.sector = wire[at]; at = at + 1;
  capital_market_multiples_message_record.subsector = wire[at]; at = at + 1;
  capital_market_multiples_message_record.business_line = wire[at]; at = at + 1;
  capital_market_multiples_message_record.sub_line = wire[at]; at = at + 1;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_u[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Capital Market Multiples Message is what was written, byte for byte */
inline equal_capital_market_multiples_message(capital_market_multiples_message_read, capital_market_multiples_message_written) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> assert(capital_market_multiples_message_read.instrument_id[capital_market_multiples_message_at] == capital_market_multiples_message_written.instrument_id[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  assert(capital_market_multiples_message_read.multiple_type == capital_market_multiples_message_written.multiple_type);
  assert(capital_market_multiples_message_read.registry_number == capital_market_multiples_message_written.registry_number);
  assert(capital_market_multiples_message_read.sector == capital_market_multiples_message_written.sector);
  assert(capital_market_multiples_message_read.subsector == capital_market_multiples_message_written.subsector);
  assert(capital_market_multiples_message_read.business_line == capital_market_multiples_message_written.business_line);
  assert(capital_market_multiples_message_read.sub_line == capital_market_multiples_message_written.sub_line);
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.pflepa_multiple[capital_market_multiples_message_at] == capital_market_multiples_message_written.pflepa_multiple[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.pfepa_multiple[capital_market_multiples_message_at] == capital_market_multiples_message_written.pfepa_multiple[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.ve_uaiida_multiple[capital_market_multiples_message_at] == capital_market_multiples_message_written.ve_uaiida_multiple[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.p_u[capital_market_multiples_message_at] == capital_market_multiples_message_written.p_u[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.p_vl[capital_market_multiples_message_at] == capital_market_multiples_message_written.p_vl[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_unoc[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_unoc[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_unoc[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_unoc[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_ue[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_ue[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_ue[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_ue[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_ve_uaiida[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_ve_uaiida[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_ve_uaiida[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_ve_uaiida[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_u[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_u[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_u[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_u[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_vl[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_vl[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_vl[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_vl[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Benchmark Message: 149 bytes -------------------------------------------- */

/* Benchmark */
typedef BenchmarkMessage {
  byte benchmark_name[40];
  byte benchmark_date[8];
  byte outstanding[8];
  byte integer_amount[8];
  byte decimal_amount[4];
  byte indices_precio_88[8];
  byte indices_24[8];
  byte rebalance;
  byte daily_performance[8];
  byte annual_performance[8];
  byte monthly_performance[8];
  byte last_12_months_performance[8];
  byte v24_hours_daily_performance[8];
  byte v24_hours_annual_performance[8];
  byte v24_hours_monthly_performance[8];
  byte last_12_months_24_hours_performance[8]
};

int benchmark_message_at;

/* every byte of Benchmark Message set to one value */
inline fill_benchmark_message(benchmark_message_record, benchmark_message_value) {
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 40 -> benchmark_message_record.benchmark_name[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.benchmark_date[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.outstanding[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.integer_amount[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 4 -> benchmark_message_record.decimal_amount[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.indices_precio_88[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.indices_24[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_record.rebalance = benchmark_message_value;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.daily_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.annual_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.monthly_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.last_12_months_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_daily_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_annual_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_monthly_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.last_12_months_24_hours_performance[benchmark_message_at] = benchmark_message_value; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Benchmark Message set to where it lies, so a field read out of place says so */
inline ramp_benchmark_message(benchmark_message_record, benchmark_message_base) {
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 40 -> benchmark_message_record.benchmark_name[benchmark_message_at] = (benchmark_message_base + 0 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.benchmark_date[benchmark_message_at] = (benchmark_message_base + 40 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.outstanding[benchmark_message_at] = (benchmark_message_base + 48 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.integer_amount[benchmark_message_at] = (benchmark_message_base + 56 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 4 -> benchmark_message_record.decimal_amount[benchmark_message_at] = (benchmark_message_base + 64 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.indices_precio_88[benchmark_message_at] = (benchmark_message_base + 68 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.indices_24[benchmark_message_at] = (benchmark_message_base + 76 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_record.rebalance = (benchmark_message_base + 84 + 1) % 256;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.daily_performance[benchmark_message_at] = (benchmark_message_base + 85 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.annual_performance[benchmark_message_at] = (benchmark_message_base + 93 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.monthly_performance[benchmark_message_at] = (benchmark_message_base + 101 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.last_12_months_performance[benchmark_message_at] = (benchmark_message_base + 109 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_daily_performance[benchmark_message_at] = (benchmark_message_base + 117 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_annual_performance[benchmark_message_at] = (benchmark_message_base + 125 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_monthly_performance[benchmark_message_at] = (benchmark_message_base + 133 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.last_12_months_24_hours_performance[benchmark_message_at] = (benchmark_message_base + 141 + benchmark_message_at + 1) % 256; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  skip
}

/* Benchmark Message to the wire, 149 bytes from where the cursor stands */
inline encode_benchmark_message(benchmark_message_record) {
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 40 -> wire[at] = benchmark_message_record.benchmark_name[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.benchmark_date[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.outstanding[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.integer_amount[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 4 -> wire[at] = benchmark_message_record.decimal_amount[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.indices_precio_88[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.indices_24[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  wire[at] = benchmark_message_record.rebalance; at = at + 1;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.daily_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.annual_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.monthly_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.last_12_months_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.v24_hours_daily_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.v24_hours_annual_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.v24_hours_monthly_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> wire[at] = benchmark_message_record.last_12_months_24_hours_performance[benchmark_message_at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  skip
}

/* Benchmark Message off the wire, 149 bytes from where the cursor stands */
inline decode_benchmark_message(benchmark_message_record) {
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 40 -> benchmark_message_record.benchmark_name[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.benchmark_date[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.outstanding[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.integer_amount[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 4 -> benchmark_message_record.decimal_amount[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.indices_precio_88[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.indices_24[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_record.rebalance = wire[at]; at = at + 1;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.daily_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.annual_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.monthly_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.last_12_months_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_daily_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_annual_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.v24_hours_monthly_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> benchmark_message_record.last_12_months_24_hours_performance[benchmark_message_at] = wire[at]; at = at + 1; benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Benchmark Message is what was written, byte for byte */
inline equal_benchmark_message(benchmark_message_read, benchmark_message_written) {
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 40 -> assert(benchmark_message_read.benchmark_name[benchmark_message_at] == benchmark_message_written.benchmark_name[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.benchmark_date[benchmark_message_at] == benchmark_message_written.benchmark_date[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.outstanding[benchmark_message_at] == benchmark_message_written.outstanding[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.integer_amount[benchmark_message_at] == benchmark_message_written.integer_amount[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 4 -> assert(benchmark_message_read.decimal_amount[benchmark_message_at] == benchmark_message_written.decimal_amount[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.indices_precio_88[benchmark_message_at] == benchmark_message_written.indices_precio_88[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.indices_24[benchmark_message_at] == benchmark_message_written.indices_24[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  assert(benchmark_message_read.rebalance == benchmark_message_written.rebalance);
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.daily_performance[benchmark_message_at] == benchmark_message_written.daily_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.annual_performance[benchmark_message_at] == benchmark_message_written.annual_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.monthly_performance[benchmark_message_at] == benchmark_message_written.monthly_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.last_12_months_performance[benchmark_message_at] == benchmark_message_written.last_12_months_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.v24_hours_daily_performance[benchmark_message_at] == benchmark_message_written.v24_hours_daily_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.v24_hours_annual_performance[benchmark_message_at] == benchmark_message_written.v24_hours_annual_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.v24_hours_monthly_performance[benchmark_message_at] == benchmark_message_written.v24_hours_monthly_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  benchmark_message_at = 0;
  do
  :: benchmark_message_at < 8 -> assert(benchmark_message_read.last_12_months_24_hours_performance[benchmark_message_at] == benchmark_message_written.last_12_months_24_hours_performance[benchmark_message_at]); benchmark_message_at = benchmark_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Capitalization Rules Message: 39 bytes ---------------------------------- */

/* Capitalization Rules */
typedef CapitalizationRulesMessage {
  byte instrument_number[4];
  byte date_indicators[8];
  byte bursatility_indices[4];
  byte bursatility_indices_sign;
  byte beta_coefficient[8];
  byte beta_coefficient_sign;
  byte correlation_coefficient[8];
  byte correlation_coefficient_sign;
  byte delta_difference[4]
};

int capitalization_rules_message_at;

/* every byte of Capitalization Rules Message set to one value */
inline fill_capitalization_rules_message(capitalization_rules_message_record, capitalization_rules_message_value) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.instrument_number[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.date_indicators[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.bursatility_indices_sign = capitalization_rules_message_value;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.beta_coefficient_sign = capitalization_rules_message_value;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.correlation_coefficient_sign = capitalization_rules_message_value;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.delta_difference[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Capitalization Rules Message set to where it lies, so a field read out of place says so */
inline ramp_capitalization_rules_message(capitalization_rules_message_record, capitalization_rules_message_base) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.instrument_number[capitalization_rules_message_at] = (capitalization_rules_message_base + 0 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.date_indicators[capitalization_rules_message_at] = (capitalization_rules_message_base + 4 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at] = (capitalization_rules_message_base + 12 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.bursatility_indices_sign = (capitalization_rules_message_base + 16 + 1) % 256;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at] = (capitalization_rules_message_base + 17 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.beta_coefficient_sign = (capitalization_rules_message_base + 25 + 1) % 256;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at] = (capitalization_rules_message_base + 26 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.correlation_coefficient_sign = (capitalization_rules_message_base + 34 + 1) % 256;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.delta_difference[capitalization_rules_message_at] = (capitalization_rules_message_base + 35 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capitalization Rules Message to the wire, 39 bytes from where the cursor stands */
inline encode_capitalization_rules_message(capitalization_rules_message_record) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> wire[at] = capitalization_rules_message_record.instrument_number[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> wire[at] = capitalization_rules_message_record.date_indicators[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> wire[at] = capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  wire[at] = capitalization_rules_message_record.bursatility_indices_sign; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> wire[at] = capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  wire[at] = capitalization_rules_message_record.beta_coefficient_sign; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> wire[at] = capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  wire[at] = capitalization_rules_message_record.correlation_coefficient_sign; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> wire[at] = capitalization_rules_message_record.delta_difference[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capitalization Rules Message off the wire, 39 bytes from where the cursor stands */
inline decode_capitalization_rules_message(capitalization_rules_message_record) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.instrument_number[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.date_indicators[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.bursatility_indices_sign = wire[at]; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.beta_coefficient_sign = wire[at]; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.correlation_coefficient_sign = wire[at]; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.delta_difference[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Capitalization Rules Message is what was written, byte for byte */
inline equal_capitalization_rules_message(capitalization_rules_message_read, capitalization_rules_message_written) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> assert(capitalization_rules_message_read.instrument_number[capitalization_rules_message_at] == capitalization_rules_message_written.instrument_number[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> assert(capitalization_rules_message_read.date_indicators[capitalization_rules_message_at] == capitalization_rules_message_written.date_indicators[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> assert(capitalization_rules_message_read.bursatility_indices[capitalization_rules_message_at] == capitalization_rules_message_written.bursatility_indices[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  assert(capitalization_rules_message_read.bursatility_indices_sign == capitalization_rules_message_written.bursatility_indices_sign);
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> assert(capitalization_rules_message_read.beta_coefficient[capitalization_rules_message_at] == capitalization_rules_message_written.beta_coefficient[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  assert(capitalization_rules_message_read.beta_coefficient_sign == capitalization_rules_message_written.beta_coefficient_sign);
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> assert(capitalization_rules_message_read.correlation_coefficient[capitalization_rules_message_at] == capitalization_rules_message_written.correlation_coefficient[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  assert(capitalization_rules_message_read.correlation_coefficient_sign == capitalization_rules_message_written.correlation_coefficient_sign);
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> assert(capitalization_rules_message_read.delta_difference[capitalization_rules_message_at] == capitalization_rules_message_written.delta_difference[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Closing Price Origin Message: 13 bytes ---------------------------------- */

/* Closing price origin */
typedef ClosingPriceOriginMessage {
  byte instrument_number[4];
  byte origin_price[8];
  byte sending
};

int closing_price_origin_message_at;

/* every byte of Closing Price Origin Message set to one value */
inline fill_closing_price_origin_message(closing_price_origin_message_record, closing_price_origin_message_value) {
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 4 -> closing_price_origin_message_record.instrument_number[closing_price_origin_message_at] = closing_price_origin_message_value; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 8 -> closing_price_origin_message_record.origin_price[closing_price_origin_message_at] = closing_price_origin_message_value; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_record.sending = closing_price_origin_message_value;
  skip
}

/* each byte of Closing Price Origin Message set to where it lies, so a field read out of place says so */
inline ramp_closing_price_origin_message(closing_price_origin_message_record, closing_price_origin_message_base) {
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 4 -> closing_price_origin_message_record.instrument_number[closing_price_origin_message_at] = (closing_price_origin_message_base + 0 + closing_price_origin_message_at + 1) % 256; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 8 -> closing_price_origin_message_record.origin_price[closing_price_origin_message_at] = (closing_price_origin_message_base + 4 + closing_price_origin_message_at + 1) % 256; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_record.sending = (closing_price_origin_message_base + 12 + 1) % 256;
  skip
}

/* Closing Price Origin Message to the wire, 13 bytes from where the cursor stands */
inline encode_closing_price_origin_message(closing_price_origin_message_record) {
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 4 -> wire[at] = closing_price_origin_message_record.instrument_number[closing_price_origin_message_at]; at = at + 1; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 8 -> wire[at] = closing_price_origin_message_record.origin_price[closing_price_origin_message_at]; at = at + 1; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  wire[at] = closing_price_origin_message_record.sending; at = at + 1;
  skip
}

/* Closing Price Origin Message off the wire, 13 bytes from where the cursor stands */
inline decode_closing_price_origin_message(closing_price_origin_message_record) {
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 4 -> closing_price_origin_message_record.instrument_number[closing_price_origin_message_at] = wire[at]; at = at + 1; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 8 -> closing_price_origin_message_record.origin_price[closing_price_origin_message_at] = wire[at]; at = at + 1; closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_record.sending = wire[at]; at = at + 1;
  skip
}

/* what was read of Closing Price Origin Message is what was written, byte for byte */
inline equal_closing_price_origin_message(closing_price_origin_message_read, closing_price_origin_message_written) {
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 4 -> assert(closing_price_origin_message_read.instrument_number[closing_price_origin_message_at] == closing_price_origin_message_written.instrument_number[closing_price_origin_message_at]); closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  closing_price_origin_message_at = 0;
  do
  :: closing_price_origin_message_at < 8 -> assert(closing_price_origin_message_read.origin_price[closing_price_origin_message_at] == closing_price_origin_message_written.origin_price[closing_price_origin_message_at]); closing_price_origin_message_at = closing_price_origin_message_at + 1
  :: else -> break
  od;
  assert(closing_price_origin_message_read.sending == closing_price_origin_message_written.sending);
  skip
}

/* ---- Mutual Funds Trades Message: 53 bytes ----------------------------------- */

/* Any transaction made in mutual funds is reported. */
typedef MutualFundsTradesMessage {
  byte instrument_number[4];
  byte origin;
  byte date_of_the_trade[8];
  byte price[8];
  byte book_value[8];
  byte number_of_sales_trades[4];
  byte sales_volume[8];
  byte number_of_purchase_trades[4];
  byte purchase_volume[8]
};

int mutual_funds_trades_message_at;

/* every byte of Mutual Funds Trades Message set to one value */
inline fill_mutual_funds_trades_message(mutual_funds_trades_message_record, mutual_funds_trades_message_value) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_record.origin = mutual_funds_trades_message_value;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.price[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mutual Funds Trades Message set to where it lies, so a field read out of place says so */
inline ramp_mutual_funds_trades_message(mutual_funds_trades_message_record, mutual_funds_trades_message_base) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 0 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_record.origin = (mutual_funds_trades_message_base + 4 + 1) % 256;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 5 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.price[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 13 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 21 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 29 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 33 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 41 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 45 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Funds Trades Message to the wire, 53 bytes from where the cursor stands */
inline encode_mutual_funds_trades_message(mutual_funds_trades_message_record) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> wire[at] = mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = mutual_funds_trades_message_record.origin; at = at + 1;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.price[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> wire[at] = mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> wire[at] = mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Funds Trades Message off the wire, 53 bytes from where the cursor stands */
inline decode_mutual_funds_trades_message(mutual_funds_trades_message_record) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_record.origin = wire[at]; at = at + 1;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.price[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mutual Funds Trades Message is what was written, byte for byte */
inline equal_mutual_funds_trades_message(mutual_funds_trades_message_read, mutual_funds_trades_message_written) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> assert(mutual_funds_trades_message_read.instrument_number[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.instrument_number[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  assert(mutual_funds_trades_message_read.origin == mutual_funds_trades_message_written.origin);
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.date_of_the_trade[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.date_of_the_trade[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.price[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.price[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.book_value[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.book_value[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> assert(mutual_funds_trades_message_read.number_of_sales_trades[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.number_of_sales_trades[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.sales_volume[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.sales_volume[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> assert(mutual_funds_trades_message_read.number_of_purchase_trades[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.number_of_purchase_trades[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.purchase_volume[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.purchase_volume[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Opening Of Continuous Auctions Message: 21 bytes ------------------------ */

/* The message is sent when one of the ongoing, volatility or SIC bidding sessions is generated. */
typedef OpeningOfContinuousAuctionsMessage {
  byte instrument_number[4];
  byte origin;
  byte auction_session_startup_time[8];
  byte auction_session_end_time[8]
};

int opening_of_continuous_auctions_message_at;

/* every byte of Opening Of Continuous Auctions Message set to one value */
inline fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record, opening_of_continuous_auctions_message_value) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at] = opening_of_continuous_auctions_message_value; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_record.origin = opening_of_continuous_auctions_message_value;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at] = opening_of_continuous_auctions_message_value; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at] = opening_of_continuous_auctions_message_value; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Of Continuous Auctions Message set to where it lies, so a field read out of place says so */
inline ramp_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record, opening_of_continuous_auctions_message_base) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at] = (opening_of_continuous_auctions_message_base + 0 + opening_of_continuous_auctions_message_at + 1) % 256; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_record.origin = (opening_of_continuous_auctions_message_base + 4 + 1) % 256;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at] = (opening_of_continuous_auctions_message_base + 5 + opening_of_continuous_auctions_message_at + 1) % 256; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at] = (opening_of_continuous_auctions_message_base + 13 + opening_of_continuous_auctions_message_at + 1) % 256; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Of Continuous Auctions Message to the wire, 21 bytes from where the cursor stands */
inline encode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> wire[at] = opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_of_continuous_auctions_message_record.origin; at = at + 1;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> wire[at] = opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> wire[at] = opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Of Continuous Auctions Message off the wire, 21 bytes from where the cursor stands */
inline decode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at] = wire[at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_record.origin = wire[at]; at = at + 1;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at] = wire[at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at] = wire[at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Of Continuous Auctions Message is what was written, byte for byte */
inline equal_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_read, opening_of_continuous_auctions_message_written) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> assert(opening_of_continuous_auctions_message_read.instrument_number[opening_of_continuous_auctions_message_at] == opening_of_continuous_auctions_message_written.instrument_number[opening_of_continuous_auctions_message_at]); opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  assert(opening_of_continuous_auctions_message_read.origin == opening_of_continuous_auctions_message_written.origin);
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> assert(opening_of_continuous_auctions_message_read.auction_session_startup_time[opening_of_continuous_auctions_message_at] == opening_of_continuous_auctions_message_written.auction_session_startup_time[opening_of_continuous_auctions_message_at]); opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> assert(opening_of_continuous_auctions_message_read.auction_session_end_time[opening_of_continuous_auctions_message_at] == opening_of_continuous_auctions_message_written.auction_session_end_time[opening_of_continuous_auctions_message_at]); opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Existence Of Bids At Mid Price Message: 6 bytes ------------------------- */

/* This message is generated when an instrument enters a bid in the hidden electronic book At Mean Price. */
typedef ExistenceOfBidsAtMidPriceMessage {
  byte instrument_number[4];
  byte origin;
  byte bids_existing
};

int existence_of_bids_at_mid_price_message_at;

/* every byte of Existence Of Bids At Mid Price Message set to one value */
inline fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record, existence_of_bids_at_mid_price_message_value) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at] = existence_of_bids_at_mid_price_message_value; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  existence_of_bids_at_mid_price_message_record.origin = existence_of_bids_at_mid_price_message_value;
  existence_of_bids_at_mid_price_message_record.bids_existing = existence_of_bids_at_mid_price_message_value;
  skip
}

/* each byte of Existence Of Bids At Mid Price Message set to where it lies, so a field read out of place says so */
inline ramp_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record, existence_of_bids_at_mid_price_message_base) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at] = (existence_of_bids_at_mid_price_message_base + 0 + existence_of_bids_at_mid_price_message_at + 1) % 256; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  existence_of_bids_at_mid_price_message_record.origin = (existence_of_bids_at_mid_price_message_base + 4 + 1) % 256;
  existence_of_bids_at_mid_price_message_record.bids_existing = (existence_of_bids_at_mid_price_message_base + 5 + 1) % 256;
  skip
}

/* Existence Of Bids At Mid Price Message to the wire, 6 bytes from where the cursor stands */
inline encode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> wire[at] = existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at]; at = at + 1; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  wire[at] = existence_of_bids_at_mid_price_message_record.origin; at = at + 1;
  wire[at] = existence_of_bids_at_mid_price_message_record.bids_existing; at = at + 1;
  skip
}

/* Existence Of Bids At Mid Price Message off the wire, 6 bytes from where the cursor stands */
inline decode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at] = wire[at]; at = at + 1; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  existence_of_bids_at_mid_price_message_record.origin = wire[at]; at = at + 1;
  existence_of_bids_at_mid_price_message_record.bids_existing = wire[at]; at = at + 1;
  skip
}

/* what was read of Existence Of Bids At Mid Price Message is what was written, byte for byte */
inline equal_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_read, existence_of_bids_at_mid_price_message_written) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> assert(existence_of_bids_at_mid_price_message_read.instrument_number[existence_of_bids_at_mid_price_message_at] == existence_of_bids_at_mid_price_message_written.instrument_number[existence_of_bids_at_mid_price_message_at]); existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  assert(existence_of_bids_at_mid_price_message_read.origin == existence_of_bids_at_mid_price_message_written.origin);
  assert(existence_of_bids_at_mid_price_message_read.bids_existing == existence_of_bids_at_mid_price_message_written.bids_existing);
  skip
}

/* ---- Catalogue Of Debt And Metals Instruments Message: 103 bytes ------------- */

/* Catalogue sent for instruments pertaining to the Local Fixed rate, Global Fixed rate and metals markets. */
typedef CatalogueOfDebtAndMetalsInstrumentsMessage {
  byte number_of_the_instrument[4];
  byte origin;
  byte type_of_value[2];
  byte issuing_company[7];
  byte issuance[6];
  byte date_of_issuance[8];
  byte date_of_maturity[8];
  byte price_rate_of_reference[8];
  byte date_of_reference[8];
  byte reference;
  byte term_days[2];
  byte coupon_period[2];
  byte isin[12];
  byte market;
  byte current_nominal_value[8];
  byte original_nominal_value[8];
  byte outstanding_shares[8];
  byte amount_placed[8];
  byte trades_rate_price
};

int catalogue_of_debt_and_metals_instruments_message_at;

/* every byte of Catalogue Of Debt And Metals Instruments Message set to one value */
inline fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record, catalogue_of_debt_and_metals_instruments_message_value) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.origin = catalogue_of_debt_and_metals_instruments_message_value;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.reference = catalogue_of_debt_and_metals_instruments_message_value;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.market = catalogue_of_debt_and_metals_instruments_message_value;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price = catalogue_of_debt_and_metals_instruments_message_value;
  skip
}

/* each byte of Catalogue Of Debt And Metals Instruments Message set to where it lies, so a field read out of place says so */
inline ramp_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record, catalogue_of_debt_and_metals_instruments_message_base) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 0 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.origin = (catalogue_of_debt_and_metals_instruments_message_base + 4 + 1) % 256;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 5 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 7 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 14 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 20 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 28 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 36 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 44 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.reference = (catalogue_of_debt_and_metals_instruments_message_base + 52 + 1) % 256;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 53 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 55 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 57 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.market = (catalogue_of_debt_and_metals_instruments_message_base + 69 + 1) % 256;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 70 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 78 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 86 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 94 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price = (catalogue_of_debt_and_metals_instruments_message_base + 102 + 1) % 256;
  skip
}

/* Catalogue Of Debt And Metals Instruments Message to the wire, 103 bytes from where the cursor stands */
inline encode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.origin; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.reference; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.market; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price; at = at + 1;
  skip
}

/* Catalogue Of Debt And Metals Instruments Message off the wire, 103 bytes from where the cursor stands */
inline decode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.origin = wire[at]; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.reference = wire[at]; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.market = wire[at]; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price = wire[at]; at = at + 1;
  skip
}

/* what was read of Catalogue Of Debt And Metals Instruments Message is what was written, byte for byte */
inline equal_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_read, catalogue_of_debt_and_metals_instruments_message_written) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> assert(catalogue_of_debt_and_metals_instruments_message_read.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.origin == catalogue_of_debt_and_metals_instruments_message_written.origin);
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> assert(catalogue_of_debt_and_metals_instruments_message_read.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.type_of_value[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> assert(catalogue_of_debt_and_metals_instruments_message_read.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.issuing_company[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> assert(catalogue_of_debt_and_metals_instruments_message_read.issuance[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.issuance[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.reference == catalogue_of_debt_and_metals_instruments_message_written.reference);
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> assert(catalogue_of_debt_and_metals_instruments_message_read.term_days[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.term_days[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> assert(catalogue_of_debt_and_metals_instruments_message_read.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.coupon_period[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> assert(catalogue_of_debt_and_metals_instruments_message_read.isin[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.isin[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.market == catalogue_of_debt_and_metals_instruments_message_written.market);
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.amount_placed[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.trades_rate_price == catalogue_of_debt_and_metals_instruments_message_written.trades_rate_price);
  skip
}

/* ---- Catalog Sent For Instruments Belonging To Mutual Funds Message: 78 bytes ---- */

/* Catalogue sent for instrument pertaining to the investment companies. */
typedef CatalogSentForInstrumentsBelongingToMutualFundsMessage {
  byte number_of_the_instrument[4];
  byte origin;
  byte type_of_value[2];
  byte issuing_company[7];
  byte series[6];
  byte sector;
  byte subsector;
  byte industry;
  byte sub_industry;
  byte trading_company[10];
  byte reference_price[8];
  byte reference_date[8];
  byte reference;
  byte isin[12];
  byte rating[15]
};

int catalog_sent_for_instruments_belonging_to_mutual_funds_message_at;

/* every byte of Catalog Sent For Instruments Belonging To Mutual Funds Message set to one value */
inline fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record, catalog_sent_for_instruments_belonging_to_mutual_funds_message_value) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog Sent For Instruments Belonging To Mutual Funds Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record, catalog_sent_for_instruments_belonging_to_mutual_funds_message_base) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 0 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 4 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 5 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 7 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 14 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 20 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 21 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 22 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 23 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 24 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 34 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 42 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 50 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 51 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 63 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message to the wire, 78 bytes from where the cursor stands */
inline encode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message off the wire, 78 bytes from where the cursor stands */
inline decode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog Sent For Instruments Belonging To Mutual Funds Message is what was written, byte for byte */
inline equal_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read, catalog_sent_for_instruments_belonging_to_mutual_funds_message_written) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.origin == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.origin);
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.sector == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.sector);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.subsector == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.subsector);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.industry == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.industry);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.sub_industry == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.sub_industry);
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.reference == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.reference);
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Weighted Average Price Message: 21 bytes -------------------------------- */

/* This message will have the weighted average price (WAP) per instrument and is sent for each transaction generated within the calculation period of the WAP (last 20 minutes of the trading session); when there are no more trades in this period, the message is sent with the Weighted Average Price in zeros. */
typedef WeightedAveragePriceMessage {
  byte instrument_number[4];
  byte origin;
  byte weighted_average_price[8];
  byte volatility[8]
};

int weighted_average_price_message_at;

/* every byte of Weighted Average Price Message set to one value */
inline fill_weighted_average_price_message(weighted_average_price_message_record, weighted_average_price_message_value) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> weighted_average_price_message_record.instrument_number[weighted_average_price_message_at] = weighted_average_price_message_value; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_record.origin = weighted_average_price_message_value;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at] = weighted_average_price_message_value; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.volatility[weighted_average_price_message_at] = weighted_average_price_message_value; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Weighted Average Price Message set to where it lies, so a field read out of place says so */
inline ramp_weighted_average_price_message(weighted_average_price_message_record, weighted_average_price_message_base) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> weighted_average_price_message_record.instrument_number[weighted_average_price_message_at] = (weighted_average_price_message_base + 0 + weighted_average_price_message_at + 1) % 256; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_record.origin = (weighted_average_price_message_base + 4 + 1) % 256;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at] = (weighted_average_price_message_base + 5 + weighted_average_price_message_at + 1) % 256; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.volatility[weighted_average_price_message_at] = (weighted_average_price_message_base + 13 + weighted_average_price_message_at + 1) % 256; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Message to the wire, 21 bytes from where the cursor stands */
inline encode_weighted_average_price_message(weighted_average_price_message_record) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> wire[at] = weighted_average_price_message_record.instrument_number[weighted_average_price_message_at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  wire[at] = weighted_average_price_message_record.origin; at = at + 1;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> wire[at] = weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> wire[at] = weighted_average_price_message_record.volatility[weighted_average_price_message_at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Message off the wire, 21 bytes from where the cursor stands */
inline decode_weighted_average_price_message(weighted_average_price_message_record) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> weighted_average_price_message_record.instrument_number[weighted_average_price_message_at] = wire[at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_record.origin = wire[at]; at = at + 1;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at] = wire[at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.volatility[weighted_average_price_message_at] = wire[at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Weighted Average Price Message is what was written, byte for byte */
inline equal_weighted_average_price_message(weighted_average_price_message_read, weighted_average_price_message_written) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> assert(weighted_average_price_message_read.instrument_number[weighted_average_price_message_at] == weighted_average_price_message_written.instrument_number[weighted_average_price_message_at]); weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  assert(weighted_average_price_message_read.origin == weighted_average_price_message_written.origin);
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> assert(weighted_average_price_message_read.weighted_average_price[weighted_average_price_message_at] == weighted_average_price_message_written.weighted_average_price[weighted_average_price_message_at]); weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> assert(weighted_average_price_message_read.volatility[weighted_average_price_message_at] == weighted_average_price_message_written.volatility[weighted_average_price_message_at]); weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Events Message: 31 bytes ----------------------------------------- */

/* The system events message is used to inform that an event has taken place, which needs to be disclosed to the public for its attention. */
typedef SystemEventsMessage {
  byte instrument_number[4];
  byte origin;
  byte code_of_event;
  byte market;
  byte send_time[8];
  byte end_time[8];
  byte group[8]
};

int system_events_message_at;

/* every byte of System Events Message set to one value */
inline fill_system_events_message(system_events_message_record, system_events_message_value) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> system_events_message_record.instrument_number[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_record.origin = system_events_message_value;
  system_events_message_record.code_of_event = system_events_message_value;
  system_events_message_record.market = system_events_message_value;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.send_time[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.end_time[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.group[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Events Message set to where it lies, so a field read out of place says so */
inline ramp_system_events_message(system_events_message_record, system_events_message_base) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> system_events_message_record.instrument_number[system_events_message_at] = (system_events_message_base + 0 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_record.origin = (system_events_message_base + 4 + 1) % 256;
  system_events_message_record.code_of_event = (system_events_message_base + 5 + 1) % 256;
  system_events_message_record.market = (system_events_message_base + 6 + 1) % 256;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.send_time[system_events_message_at] = (system_events_message_base + 7 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.end_time[system_events_message_at] = (system_events_message_base + 15 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.group[system_events_message_at] = (system_events_message_base + 23 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Events Message to the wire, 31 bytes from where the cursor stands */
inline encode_system_events_message(system_events_message_record) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> wire[at] = system_events_message_record.instrument_number[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  wire[at] = system_events_message_record.origin; at = at + 1;
  wire[at] = system_events_message_record.code_of_event; at = at + 1;
  wire[at] = system_events_message_record.market; at = at + 1;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> wire[at] = system_events_message_record.send_time[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> wire[at] = system_events_message_record.end_time[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> wire[at] = system_events_message_record.group[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Events Message off the wire, 31 bytes from where the cursor stands */
inline decode_system_events_message(system_events_message_record) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> system_events_message_record.instrument_number[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_record.origin = wire[at]; at = at + 1;
  system_events_message_record.code_of_event = wire[at]; at = at + 1;
  system_events_message_record.market = wire[at]; at = at + 1;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.send_time[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.end_time[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.group[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Events Message is what was written, byte for byte */
inline equal_system_events_message(system_events_message_read, system_events_message_written) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> assert(system_events_message_read.instrument_number[system_events_message_at] == system_events_message_written.instrument_number[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  assert(system_events_message_read.origin == system_events_message_written.origin);
  assert(system_events_message_read.code_of_event == system_events_message_written.code_of_event);
  assert(system_events_message_read.market == system_events_message_written.market);
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> assert(system_events_message_read.send_time[system_events_message_at] == system_events_message_written.send_time[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> assert(system_events_message_read.end_time[system_events_message_at] == system_events_message_written.end_time[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> assert(system_events_message_read.group[system_events_message_at] == system_events_message_written.group[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reference Price Message: 14 bytes --------------------------------------- */

/* This message is sent to define the reference price of an instrument. */
typedef ReferencePriceMessage {
  byte instrument_number[4];
  byte origin;
  byte price[8];
  byte price_type
};

int reference_price_message_at;

/* every byte of Reference Price Message set to one value */
inline fill_reference_price_message(reference_price_message_record, reference_price_message_value) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.instrument_number[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.origin = reference_price_message_value;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = reference_price_message_value;
  skip
}

/* each byte of Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_reference_price_message(reference_price_message_record, reference_price_message_base) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.instrument_number[reference_price_message_at] = (reference_price_message_base + 0 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.origin = (reference_price_message_base + 4 + 1) % 256;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = (reference_price_message_base + 5 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = (reference_price_message_base + 13 + 1) % 256;
  skip
}

/* Reference Price Message to the wire, 14 bytes from where the cursor stands */
inline encode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.instrument_number[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = reference_price_message_record.origin; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = reference_price_message_record.price_type; at = at + 1;
  skip
}

/* Reference Price Message off the wire, 14 bytes from where the cursor stands */
inline decode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.instrument_number[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.origin = wire[at]; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Reference Price Message is what was written, byte for byte */
inline equal_reference_price_message(reference_price_message_read, reference_price_message_written) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.instrument_number[reference_price_message_at] == reference_price_message_written.instrument_number[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  assert(reference_price_message_read.origin == reference_price_message_written.origin);
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.price[reference_price_message_at] == reference_price_message_written.price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  assert(reference_price_message_read.price_type == reference_price_message_written.price_type);
  skip
}

/* ---- Changes In Status Message: 7 bytes -------------------------------------- */

/* This message is sent when there has been a change in the status of the instruments. */
typedef ChangesInStatusMessage {
  byte instrument_number[4];
  byte origin;
  byte status;
  byte reason
};

int changes_in_status_message_at;

/* every byte of Changes In Status Message set to one value */
inline fill_changes_in_status_message(changes_in_status_message_record, changes_in_status_message_value) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> changes_in_status_message_record.instrument_number[changes_in_status_message_at] = changes_in_status_message_value; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  changes_in_status_message_record.origin = changes_in_status_message_value;
  changes_in_status_message_record.status = changes_in_status_message_value;
  changes_in_status_message_record.reason = changes_in_status_message_value;
  skip
}

/* each byte of Changes In Status Message set to where it lies, so a field read out of place says so */
inline ramp_changes_in_status_message(changes_in_status_message_record, changes_in_status_message_base) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> changes_in_status_message_record.instrument_number[changes_in_status_message_at] = (changes_in_status_message_base + 0 + changes_in_status_message_at + 1) % 256; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  changes_in_status_message_record.origin = (changes_in_status_message_base + 4 + 1) % 256;
  changes_in_status_message_record.status = (changes_in_status_message_base + 5 + 1) % 256;
  changes_in_status_message_record.reason = (changes_in_status_message_base + 6 + 1) % 256;
  skip
}

/* Changes In Status Message to the wire, 7 bytes from where the cursor stands */
inline encode_changes_in_status_message(changes_in_status_message_record) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> wire[at] = changes_in_status_message_record.instrument_number[changes_in_status_message_at]; at = at + 1; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  wire[at] = changes_in_status_message_record.origin; at = at + 1;
  wire[at] = changes_in_status_message_record.status; at = at + 1;
  wire[at] = changes_in_status_message_record.reason; at = at + 1;
  skip
}

/* Changes In Status Message off the wire, 7 bytes from where the cursor stands */
inline decode_changes_in_status_message(changes_in_status_message_record) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> changes_in_status_message_record.instrument_number[changes_in_status_message_at] = wire[at]; at = at + 1; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  changes_in_status_message_record.origin = wire[at]; at = at + 1;
  changes_in_status_message_record.status = wire[at]; at = at + 1;
  changes_in_status_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Changes In Status Message is what was written, byte for byte */
inline equal_changes_in_status_message(changes_in_status_message_read, changes_in_status_message_written) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> assert(changes_in_status_message_read.instrument_number[changes_in_status_message_at] == changes_in_status_message_written.instrument_number[changes_in_status_message_at]); changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  assert(changes_in_status_message_read.origin == changes_in_status_message_written.origin);
  assert(changes_in_status_message_read.status == changes_in_status_message_written.status);
  assert(changes_in_status_message_read.reason == changes_in_status_message_written.reason);
  skip
}

/* ---- Catalog For Instruments Belonging To The Capital Warrants Market Message: 66 bytes ---- */

/* Catalogue for instruments pertaining to the Equities Warrants market. */
typedef CatalogForInstrumentsBelongingToTheCapitalWarrantsMarketMessage {
  byte number_of_the_instrument[4];
  byte origin;
  byte type_of_value[2];
  byte issuing_company[7];
  byte series[6];
  byte type_of_warrant;
  byte date_of_maturity[8];
  byte price_of_exercise[8];
  byte reference_price[8];
  byte reference_date[8];
  byte reference;
  byte isin[12]
};

int catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at;

/* every byte of Catalog For Instruments Belonging To The Capital Warrants Market Message set to one value */
inline fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog For Instruments Belonging To The Capital Warrants Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 0 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 4 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 5 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 7 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 14 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 20 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 21 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 29 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 37 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 45 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 53 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 54 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message to the wire, 66 bytes from where the cursor stands */
inline encode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message off the wire, 66 bytes from where the cursor stands */
inline decode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog For Instruments Belonging To The Capital Warrants Market Message is what was written, byte for byte */
inline equal_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.origin == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.origin);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.type_of_warrant == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.type_of_warrant);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.reference == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.reference);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog Sent For Instruments Belonging To Capital Tracs Message: 82 bytes ---- */

/* Catalogue sent for instruments pertaining to the equities TRACS. */
typedef CatalogSentForInstrumentsBelongingToCapitalTracsMessage {
  byte number_of_the_trac[4];
  byte origin;
  byte name_of_the_trac[8];
  byte underlying_issuing_company[7];
  byte underlying_series[6];
  byte securities[8];
  byte excluded_securities[8];
  byte price[8];
  byte component_in_cash[8];
  byte excluded_value[8];
  byte number_of_certificates[8];
  byte theoretical_price[8]
};

int catalog_sent_for_instruments_belonging_to_capital_tracs_message_at;

/* every byte of Catalog Sent For Instruments Belonging To Capital Tracs Message set to one value */
inline fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record, catalog_sent_for_instruments_belonging_to_capital_tracs_message_value) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog Sent For Instruments Belonging To Capital Tracs Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record, catalog_sent_for_instruments_belonging_to_capital_tracs_message_base) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 0 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 4 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 5 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 13 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 20 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 26 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 34 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 42 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 50 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 58 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 66 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 74 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message to the wire, 82 bytes from where the cursor stands */
inline encode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin; at = at + 1;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message off the wire, 82 bytes from where the cursor stands */
inline decode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog Sent For Instruments Belonging To Capital Tracs Message is what was written, byte for byte */
inline equal_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read, catalog_sent_for_instruments_belonging_to_capital_tracs_message_written) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.origin == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.origin);
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated Inav Message: 13 bytes ------------------------------------- */

/* Disclosure of the TRACS during the trading hours of the ongoing market. */
typedef ConsolidatedInavMessage {
  byte number_of_the_trac[4];
  byte origin;
  byte current_theoretical_price[8]
};

int consolidated_inav_message_at;

/* every byte of Consolidated Inav Message set to one value */
inline fill_consolidated_inav_message(consolidated_inav_message_record, consolidated_inav_message_value) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at] = consolidated_inav_message_value; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  consolidated_inav_message_record.origin = consolidated_inav_message_value;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at] = consolidated_inav_message_value; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Inav Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_inav_message(consolidated_inav_message_record, consolidated_inav_message_base) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at] = (consolidated_inav_message_base + 0 + consolidated_inav_message_at + 1) % 256; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  consolidated_inav_message_record.origin = (consolidated_inav_message_base + 4 + 1) % 256;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at] = (consolidated_inav_message_base + 5 + consolidated_inav_message_at + 1) % 256; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Inav Message to the wire, 13 bytes from where the cursor stands */
inline encode_consolidated_inav_message(consolidated_inav_message_record) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> wire[at] = consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_inav_message_record.origin; at = at + 1;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> wire[at] = consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Inav Message off the wire, 13 bytes from where the cursor stands */
inline decode_consolidated_inav_message(consolidated_inav_message_record) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at] = wire[at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  consolidated_inav_message_record.origin = wire[at]; at = at + 1;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at] = wire[at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Inav Message is what was written, byte for byte */
inline equal_consolidated_inav_message(consolidated_inav_message_read, consolidated_inav_message_written) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> assert(consolidated_inav_message_read.number_of_the_trac[consolidated_inav_message_at] == consolidated_inav_message_written.number_of_the_trac[consolidated_inav_message_at]); consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  assert(consolidated_inav_message_read.origin == consolidated_inav_message_written.origin);
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> assert(consolidated_inav_message_read.current_theoretical_price[consolidated_inav_message_at] == consolidated_inav_message_written.current_theoretical_price[consolidated_inav_message_at]); consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog For Instruments Belonging To The Local And Global Stock Market Message: 73 bytes ---- */

/* Catalog of instruments from the local and global stock markets. */
typedef CatalogForInstrumentsBelongingToTheLocalAndGlobalStockMar_gc6yau {
  byte mse_instrument_number[4];
  byte value_of_type[2];
  byte issuing_company[7];
  byte series[6];
  byte last_price[8];
  byte ppp_weighted_average_price[8];
  byte reference_date[8];
  byte reference;
  byte coupon_in_effect[2];
  byte marketability;
  byte numerical_marketability[4];
  byte isin[12];
  byte market;
  byte registered_values[8];
  byte exchange
};

int catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at;

/* every byte of Catalog For Instruments Belonging To The Local And Global Stock Market Message set to one value */
inline fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  skip
}

/* each byte of Catalog For Instruments Belonging To The Local And Global Stock Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 0 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 4 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 6 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 13 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 19 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 27 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 35 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 43 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 44 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 46 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 47 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 51 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 63 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 64 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 72 + 1) % 256;
  skip
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message to the wire, 73 bytes from where the cursor stands */
inline encode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange; at = at + 1;
  skip
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message off the wire, 73 bytes from where the cursor stands */
inline decode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = wire[at]; at = at + 1;
  skip
}

/* what was read of Catalog For Instruments Belonging To The Local And Global Stock Market Message is what was written, byte for byte */
inline equal_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.reference == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.reference);
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.marketability == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.marketability);
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.market == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.market);
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.exchange == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.exchange);
  skip
}

/* ---- Probable Price Of Allocation Message: 21 bytes -------------------------- */

/* The message is sent during any type of bidding (Opening, Ongoing, Volatility and Intraday) and only in the instruments where there already is a virtual term matching or pre-allotment. */
typedef ProbablePriceOfAllocationMessage {
  byte instrument_number[4];
  byte origin;
  byte probable_price_of_allocation[8];
  byte volume_int_648[8]
};

int probable_price_of_allocation_message_at;

/* every byte of Probable Price Of Allocation Message set to one value */
inline fill_probable_price_of_allocation_message(probable_price_of_allocation_message_record, probable_price_of_allocation_message_value) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at] = probable_price_of_allocation_message_value; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_record.origin = probable_price_of_allocation_message_value;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at] = probable_price_of_allocation_message_value; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.volume_int_648[probable_price_of_allocation_message_at] = probable_price_of_allocation_message_value; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Probable Price Of Allocation Message set to where it lies, so a field read out of place says so */
inline ramp_probable_price_of_allocation_message(probable_price_of_allocation_message_record, probable_price_of_allocation_message_base) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at] = (probable_price_of_allocation_message_base + 0 + probable_price_of_allocation_message_at + 1) % 256; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_record.origin = (probable_price_of_allocation_message_base + 4 + 1) % 256;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at] = (probable_price_of_allocation_message_base + 5 + probable_price_of_allocation_message_at + 1) % 256; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.volume_int_648[probable_price_of_allocation_message_at] = (probable_price_of_allocation_message_base + 13 + probable_price_of_allocation_message_at + 1) % 256; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Price Of Allocation Message to the wire, 21 bytes from where the cursor stands */
inline encode_probable_price_of_allocation_message(probable_price_of_allocation_message_record) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> wire[at] = probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  wire[at] = probable_price_of_allocation_message_record.origin; at = at + 1;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> wire[at] = probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> wire[at] = probable_price_of_allocation_message_record.volume_int_648[probable_price_of_allocation_message_at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Price Of Allocation Message off the wire, 21 bytes from where the cursor stands */
inline decode_probable_price_of_allocation_message(probable_price_of_allocation_message_record) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at] = wire[at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_record.origin = wire[at]; at = at + 1;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at] = wire[at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.volume_int_648[probable_price_of_allocation_message_at] = wire[at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Probable Price Of Allocation Message is what was written, byte for byte */
inline equal_probable_price_of_allocation_message(probable_price_of_allocation_message_read, probable_price_of_allocation_message_written) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> assert(probable_price_of_allocation_message_read.instrument_number[probable_price_of_allocation_message_at] == probable_price_of_allocation_message_written.instrument_number[probable_price_of_allocation_message_at]); probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  assert(probable_price_of_allocation_message_read.origin == probable_price_of_allocation_message_written.origin);
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> assert(probable_price_of_allocation_message_read.probable_price_of_allocation[probable_price_of_allocation_message_at] == probable_price_of_allocation_message_written.probable_price_of_allocation[probable_price_of_allocation_message_at]); probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> assert(probable_price_of_allocation_message_read.volume_int_648[probable_price_of_allocation_message_at] == probable_price_of_allocation_message_written.volume_int_648[probable_price_of_allocation_message_at]); probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Relation Between Bmvbiva Instruments Message: 9 bytes ------------------- */

/* Relation between identifiers of instruments between BIVA and BMV. */
typedef RelationBetweenBmvbivaInstrumentsMessage {
  byte number_of_the_bmv_instrument[4];
  byte biva_instrument[4];
  byte type_of_trading
};

int relation_between_bmvbiva_instruments_message_at;

/* every byte of Relation Between Bmvbiva Instruments Message set to one value */
inline fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record, relation_between_bmvbiva_instruments_message_value) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] = relation_between_bmvbiva_instruments_message_value; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at] = relation_between_bmvbiva_instruments_message_value; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_record.type_of_trading = relation_between_bmvbiva_instruments_message_value;
  skip
}

/* each byte of Relation Between Bmvbiva Instruments Message set to where it lies, so a field read out of place says so */
inline ramp_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record, relation_between_bmvbiva_instruments_message_base) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] = (relation_between_bmvbiva_instruments_message_base + 0 + relation_between_bmvbiva_instruments_message_at + 1) % 256; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at] = (relation_between_bmvbiva_instruments_message_base + 4 + relation_between_bmvbiva_instruments_message_at + 1) % 256; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_record.type_of_trading = (relation_between_bmvbiva_instruments_message_base + 8 + 1) % 256;
  skip
}

/* Relation Between Bmvbiva Instruments Message to the wire, 9 bytes from where the cursor stands */
inline encode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> wire[at] = relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> wire[at] = relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = relation_between_bmvbiva_instruments_message_record.type_of_trading; at = at + 1;
  skip
}

/* Relation Between Bmvbiva Instruments Message off the wire, 9 bytes from where the cursor stands */
inline decode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] = wire[at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at] = wire[at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_record.type_of_trading = wire[at]; at = at + 1;
  skip
}

/* what was read of Relation Between Bmvbiva Instruments Message is what was written, byte for byte */
inline equal_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_read, relation_between_bmvbiva_instruments_message_written) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> assert(relation_between_bmvbiva_instruments_message_read.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] == relation_between_bmvbiva_instruments_message_written.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at]); relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> assert(relation_between_bmvbiva_instruments_message_read.biva_instrument[relation_between_bmvbiva_instruments_message_at] == relation_between_bmvbiva_instruments_message_written.biva_instrument[relation_between_bmvbiva_instruments_message_at]); relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  assert(relation_between_bmvbiva_instruments_message_read.type_of_trading == relation_between_bmvbiva_instruments_message_written.type_of_trading);
  skip
}

/* ---- Equities Market Trades Message: 61 bytes -------------------------------- */

/* Informs about any transaction which was accepted at the BMV or BIVA. */
typedef EquitiesMarketTradesMessage {
  byte instrument_number[4];
  byte origin;
  byte time_of_the_trade[8];
  byte volume_int_648[8];
  byte price[8];
  byte type_of_agreement;
  byte consecutive_number_of_the_trade[8];
  byte sets_price;
  byte type_of_trading;
  byte amount[8];
  byte purchases[5];
  byte sells[5];
  byte settlement;
  byte auction_indicator;
  byte indicator
};

int equities_market_trades_message_at;

/* every byte of Equities Market Trades Message set to one value */
inline fill_equities_market_trades_message(equities_market_trades_message_record, equities_market_trades_message_value) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> equities_market_trades_message_record.instrument_number[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.origin = equities_market_trades_message_value;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.volume_int_648[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.price[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.type_of_agreement = equities_market_trades_message_value;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.sets_price = equities_market_trades_message_value;
  equities_market_trades_message_record.type_of_trading = equities_market_trades_message_value;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.amount[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.purchases[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.sells[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.settlement = equities_market_trades_message_value;
  equities_market_trades_message_record.auction_indicator = equities_market_trades_message_value;
  equities_market_trades_message_record.indicator = equities_market_trades_message_value;
  skip
}

/* each byte of Equities Market Trades Message set to where it lies, so a field read out of place says so */
inline ramp_equities_market_trades_message(equities_market_trades_message_record, equities_market_trades_message_base) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> equities_market_trades_message_record.instrument_number[equities_market_trades_message_at] = (equities_market_trades_message_base + 0 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.origin = (equities_market_trades_message_base + 4 + 1) % 256;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at] = (equities_market_trades_message_base + 5 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.volume_int_648[equities_market_trades_message_at] = (equities_market_trades_message_base + 13 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.price[equities_market_trades_message_at] = (equities_market_trades_message_base + 21 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.type_of_agreement = (equities_market_trades_message_base + 29 + 1) % 256;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at] = (equities_market_trades_message_base + 30 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.sets_price = (equities_market_trades_message_base + 38 + 1) % 256;
  equities_market_trades_message_record.type_of_trading = (equities_market_trades_message_base + 39 + 1) % 256;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.amount[equities_market_trades_message_at] = (equities_market_trades_message_base + 40 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.purchases[equities_market_trades_message_at] = (equities_market_trades_message_base + 48 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.sells[equities_market_trades_message_at] = (equities_market_trades_message_base + 53 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.settlement = (equities_market_trades_message_base + 58 + 1) % 256;
  equities_market_trades_message_record.auction_indicator = (equities_market_trades_message_base + 59 + 1) % 256;
  equities_market_trades_message_record.indicator = (equities_market_trades_message_base + 60 + 1) % 256;
  skip
}

/* Equities Market Trades Message to the wire, 61 bytes from where the cursor stands */
inline encode_equities_market_trades_message(equities_market_trades_message_record) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> wire[at] = equities_market_trades_message_record.instrument_number[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.origin; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.volume_int_648[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.price[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.type_of_agreement; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.sets_price; at = at + 1;
  wire[at] = equities_market_trades_message_record.type_of_trading; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.amount[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> wire[at] = equities_market_trades_message_record.purchases[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> wire[at] = equities_market_trades_message_record.sells[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.settlement; at = at + 1;
  wire[at] = equities_market_trades_message_record.auction_indicator; at = at + 1;
  wire[at] = equities_market_trades_message_record.indicator; at = at + 1;
  skip
}

/* Equities Market Trades Message off the wire, 61 bytes from where the cursor stands */
inline decode_equities_market_trades_message(equities_market_trades_message_record) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> equities_market_trades_message_record.instrument_number[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.origin = wire[at]; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.volume_int_648[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.price[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.type_of_agreement = wire[at]; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.sets_price = wire[at]; at = at + 1;
  equities_market_trades_message_record.type_of_trading = wire[at]; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.amount[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.purchases[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.sells[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.settlement = wire[at]; at = at + 1;
  equities_market_trades_message_record.auction_indicator = wire[at]; at = at + 1;
  equities_market_trades_message_record.indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Equities Market Trades Message is what was written, byte for byte */
inline equal_equities_market_trades_message(equities_market_trades_message_read, equities_market_trades_message_written) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> assert(equities_market_trades_message_read.instrument_number[equities_market_trades_message_at] == equities_market_trades_message_written.instrument_number[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.origin == equities_market_trades_message_written.origin);
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.time_of_the_trade[equities_market_trades_message_at] == equities_market_trades_message_written.time_of_the_trade[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.volume_int_648[equities_market_trades_message_at] == equities_market_trades_message_written.volume_int_648[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.price[equities_market_trades_message_at] == equities_market_trades_message_written.price[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.type_of_agreement == equities_market_trades_message_written.type_of_agreement);
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.consecutive_number_of_the_trade[equities_market_trades_message_at] == equities_market_trades_message_written.consecutive_number_of_the_trade[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.sets_price == equities_market_trades_message_written.sets_price);
  assert(equities_market_trades_message_read.type_of_trading == equities_market_trades_message_written.type_of_trading);
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.amount[equities_market_trades_message_at] == equities_market_trades_message_written.amount[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> assert(equities_market_trades_message_read.purchases[equities_market_trades_message_at] == equities_market_trades_message_written.purchases[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> assert(equities_market_trades_message_read.sells[equities_market_trades_message_at] == equities_market_trades_message_written.sells[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.settlement == equities_market_trades_message_written.settlement);
  assert(equities_market_trades_message_read.auction_indicator == equities_market_trades_message_written.auction_indicator);
  assert(equities_market_trades_message_read.indicator == equities_market_trades_message_written.indicator);
  skip
}

/* ---- Consolidated Trade Cancellation Message: 13 bytes ----------------------- */

/* This message in sent when a transaction is cancelled from BMV or BIVA system. */
typedef ConsolidatedTradeCancellationMessage {
  byte instrument_number[4];
  byte origin;
  byte consecutive_number_of_the_trade[8]
};

int consolidated_trade_cancellation_message_at;

/* every byte of Consolidated Trade Cancellation Message set to one value */
inline fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record, consolidated_trade_cancellation_message_value) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at] = consolidated_trade_cancellation_message_value; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancellation_message_record.origin = consolidated_trade_cancellation_message_value;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] = consolidated_trade_cancellation_message_value; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record, consolidated_trade_cancellation_message_base) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at] = (consolidated_trade_cancellation_message_base + 0 + consolidated_trade_cancellation_message_at + 1) % 256; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancellation_message_record.origin = (consolidated_trade_cancellation_message_base + 4 + 1) % 256;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] = (consolidated_trade_cancellation_message_base + 5 + consolidated_trade_cancellation_message_at + 1) % 256; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Cancellation Message to the wire, 13 bytes from where the cursor stands */
inline encode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> wire[at] = consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_trade_cancellation_message_record.origin; at = at + 1;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> wire[at] = consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Cancellation Message off the wire, 13 bytes from where the cursor stands */
inline decode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at] = wire[at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancellation_message_record.origin = wire[at]; at = at + 1;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] = wire[at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Trade Cancellation Message is what was written, byte for byte */
inline equal_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_read, consolidated_trade_cancellation_message_written) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> assert(consolidated_trade_cancellation_message_read.instrument_number[consolidated_trade_cancellation_message_at] == consolidated_trade_cancellation_message_written.instrument_number[consolidated_trade_cancellation_message_at]); consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  assert(consolidated_trade_cancellation_message_read.origin == consolidated_trade_cancellation_message_written.origin);
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> assert(consolidated_trade_cancellation_message_read.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] == consolidated_trade_cancellation_message_written.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at]); consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Pricevolume Indicator Message: 38 bytes --------------------------------- */

/* Price/volume indicator for the messages coming from BIVA. */
typedef PricevolumeIndicatorMessage {
  byte instrument_number[4];
  byte origin;
  byte probable_price_of_allotment[8];
  byte volume_int_648[8];
  byte best_selling_price[8];
  byte best_purchasing_price[8];
  byte type_of_cross_trading
};

int pricevolume_indicator_message_at;

/* every byte of Pricevolume Indicator Message set to one value */
inline fill_pricevolume_indicator_message(pricevolume_indicator_message_record, pricevolume_indicator_message_value) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.origin = pricevolume_indicator_message_value;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.volume_int_648[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.type_of_cross_trading = pricevolume_indicator_message_value;
  skip
}

/* each byte of Pricevolume Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_pricevolume_indicator_message(pricevolume_indicator_message_record, pricevolume_indicator_message_base) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 0 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.origin = (pricevolume_indicator_message_base + 4 + 1) % 256;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 5 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.volume_int_648[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 13 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 21 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 29 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.type_of_cross_trading = (pricevolume_indicator_message_base + 37 + 1) % 256;
  skip
}

/* Pricevolume Indicator Message to the wire, 38 bytes from where the cursor stands */
inline encode_pricevolume_indicator_message(pricevolume_indicator_message_record) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> wire[at] = pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = pricevolume_indicator_message_record.origin; at = at + 1;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.volume_int_648[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = pricevolume_indicator_message_record.type_of_cross_trading; at = at + 1;
  skip
}

/* Pricevolume Indicator Message off the wire, 38 bytes from where the cursor stands */
inline decode_pricevolume_indicator_message(pricevolume_indicator_message_record) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.origin = wire[at]; at = at + 1;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.volume_int_648[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.type_of_cross_trading = wire[at]; at = at + 1;
  skip
}

/* what was read of Pricevolume Indicator Message is what was written, byte for byte */
inline equal_pricevolume_indicator_message(pricevolume_indicator_message_read, pricevolume_indicator_message_written) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> assert(pricevolume_indicator_message_read.instrument_number[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.instrument_number[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  assert(pricevolume_indicator_message_read.origin == pricevolume_indicator_message_written.origin);
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.probable_price_of_allotment[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.probable_price_of_allotment[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.volume_int_648[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.volume_int_648[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.best_selling_price[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.best_selling_price[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.best_purchasing_price[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.best_purchasing_price[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  assert(pricevolume_indicator_message_read.type_of_cross_trading == pricevolume_indicator_message_written.type_of_cross_trading);
  skip
}

/* ---- Consolidated Execution Of Orders Message: 52 bytes ---------------------- */

/* The message is published when there is a term matching or closing in the electronic system of the BMV or BIVA. */
typedef ConsolidatedExecutionOfOrdersMessage {
  byte instrument_number[4];
  byte origin;
  byte date[8];
  byte consecutive_number[8];
  byte volume_int_648[8];
  byte consecutive_number_of_the_trade[8];
  byte execution_price[8];
  byte indicator;
  byte sets_price;
  byte participant[5]
};

int consolidated_execution_of_orders_message_at;

/* every byte of Consolidated Execution Of Orders Message set to one value */
inline fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record, consolidated_execution_of_orders_message_value) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.origin = consolidated_execution_of_orders_message_value;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.volume_int_648[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.indicator = consolidated_execution_of_orders_message_value;
  consolidated_execution_of_orders_message_record.sets_price = consolidated_execution_of_orders_message_value;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Execution Of Orders Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record, consolidated_execution_of_orders_message_base) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 0 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.origin = (consolidated_execution_of_orders_message_base + 4 + 1) % 256;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 5 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 13 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.volume_int_648[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 21 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 29 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 37 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.indicator = (consolidated_execution_of_orders_message_base + 45 + 1) % 256;
  consolidated_execution_of_orders_message_record.sets_price = (consolidated_execution_of_orders_message_base + 46 + 1) % 256;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 47 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Execution Of Orders Message to the wire, 52 bytes from where the cursor stands */
inline encode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> wire[at] = consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_execution_of_orders_message_record.origin; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.volume_int_648[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_execution_of_orders_message_record.indicator; at = at + 1;
  wire[at] = consolidated_execution_of_orders_message_record.sets_price; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> wire[at] = consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Execution Of Orders Message off the wire, 52 bytes from where the cursor stands */
inline decode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.origin = wire[at]; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.volume_int_648[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.indicator = wire[at]; at = at + 1;
  consolidated_execution_of_orders_message_record.sets_price = wire[at]; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Execution Of Orders Message is what was written, byte for byte */
inline equal_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_read, consolidated_execution_of_orders_message_written) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> assert(consolidated_execution_of_orders_message_read.instrument_number[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.instrument_number[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  assert(consolidated_execution_of_orders_message_read.origin == consolidated_execution_of_orders_message_written.origin);
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.date[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.date[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.consecutive_number[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.consecutive_number[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.volume_int_648[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.volume_int_648[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.execution_price[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.execution_price[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  assert(consolidated_execution_of_orders_message_read.indicator == consolidated_execution_of_orders_message_written.indicator);
  assert(consolidated_execution_of_orders_message_read.sets_price == consolidated_execution_of_orders_message_written.sets_price);
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> assert(consolidated_execution_of_orders_message_read.participant[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.participant[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Registration Of Order Message: 43 bytes --------------------------------- */

/* When the order is accepted by the central system of the BMV or BIVA, this message is sent to the appropriate media. */
typedef RegistrationOfOrderMessage {
  byte instrument_number[4];
  byte origin;
  byte date_and_time[8];
  byte consecutive_number[8];
  byte direction;
  byte volume_int_648[8];
  byte price[8];
  byte participant[5]
};

int registration_of_order_message_at;

/* every byte of Registration Of Order Message set to one value */
inline fill_registration_of_order_message(registration_of_order_message_record, registration_of_order_message_value) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> registration_of_order_message_record.instrument_number[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.origin = registration_of_order_message_value;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.date_and_time[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.consecutive_number[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.direction = registration_of_order_message_value;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.volume_int_648[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.price[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> registration_of_order_message_record.participant[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Registration Of Order Message set to where it lies, so a field read out of place says so */
inline ramp_registration_of_order_message(registration_of_order_message_record, registration_of_order_message_base) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> registration_of_order_message_record.instrument_number[registration_of_order_message_at] = (registration_of_order_message_base + 0 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.origin = (registration_of_order_message_base + 4 + 1) % 256;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.date_and_time[registration_of_order_message_at] = (registration_of_order_message_base + 5 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.consecutive_number[registration_of_order_message_at] = (registration_of_order_message_base + 13 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.direction = (registration_of_order_message_base + 21 + 1) % 256;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.volume_int_648[registration_of_order_message_at] = (registration_of_order_message_base + 22 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.price[registration_of_order_message_at] = (registration_of_order_message_base + 30 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> registration_of_order_message_record.participant[registration_of_order_message_at] = (registration_of_order_message_base + 38 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Registration Of Order Message to the wire, 43 bytes from where the cursor stands */
inline encode_registration_of_order_message(registration_of_order_message_record) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> wire[at] = registration_of_order_message_record.instrument_number[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  wire[at] = registration_of_order_message_record.origin; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.date_and_time[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.consecutive_number[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  wire[at] = registration_of_order_message_record.direction; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.volume_int_648[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.price[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> wire[at] = registration_of_order_message_record.participant[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Registration Of Order Message off the wire, 43 bytes from where the cursor stands */
inline decode_registration_of_order_message(registration_of_order_message_record) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> registration_of_order_message_record.instrument_number[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.origin = wire[at]; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.date_and_time[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.consecutive_number[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.direction = wire[at]; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.volume_int_648[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.price[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> registration_of_order_message_record.participant[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Registration Of Order Message is what was written, byte for byte */
inline equal_registration_of_order_message(registration_of_order_message_read, registration_of_order_message_written) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> assert(registration_of_order_message_read.instrument_number[registration_of_order_message_at] == registration_of_order_message_written.instrument_number[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  assert(registration_of_order_message_read.origin == registration_of_order_message_written.origin);
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.date_and_time[registration_of_order_message_at] == registration_of_order_message_written.date_and_time[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.consecutive_number[registration_of_order_message_at] == registration_of_order_message_written.consecutive_number[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  assert(registration_of_order_message_read.direction == registration_of_order_message_written.direction);
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.volume_int_648[registration_of_order_message_at] == registration_of_order_message_written.volume_int_648[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.price[registration_of_order_message_at] == registration_of_order_message_written.price[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> assert(registration_of_order_message_read.participant[registration_of_order_message_at] == registration_of_order_message_written.participant[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancellations Of Orders Message: 21 bytes ------------------------------- */

/* This message deletes the trading floor order. */
typedef CancellationsOfOrdersMessage {
  byte instrument_number[4];
  byte origin;
  byte date[8];
  byte consecutive_number[8]
};

int cancellations_of_orders_message_at;

/* every byte of Cancellations Of Orders Message set to one value */
inline fill_cancellations_of_orders_message(cancellations_of_orders_message_record, cancellations_of_orders_message_value) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at] = cancellations_of_orders_message_value; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_record.origin = cancellations_of_orders_message_value;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.date[cancellations_of_orders_message_at] = cancellations_of_orders_message_value; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at] = cancellations_of_orders_message_value; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancellations Of Orders Message set to where it lies, so a field read out of place says so */
inline ramp_cancellations_of_orders_message(cancellations_of_orders_message_record, cancellations_of_orders_message_base) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at] = (cancellations_of_orders_message_base + 0 + cancellations_of_orders_message_at + 1) % 256; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_record.origin = (cancellations_of_orders_message_base + 4 + 1) % 256;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.date[cancellations_of_orders_message_at] = (cancellations_of_orders_message_base + 5 + cancellations_of_orders_message_at + 1) % 256; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at] = (cancellations_of_orders_message_base + 13 + cancellations_of_orders_message_at + 1) % 256; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancellations Of Orders Message to the wire, 21 bytes from where the cursor stands */
inline encode_cancellations_of_orders_message(cancellations_of_orders_message_record) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> wire[at] = cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  wire[at] = cancellations_of_orders_message_record.origin; at = at + 1;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> wire[at] = cancellations_of_orders_message_record.date[cancellations_of_orders_message_at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> wire[at] = cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancellations Of Orders Message off the wire, 21 bytes from where the cursor stands */
inline decode_cancellations_of_orders_message(cancellations_of_orders_message_record) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at] = wire[at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_record.origin = wire[at]; at = at + 1;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.date[cancellations_of_orders_message_at] = wire[at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at] = wire[at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancellations Of Orders Message is what was written, byte for byte */
inline equal_cancellations_of_orders_message(cancellations_of_orders_message_read, cancellations_of_orders_message_written) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> assert(cancellations_of_orders_message_read.instrument_number[cancellations_of_orders_message_at] == cancellations_of_orders_message_written.instrument_number[cancellations_of_orders_message_at]); cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  assert(cancellations_of_orders_message_read.origin == cancellations_of_orders_message_written.origin);
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> assert(cancellations_of_orders_message_read.date[cancellations_of_orders_message_at] == cancellations_of_orders_message_written.date[cancellations_of_orders_message_at]); cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> assert(cancellations_of_orders_message_read.consecutive_number[cancellations_of_orders_message_at] == cancellations_of_orders_message_written.consecutive_number[cancellations_of_orders_message_at]); cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Last Quote Message: 23 bytes -------------------------------------------- */

/* Message sent by instrument when the best bid is modified in the electronic book by the Origin Exchange; denotes the side that is modified, the sale or the purchase. */
typedef LastQuoteMessage {
  byte instrument_number[4];
  byte origin;
  byte volume_int_648[8];
  byte price_rate[8];
  byte direction_of_the_bid;
  byte type_of_trading
};

int last_quote_message_at;

/* every byte of Last Quote Message set to one value */
inline fill_last_quote_message(last_quote_message_record, last_quote_message_value) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> last_quote_message_record.instrument_number[last_quote_message_at] = last_quote_message_value; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.origin = last_quote_message_value;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.volume_int_648[last_quote_message_at] = last_quote_message_value; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.price_rate[last_quote_message_at] = last_quote_message_value; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.direction_of_the_bid = last_quote_message_value;
  last_quote_message_record.type_of_trading = last_quote_message_value;
  skip
}

/* each byte of Last Quote Message set to where it lies, so a field read out of place says so */
inline ramp_last_quote_message(last_quote_message_record, last_quote_message_base) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> last_quote_message_record.instrument_number[last_quote_message_at] = (last_quote_message_base + 0 + last_quote_message_at + 1) % 256; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.origin = (last_quote_message_base + 4 + 1) % 256;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.volume_int_648[last_quote_message_at] = (last_quote_message_base + 5 + last_quote_message_at + 1) % 256; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.price_rate[last_quote_message_at] = (last_quote_message_base + 13 + last_quote_message_at + 1) % 256; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.direction_of_the_bid = (last_quote_message_base + 21 + 1) % 256;
  last_quote_message_record.type_of_trading = (last_quote_message_base + 22 + 1) % 256;
  skip
}

/* Last Quote Message to the wire, 23 bytes from where the cursor stands */
inline encode_last_quote_message(last_quote_message_record) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> wire[at] = last_quote_message_record.instrument_number[last_quote_message_at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = last_quote_message_record.origin; at = at + 1;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> wire[at] = last_quote_message_record.volume_int_648[last_quote_message_at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> wire[at] = last_quote_message_record.price_rate[last_quote_message_at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = last_quote_message_record.direction_of_the_bid; at = at + 1;
  wire[at] = last_quote_message_record.type_of_trading; at = at + 1;
  skip
}

/* Last Quote Message off the wire, 23 bytes from where the cursor stands */
inline decode_last_quote_message(last_quote_message_record) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> last_quote_message_record.instrument_number[last_quote_message_at] = wire[at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.origin = wire[at]; at = at + 1;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.volume_int_648[last_quote_message_at] = wire[at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> last_quote_message_record.price_rate[last_quote_message_at] = wire[at]; at = at + 1; last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_record.direction_of_the_bid = wire[at]; at = at + 1;
  last_quote_message_record.type_of_trading = wire[at]; at = at + 1;
  skip
}

/* what was read of Last Quote Message is what was written, byte for byte */
inline equal_last_quote_message(last_quote_message_read, last_quote_message_written) {
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 4 -> assert(last_quote_message_read.instrument_number[last_quote_message_at] == last_quote_message_written.instrument_number[last_quote_message_at]); last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  assert(last_quote_message_read.origin == last_quote_message_written.origin);
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> assert(last_quote_message_read.volume_int_648[last_quote_message_at] == last_quote_message_written.volume_int_648[last_quote_message_at]); last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  last_quote_message_at = 0;
  do
  :: last_quote_message_at < 8 -> assert(last_quote_message_read.price_rate[last_quote_message_at] == last_quote_message_written.price_rate[last_quote_message_at]); last_quote_message_at = last_quote_message_at + 1
  :: else -> break
  od;
  assert(last_quote_message_read.direction_of_the_bid == last_quote_message_written.direction_of_the_bid);
  assert(last_quote_message_read.type_of_trading == last_quote_message_written.type_of_trading);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* INTRA Multicast Header: encoded, read back, and compared */
proctype check_i_n_t_r_a_multicast_header() {
  INTRAMulticastHeader i_n_t_r_a_multicast_header_sent;
  INTRAMulticastHeader i_n_t_r_a_multicast_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  :: pattern == 1 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 32)
  :: pattern == 2 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 255)
  :: else -> ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent);
    assert(at == 17);
    at = 0;
    decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got);
    assert(at == 17);
    equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got, i_n_t_r_a_multicast_header_sent)
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
    assert(at == 6);
    at = 0;
    decode_snapshot_response_message(snapshot_response_message_got);
    assert(at == 6);
    equal_snapshot_response_message(snapshot_response_message_got, snapshot_response_message_sent)
  }
}

/* Snapshot Complete Message: encoded, read back, and compared */
proctype check_snapshot_complete_message() {
  SnapshotCompleteMessage snapshot_complete_message_sent;
  SnapshotCompleteMessage snapshot_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_complete_message(snapshot_complete_message_sent, 255)
  :: else -> ramp_snapshot_complete_message(snapshot_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_complete_message(snapshot_complete_message_sent);
    assert(at == 6);
    at = 0;
    decode_snapshot_complete_message(snapshot_complete_message_got);
    assert(at == 6);
    equal_snapshot_complete_message(snapshot_complete_message_got, snapshot_complete_message_sent)
  }
}

/* Events System Message: encoded, read back, and compared */
proctype check_events_system_message() {
  EventsSystemMessage events_system_message_sent;
  EventsSystemMessage events_system_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_events_system_message(events_system_message_sent, 0)
  :: pattern == 1 -> fill_events_system_message(events_system_message_sent, 32)
  :: pattern == 2 -> fill_events_system_message(events_system_message_sent, 255)
  :: else -> ramp_events_system_message(events_system_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_events_system_message(events_system_message_sent);
    assert(at == 22);
    at = 0;
    decode_events_system_message(events_system_message_got);
    assert(at == 22);
    equal_events_system_message(events_system_message_got, events_system_message_sent)
  }
}

/* Trade Cancellation Message: encoded, read back, and compared */
proctype check_trade_cancellation_message() {
  TradeCancellationMessage trade_cancellation_message_sent;
  TradeCancellationMessage trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 255)
  :: else -> ramp_trade_cancellation_message(trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_message(trade_cancellation_message_sent);
    assert(at == 8);
    at = 0;
    decode_trade_cancellation_message(trade_cancellation_message_got);
    assert(at == 8);
    equal_trade_cancellation_message(trade_cancellation_message_got, trade_cancellation_message_sent)
  }
}

/* Status Changes Message: encoded, read back, and compared */
proctype check_status_changes_message() {
  StatusChangesMessage status_changes_message_sent;
  StatusChangesMessage status_changes_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_status_changes_message(status_changes_message_sent, 0)
  :: pattern == 1 -> fill_status_changes_message(status_changes_message_sent, 32)
  :: pattern == 2 -> fill_status_changes_message(status_changes_message_sent, 255)
  :: else -> ramp_status_changes_message(status_changes_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_status_changes_message(status_changes_message_sent);
    assert(at == 5);
    at = 0;
    decode_status_changes_message(status_changes_message_got);
    assert(at == 5);
    equal_status_changes_message(status_changes_message_got, status_changes_message_sent)
  }
}

/* Weighted Average Price Settlement Prices Message: encoded, read back, and compared */
proctype check_weighted_average_price_settlement_prices_message() {
  WeightedAveragePriceSettlementPricesMessage weighted_average_price_settlement_prices_message_sent;
  WeightedAveragePriceSettlementPricesMessage weighted_average_price_settlement_prices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 0)
  :: pattern == 1 -> fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 32)
  :: pattern == 2 -> fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 255)
  :: else -> ramp_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent);
    assert(at == 20);
    at = 0;
    decode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_got);
    assert(at == 20);
    equal_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_got, weighted_average_price_settlement_prices_message_sent)
  }
}

/* Capital Trades Message: encoded, read back, and compared */
proctype check_capital_trades_message() {
  CapitalTradesMessage capital_trades_message_sent;
  CapitalTradesMessage capital_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_capital_trades_message(capital_trades_message_sent, 0)
  :: pattern == 1 -> fill_capital_trades_message(capital_trades_message_sent, 32)
  :: pattern == 2 -> fill_capital_trades_message(capital_trades_message_sent, 255)
  :: else -> ramp_capital_trades_message(capital_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_capital_trades_message(capital_trades_message_sent);
    assert(at == 51);
    at = 0;
    decode_capital_trades_message(capital_trades_message_got);
    assert(at == 51);
    equal_capital_trades_message(capital_trades_message_got, capital_trades_message_sent)
  }
}

/* Probable Allocation Price Message: encoded, read back, and compared */
proctype check_probable_allocation_price_message() {
  ProbableAllocationPriceMessage probable_allocation_price_message_sent;
  ProbableAllocationPriceMessage probable_allocation_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_probable_allocation_price_message(probable_allocation_price_message_sent, 0)
  :: pattern == 1 -> fill_probable_allocation_price_message(probable_allocation_price_message_sent, 32)
  :: pattern == 2 -> fill_probable_allocation_price_message(probable_allocation_price_message_sent, 255)
  :: else -> ramp_probable_allocation_price_message(probable_allocation_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_probable_allocation_price_message(probable_allocation_price_message_sent);
    assert(at == 16);
    at = 0;
    decode_probable_allocation_price_message(probable_allocation_price_message_got);
    assert(at == 16);
    equal_probable_allocation_price_message(probable_allocation_price_message_got, probable_allocation_price_message_sent)
  }
}

/* Continuous Auctions Beginning Message: encoded, read back, and compared */
proctype check_continuous_auctions_beginning_message() {
  ContinuousAuctionsBeginningMessage continuous_auctions_beginning_message_sent;
  ContinuousAuctionsBeginningMessage continuous_auctions_beginning_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 0)
  :: pattern == 1 -> fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 32)
  :: pattern == 2 -> fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 255)
  :: else -> ramp_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent);
    assert(at == 20);
    at = 0;
    decode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_got);
    assert(at == 20);
    equal_continuous_auctions_beginning_message(continuous_auctions_beginning_message_got, continuous_auctions_beginning_message_sent)
  }
}

/* Middle Price Existing Quotes Message: encoded, read back, and compared */
proctype check_middle_price_existing_quotes_message() {
  MiddlePriceExistingQuotesMessage middle_price_existing_quotes_message_sent;
  MiddlePriceExistingQuotesMessage middle_price_existing_quotes_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 0)
  :: pattern == 1 -> fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 32)
  :: pattern == 2 -> fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 255)
  :: else -> ramp_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent);
    assert(at == 5);
    at = 0;
    decode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_got);
    assert(at == 5);
    equal_middle_price_existing_quotes_message(middle_price_existing_quotes_message_got, middle_price_existing_quotes_message_sent)
  }
}

/* Registry Operations Message: encoded, read back, and compared */
proctype check_registry_operations_message() {
  RegistryOperationsMessage registry_operations_message_sent;
  RegistryOperationsMessage registry_operations_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_registry_operations_message(registry_operations_message_sent, 0)
  :: pattern == 1 -> fill_registry_operations_message(registry_operations_message_sent, 32)
  :: pattern == 2 -> fill_registry_operations_message(registry_operations_message_sent, 255)
  :: else -> ramp_registry_operations_message(registry_operations_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_registry_operations_message(registry_operations_message_sent);
    assert(at == 61);
    at = 0;
    decode_registry_operations_message(registry_operations_message_got);
    assert(at == 61);
    equal_registry_operations_message(registry_operations_message_got, registry_operations_message_sent)
  }
}

/* Mutual Fund Trades Message: encoded, read back, and compared */
proctype check_mutual_fund_trades_message() {
  MutualFundTradesMessage mutual_fund_trades_message_sent;
  MutualFundTradesMessage mutual_fund_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mutual_fund_trades_message(mutual_fund_trades_message_sent, 0)
  :: pattern == 1 -> fill_mutual_fund_trades_message(mutual_fund_trades_message_sent, 32)
  :: pattern == 2 -> fill_mutual_fund_trades_message(mutual_fund_trades_message_sent, 255)
  :: else -> ramp_mutual_fund_trades_message(mutual_fund_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mutual_fund_trades_message(mutual_fund_trades_message_sent);
    assert(at == 52);
    at = 0;
    decode_mutual_fund_trades_message(mutual_fund_trades_message_got);
    assert(at == 52);
    equal_mutual_fund_trades_message(mutual_fund_trades_message_got, mutual_fund_trades_message_sent)
  }
}

/* Tradability Message: encoded, read back, and compared */
proctype check_tradability_message() {
  TradabilityMessage tradability_message_sent;
  TradabilityMessage tradability_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tradability_message(tradability_message_sent, 0)
  :: pattern == 1 -> fill_tradability_message(tradability_message_sent, 32)
  :: pattern == 2 -> fill_tradability_message(tradability_message_sent, 255)
  :: else -> ramp_tradability_message(tradability_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tradability_message(tradability_message_sent);
    assert(at == 64);
    at = 0;
    decode_tradability_message(tradability_message_got);
    assert(at == 64);
    equal_tradability_message(tradability_message_got, tradability_message_sent)
  }
}

/* Virtual Trades Message: encoded, read back, and compared */
proctype check_virtual_trades_message() {
  VirtualTradesMessage virtual_trades_message_sent;
  VirtualTradesMessage virtual_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_virtual_trades_message(virtual_trades_message_sent, 0)
  :: pattern == 1 -> fill_virtual_trades_message(virtual_trades_message_sent, 32)
  :: pattern == 2 -> fill_virtual_trades_message(virtual_trades_message_sent, 255)
  :: else -> ramp_virtual_trades_message(virtual_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_virtual_trades_message(virtual_trades_message_sent);
    assert(at == 25);
    at = 0;
    decode_virtual_trades_message(virtual_trades_message_got);
    assert(at == 25);
    equal_virtual_trades_message(virtual_trades_message_got, virtual_trades_message_sent)
  }
}

/* Order Addition Message: encoded, read back, and compared */
proctype check_order_addition_message() {
  OrderAdditionMessage order_addition_message_sent;
  OrderAdditionMessage order_addition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_addition_message(order_addition_message_sent, 0)
  :: pattern == 1 -> fill_order_addition_message(order_addition_message_sent, 32)
  :: pattern == 2 -> fill_order_addition_message(order_addition_message_sent, 255)
  :: else -> ramp_order_addition_message(order_addition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_addition_message(order_addition_message_sent);
    assert(at == 34);
    at = 0;
    decode_order_addition_message(order_addition_message_got);
    assert(at == 34);
    equal_order_addition_message(order_addition_message_got, order_addition_message_sent)
  }
}

/* Execution Of Orders Message: encoded, read back, and compared */
proctype check_execution_of_orders_message() {
  ExecutionOfOrdersMessage execution_of_orders_message_sent;
  ExecutionOfOrdersMessage execution_of_orders_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_of_orders_message(execution_of_orders_message_sent, 0)
  :: pattern == 1 -> fill_execution_of_orders_message(execution_of_orders_message_sent, 32)
  :: pattern == 2 -> fill_execution_of_orders_message(execution_of_orders_message_sent, 255)
  :: else -> ramp_execution_of_orders_message(execution_of_orders_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_of_orders_message(execution_of_orders_message_sent);
    assert(at == 32);
    at = 0;
    decode_execution_of_orders_message(execution_of_orders_message_got);
    assert(at == 32);
    equal_execution_of_orders_message(execution_of_orders_message_got, execution_of_orders_message_sent)
  }
}

/* Order Cancellation Message: encoded, read back, and compared */
proctype check_order_cancellation_message() {
  OrderCancellationMessage order_cancellation_message_sent;
  OrderCancellationMessage order_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancellation_message(order_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_order_cancellation_message(order_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_order_cancellation_message(order_cancellation_message_sent, 255)
  :: else -> ramp_order_cancellation_message(order_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancellation_message(order_cancellation_message_sent);
    assert(at == 16);
    at = 0;
    decode_order_cancellation_message(order_cancellation_message_got);
    assert(at == 16);
    equal_order_cancellation_message(order_cancellation_message_got, order_cancellation_message_sent)
  }
}

/* Order Change Message: encoded, read back, and compared */
proctype check_order_change_message() {
  OrderChangeMessage order_change_message_sent;
  OrderChangeMessage order_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_change_message(order_change_message_sent, 0)
  :: pattern == 1 -> fill_order_change_message(order_change_message_sent, 32)
  :: pattern == 2 -> fill_order_change_message(order_change_message_sent, 255)
  :: else -> ramp_order_change_message(order_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_change_message(order_change_message_sent);
    assert(at == 41);
    at = 0;
    decode_order_change_message(order_change_message_got);
    assert(at == 41);
    equal_order_change_message(order_change_message_got, order_change_message_sent)
  }
}

/* Best Offer Message: encoded, read back, and compared */
proctype check_best_offer_message() {
  BestOfferMessage best_offer_message_sent;
  BestOfferMessage best_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_offer_message(best_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_offer_message(best_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_offer_message(best_offer_message_sent, 255)
  :: else -> ramp_best_offer_message(best_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_offer_message(best_offer_message_sent);
    assert(at == 18);
    at = 0;
    decode_best_offer_message(best_offer_message_got);
    assert(at == 18);
    equal_best_offer_message(best_offer_message_got, best_offer_message_sent)
  }
}

/* Public Offerings Message: encoded, read back, and compared */
proctype check_public_offerings_message() {
  PublicOfferingsMessage public_offerings_message_sent;
  PublicOfferingsMessage public_offerings_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_public_offerings_message(public_offerings_message_sent, 0)
  :: pattern == 1 -> fill_public_offerings_message(public_offerings_message_sent, 32)
  :: pattern == 2 -> fill_public_offerings_message(public_offerings_message_sent, 255)
  :: else -> ramp_public_offerings_message(public_offerings_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_public_offerings_message(public_offerings_message_sent);
    assert(at == 66);
    at = 0;
    decode_public_offerings_message(public_offerings_message_got);
    assert(at == 66);
    equal_public_offerings_message(public_offerings_message_got, public_offerings_message_sent)
  }
}

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 8);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 8);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Derivatives Market Trades Message: encoded, read back, and compared */
proctype check_derivatives_market_trades_message() {
  DerivativesMarketTradesMessage derivatives_market_trades_message_sent;
  DerivativesMarketTradesMessage derivatives_market_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_derivatives_market_trades_message(derivatives_market_trades_message_sent, 0)
  :: pattern == 1 -> fill_derivatives_market_trades_message(derivatives_market_trades_message_sent, 32)
  :: pattern == 2 -> fill_derivatives_market_trades_message(derivatives_market_trades_message_sent, 255)
  :: else -> ramp_derivatives_market_trades_message(derivatives_market_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_derivatives_market_trades_message(derivatives_market_trades_message_sent);
    assert(at == 43);
    at = 0;
    decode_derivatives_market_trades_message(derivatives_market_trades_message_got);
    assert(at == 43);
    equal_derivatives_market_trades_message(derivatives_market_trades_message_got, derivatives_market_trades_message_sent)
  }
}

/* Statistics Of Instruments Message: encoded, read back, and compared */
proctype check_statistics_of_instruments_message() {
  StatisticsOfInstrumentsMessage statistics_of_instruments_message_sent;
  StatisticsOfInstrumentsMessage statistics_of_instruments_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_of_instruments_message(statistics_of_instruments_message_sent, 0)
  :: pattern == 1 -> fill_statistics_of_instruments_message(statistics_of_instruments_message_sent, 32)
  :: pattern == 2 -> fill_statistics_of_instruments_message(statistics_of_instruments_message_sent, 255)
  :: else -> ramp_statistics_of_instruments_message(statistics_of_instruments_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_of_instruments_message(statistics_of_instruments_message_sent);
    assert(at == 44);
    at = 0;
    decode_statistics_of_instruments_message(statistics_of_instruments_message_got);
    assert(at == 44);
    equal_statistics_of_instruments_message(statistics_of_instruments_message_got, statistics_of_instruments_message_sent)
  }
}

/* General Indices Message: encoded, read back, and compared */
proctype check_general_indices_message() {
  GeneralIndicesMessage general_indices_message_sent;
  GeneralIndicesMessage general_indices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_general_indices_message(general_indices_message_sent, 0)
  :: pattern == 1 -> fill_general_indices_message(general_indices_message_sent, 32)
  :: pattern == 2 -> fill_general_indices_message(general_indices_message_sent, 255)
  :: else -> ramp_general_indices_message(general_indices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_general_indices_message(general_indices_message_sent);
    assert(at == 33);
    at = 0;
    decode_general_indices_message(general_indices_message_got);
    assert(at == 33);
    equal_general_indices_message(general_indices_message_got, general_indices_message_sent)
  }
}

/* Indices Components Message: encoded, read back, and compared */
proctype check_indices_components_message() {
  IndicesComponentsMessage indices_components_message_sent;
  IndicesComponentsMessage indices_components_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indices_components_message(indices_components_message_sent, 0)
  :: pattern == 1 -> fill_indices_components_message(indices_components_message_sent, 32)
  :: pattern == 2 -> fill_indices_components_message(indices_components_message_sent, 255)
  :: else -> ramp_indices_components_message(indices_components_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indices_components_message(indices_components_message_sent);
    assert(at == 57);
    at = 0;
    decode_indices_components_message(indices_components_message_got);
    assert(at == 57);
    equal_indices_components_message(indices_components_message_got, indices_components_message_sent)
  }
}

/* Inav Message: encoded, read back, and compared */
proctype check_inav_message() {
  InavMessage inav_message_sent;
  InavMessage inav_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_inav_message(inav_message_sent, 0)
  :: pattern == 1 -> fill_inav_message(inav_message_sent, 32)
  :: pattern == 2 -> fill_inav_message(inav_message_sent, 255)
  :: else -> ramp_inav_message(inav_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_inav_message(inav_message_sent);
    assert(at == 12);
    at = 0;
    decode_inav_message(inav_message_got);
    assert(at == 12);
    equal_inav_message(inav_message_got, inav_message_sent)
  }
}

/* Dollar Buy Sell Message: encoded, read back, and compared */
proctype check_dollar_buy_sell_message() {
  DollarBuySellMessage dollar_buy_sell_message_sent;
  DollarBuySellMessage dollar_buy_sell_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dollar_buy_sell_message(dollar_buy_sell_message_sent, 0)
  :: pattern == 1 -> fill_dollar_buy_sell_message(dollar_buy_sell_message_sent, 32)
  :: pattern == 2 -> fill_dollar_buy_sell_message(dollar_buy_sell_message_sent, 255)
  :: else -> ramp_dollar_buy_sell_message(dollar_buy_sell_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dollar_buy_sell_message(dollar_buy_sell_message_sent);
    assert(at == 38);
    at = 0;
    decode_dollar_buy_sell_message(dollar_buy_sell_message_got);
    assert(at == 38);
    equal_dollar_buy_sell_message(dollar_buy_sell_message_got, dollar_buy_sell_message_sent)
  }
}

/* Short Sales Balances Per Instrument Message: encoded, read back, and compared */
proctype check_short_sales_balances_per_instrument_message() {
  ShortSalesBalancesPerInstrumentMessage short_sales_balances_per_instrument_message_sent;
  ShortSalesBalancesPerInstrumentMessage short_sales_balances_per_instrument_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 0)
  :: pattern == 1 -> fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 32)
  :: pattern == 2 -> fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 255)
  :: else -> ramp_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent);
    assert(at == 44);
    at = 0;
    decode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_got);
    assert(at == 44);
    equal_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_got, short_sales_balances_per_instrument_message_sent)
  }
}

/* Capital Market Multiples Message: encoded, read back, and compared */
proctype check_capital_market_multiples_message() {
  CapitalMarketMultiplesMessage capital_market_multiples_message_sent;
  CapitalMarketMultiplesMessage capital_market_multiples_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_capital_market_multiples_message(capital_market_multiples_message_sent, 0)
  :: pattern == 1 -> fill_capital_market_multiples_message(capital_market_multiples_message_sent, 32)
  :: pattern == 2 -> fill_capital_market_multiples_message(capital_market_multiples_message_sent, 255)
  :: else -> ramp_capital_market_multiples_message(capital_market_multiples_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_capital_market_multiples_message(capital_market_multiples_message_sent);
    assert(at == 130);
    at = 0;
    decode_capital_market_multiples_message(capital_market_multiples_message_got);
    assert(at == 130);
    equal_capital_market_multiples_message(capital_market_multiples_message_got, capital_market_multiples_message_sent)
  }
}

/* Benchmark Message: encoded, read back, and compared */
proctype check_benchmark_message() {
  BenchmarkMessage benchmark_message_sent;
  BenchmarkMessage benchmark_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_benchmark_message(benchmark_message_sent, 0)
  :: pattern == 1 -> fill_benchmark_message(benchmark_message_sent, 32)
  :: pattern == 2 -> fill_benchmark_message(benchmark_message_sent, 255)
  :: else -> ramp_benchmark_message(benchmark_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_benchmark_message(benchmark_message_sent);
    assert(at == 149);
    at = 0;
    decode_benchmark_message(benchmark_message_got);
    assert(at == 149);
    equal_benchmark_message(benchmark_message_got, benchmark_message_sent)
  }
}

/* Capitalization Rules Message: encoded, read back, and compared */
proctype check_capitalization_rules_message() {
  CapitalizationRulesMessage capitalization_rules_message_sent;
  CapitalizationRulesMessage capitalization_rules_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_capitalization_rules_message(capitalization_rules_message_sent, 0)
  :: pattern == 1 -> fill_capitalization_rules_message(capitalization_rules_message_sent, 32)
  :: pattern == 2 -> fill_capitalization_rules_message(capitalization_rules_message_sent, 255)
  :: else -> ramp_capitalization_rules_message(capitalization_rules_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_capitalization_rules_message(capitalization_rules_message_sent);
    assert(at == 39);
    at = 0;
    decode_capitalization_rules_message(capitalization_rules_message_got);
    assert(at == 39);
    equal_capitalization_rules_message(capitalization_rules_message_got, capitalization_rules_message_sent)
  }
}

/* Closing Price Origin Message: encoded, read back, and compared */
proctype check_closing_price_origin_message() {
  ClosingPriceOriginMessage closing_price_origin_message_sent;
  ClosingPriceOriginMessage closing_price_origin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_closing_price_origin_message(closing_price_origin_message_sent, 0)
  :: pattern == 1 -> fill_closing_price_origin_message(closing_price_origin_message_sent, 32)
  :: pattern == 2 -> fill_closing_price_origin_message(closing_price_origin_message_sent, 255)
  :: else -> ramp_closing_price_origin_message(closing_price_origin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_closing_price_origin_message(closing_price_origin_message_sent);
    assert(at == 13);
    at = 0;
    decode_closing_price_origin_message(closing_price_origin_message_got);
    assert(at == 13);
    equal_closing_price_origin_message(closing_price_origin_message_got, closing_price_origin_message_sent)
  }
}

/* Mutual Funds Trades Message: encoded, read back, and compared */
proctype check_mutual_funds_trades_message() {
  MutualFundsTradesMessage mutual_funds_trades_message_sent;
  MutualFundsTradesMessage mutual_funds_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mutual_funds_trades_message(mutual_funds_trades_message_sent, 0)
  :: pattern == 1 -> fill_mutual_funds_trades_message(mutual_funds_trades_message_sent, 32)
  :: pattern == 2 -> fill_mutual_funds_trades_message(mutual_funds_trades_message_sent, 255)
  :: else -> ramp_mutual_funds_trades_message(mutual_funds_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mutual_funds_trades_message(mutual_funds_trades_message_sent);
    assert(at == 53);
    at = 0;
    decode_mutual_funds_trades_message(mutual_funds_trades_message_got);
    assert(at == 53);
    equal_mutual_funds_trades_message(mutual_funds_trades_message_got, mutual_funds_trades_message_sent)
  }
}

/* Opening Of Continuous Auctions Message: encoded, read back, and compared */
proctype check_opening_of_continuous_auctions_message() {
  OpeningOfContinuousAuctionsMessage opening_of_continuous_auctions_message_sent;
  OpeningOfContinuousAuctionsMessage opening_of_continuous_auctions_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 0)
  :: pattern == 1 -> fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 32)
  :: pattern == 2 -> fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 255)
  :: else -> ramp_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent);
    assert(at == 21);
    at = 0;
    decode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_got);
    assert(at == 21);
    equal_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_got, opening_of_continuous_auctions_message_sent)
  }
}

/* Existence Of Bids At Mid Price Message: encoded, read back, and compared */
proctype check_existence_of_bids_at_mid_price_message() {
  ExistenceOfBidsAtMidPriceMessage existence_of_bids_at_mid_price_message_sent;
  ExistenceOfBidsAtMidPriceMessage existence_of_bids_at_mid_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 0)
  :: pattern == 1 -> fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 32)
  :: pattern == 2 -> fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 255)
  :: else -> ramp_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent);
    assert(at == 6);
    at = 0;
    decode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_got);
    assert(at == 6);
    equal_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_got, existence_of_bids_at_mid_price_message_sent)
  }
}

/* Catalogue Of Debt And Metals Instruments Message: encoded, read back, and compared */
proctype check_catalogue_of_debt_and_metals_instruments_message() {
  CatalogueOfDebtAndMetalsInstrumentsMessage catalogue_of_debt_and_metals_instruments_message_sent;
  CatalogueOfDebtAndMetalsInstrumentsMessage catalogue_of_debt_and_metals_instruments_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 0)
  :: pattern == 1 -> fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 32)
  :: pattern == 2 -> fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 255)
  :: else -> ramp_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent);
    assert(at == 103);
    at = 0;
    decode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_got);
    assert(at == 103);
    equal_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_got, catalogue_of_debt_and_metals_instruments_message_sent)
  }
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message: encoded, read back, and compared */
proctype check_catalog_sent_for_instruments_belonging_to_mutual_funds_message() {
  CatalogSentForInstrumentsBelongingToMutualFundsMessage catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent;
  CatalogSentForInstrumentsBelongingToMutualFundsMessage catalog_sent_for_instruments_belonging_to_mutual_funds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 0)
  :: pattern == 1 -> fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 32)
  :: pattern == 2 -> fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 255)
  :: else -> ramp_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent);
    assert(at == 78);
    at = 0;
    decode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_got);
    assert(at == 78);
    equal_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_got, catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent)
  }
}

/* Weighted Average Price Message: encoded, read back, and compared */
proctype check_weighted_average_price_message() {
  WeightedAveragePriceMessage weighted_average_price_message_sent;
  WeightedAveragePriceMessage weighted_average_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_average_price_message(weighted_average_price_message_sent, 0)
  :: pattern == 1 -> fill_weighted_average_price_message(weighted_average_price_message_sent, 32)
  :: pattern == 2 -> fill_weighted_average_price_message(weighted_average_price_message_sent, 255)
  :: else -> ramp_weighted_average_price_message(weighted_average_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_average_price_message(weighted_average_price_message_sent);
    assert(at == 21);
    at = 0;
    decode_weighted_average_price_message(weighted_average_price_message_got);
    assert(at == 21);
    equal_weighted_average_price_message(weighted_average_price_message_got, weighted_average_price_message_sent)
  }
}

/* System Events Message: encoded, read back, and compared */
proctype check_system_events_message() {
  SystemEventsMessage system_events_message_sent;
  SystemEventsMessage system_events_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_events_message(system_events_message_sent, 0)
  :: pattern == 1 -> fill_system_events_message(system_events_message_sent, 32)
  :: pattern == 2 -> fill_system_events_message(system_events_message_sent, 255)
  :: else -> ramp_system_events_message(system_events_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_events_message(system_events_message_sent);
    assert(at == 31);
    at = 0;
    decode_system_events_message(system_events_message_got);
    assert(at == 31);
    equal_system_events_message(system_events_message_got, system_events_message_sent)
  }
}

/* Reference Price Message: encoded, read back, and compared */
proctype check_reference_price_message() {
  ReferencePriceMessage reference_price_message_sent;
  ReferencePriceMessage reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_price_message(reference_price_message_sent, 0)
  :: pattern == 1 -> fill_reference_price_message(reference_price_message_sent, 32)
  :: pattern == 2 -> fill_reference_price_message(reference_price_message_sent, 255)
  :: else -> ramp_reference_price_message(reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_price_message(reference_price_message_sent);
    assert(at == 14);
    at = 0;
    decode_reference_price_message(reference_price_message_got);
    assert(at == 14);
    equal_reference_price_message(reference_price_message_got, reference_price_message_sent)
  }
}

/* Changes In Status Message: encoded, read back, and compared */
proctype check_changes_in_status_message() {
  ChangesInStatusMessage changes_in_status_message_sent;
  ChangesInStatusMessage changes_in_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_changes_in_status_message(changes_in_status_message_sent, 0)
  :: pattern == 1 -> fill_changes_in_status_message(changes_in_status_message_sent, 32)
  :: pattern == 2 -> fill_changes_in_status_message(changes_in_status_message_sent, 255)
  :: else -> ramp_changes_in_status_message(changes_in_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_changes_in_status_message(changes_in_status_message_sent);
    assert(at == 7);
    at = 0;
    decode_changes_in_status_message(changes_in_status_message_got);
    assert(at == 7);
    equal_changes_in_status_message(changes_in_status_message_got, changes_in_status_message_sent)
  }
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message: encoded, read back, and compared */
proctype check_catalog_for_instruments_belonging_to_the_capital_warrants_market_message() {
  CatalogForInstrumentsBelongingToTheCapitalWarrantsMarketMessage catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent;
  CatalogForInstrumentsBelongingToTheCapitalWarrantsMarketMessage catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 0)
  :: pattern == 1 -> fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 32)
  :: pattern == 2 -> fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 255)
  :: else -> ramp_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent);
    assert(at == 66);
    at = 0;
    decode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got);
    assert(at == 66);
    equal_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent)
  }
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message: encoded, read back, and compared */
proctype check_catalog_sent_for_instruments_belonging_to_capital_tracs_message() {
  CatalogSentForInstrumentsBelongingToCapitalTracsMessage catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent;
  CatalogSentForInstrumentsBelongingToCapitalTracsMessage catalog_sent_for_instruments_belonging_to_capital_tracs_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 0)
  :: pattern == 1 -> fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 32)
  :: pattern == 2 -> fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 255)
  :: else -> ramp_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent);
    assert(at == 82);
    at = 0;
    decode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_got);
    assert(at == 82);
    equal_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_got, catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent)
  }
}

/* Consolidated Inav Message: encoded, read back, and compared */
proctype check_consolidated_inav_message() {
  ConsolidatedInavMessage consolidated_inav_message_sent;
  ConsolidatedInavMessage consolidated_inav_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_inav_message(consolidated_inav_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_inav_message(consolidated_inav_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_inav_message(consolidated_inav_message_sent, 255)
  :: else -> ramp_consolidated_inav_message(consolidated_inav_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_inav_message(consolidated_inav_message_sent);
    assert(at == 13);
    at = 0;
    decode_consolidated_inav_message(consolidated_inav_message_got);
    assert(at == 13);
    equal_consolidated_inav_message(consolidated_inav_message_got, consolidated_inav_message_sent)
  }
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message: encoded, read back, and compared */
proctype check_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau() {
  CatalogForInstrumentsBelongingToTheLocalAndGlobalStockMar_gc6yau catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent;
  CatalogForInstrumentsBelongingToTheLocalAndGlobalStockMar_gc6yau catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 0)
  :: pattern == 1 -> fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 32)
  :: pattern == 2 -> fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 255)
  :: else -> ramp_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent);
    assert(at == 73);
    at = 0;
    decode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got);
    assert(at == 73);
    equal_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent)
  }
}

/* Probable Price Of Allocation Message: encoded, read back, and compared */
proctype check_probable_price_of_allocation_message() {
  ProbablePriceOfAllocationMessage probable_price_of_allocation_message_sent;
  ProbablePriceOfAllocationMessage probable_price_of_allocation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 0)
  :: pattern == 1 -> fill_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 32)
  :: pattern == 2 -> fill_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 255)
  :: else -> ramp_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_probable_price_of_allocation_message(probable_price_of_allocation_message_sent);
    assert(at == 21);
    at = 0;
    decode_probable_price_of_allocation_message(probable_price_of_allocation_message_got);
    assert(at == 21);
    equal_probable_price_of_allocation_message(probable_price_of_allocation_message_got, probable_price_of_allocation_message_sent)
  }
}

/* Relation Between Bmvbiva Instruments Message: encoded, read back, and compared */
proctype check_relation_between_bmvbiva_instruments_message() {
  RelationBetweenBmvbivaInstrumentsMessage relation_between_bmvbiva_instruments_message_sent;
  RelationBetweenBmvbivaInstrumentsMessage relation_between_bmvbiva_instruments_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 0)
  :: pattern == 1 -> fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 32)
  :: pattern == 2 -> fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 255)
  :: else -> ramp_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent);
    assert(at == 9);
    at = 0;
    decode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_got);
    assert(at == 9);
    equal_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_got, relation_between_bmvbiva_instruments_message_sent)
  }
}

/* Equities Market Trades Message: encoded, read back, and compared */
proctype check_equities_market_trades_message() {
  EquitiesMarketTradesMessage equities_market_trades_message_sent;
  EquitiesMarketTradesMessage equities_market_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equities_market_trades_message(equities_market_trades_message_sent, 0)
  :: pattern == 1 -> fill_equities_market_trades_message(equities_market_trades_message_sent, 32)
  :: pattern == 2 -> fill_equities_market_trades_message(equities_market_trades_message_sent, 255)
  :: else -> ramp_equities_market_trades_message(equities_market_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equities_market_trades_message(equities_market_trades_message_sent);
    assert(at == 61);
    at = 0;
    decode_equities_market_trades_message(equities_market_trades_message_got);
    assert(at == 61);
    equal_equities_market_trades_message(equities_market_trades_message_got, equities_market_trades_message_sent)
  }
}

/* Consolidated Trade Cancellation Message: encoded, read back, and compared */
proctype check_consolidated_trade_cancellation_message() {
  ConsolidatedTradeCancellationMessage consolidated_trade_cancellation_message_sent;
  ConsolidatedTradeCancellationMessage consolidated_trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 255)
  :: else -> ramp_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent);
    assert(at == 13);
    at = 0;
    decode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_got);
    assert(at == 13);
    equal_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_got, consolidated_trade_cancellation_message_sent)
  }
}

/* Pricevolume Indicator Message: encoded, read back, and compared */
proctype check_pricevolume_indicator_message() {
  PricevolumeIndicatorMessage pricevolume_indicator_message_sent;
  PricevolumeIndicatorMessage pricevolume_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pricevolume_indicator_message(pricevolume_indicator_message_sent, 0)
  :: pattern == 1 -> fill_pricevolume_indicator_message(pricevolume_indicator_message_sent, 32)
  :: pattern == 2 -> fill_pricevolume_indicator_message(pricevolume_indicator_message_sent, 255)
  :: else -> ramp_pricevolume_indicator_message(pricevolume_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pricevolume_indicator_message(pricevolume_indicator_message_sent);
    assert(at == 38);
    at = 0;
    decode_pricevolume_indicator_message(pricevolume_indicator_message_got);
    assert(at == 38);
    equal_pricevolume_indicator_message(pricevolume_indicator_message_got, pricevolume_indicator_message_sent)
  }
}

/* Consolidated Execution Of Orders Message: encoded, read back, and compared */
proctype check_consolidated_execution_of_orders_message() {
  ConsolidatedExecutionOfOrdersMessage consolidated_execution_of_orders_message_sent;
  ConsolidatedExecutionOfOrdersMessage consolidated_execution_of_orders_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 255)
  :: else -> ramp_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent);
    assert(at == 52);
    at = 0;
    decode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_got);
    assert(at == 52);
    equal_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_got, consolidated_execution_of_orders_message_sent)
  }
}

/* Registration Of Order Message: encoded, read back, and compared */
proctype check_registration_of_order_message() {
  RegistrationOfOrderMessage registration_of_order_message_sent;
  RegistrationOfOrderMessage registration_of_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_registration_of_order_message(registration_of_order_message_sent, 0)
  :: pattern == 1 -> fill_registration_of_order_message(registration_of_order_message_sent, 32)
  :: pattern == 2 -> fill_registration_of_order_message(registration_of_order_message_sent, 255)
  :: else -> ramp_registration_of_order_message(registration_of_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_registration_of_order_message(registration_of_order_message_sent);
    assert(at == 43);
    at = 0;
    decode_registration_of_order_message(registration_of_order_message_got);
    assert(at == 43);
    equal_registration_of_order_message(registration_of_order_message_got, registration_of_order_message_sent)
  }
}

/* Cancellations Of Orders Message: encoded, read back, and compared */
proctype check_cancellations_of_orders_message() {
  CancellationsOfOrdersMessage cancellations_of_orders_message_sent;
  CancellationsOfOrdersMessage cancellations_of_orders_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancellations_of_orders_message(cancellations_of_orders_message_sent, 0)
  :: pattern == 1 -> fill_cancellations_of_orders_message(cancellations_of_orders_message_sent, 32)
  :: pattern == 2 -> fill_cancellations_of_orders_message(cancellations_of_orders_message_sent, 255)
  :: else -> ramp_cancellations_of_orders_message(cancellations_of_orders_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancellations_of_orders_message(cancellations_of_orders_message_sent);
    assert(at == 21);
    at = 0;
    decode_cancellations_of_orders_message(cancellations_of_orders_message_got);
    assert(at == 21);
    equal_cancellations_of_orders_message(cancellations_of_orders_message_got, cancellations_of_orders_message_sent)
  }
}

/* Last Quote Message: encoded, read back, and compared */
proctype check_last_quote_message() {
  LastQuoteMessage last_quote_message_sent;
  LastQuoteMessage last_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_quote_message(last_quote_message_sent, 0)
  :: pattern == 1 -> fill_last_quote_message(last_quote_message_sent, 32)
  :: pattern == 2 -> fill_last_quote_message(last_quote_message_sent, 255)
  :: else -> ramp_last_quote_message(last_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_quote_message(last_quote_message_sent);
    assert(at == 23);
    at = 0;
    decode_last_quote_message(last_quote_message_got);
    assert(at == 23);
    equal_last_quote_message(last_quote_message_got, last_quote_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_login_response_message()
  :: run check_replay_response_message()
  :: run check_snapshot_response_message()
  :: run check_snapshot_complete_message()
  :: run check_events_system_message()
  :: run check_trade_cancellation_message()
  :: run check_status_changes_message()
  :: run check_weighted_average_price_settlement_prices_message()
  :: run check_capital_trades_message()
  :: run check_probable_allocation_price_message()
  :: run check_continuous_auctions_beginning_message()
  :: run check_middle_price_existing_quotes_message()
  :: run check_registry_operations_message()
  :: run check_mutual_fund_trades_message()
  :: run check_tradability_message()
  :: run check_virtual_trades_message()
  :: run check_order_addition_message()
  :: run check_execution_of_orders_message()
  :: run check_order_cancellation_message()
  :: run check_order_change_message()
  :: run check_best_offer_message()
  :: run check_public_offerings_message()
  :: run check_open_interest_message()
  :: run check_derivatives_market_trades_message()
  :: run check_statistics_of_instruments_message()
  :: run check_general_indices_message()
  :: run check_indices_components_message()
  :: run check_inav_message()
  :: run check_dollar_buy_sell_message()
  :: run check_short_sales_balances_per_instrument_message()
  :: run check_capital_market_multiples_message()
  :: run check_benchmark_message()
  :: run check_capitalization_rules_message()
  :: run check_closing_price_origin_message()
  :: run check_mutual_funds_trades_message()
  :: run check_opening_of_continuous_auctions_message()
  :: run check_existence_of_bids_at_mid_price_message()
  :: run check_catalogue_of_debt_and_metals_instruments_message()
  :: run check_catalog_sent_for_instruments_belonging_to_mutual_funds_message()
  :: run check_weighted_average_price_message()
  :: run check_system_events_message()
  :: run check_reference_price_message()
  :: run check_changes_in_status_message()
  :: run check_catalog_for_instruments_belonging_to_the_capital_warrants_market_message()
  :: run check_catalog_sent_for_instruments_belonging_to_capital_tracs_message()
  :: run check_consolidated_inav_message()
  :: run check_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau()
  :: run check_probable_price_of_allocation_message()
  :: run check_relation_between_bmvbiva_instruments_message()
  :: run check_equities_market_trades_message()
  :: run check_consolidated_trade_cancellation_message()
  :: run check_pricevolume_indicator_message()
  :: run check_consolidated_execution_of_orders_message()
  :: run check_registration_of_order_message()
  :: run check_cancellations_of_orders_message()
  :: run check_last_quote_message()
  fi
}
