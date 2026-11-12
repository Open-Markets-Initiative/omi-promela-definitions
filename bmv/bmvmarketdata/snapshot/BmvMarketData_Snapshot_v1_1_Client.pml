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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 17

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Client Message Header: 2 bytes ------------------------------------------ */

/* Request length and message type */
typedef ClientMessageHeader {
  byte client_length;
  byte client_message_type
};

/* every byte of Client Message Header set to one value */
inline fill_client_message_header(client_message_header_record, client_message_header_value) {
  client_message_header_record.client_length = client_message_header_value;
  client_message_header_record.client_message_type = client_message_header_value;
  skip
}

/* each byte of Client Message Header set to where it lies, so a field read out of place says so */
inline ramp_client_message_header(client_message_header_record, client_message_header_base) {
  client_message_header_record.client_length = (client_message_header_base + 0 + 1) % 256;
  client_message_header_record.client_message_type = (client_message_header_base + 1 + 1) % 256;
  skip
}

/* Client Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_client_message_header(client_message_header_record) {
  wire[at] = client_message_header_record.client_length; at = at + 1;
  wire[at] = client_message_header_record.client_message_type; at = at + 1;
  skip
}

/* Client Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_client_message_header(client_message_header_record) {
  client_message_header_record.client_length = wire[at]; at = at + 1;
  client_message_header_record.client_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Client Message Header is what was written, byte for byte */
inline equal_client_message_header(client_message_header_read, client_message_header_written) {
  assert(client_message_header_read.client_length == client_message_header_written.client_length);
  assert(client_message_header_read.client_message_type == client_message_header_written.client_message_type);
  skip
}

/* ---- Login Message: 17 bytes ------------------------------------------------- */

/* Logs the consumer in to the replay or snapshot channel. */
typedef LoginMessage {
  byte market_data_group;
  byte user[6];
  byte password[10]
};

int login_message_at;

