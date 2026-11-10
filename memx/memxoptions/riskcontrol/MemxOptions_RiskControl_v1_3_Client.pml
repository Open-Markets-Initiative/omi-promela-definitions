/*
 * The Members Exchange Risk Control
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
 *   - a Reassemble rule
 *   - the dispatch that chooses a message by its type
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 44

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Common Header: 3 bytes -------------------------------------------------- */

/* Tcp Common Header */
typedef CommonHeader {
  byte message_type;
  byte message_length[2]
};

int common_header_at;

/* every byte of Common Header set to one value */
inline fill_common_header(common_header_record, common_header_value) {
  common_header_record.message_type = common_header_value;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> common_header_record.message_length[common_header_at] = common_header_value; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Common Header set to where it lies, so a field read out of place says so */
inline ramp_common_header(common_header_record, common_header_base) {
  common_header_record.message_type = (common_header_base + 0 + 1) % 256;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> common_header_record.message_length[common_header_at] = (common_header_base + 1 + common_header_at + 1) % 256; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header to the wire, 3 bytes from where the cursor stands */
inline encode_common_header(common_header_record) {
  wire[at] = common_header_record.message_type; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> wire[at] = common_header_record.message_length[common_header_at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* Common Header off the wire, 3 bytes from where the cursor stands */
inline decode_common_header(common_header_record) {
  common_header_record.message_type = wire[at]; at = at + 1;
  common_header_at = 0;
  do
  :: common_header_at < 2 -> common_header_record.message_length[common_header_at] = wire[at]; at = at + 1; common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Common Header is what was written, byte for byte */
inline equal_common_header(common_header_read, common_header_written) {
  assert(common_header_read.message_type == common_header_written.message_type);
  common_header_at = 0;
  do
  :: common_header_at < 2 -> assert(common_header_read.message_length[common_header_at] == common_header_written.message_length[common_header_at]); common_header_at = common_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request Message: 2 bytes ------------------------------------------ */

/* Memx Tcp Login message */
typedef LoginRequestMessage {
  byte token_type;
  byte token
};

/* every byte of Login Request Message set to one value */
inline fill_login_request_message(login_request_message_record, login_request_message_value) {
  login_request_message_record.token_type = login_request_message_value;
  login_request_message_record.token = login_request_message_value;
  skip
}

/* each byte of Login Request Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_message(login_request_message_record, login_request_message_base) {
  login_request_message_record.token_type = (login_request_message_base + 0 + 1) % 256;
  login_request_message_record.token = (login_request_message_base + 1 + 1) % 256;
  skip
}

/* Login Request Message to the wire, 2 bytes from where the cursor stands */
inline encode_login_request_message(login_request_message_record) {
  wire[at] = login_request_message_record.token_type; at = at + 1;
  wire[at] = login_request_message_record.token; at = at + 1;
  skip
}

/* Login Request Message off the wire, 2 bytes from where the cursor stands */
inline decode_login_request_message(login_request_message_record) {
  login_request_message_record.token_type = wire[at]; at = at + 1;
  login_request_message_record.token = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Request Message is what was written, byte for byte */
inline equal_login_request_message(login_request_message_read, login_request_message_written) {
  assert(login_request_message_read.token_type == login_request_message_written.token_type);
  assert(login_request_message_read.token == login_request_message_written.token);
  skip
}

/* ---- Replay Request Message: 20 bytes ---------------------------------------- */

/* Memx Tcp Replay Request message */
typedef ReplayRequestMessage {
  byte session_id[8];
  byte next_sequence_number[8];
  byte count[4]
};

int replay_request_message_at;

/* every byte of Replay Request Message set to one value */
inline fill_replay_request_message(replay_request_message_record, replay_request_message_value) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.session_id[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.next_sequence_number[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Request Message set to where it lies, so a field read out of place says so */
inline ramp_replay_request_message(replay_request_message_record, replay_request_message_base) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.session_id[replay_request_message_at] = (replay_request_message_base + 0 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.next_sequence_number[replay_request_message_at] = (replay_request_message_base + 8 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = (replay_request_message_base + 16 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> wire[at] = replay_request_message_record.session_id[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> wire[at] = replay_request_message_record.next_sequence_number[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.count[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.session_id[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> replay_request_message_record.next_sequence_number[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.count[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Request Message is what was written, byte for byte */
inline equal_replay_request_message(replay_request_message_read, replay_request_message_written) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> assert(replay_request_message_read.session_id[replay_request_message_at] == replay_request_message_written.session_id[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 8 -> assert(replay_request_message_read.next_sequence_number[replay_request_message_at] == replay_request_message_written.next_sequence_number[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.count[replay_request_message_at] == replay_request_message_written.count[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay All Request Message: 8 bytes ------------------------------------- */

/* Memx Tcp Replay All Request message */
typedef ReplayAllRequestMessage {
  byte session_id[8]
};

int replay_all_request_message_at;

/* every byte of Replay All Request Message set to one value */
inline fill_replay_all_request_message(replay_all_request_message_record, replay_all_request_message_value) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> replay_all_request_message_record.session_id[replay_all_request_message_at] = replay_all_request_message_value; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay All Request Message set to where it lies, so a field read out of place says so */
inline ramp_replay_all_request_message(replay_all_request_message_record, replay_all_request_message_base) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> replay_all_request_message_record.session_id[replay_all_request_message_at] = (replay_all_request_message_base + 0 + replay_all_request_message_at + 1) % 256; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay All Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_replay_all_request_message(replay_all_request_message_record) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> wire[at] = replay_all_request_message_record.session_id[replay_all_request_message_at]; at = at + 1; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay All Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_replay_all_request_message(replay_all_request_message_record) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> replay_all_request_message_record.session_id[replay_all_request_message_at] = wire[at]; at = at + 1; replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay All Request Message is what was written, byte for byte */
inline equal_replay_all_request_message(replay_all_request_message_read, replay_all_request_message_written) {
  replay_all_request_message_at = 0;
  do
  :: replay_all_request_message_at < 8 -> assert(replay_all_request_message_read.session_id[replay_all_request_message_at] == replay_all_request_message_written.session_id[replay_all_request_message_at]); replay_all_request_message_at = replay_all_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stream Request Message: 16 bytes ---------------------------------------- */

/* Memx Tcp Stream Request message */
typedef StreamRequestMessage {
  byte session_id[8];
  byte next_sequence_number[8]
};

int stream_request_message_at;

/* every byte of Stream Request Message set to one value */
inline fill_stream_request_message(stream_request_message_record, stream_request_message_value) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.session_id[stream_request_message_at] = stream_request_message_value; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.next_sequence_number[stream_request_message_at] = stream_request_message_value; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stream Request Message set to where it lies, so a field read out of place says so */
inline ramp_stream_request_message(stream_request_message_record, stream_request_message_base) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.session_id[stream_request_message_at] = (stream_request_message_base + 0 + stream_request_message_at + 1) % 256; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.next_sequence_number[stream_request_message_at] = (stream_request_message_base + 8 + stream_request_message_at + 1) % 256; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_stream_request_message(stream_request_message_record) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> wire[at] = stream_request_message_record.session_id[stream_request_message_at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> wire[at] = stream_request_message_record.next_sequence_number[stream_request_message_at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stream Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_stream_request_message(stream_request_message_record) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.session_id[stream_request_message_at] = wire[at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> stream_request_message_record.next_sequence_number[stream_request_message_at] = wire[at]; at = at + 1; stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stream Request Message is what was written, byte for byte */
inline equal_stream_request_message(stream_request_message_read, stream_request_message_written) {
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> assert(stream_request_message_read.session_id[stream_request_message_at] == stream_request_message_written.session_id[stream_request_message_at]); stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  stream_request_message_at = 0;
  do
  :: stream_request_message_at < 8 -> assert(stream_request_message_read.next_sequence_number[stream_request_message_at] == stream_request_message_written.next_sequence_number[stream_request_message_at]); stream_request_message_at = stream_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sbe Header: 6 bytes ----------------------------------------------------- */

/* Sbe Header */
typedef SbeHeader {
  byte block_length[2];
  byte template_id;
  byte schema_id;
  byte version[2]
};

int sbe_header_at;

/* every byte of Sbe Header set to one value */
inline fill_sbe_header(sbe_header_record, sbe_header_value) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_record.template_id = sbe_header_value;
  sbe_header_record.schema_id = sbe_header_value;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = sbe_header_value; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sbe Header set to where it lies, so a field read out of place says so */
inline ramp_sbe_header(sbe_header_record, sbe_header_base) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = (sbe_header_base + 0 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_record.template_id = (sbe_header_base + 2 + 1) % 256;
  sbe_header_record.schema_id = (sbe_header_base + 3 + 1) % 256;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = (sbe_header_base + 4 + sbe_header_at + 1) % 256; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header to the wire, 6 bytes from where the cursor stands */
inline encode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.block_length[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  wire[at] = sbe_header_record.template_id; at = at + 1;
  wire[at] = sbe_header_record.schema_id; at = at + 1;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> wire[at] = sbe_header_record.version[sbe_header_at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* Sbe Header off the wire, 6 bytes from where the cursor stands */
inline decode_sbe_header(sbe_header_record) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.block_length[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  sbe_header_record.template_id = wire[at]; at = at + 1;
  sbe_header_record.schema_id = wire[at]; at = at + 1;
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> sbe_header_record.version[sbe_header_at] = wire[at]; at = at + 1; sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sbe Header is what was written, byte for byte */
inline equal_sbe_header(sbe_header_read, sbe_header_written) {
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.block_length[sbe_header_at] == sbe_header_written.block_length[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  assert(sbe_header_read.template_id == sbe_header_written.template_id);
  assert(sbe_header_read.schema_id == sbe_header_written.schema_id);
  sbe_header_at = 0;
  do
  :: sbe_header_at < 2 -> assert(sbe_header_read.version[sbe_header_at] == sbe_header_written.version[sbe_header_at]); sbe_header_at = sbe_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Risk Settings Query Message: 20 bytes ----------------------------------- */

/* RiskSettingsQueryMessage */
typedef RiskSettingsQueryMessage {
  byte cl_ord_id[20]
};

int risk_settings_query_message_at;

/* every byte of Risk Settings Query Message set to one value */
inline fill_risk_settings_query_message(risk_settings_query_message_record, risk_settings_query_message_value) {
  risk_settings_query_message_at = 0;
  do
  :: risk_settings_query_message_at < 20 -> risk_settings_query_message_record.cl_ord_id[risk_settings_query_message_at] = risk_settings_query_message_value; risk_settings_query_message_at = risk_settings_query_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Risk Settings Query Message set to where it lies, so a field read out of place says so */
inline ramp_risk_settings_query_message(risk_settings_query_message_record, risk_settings_query_message_base) {
  risk_settings_query_message_at = 0;
  do
  :: risk_settings_query_message_at < 20 -> risk_settings_query_message_record.cl_ord_id[risk_settings_query_message_at] = (risk_settings_query_message_base + 0 + risk_settings_query_message_at + 1) % 256; risk_settings_query_message_at = risk_settings_query_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Settings Query Message to the wire, 20 bytes from where the cursor stands */
inline encode_risk_settings_query_message(risk_settings_query_message_record) {
  risk_settings_query_message_at = 0;
  do
  :: risk_settings_query_message_at < 20 -> wire[at] = risk_settings_query_message_record.cl_ord_id[risk_settings_query_message_at]; at = at + 1; risk_settings_query_message_at = risk_settings_query_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Settings Query Message off the wire, 20 bytes from where the cursor stands */
inline decode_risk_settings_query_message(risk_settings_query_message_record) {
  risk_settings_query_message_at = 0;
  do
  :: risk_settings_query_message_at < 20 -> risk_settings_query_message_record.cl_ord_id[risk_settings_query_message_at] = wire[at]; at = at + 1; risk_settings_query_message_at = risk_settings_query_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Risk Settings Query Message is what was written, byte for byte */
inline equal_risk_settings_query_message(risk_settings_query_message_read, risk_settings_query_message_written) {
  risk_settings_query_message_at = 0;
  do
  :: risk_settings_query_message_at < 20 -> assert(risk_settings_query_message_read.cl_ord_id[risk_settings_query_message_at] == risk_settings_query_message_written.cl_ord_id[risk_settings_query_message_at]); risk_settings_query_message_at = risk_settings_query_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Risk Threshold Change Req Message: 34 bytes ---------------------- */

/* ActiveRiskThresholdChangeReqMessage */
typedef ActiveRiskThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_active_risk_threshold_change_req_underlier[6];
  byte efid_active_risk_threshold_change_req_efid[4];
  byte threshold_quantity[4]
};

int active_risk_threshold_change_req_message_at;

/* every byte of Active Risk Threshold Change Req Message set to one value */
inline fill_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_record, active_risk_threshold_change_req_message_value) {
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 20 -> active_risk_threshold_change_req_message_record.cl_ord_id[active_risk_threshold_change_req_message_at] = active_risk_threshold_change_req_message_value; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 6 -> active_risk_threshold_change_req_message_record.underlier_active_risk_threshold_change_req_underlier[active_risk_threshold_change_req_message_at] = active_risk_threshold_change_req_message_value; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> active_risk_threshold_change_req_message_record.efid_active_risk_threshold_change_req_efid[active_risk_threshold_change_req_message_at] = active_risk_threshold_change_req_message_value; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> active_risk_threshold_change_req_message_record.threshold_quantity[active_risk_threshold_change_req_message_at] = active_risk_threshold_change_req_message_value; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Risk Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_record, active_risk_threshold_change_req_message_base) {
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 20 -> active_risk_threshold_change_req_message_record.cl_ord_id[active_risk_threshold_change_req_message_at] = (active_risk_threshold_change_req_message_base + 0 + active_risk_threshold_change_req_message_at + 1) % 256; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 6 -> active_risk_threshold_change_req_message_record.underlier_active_risk_threshold_change_req_underlier[active_risk_threshold_change_req_message_at] = (active_risk_threshold_change_req_message_base + 20 + active_risk_threshold_change_req_message_at + 1) % 256; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> active_risk_threshold_change_req_message_record.efid_active_risk_threshold_change_req_efid[active_risk_threshold_change_req_message_at] = (active_risk_threshold_change_req_message_base + 26 + active_risk_threshold_change_req_message_at + 1) % 256; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> active_risk_threshold_change_req_message_record.threshold_quantity[active_risk_threshold_change_req_message_at] = (active_risk_threshold_change_req_message_base + 30 + active_risk_threshold_change_req_message_at + 1) % 256; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Threshold Change Req Message to the wire, 34 bytes from where the cursor stands */
inline encode_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_record) {
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 20 -> wire[at] = active_risk_threshold_change_req_message_record.cl_ord_id[active_risk_threshold_change_req_message_at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 6 -> wire[at] = active_risk_threshold_change_req_message_record.underlier_active_risk_threshold_change_req_underlier[active_risk_threshold_change_req_message_at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> wire[at] = active_risk_threshold_change_req_message_record.efid_active_risk_threshold_change_req_efid[active_risk_threshold_change_req_message_at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> wire[at] = active_risk_threshold_change_req_message_record.threshold_quantity[active_risk_threshold_change_req_message_at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Threshold Change Req Message off the wire, 34 bytes from where the cursor stands */
inline decode_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_record) {
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 20 -> active_risk_threshold_change_req_message_record.cl_ord_id[active_risk_threshold_change_req_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 6 -> active_risk_threshold_change_req_message_record.underlier_active_risk_threshold_change_req_underlier[active_risk_threshold_change_req_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> active_risk_threshold_change_req_message_record.efid_active_risk_threshold_change_req_efid[active_risk_threshold_change_req_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> active_risk_threshold_change_req_message_record.threshold_quantity[active_risk_threshold_change_req_message_at] = wire[at]; at = at + 1; active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Risk Threshold Change Req Message is what was written, byte for byte */
inline equal_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_read, active_risk_threshold_change_req_message_written) {
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 20 -> assert(active_risk_threshold_change_req_message_read.cl_ord_id[active_risk_threshold_change_req_message_at] == active_risk_threshold_change_req_message_written.cl_ord_id[active_risk_threshold_change_req_message_at]); active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 6 -> assert(active_risk_threshold_change_req_message_read.underlier_active_risk_threshold_change_req_underlier[active_risk_threshold_change_req_message_at] == active_risk_threshold_change_req_message_written.underlier_active_risk_threshold_change_req_underlier[active_risk_threshold_change_req_message_at]); active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> assert(active_risk_threshold_change_req_message_read.efid_active_risk_threshold_change_req_efid[active_risk_threshold_change_req_message_at] == active_risk_threshold_change_req_message_written.efid_active_risk_threshold_change_req_efid[active_risk_threshold_change_req_message_at]); active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  active_risk_threshold_change_req_message_at = 0;
  do
  :: active_risk_threshold_change_req_message_at < 4 -> assert(active_risk_threshold_change_req_message_read.threshold_quantity[active_risk_threshold_change_req_message_at] == active_risk_threshold_change_req_message_written.threshold_quantity[active_risk_threshold_change_req_message_at]); active_risk_threshold_change_req_message_at = active_risk_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Active Risk Acknowledgement Req Message: 34 bytes ----------------------- */

/* ActiveRiskAcknowledgementReqMessage */
typedef ActiveRiskAcknowledgementReqMessage {
  byte cl_ord_id[20];
  byte underlier[6];
  byte efid[4];
  byte quantity[4]
};

int active_risk_acknowledgement_req_message_at;

/* every byte of Active Risk Acknowledgement Req Message set to one value */
inline fill_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_record, active_risk_acknowledgement_req_message_value) {
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 20 -> active_risk_acknowledgement_req_message_record.cl_ord_id[active_risk_acknowledgement_req_message_at] = active_risk_acknowledgement_req_message_value; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 6 -> active_risk_acknowledgement_req_message_record.underlier[active_risk_acknowledgement_req_message_at] = active_risk_acknowledgement_req_message_value; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> active_risk_acknowledgement_req_message_record.efid[active_risk_acknowledgement_req_message_at] = active_risk_acknowledgement_req_message_value; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> active_risk_acknowledgement_req_message_record.quantity[active_risk_acknowledgement_req_message_at] = active_risk_acknowledgement_req_message_value; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Active Risk Acknowledgement Req Message set to where it lies, so a field read out of place says so */
inline ramp_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_record, active_risk_acknowledgement_req_message_base) {
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 20 -> active_risk_acknowledgement_req_message_record.cl_ord_id[active_risk_acknowledgement_req_message_at] = (active_risk_acknowledgement_req_message_base + 0 + active_risk_acknowledgement_req_message_at + 1) % 256; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 6 -> active_risk_acknowledgement_req_message_record.underlier[active_risk_acknowledgement_req_message_at] = (active_risk_acknowledgement_req_message_base + 20 + active_risk_acknowledgement_req_message_at + 1) % 256; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> active_risk_acknowledgement_req_message_record.efid[active_risk_acknowledgement_req_message_at] = (active_risk_acknowledgement_req_message_base + 26 + active_risk_acknowledgement_req_message_at + 1) % 256; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> active_risk_acknowledgement_req_message_record.quantity[active_risk_acknowledgement_req_message_at] = (active_risk_acknowledgement_req_message_base + 30 + active_risk_acknowledgement_req_message_at + 1) % 256; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Acknowledgement Req Message to the wire, 34 bytes from where the cursor stands */
inline encode_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_record) {
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 20 -> wire[at] = active_risk_acknowledgement_req_message_record.cl_ord_id[active_risk_acknowledgement_req_message_at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 6 -> wire[at] = active_risk_acknowledgement_req_message_record.underlier[active_risk_acknowledgement_req_message_at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> wire[at] = active_risk_acknowledgement_req_message_record.efid[active_risk_acknowledgement_req_message_at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> wire[at] = active_risk_acknowledgement_req_message_record.quantity[active_risk_acknowledgement_req_message_at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Active Risk Acknowledgement Req Message off the wire, 34 bytes from where the cursor stands */
inline decode_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_record) {
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 20 -> active_risk_acknowledgement_req_message_record.cl_ord_id[active_risk_acknowledgement_req_message_at] = wire[at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 6 -> active_risk_acknowledgement_req_message_record.underlier[active_risk_acknowledgement_req_message_at] = wire[at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> active_risk_acknowledgement_req_message_record.efid[active_risk_acknowledgement_req_message_at] = wire[at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> active_risk_acknowledgement_req_message_record.quantity[active_risk_acknowledgement_req_message_at] = wire[at]; at = at + 1; active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Active Risk Acknowledgement Req Message is what was written, byte for byte */
inline equal_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_read, active_risk_acknowledgement_req_message_written) {
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 20 -> assert(active_risk_acknowledgement_req_message_read.cl_ord_id[active_risk_acknowledgement_req_message_at] == active_risk_acknowledgement_req_message_written.cl_ord_id[active_risk_acknowledgement_req_message_at]); active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 6 -> assert(active_risk_acknowledgement_req_message_read.underlier[active_risk_acknowledgement_req_message_at] == active_risk_acknowledgement_req_message_written.underlier[active_risk_acknowledgement_req_message_at]); active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> assert(active_risk_acknowledgement_req_message_read.efid[active_risk_acknowledgement_req_message_at] == active_risk_acknowledgement_req_message_written.efid[active_risk_acknowledgement_req_message_at]); active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  active_risk_acknowledgement_req_message_at = 0;
  do
  :: active_risk_acknowledgement_req_message_at < 4 -> assert(active_risk_acknowledgement_req_message_read.quantity[active_risk_acknowledgement_req_message_at] == active_risk_acknowledgement_req_message_written.quantity[active_risk_acknowledgement_req_message_at]); active_risk_acknowledgement_req_message_at = active_risk_acknowledgement_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Volume Threshold Change Req Message: 44 bytes ------------------------ */

/* CPVolumeThresholdChangeReqMessage */
typedef CpVolumeThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte volume[8];
  byte period_in_milli_seconds[4]
};

int cp_volume_threshold_change_req_message_at;

/* every byte of Cp Volume Threshold Change Req Message set to one value */
inline fill_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_record, cp_volume_threshold_change_req_message_value) {
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 20 -> cp_volume_threshold_change_req_message_record.cl_ord_id[cp_volume_threshold_change_req_message_at] = cp_volume_threshold_change_req_message_value; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 6 -> cp_volume_threshold_change_req_message_record.underlier_optional[cp_volume_threshold_change_req_message_at] = cp_volume_threshold_change_req_message_value; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> cp_volume_threshold_change_req_message_record.efid_optional[cp_volume_threshold_change_req_message_at] = cp_volume_threshold_change_req_message_value; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 2 -> cp_volume_threshold_change_req_message_record.risk_group_id[cp_volume_threshold_change_req_message_at] = cp_volume_threshold_change_req_message_value; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 8 -> cp_volume_threshold_change_req_message_record.volume[cp_volume_threshold_change_req_message_at] = cp_volume_threshold_change_req_message_value; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> cp_volume_threshold_change_req_message_record.period_in_milli_seconds[cp_volume_threshold_change_req_message_at] = cp_volume_threshold_change_req_message_value; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Volume Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_record, cp_volume_threshold_change_req_message_base) {
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 20 -> cp_volume_threshold_change_req_message_record.cl_ord_id[cp_volume_threshold_change_req_message_at] = (cp_volume_threshold_change_req_message_base + 0 + cp_volume_threshold_change_req_message_at + 1) % 256; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 6 -> cp_volume_threshold_change_req_message_record.underlier_optional[cp_volume_threshold_change_req_message_at] = (cp_volume_threshold_change_req_message_base + 20 + cp_volume_threshold_change_req_message_at + 1) % 256; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> cp_volume_threshold_change_req_message_record.efid_optional[cp_volume_threshold_change_req_message_at] = (cp_volume_threshold_change_req_message_base + 26 + cp_volume_threshold_change_req_message_at + 1) % 256; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 2 -> cp_volume_threshold_change_req_message_record.risk_group_id[cp_volume_threshold_change_req_message_at] = (cp_volume_threshold_change_req_message_base + 30 + cp_volume_threshold_change_req_message_at + 1) % 256; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 8 -> cp_volume_threshold_change_req_message_record.volume[cp_volume_threshold_change_req_message_at] = (cp_volume_threshold_change_req_message_base + 32 + cp_volume_threshold_change_req_message_at + 1) % 256; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> cp_volume_threshold_change_req_message_record.period_in_milli_seconds[cp_volume_threshold_change_req_message_at] = (cp_volume_threshold_change_req_message_base + 40 + cp_volume_threshold_change_req_message_at + 1) % 256; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Volume Threshold Change Req Message to the wire, 44 bytes from where the cursor stands */
inline encode_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_record) {
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 20 -> wire[at] = cp_volume_threshold_change_req_message_record.cl_ord_id[cp_volume_threshold_change_req_message_at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 6 -> wire[at] = cp_volume_threshold_change_req_message_record.underlier_optional[cp_volume_threshold_change_req_message_at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> wire[at] = cp_volume_threshold_change_req_message_record.efid_optional[cp_volume_threshold_change_req_message_at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 2 -> wire[at] = cp_volume_threshold_change_req_message_record.risk_group_id[cp_volume_threshold_change_req_message_at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 8 -> wire[at] = cp_volume_threshold_change_req_message_record.volume[cp_volume_threshold_change_req_message_at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> wire[at] = cp_volume_threshold_change_req_message_record.period_in_milli_seconds[cp_volume_threshold_change_req_message_at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Volume Threshold Change Req Message off the wire, 44 bytes from where the cursor stands */
inline decode_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_record) {
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 20 -> cp_volume_threshold_change_req_message_record.cl_ord_id[cp_volume_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 6 -> cp_volume_threshold_change_req_message_record.underlier_optional[cp_volume_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> cp_volume_threshold_change_req_message_record.efid_optional[cp_volume_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 2 -> cp_volume_threshold_change_req_message_record.risk_group_id[cp_volume_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 8 -> cp_volume_threshold_change_req_message_record.volume[cp_volume_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> cp_volume_threshold_change_req_message_record.period_in_milli_seconds[cp_volume_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Volume Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_read, cp_volume_threshold_change_req_message_written) {
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 20 -> assert(cp_volume_threshold_change_req_message_read.cl_ord_id[cp_volume_threshold_change_req_message_at] == cp_volume_threshold_change_req_message_written.cl_ord_id[cp_volume_threshold_change_req_message_at]); cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 6 -> assert(cp_volume_threshold_change_req_message_read.underlier_optional[cp_volume_threshold_change_req_message_at] == cp_volume_threshold_change_req_message_written.underlier_optional[cp_volume_threshold_change_req_message_at]); cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> assert(cp_volume_threshold_change_req_message_read.efid_optional[cp_volume_threshold_change_req_message_at] == cp_volume_threshold_change_req_message_written.efid_optional[cp_volume_threshold_change_req_message_at]); cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 2 -> assert(cp_volume_threshold_change_req_message_read.risk_group_id[cp_volume_threshold_change_req_message_at] == cp_volume_threshold_change_req_message_written.risk_group_id[cp_volume_threshold_change_req_message_at]); cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 8 -> assert(cp_volume_threshold_change_req_message_read.volume[cp_volume_threshold_change_req_message_at] == cp_volume_threshold_change_req_message_written.volume[cp_volume_threshold_change_req_message_at]); cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_volume_threshold_change_req_message_at = 0;
  do
  :: cp_volume_threshold_change_req_message_at < 4 -> assert(cp_volume_threshold_change_req_message_read.period_in_milli_seconds[cp_volume_threshold_change_req_message_at] == cp_volume_threshold_change_req_message_written.period_in_milli_seconds[cp_volume_threshold_change_req_message_at]); cp_volume_threshold_change_req_message_at = cp_volume_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Executed Notional Threshold Change Req Message: 40 bytes ------------- */

/* CPExecutedNotionalThresholdChangeReqMessage */
typedef CpExecutedNotionalThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4];
  byte period_in_milli_seconds[4]
};

int cp_executed_notional_threshold_change_req_message_at;

/* every byte of Cp Executed Notional Threshold Change Req Message set to one value */
inline fill_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_record, cp_executed_notional_threshold_change_req_message_value) {
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 20 -> cp_executed_notional_threshold_change_req_message_record.cl_ord_id[cp_executed_notional_threshold_change_req_message_at] = cp_executed_notional_threshold_change_req_message_value; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 6 -> cp_executed_notional_threshold_change_req_message_record.underlier_optional[cp_executed_notional_threshold_change_req_message_at] = cp_executed_notional_threshold_change_req_message_value; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.efid_optional[cp_executed_notional_threshold_change_req_message_at] = cp_executed_notional_threshold_change_req_message_value; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 2 -> cp_executed_notional_threshold_change_req_message_record.risk_group_id[cp_executed_notional_threshold_change_req_message_at] = cp_executed_notional_threshold_change_req_message_value; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.price_in_dollars[cp_executed_notional_threshold_change_req_message_at] = cp_executed_notional_threshold_change_req_message_value; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.period_in_milli_seconds[cp_executed_notional_threshold_change_req_message_at] = cp_executed_notional_threshold_change_req_message_value; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Executed Notional Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_record, cp_executed_notional_threshold_change_req_message_base) {
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 20 -> cp_executed_notional_threshold_change_req_message_record.cl_ord_id[cp_executed_notional_threshold_change_req_message_at] = (cp_executed_notional_threshold_change_req_message_base + 0 + cp_executed_notional_threshold_change_req_message_at + 1) % 256; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 6 -> cp_executed_notional_threshold_change_req_message_record.underlier_optional[cp_executed_notional_threshold_change_req_message_at] = (cp_executed_notional_threshold_change_req_message_base + 20 + cp_executed_notional_threshold_change_req_message_at + 1) % 256; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.efid_optional[cp_executed_notional_threshold_change_req_message_at] = (cp_executed_notional_threshold_change_req_message_base + 26 + cp_executed_notional_threshold_change_req_message_at + 1) % 256; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 2 -> cp_executed_notional_threshold_change_req_message_record.risk_group_id[cp_executed_notional_threshold_change_req_message_at] = (cp_executed_notional_threshold_change_req_message_base + 30 + cp_executed_notional_threshold_change_req_message_at + 1) % 256; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.price_in_dollars[cp_executed_notional_threshold_change_req_message_at] = (cp_executed_notional_threshold_change_req_message_base + 32 + cp_executed_notional_threshold_change_req_message_at + 1) % 256; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.period_in_milli_seconds[cp_executed_notional_threshold_change_req_message_at] = (cp_executed_notional_threshold_change_req_message_base + 36 + cp_executed_notional_threshold_change_req_message_at + 1) % 256; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Executed Notional Threshold Change Req Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_record) {
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 20 -> wire[at] = cp_executed_notional_threshold_change_req_message_record.cl_ord_id[cp_executed_notional_threshold_change_req_message_at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 6 -> wire[at] = cp_executed_notional_threshold_change_req_message_record.underlier_optional[cp_executed_notional_threshold_change_req_message_at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_executed_notional_threshold_change_req_message_record.efid_optional[cp_executed_notional_threshold_change_req_message_at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 2 -> wire[at] = cp_executed_notional_threshold_change_req_message_record.risk_group_id[cp_executed_notional_threshold_change_req_message_at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_executed_notional_threshold_change_req_message_record.price_in_dollars[cp_executed_notional_threshold_change_req_message_at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_executed_notional_threshold_change_req_message_record.period_in_milli_seconds[cp_executed_notional_threshold_change_req_message_at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Executed Notional Threshold Change Req Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_record) {
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 20 -> cp_executed_notional_threshold_change_req_message_record.cl_ord_id[cp_executed_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 6 -> cp_executed_notional_threshold_change_req_message_record.underlier_optional[cp_executed_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.efid_optional[cp_executed_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 2 -> cp_executed_notional_threshold_change_req_message_record.risk_group_id[cp_executed_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.price_in_dollars[cp_executed_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> cp_executed_notional_threshold_change_req_message_record.period_in_milli_seconds[cp_executed_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Executed Notional Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_read, cp_executed_notional_threshold_change_req_message_written) {
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 20 -> assert(cp_executed_notional_threshold_change_req_message_read.cl_ord_id[cp_executed_notional_threshold_change_req_message_at] == cp_executed_notional_threshold_change_req_message_written.cl_ord_id[cp_executed_notional_threshold_change_req_message_at]); cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 6 -> assert(cp_executed_notional_threshold_change_req_message_read.underlier_optional[cp_executed_notional_threshold_change_req_message_at] == cp_executed_notional_threshold_change_req_message_written.underlier_optional[cp_executed_notional_threshold_change_req_message_at]); cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> assert(cp_executed_notional_threshold_change_req_message_read.efid_optional[cp_executed_notional_threshold_change_req_message_at] == cp_executed_notional_threshold_change_req_message_written.efid_optional[cp_executed_notional_threshold_change_req_message_at]); cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 2 -> assert(cp_executed_notional_threshold_change_req_message_read.risk_group_id[cp_executed_notional_threshold_change_req_message_at] == cp_executed_notional_threshold_change_req_message_written.risk_group_id[cp_executed_notional_threshold_change_req_message_at]); cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> assert(cp_executed_notional_threshold_change_req_message_read.price_in_dollars[cp_executed_notional_threshold_change_req_message_at] == cp_executed_notional_threshold_change_req_message_written.price_in_dollars[cp_executed_notional_threshold_change_req_message_at]); cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_executed_notional_threshold_change_req_message_at = 0;
  do
  :: cp_executed_notional_threshold_change_req_message_at < 4 -> assert(cp_executed_notional_threshold_change_req_message_read.period_in_milli_seconds[cp_executed_notional_threshold_change_req_message_at] == cp_executed_notional_threshold_change_req_message_written.period_in_milli_seconds[cp_executed_notional_threshold_change_req_message_at]); cp_executed_notional_threshold_change_req_message_at = cp_executed_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Total Executions Threshold Change Req Message: 40 bytes -------------- */

/* CPTotalExecutionsThresholdChangeReqMessage */
typedef CpTotalExecutionsThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte total_executions[4];
  byte period_in_milli_seconds[4]
};

int cp_total_executions_threshold_change_req_message_at;

/* every byte of Cp Total Executions Threshold Change Req Message set to one value */
inline fill_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_record, cp_total_executions_threshold_change_req_message_value) {
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 20 -> cp_total_executions_threshold_change_req_message_record.cl_ord_id[cp_total_executions_threshold_change_req_message_at] = cp_total_executions_threshold_change_req_message_value; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 6 -> cp_total_executions_threshold_change_req_message_record.underlier_optional[cp_total_executions_threshold_change_req_message_at] = cp_total_executions_threshold_change_req_message_value; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.efid_optional[cp_total_executions_threshold_change_req_message_at] = cp_total_executions_threshold_change_req_message_value; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 2 -> cp_total_executions_threshold_change_req_message_record.risk_group_id[cp_total_executions_threshold_change_req_message_at] = cp_total_executions_threshold_change_req_message_value; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.total_executions[cp_total_executions_threshold_change_req_message_at] = cp_total_executions_threshold_change_req_message_value; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.period_in_milli_seconds[cp_total_executions_threshold_change_req_message_at] = cp_total_executions_threshold_change_req_message_value; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Total Executions Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_record, cp_total_executions_threshold_change_req_message_base) {
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 20 -> cp_total_executions_threshold_change_req_message_record.cl_ord_id[cp_total_executions_threshold_change_req_message_at] = (cp_total_executions_threshold_change_req_message_base + 0 + cp_total_executions_threshold_change_req_message_at + 1) % 256; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 6 -> cp_total_executions_threshold_change_req_message_record.underlier_optional[cp_total_executions_threshold_change_req_message_at] = (cp_total_executions_threshold_change_req_message_base + 20 + cp_total_executions_threshold_change_req_message_at + 1) % 256; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.efid_optional[cp_total_executions_threshold_change_req_message_at] = (cp_total_executions_threshold_change_req_message_base + 26 + cp_total_executions_threshold_change_req_message_at + 1) % 256; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 2 -> cp_total_executions_threshold_change_req_message_record.risk_group_id[cp_total_executions_threshold_change_req_message_at] = (cp_total_executions_threshold_change_req_message_base + 30 + cp_total_executions_threshold_change_req_message_at + 1) % 256; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.total_executions[cp_total_executions_threshold_change_req_message_at] = (cp_total_executions_threshold_change_req_message_base + 32 + cp_total_executions_threshold_change_req_message_at + 1) % 256; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.period_in_milli_seconds[cp_total_executions_threshold_change_req_message_at] = (cp_total_executions_threshold_change_req_message_base + 36 + cp_total_executions_threshold_change_req_message_at + 1) % 256; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Total Executions Threshold Change Req Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_record) {
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 20 -> wire[at] = cp_total_executions_threshold_change_req_message_record.cl_ord_id[cp_total_executions_threshold_change_req_message_at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 6 -> wire[at] = cp_total_executions_threshold_change_req_message_record.underlier_optional[cp_total_executions_threshold_change_req_message_at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> wire[at] = cp_total_executions_threshold_change_req_message_record.efid_optional[cp_total_executions_threshold_change_req_message_at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 2 -> wire[at] = cp_total_executions_threshold_change_req_message_record.risk_group_id[cp_total_executions_threshold_change_req_message_at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> wire[at] = cp_total_executions_threshold_change_req_message_record.total_executions[cp_total_executions_threshold_change_req_message_at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> wire[at] = cp_total_executions_threshold_change_req_message_record.period_in_milli_seconds[cp_total_executions_threshold_change_req_message_at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Total Executions Threshold Change Req Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_record) {
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 20 -> cp_total_executions_threshold_change_req_message_record.cl_ord_id[cp_total_executions_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 6 -> cp_total_executions_threshold_change_req_message_record.underlier_optional[cp_total_executions_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.efid_optional[cp_total_executions_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 2 -> cp_total_executions_threshold_change_req_message_record.risk_group_id[cp_total_executions_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.total_executions[cp_total_executions_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> cp_total_executions_threshold_change_req_message_record.period_in_milli_seconds[cp_total_executions_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Total Executions Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_read, cp_total_executions_threshold_change_req_message_written) {
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 20 -> assert(cp_total_executions_threshold_change_req_message_read.cl_ord_id[cp_total_executions_threshold_change_req_message_at] == cp_total_executions_threshold_change_req_message_written.cl_ord_id[cp_total_executions_threshold_change_req_message_at]); cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 6 -> assert(cp_total_executions_threshold_change_req_message_read.underlier_optional[cp_total_executions_threshold_change_req_message_at] == cp_total_executions_threshold_change_req_message_written.underlier_optional[cp_total_executions_threshold_change_req_message_at]); cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> assert(cp_total_executions_threshold_change_req_message_read.efid_optional[cp_total_executions_threshold_change_req_message_at] == cp_total_executions_threshold_change_req_message_written.efid_optional[cp_total_executions_threshold_change_req_message_at]); cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 2 -> assert(cp_total_executions_threshold_change_req_message_read.risk_group_id[cp_total_executions_threshold_change_req_message_at] == cp_total_executions_threshold_change_req_message_written.risk_group_id[cp_total_executions_threshold_change_req_message_at]); cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> assert(cp_total_executions_threshold_change_req_message_read.total_executions[cp_total_executions_threshold_change_req_message_at] == cp_total_executions_threshold_change_req_message_written.total_executions[cp_total_executions_threshold_change_req_message_at]); cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_total_executions_threshold_change_req_message_at = 0;
  do
  :: cp_total_executions_threshold_change_req_message_at < 4 -> assert(cp_total_executions_threshold_change_req_message_read.period_in_milli_seconds[cp_total_executions_threshold_change_req_message_at] == cp_total_executions_threshold_change_req_message_written.period_in_milli_seconds[cp_total_executions_threshold_change_req_message_at]); cp_total_executions_threshold_change_req_message_at = cp_total_executions_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Percent Outstanding Contracts Threshold Change Req Message: 38 bytes ---- */

/* CPPercentOutstandingContractsThresholdChangeReqMessage */
typedef CpPercentOutstandingContractsThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte percent[4];
  byte period_in_milli_seconds[4]
};

int cp_percent_outstanding_contracts_threshold_change_req_message_at;

/* every byte of Cp Percent Outstanding Contracts Threshold Change Req Message set to one value */
inline fill_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_record, cp_percent_outstanding_contracts_threshold_change_req_message_value) {
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 20 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.cl_ord_id[cp_percent_outstanding_contracts_threshold_change_req_message_at] = cp_percent_outstanding_contracts_threshold_change_req_message_value; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 6 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] = cp_percent_outstanding_contracts_threshold_change_req_message_value; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] = cp_percent_outstanding_contracts_threshold_change_req_message_value; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.percent[cp_percent_outstanding_contracts_threshold_change_req_message_at] = cp_percent_outstanding_contracts_threshold_change_req_message_value; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_change_req_message_at] = cp_percent_outstanding_contracts_threshold_change_req_message_value; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Percent Outstanding Contracts Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_record, cp_percent_outstanding_contracts_threshold_change_req_message_base) {
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 20 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.cl_ord_id[cp_percent_outstanding_contracts_threshold_change_req_message_at] = (cp_percent_outstanding_contracts_threshold_change_req_message_base + 0 + cp_percent_outstanding_contracts_threshold_change_req_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 6 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] = (cp_percent_outstanding_contracts_threshold_change_req_message_base + 20 + cp_percent_outstanding_contracts_threshold_change_req_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] = (cp_percent_outstanding_contracts_threshold_change_req_message_base + 26 + cp_percent_outstanding_contracts_threshold_change_req_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.percent[cp_percent_outstanding_contracts_threshold_change_req_message_at] = (cp_percent_outstanding_contracts_threshold_change_req_message_base + 30 + cp_percent_outstanding_contracts_threshold_change_req_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_change_req_message_at] = (cp_percent_outstanding_contracts_threshold_change_req_message_base + 34 + cp_percent_outstanding_contracts_threshold_change_req_message_at + 1) % 256; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Percent Outstanding Contracts Threshold Change Req Message to the wire, 38 bytes from where the cursor stands */
inline encode_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_record) {
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 20 -> wire[at] = cp_percent_outstanding_contracts_threshold_change_req_message_record.cl_ord_id[cp_percent_outstanding_contracts_threshold_change_req_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 6 -> wire[at] = cp_percent_outstanding_contracts_threshold_change_req_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> wire[at] = cp_percent_outstanding_contracts_threshold_change_req_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> wire[at] = cp_percent_outstanding_contracts_threshold_change_req_message_record.percent[cp_percent_outstanding_contracts_threshold_change_req_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> wire[at] = cp_percent_outstanding_contracts_threshold_change_req_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_change_req_message_at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Percent Outstanding Contracts Threshold Change Req Message off the wire, 38 bytes from where the cursor stands */
inline decode_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_record) {
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 20 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.cl_ord_id[cp_percent_outstanding_contracts_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 6 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.underlier_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.efid_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.percent[cp_percent_outstanding_contracts_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> cp_percent_outstanding_contracts_threshold_change_req_message_record.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Percent Outstanding Contracts Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_read, cp_percent_outstanding_contracts_threshold_change_req_message_written) {
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 20 -> assert(cp_percent_outstanding_contracts_threshold_change_req_message_read.cl_ord_id[cp_percent_outstanding_contracts_threshold_change_req_message_at] == cp_percent_outstanding_contracts_threshold_change_req_message_written.cl_ord_id[cp_percent_outstanding_contracts_threshold_change_req_message_at]); cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 6 -> assert(cp_percent_outstanding_contracts_threshold_change_req_message_read.underlier_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] == cp_percent_outstanding_contracts_threshold_change_req_message_written.underlier_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at]); cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> assert(cp_percent_outstanding_contracts_threshold_change_req_message_read.efid_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at] == cp_percent_outstanding_contracts_threshold_change_req_message_written.efid_optional[cp_percent_outstanding_contracts_threshold_change_req_message_at]); cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> assert(cp_percent_outstanding_contracts_threshold_change_req_message_read.percent[cp_percent_outstanding_contracts_threshold_change_req_message_at] == cp_percent_outstanding_contracts_threshold_change_req_message_written.percent[cp_percent_outstanding_contracts_threshold_change_req_message_at]); cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_percent_outstanding_contracts_threshold_change_req_message_at = 0;
  do
  :: cp_percent_outstanding_contracts_threshold_change_req_message_at < 4 -> assert(cp_percent_outstanding_contracts_threshold_change_req_message_read.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_change_req_message_at] == cp_percent_outstanding_contracts_threshold_change_req_message_written.period_in_milli_seconds[cp_percent_outstanding_contracts_threshold_change_req_message_at]); cp_percent_outstanding_contracts_threshold_change_req_message_at = cp_percent_outstanding_contracts_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Breach Count Threshold Change Req Message: 40 bytes ------------------ */

/* CPBreachCountThresholdChangeReqMessage */
typedef CpBreachCountThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte count[4];
  byte period_in_milli_seconds[4]
};

int cp_breach_count_threshold_change_req_message_at;

/* every byte of Cp Breach Count Threshold Change Req Message set to one value */
inline fill_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_record, cp_breach_count_threshold_change_req_message_value) {
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 20 -> cp_breach_count_threshold_change_req_message_record.cl_ord_id[cp_breach_count_threshold_change_req_message_at] = cp_breach_count_threshold_change_req_message_value; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 6 -> cp_breach_count_threshold_change_req_message_record.underlier_optional[cp_breach_count_threshold_change_req_message_at] = cp_breach_count_threshold_change_req_message_value; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.efid_optional[cp_breach_count_threshold_change_req_message_at] = cp_breach_count_threshold_change_req_message_value; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 2 -> cp_breach_count_threshold_change_req_message_record.risk_group_id[cp_breach_count_threshold_change_req_message_at] = cp_breach_count_threshold_change_req_message_value; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.count[cp_breach_count_threshold_change_req_message_at] = cp_breach_count_threshold_change_req_message_value; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.period_in_milli_seconds[cp_breach_count_threshold_change_req_message_at] = cp_breach_count_threshold_change_req_message_value; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Breach Count Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_record, cp_breach_count_threshold_change_req_message_base) {
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 20 -> cp_breach_count_threshold_change_req_message_record.cl_ord_id[cp_breach_count_threshold_change_req_message_at] = (cp_breach_count_threshold_change_req_message_base + 0 + cp_breach_count_threshold_change_req_message_at + 1) % 256; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 6 -> cp_breach_count_threshold_change_req_message_record.underlier_optional[cp_breach_count_threshold_change_req_message_at] = (cp_breach_count_threshold_change_req_message_base + 20 + cp_breach_count_threshold_change_req_message_at + 1) % 256; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.efid_optional[cp_breach_count_threshold_change_req_message_at] = (cp_breach_count_threshold_change_req_message_base + 26 + cp_breach_count_threshold_change_req_message_at + 1) % 256; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 2 -> cp_breach_count_threshold_change_req_message_record.risk_group_id[cp_breach_count_threshold_change_req_message_at] = (cp_breach_count_threshold_change_req_message_base + 30 + cp_breach_count_threshold_change_req_message_at + 1) % 256; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.count[cp_breach_count_threshold_change_req_message_at] = (cp_breach_count_threshold_change_req_message_base + 32 + cp_breach_count_threshold_change_req_message_at + 1) % 256; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.period_in_milli_seconds[cp_breach_count_threshold_change_req_message_at] = (cp_breach_count_threshold_change_req_message_base + 36 + cp_breach_count_threshold_change_req_message_at + 1) % 256; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Breach Count Threshold Change Req Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_record) {
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 20 -> wire[at] = cp_breach_count_threshold_change_req_message_record.cl_ord_id[cp_breach_count_threshold_change_req_message_at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 6 -> wire[at] = cp_breach_count_threshold_change_req_message_record.underlier_optional[cp_breach_count_threshold_change_req_message_at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> wire[at] = cp_breach_count_threshold_change_req_message_record.efid_optional[cp_breach_count_threshold_change_req_message_at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 2 -> wire[at] = cp_breach_count_threshold_change_req_message_record.risk_group_id[cp_breach_count_threshold_change_req_message_at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> wire[at] = cp_breach_count_threshold_change_req_message_record.count[cp_breach_count_threshold_change_req_message_at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> wire[at] = cp_breach_count_threshold_change_req_message_record.period_in_milli_seconds[cp_breach_count_threshold_change_req_message_at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Breach Count Threshold Change Req Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_record) {
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 20 -> cp_breach_count_threshold_change_req_message_record.cl_ord_id[cp_breach_count_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 6 -> cp_breach_count_threshold_change_req_message_record.underlier_optional[cp_breach_count_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.efid_optional[cp_breach_count_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 2 -> cp_breach_count_threshold_change_req_message_record.risk_group_id[cp_breach_count_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.count[cp_breach_count_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> cp_breach_count_threshold_change_req_message_record.period_in_milli_seconds[cp_breach_count_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Breach Count Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_read, cp_breach_count_threshold_change_req_message_written) {
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 20 -> assert(cp_breach_count_threshold_change_req_message_read.cl_ord_id[cp_breach_count_threshold_change_req_message_at] == cp_breach_count_threshold_change_req_message_written.cl_ord_id[cp_breach_count_threshold_change_req_message_at]); cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 6 -> assert(cp_breach_count_threshold_change_req_message_read.underlier_optional[cp_breach_count_threshold_change_req_message_at] == cp_breach_count_threshold_change_req_message_written.underlier_optional[cp_breach_count_threshold_change_req_message_at]); cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> assert(cp_breach_count_threshold_change_req_message_read.efid_optional[cp_breach_count_threshold_change_req_message_at] == cp_breach_count_threshold_change_req_message_written.efid_optional[cp_breach_count_threshold_change_req_message_at]); cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 2 -> assert(cp_breach_count_threshold_change_req_message_read.risk_group_id[cp_breach_count_threshold_change_req_message_at] == cp_breach_count_threshold_change_req_message_written.risk_group_id[cp_breach_count_threshold_change_req_message_at]); cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> assert(cp_breach_count_threshold_change_req_message_read.count[cp_breach_count_threshold_change_req_message_at] == cp_breach_count_threshold_change_req_message_written.count[cp_breach_count_threshold_change_req_message_at]); cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_breach_count_threshold_change_req_message_at = 0;
  do
  :: cp_breach_count_threshold_change_req_message_at < 4 -> assert(cp_breach_count_threshold_change_req_message_read.period_in_milli_seconds[cp_breach_count_threshold_change_req_message_at] == cp_breach_count_threshold_change_req_message_written.period_in_milli_seconds[cp_breach_count_threshold_change_req_message_at]); cp_breach_count_threshold_change_req_message_at = cp_breach_count_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Manual Cp Breach Trigger Req Message: 33 bytes -------------------------- */

/* ManualCPBreachTriggerReqMessage */
typedef ManualCpBreachTriggerReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte send_cancels
};

int manual_cp_breach_trigger_req_message_at;

/* every byte of Manual Cp Breach Trigger Req Message set to one value */
inline fill_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_record, manual_cp_breach_trigger_req_message_value) {
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 20 -> manual_cp_breach_trigger_req_message_record.cl_ord_id[manual_cp_breach_trigger_req_message_at] = manual_cp_breach_trigger_req_message_value; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 6 -> manual_cp_breach_trigger_req_message_record.underlier_optional[manual_cp_breach_trigger_req_message_at] = manual_cp_breach_trigger_req_message_value; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 4 -> manual_cp_breach_trigger_req_message_record.efid_optional[manual_cp_breach_trigger_req_message_at] = manual_cp_breach_trigger_req_message_value; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 2 -> manual_cp_breach_trigger_req_message_record.risk_group_id[manual_cp_breach_trigger_req_message_at] = manual_cp_breach_trigger_req_message_value; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_record.send_cancels = manual_cp_breach_trigger_req_message_value;
  skip
}

/* each byte of Manual Cp Breach Trigger Req Message set to where it lies, so a field read out of place says so */
inline ramp_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_record, manual_cp_breach_trigger_req_message_base) {
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 20 -> manual_cp_breach_trigger_req_message_record.cl_ord_id[manual_cp_breach_trigger_req_message_at] = (manual_cp_breach_trigger_req_message_base + 0 + manual_cp_breach_trigger_req_message_at + 1) % 256; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 6 -> manual_cp_breach_trigger_req_message_record.underlier_optional[manual_cp_breach_trigger_req_message_at] = (manual_cp_breach_trigger_req_message_base + 20 + manual_cp_breach_trigger_req_message_at + 1) % 256; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 4 -> manual_cp_breach_trigger_req_message_record.efid_optional[manual_cp_breach_trigger_req_message_at] = (manual_cp_breach_trigger_req_message_base + 26 + manual_cp_breach_trigger_req_message_at + 1) % 256; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 2 -> manual_cp_breach_trigger_req_message_record.risk_group_id[manual_cp_breach_trigger_req_message_at] = (manual_cp_breach_trigger_req_message_base + 30 + manual_cp_breach_trigger_req_message_at + 1) % 256; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_record.send_cancels = (manual_cp_breach_trigger_req_message_base + 32 + 1) % 256;
  skip
}

/* Manual Cp Breach Trigger Req Message to the wire, 33 bytes from where the cursor stands */
inline encode_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_record) {
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 20 -> wire[at] = manual_cp_breach_trigger_req_message_record.cl_ord_id[manual_cp_breach_trigger_req_message_at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 6 -> wire[at] = manual_cp_breach_trigger_req_message_record.underlier_optional[manual_cp_breach_trigger_req_message_at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 4 -> wire[at] = manual_cp_breach_trigger_req_message_record.efid_optional[manual_cp_breach_trigger_req_message_at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 2 -> wire[at] = manual_cp_breach_trigger_req_message_record.risk_group_id[manual_cp_breach_trigger_req_message_at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  wire[at] = manual_cp_breach_trigger_req_message_record.send_cancels; at = at + 1;
  skip
}

/* Manual Cp Breach Trigger Req Message off the wire, 33 bytes from where the cursor stands */
inline decode_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_record) {
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 20 -> manual_cp_breach_trigger_req_message_record.cl_ord_id[manual_cp_breach_trigger_req_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 6 -> manual_cp_breach_trigger_req_message_record.underlier_optional[manual_cp_breach_trigger_req_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 4 -> manual_cp_breach_trigger_req_message_record.efid_optional[manual_cp_breach_trigger_req_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 2 -> manual_cp_breach_trigger_req_message_record.risk_group_id[manual_cp_breach_trigger_req_message_at] = wire[at]; at = at + 1; manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_record.send_cancels = wire[at]; at = at + 1;
  skip
}

/* what was read of Manual Cp Breach Trigger Req Message is what was written, byte for byte */
inline equal_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_read, manual_cp_breach_trigger_req_message_written) {
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 20 -> assert(manual_cp_breach_trigger_req_message_read.cl_ord_id[manual_cp_breach_trigger_req_message_at] == manual_cp_breach_trigger_req_message_written.cl_ord_id[manual_cp_breach_trigger_req_message_at]); manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 6 -> assert(manual_cp_breach_trigger_req_message_read.underlier_optional[manual_cp_breach_trigger_req_message_at] == manual_cp_breach_trigger_req_message_written.underlier_optional[manual_cp_breach_trigger_req_message_at]); manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 4 -> assert(manual_cp_breach_trigger_req_message_read.efid_optional[manual_cp_breach_trigger_req_message_at] == manual_cp_breach_trigger_req_message_written.efid_optional[manual_cp_breach_trigger_req_message_at]); manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  manual_cp_breach_trigger_req_message_at = 0;
  do
  :: manual_cp_breach_trigger_req_message_at < 2 -> assert(manual_cp_breach_trigger_req_message_read.risk_group_id[manual_cp_breach_trigger_req_message_at] == manual_cp_breach_trigger_req_message_written.risk_group_id[manual_cp_breach_trigger_req_message_at]); manual_cp_breach_trigger_req_message_at = manual_cp_breach_trigger_req_message_at + 1
  :: else -> break
  od;
  assert(manual_cp_breach_trigger_req_message_read.send_cancels == manual_cp_breach_trigger_req_message_written.send_cancels);
  skip
}

/* ---- Cp Clear Breach Req Message: 28 bytes ----------------------------------- */

/* CPClearBreachReqMessage */
typedef CpClearBreachReqMessage {
  byte cl_ord_id[20];
  byte breach_id[8]
};

int cp_clear_breach_req_message_at;

/* every byte of Cp Clear Breach Req Message set to one value */
inline fill_cp_clear_breach_req_message(cp_clear_breach_req_message_record, cp_clear_breach_req_message_value) {
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 20 -> cp_clear_breach_req_message_record.cl_ord_id[cp_clear_breach_req_message_at] = cp_clear_breach_req_message_value; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 8 -> cp_clear_breach_req_message_record.breach_id[cp_clear_breach_req_message_at] = cp_clear_breach_req_message_value; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Clear Breach Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_clear_breach_req_message(cp_clear_breach_req_message_record, cp_clear_breach_req_message_base) {
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 20 -> cp_clear_breach_req_message_record.cl_ord_id[cp_clear_breach_req_message_at] = (cp_clear_breach_req_message_base + 0 + cp_clear_breach_req_message_at + 1) % 256; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 8 -> cp_clear_breach_req_message_record.breach_id[cp_clear_breach_req_message_at] = (cp_clear_breach_req_message_base + 20 + cp_clear_breach_req_message_at + 1) % 256; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Clear Breach Req Message to the wire, 28 bytes from where the cursor stands */
inline encode_cp_clear_breach_req_message(cp_clear_breach_req_message_record) {
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 20 -> wire[at] = cp_clear_breach_req_message_record.cl_ord_id[cp_clear_breach_req_message_at]; at = at + 1; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 8 -> wire[at] = cp_clear_breach_req_message_record.breach_id[cp_clear_breach_req_message_at]; at = at + 1; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Clear Breach Req Message off the wire, 28 bytes from where the cursor stands */
inline decode_cp_clear_breach_req_message(cp_clear_breach_req_message_record) {
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 20 -> cp_clear_breach_req_message_record.cl_ord_id[cp_clear_breach_req_message_at] = wire[at]; at = at + 1; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 8 -> cp_clear_breach_req_message_record.breach_id[cp_clear_breach_req_message_at] = wire[at]; at = at + 1; cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Clear Breach Req Message is what was written, byte for byte */
inline equal_cp_clear_breach_req_message(cp_clear_breach_req_message_read, cp_clear_breach_req_message_written) {
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 20 -> assert(cp_clear_breach_req_message_read.cl_ord_id[cp_clear_breach_req_message_at] == cp_clear_breach_req_message_written.cl_ord_id[cp_clear_breach_req_message_at]); cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  cp_clear_breach_req_message_at = 0;
  do
  :: cp_clear_breach_req_message_at < 8 -> assert(cp_clear_breach_req_message_read.breach_id[cp_clear_breach_req_message_at] == cp_clear_breach_req_message_written.breach_id[cp_clear_breach_req_message_at]); cp_clear_breach_req_message_at = cp_clear_breach_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Order Allow Iso Orders Change Req Message: 33 bytes -------------- */

/* SingleOrderAllowISOOrdersChangeReqMessage */
typedef SingleOrderAllowIsoOrdersChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte allow_iso_orders
};

int single_order_allow_iso_orders_change_req_message_at;

/* every byte of Single Order Allow Iso Orders Change Req Message set to one value */
inline fill_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_record, single_order_allow_iso_orders_change_req_message_value) {
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 20 -> single_order_allow_iso_orders_change_req_message_record.cl_ord_id[single_order_allow_iso_orders_change_req_message_at] = single_order_allow_iso_orders_change_req_message_value; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 6 -> single_order_allow_iso_orders_change_req_message_record.underlier_optional[single_order_allow_iso_orders_change_req_message_at] = single_order_allow_iso_orders_change_req_message_value; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 4 -> single_order_allow_iso_orders_change_req_message_record.efid_optional[single_order_allow_iso_orders_change_req_message_at] = single_order_allow_iso_orders_change_req_message_value; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 2 -> single_order_allow_iso_orders_change_req_message_record.risk_group_id[single_order_allow_iso_orders_change_req_message_at] = single_order_allow_iso_orders_change_req_message_value; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_record.allow_iso_orders = single_order_allow_iso_orders_change_req_message_value;
  skip
}

/* each byte of Single Order Allow Iso Orders Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_record, single_order_allow_iso_orders_change_req_message_base) {
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 20 -> single_order_allow_iso_orders_change_req_message_record.cl_ord_id[single_order_allow_iso_orders_change_req_message_at] = (single_order_allow_iso_orders_change_req_message_base + 0 + single_order_allow_iso_orders_change_req_message_at + 1) % 256; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 6 -> single_order_allow_iso_orders_change_req_message_record.underlier_optional[single_order_allow_iso_orders_change_req_message_at] = (single_order_allow_iso_orders_change_req_message_base + 20 + single_order_allow_iso_orders_change_req_message_at + 1) % 256; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 4 -> single_order_allow_iso_orders_change_req_message_record.efid_optional[single_order_allow_iso_orders_change_req_message_at] = (single_order_allow_iso_orders_change_req_message_base + 26 + single_order_allow_iso_orders_change_req_message_at + 1) % 256; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 2 -> single_order_allow_iso_orders_change_req_message_record.risk_group_id[single_order_allow_iso_orders_change_req_message_at] = (single_order_allow_iso_orders_change_req_message_base + 30 + single_order_allow_iso_orders_change_req_message_at + 1) % 256; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_record.allow_iso_orders = (single_order_allow_iso_orders_change_req_message_base + 32 + 1) % 256;
  skip
}

/* Single Order Allow Iso Orders Change Req Message to the wire, 33 bytes from where the cursor stands */
inline encode_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_record) {
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 20 -> wire[at] = single_order_allow_iso_orders_change_req_message_record.cl_ord_id[single_order_allow_iso_orders_change_req_message_at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 6 -> wire[at] = single_order_allow_iso_orders_change_req_message_record.underlier_optional[single_order_allow_iso_orders_change_req_message_at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 4 -> wire[at] = single_order_allow_iso_orders_change_req_message_record.efid_optional[single_order_allow_iso_orders_change_req_message_at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 2 -> wire[at] = single_order_allow_iso_orders_change_req_message_record.risk_group_id[single_order_allow_iso_orders_change_req_message_at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  wire[at] = single_order_allow_iso_orders_change_req_message_record.allow_iso_orders; at = at + 1;
  skip
}

/* Single Order Allow Iso Orders Change Req Message off the wire, 33 bytes from where the cursor stands */
inline decode_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_record) {
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 20 -> single_order_allow_iso_orders_change_req_message_record.cl_ord_id[single_order_allow_iso_orders_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 6 -> single_order_allow_iso_orders_change_req_message_record.underlier_optional[single_order_allow_iso_orders_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 4 -> single_order_allow_iso_orders_change_req_message_record.efid_optional[single_order_allow_iso_orders_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 2 -> single_order_allow_iso_orders_change_req_message_record.risk_group_id[single_order_allow_iso_orders_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_record.allow_iso_orders = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Order Allow Iso Orders Change Req Message is what was written, byte for byte */
inline equal_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_read, single_order_allow_iso_orders_change_req_message_written) {
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 20 -> assert(single_order_allow_iso_orders_change_req_message_read.cl_ord_id[single_order_allow_iso_orders_change_req_message_at] == single_order_allow_iso_orders_change_req_message_written.cl_ord_id[single_order_allow_iso_orders_change_req_message_at]); single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 6 -> assert(single_order_allow_iso_orders_change_req_message_read.underlier_optional[single_order_allow_iso_orders_change_req_message_at] == single_order_allow_iso_orders_change_req_message_written.underlier_optional[single_order_allow_iso_orders_change_req_message_at]); single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 4 -> assert(single_order_allow_iso_orders_change_req_message_read.efid_optional[single_order_allow_iso_orders_change_req_message_at] == single_order_allow_iso_orders_change_req_message_written.efid_optional[single_order_allow_iso_orders_change_req_message_at]); single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_iso_orders_change_req_message_at = 0;
  do
  :: single_order_allow_iso_orders_change_req_message_at < 2 -> assert(single_order_allow_iso_orders_change_req_message_read.risk_group_id[single_order_allow_iso_orders_change_req_message_at] == single_order_allow_iso_orders_change_req_message_written.risk_group_id[single_order_allow_iso_orders_change_req_message_at]); single_order_allow_iso_orders_change_req_message_at = single_order_allow_iso_orders_change_req_message_at + 1
  :: else -> break
  od;
  assert(single_order_allow_iso_orders_change_req_message_read.allow_iso_orders == single_order_allow_iso_orders_change_req_message_written.allow_iso_orders);
  skip
}

/* ---- Single Order Allow Orders In Crossed Market Change Req Message: 33 bytes ---- */

/* SingleOrderAllowOrdersInCrossedMarketChangeReqMessage */
typedef SingleOrderAllowOrdersInCrossedMarketChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte allow_orders
};

int single_order_allow_orders_in_crossed_market_change_req_message_at;

/* every byte of Single Order Allow Orders In Crossed Market Change Req Message set to one value */
inline fill_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_record, single_order_allow_orders_in_crossed_market_change_req_message_value) {
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 20 -> single_order_allow_orders_in_crossed_market_change_req_message_record.cl_ord_id[single_order_allow_orders_in_crossed_market_change_req_message_at] = single_order_allow_orders_in_crossed_market_change_req_message_value; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 6 -> single_order_allow_orders_in_crossed_market_change_req_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] = single_order_allow_orders_in_crossed_market_change_req_message_value; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 4 -> single_order_allow_orders_in_crossed_market_change_req_message_record.efid_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] = single_order_allow_orders_in_crossed_market_change_req_message_value; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 2 -> single_order_allow_orders_in_crossed_market_change_req_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_change_req_message_at] = single_order_allow_orders_in_crossed_market_change_req_message_value; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_record.allow_orders = single_order_allow_orders_in_crossed_market_change_req_message_value;
  skip
}

/* each byte of Single Order Allow Orders In Crossed Market Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_record, single_order_allow_orders_in_crossed_market_change_req_message_base) {
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 20 -> single_order_allow_orders_in_crossed_market_change_req_message_record.cl_ord_id[single_order_allow_orders_in_crossed_market_change_req_message_at] = (single_order_allow_orders_in_crossed_market_change_req_message_base + 0 + single_order_allow_orders_in_crossed_market_change_req_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 6 -> single_order_allow_orders_in_crossed_market_change_req_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] = (single_order_allow_orders_in_crossed_market_change_req_message_base + 20 + single_order_allow_orders_in_crossed_market_change_req_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 4 -> single_order_allow_orders_in_crossed_market_change_req_message_record.efid_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] = (single_order_allow_orders_in_crossed_market_change_req_message_base + 26 + single_order_allow_orders_in_crossed_market_change_req_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 2 -> single_order_allow_orders_in_crossed_market_change_req_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_change_req_message_at] = (single_order_allow_orders_in_crossed_market_change_req_message_base + 30 + single_order_allow_orders_in_crossed_market_change_req_message_at + 1) % 256; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_record.allow_orders = (single_order_allow_orders_in_crossed_market_change_req_message_base + 32 + 1) % 256;
  skip
}

/* Single Order Allow Orders In Crossed Market Change Req Message to the wire, 33 bytes from where the cursor stands */
inline encode_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_record) {
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 20 -> wire[at] = single_order_allow_orders_in_crossed_market_change_req_message_record.cl_ord_id[single_order_allow_orders_in_crossed_market_change_req_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 6 -> wire[at] = single_order_allow_orders_in_crossed_market_change_req_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_change_req_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 4 -> wire[at] = single_order_allow_orders_in_crossed_market_change_req_message_record.efid_optional[single_order_allow_orders_in_crossed_market_change_req_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 2 -> wire[at] = single_order_allow_orders_in_crossed_market_change_req_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_change_req_message_at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  wire[at] = single_order_allow_orders_in_crossed_market_change_req_message_record.allow_orders; at = at + 1;
  skip
}

/* Single Order Allow Orders In Crossed Market Change Req Message off the wire, 33 bytes from where the cursor stands */
inline decode_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_record) {
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 20 -> single_order_allow_orders_in_crossed_market_change_req_message_record.cl_ord_id[single_order_allow_orders_in_crossed_market_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 6 -> single_order_allow_orders_in_crossed_market_change_req_message_record.underlier_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 4 -> single_order_allow_orders_in_crossed_market_change_req_message_record.efid_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 2 -> single_order_allow_orders_in_crossed_market_change_req_message_record.risk_group_id[single_order_allow_orders_in_crossed_market_change_req_message_at] = wire[at]; at = at + 1; single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_record.allow_orders = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Order Allow Orders In Crossed Market Change Req Message is what was written, byte for byte */
inline equal_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_read, single_order_allow_orders_in_crossed_market_change_req_message_written) {
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 20 -> assert(single_order_allow_orders_in_crossed_market_change_req_message_read.cl_ord_id[single_order_allow_orders_in_crossed_market_change_req_message_at] == single_order_allow_orders_in_crossed_market_change_req_message_written.cl_ord_id[single_order_allow_orders_in_crossed_market_change_req_message_at]); single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 6 -> assert(single_order_allow_orders_in_crossed_market_change_req_message_read.underlier_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] == single_order_allow_orders_in_crossed_market_change_req_message_written.underlier_optional[single_order_allow_orders_in_crossed_market_change_req_message_at]); single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 4 -> assert(single_order_allow_orders_in_crossed_market_change_req_message_read.efid_optional[single_order_allow_orders_in_crossed_market_change_req_message_at] == single_order_allow_orders_in_crossed_market_change_req_message_written.efid_optional[single_order_allow_orders_in_crossed_market_change_req_message_at]); single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  single_order_allow_orders_in_crossed_market_change_req_message_at = 0;
  do
  :: single_order_allow_orders_in_crossed_market_change_req_message_at < 2 -> assert(single_order_allow_orders_in_crossed_market_change_req_message_read.risk_group_id[single_order_allow_orders_in_crossed_market_change_req_message_at] == single_order_allow_orders_in_crossed_market_change_req_message_written.risk_group_id[single_order_allow_orders_in_crossed_market_change_req_message_at]); single_order_allow_orders_in_crossed_market_change_req_message_at = single_order_allow_orders_in_crossed_market_change_req_message_at + 1
  :: else -> break
  od;
  assert(single_order_allow_orders_in_crossed_market_change_req_message_read.allow_orders == single_order_allow_orders_in_crossed_market_change_req_message_written.allow_orders);
  skip
}

/* ---- Single Order Max Notional Change Req Message: 36 bytes ------------------ */

/* SingleOrderMaxNotionalChangeReqMessage */
typedef SingleOrderMaxNotionalChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_notional_in_dollars[4]
};

int single_order_max_notional_change_req_message_at;

/* every byte of Single Order Max Notional Change Req Message set to one value */
inline fill_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_record, single_order_max_notional_change_req_message_value) {
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 20 -> single_order_max_notional_change_req_message_record.cl_ord_id[single_order_max_notional_change_req_message_at] = single_order_max_notional_change_req_message_value; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 6 -> single_order_max_notional_change_req_message_record.underlier_optional[single_order_max_notional_change_req_message_at] = single_order_max_notional_change_req_message_value; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> single_order_max_notional_change_req_message_record.efid_optional[single_order_max_notional_change_req_message_at] = single_order_max_notional_change_req_message_value; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 2 -> single_order_max_notional_change_req_message_record.risk_group_id[single_order_max_notional_change_req_message_at] = single_order_max_notional_change_req_message_value; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> single_order_max_notional_change_req_message_record.max_notional_in_dollars[single_order_max_notional_change_req_message_at] = single_order_max_notional_change_req_message_value; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Order Max Notional Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_record, single_order_max_notional_change_req_message_base) {
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 20 -> single_order_max_notional_change_req_message_record.cl_ord_id[single_order_max_notional_change_req_message_at] = (single_order_max_notional_change_req_message_base + 0 + single_order_max_notional_change_req_message_at + 1) % 256; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 6 -> single_order_max_notional_change_req_message_record.underlier_optional[single_order_max_notional_change_req_message_at] = (single_order_max_notional_change_req_message_base + 20 + single_order_max_notional_change_req_message_at + 1) % 256; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> single_order_max_notional_change_req_message_record.efid_optional[single_order_max_notional_change_req_message_at] = (single_order_max_notional_change_req_message_base + 26 + single_order_max_notional_change_req_message_at + 1) % 256; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 2 -> single_order_max_notional_change_req_message_record.risk_group_id[single_order_max_notional_change_req_message_at] = (single_order_max_notional_change_req_message_base + 30 + single_order_max_notional_change_req_message_at + 1) % 256; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> single_order_max_notional_change_req_message_record.max_notional_in_dollars[single_order_max_notional_change_req_message_at] = (single_order_max_notional_change_req_message_base + 32 + single_order_max_notional_change_req_message_at + 1) % 256; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Notional Change Req Message to the wire, 36 bytes from where the cursor stands */
inline encode_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_record) {
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 20 -> wire[at] = single_order_max_notional_change_req_message_record.cl_ord_id[single_order_max_notional_change_req_message_at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 6 -> wire[at] = single_order_max_notional_change_req_message_record.underlier_optional[single_order_max_notional_change_req_message_at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> wire[at] = single_order_max_notional_change_req_message_record.efid_optional[single_order_max_notional_change_req_message_at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 2 -> wire[at] = single_order_max_notional_change_req_message_record.risk_group_id[single_order_max_notional_change_req_message_at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> wire[at] = single_order_max_notional_change_req_message_record.max_notional_in_dollars[single_order_max_notional_change_req_message_at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Notional Change Req Message off the wire, 36 bytes from where the cursor stands */
inline decode_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_record) {
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 20 -> single_order_max_notional_change_req_message_record.cl_ord_id[single_order_max_notional_change_req_message_at] = wire[at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 6 -> single_order_max_notional_change_req_message_record.underlier_optional[single_order_max_notional_change_req_message_at] = wire[at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> single_order_max_notional_change_req_message_record.efid_optional[single_order_max_notional_change_req_message_at] = wire[at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 2 -> single_order_max_notional_change_req_message_record.risk_group_id[single_order_max_notional_change_req_message_at] = wire[at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> single_order_max_notional_change_req_message_record.max_notional_in_dollars[single_order_max_notional_change_req_message_at] = wire[at]; at = at + 1; single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Order Max Notional Change Req Message is what was written, byte for byte */
inline equal_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_read, single_order_max_notional_change_req_message_written) {
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 20 -> assert(single_order_max_notional_change_req_message_read.cl_ord_id[single_order_max_notional_change_req_message_at] == single_order_max_notional_change_req_message_written.cl_ord_id[single_order_max_notional_change_req_message_at]); single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 6 -> assert(single_order_max_notional_change_req_message_read.underlier_optional[single_order_max_notional_change_req_message_at] == single_order_max_notional_change_req_message_written.underlier_optional[single_order_max_notional_change_req_message_at]); single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> assert(single_order_max_notional_change_req_message_read.efid_optional[single_order_max_notional_change_req_message_at] == single_order_max_notional_change_req_message_written.efid_optional[single_order_max_notional_change_req_message_at]); single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 2 -> assert(single_order_max_notional_change_req_message_read.risk_group_id[single_order_max_notional_change_req_message_at] == single_order_max_notional_change_req_message_written.risk_group_id[single_order_max_notional_change_req_message_at]); single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_notional_change_req_message_at = 0;
  do
  :: single_order_max_notional_change_req_message_at < 4 -> assert(single_order_max_notional_change_req_message_read.max_notional_in_dollars[single_order_max_notional_change_req_message_at] == single_order_max_notional_change_req_message_written.max_notional_in_dollars[single_order_max_notional_change_req_message_at]); single_order_max_notional_change_req_message_at = single_order_max_notional_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Order Max Contracts Change Req Message: 36 bytes ----------------- */

/* SingleOrderMaxContractsChangeReqMessage */
typedef SingleOrderMaxContractsChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_contracts[4]
};

int single_order_max_contracts_change_req_message_at;

/* every byte of Single Order Max Contracts Change Req Message set to one value */
inline fill_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_record, single_order_max_contracts_change_req_message_value) {
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 20 -> single_order_max_contracts_change_req_message_record.cl_ord_id[single_order_max_contracts_change_req_message_at] = single_order_max_contracts_change_req_message_value; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 6 -> single_order_max_contracts_change_req_message_record.underlier_optional[single_order_max_contracts_change_req_message_at] = single_order_max_contracts_change_req_message_value; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> single_order_max_contracts_change_req_message_record.efid_optional[single_order_max_contracts_change_req_message_at] = single_order_max_contracts_change_req_message_value; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 2 -> single_order_max_contracts_change_req_message_record.risk_group_id[single_order_max_contracts_change_req_message_at] = single_order_max_contracts_change_req_message_value; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> single_order_max_contracts_change_req_message_record.max_contracts[single_order_max_contracts_change_req_message_at] = single_order_max_contracts_change_req_message_value; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Order Max Contracts Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_record, single_order_max_contracts_change_req_message_base) {
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 20 -> single_order_max_contracts_change_req_message_record.cl_ord_id[single_order_max_contracts_change_req_message_at] = (single_order_max_contracts_change_req_message_base + 0 + single_order_max_contracts_change_req_message_at + 1) % 256; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 6 -> single_order_max_contracts_change_req_message_record.underlier_optional[single_order_max_contracts_change_req_message_at] = (single_order_max_contracts_change_req_message_base + 20 + single_order_max_contracts_change_req_message_at + 1) % 256; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> single_order_max_contracts_change_req_message_record.efid_optional[single_order_max_contracts_change_req_message_at] = (single_order_max_contracts_change_req_message_base + 26 + single_order_max_contracts_change_req_message_at + 1) % 256; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 2 -> single_order_max_contracts_change_req_message_record.risk_group_id[single_order_max_contracts_change_req_message_at] = (single_order_max_contracts_change_req_message_base + 30 + single_order_max_contracts_change_req_message_at + 1) % 256; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> single_order_max_contracts_change_req_message_record.max_contracts[single_order_max_contracts_change_req_message_at] = (single_order_max_contracts_change_req_message_base + 32 + single_order_max_contracts_change_req_message_at + 1) % 256; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Contracts Change Req Message to the wire, 36 bytes from where the cursor stands */
inline encode_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_record) {
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 20 -> wire[at] = single_order_max_contracts_change_req_message_record.cl_ord_id[single_order_max_contracts_change_req_message_at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 6 -> wire[at] = single_order_max_contracts_change_req_message_record.underlier_optional[single_order_max_contracts_change_req_message_at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> wire[at] = single_order_max_contracts_change_req_message_record.efid_optional[single_order_max_contracts_change_req_message_at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 2 -> wire[at] = single_order_max_contracts_change_req_message_record.risk_group_id[single_order_max_contracts_change_req_message_at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> wire[at] = single_order_max_contracts_change_req_message_record.max_contracts[single_order_max_contracts_change_req_message_at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Order Max Contracts Change Req Message off the wire, 36 bytes from where the cursor stands */
inline decode_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_record) {
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 20 -> single_order_max_contracts_change_req_message_record.cl_ord_id[single_order_max_contracts_change_req_message_at] = wire[at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 6 -> single_order_max_contracts_change_req_message_record.underlier_optional[single_order_max_contracts_change_req_message_at] = wire[at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> single_order_max_contracts_change_req_message_record.efid_optional[single_order_max_contracts_change_req_message_at] = wire[at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 2 -> single_order_max_contracts_change_req_message_record.risk_group_id[single_order_max_contracts_change_req_message_at] = wire[at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> single_order_max_contracts_change_req_message_record.max_contracts[single_order_max_contracts_change_req_message_at] = wire[at]; at = at + 1; single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Order Max Contracts Change Req Message is what was written, byte for byte */
inline equal_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_read, single_order_max_contracts_change_req_message_written) {
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 20 -> assert(single_order_max_contracts_change_req_message_read.cl_ord_id[single_order_max_contracts_change_req_message_at] == single_order_max_contracts_change_req_message_written.cl_ord_id[single_order_max_contracts_change_req_message_at]); single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 6 -> assert(single_order_max_contracts_change_req_message_read.underlier_optional[single_order_max_contracts_change_req_message_at] == single_order_max_contracts_change_req_message_written.underlier_optional[single_order_max_contracts_change_req_message_at]); single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> assert(single_order_max_contracts_change_req_message_read.efid_optional[single_order_max_contracts_change_req_message_at] == single_order_max_contracts_change_req_message_written.efid_optional[single_order_max_contracts_change_req_message_at]); single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 2 -> assert(single_order_max_contracts_change_req_message_read.risk_group_id[single_order_max_contracts_change_req_message_at] == single_order_max_contracts_change_req_message_written.risk_group_id[single_order_max_contracts_change_req_message_at]); single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  single_order_max_contracts_change_req_message_at = 0;
  do
  :: single_order_max_contracts_change_req_message_at < 4 -> assert(single_order_max_contracts_change_req_message_read.max_contracts[single_order_max_contracts_change_req_message_at] == single_order_max_contracts_change_req_message_written.max_contracts[single_order_max_contracts_change_req_message_at]); single_order_max_contracts_change_req_message_at = single_order_max_contracts_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Gross Notional Threshold Change Req Message: 36 bytes ---------------- */

/* CPGrossNotionalThresholdChangeReqMessage */
typedef CpGrossNotionalThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_gross_notional_threshold_change_req_message_at;

/* every byte of Cp Gross Notional Threshold Change Req Message set to one value */
inline fill_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_record, cp_gross_notional_threshold_change_req_message_value) {
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 20 -> cp_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_gross_notional_threshold_change_req_message_at] = cp_gross_notional_threshold_change_req_message_value; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 6 -> cp_gross_notional_threshold_change_req_message_record.underlier_optional[cp_gross_notional_threshold_change_req_message_at] = cp_gross_notional_threshold_change_req_message_value; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> cp_gross_notional_threshold_change_req_message_record.efid_optional[cp_gross_notional_threshold_change_req_message_at] = cp_gross_notional_threshold_change_req_message_value; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 2 -> cp_gross_notional_threshold_change_req_message_record.risk_group_id[cp_gross_notional_threshold_change_req_message_at] = cp_gross_notional_threshold_change_req_message_value; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> cp_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_gross_notional_threshold_change_req_message_at] = cp_gross_notional_threshold_change_req_message_value; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Gross Notional Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_record, cp_gross_notional_threshold_change_req_message_base) {
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 20 -> cp_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_gross_notional_threshold_change_req_message_at] = (cp_gross_notional_threshold_change_req_message_base + 0 + cp_gross_notional_threshold_change_req_message_at + 1) % 256; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 6 -> cp_gross_notional_threshold_change_req_message_record.underlier_optional[cp_gross_notional_threshold_change_req_message_at] = (cp_gross_notional_threshold_change_req_message_base + 20 + cp_gross_notional_threshold_change_req_message_at + 1) % 256; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> cp_gross_notional_threshold_change_req_message_record.efid_optional[cp_gross_notional_threshold_change_req_message_at] = (cp_gross_notional_threshold_change_req_message_base + 26 + cp_gross_notional_threshold_change_req_message_at + 1) % 256; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 2 -> cp_gross_notional_threshold_change_req_message_record.risk_group_id[cp_gross_notional_threshold_change_req_message_at] = (cp_gross_notional_threshold_change_req_message_base + 30 + cp_gross_notional_threshold_change_req_message_at + 1) % 256; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> cp_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_gross_notional_threshold_change_req_message_at] = (cp_gross_notional_threshold_change_req_message_base + 32 + cp_gross_notional_threshold_change_req_message_at + 1) % 256; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Gross Notional Threshold Change Req Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_record) {
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 20 -> wire[at] = cp_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 6 -> wire[at] = cp_gross_notional_threshold_change_req_message_record.underlier_optional[cp_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_gross_notional_threshold_change_req_message_record.efid_optional[cp_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 2 -> wire[at] = cp_gross_notional_threshold_change_req_message_record.risk_group_id[cp_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Gross Notional Threshold Change Req Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_record) {
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 20 -> cp_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 6 -> cp_gross_notional_threshold_change_req_message_record.underlier_optional[cp_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> cp_gross_notional_threshold_change_req_message_record.efid_optional[cp_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 2 -> cp_gross_notional_threshold_change_req_message_record.risk_group_id[cp_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> cp_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Gross Notional Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_read, cp_gross_notional_threshold_change_req_message_written) {
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 20 -> assert(cp_gross_notional_threshold_change_req_message_read.cl_ord_id[cp_gross_notional_threshold_change_req_message_at] == cp_gross_notional_threshold_change_req_message_written.cl_ord_id[cp_gross_notional_threshold_change_req_message_at]); cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 6 -> assert(cp_gross_notional_threshold_change_req_message_read.underlier_optional[cp_gross_notional_threshold_change_req_message_at] == cp_gross_notional_threshold_change_req_message_written.underlier_optional[cp_gross_notional_threshold_change_req_message_at]); cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> assert(cp_gross_notional_threshold_change_req_message_read.efid_optional[cp_gross_notional_threshold_change_req_message_at] == cp_gross_notional_threshold_change_req_message_written.efid_optional[cp_gross_notional_threshold_change_req_message_at]); cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 2 -> assert(cp_gross_notional_threshold_change_req_message_read.risk_group_id[cp_gross_notional_threshold_change_req_message_at] == cp_gross_notional_threshold_change_req_message_written.risk_group_id[cp_gross_notional_threshold_change_req_message_at]); cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_gross_notional_threshold_change_req_message_at < 4 -> assert(cp_gross_notional_threshold_change_req_message_read.price_in_dollars[cp_gross_notional_threshold_change_req_message_at] == cp_gross_notional_threshold_change_req_message_written.price_in_dollars[cp_gross_notional_threshold_change_req_message_at]); cp_gross_notional_threshold_change_req_message_at = cp_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Market Order Gross Notional Threshold Change Req Message: 36 bytes ---- */

/* CPMarketOrderGrossNotionalThresholdChangeReqMessage */
typedef CpMarketOrderGrossNotionalThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_market_order_gross_notional_threshold_change_req_message_at;

/* every byte of Cp Market Order Gross Notional Threshold Change Req Message set to one value */
inline fill_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_record, cp_market_order_gross_notional_threshold_change_req_message_value) {
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 20 -> cp_market_order_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_gross_notional_threshold_change_req_message_at] = cp_market_order_gross_notional_threshold_change_req_message_value; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 6 -> cp_market_order_gross_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_gross_notional_threshold_change_req_message_at] = cp_market_order_gross_notional_threshold_change_req_message_value; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> cp_market_order_gross_notional_threshold_change_req_message_record.efid_optional[cp_market_order_gross_notional_threshold_change_req_message_at] = cp_market_order_gross_notional_threshold_change_req_message_value; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 2 -> cp_market_order_gross_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_gross_notional_threshold_change_req_message_at] = cp_market_order_gross_notional_threshold_change_req_message_value; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> cp_market_order_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_change_req_message_at] = cp_market_order_gross_notional_threshold_change_req_message_value; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Market Order Gross Notional Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_record, cp_market_order_gross_notional_threshold_change_req_message_base) {
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 20 -> cp_market_order_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_gross_notional_threshold_change_req_message_at] = (cp_market_order_gross_notional_threshold_change_req_message_base + 0 + cp_market_order_gross_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 6 -> cp_market_order_gross_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_gross_notional_threshold_change_req_message_at] = (cp_market_order_gross_notional_threshold_change_req_message_base + 20 + cp_market_order_gross_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> cp_market_order_gross_notional_threshold_change_req_message_record.efid_optional[cp_market_order_gross_notional_threshold_change_req_message_at] = (cp_market_order_gross_notional_threshold_change_req_message_base + 26 + cp_market_order_gross_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 2 -> cp_market_order_gross_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_gross_notional_threshold_change_req_message_at] = (cp_market_order_gross_notional_threshold_change_req_message_base + 30 + cp_market_order_gross_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> cp_market_order_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_change_req_message_at] = (cp_market_order_gross_notional_threshold_change_req_message_base + 32 + cp_market_order_gross_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Gross Notional Threshold Change Req Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_record) {
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 20 -> wire[at] = cp_market_order_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 6 -> wire[at] = cp_market_order_gross_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_market_order_gross_notional_threshold_change_req_message_record.efid_optional[cp_market_order_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 2 -> wire[at] = cp_market_order_gross_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_market_order_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Gross Notional Threshold Change Req Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_record) {
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 20 -> cp_market_order_gross_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 6 -> cp_market_order_gross_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> cp_market_order_gross_notional_threshold_change_req_message_record.efid_optional[cp_market_order_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 2 -> cp_market_order_gross_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> cp_market_order_gross_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_gross_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Market Order Gross Notional Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_read, cp_market_order_gross_notional_threshold_change_req_message_written) {
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 20 -> assert(cp_market_order_gross_notional_threshold_change_req_message_read.cl_ord_id[cp_market_order_gross_notional_threshold_change_req_message_at] == cp_market_order_gross_notional_threshold_change_req_message_written.cl_ord_id[cp_market_order_gross_notional_threshold_change_req_message_at]); cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 6 -> assert(cp_market_order_gross_notional_threshold_change_req_message_read.underlier_optional[cp_market_order_gross_notional_threshold_change_req_message_at] == cp_market_order_gross_notional_threshold_change_req_message_written.underlier_optional[cp_market_order_gross_notional_threshold_change_req_message_at]); cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> assert(cp_market_order_gross_notional_threshold_change_req_message_read.efid_optional[cp_market_order_gross_notional_threshold_change_req_message_at] == cp_market_order_gross_notional_threshold_change_req_message_written.efid_optional[cp_market_order_gross_notional_threshold_change_req_message_at]); cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 2 -> assert(cp_market_order_gross_notional_threshold_change_req_message_read.risk_group_id[cp_market_order_gross_notional_threshold_change_req_message_at] == cp_market_order_gross_notional_threshold_change_req_message_written.risk_group_id[cp_market_order_gross_notional_threshold_change_req_message_at]); cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_gross_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_gross_notional_threshold_change_req_message_at < 4 -> assert(cp_market_order_gross_notional_threshold_change_req_message_read.price_in_dollars[cp_market_order_gross_notional_threshold_change_req_message_at] == cp_market_order_gross_notional_threshold_change_req_message_written.price_in_dollars[cp_market_order_gross_notional_threshold_change_req_message_at]); cp_market_order_gross_notional_threshold_change_req_message_at = cp_market_order_gross_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Net Notional Threshold Change Req Message: 36 bytes ------------------ */

/* CPNetNotionalThresholdChangeReqMessage */
typedef CpNetNotionalThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_net_notional_threshold_change_req_message_at;

/* every byte of Cp Net Notional Threshold Change Req Message set to one value */
inline fill_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_record, cp_net_notional_threshold_change_req_message_value) {
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 20 -> cp_net_notional_threshold_change_req_message_record.cl_ord_id[cp_net_notional_threshold_change_req_message_at] = cp_net_notional_threshold_change_req_message_value; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 6 -> cp_net_notional_threshold_change_req_message_record.underlier_optional[cp_net_notional_threshold_change_req_message_at] = cp_net_notional_threshold_change_req_message_value; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> cp_net_notional_threshold_change_req_message_record.efid_optional[cp_net_notional_threshold_change_req_message_at] = cp_net_notional_threshold_change_req_message_value; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 2 -> cp_net_notional_threshold_change_req_message_record.risk_group_id[cp_net_notional_threshold_change_req_message_at] = cp_net_notional_threshold_change_req_message_value; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> cp_net_notional_threshold_change_req_message_record.price_in_dollars[cp_net_notional_threshold_change_req_message_at] = cp_net_notional_threshold_change_req_message_value; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Net Notional Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_record, cp_net_notional_threshold_change_req_message_base) {
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 20 -> cp_net_notional_threshold_change_req_message_record.cl_ord_id[cp_net_notional_threshold_change_req_message_at] = (cp_net_notional_threshold_change_req_message_base + 0 + cp_net_notional_threshold_change_req_message_at + 1) % 256; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 6 -> cp_net_notional_threshold_change_req_message_record.underlier_optional[cp_net_notional_threshold_change_req_message_at] = (cp_net_notional_threshold_change_req_message_base + 20 + cp_net_notional_threshold_change_req_message_at + 1) % 256; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> cp_net_notional_threshold_change_req_message_record.efid_optional[cp_net_notional_threshold_change_req_message_at] = (cp_net_notional_threshold_change_req_message_base + 26 + cp_net_notional_threshold_change_req_message_at + 1) % 256; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 2 -> cp_net_notional_threshold_change_req_message_record.risk_group_id[cp_net_notional_threshold_change_req_message_at] = (cp_net_notional_threshold_change_req_message_base + 30 + cp_net_notional_threshold_change_req_message_at + 1) % 256; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> cp_net_notional_threshold_change_req_message_record.price_in_dollars[cp_net_notional_threshold_change_req_message_at] = (cp_net_notional_threshold_change_req_message_base + 32 + cp_net_notional_threshold_change_req_message_at + 1) % 256; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Net Notional Threshold Change Req Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_record) {
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 20 -> wire[at] = cp_net_notional_threshold_change_req_message_record.cl_ord_id[cp_net_notional_threshold_change_req_message_at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 6 -> wire[at] = cp_net_notional_threshold_change_req_message_record.underlier_optional[cp_net_notional_threshold_change_req_message_at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_net_notional_threshold_change_req_message_record.efid_optional[cp_net_notional_threshold_change_req_message_at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 2 -> wire[at] = cp_net_notional_threshold_change_req_message_record.risk_group_id[cp_net_notional_threshold_change_req_message_at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_net_notional_threshold_change_req_message_record.price_in_dollars[cp_net_notional_threshold_change_req_message_at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Net Notional Threshold Change Req Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_record) {
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 20 -> cp_net_notional_threshold_change_req_message_record.cl_ord_id[cp_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 6 -> cp_net_notional_threshold_change_req_message_record.underlier_optional[cp_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> cp_net_notional_threshold_change_req_message_record.efid_optional[cp_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 2 -> cp_net_notional_threshold_change_req_message_record.risk_group_id[cp_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> cp_net_notional_threshold_change_req_message_record.price_in_dollars[cp_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Net Notional Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_read, cp_net_notional_threshold_change_req_message_written) {
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 20 -> assert(cp_net_notional_threshold_change_req_message_read.cl_ord_id[cp_net_notional_threshold_change_req_message_at] == cp_net_notional_threshold_change_req_message_written.cl_ord_id[cp_net_notional_threshold_change_req_message_at]); cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 6 -> assert(cp_net_notional_threshold_change_req_message_read.underlier_optional[cp_net_notional_threshold_change_req_message_at] == cp_net_notional_threshold_change_req_message_written.underlier_optional[cp_net_notional_threshold_change_req_message_at]); cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> assert(cp_net_notional_threshold_change_req_message_read.efid_optional[cp_net_notional_threshold_change_req_message_at] == cp_net_notional_threshold_change_req_message_written.efid_optional[cp_net_notional_threshold_change_req_message_at]); cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 2 -> assert(cp_net_notional_threshold_change_req_message_read.risk_group_id[cp_net_notional_threshold_change_req_message_at] == cp_net_notional_threshold_change_req_message_written.risk_group_id[cp_net_notional_threshold_change_req_message_at]); cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_net_notional_threshold_change_req_message_at < 4 -> assert(cp_net_notional_threshold_change_req_message_read.price_in_dollars[cp_net_notional_threshold_change_req_message_at] == cp_net_notional_threshold_change_req_message_written.price_in_dollars[cp_net_notional_threshold_change_req_message_at]); cp_net_notional_threshold_change_req_message_at = cp_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Market Order Net Notional Threshold Change Req Message: 36 bytes ----- */

/* CPMarketOrderNetNotionalThresholdChangeReqMessage */
typedef CpMarketOrderNetNotionalThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte price_in_dollars[4]
};

int cp_market_order_net_notional_threshold_change_req_message_at;

/* every byte of Cp Market Order Net Notional Threshold Change Req Message set to one value */
inline fill_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_record, cp_market_order_net_notional_threshold_change_req_message_value) {
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 20 -> cp_market_order_net_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_net_notional_threshold_change_req_message_at] = cp_market_order_net_notional_threshold_change_req_message_value; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 6 -> cp_market_order_net_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_net_notional_threshold_change_req_message_at] = cp_market_order_net_notional_threshold_change_req_message_value; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> cp_market_order_net_notional_threshold_change_req_message_record.efid_optional[cp_market_order_net_notional_threshold_change_req_message_at] = cp_market_order_net_notional_threshold_change_req_message_value; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 2 -> cp_market_order_net_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_net_notional_threshold_change_req_message_at] = cp_market_order_net_notional_threshold_change_req_message_value; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> cp_market_order_net_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_net_notional_threshold_change_req_message_at] = cp_market_order_net_notional_threshold_change_req_message_value; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Market Order Net Notional Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_record, cp_market_order_net_notional_threshold_change_req_message_base) {
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 20 -> cp_market_order_net_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_net_notional_threshold_change_req_message_at] = (cp_market_order_net_notional_threshold_change_req_message_base + 0 + cp_market_order_net_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 6 -> cp_market_order_net_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_net_notional_threshold_change_req_message_at] = (cp_market_order_net_notional_threshold_change_req_message_base + 20 + cp_market_order_net_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> cp_market_order_net_notional_threshold_change_req_message_record.efid_optional[cp_market_order_net_notional_threshold_change_req_message_at] = (cp_market_order_net_notional_threshold_change_req_message_base + 26 + cp_market_order_net_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 2 -> cp_market_order_net_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_net_notional_threshold_change_req_message_at] = (cp_market_order_net_notional_threshold_change_req_message_base + 30 + cp_market_order_net_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> cp_market_order_net_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_net_notional_threshold_change_req_message_at] = (cp_market_order_net_notional_threshold_change_req_message_base + 32 + cp_market_order_net_notional_threshold_change_req_message_at + 1) % 256; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Net Notional Threshold Change Req Message to the wire, 36 bytes from where the cursor stands */
inline encode_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_record) {
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 20 -> wire[at] = cp_market_order_net_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_net_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 6 -> wire[at] = cp_market_order_net_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_net_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_market_order_net_notional_threshold_change_req_message_record.efid_optional[cp_market_order_net_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 2 -> wire[at] = cp_market_order_net_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_net_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> wire[at] = cp_market_order_net_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_net_notional_threshold_change_req_message_at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Market Order Net Notional Threshold Change Req Message off the wire, 36 bytes from where the cursor stands */
inline decode_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_record) {
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 20 -> cp_market_order_net_notional_threshold_change_req_message_record.cl_ord_id[cp_market_order_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 6 -> cp_market_order_net_notional_threshold_change_req_message_record.underlier_optional[cp_market_order_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> cp_market_order_net_notional_threshold_change_req_message_record.efid_optional[cp_market_order_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 2 -> cp_market_order_net_notional_threshold_change_req_message_record.risk_group_id[cp_market_order_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> cp_market_order_net_notional_threshold_change_req_message_record.price_in_dollars[cp_market_order_net_notional_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Market Order Net Notional Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_read, cp_market_order_net_notional_threshold_change_req_message_written) {
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 20 -> assert(cp_market_order_net_notional_threshold_change_req_message_read.cl_ord_id[cp_market_order_net_notional_threshold_change_req_message_at] == cp_market_order_net_notional_threshold_change_req_message_written.cl_ord_id[cp_market_order_net_notional_threshold_change_req_message_at]); cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 6 -> assert(cp_market_order_net_notional_threshold_change_req_message_read.underlier_optional[cp_market_order_net_notional_threshold_change_req_message_at] == cp_market_order_net_notional_threshold_change_req_message_written.underlier_optional[cp_market_order_net_notional_threshold_change_req_message_at]); cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> assert(cp_market_order_net_notional_threshold_change_req_message_read.efid_optional[cp_market_order_net_notional_threshold_change_req_message_at] == cp_market_order_net_notional_threshold_change_req_message_written.efid_optional[cp_market_order_net_notional_threshold_change_req_message_at]); cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 2 -> assert(cp_market_order_net_notional_threshold_change_req_message_read.risk_group_id[cp_market_order_net_notional_threshold_change_req_message_at] == cp_market_order_net_notional_threshold_change_req_message_written.risk_group_id[cp_market_order_net_notional_threshold_change_req_message_at]); cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_market_order_net_notional_threshold_change_req_message_at = 0;
  do
  :: cp_market_order_net_notional_threshold_change_req_message_at < 4 -> assert(cp_market_order_net_notional_threshold_change_req_message_read.price_in_dollars[cp_market_order_net_notional_threshold_change_req_message_at] == cp_market_order_net_notional_threshold_change_req_message_written.price_in_dollars[cp_market_order_net_notional_threshold_change_req_message_at]); cp_market_order_net_notional_threshold_change_req_message_at = cp_market_order_net_notional_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Duplicate Order Threshold Change Req Message: 41 bytes --------------- */

/* CPDuplicateOrderThresholdChangeReqMessage */
typedef CpDuplicateOrderThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_dup_orders[4];
  byte use_order_price_in_dup_check_optional;
  byte period_in_milli_seconds[4]
};

int cp_duplicate_order_threshold_change_req_message_at;

/* every byte of Cp Duplicate Order Threshold Change Req Message set to one value */
inline fill_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_record, cp_duplicate_order_threshold_change_req_message_value) {
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 20 -> cp_duplicate_order_threshold_change_req_message_record.cl_ord_id[cp_duplicate_order_threshold_change_req_message_at] = cp_duplicate_order_threshold_change_req_message_value; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 6 -> cp_duplicate_order_threshold_change_req_message_record.underlier_optional[cp_duplicate_order_threshold_change_req_message_at] = cp_duplicate_order_threshold_change_req_message_value; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.efid_optional[cp_duplicate_order_threshold_change_req_message_at] = cp_duplicate_order_threshold_change_req_message_value; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 2 -> cp_duplicate_order_threshold_change_req_message_record.risk_group_id[cp_duplicate_order_threshold_change_req_message_at] = cp_duplicate_order_threshold_change_req_message_value; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.max_dup_orders[cp_duplicate_order_threshold_change_req_message_at] = cp_duplicate_order_threshold_change_req_message_value; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_record.use_order_price_in_dup_check_optional = cp_duplicate_order_threshold_change_req_message_value;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_change_req_message_at] = cp_duplicate_order_threshold_change_req_message_value; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Duplicate Order Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_record, cp_duplicate_order_threshold_change_req_message_base) {
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 20 -> cp_duplicate_order_threshold_change_req_message_record.cl_ord_id[cp_duplicate_order_threshold_change_req_message_at] = (cp_duplicate_order_threshold_change_req_message_base + 0 + cp_duplicate_order_threshold_change_req_message_at + 1) % 256; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 6 -> cp_duplicate_order_threshold_change_req_message_record.underlier_optional[cp_duplicate_order_threshold_change_req_message_at] = (cp_duplicate_order_threshold_change_req_message_base + 20 + cp_duplicate_order_threshold_change_req_message_at + 1) % 256; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.efid_optional[cp_duplicate_order_threshold_change_req_message_at] = (cp_duplicate_order_threshold_change_req_message_base + 26 + cp_duplicate_order_threshold_change_req_message_at + 1) % 256; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 2 -> cp_duplicate_order_threshold_change_req_message_record.risk_group_id[cp_duplicate_order_threshold_change_req_message_at] = (cp_duplicate_order_threshold_change_req_message_base + 30 + cp_duplicate_order_threshold_change_req_message_at + 1) % 256; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.max_dup_orders[cp_duplicate_order_threshold_change_req_message_at] = (cp_duplicate_order_threshold_change_req_message_base + 32 + cp_duplicate_order_threshold_change_req_message_at + 1) % 256; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_record.use_order_price_in_dup_check_optional = (cp_duplicate_order_threshold_change_req_message_base + 36 + 1) % 256;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_change_req_message_at] = (cp_duplicate_order_threshold_change_req_message_base + 37 + cp_duplicate_order_threshold_change_req_message_at + 1) % 256; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Duplicate Order Threshold Change Req Message to the wire, 41 bytes from where the cursor stands */
inline encode_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_record) {
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 20 -> wire[at] = cp_duplicate_order_threshold_change_req_message_record.cl_ord_id[cp_duplicate_order_threshold_change_req_message_at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 6 -> wire[at] = cp_duplicate_order_threshold_change_req_message_record.underlier_optional[cp_duplicate_order_threshold_change_req_message_at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> wire[at] = cp_duplicate_order_threshold_change_req_message_record.efid_optional[cp_duplicate_order_threshold_change_req_message_at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 2 -> wire[at] = cp_duplicate_order_threshold_change_req_message_record.risk_group_id[cp_duplicate_order_threshold_change_req_message_at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> wire[at] = cp_duplicate_order_threshold_change_req_message_record.max_dup_orders[cp_duplicate_order_threshold_change_req_message_at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  wire[at] = cp_duplicate_order_threshold_change_req_message_record.use_order_price_in_dup_check_optional; at = at + 1;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> wire[at] = cp_duplicate_order_threshold_change_req_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_change_req_message_at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Duplicate Order Threshold Change Req Message off the wire, 41 bytes from where the cursor stands */
inline decode_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_record) {
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 20 -> cp_duplicate_order_threshold_change_req_message_record.cl_ord_id[cp_duplicate_order_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 6 -> cp_duplicate_order_threshold_change_req_message_record.underlier_optional[cp_duplicate_order_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.efid_optional[cp_duplicate_order_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 2 -> cp_duplicate_order_threshold_change_req_message_record.risk_group_id[cp_duplicate_order_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.max_dup_orders[cp_duplicate_order_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_record.use_order_price_in_dup_check_optional = wire[at]; at = at + 1;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> cp_duplicate_order_threshold_change_req_message_record.period_in_milli_seconds[cp_duplicate_order_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Duplicate Order Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_read, cp_duplicate_order_threshold_change_req_message_written) {
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 20 -> assert(cp_duplicate_order_threshold_change_req_message_read.cl_ord_id[cp_duplicate_order_threshold_change_req_message_at] == cp_duplicate_order_threshold_change_req_message_written.cl_ord_id[cp_duplicate_order_threshold_change_req_message_at]); cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 6 -> assert(cp_duplicate_order_threshold_change_req_message_read.underlier_optional[cp_duplicate_order_threshold_change_req_message_at] == cp_duplicate_order_threshold_change_req_message_written.underlier_optional[cp_duplicate_order_threshold_change_req_message_at]); cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> assert(cp_duplicate_order_threshold_change_req_message_read.efid_optional[cp_duplicate_order_threshold_change_req_message_at] == cp_duplicate_order_threshold_change_req_message_written.efid_optional[cp_duplicate_order_threshold_change_req_message_at]); cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 2 -> assert(cp_duplicate_order_threshold_change_req_message_read.risk_group_id[cp_duplicate_order_threshold_change_req_message_at] == cp_duplicate_order_threshold_change_req_message_written.risk_group_id[cp_duplicate_order_threshold_change_req_message_at]); cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> assert(cp_duplicate_order_threshold_change_req_message_read.max_dup_orders[cp_duplicate_order_threshold_change_req_message_at] == cp_duplicate_order_threshold_change_req_message_written.max_dup_orders[cp_duplicate_order_threshold_change_req_message_at]); cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  assert(cp_duplicate_order_threshold_change_req_message_read.use_order_price_in_dup_check_optional == cp_duplicate_order_threshold_change_req_message_written.use_order_price_in_dup_check_optional);
  cp_duplicate_order_threshold_change_req_message_at = 0;
  do
  :: cp_duplicate_order_threshold_change_req_message_at < 4 -> assert(cp_duplicate_order_threshold_change_req_message_read.period_in_milli_seconds[cp_duplicate_order_threshold_change_req_message_at] == cp_duplicate_order_threshold_change_req_message_written.period_in_milli_seconds[cp_duplicate_order_threshold_change_req_message_at]); cp_duplicate_order_threshold_change_req_message_at = cp_duplicate_order_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cp Order Rate Threshold Change Req Message: 40 bytes -------------------- */

/* CPOrderRateThresholdChangeReqMessage */
typedef CpOrderRateThresholdChangeReqMessage {
  byte cl_ord_id[20];
  byte underlier_optional[6];
  byte efid_optional[4];
  byte risk_group_id[2];
  byte max_order_msgs[4];
  byte period_in_milli_seconds[4]
};

int cp_order_rate_threshold_change_req_message_at;

/* every byte of Cp Order Rate Threshold Change Req Message set to one value */
inline fill_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_record, cp_order_rate_threshold_change_req_message_value) {
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 20 -> cp_order_rate_threshold_change_req_message_record.cl_ord_id[cp_order_rate_threshold_change_req_message_at] = cp_order_rate_threshold_change_req_message_value; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 6 -> cp_order_rate_threshold_change_req_message_record.underlier_optional[cp_order_rate_threshold_change_req_message_at] = cp_order_rate_threshold_change_req_message_value; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.efid_optional[cp_order_rate_threshold_change_req_message_at] = cp_order_rate_threshold_change_req_message_value; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 2 -> cp_order_rate_threshold_change_req_message_record.risk_group_id[cp_order_rate_threshold_change_req_message_at] = cp_order_rate_threshold_change_req_message_value; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.max_order_msgs[cp_order_rate_threshold_change_req_message_at] = cp_order_rate_threshold_change_req_message_value; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.period_in_milli_seconds[cp_order_rate_threshold_change_req_message_at] = cp_order_rate_threshold_change_req_message_value; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cp Order Rate Threshold Change Req Message set to where it lies, so a field read out of place says so */
inline ramp_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_record, cp_order_rate_threshold_change_req_message_base) {
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 20 -> cp_order_rate_threshold_change_req_message_record.cl_ord_id[cp_order_rate_threshold_change_req_message_at] = (cp_order_rate_threshold_change_req_message_base + 0 + cp_order_rate_threshold_change_req_message_at + 1) % 256; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 6 -> cp_order_rate_threshold_change_req_message_record.underlier_optional[cp_order_rate_threshold_change_req_message_at] = (cp_order_rate_threshold_change_req_message_base + 20 + cp_order_rate_threshold_change_req_message_at + 1) % 256; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.efid_optional[cp_order_rate_threshold_change_req_message_at] = (cp_order_rate_threshold_change_req_message_base + 26 + cp_order_rate_threshold_change_req_message_at + 1) % 256; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 2 -> cp_order_rate_threshold_change_req_message_record.risk_group_id[cp_order_rate_threshold_change_req_message_at] = (cp_order_rate_threshold_change_req_message_base + 30 + cp_order_rate_threshold_change_req_message_at + 1) % 256; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.max_order_msgs[cp_order_rate_threshold_change_req_message_at] = (cp_order_rate_threshold_change_req_message_base + 32 + cp_order_rate_threshold_change_req_message_at + 1) % 256; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.period_in_milli_seconds[cp_order_rate_threshold_change_req_message_at] = (cp_order_rate_threshold_change_req_message_base + 36 + cp_order_rate_threshold_change_req_message_at + 1) % 256; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Order Rate Threshold Change Req Message to the wire, 40 bytes from where the cursor stands */
inline encode_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_record) {
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 20 -> wire[at] = cp_order_rate_threshold_change_req_message_record.cl_ord_id[cp_order_rate_threshold_change_req_message_at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 6 -> wire[at] = cp_order_rate_threshold_change_req_message_record.underlier_optional[cp_order_rate_threshold_change_req_message_at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> wire[at] = cp_order_rate_threshold_change_req_message_record.efid_optional[cp_order_rate_threshold_change_req_message_at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 2 -> wire[at] = cp_order_rate_threshold_change_req_message_record.risk_group_id[cp_order_rate_threshold_change_req_message_at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> wire[at] = cp_order_rate_threshold_change_req_message_record.max_order_msgs[cp_order_rate_threshold_change_req_message_at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> wire[at] = cp_order_rate_threshold_change_req_message_record.period_in_milli_seconds[cp_order_rate_threshold_change_req_message_at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cp Order Rate Threshold Change Req Message off the wire, 40 bytes from where the cursor stands */
inline decode_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_record) {
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 20 -> cp_order_rate_threshold_change_req_message_record.cl_ord_id[cp_order_rate_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 6 -> cp_order_rate_threshold_change_req_message_record.underlier_optional[cp_order_rate_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.efid_optional[cp_order_rate_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 2 -> cp_order_rate_threshold_change_req_message_record.risk_group_id[cp_order_rate_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.max_order_msgs[cp_order_rate_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> cp_order_rate_threshold_change_req_message_record.period_in_milli_seconds[cp_order_rate_threshold_change_req_message_at] = wire[at]; at = at + 1; cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cp Order Rate Threshold Change Req Message is what was written, byte for byte */
inline equal_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_read, cp_order_rate_threshold_change_req_message_written) {
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 20 -> assert(cp_order_rate_threshold_change_req_message_read.cl_ord_id[cp_order_rate_threshold_change_req_message_at] == cp_order_rate_threshold_change_req_message_written.cl_ord_id[cp_order_rate_threshold_change_req_message_at]); cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 6 -> assert(cp_order_rate_threshold_change_req_message_read.underlier_optional[cp_order_rate_threshold_change_req_message_at] == cp_order_rate_threshold_change_req_message_written.underlier_optional[cp_order_rate_threshold_change_req_message_at]); cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> assert(cp_order_rate_threshold_change_req_message_read.efid_optional[cp_order_rate_threshold_change_req_message_at] == cp_order_rate_threshold_change_req_message_written.efid_optional[cp_order_rate_threshold_change_req_message_at]); cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 2 -> assert(cp_order_rate_threshold_change_req_message_read.risk_group_id[cp_order_rate_threshold_change_req_message_at] == cp_order_rate_threshold_change_req_message_written.risk_group_id[cp_order_rate_threshold_change_req_message_at]); cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> assert(cp_order_rate_threshold_change_req_message_read.max_order_msgs[cp_order_rate_threshold_change_req_message_at] == cp_order_rate_threshold_change_req_message_written.max_order_msgs[cp_order_rate_threshold_change_req_message_at]); cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  cp_order_rate_threshold_change_req_message_at = 0;
  do
  :: cp_order_rate_threshold_change_req_message_at < 4 -> assert(cp_order_rate_threshold_change_req_message_read.period_in_milli_seconds[cp_order_rate_threshold_change_req_message_at] == cp_order_rate_threshold_change_req_message_written.period_in_milli_seconds[cp_order_rate_threshold_change_req_message_at]); cp_order_rate_threshold_change_req_message_at = cp_order_rate_threshold_change_req_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Common Header: encoded, read back, and compared */
proctype check_common_header() {
  CommonHeader common_header_sent;
  CommonHeader common_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_common_header(common_header_sent, 0)
  :: pattern == 1 -> fill_common_header(common_header_sent, 32)
  :: pattern == 2 -> fill_common_header(common_header_sent, 255)
  :: else -> ramp_common_header(common_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_common_header(common_header_sent);
    assert(at == 3);
    at = 0;
    decode_common_header(common_header_got);
    assert(at == 3);
    equal_common_header(common_header_got, common_header_sent)
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
    assert(at == 2);
    at = 0;
    decode_login_request_message(login_request_message_got);
    assert(at == 2);
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
    assert(at == 20);
    at = 0;
    decode_replay_request_message(replay_request_message_got);
    assert(at == 20);
    equal_replay_request_message(replay_request_message_got, replay_request_message_sent)
  }
}

/* Replay All Request Message: encoded, read back, and compared */
proctype check_replay_all_request_message() {
  ReplayAllRequestMessage replay_all_request_message_sent;
  ReplayAllRequestMessage replay_all_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_all_request_message(replay_all_request_message_sent, 0)
  :: pattern == 1 -> fill_replay_all_request_message(replay_all_request_message_sent, 32)
  :: pattern == 2 -> fill_replay_all_request_message(replay_all_request_message_sent, 255)
  :: else -> ramp_replay_all_request_message(replay_all_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_all_request_message(replay_all_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_replay_all_request_message(replay_all_request_message_got);
    assert(at == 8);
    equal_replay_all_request_message(replay_all_request_message_got, replay_all_request_message_sent)
  }
}

/* Stream Request Message: encoded, read back, and compared */
proctype check_stream_request_message() {
  StreamRequestMessage stream_request_message_sent;
  StreamRequestMessage stream_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_request_message(stream_request_message_sent, 0)
  :: pattern == 1 -> fill_stream_request_message(stream_request_message_sent, 32)
  :: pattern == 2 -> fill_stream_request_message(stream_request_message_sent, 255)
  :: else -> ramp_stream_request_message(stream_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_request_message(stream_request_message_sent);
    assert(at == 16);
    at = 0;
    decode_stream_request_message(stream_request_message_got);
    assert(at == 16);
    equal_stream_request_message(stream_request_message_got, stream_request_message_sent)
  }
}

/* Sbe Header: encoded, read back, and compared */
proctype check_sbe_header() {
  SbeHeader sbe_header_sent;
  SbeHeader sbe_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sbe_header(sbe_header_sent, 0)
  :: pattern == 1 -> fill_sbe_header(sbe_header_sent, 32)
  :: pattern == 2 -> fill_sbe_header(sbe_header_sent, 255)
  :: else -> ramp_sbe_header(sbe_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sbe_header(sbe_header_sent);
    assert(at == 6);
    at = 0;
    decode_sbe_header(sbe_header_got);
    assert(at == 6);
    equal_sbe_header(sbe_header_got, sbe_header_sent)
  }
}

/* Risk Settings Query Message: encoded, read back, and compared */
proctype check_risk_settings_query_message() {
  RiskSettingsQueryMessage risk_settings_query_message_sent;
  RiskSettingsQueryMessage risk_settings_query_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_settings_query_message(risk_settings_query_message_sent, 0)
  :: pattern == 1 -> fill_risk_settings_query_message(risk_settings_query_message_sent, 32)
  :: pattern == 2 -> fill_risk_settings_query_message(risk_settings_query_message_sent, 255)
  :: else -> ramp_risk_settings_query_message(risk_settings_query_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_settings_query_message(risk_settings_query_message_sent);
    assert(at == 20);
    at = 0;
    decode_risk_settings_query_message(risk_settings_query_message_got);
    assert(at == 20);
    equal_risk_settings_query_message(risk_settings_query_message_got, risk_settings_query_message_sent)
  }
}

/* Active Risk Threshold Change Req Message: encoded, read back, and compared */
proctype check_active_risk_threshold_change_req_message() {
  ActiveRiskThresholdChangeReqMessage active_risk_threshold_change_req_message_sent;
  ActiveRiskThresholdChangeReqMessage active_risk_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_sent, 255)
  :: else -> ramp_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_sent);
    assert(at == 34);
    at = 0;
    decode_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_got);
    assert(at == 34);
    equal_active_risk_threshold_change_req_message(active_risk_threshold_change_req_message_got, active_risk_threshold_change_req_message_sent)
  }
}

/* Active Risk Acknowledgement Req Message: encoded, read back, and compared */
proctype check_active_risk_acknowledgement_req_message() {
  ActiveRiskAcknowledgementReqMessage active_risk_acknowledgement_req_message_sent;
  ActiveRiskAcknowledgementReqMessage active_risk_acknowledgement_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_sent, 0)
  :: pattern == 1 -> fill_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_sent, 32)
  :: pattern == 2 -> fill_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_sent, 255)
  :: else -> ramp_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_sent);
    assert(at == 34);
    at = 0;
    decode_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_got);
    assert(at == 34);
    equal_active_risk_acknowledgement_req_message(active_risk_acknowledgement_req_message_got, active_risk_acknowledgement_req_message_sent)
  }
}

/* Cp Volume Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_volume_threshold_change_req_message() {
  CpVolumeThresholdChangeReqMessage cp_volume_threshold_change_req_message_sent;
  CpVolumeThresholdChangeReqMessage cp_volume_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_sent);
    assert(at == 44);
    at = 0;
    decode_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_got);
    assert(at == 44);
    equal_cp_volume_threshold_change_req_message(cp_volume_threshold_change_req_message_got, cp_volume_threshold_change_req_message_sent)
  }
}

/* Cp Executed Notional Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_executed_notional_threshold_change_req_message() {
  CpExecutedNotionalThresholdChangeReqMessage cp_executed_notional_threshold_change_req_message_sent;
  CpExecutedNotionalThresholdChangeReqMessage cp_executed_notional_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_got);
    assert(at == 40);
    equal_cp_executed_notional_threshold_change_req_message(cp_executed_notional_threshold_change_req_message_got, cp_executed_notional_threshold_change_req_message_sent)
  }
}

/* Cp Total Executions Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_total_executions_threshold_change_req_message() {
  CpTotalExecutionsThresholdChangeReqMessage cp_total_executions_threshold_change_req_message_sent;
  CpTotalExecutionsThresholdChangeReqMessage cp_total_executions_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_got);
    assert(at == 40);
    equal_cp_total_executions_threshold_change_req_message(cp_total_executions_threshold_change_req_message_got, cp_total_executions_threshold_change_req_message_sent)
  }
}

/* Cp Percent Outstanding Contracts Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_percent_outstanding_contracts_threshold_change_req_message() {
  CpPercentOutstandingContractsThresholdChangeReqMessage cp_percent_outstanding_contracts_threshold_change_req_message_sent;
  CpPercentOutstandingContractsThresholdChangeReqMessage cp_percent_outstanding_contracts_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_sent);
    assert(at == 38);
    at = 0;
    decode_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_got);
    assert(at == 38);
    equal_cp_percent_outstanding_contracts_threshold_change_req_message(cp_percent_outstanding_contracts_threshold_change_req_message_got, cp_percent_outstanding_contracts_threshold_change_req_message_sent)
  }
}

/* Cp Breach Count Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_breach_count_threshold_change_req_message() {
  CpBreachCountThresholdChangeReqMessage cp_breach_count_threshold_change_req_message_sent;
  CpBreachCountThresholdChangeReqMessage cp_breach_count_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_got);
    assert(at == 40);
    equal_cp_breach_count_threshold_change_req_message(cp_breach_count_threshold_change_req_message_got, cp_breach_count_threshold_change_req_message_sent)
  }
}

/* Manual Cp Breach Trigger Req Message: encoded, read back, and compared */
proctype check_manual_cp_breach_trigger_req_message() {
  ManualCpBreachTriggerReqMessage manual_cp_breach_trigger_req_message_sent;
  ManualCpBreachTriggerReqMessage manual_cp_breach_trigger_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_sent, 0)
  :: pattern == 1 -> fill_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_sent, 32)
  :: pattern == 2 -> fill_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_sent, 255)
  :: else -> ramp_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_sent);
    assert(at == 33);
    at = 0;
    decode_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_got);
    assert(at == 33);
    equal_manual_cp_breach_trigger_req_message(manual_cp_breach_trigger_req_message_got, manual_cp_breach_trigger_req_message_sent)
  }
}

/* Cp Clear Breach Req Message: encoded, read back, and compared */
proctype check_cp_clear_breach_req_message() {
  CpClearBreachReqMessage cp_clear_breach_req_message_sent;
  CpClearBreachReqMessage cp_clear_breach_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_clear_breach_req_message(cp_clear_breach_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_clear_breach_req_message(cp_clear_breach_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_clear_breach_req_message(cp_clear_breach_req_message_sent, 255)
  :: else -> ramp_cp_clear_breach_req_message(cp_clear_breach_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_clear_breach_req_message(cp_clear_breach_req_message_sent);
    assert(at == 28);
    at = 0;
    decode_cp_clear_breach_req_message(cp_clear_breach_req_message_got);
    assert(at == 28);
    equal_cp_clear_breach_req_message(cp_clear_breach_req_message_got, cp_clear_breach_req_message_sent)
  }
}

/* Single Order Allow Iso Orders Change Req Message: encoded, read back, and compared */
proctype check_single_order_allow_iso_orders_change_req_message() {
  SingleOrderAllowIsoOrdersChangeReqMessage single_order_allow_iso_orders_change_req_message_sent;
  SingleOrderAllowIsoOrdersChangeReqMessage single_order_allow_iso_orders_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_sent, 0)
  :: pattern == 1 -> fill_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_sent, 32)
  :: pattern == 2 -> fill_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_sent, 255)
  :: else -> ramp_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_sent);
    assert(at == 33);
    at = 0;
    decode_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_got);
    assert(at == 33);
    equal_single_order_allow_iso_orders_change_req_message(single_order_allow_iso_orders_change_req_message_got, single_order_allow_iso_orders_change_req_message_sent)
  }
}

/* Single Order Allow Orders In Crossed Market Change Req Message: encoded, read back, and compared */
proctype check_single_order_allow_orders_in_crossed_market_change_req_message() {
  SingleOrderAllowOrdersInCrossedMarketChangeReqMessage single_order_allow_orders_in_crossed_market_change_req_message_sent;
  SingleOrderAllowOrdersInCrossedMarketChangeReqMessage single_order_allow_orders_in_crossed_market_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_sent, 0)
  :: pattern == 1 -> fill_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_sent, 32)
  :: pattern == 2 -> fill_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_sent, 255)
  :: else -> ramp_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_sent);
    assert(at == 33);
    at = 0;
    decode_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_got);
    assert(at == 33);
    equal_single_order_allow_orders_in_crossed_market_change_req_message(single_order_allow_orders_in_crossed_market_change_req_message_got, single_order_allow_orders_in_crossed_market_change_req_message_sent)
  }
}

/* Single Order Max Notional Change Req Message: encoded, read back, and compared */
proctype check_single_order_max_notional_change_req_message() {
  SingleOrderMaxNotionalChangeReqMessage single_order_max_notional_change_req_message_sent;
  SingleOrderMaxNotionalChangeReqMessage single_order_max_notional_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_sent, 0)
  :: pattern == 1 -> fill_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_sent, 32)
  :: pattern == 2 -> fill_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_sent, 255)
  :: else -> ramp_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_sent);
    assert(at == 36);
    at = 0;
    decode_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_got);
    assert(at == 36);
    equal_single_order_max_notional_change_req_message(single_order_max_notional_change_req_message_got, single_order_max_notional_change_req_message_sent)
  }
}

/* Single Order Max Contracts Change Req Message: encoded, read back, and compared */
proctype check_single_order_max_contracts_change_req_message() {
  SingleOrderMaxContractsChangeReqMessage single_order_max_contracts_change_req_message_sent;
  SingleOrderMaxContractsChangeReqMessage single_order_max_contracts_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_sent, 0)
  :: pattern == 1 -> fill_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_sent, 32)
  :: pattern == 2 -> fill_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_sent, 255)
  :: else -> ramp_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_sent);
    assert(at == 36);
    at = 0;
    decode_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_got);
    assert(at == 36);
    equal_single_order_max_contracts_change_req_message(single_order_max_contracts_change_req_message_got, single_order_max_contracts_change_req_message_sent)
  }
}

/* Cp Gross Notional Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_gross_notional_threshold_change_req_message() {
  CpGrossNotionalThresholdChangeReqMessage cp_gross_notional_threshold_change_req_message_sent;
  CpGrossNotionalThresholdChangeReqMessage cp_gross_notional_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_got);
    assert(at == 36);
    equal_cp_gross_notional_threshold_change_req_message(cp_gross_notional_threshold_change_req_message_got, cp_gross_notional_threshold_change_req_message_sent)
  }
}

/* Cp Market Order Gross Notional Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_market_order_gross_notional_threshold_change_req_message() {
  CpMarketOrderGrossNotionalThresholdChangeReqMessage cp_market_order_gross_notional_threshold_change_req_message_sent;
  CpMarketOrderGrossNotionalThresholdChangeReqMessage cp_market_order_gross_notional_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_got);
    assert(at == 36);
    equal_cp_market_order_gross_notional_threshold_change_req_message(cp_market_order_gross_notional_threshold_change_req_message_got, cp_market_order_gross_notional_threshold_change_req_message_sent)
  }
}

/* Cp Net Notional Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_net_notional_threshold_change_req_message() {
  CpNetNotionalThresholdChangeReqMessage cp_net_notional_threshold_change_req_message_sent;
  CpNetNotionalThresholdChangeReqMessage cp_net_notional_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_got);
    assert(at == 36);
    equal_cp_net_notional_threshold_change_req_message(cp_net_notional_threshold_change_req_message_got, cp_net_notional_threshold_change_req_message_sent)
  }
}

/* Cp Market Order Net Notional Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_market_order_net_notional_threshold_change_req_message() {
  CpMarketOrderNetNotionalThresholdChangeReqMessage cp_market_order_net_notional_threshold_change_req_message_sent;
  CpMarketOrderNetNotionalThresholdChangeReqMessage cp_market_order_net_notional_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_sent);
    assert(at == 36);
    at = 0;
    decode_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_got);
    assert(at == 36);
    equal_cp_market_order_net_notional_threshold_change_req_message(cp_market_order_net_notional_threshold_change_req_message_got, cp_market_order_net_notional_threshold_change_req_message_sent)
  }
}

/* Cp Duplicate Order Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_duplicate_order_threshold_change_req_message() {
  CpDuplicateOrderThresholdChangeReqMessage cp_duplicate_order_threshold_change_req_message_sent;
  CpDuplicateOrderThresholdChangeReqMessage cp_duplicate_order_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_sent);
    assert(at == 41);
    at = 0;
    decode_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_got);
    assert(at == 41);
    equal_cp_duplicate_order_threshold_change_req_message(cp_duplicate_order_threshold_change_req_message_got, cp_duplicate_order_threshold_change_req_message_sent)
  }
}

/* Cp Order Rate Threshold Change Req Message: encoded, read back, and compared */
proctype check_cp_order_rate_threshold_change_req_message() {
  CpOrderRateThresholdChangeReqMessage cp_order_rate_threshold_change_req_message_sent;
  CpOrderRateThresholdChangeReqMessage cp_order_rate_threshold_change_req_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_sent, 0)
  :: pattern == 1 -> fill_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_sent, 32)
  :: pattern == 2 -> fill_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_sent, 255)
  :: else -> ramp_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_sent);
    assert(at == 40);
    at = 0;
    decode_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_got);
    assert(at == 40);
    equal_cp_order_rate_threshold_change_req_message(cp_order_rate_threshold_change_req_message_got, cp_order_rate_threshold_change_req_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_common_header()
  :: run check_login_request_message()
  :: run check_replay_request_message()
  :: run check_replay_all_request_message()
  :: run check_stream_request_message()
  :: run check_sbe_header()
  :: run check_risk_settings_query_message()
  :: run check_active_risk_threshold_change_req_message()
  :: run check_active_risk_acknowledgement_req_message()
  :: run check_cp_volume_threshold_change_req_message()
  :: run check_cp_executed_notional_threshold_change_req_message()
  :: run check_cp_total_executions_threshold_change_req_message()
  :: run check_cp_percent_outstanding_contracts_threshold_change_req_message()
  :: run check_cp_breach_count_threshold_change_req_message()
  :: run check_manual_cp_breach_trigger_req_message()
  :: run check_cp_clear_breach_req_message()
  :: run check_single_order_allow_iso_orders_change_req_message()
  :: run check_single_order_allow_orders_in_crossed_market_change_req_message()
  :: run check_single_order_max_notional_change_req_message()
  :: run check_single_order_max_contracts_change_req_message()
  :: run check_cp_gross_notional_threshold_change_req_message()
  :: run check_cp_market_order_gross_notional_threshold_change_req_message()
  :: run check_cp_net_notional_threshold_change_req_message()
  :: run check_cp_market_order_net_notional_threshold_change_req_message()
  :: run check_cp_duplicate_order_threshold_change_req_message()
  :: run check_cp_order_rate_threshold_change_req_message()
  fi
}
