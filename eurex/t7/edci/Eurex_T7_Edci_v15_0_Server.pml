/*
 * Eurex Exchange Extended Derivatives Clearing Interface
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
 *   - a length prefix framing what follows
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 32

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 6 bytes ------------------------------------------------- */

/* Eurex T7 Edci message header */
typedef MessageHeader {
  byte body_len[4];
  byte template_id[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 6 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.body_len[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 6 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.body_len[message_header_at] == message_header_written.body_len[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Rbc Header Comp: 32 bytes ----------------------------------------------- */

typedef RbcHeaderComp {
  byte sending_time[8];
  byte appl_seq_num[8];
  byte party_id_executing_unit[4];
  byte party_id_group[4];
  byte partition_id[2];
  byte appl_resend_flag;
  byte appl_id;
  byte last_fragment;
  byte pad3[3]
};

int rbc_header_comp_at;

/* every byte of Rbc Header Comp set to one value */
inline fill_rbc_header_comp(rbc_header_comp_record, rbc_header_comp_value) {
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> rbc_header_comp_record.sending_time[rbc_header_comp_at] = rbc_header_comp_value; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> rbc_header_comp_record.appl_seq_num[rbc_header_comp_at] = rbc_header_comp_value; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> rbc_header_comp_record.party_id_executing_unit[rbc_header_comp_at] = rbc_header_comp_value; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> rbc_header_comp_record.party_id_group[rbc_header_comp_at] = rbc_header_comp_value; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 2 -> rbc_header_comp_record.partition_id[rbc_header_comp_at] = rbc_header_comp_value; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_record.appl_resend_flag = rbc_header_comp_value;
  rbc_header_comp_record.appl_id = rbc_header_comp_value;
  rbc_header_comp_record.last_fragment = rbc_header_comp_value;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 3 -> rbc_header_comp_record.pad3[rbc_header_comp_at] = rbc_header_comp_value; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Rbc Header Comp set to where it lies, so a field read out of place says so */
inline ramp_rbc_header_comp(rbc_header_comp_record, rbc_header_comp_base) {
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> rbc_header_comp_record.sending_time[rbc_header_comp_at] = (rbc_header_comp_base + 0 + rbc_header_comp_at + 1) % 256; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> rbc_header_comp_record.appl_seq_num[rbc_header_comp_at] = (rbc_header_comp_base + 8 + rbc_header_comp_at + 1) % 256; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> rbc_header_comp_record.party_id_executing_unit[rbc_header_comp_at] = (rbc_header_comp_base + 16 + rbc_header_comp_at + 1) % 256; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> rbc_header_comp_record.party_id_group[rbc_header_comp_at] = (rbc_header_comp_base + 20 + rbc_header_comp_at + 1) % 256; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 2 -> rbc_header_comp_record.partition_id[rbc_header_comp_at] = (rbc_header_comp_base + 24 + rbc_header_comp_at + 1) % 256; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_record.appl_resend_flag = (rbc_header_comp_base + 26 + 1) % 256;
  rbc_header_comp_record.appl_id = (rbc_header_comp_base + 27 + 1) % 256;
  rbc_header_comp_record.last_fragment = (rbc_header_comp_base + 28 + 1) % 256;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 3 -> rbc_header_comp_record.pad3[rbc_header_comp_at] = (rbc_header_comp_base + 29 + rbc_header_comp_at + 1) % 256; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Rbc Header Comp to the wire, 32 bytes from where the cursor stands */
inline encode_rbc_header_comp(rbc_header_comp_record) {
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> wire[at] = rbc_header_comp_record.sending_time[rbc_header_comp_at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> wire[at] = rbc_header_comp_record.appl_seq_num[rbc_header_comp_at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> wire[at] = rbc_header_comp_record.party_id_executing_unit[rbc_header_comp_at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> wire[at] = rbc_header_comp_record.party_id_group[rbc_header_comp_at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 2 -> wire[at] = rbc_header_comp_record.partition_id[rbc_header_comp_at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  wire[at] = rbc_header_comp_record.appl_resend_flag; at = at + 1;
  wire[at] = rbc_header_comp_record.appl_id; at = at + 1;
  wire[at] = rbc_header_comp_record.last_fragment; at = at + 1;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 3 -> wire[at] = rbc_header_comp_record.pad3[rbc_header_comp_at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Rbc Header Comp off the wire, 32 bytes from where the cursor stands */
inline decode_rbc_header_comp(rbc_header_comp_record) {
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> rbc_header_comp_record.sending_time[rbc_header_comp_at] = wire[at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> rbc_header_comp_record.appl_seq_num[rbc_header_comp_at] = wire[at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> rbc_header_comp_record.party_id_executing_unit[rbc_header_comp_at] = wire[at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> rbc_header_comp_record.party_id_group[rbc_header_comp_at] = wire[at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 2 -> rbc_header_comp_record.partition_id[rbc_header_comp_at] = wire[at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_record.appl_resend_flag = wire[at]; at = at + 1;
  rbc_header_comp_record.appl_id = wire[at]; at = at + 1;
  rbc_header_comp_record.last_fragment = wire[at]; at = at + 1;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 3 -> rbc_header_comp_record.pad3[rbc_header_comp_at] = wire[at]; at = at + 1; rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Rbc Header Comp is what was written, byte for byte */
inline equal_rbc_header_comp(rbc_header_comp_read, rbc_header_comp_written) {
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> assert(rbc_header_comp_read.sending_time[rbc_header_comp_at] == rbc_header_comp_written.sending_time[rbc_header_comp_at]); rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 8 -> assert(rbc_header_comp_read.appl_seq_num[rbc_header_comp_at] == rbc_header_comp_written.appl_seq_num[rbc_header_comp_at]); rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> assert(rbc_header_comp_read.party_id_executing_unit[rbc_header_comp_at] == rbc_header_comp_written.party_id_executing_unit[rbc_header_comp_at]); rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 4 -> assert(rbc_header_comp_read.party_id_group[rbc_header_comp_at] == rbc_header_comp_written.party_id_group[rbc_header_comp_at]); rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 2 -> assert(rbc_header_comp_read.partition_id[rbc_header_comp_at] == rbc_header_comp_written.partition_id[rbc_header_comp_at]); rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  assert(rbc_header_comp_read.appl_resend_flag == rbc_header_comp_written.appl_resend_flag);
  assert(rbc_header_comp_read.appl_id == rbc_header_comp_written.appl_id);
  assert(rbc_header_comp_read.last_fragment == rbc_header_comp_written.last_fragment);
  rbc_header_comp_at = 0;
  do
  :: rbc_header_comp_at < 3 -> assert(rbc_header_comp_read.pad3[rbc_header_comp_at] == rbc_header_comp_written.pad3[rbc_header_comp_at]); rbc_header_comp_at = rbc_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Notif Header Comp: 8 bytes ---------------------------------------------- */

typedef NotifHeaderComp {
  byte sending_time[8]
};

int notif_header_comp_at;

/* every byte of Notif Header Comp set to one value */
inline fill_notif_header_comp(notif_header_comp_record, notif_header_comp_value) {
  notif_header_comp_at = 0;
  do
  :: notif_header_comp_at < 8 -> notif_header_comp_record.sending_time[notif_header_comp_at] = notif_header_comp_value; notif_header_comp_at = notif_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Notif Header Comp set to where it lies, so a field read out of place says so */
inline ramp_notif_header_comp(notif_header_comp_record, notif_header_comp_base) {
  notif_header_comp_at = 0;
  do
  :: notif_header_comp_at < 8 -> notif_header_comp_record.sending_time[notif_header_comp_at] = (notif_header_comp_base + 0 + notif_header_comp_at + 1) % 256; notif_header_comp_at = notif_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Notif Header Comp to the wire, 8 bytes from where the cursor stands */
inline encode_notif_header_comp(notif_header_comp_record) {
  notif_header_comp_at = 0;
  do
  :: notif_header_comp_at < 8 -> wire[at] = notif_header_comp_record.sending_time[notif_header_comp_at]; at = at + 1; notif_header_comp_at = notif_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Notif Header Comp off the wire, 8 bytes from where the cursor stands */
inline decode_notif_header_comp(notif_header_comp_record) {
  notif_header_comp_at = 0;
  do
  :: notif_header_comp_at < 8 -> notif_header_comp_record.sending_time[notif_header_comp_at] = wire[at]; at = at + 1; notif_header_comp_at = notif_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Notif Header Comp is what was written, byte for byte */
inline equal_notif_header_comp(notif_header_comp_read, notif_header_comp_written) {
  notif_header_comp_at = 0;
  do
  :: notif_header_comp_at < 8 -> assert(notif_header_comp_read.sending_time[notif_header_comp_at] == notif_header_comp_written.sending_time[notif_header_comp_at]); notif_header_comp_at = notif_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Response Header Comp: 24 bytes ------------------------------------------ */

typedef ResponseHeaderComp {
  byte request_time[8];
  byte sending_time[8];
  byte msg_seq_num[4];
  byte last_fragment;
  byte pad3[3]
};

int response_header_comp_at;

/* every byte of Response Header Comp set to one value */
inline fill_response_header_comp(response_header_comp_record, response_header_comp_value) {
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> response_header_comp_record.request_time[response_header_comp_at] = response_header_comp_value; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> response_header_comp_record.sending_time[response_header_comp_at] = response_header_comp_value; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 4 -> response_header_comp_record.msg_seq_num[response_header_comp_at] = response_header_comp_value; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_record.last_fragment = response_header_comp_value;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 3 -> response_header_comp_record.pad3[response_header_comp_at] = response_header_comp_value; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Response Header Comp set to where it lies, so a field read out of place says so */
inline ramp_response_header_comp(response_header_comp_record, response_header_comp_base) {
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> response_header_comp_record.request_time[response_header_comp_at] = (response_header_comp_base + 0 + response_header_comp_at + 1) % 256; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> response_header_comp_record.sending_time[response_header_comp_at] = (response_header_comp_base + 8 + response_header_comp_at + 1) % 256; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 4 -> response_header_comp_record.msg_seq_num[response_header_comp_at] = (response_header_comp_base + 16 + response_header_comp_at + 1) % 256; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_record.last_fragment = (response_header_comp_base + 20 + 1) % 256;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 3 -> response_header_comp_record.pad3[response_header_comp_at] = (response_header_comp_base + 21 + response_header_comp_at + 1) % 256; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Response Header Comp to the wire, 24 bytes from where the cursor stands */
inline encode_response_header_comp(response_header_comp_record) {
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> wire[at] = response_header_comp_record.request_time[response_header_comp_at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> wire[at] = response_header_comp_record.sending_time[response_header_comp_at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 4 -> wire[at] = response_header_comp_record.msg_seq_num[response_header_comp_at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  wire[at] = response_header_comp_record.last_fragment; at = at + 1;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 3 -> wire[at] = response_header_comp_record.pad3[response_header_comp_at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Response Header Comp off the wire, 24 bytes from where the cursor stands */
inline decode_response_header_comp(response_header_comp_record) {
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> response_header_comp_record.request_time[response_header_comp_at] = wire[at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> response_header_comp_record.sending_time[response_header_comp_at] = wire[at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 4 -> response_header_comp_record.msg_seq_num[response_header_comp_at] = wire[at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_record.last_fragment = wire[at]; at = at + 1;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 3 -> response_header_comp_record.pad3[response_header_comp_at] = wire[at]; at = at + 1; response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Response Header Comp is what was written, byte for byte */
inline equal_response_header_comp(response_header_comp_read, response_header_comp_written) {
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> assert(response_header_comp_read.request_time[response_header_comp_at] == response_header_comp_written.request_time[response_header_comp_at]); response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 8 -> assert(response_header_comp_read.sending_time[response_header_comp_at] == response_header_comp_written.sending_time[response_header_comp_at]); response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 4 -> assert(response_header_comp_read.msg_seq_num[response_header_comp_at] == response_header_comp_written.msg_seq_num[response_header_comp_at]); response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  assert(response_header_comp_read.last_fragment == response_header_comp_written.last_fragment);
  response_header_comp_at = 0;
  do
  :: response_header_comp_at < 3 -> assert(response_header_comp_read.pad3[response_header_comp_at] == response_header_comp_written.pad3[response_header_comp_at]); response_header_comp_at = response_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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
    assert(at == 6);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 6);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Rbc Header Comp: encoded, read back, and compared */
proctype check_rbc_header_comp() {
  RbcHeaderComp rbc_header_comp_sent;
  RbcHeaderComp rbc_header_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rbc_header_comp(rbc_header_comp_sent, 0)
  :: pattern == 1 -> fill_rbc_header_comp(rbc_header_comp_sent, 32)
  :: pattern == 2 -> fill_rbc_header_comp(rbc_header_comp_sent, 255)
  :: else -> ramp_rbc_header_comp(rbc_header_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rbc_header_comp(rbc_header_comp_sent);
    assert(at == 32);
    at = 0;
    decode_rbc_header_comp(rbc_header_comp_got);
    assert(at == 32);
    equal_rbc_header_comp(rbc_header_comp_got, rbc_header_comp_sent)
  }
}

/* Notif Header Comp: encoded, read back, and compared */
proctype check_notif_header_comp() {
  NotifHeaderComp notif_header_comp_sent;
  NotifHeaderComp notif_header_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_notif_header_comp(notif_header_comp_sent, 0)
  :: pattern == 1 -> fill_notif_header_comp(notif_header_comp_sent, 32)
  :: pattern == 2 -> fill_notif_header_comp(notif_header_comp_sent, 255)
  :: else -> ramp_notif_header_comp(notif_header_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_notif_header_comp(notif_header_comp_sent);
    assert(at == 8);
    at = 0;
    decode_notif_header_comp(notif_header_comp_got);
    assert(at == 8);
    equal_notif_header_comp(notif_header_comp_got, notif_header_comp_sent)
  }
}

/* Response Header Comp: encoded, read back, and compared */
proctype check_response_header_comp() {
  ResponseHeaderComp response_header_comp_sent;
  ResponseHeaderComp response_header_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_response_header_comp(response_header_comp_sent, 0)
  :: pattern == 1 -> fill_response_header_comp(response_header_comp_sent, 32)
  :: pattern == 2 -> fill_response_header_comp(response_header_comp_sent, 255)
  :: else -> ramp_response_header_comp(response_header_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_response_header_comp(response_header_comp_sent);
    assert(at == 24);
    at = 0;
    decode_response_header_comp(response_header_comp_got);
    assert(at == 24);
    equal_response_header_comp(response_header_comp_got, response_header_comp_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_rbc_header_comp()
  :: run check_notif_header_comp()
  :: run check_response_header_comp()
  fi
}