/* every byte of Login Message set to one value */
inline fill_login_message(login_message_record, login_message_value) {
  login_message_record.market_data_group = login_message_value;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> login_message_record.user[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Message set to where it lies, so a field read out of place says so */
inline ramp_login_message(login_message_record, login_message_base) {
  login_message_record.market_data_group = (login_message_base + 0 + 1) % 256;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> login_message_record.user[login_message_at] = (login_message_base + 1 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = (login_message_base + 7 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message to the wire, 17 bytes from where the cursor stands */
inline encode_login_message(login_message_record) {
  wire[at] = login_message_record.market_data_group; at = at + 1;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> wire[at] = login_message_record.user[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> wire[at] = login_message_record.password[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message off the wire, 17 bytes from where the cursor stands */
inline decode_login_message(login_message_record) {
  login_message_record.market_data_group = wire[at]; at = at + 1;
  login_message_at = 0;
  do
  :: login_message_at < 6 -> login_message_record.user[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Message is what was written, byte for byte */
inline equal_login_message(login_message_read, login_message_written) {
  assert(login_message_read.market_data_group == login_message_written.market_data_group);
  login_message_at = 0;
  do
  :: login_message_at < 6 -> assert(login_message_read.user[login_message_at] == login_message_written.user[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> assert(login_message_read.password[login_message_at] == login_message_written.password[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay Request Message: 7 bytes ----------------------------------------- */

/* Requests the replay of messages already published on a multicast group. */
typedef ReplayRequestMessage {
  byte market_data_group;
  byte first_message[4];
  byte quantity[2]
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
  :: replay_request_message_at < 2 -> replay_request_message_record.quantity[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
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
  :: replay_request_message_at < 2 -> replay_request_message_record.quantity[replay_request_message_at] = (replay_request_message_base + 5 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
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
  :: replay_request_message_at < 2 -> wire[at] = replay_request_message_record.quantity[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
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
  :: replay_request_message_at < 2 -> replay_request_message_record.quantity[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
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
  :: replay_request_message_at < 2 -> assert(replay_request_message_read.quantity[replay_request_message_at] == replay_request_message_written.quantity[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Request Message: 6 bytes --------------------------------------- */

/* Requests a snapshot of a multicast group. */
typedef SnapshotRequestMessage {
  byte market_data_group;
  byte instrument_id[4];
  byte snapshot_type
};

int snapshot_request_message_at;

/* every byte of Snapshot Request Message set to one value */
inline fill_snapshot_request_message(snapshot_request_message_record, snapshot_request_message_value) {
  snapshot_request_message_record.market_data_group = snapshot_request_message_value;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.instrument_id[snapshot_request_message_at] = snapshot_request_message_value; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_record.snapshot_type = snapshot_request_message_value;
  skip
}

/* each byte of Snapshot Request Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_request_message(snapshot_request_message_record, snapshot_request_message_base) {
  snapshot_request_message_record.market_data_group = (snapshot_request_message_base + 0 + 1) % 256;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.instrument_id[snapshot_request_message_at] = (snapshot_request_message_base + 1 + snapshot_request_message_at + 1) % 256; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_record.snapshot_type = (snapshot_request_message_base + 5 + 1) % 256;
  skip
}

/* Snapshot Request Message to the wire, 6 bytes from where the cursor stands */
inline encode_snapshot_request_message(snapshot_request_message_record) {
  wire[at] = snapshot_request_message_record.market_data_group; at = at + 1;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> wire[at] = snapshot_request_message_record.instrument_id[snapshot_request_message_at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  wire[at] = snapshot_request_message_record.snapshot_type; at = at + 1;
  skip
}

/* Snapshot Request Message off the wire, 6 bytes from where the cursor stands */
inline decode_snapshot_request_message(snapshot_request_message_record) {
  snapshot_request_message_record.market_data_group = wire[at]; at = at + 1;
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> snapshot_request_message_record.instrument_id[snapshot_request_message_at] = wire[at]; at = at + 1; snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  snapshot_request_message_record.snapshot_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Snapshot Request Message is what was written, byte for byte */
inline equal_snapshot_request_message(snapshot_request_message_read, snapshot_request_message_written) {
  assert(snapshot_request_message_read.market_data_group == snapshot_request_message_written.market_data_group);
  snapshot_request_message_at = 0;
  do
  :: snapshot_request_message_at < 4 -> assert(snapshot_request_message_read.instrument_id[snapshot_request_message_at] == snapshot_request_message_written.instrument_id[snapshot_request_message_at]); snapshot_request_message_at = snapshot_request_message_at + 1
  :: else -> break
  od;
  assert(snapshot_request_message_read.snapshot_type == snapshot_request_message_written.snapshot_type);
  skip
}

/* ---- Snapshot Indices Request Message: 11 bytes ------------------------------ */

/* Requests a snapshot of an index. */
typedef SnapshotIndicesRequestMessage {
  byte market_data_group;
  byte component[2];
  byte recovery_hour[8]
};

int snapshot_indices_request_message_at;

/* every byte of Snapshot Indices Request Message set to one value */
inline fill_snapshot_indices_request_message(snapshot_indices_request_message_record, snapshot_indices_request_message_value) {
  snapshot_indices_request_message_record.market_data_group = snapshot_indices_request_message_value;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 2 -> snapshot_indices_request_message_record.component[snapshot_indices_request_message_at] = snapshot_indices_request_message_value; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 8 -> snapshot_indices_request_message_record.recovery_hour[snapshot_indices_request_message_at] = snapshot_indices_request_message_value; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Indices Request Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_indices_request_message(snapshot_indices_request_message_record, snapshot_indices_request_message_base) {
  snapshot_indices_request_message_record.market_data_group = (snapshot_indices_request_message_base + 0 + 1) % 256;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 2 -> snapshot_indices_request_message_record.component[snapshot_indices_request_message_at] = (snapshot_indices_request_message_base + 1 + snapshot_indices_request_message_at + 1) % 256; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 8 -> snapshot_indices_request_message_record.recovery_hour[snapshot_indices_request_message_at] = (snapshot_indices_request_message_base + 3 + snapshot_indices_request_message_at + 1) % 256; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Indices Request Message to the wire, 11 bytes from where the cursor stands */
inline encode_snapshot_indices_request_message(snapshot_indices_request_message_record) {
  wire[at] = snapshot_indices_request_message_record.market_data_group; at = at + 1;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 2 -> wire[at] = snapshot_indices_request_message_record.component[snapshot_indices_request_message_at]; at = at + 1; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 8 -> wire[at] = snapshot_indices_request_message_record.recovery_hour[snapshot_indices_request_message_at]; at = at + 1; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Indices Request Message off the wire, 11 bytes from where the cursor stands */
inline decode_snapshot_indices_request_message(snapshot_indices_request_message_record) {
  snapshot_indices_request_message_record.market_data_group = wire[at]; at = at + 1;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 2 -> snapshot_indices_request_message_record.component[snapshot_indices_request_message_at] = wire[at]; at = at + 1; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 8 -> snapshot_indices_request_message_record.recovery_hour[snapshot_indices_request_message_at] = wire[at]; at = at + 1; snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Indices Request Message is what was written, byte for byte */
inline equal_snapshot_indices_request_message(snapshot_indices_request_message_read, snapshot_indices_request_message_written) {
  assert(snapshot_indices_request_message_read.market_data_group == snapshot_indices_request_message_written.market_data_group);
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 2 -> assert(snapshot_indices_request_message_read.component[snapshot_indices_request_message_at] == snapshot_indices_request_message_written.component[snapshot_indices_request_message_at]); snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  snapshot_indices_request_message_at = 0;
  do
  :: snapshot_indices_request_message_at < 8 -> assert(snapshot_indices_request_message_read.recovery_hour[snapshot_indices_request_message_at] == snapshot_indices_request_message_written.recovery_hour[snapshot_indices_request_message_at]); snapshot_indices_request_message_at = snapshot_indices_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Consolidated Feed Request Message: 7 bytes --------------------- */

/* Requests a snapshot of a Consolidated Feed group. */
typedef SnapshotConsolidatedFeedRequestMessage {
  byte market_data_group;
  byte instrument_id[4];
  byte snapshot_type;
  byte origin
};

int snapshot_consolidated_feed_request_message_at;

/* every byte of Snapshot Consolidated Feed Request Message set to one value */
inline fill_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_record, snapshot_consolidated_feed_request_message_value) {
  snapshot_consolidated_feed_request_message_record.market_data_group = snapshot_consolidated_feed_request_message_value;
  snapshot_consolidated_feed_request_message_at = 0;
  do
  :: snapshot_consolidated_feed_request_message_at < 4 -> snapshot_consolidated_feed_request_message_record.instrument_id[snapshot_consolidated_feed_request_message_at] = snapshot_consolidated_feed_request_message_value; snapshot_consolidated_feed_request_message_at = snapshot_consolidated_feed_request_message_at + 1
  :: else -> break
  od;
  snapshot_consolidated_feed_request_message_record.snapshot_type = snapshot_consolidated_feed_request_message_value;
  snapshot_consolidated_feed_request_message_record.origin = snapshot_consolidated_feed_request_message_value;
  skip
}

/* each byte of Snapshot Consolidated Feed Request Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_record, snapshot_consolidated_feed_request_message_base) {
  snapshot_consolidated_feed_request_message_record.market_data_group = (snapshot_consolidated_feed_request_message_base + 0 + 1) % 256;
  snapshot_consolidated_feed_request_message_at = 0;
  do
  :: snapshot_consolidated_feed_request_message_at < 4 -> snapshot_consolidated_feed_request_message_record.instrument_id[snapshot_consolidated_feed_request_message_at] = (snapshot_consolidated_feed_request_message_base + 1 + snapshot_consolidated_feed_request_message_at + 1) % 256; snapshot_consolidated_feed_request_message_at = snapshot_consolidated_feed_request_message_at + 1
  :: else -> break
  od;
  snapshot_consolidated_feed_request_message_record.snapshot_type = (snapshot_consolidated_feed_request_message_base + 5 + 1) % 256;
  snapshot_consolidated_feed_request_message_record.origin = (snapshot_consolidated_feed_request_message_base + 6 + 1) % 256;
  skip
}

/* Snapshot Consolidated Feed Request Message to the wire, 7 bytes from where the cursor stands */
inline encode_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_record) {
  wire[at] = snapshot_consolidated_feed_request_message_record.market_data_group; at = at + 1;
  snapshot_consolidated_feed_request_message_at = 0;
  do
  :: snapshot_consolidated_feed_request_message_at < 4 -> wire[at] = snapshot_consolidated_feed_request_message_record.instrument_id[snapshot_consolidated_feed_request_message_at]; at = at + 1; snapshot_consolidated_feed_request_message_at = snapshot_consolidated_feed_request_message_at + 1
  :: else -> break
  od;
  wire[at] = snapshot_consolidated_feed_request_message_record.snapshot_type; at = at + 1;
  wire[at] = snapshot_consolidated_feed_request_message_record.origin; at = at + 1;
  skip
}

/* Snapshot Consolidated Feed Request Message off the wire, 7 bytes from where the cursor stands */
inline decode_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_record) {
  snapshot_consolidated_feed_request_message_record.market_data_group = wire[at]; at = at + 1;
  snapshot_consolidated_feed_request_message_at = 0;
  do
  :: snapshot_consolidated_feed_request_message_at < 4 -> snapshot_consolidated_feed_request_message_record.instrument_id[snapshot_consolidated_feed_request_message_at] = wire[at]; at = at + 1; snapshot_consolidated_feed_request_message_at = snapshot_consolidated_feed_request_message_at + 1
  :: else -> break
  od;
  snapshot_consolidated_feed_request_message_record.snapshot_type = wire[at]; at = at + 1;
  snapshot_consolidated_feed_request_message_record.origin = wire[at]; at = at + 1;
  skip
}

/* what was read of Snapshot Consolidated Feed Request Message is what was written, byte for byte */
inline equal_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_read, snapshot_consolidated_feed_request_message_written) {
  assert(snapshot_consolidated_feed_request_message_read.market_data_group == snapshot_consolidated_feed_request_message_written.market_data_group);
  snapshot_consolidated_feed_request_message_at = 0;
  do
  :: snapshot_consolidated_feed_request_message_at < 4 -> assert(snapshot_consolidated_feed_request_message_read.instrument_id[snapshot_consolidated_feed_request_message_at] == snapshot_consolidated_feed_request_message_written.instrument_id[snapshot_consolidated_feed_request_message_at]); snapshot_consolidated_feed_request_message_at = snapshot_consolidated_feed_request_message_at + 1
  :: else -> break
  od;
  assert(snapshot_consolidated_feed_request_message_read.snapshot_type == snapshot_consolidated_feed_request_message_written.snapshot_type);
  assert(snapshot_consolidated_feed_request_message_read.origin == snapshot_consolidated_feed_request_message_written.origin);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Client Message Header: encoded, read back, and compared */
proctype check_client_message_header() {
  ClientMessageHeader client_message_header_sent;
  ClientMessageHeader client_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_message_header(client_message_header_sent, 0)
  :: pattern == 1 -> fill_client_message_header(client_message_header_sent, 32)
  :: pattern == 2 -> fill_client_message_header(client_message_header_sent, 255)
  :: else -> ramp_client_message_header(client_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_message_header(client_message_header_sent);
    assert(at == 2);
    at = 0;
    decode_client_message_header(client_message_header_got);
    assert(at == 2);
    equal_client_message_header(client_message_header_got, client_message_header_sent)
  }
}

/* Login Message: encoded, read back, and compared */
proctype check_login_message() {
  LoginMessage login_message_sent;
  LoginMessage login_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_message(login_message_sent, 0)
  :: pattern == 1 -> fill_login_message(login_message_sent, 32)
  :: pattern == 2 -> fill_login_message(login_message_sent, 255)
  :: else -> ramp_login_message(login_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_message(login_message_sent);
    assert(at == 17);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 17);
    equal_login_message(login_message_got, login_message_sent)
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
    assert(at == 6);
    at = 0;
    decode_snapshot_request_message(snapshot_request_message_got);
    assert(at == 6);
    equal_snapshot_request_message(snapshot_request_message_got, snapshot_request_message_sent)
  }
}

/* Snapshot Indices Request Message: encoded, read back, and compared */
proctype check_snapshot_indices_request_message() {
  SnapshotIndicesRequestMessage snapshot_indices_request_message_sent;
  SnapshotIndicesRequestMessage snapshot_indices_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_indices_request_message(snapshot_indices_request_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_indices_request_message(snapshot_indices_request_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_indices_request_message(snapshot_indices_request_message_sent, 255)
  :: else -> ramp_snapshot_indices_request_message(snapshot_indices_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_indices_request_message(snapshot_indices_request_message_sent);
    assert(at == 11);
    at = 0;
    decode_snapshot_indices_request_message(snapshot_indices_request_message_got);
    assert(at == 11);
    equal_snapshot_indices_request_message(snapshot_indices_request_message_got, snapshot_indices_request_message_sent)
  }
}

/* Snapshot Consolidated Feed Request Message: encoded, read back, and compared */
proctype check_snapshot_consolidated_feed_request_message() {
  SnapshotConsolidatedFeedRequestMessage snapshot_consolidated_feed_request_message_sent;
  SnapshotConsolidatedFeedRequestMessage snapshot_consolidated_feed_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_sent, 255)
  :: else -> ramp_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_sent);
    assert(at == 7);
    at = 0;
    decode_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_got);
    assert(at == 7);
    equal_snapshot_consolidated_feed_request_message(snapshot_consolidated_feed_request_message_got, snapshot_consolidated_feed_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_client_message_header()
  :: run check_login_message()
  :: run check_replay_request_message()
  :: run check_snapshot_request_message()
  :: run check_snapshot_indices_request_message()
  :: run check_snapshot_consolidated_feed_request_message()
  fi
}
