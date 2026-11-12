/*
 * Taiwan Futures Exchange Clearing Member Order And Execution Report
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
 *   - a run of a stated number of entries
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 40

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Header Time: 6 bytes ---------------------------------------------------- */

/* Message time, the Tmp time format of section 2.1 carried by the common message header */
typedef HeaderTime {
  byte header_epoch_s[4];
  byte header_ms[2]
};

int header_time_at;

/* every byte of Header Time set to one value */
inline fill_header_time(header_time_record, header_time_value) {
  header_time_at = 0;
  do
  :: header_time_at < 4 -> header_time_record.header_epoch_s[header_time_at] = header_time_value; header_time_at = header_time_at + 1
  :: else -> break
  od;
  header_time_at = 0;
  do
  :: header_time_at < 2 -> header_time_record.header_ms[header_time_at] = header_time_value; header_time_at = header_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Header Time set to where it lies, so a field read out of place says so */
inline ramp_header_time(header_time_record, header_time_base) {
  header_time_at = 0;
  do
  :: header_time_at < 4 -> header_time_record.header_epoch_s[header_time_at] = (header_time_base + 0 + header_time_at + 1) % 256; header_time_at = header_time_at + 1
  :: else -> break
  od;
  header_time_at = 0;
  do
  :: header_time_at < 2 -> header_time_record.header_ms[header_time_at] = (header_time_base + 4 + header_time_at + 1) % 256; header_time_at = header_time_at + 1
  :: else -> break
  od;
  skip
}

/* Header Time to the wire, 6 bytes from where the cursor stands */
inline encode_header_time(header_time_record) {
  header_time_at = 0;
  do
  :: header_time_at < 4 -> wire[at] = header_time_record.header_epoch_s[header_time_at]; at = at + 1; header_time_at = header_time_at + 1
  :: else -> break
  od;
  header_time_at = 0;
  do
  :: header_time_at < 2 -> wire[at] = header_time_record.header_ms[header_time_at]; at = at + 1; header_time_at = header_time_at + 1
  :: else -> break
  od;
  skip
}

/* Header Time off the wire, 6 bytes from where the cursor stands */
inline decode_header_time(header_time_record) {
  header_time_at = 0;
  do
  :: header_time_at < 4 -> header_time_record.header_epoch_s[header_time_at] = wire[at]; at = at + 1; header_time_at = header_time_at + 1
  :: else -> break
  od;
  header_time_at = 0;
  do
  :: header_time_at < 2 -> header_time_record.header_ms[header_time_at] = wire[at]; at = at + 1; header_time_at = header_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Header Time is what was written, byte for byte */
inline equal_header_time(header_time_read, header_time_written) {
  header_time_at = 0;
  do
  :: header_time_at < 4 -> assert(header_time_read.header_epoch_s[header_time_at] == header_time_written.header_epoch_s[header_time_at]); header_time_at = header_time_at + 1
  :: else -> break
  od;
  header_time_at = 0;
  do
  :: header_time_at < 2 -> assert(header_time_read.header_ms[header_time_at] == header_time_written.header_ms[header_time_at]); header_time_at = header_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Hdr: 17 bytes ----------------------------------------------------------- */

/* Tmp Common message header, carried by every Tmp message */
typedef Hdr {
  byte msg_length[2];
  byte msg_seq_num[4];
  HeaderTime header_time;
  byte message_type;
  byte fcm_id[2];
  byte session_id[2]
};

int hdr_at;

/* every byte of Hdr set to one value */
inline fill_hdr(hdr_record, hdr_value) {
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.msg_length[hdr_at] = hdr_value; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 4 -> hdr_record.msg_seq_num[hdr_at] = hdr_value; hdr_at = hdr_at + 1
  :: else -> break
  od;
  fill_header_time(hdr_record.header_time, hdr_value);
  hdr_record.message_type = hdr_value;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.fcm_id[hdr_at] = hdr_value; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.session_id[hdr_at] = hdr_value; hdr_at = hdr_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Hdr set to where it lies, so a field read out of place says so */
inline ramp_hdr(hdr_record, hdr_base) {
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.msg_length[hdr_at] = (hdr_base + 0 + hdr_at + 1) % 256; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 4 -> hdr_record.msg_seq_num[hdr_at] = (hdr_base + 2 + hdr_at + 1) % 256; hdr_at = hdr_at + 1
  :: else -> break
  od;
  ramp_header_time(hdr_record.header_time, hdr_base + 6);
  hdr_record.message_type = (hdr_base + 12 + 1) % 256;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.fcm_id[hdr_at] = (hdr_base + 13 + hdr_at + 1) % 256; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.session_id[hdr_at] = (hdr_base + 15 + hdr_at + 1) % 256; hdr_at = hdr_at + 1
  :: else -> break
  od;
  skip
}

/* Hdr to the wire, 17 bytes from where the cursor stands */
inline encode_hdr(hdr_record) {
  hdr_at = 0;
  do
  :: hdr_at < 2 -> wire[at] = hdr_record.msg_length[hdr_at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 4 -> wire[at] = hdr_record.msg_seq_num[hdr_at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  encode_header_time(hdr_record.header_time);
  wire[at] = hdr_record.message_type; at = at + 1;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> wire[at] = hdr_record.fcm_id[hdr_at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> wire[at] = hdr_record.session_id[hdr_at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  skip
}

/* Hdr off the wire, 17 bytes from where the cursor stands */
inline decode_hdr(hdr_record) {
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.msg_length[hdr_at] = wire[at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 4 -> hdr_record.msg_seq_num[hdr_at] = wire[at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  decode_header_time(hdr_record.header_time);
  hdr_record.message_type = wire[at]; at = at + 1;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.fcm_id[hdr_at] = wire[at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> hdr_record.session_id[hdr_at] = wire[at]; at = at + 1; hdr_at = hdr_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Hdr is what was written, byte for byte */
inline equal_hdr(hdr_read, hdr_written) {
  hdr_at = 0;
  do
  :: hdr_at < 2 -> assert(hdr_read.msg_length[hdr_at] == hdr_written.msg_length[hdr_at]); hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 4 -> assert(hdr_read.msg_seq_num[hdr_at] == hdr_written.msg_seq_num[hdr_at]); hdr_at = hdr_at + 1
  :: else -> break
  od;
  equal_header_time(hdr_read.header_time, hdr_written.header_time);
  assert(hdr_read.message_type == hdr_written.message_type);
  hdr_at = 0;
  do
  :: hdr_at < 2 -> assert(hdr_read.fcm_id[hdr_at] == hdr_written.fcm_id[hdr_at]); hdr_at = hdr_at + 1
  :: else -> break
  od;
  hdr_at = 0;
  do
  :: hdr_at < 2 -> assert(hdr_read.session_id[hdr_at] == hdr_written.session_id[hdr_at]); hdr_at = hdr_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Wake Up Call Message: 5 bytes ------------------------------------------- */

/* Wake up call message, which either Taifex or the futures commission merchant may initiate in the logon phase of the Link Subsystem. */
typedef WakeUpCallMessage {
  byte status_code;
  byte start_in_bound_num[4]
};

int wake_up_call_message_at;

/* every byte of Wake Up Call Message set to one value */
inline fill_wake_up_call_message(wake_up_call_message_record, wake_up_call_message_value) {
  wake_up_call_message_record.status_code = wake_up_call_message_value;
  wake_up_call_message_at = 0;
  do
  :: wake_up_call_message_at < 4 -> wake_up_call_message_record.start_in_bound_num[wake_up_call_message_at] = wake_up_call_message_value; wake_up_call_message_at = wake_up_call_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Wake Up Call Message set to where it lies, so a field read out of place says so */
inline ramp_wake_up_call_message(wake_up_call_message_record, wake_up_call_message_base) {
  wake_up_call_message_record.status_code = (wake_up_call_message_base + 0 + 1) % 256;
  wake_up_call_message_at = 0;
  do
  :: wake_up_call_message_at < 4 -> wake_up_call_message_record.start_in_bound_num[wake_up_call_message_at] = (wake_up_call_message_base + 1 + wake_up_call_message_at + 1) % 256; wake_up_call_message_at = wake_up_call_message_at + 1
  :: else -> break
  od;
  skip
}

/* Wake Up Call Message to the wire, 5 bytes from where the cursor stands */
inline encode_wake_up_call_message(wake_up_call_message_record) {
  wire[at] = wake_up_call_message_record.status_code; at = at + 1;
  wake_up_call_message_at = 0;
  do
  :: wake_up_call_message_at < 4 -> wire[at] = wake_up_call_message_record.start_in_bound_num[wake_up_call_message_at]; at = at + 1; wake_up_call_message_at = wake_up_call_message_at + 1
  :: else -> break
  od;
  skip
}

/* Wake Up Call Message off the wire, 5 bytes from where the cursor stands */
inline decode_wake_up_call_message(wake_up_call_message_record) {
  wake_up_call_message_record.status_code = wire[at]; at = at + 1;
  wake_up_call_message_at = 0;
  do
  :: wake_up_call_message_at < 4 -> wake_up_call_message_record.start_in_bound_num[wake_up_call_message_at] = wire[at]; at = at + 1; wake_up_call_message_at = wake_up_call_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Wake Up Call Message is what was written, byte for byte */
inline equal_wake_up_call_message(wake_up_call_message_read, wake_up_call_message_written) {
  assert(wake_up_call_message_read.status_code == wake_up_call_message_written.status_code);
  wake_up_call_message_at = 0;
  do
  :: wake_up_call_message_at < 4 -> assert(wake_up_call_message_read.start_in_bound_num[wake_up_call_message_at] == wake_up_call_message_written.start_in_bound_num[wake_up_call_message_at]); wake_up_call_message_at = wake_up_call_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Wake Up Call Confirmed Message: 1 bytes --------------------------------- */

/* Wake up call confirmed message, sent by the futures commission merchant to Taifex. */
typedef WakeUpCallConfirmedMessage {
  byte version
};

/* every byte of Wake Up Call Confirmed Message set to one value */
inline fill_wake_up_call_confirmed_message(wake_up_call_confirmed_message_record, wake_up_call_confirmed_message_value) {
  wake_up_call_confirmed_message_record.version = wake_up_call_confirmed_message_value;
  skip
}

/* each byte of Wake Up Call Confirmed Message set to where it lies, so a field read out of place says so */
inline ramp_wake_up_call_confirmed_message(wake_up_call_confirmed_message_record, wake_up_call_confirmed_message_base) {
  wake_up_call_confirmed_message_record.version = (wake_up_call_confirmed_message_base + 0 + 1) % 256;
  skip
}

/* Wake Up Call Confirmed Message to the wire, 1 bytes from where the cursor stands */
inline encode_wake_up_call_confirmed_message(wake_up_call_confirmed_message_record) {
  wire[at] = wake_up_call_confirmed_message_record.version; at = at + 1;
  skip
}

/* Wake Up Call Confirmed Message off the wire, 1 bytes from where the cursor stands */
inline decode_wake_up_call_confirmed_message(wake_up_call_confirmed_message_record) {
  wake_up_call_confirmed_message_record.version = wire[at]; at = at + 1;
  skip
}

/* what was read of Wake Up Call Confirmed Message is what was written, byte for byte */
inline equal_wake_up_call_confirmed_message(wake_up_call_confirmed_message_read, wake_up_call_confirmed_message_written) {
  assert(wake_up_call_confirmed_message_read.version == wake_up_call_confirmed_message_written.version);
  skip
}

/* ---- Logon Notice Message: 9 bytes ------------------------------------------- */

/* Logon notice message, carrying the sequence No of the last message Taifex sent the futures commission merchant in the session. */
typedef LogonNoticeMessage {
  byte status_code;
  byte append_no[2];
  byte end_out_bound_num[4];
  byte system_type;
  byte encrypt_method
};

int logon_notice_message_at;

/* every byte of Logon Notice Message set to one value */
inline fill_logon_notice_message(logon_notice_message_record, logon_notice_message_value) {
  logon_notice_message_record.status_code = logon_notice_message_value;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 2 -> logon_notice_message_record.append_no[logon_notice_message_at] = logon_notice_message_value; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 4 -> logon_notice_message_record.end_out_bound_num[logon_notice_message_at] = logon_notice_message_value; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_record.system_type = logon_notice_message_value;
  logon_notice_message_record.encrypt_method = logon_notice_message_value;
  skip
}

/* each byte of Logon Notice Message set to where it lies, so a field read out of place says so */
inline ramp_logon_notice_message(logon_notice_message_record, logon_notice_message_base) {
  logon_notice_message_record.status_code = (logon_notice_message_base + 0 + 1) % 256;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 2 -> logon_notice_message_record.append_no[logon_notice_message_at] = (logon_notice_message_base + 1 + logon_notice_message_at + 1) % 256; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 4 -> logon_notice_message_record.end_out_bound_num[logon_notice_message_at] = (logon_notice_message_base + 3 + logon_notice_message_at + 1) % 256; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_record.system_type = (logon_notice_message_base + 7 + 1) % 256;
  logon_notice_message_record.encrypt_method = (logon_notice_message_base + 8 + 1) % 256;
  skip
}

/* Logon Notice Message to the wire, 9 bytes from where the cursor stands */
inline encode_logon_notice_message(logon_notice_message_record) {
  wire[at] = logon_notice_message_record.status_code; at = at + 1;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 2 -> wire[at] = logon_notice_message_record.append_no[logon_notice_message_at]; at = at + 1; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 4 -> wire[at] = logon_notice_message_record.end_out_bound_num[logon_notice_message_at]; at = at + 1; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_notice_message_record.system_type; at = at + 1;
  wire[at] = logon_notice_message_record.encrypt_method; at = at + 1;
  skip
}

/* Logon Notice Message off the wire, 9 bytes from where the cursor stands */
inline decode_logon_notice_message(logon_notice_message_record) {
  logon_notice_message_record.status_code = wire[at]; at = at + 1;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 2 -> logon_notice_message_record.append_no[logon_notice_message_at] = wire[at]; at = at + 1; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 4 -> logon_notice_message_record.end_out_bound_num[logon_notice_message_at] = wire[at]; at = at + 1; logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_record.system_type = wire[at]; at = at + 1;
  logon_notice_message_record.encrypt_method = wire[at]; at = at + 1;
  skip
}

/* what was read of Logon Notice Message is what was written, byte for byte */
inline equal_logon_notice_message(logon_notice_message_read, logon_notice_message_written) {
  assert(logon_notice_message_read.status_code == logon_notice_message_written.status_code);
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 2 -> assert(logon_notice_message_read.append_no[logon_notice_message_at] == logon_notice_message_written.append_no[logon_notice_message_at]); logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  logon_notice_message_at = 0;
  do
  :: logon_notice_message_at < 4 -> assert(logon_notice_message_read.end_out_bound_num[logon_notice_message_at] == logon_notice_message_written.end_out_bound_num[logon_notice_message_at]); logon_notice_message_at = logon_notice_message_at + 1
  :: else -> break
  od;
  assert(logon_notice_message_read.system_type == logon_notice_message_written.system_type);
  assert(logon_notice_message_read.encrypt_method == logon_notice_message_written.encrypt_method);
  skip
}

/* ---- Sub Hdr: 6 bytes -------------------------------------------------------- */

/* Tmp Expanded Message Header, which assigns different functionalities to a MessageType by defining additional subcategories for it */
typedef SubHdr {
  byte msg_type_ext;
  byte preserve;
  byte msg_time_ns[4]
};

int sub_hdr_at;

/* every byte of Sub Hdr set to one value */
inline fill_sub_hdr(sub_hdr_record, sub_hdr_value) {
  sub_hdr_record.msg_type_ext = sub_hdr_value;
  sub_hdr_record.preserve = sub_hdr_value;
  sub_hdr_at = 0;
  do
  :: sub_hdr_at < 4 -> sub_hdr_record.msg_time_ns[sub_hdr_at] = sub_hdr_value; sub_hdr_at = sub_hdr_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sub Hdr set to where it lies, so a field read out of place says so */
inline ramp_sub_hdr(sub_hdr_record, sub_hdr_base) {
  sub_hdr_record.msg_type_ext = (sub_hdr_base + 0 + 1) % 256;
  sub_hdr_record.preserve = (sub_hdr_base + 1 + 1) % 256;
  sub_hdr_at = 0;
  do
  :: sub_hdr_at < 4 -> sub_hdr_record.msg_time_ns[sub_hdr_at] = (sub_hdr_base + 2 + sub_hdr_at + 1) % 256; sub_hdr_at = sub_hdr_at + 1
  :: else -> break
  od;
  skip
}

/* Sub Hdr to the wire, 6 bytes from where the cursor stands */
inline encode_sub_hdr(sub_hdr_record) {
  wire[at] = sub_hdr_record.msg_type_ext; at = at + 1;
  wire[at] = sub_hdr_record.preserve; at = at + 1;
  sub_hdr_at = 0;
  do
  :: sub_hdr_at < 4 -> wire[at] = sub_hdr_record.msg_time_ns[sub_hdr_at]; at = at + 1; sub_hdr_at = sub_hdr_at + 1
  :: else -> break
  od;
  skip
}

/* Sub Hdr off the wire, 6 bytes from where the cursor stands */
inline decode_sub_hdr(sub_hdr_record) {
  sub_hdr_record.msg_type_ext = wire[at]; at = at + 1;
  sub_hdr_record.preserve = wire[at]; at = at + 1;
  sub_hdr_at = 0;
  do
  :: sub_hdr_at < 4 -> sub_hdr_record.msg_time_ns[sub_hdr_at] = wire[at]; at = at + 1; sub_hdr_at = sub_hdr_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sub Hdr is what was written, byte for byte */
inline equal_sub_hdr(sub_hdr_read, sub_hdr_written) {
  assert(sub_hdr_read.msg_type_ext == sub_hdr_written.msg_type_ext);
  assert(sub_hdr_read.preserve == sub_hdr_written.preserve);
  sub_hdr_at = 0;
  do
  :: sub_hdr_at < 4 -> assert(sub_hdr_read.msg_time_ns[sub_hdr_at] == sub_hdr_written.msg_time_ns[sub_hdr_at]); sub_hdr_at = sub_hdr_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Final Sequential Number Notification For Group Message: 21 bytes -------- */

/* Final Sequential Number Notification Message for Group, transmitting the group's last report sequence number to the futures commission merchant. */
typedef FinalSequentialNumberNotificationForGroupMessage {
  SubHdr sub_hdr;
  byte wide_status_code[2];
  byte part_id;
  byte end_out_bound_num[4];
  byte reserved_8[8]
};

int final_sequential_number_notification_for_group_message_at;

/* every byte of Final Sequential Number Notification For Group Message set to one value */
inline fill_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_record, final_sequential_number_notification_for_group_message_value) {
  fill_sub_hdr(final_sequential_number_notification_for_group_message_record.sub_hdr, final_sequential_number_notification_for_group_message_value);
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 2 -> final_sequential_number_notification_for_group_message_record.wide_status_code[final_sequential_number_notification_for_group_message_at] = final_sequential_number_notification_for_group_message_value; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_record.part_id = final_sequential_number_notification_for_group_message_value;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 4 -> final_sequential_number_notification_for_group_message_record.end_out_bound_num[final_sequential_number_notification_for_group_message_at] = final_sequential_number_notification_for_group_message_value; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 8 -> final_sequential_number_notification_for_group_message_record.reserved_8[final_sequential_number_notification_for_group_message_at] = final_sequential_number_notification_for_group_message_value; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Final Sequential Number Notification For Group Message set to where it lies, so a field read out of place says so */
inline ramp_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_record, final_sequential_number_notification_for_group_message_base) {
  ramp_sub_hdr(final_sequential_number_notification_for_group_message_record.sub_hdr, final_sequential_number_notification_for_group_message_base + 0);
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 2 -> final_sequential_number_notification_for_group_message_record.wide_status_code[final_sequential_number_notification_for_group_message_at] = (final_sequential_number_notification_for_group_message_base + 6 + final_sequential_number_notification_for_group_message_at + 1) % 256; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_record.part_id = (final_sequential_number_notification_for_group_message_base + 8 + 1) % 256;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 4 -> final_sequential_number_notification_for_group_message_record.end_out_bound_num[final_sequential_number_notification_for_group_message_at] = (final_sequential_number_notification_for_group_message_base + 9 + final_sequential_number_notification_for_group_message_at + 1) % 256; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 8 -> final_sequential_number_notification_for_group_message_record.reserved_8[final_sequential_number_notification_for_group_message_at] = (final_sequential_number_notification_for_group_message_base + 13 + final_sequential_number_notification_for_group_message_at + 1) % 256; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  skip
}

/* Final Sequential Number Notification For Group Message to the wire, 21 bytes from where the cursor stands */
inline encode_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_record) {
  encode_sub_hdr(final_sequential_number_notification_for_group_message_record.sub_hdr);
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 2 -> wire[at] = final_sequential_number_notification_for_group_message_record.wide_status_code[final_sequential_number_notification_for_group_message_at]; at = at + 1; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  wire[at] = final_sequential_number_notification_for_group_message_record.part_id; at = at + 1;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 4 -> wire[at] = final_sequential_number_notification_for_group_message_record.end_out_bound_num[final_sequential_number_notification_for_group_message_at]; at = at + 1; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 8 -> wire[at] = final_sequential_number_notification_for_group_message_record.reserved_8[final_sequential_number_notification_for_group_message_at]; at = at + 1; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  skip
}

/* Final Sequential Number Notification For Group Message off the wire, 21 bytes from where the cursor stands */
inline decode_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_record) {
  decode_sub_hdr(final_sequential_number_notification_for_group_message_record.sub_hdr);
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 2 -> final_sequential_number_notification_for_group_message_record.wide_status_code[final_sequential_number_notification_for_group_message_at] = wire[at]; at = at + 1; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_record.part_id = wire[at]; at = at + 1;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 4 -> final_sequential_number_notification_for_group_message_record.end_out_bound_num[final_sequential_number_notification_for_group_message_at] = wire[at]; at = at + 1; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 8 -> final_sequential_number_notification_for_group_message_record.reserved_8[final_sequential_number_notification_for_group_message_at] = wire[at]; at = at + 1; final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Final Sequential Number Notification For Group Message is what was written, byte for byte */
inline equal_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_read, final_sequential_number_notification_for_group_message_written) {
  equal_sub_hdr(final_sequential_number_notification_for_group_message_read.sub_hdr, final_sequential_number_notification_for_group_message_written.sub_hdr);
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 2 -> assert(final_sequential_number_notification_for_group_message_read.wide_status_code[final_sequential_number_notification_for_group_message_at] == final_sequential_number_notification_for_group_message_written.wide_status_code[final_sequential_number_notification_for_group_message_at]); final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  assert(final_sequential_number_notification_for_group_message_read.part_id == final_sequential_number_notification_for_group_message_written.part_id);
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 4 -> assert(final_sequential_number_notification_for_group_message_read.end_out_bound_num[final_sequential_number_notification_for_group_message_at] == final_sequential_number_notification_for_group_message_written.end_out_bound_num[final_sequential_number_notification_for_group_message_at]); final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  final_sequential_number_notification_for_group_message_at = 0;
  do
  :: final_sequential_number_notification_for_group_message_at < 8 -> assert(final_sequential_number_notification_for_group_message_read.reserved_8[final_sequential_number_notification_for_group_message_at] == final_sequential_number_notification_for_group_message_written.reserved_8[final_sequential_number_notification_for_group_message_at]); final_sequential_number_notification_for_group_message_at = final_sequential_number_notification_for_group_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request Logon Message: 15 bytes ----------------------------------------- */

/* Request logon, sent by the futures commission merchant to Taifex with the start sequence of the messages it requests Taifex to resend. */
typedef RequestLogonMessage {
  byte status_code;
  byte append_no[2];
  byte fcm_id[2];
  byte session_id[2];
  byte system_type;
  byte ap_code;
  byte key_value;
  byte request_start_seq[4];
  byte cancel_order_sec
};

int request_logon_message_at;

/* every byte of Request Logon Message set to one value */
inline fill_request_logon_message(request_logon_message_record, request_logon_message_value) {
  request_logon_message_record.status_code = request_logon_message_value;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.append_no[request_logon_message_at] = request_logon_message_value; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.fcm_id[request_logon_message_at] = request_logon_message_value; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.session_id[request_logon_message_at] = request_logon_message_value; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_record.system_type = request_logon_message_value;
  request_logon_message_record.ap_code = request_logon_message_value;
  request_logon_message_record.key_value = request_logon_message_value;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 4 -> request_logon_message_record.request_start_seq[request_logon_message_at] = request_logon_message_value; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_record.cancel_order_sec = request_logon_message_value;
  skip
}

/* each byte of Request Logon Message set to where it lies, so a field read out of place says so */
inline ramp_request_logon_message(request_logon_message_record, request_logon_message_base) {
  request_logon_message_record.status_code = (request_logon_message_base + 0 + 1) % 256;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.append_no[request_logon_message_at] = (request_logon_message_base + 1 + request_logon_message_at + 1) % 256; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.fcm_id[request_logon_message_at] = (request_logon_message_base + 3 + request_logon_message_at + 1) % 256; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.session_id[request_logon_message_at] = (request_logon_message_base + 5 + request_logon_message_at + 1) % 256; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_record.system_type = (request_logon_message_base + 7 + 1) % 256;
  request_logon_message_record.ap_code = (request_logon_message_base + 8 + 1) % 256;
  request_logon_message_record.key_value = (request_logon_message_base + 9 + 1) % 256;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 4 -> request_logon_message_record.request_start_seq[request_logon_message_at] = (request_logon_message_base + 10 + request_logon_message_at + 1) % 256; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_record.cancel_order_sec = (request_logon_message_base + 14 + 1) % 256;
  skip
}

/* Request Logon Message to the wire, 15 bytes from where the cursor stands */
inline encode_request_logon_message(request_logon_message_record) {
  wire[at] = request_logon_message_record.status_code; at = at + 1;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> wire[at] = request_logon_message_record.append_no[request_logon_message_at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> wire[at] = request_logon_message_record.fcm_id[request_logon_message_at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> wire[at] = request_logon_message_record.session_id[request_logon_message_at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  wire[at] = request_logon_message_record.system_type; at = at + 1;
  wire[at] = request_logon_message_record.ap_code; at = at + 1;
  wire[at] = request_logon_message_record.key_value; at = at + 1;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 4 -> wire[at] = request_logon_message_record.request_start_seq[request_logon_message_at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  wire[at] = request_logon_message_record.cancel_order_sec; at = at + 1;
  skip
}

/* Request Logon Message off the wire, 15 bytes from where the cursor stands */
inline decode_request_logon_message(request_logon_message_record) {
  request_logon_message_record.status_code = wire[at]; at = at + 1;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.append_no[request_logon_message_at] = wire[at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.fcm_id[request_logon_message_at] = wire[at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> request_logon_message_record.session_id[request_logon_message_at] = wire[at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_record.system_type = wire[at]; at = at + 1;
  request_logon_message_record.ap_code = wire[at]; at = at + 1;
  request_logon_message_record.key_value = wire[at]; at = at + 1;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 4 -> request_logon_message_record.request_start_seq[request_logon_message_at] = wire[at]; at = at + 1; request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_record.cancel_order_sec = wire[at]; at = at + 1;
  skip
}

/* what was read of Request Logon Message is what was written, byte for byte */
inline equal_request_logon_message(request_logon_message_read, request_logon_message_written) {
  assert(request_logon_message_read.status_code == request_logon_message_written.status_code);
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> assert(request_logon_message_read.append_no[request_logon_message_at] == request_logon_message_written.append_no[request_logon_message_at]); request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> assert(request_logon_message_read.fcm_id[request_logon_message_at] == request_logon_message_written.fcm_id[request_logon_message_at]); request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 2 -> assert(request_logon_message_read.session_id[request_logon_message_at] == request_logon_message_written.session_id[request_logon_message_at]); request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  assert(request_logon_message_read.system_type == request_logon_message_written.system_type);
  assert(request_logon_message_read.ap_code == request_logon_message_written.ap_code);
  assert(request_logon_message_read.key_value == request_logon_message_written.key_value);
  request_logon_message_at = 0;
  do
  :: request_logon_message_at < 4 -> assert(request_logon_message_read.request_start_seq[request_logon_message_at] == request_logon_message_written.request_start_seq[request_logon_message_at]); request_logon_message_at = request_logon_message_at + 1
  :: else -> break
  od;
  assert(request_logon_message_read.cancel_order_sec == request_logon_message_written.cancel_order_sec);
  skip
}

/* ---- Activate Application System Message: 4 bytes ---------------------------- */

/* Activate application system, sent by Taifex to the futures commission merchant. */
typedef ActivateApplicationSystemMessage {
  byte status_code;
  byte heart_bt_int;
  byte max_flow_ctrl_cnt[2]
};

int activate_application_system_message_at;

/* every byte of Activate Application System Message set to one value */
inline fill_activate_application_system_message(activate_application_system_message_record, activate_application_system_message_value) {
  activate_application_system_message_record.status_code = activate_application_system_message_value;
  activate_application_system_message_record.heart_bt_int = activate_application_system_message_value;
  activate_application_system_message_at = 0;
  do
  :: activate_application_system_message_at < 2 -> activate_application_system_message_record.max_flow_ctrl_cnt[activate_application_system_message_at] = activate_application_system_message_value; activate_application_system_message_at = activate_application_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Activate Application System Message set to where it lies, so a field read out of place says so */
inline ramp_activate_application_system_message(activate_application_system_message_record, activate_application_system_message_base) {
  activate_application_system_message_record.status_code = (activate_application_system_message_base + 0 + 1) % 256;
  activate_application_system_message_record.heart_bt_int = (activate_application_system_message_base + 1 + 1) % 256;
  activate_application_system_message_at = 0;
  do
  :: activate_application_system_message_at < 2 -> activate_application_system_message_record.max_flow_ctrl_cnt[activate_application_system_message_at] = (activate_application_system_message_base + 2 + activate_application_system_message_at + 1) % 256; activate_application_system_message_at = activate_application_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* Activate Application System Message to the wire, 4 bytes from where the cursor stands */
inline encode_activate_application_system_message(activate_application_system_message_record) {
  wire[at] = activate_application_system_message_record.status_code; at = at + 1;
  wire[at] = activate_application_system_message_record.heart_bt_int; at = at + 1;
  activate_application_system_message_at = 0;
  do
  :: activate_application_system_message_at < 2 -> wire[at] = activate_application_system_message_record.max_flow_ctrl_cnt[activate_application_system_message_at]; at = at + 1; activate_application_system_message_at = activate_application_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* Activate Application System Message off the wire, 4 bytes from where the cursor stands */
inline decode_activate_application_system_message(activate_application_system_message_record) {
  activate_application_system_message_record.status_code = wire[at]; at = at + 1;
  activate_application_system_message_record.heart_bt_int = wire[at]; at = at + 1;
  activate_application_system_message_at = 0;
  do
  :: activate_application_system_message_at < 2 -> activate_application_system_message_record.max_flow_ctrl_cnt[activate_application_system_message_at] = wire[at]; at = at + 1; activate_application_system_message_at = activate_application_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Activate Application System Message is what was written, byte for byte */
inline equal_activate_application_system_message(activate_application_system_message_read, activate_application_system_message_written) {
  assert(activate_application_system_message_read.status_code == activate_application_system_message_written.status_code);
  assert(activate_application_system_message_read.heart_bt_int == activate_application_system_message_written.heart_bt_int);
  activate_application_system_message_at = 0;
  do
  :: activate_application_system_message_at < 2 -> assert(activate_application_system_message_read.max_flow_ctrl_cnt[activate_application_system_message_at] == activate_application_system_message_written.max_flow_ctrl_cnt[activate_application_system_message_at]); activate_application_system_message_at = activate_application_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Activate Application System Confirmed Message: 1 bytes ------------------ */

/* Activate application system confirmed, from which Taifex calculates the round trip time of the L50 message to determine the maximum peak flow per second. */
typedef ActivateApplicationSystemConfirmedMessage {
  byte status_code
};

/* every byte of Activate Application System Confirmed Message set to one value */
inline fill_activate_application_system_confirmed_message(activate_application_system_confirmed_message_record, activate_application_system_confirmed_message_value) {
  activate_application_system_confirmed_message_record.status_code = activate_application_system_confirmed_message_value;
  skip
}

/* each byte of Activate Application System Confirmed Message set to where it lies, so a field read out of place says so */
inline ramp_activate_application_system_confirmed_message(activate_application_system_confirmed_message_record, activate_application_system_confirmed_message_base) {
  activate_application_system_confirmed_message_record.status_code = (activate_application_system_confirmed_message_base + 0 + 1) % 256;
  skip
}

/* Activate Application System Confirmed Message to the wire, 1 bytes from where the cursor stands */
inline encode_activate_application_system_confirmed_message(activate_application_system_confirmed_message_record) {
  wire[at] = activate_application_system_confirmed_message_record.status_code; at = at + 1;
  skip
}

/* Activate Application System Confirmed Message off the wire, 1 bytes from where the cursor stands */
inline decode_activate_application_system_confirmed_message(activate_application_system_confirmed_message_record) {
  activate_application_system_confirmed_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Activate Application System Confirmed Message is what was written, byte for byte */
inline equal_activate_application_system_confirmed_message(activate_application_system_confirmed_message_read, activate_application_system_confirmed_message_written) {
  assert(activate_application_system_confirmed_message_read.status_code == activate_application_system_confirmed_message_written.status_code);
  skip
}

/* ---- Logout Confirmed Message: 1 bytes --------------------------------------- */

/* Logout confirmed message, sent by Taifex to the futures commission merchant. */
typedef LogoutConfirmedMessage {
  byte status_code
};

/* every byte of Logout Confirmed Message set to one value */
inline fill_logout_confirmed_message(logout_confirmed_message_record, logout_confirmed_message_value) {
  logout_confirmed_message_record.status_code = logout_confirmed_message_value;
  skip
}

/* each byte of Logout Confirmed Message set to where it lies, so a field read out of place says so */
inline ramp_logout_confirmed_message(logout_confirmed_message_record, logout_confirmed_message_base) {
  logout_confirmed_message_record.status_code = (logout_confirmed_message_base + 0 + 1) % 256;
  skip
}

/* Logout Confirmed Message to the wire, 1 bytes from where the cursor stands */
inline encode_logout_confirmed_message(logout_confirmed_message_record) {
  wire[at] = logout_confirmed_message_record.status_code; at = at + 1;
  skip
}

/* Logout Confirmed Message off the wire, 1 bytes from where the cursor stands */
inline decode_logout_confirmed_message(logout_confirmed_message_record) {
  logout_confirmed_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Logout Confirmed Message is what was written, byte for byte */
inline equal_logout_confirmed_message(logout_confirmed_message_read, logout_confirmed_message_written) {
  assert(logout_confirmed_message_read.status_code == logout_confirmed_message_written.status_code);
  skip
}

/* ---- Confirm Connection Message: 1 bytes ------------------------------------- */

/* Confirm connection message, which either party sends when no new message has arrived from the other after the number of seconds set in the HeartBtInt field of L50. */
typedef ConfirmConnectionMessage {
  byte status_code
};

/* every byte of Confirm Connection Message set to one value */
inline fill_confirm_connection_message(confirm_connection_message_record, confirm_connection_message_value) {
  confirm_connection_message_record.status_code = confirm_connection_message_value;
  skip
}

/* each byte of Confirm Connection Message set to where it lies, so a field read out of place says so */
inline ramp_confirm_connection_message(confirm_connection_message_record, confirm_connection_message_base) {
  confirm_connection_message_record.status_code = (confirm_connection_message_base + 0 + 1) % 256;
  skip
}

/* Confirm Connection Message to the wire, 1 bytes from where the cursor stands */
inline encode_confirm_connection_message(confirm_connection_message_record) {
  wire[at] = confirm_connection_message_record.status_code; at = at + 1;
  skip
}

/* Confirm Connection Message off the wire, 1 bytes from where the cursor stands */
inline decode_confirm_connection_message(confirm_connection_message_record) {
  confirm_connection_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Confirm Connection Message is what was written, byte for byte */
inline equal_confirm_connection_message(confirm_connection_message_read, confirm_connection_message_written) {
  assert(confirm_connection_message_read.status_code == confirm_connection_message_written.status_code);
  skip
}

/* ---- Connection Confirmed Message: 1 bytes ----------------------------------- */

/* Connection confirmed message, with which a party answers the confirm connection message of the other. */
typedef ConnectionConfirmedMessage {
  byte status_code
};

/* every byte of Connection Confirmed Message set to one value */
inline fill_connection_confirmed_message(connection_confirmed_message_record, connection_confirmed_message_value) {
  connection_confirmed_message_record.status_code = connection_confirmed_message_value;
  skip
}

/* each byte of Connection Confirmed Message set to where it lies, so a field read out of place says so */
inline ramp_connection_confirmed_message(connection_confirmed_message_record, connection_confirmed_message_base) {
  connection_confirmed_message_record.status_code = (connection_confirmed_message_base + 0 + 1) % 256;
  skip
}

/* Connection Confirmed Message to the wire, 1 bytes from where the cursor stands */
inline encode_connection_confirmed_message(connection_confirmed_message_record) {
  wire[at] = connection_confirmed_message_record.status_code; at = at + 1;
  skip
}

/* Connection Confirmed Message off the wire, 1 bytes from where the cursor stands */
inline decode_connection_confirmed_message(connection_confirmed_message_record) {
  connection_confirmed_message_record.status_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Connection Confirmed Message is what was written, byte for byte */
inline equal_connection_confirmed_message(connection_confirmed_message_read, connection_confirmed_message_written) {
  assert(connection_confirmed_message_read.status_code == connection_confirmed_message_written.status_code);
  skip
}

/* ---- Symbol Text: 20 bytes --------------------------------------------------- */

/* Text product ID, naming a product by its Ascii character string symbol */
typedef SymbolText {
  byte symbol[20]
};

int symbol_text_at;

/* every byte of Symbol Text set to one value */
inline fill_symbol_text(symbol_text_record, symbol_text_value) {
  symbol_text_at = 0;
  do
  :: symbol_text_at < 20 -> symbol_text_record.symbol[symbol_text_at] = symbol_text_value; symbol_text_at = symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Text set to where it lies, so a field read out of place says so */
inline ramp_symbol_text(symbol_text_record, symbol_text_base) {
  symbol_text_at = 0;
  do
  :: symbol_text_at < 20 -> symbol_text_record.symbol[symbol_text_at] = (symbol_text_base + 0 + symbol_text_at + 1) % 256; symbol_text_at = symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Text to the wire, 20 bytes from where the cursor stands */
inline encode_symbol_text(symbol_text_record) {
  symbol_text_at = 0;
  do
  :: symbol_text_at < 20 -> wire[at] = symbol_text_record.symbol[symbol_text_at]; at = at + 1; symbol_text_at = symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Text off the wire, 20 bytes from where the cursor stands */
inline decode_symbol_text(symbol_text_record) {
  symbol_text_at = 0;
  do
  :: symbol_text_at < 20 -> symbol_text_record.symbol[symbol_text_at] = wire[at]; at = at + 1; symbol_text_at = symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Text is what was written, byte for byte */
inline equal_symbol_text(symbol_text_read, symbol_text_written) {
  symbol_text_at = 0;
  do
  :: symbol_text_at < 20 -> assert(symbol_text_read.symbol[symbol_text_at] == symbol_text_written.symbol[symbol_text_at]); symbol_text_at = symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Org Trans Time Msg Time: 6 bytes ---------------------------------------- */

/* Tmp time format, the seconds since the epoch and the thousandth of a second */
typedef OrgTransTimeMsgTime {
  byte msg_time_epoch_s[4];
  byte ms[2]
};

int org_trans_time_msg_time_at;

/* every byte of Org Trans Time Msg Time set to one value */
inline fill_org_trans_time_msg_time(org_trans_time_msg_time_record, org_trans_time_msg_time_value) {
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 4 -> org_trans_time_msg_time_record.msg_time_epoch_s[org_trans_time_msg_time_at] = org_trans_time_msg_time_value; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 2 -> org_trans_time_msg_time_record.ms[org_trans_time_msg_time_at] = org_trans_time_msg_time_value; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Org Trans Time Msg Time set to where it lies, so a field read out of place says so */
inline ramp_org_trans_time_msg_time(org_trans_time_msg_time_record, org_trans_time_msg_time_base) {
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 4 -> org_trans_time_msg_time_record.msg_time_epoch_s[org_trans_time_msg_time_at] = (org_trans_time_msg_time_base + 0 + org_trans_time_msg_time_at + 1) % 256; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 2 -> org_trans_time_msg_time_record.ms[org_trans_time_msg_time_at] = (org_trans_time_msg_time_base + 4 + org_trans_time_msg_time_at + 1) % 256; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* Org Trans Time Msg Time to the wire, 6 bytes from where the cursor stands */
inline encode_org_trans_time_msg_time(org_trans_time_msg_time_record) {
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 4 -> wire[at] = org_trans_time_msg_time_record.msg_time_epoch_s[org_trans_time_msg_time_at]; at = at + 1; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 2 -> wire[at] = org_trans_time_msg_time_record.ms[org_trans_time_msg_time_at]; at = at + 1; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* Org Trans Time Msg Time off the wire, 6 bytes from where the cursor stands */
inline decode_org_trans_time_msg_time(org_trans_time_msg_time_record) {
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 4 -> org_trans_time_msg_time_record.msg_time_epoch_s[org_trans_time_msg_time_at] = wire[at]; at = at + 1; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 2 -> org_trans_time_msg_time_record.ms[org_trans_time_msg_time_at] = wire[at]; at = at + 1; org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Org Trans Time Msg Time is what was written, byte for byte */
inline equal_org_trans_time_msg_time(org_trans_time_msg_time_read, org_trans_time_msg_time_written) {
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 4 -> assert(org_trans_time_msg_time_read.msg_time_epoch_s[org_trans_time_msg_time_at] == org_trans_time_msg_time_written.msg_time_epoch_s[org_trans_time_msg_time_at]); org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_at = 0;
  do
  :: org_trans_time_msg_time_at < 2 -> assert(org_trans_time_msg_time_read.ms[org_trans_time_msg_time_at] == org_trans_time_msg_time_written.ms[org_trans_time_msg_time_at]); org_trans_time_msg_time_at = org_trans_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transact Time Msg Time: 6 bytes ----------------------------------------- */

/* Tmp time format, the seconds since the epoch and the thousandth of a second */
typedef TransactTimeMsgTime {
  byte msg_time_epoch_s[4];
  byte ms[2]
};

int transact_time_msg_time_at;

/* every byte of Transact Time Msg Time set to one value */
inline fill_transact_time_msg_time(transact_time_msg_time_record, transact_time_msg_time_value) {
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 4 -> transact_time_msg_time_record.msg_time_epoch_s[transact_time_msg_time_at] = transact_time_msg_time_value; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 2 -> transact_time_msg_time_record.ms[transact_time_msg_time_at] = transact_time_msg_time_value; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transact Time Msg Time set to where it lies, so a field read out of place says so */
inline ramp_transact_time_msg_time(transact_time_msg_time_record, transact_time_msg_time_base) {
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 4 -> transact_time_msg_time_record.msg_time_epoch_s[transact_time_msg_time_at] = (transact_time_msg_time_base + 0 + transact_time_msg_time_at + 1) % 256; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 2 -> transact_time_msg_time_record.ms[transact_time_msg_time_at] = (transact_time_msg_time_base + 4 + transact_time_msg_time_at + 1) % 256; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time Msg Time to the wire, 6 bytes from where the cursor stands */
inline encode_transact_time_msg_time(transact_time_msg_time_record) {
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 4 -> wire[at] = transact_time_msg_time_record.msg_time_epoch_s[transact_time_msg_time_at]; at = at + 1; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 2 -> wire[at] = transact_time_msg_time_record.ms[transact_time_msg_time_at]; at = at + 1; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time Msg Time off the wire, 6 bytes from where the cursor stands */
inline decode_transact_time_msg_time(transact_time_msg_time_record) {
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 4 -> transact_time_msg_time_record.msg_time_epoch_s[transact_time_msg_time_at] = wire[at]; at = at + 1; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 2 -> transact_time_msg_time_record.ms[transact_time_msg_time_at] = wire[at]; at = at + 1; transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transact Time Msg Time is what was written, byte for byte */
inline equal_transact_time_msg_time(transact_time_msg_time_read, transact_time_msg_time_written) {
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 4 -> assert(transact_time_msg_time_read.msg_time_epoch_s[transact_time_msg_time_at] == transact_time_msg_time_written.msg_time_epoch_s[transact_time_msg_time_at]); transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  transact_time_msg_time_at = 0;
  do
  :: transact_time_msg_time_at < 2 -> assert(transact_time_msg_time_read.ms[transact_time_msg_time_at] == transact_time_msg_time_written.ms[transact_time_msg_time_at]); transact_time_msg_time_at = transact_time_msg_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Symbol Text: 40 bytes ---------------------------------------------- */

/* Text product ID in the long product format, naming a product by its Ascii character string symbol */
typedef LongSymbolText {
  byte long_symbol[40]
};

int long_symbol_text_at;

/* every byte of Long Symbol Text set to one value */
inline fill_long_symbol_text(long_symbol_text_record, long_symbol_text_value) {
  long_symbol_text_at = 0;
  do
  :: long_symbol_text_at < 40 -> long_symbol_text_record.long_symbol[long_symbol_text_at] = long_symbol_text_value; long_symbol_text_at = long_symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Symbol Text set to where it lies, so a field read out of place says so */
inline ramp_long_symbol_text(long_symbol_text_record, long_symbol_text_base) {
  long_symbol_text_at = 0;
  do
  :: long_symbol_text_at < 40 -> long_symbol_text_record.long_symbol[long_symbol_text_at] = (long_symbol_text_base + 0 + long_symbol_text_at + 1) % 256; long_symbol_text_at = long_symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* Long Symbol Text to the wire, 40 bytes from where the cursor stands */
inline encode_long_symbol_text(long_symbol_text_record) {
  long_symbol_text_at = 0;
  do
  :: long_symbol_text_at < 40 -> wire[at] = long_symbol_text_record.long_symbol[long_symbol_text_at]; at = at + 1; long_symbol_text_at = long_symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* Long Symbol Text off the wire, 40 bytes from where the cursor stands */
inline decode_long_symbol_text(long_symbol_text_record) {
  long_symbol_text_at = 0;
  do
  :: long_symbol_text_at < 40 -> long_symbol_text_record.long_symbol[long_symbol_text_at] = wire[at]; at = at + 1; long_symbol_text_at = long_symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Symbol Text is what was written, byte for byte */
inline equal_long_symbol_text(long_symbol_text_read, long_symbol_text_written) {
  long_symbol_text_at = 0;
  do
  :: long_symbol_text_at < 40 -> assert(long_symbol_text_read.long_symbol[long_symbol_text_at] == long_symbol_text_written.long_symbol[long_symbol_text_at]); long_symbol_text_at = long_symbol_text_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Num X: 4 bytes --------------------------------------------------- */

/* FLEX Numeric Single Product Serial number, naming a FLEX product by the serial number of the XP08 product and time flow group definition file */
typedef SymbolNumX {
  byte pseq[4]
};

int symbol_num_x_at;

/* every byte of Symbol Num X set to one value */
inline fill_symbol_num_x(symbol_num_x_record, symbol_num_x_value) {
  symbol_num_x_at = 0;
  do
  :: symbol_num_x_at < 4 -> symbol_num_x_record.pseq[symbol_num_x_at] = symbol_num_x_value; symbol_num_x_at = symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Num X set to where it lies, so a field read out of place says so */
inline ramp_symbol_num_x(symbol_num_x_record, symbol_num_x_base) {
  symbol_num_x_at = 0;
  do
  :: symbol_num_x_at < 4 -> symbol_num_x_record.pseq[symbol_num_x_at] = (symbol_num_x_base + 0 + symbol_num_x_at + 1) % 256; symbol_num_x_at = symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Num X to the wire, 4 bytes from where the cursor stands */
inline encode_symbol_num_x(symbol_num_x_record) {
  symbol_num_x_at = 0;
  do
  :: symbol_num_x_at < 4 -> wire[at] = symbol_num_x_record.pseq[symbol_num_x_at]; at = at + 1; symbol_num_x_at = symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Num X off the wire, 4 bytes from where the cursor stands */
inline decode_symbol_num_x(symbol_num_x_record) {
  symbol_num_x_at = 0;
  do
  :: symbol_num_x_at < 4 -> symbol_num_x_record.pseq[symbol_num_x_at] = wire[at]; at = at + 1; symbol_num_x_at = symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Num X is what was written, byte for byte */
inline equal_symbol_num_x(symbol_num_x_read, symbol_num_x_written) {
  symbol_num_x_at = 0;
  do
  :: symbol_num_x_at < 4 -> assert(symbol_num_x_read.pseq[symbol_num_x_at] == symbol_num_x_written.pseq[symbol_num_x_at]); symbol_num_x_at = symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Txt X: 20 bytes -------------------------------------------------- */

/* FLEX Textual Single Product Symbol, naming a FLEX product by the product symbol of the XP08 product and time flow group definition file */
typedef SymbolTxtX {
  byte prod_id[20]
};

int symbol_txt_x_at;

/* every byte of Symbol Txt X set to one value */
inline fill_symbol_txt_x(symbol_txt_x_record, symbol_txt_x_value) {
  symbol_txt_x_at = 0;
  do
  :: symbol_txt_x_at < 20 -> symbol_txt_x_record.prod_id[symbol_txt_x_at] = symbol_txt_x_value; symbol_txt_x_at = symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Txt X set to where it lies, so a field read out of place says so */
inline ramp_symbol_txt_x(symbol_txt_x_record, symbol_txt_x_base) {
  symbol_txt_x_at = 0;
  do
  :: symbol_txt_x_at < 20 -> symbol_txt_x_record.prod_id[symbol_txt_x_at] = (symbol_txt_x_base + 0 + symbol_txt_x_at + 1) % 256; symbol_txt_x_at = symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Txt X to the wire, 20 bytes from where the cursor stands */
inline encode_symbol_txt_x(symbol_txt_x_record) {
  symbol_txt_x_at = 0;
  do
  :: symbol_txt_x_at < 20 -> wire[at] = symbol_txt_x_record.prod_id[symbol_txt_x_at]; at = at + 1; symbol_txt_x_at = symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Txt X off the wire, 20 bytes from where the cursor stands */
inline decode_symbol_txt_x(symbol_txt_x_record) {
  symbol_txt_x_at = 0;
  do
  :: symbol_txt_x_at < 20 -> symbol_txt_x_record.prod_id[symbol_txt_x_at] = wire[at]; at = at + 1; symbol_txt_x_at = symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Txt X is what was written, byte for byte */
inline equal_symbol_txt_x(symbol_txt_x_read, symbol_txt_x_written) {
  symbol_txt_x_at = 0;
  do
  :: symbol_txt_x_at < 20 -> assert(symbol_txt_x_read.prod_id[symbol_txt_x_at] == symbol_txt_x_written.prod_id[symbol_txt_x_at]); symbol_txt_x_at = symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Leg Sym Symbol Num X: 4 bytes ------------------------------------------- */

/* FLEX Numeric Single Product Serial number, naming a FLEX product by the serial number of the XP08 product and time flow group definition file */
typedef LegSymSymbolNumX {
  byte pseq[4]
};

int leg_sym_symbol_num_x_at;

/* every byte of Leg Sym Symbol Num X set to one value */
inline fill_leg_sym_symbol_num_x(leg_sym_symbol_num_x_record, leg_sym_symbol_num_x_value) {
  leg_sym_symbol_num_x_at = 0;
  do
  :: leg_sym_symbol_num_x_at < 4 -> leg_sym_symbol_num_x_record.pseq[leg_sym_symbol_num_x_at] = leg_sym_symbol_num_x_value; leg_sym_symbol_num_x_at = leg_sym_symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Leg Sym Symbol Num X set to where it lies, so a field read out of place says so */
inline ramp_leg_sym_symbol_num_x(leg_sym_symbol_num_x_record, leg_sym_symbol_num_x_base) {
  leg_sym_symbol_num_x_at = 0;
  do
  :: leg_sym_symbol_num_x_at < 4 -> leg_sym_symbol_num_x_record.pseq[leg_sym_symbol_num_x_at] = (leg_sym_symbol_num_x_base + 0 + leg_sym_symbol_num_x_at + 1) % 256; leg_sym_symbol_num_x_at = leg_sym_symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Sym Symbol Num X to the wire, 4 bytes from where the cursor stands */
inline encode_leg_sym_symbol_num_x(leg_sym_symbol_num_x_record) {
  leg_sym_symbol_num_x_at = 0;
  do
  :: leg_sym_symbol_num_x_at < 4 -> wire[at] = leg_sym_symbol_num_x_record.pseq[leg_sym_symbol_num_x_at]; at = at + 1; leg_sym_symbol_num_x_at = leg_sym_symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Sym Symbol Num X off the wire, 4 bytes from where the cursor stands */
inline decode_leg_sym_symbol_num_x(leg_sym_symbol_num_x_record) {
  leg_sym_symbol_num_x_at = 0;
  do
  :: leg_sym_symbol_num_x_at < 4 -> leg_sym_symbol_num_x_record.pseq[leg_sym_symbol_num_x_at] = wire[at]; at = at + 1; leg_sym_symbol_num_x_at = leg_sym_symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Leg Sym Symbol Num X is what was written, byte for byte */
inline equal_leg_sym_symbol_num_x(leg_sym_symbol_num_x_read, leg_sym_symbol_num_x_written) {
  leg_sym_symbol_num_x_at = 0;
  do
  :: leg_sym_symbol_num_x_at < 4 -> assert(leg_sym_symbol_num_x_read.pseq[leg_sym_symbol_num_x_at] == leg_sym_symbol_num_x_written.pseq[leg_sym_symbol_num_x_at]); leg_sym_symbol_num_x_at = leg_sym_symbol_num_x_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Leg Sym Symbol Txt X: 20 bytes ------------------------------------------ */

/* FLEX Textual Single Product Symbol, naming a FLEX product by the product symbol of the XP08 product and time flow group definition file */
typedef LegSymSymbolTxtX {
  byte prod_id[20]
};

int leg_sym_symbol_txt_x_at;

/* every byte of Leg Sym Symbol Txt X set to one value */
inline fill_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_record, leg_sym_symbol_txt_x_value) {
  leg_sym_symbol_txt_x_at = 0;
  do
  :: leg_sym_symbol_txt_x_at < 20 -> leg_sym_symbol_txt_x_record.prod_id[leg_sym_symbol_txt_x_at] = leg_sym_symbol_txt_x_value; leg_sym_symbol_txt_x_at = leg_sym_symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Leg Sym Symbol Txt X set to where it lies, so a field read out of place says so */
inline ramp_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_record, leg_sym_symbol_txt_x_base) {
  leg_sym_symbol_txt_x_at = 0;
  do
  :: leg_sym_symbol_txt_x_at < 20 -> leg_sym_symbol_txt_x_record.prod_id[leg_sym_symbol_txt_x_at] = (leg_sym_symbol_txt_x_base + 0 + leg_sym_symbol_txt_x_at + 1) % 256; leg_sym_symbol_txt_x_at = leg_sym_symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Sym Symbol Txt X to the wire, 20 bytes from where the cursor stands */
inline encode_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_record) {
  leg_sym_symbol_txt_x_at = 0;
  do
  :: leg_sym_symbol_txt_x_at < 20 -> wire[at] = leg_sym_symbol_txt_x_record.prod_id[leg_sym_symbol_txt_x_at]; at = at + 1; leg_sym_symbol_txt_x_at = leg_sym_symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Sym Symbol Txt X off the wire, 20 bytes from where the cursor stands */
inline decode_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_record) {
  leg_sym_symbol_txt_x_at = 0;
  do
  :: leg_sym_symbol_txt_x_at < 20 -> leg_sym_symbol_txt_x_record.prod_id[leg_sym_symbol_txt_x_at] = wire[at]; at = at + 1; leg_sym_symbol_txt_x_at = leg_sym_symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Leg Sym Symbol Txt X is what was written, byte for byte */
inline equal_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_read, leg_sym_symbol_txt_x_written) {
  leg_sym_symbol_txt_x_at = 0;
  do
  :: leg_sym_symbol_txt_x_at < 20 -> assert(leg_sym_symbol_txt_x_read.prod_id[leg_sym_symbol_txt_x_at] == leg_sym_symbol_txt_x_written.prod_id[leg_sym_symbol_txt_x_at]); leg_sym_symbol_txt_x_at = leg_sym_symbol_txt_x_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Org Trans Time Msg Time X: 8 bytes -------------------------------------- */

/* Tmp Expanded Time Format, the seconds since the epoch and the billionth of a second, which the FLEX reports carry in place of msg_time */
typedef OrgTransTimeMsgTimeX {
  byte msg_time_x_epoch_s[4];
  byte nanosecond[4]
};

int org_trans_time_msg_time_x_at;

/* every byte of Org Trans Time Msg Time X set to one value */
inline fill_org_trans_time_msg_time_x(org_trans_time_msg_time_x_record, org_trans_time_msg_time_x_value) {
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> org_trans_time_msg_time_x_record.msg_time_x_epoch_s[org_trans_time_msg_time_x_at] = org_trans_time_msg_time_x_value; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> org_trans_time_msg_time_x_record.nanosecond[org_trans_time_msg_time_x_at] = org_trans_time_msg_time_x_value; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Org Trans Time Msg Time X set to where it lies, so a field read out of place says so */
inline ramp_org_trans_time_msg_time_x(org_trans_time_msg_time_x_record, org_trans_time_msg_time_x_base) {
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> org_trans_time_msg_time_x_record.msg_time_x_epoch_s[org_trans_time_msg_time_x_at] = (org_trans_time_msg_time_x_base + 0 + org_trans_time_msg_time_x_at + 1) % 256; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> org_trans_time_msg_time_x_record.nanosecond[org_trans_time_msg_time_x_at] = (org_trans_time_msg_time_x_base + 4 + org_trans_time_msg_time_x_at + 1) % 256; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* Org Trans Time Msg Time X to the wire, 8 bytes from where the cursor stands */
inline encode_org_trans_time_msg_time_x(org_trans_time_msg_time_x_record) {
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> wire[at] = org_trans_time_msg_time_x_record.msg_time_x_epoch_s[org_trans_time_msg_time_x_at]; at = at + 1; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> wire[at] = org_trans_time_msg_time_x_record.nanosecond[org_trans_time_msg_time_x_at]; at = at + 1; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* Org Trans Time Msg Time X off the wire, 8 bytes from where the cursor stands */
inline decode_org_trans_time_msg_time_x(org_trans_time_msg_time_x_record) {
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> org_trans_time_msg_time_x_record.msg_time_x_epoch_s[org_trans_time_msg_time_x_at] = wire[at]; at = at + 1; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> org_trans_time_msg_time_x_record.nanosecond[org_trans_time_msg_time_x_at] = wire[at]; at = at + 1; org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Org Trans Time Msg Time X is what was written, byte for byte */
inline equal_org_trans_time_msg_time_x(org_trans_time_msg_time_x_read, org_trans_time_msg_time_x_written) {
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> assert(org_trans_time_msg_time_x_read.msg_time_x_epoch_s[org_trans_time_msg_time_x_at] == org_trans_time_msg_time_x_written.msg_time_x_epoch_s[org_trans_time_msg_time_x_at]); org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  org_trans_time_msg_time_x_at = 0;
  do
  :: org_trans_time_msg_time_x_at < 4 -> assert(org_trans_time_msg_time_x_read.nanosecond[org_trans_time_msg_time_x_at] == org_trans_time_msg_time_x_written.nanosecond[org_trans_time_msg_time_x_at]); org_trans_time_msg_time_x_at = org_trans_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transact Time Msg Time X: 8 bytes --------------------------------------- */

/* Tmp Expanded Time Format, the seconds since the epoch and the billionth of a second, which the FLEX reports carry in place of msg_time */
typedef TransactTimeMsgTimeX {
  byte msg_time_x_epoch_s[4];
  byte nanosecond[4]
};

int transact_time_msg_time_x_at;

/* every byte of Transact Time Msg Time X set to one value */
inline fill_transact_time_msg_time_x(transact_time_msg_time_x_record, transact_time_msg_time_x_value) {
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> transact_time_msg_time_x_record.msg_time_x_epoch_s[transact_time_msg_time_x_at] = transact_time_msg_time_x_value; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> transact_time_msg_time_x_record.nanosecond[transact_time_msg_time_x_at] = transact_time_msg_time_x_value; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transact Time Msg Time X set to where it lies, so a field read out of place says so */
inline ramp_transact_time_msg_time_x(transact_time_msg_time_x_record, transact_time_msg_time_x_base) {
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> transact_time_msg_time_x_record.msg_time_x_epoch_s[transact_time_msg_time_x_at] = (transact_time_msg_time_x_base + 0 + transact_time_msg_time_x_at + 1) % 256; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> transact_time_msg_time_x_record.nanosecond[transact_time_msg_time_x_at] = (transact_time_msg_time_x_base + 4 + transact_time_msg_time_x_at + 1) % 256; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time Msg Time X to the wire, 8 bytes from where the cursor stands */
inline encode_transact_time_msg_time_x(transact_time_msg_time_x_record) {
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> wire[at] = transact_time_msg_time_x_record.msg_time_x_epoch_s[transact_time_msg_time_x_at]; at = at + 1; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> wire[at] = transact_time_msg_time_x_record.nanosecond[transact_time_msg_time_x_at]; at = at + 1; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time Msg Time X off the wire, 8 bytes from where the cursor stands */
inline decode_transact_time_msg_time_x(transact_time_msg_time_x_record) {
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> transact_time_msg_time_x_record.msg_time_x_epoch_s[transact_time_msg_time_x_at] = wire[at]; at = at + 1; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> transact_time_msg_time_x_record.nanosecond[transact_time_msg_time_x_at] = wire[at]; at = at + 1; transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transact Time Msg Time X is what was written, byte for byte */
inline equal_transact_time_msg_time_x(transact_time_msg_time_x_read, transact_time_msg_time_x_written) {
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> assert(transact_time_msg_time_x_read.msg_time_x_epoch_s[transact_time_msg_time_x_at] == transact_time_msg_time_x_written.msg_time_x_epoch_s[transact_time_msg_time_x_at]); transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  transact_time_msg_time_x_at = 0;
  do
  :: transact_time_msg_time_x_at < 4 -> assert(transact_time_msg_time_x_read.nanosecond[transact_time_msg_time_x_at] == transact_time_msg_time_x_written.nanosecond[transact_time_msg_time_x_at]); transact_time_msg_time_x_at = transact_time_msg_time_x_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Member Initiate Operation Message: 7 bytes --------------------- */

/* Clearing member initiate operation message, with which the clearing member requests the report start sequence of its downline FCM data. */
typedef ClearingMemberInitiateOperationMessage {
  byte member_id[2];
  byte target_id;
  byte req_cm_seq[4]
};

int clearing_member_initiate_operation_message_at;

/* every byte of Clearing Member Initiate Operation Message set to one value */
inline fill_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_record, clearing_member_initiate_operation_message_value) {
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 2 -> clearing_member_initiate_operation_message_record.member_id[clearing_member_initiate_operation_message_at] = clearing_member_initiate_operation_message_value; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  clearing_member_initiate_operation_message_record.target_id = clearing_member_initiate_operation_message_value;
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 4 -> clearing_member_initiate_operation_message_record.req_cm_seq[clearing_member_initiate_operation_message_at] = clearing_member_initiate_operation_message_value; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Member Initiate Operation Message set to where it lies, so a field read out of place says so */
inline ramp_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_record, clearing_member_initiate_operation_message_base) {
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 2 -> clearing_member_initiate_operation_message_record.member_id[clearing_member_initiate_operation_message_at] = (clearing_member_initiate_operation_message_base + 0 + clearing_member_initiate_operation_message_at + 1) % 256; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  clearing_member_initiate_operation_message_record.target_id = (clearing_member_initiate_operation_message_base + 2 + 1) % 256;
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 4 -> clearing_member_initiate_operation_message_record.req_cm_seq[clearing_member_initiate_operation_message_at] = (clearing_member_initiate_operation_message_base + 3 + clearing_member_initiate_operation_message_at + 1) % 256; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Initiate Operation Message to the wire, 7 bytes from where the cursor stands */
inline encode_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_record) {
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 2 -> wire[at] = clearing_member_initiate_operation_message_record.member_id[clearing_member_initiate_operation_message_at]; at = at + 1; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  wire[at] = clearing_member_initiate_operation_message_record.target_id; at = at + 1;
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 4 -> wire[at] = clearing_member_initiate_operation_message_record.req_cm_seq[clearing_member_initiate_operation_message_at]; at = at + 1; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Initiate Operation Message off the wire, 7 bytes from where the cursor stands */
inline decode_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_record) {
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 2 -> clearing_member_initiate_operation_message_record.member_id[clearing_member_initiate_operation_message_at] = wire[at]; at = at + 1; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  clearing_member_initiate_operation_message_record.target_id = wire[at]; at = at + 1;
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 4 -> clearing_member_initiate_operation_message_record.req_cm_seq[clearing_member_initiate_operation_message_at] = wire[at]; at = at + 1; clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Member Initiate Operation Message is what was written, byte for byte */
inline equal_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_read, clearing_member_initiate_operation_message_written) {
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 2 -> assert(clearing_member_initiate_operation_message_read.member_id[clearing_member_initiate_operation_message_at] == clearing_member_initiate_operation_message_written.member_id[clearing_member_initiate_operation_message_at]); clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  assert(clearing_member_initiate_operation_message_read.target_id == clearing_member_initiate_operation_message_written.target_id);
  clearing_member_initiate_operation_message_at = 0;
  do
  :: clearing_member_initiate_operation_message_at < 4 -> assert(clearing_member_initiate_operation_message_read.req_cm_seq[clearing_member_initiate_operation_message_at] == clearing_member_initiate_operation_message_written.req_cm_seq[clearing_member_initiate_operation_message_at]); clearing_member_initiate_operation_message_at = clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Member Initiate Operation Confirmed Message: 8 bytes ----------- */

/* Clearing member initiate operation confirmed message, with which Taifex answers the clearing member with a report start notice. */
typedef ClearingMemberInitiateOperationConfirmedMessage {
  byte status_code;
  byte member_id[2];
  byte target_id;
  byte req_cm_seq[4]
};

int clearing_member_initiate_operation_confirmed_message_at;

/* every byte of Clearing Member Initiate Operation Confirmed Message set to one value */
inline fill_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_record, clearing_member_initiate_operation_confirmed_message_value) {
  clearing_member_initiate_operation_confirmed_message_record.status_code = clearing_member_initiate_operation_confirmed_message_value;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 2 -> clearing_member_initiate_operation_confirmed_message_record.member_id[clearing_member_initiate_operation_confirmed_message_at] = clearing_member_initiate_operation_confirmed_message_value; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  clearing_member_initiate_operation_confirmed_message_record.target_id = clearing_member_initiate_operation_confirmed_message_value;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 4 -> clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[clearing_member_initiate_operation_confirmed_message_at] = clearing_member_initiate_operation_confirmed_message_value; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Member Initiate Operation Confirmed Message set to where it lies, so a field read out of place says so */
inline ramp_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_record, clearing_member_initiate_operation_confirmed_message_base) {
  clearing_member_initiate_operation_confirmed_message_record.status_code = (clearing_member_initiate_operation_confirmed_message_base + 0 + 1) % 256;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 2 -> clearing_member_initiate_operation_confirmed_message_record.member_id[clearing_member_initiate_operation_confirmed_message_at] = (clearing_member_initiate_operation_confirmed_message_base + 1 + clearing_member_initiate_operation_confirmed_message_at + 1) % 256; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  clearing_member_initiate_operation_confirmed_message_record.target_id = (clearing_member_initiate_operation_confirmed_message_base + 3 + 1) % 256;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 4 -> clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[clearing_member_initiate_operation_confirmed_message_at] = (clearing_member_initiate_operation_confirmed_message_base + 4 + clearing_member_initiate_operation_confirmed_message_at + 1) % 256; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Initiate Operation Confirmed Message to the wire, 8 bytes from where the cursor stands */
inline encode_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_record) {
  wire[at] = clearing_member_initiate_operation_confirmed_message_record.status_code; at = at + 1;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 2 -> wire[at] = clearing_member_initiate_operation_confirmed_message_record.member_id[clearing_member_initiate_operation_confirmed_message_at]; at = at + 1; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  wire[at] = clearing_member_initiate_operation_confirmed_message_record.target_id; at = at + 1;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 4 -> wire[at] = clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[clearing_member_initiate_operation_confirmed_message_at]; at = at + 1; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Member Initiate Operation Confirmed Message off the wire, 8 bytes from where the cursor stands */
inline decode_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_record) {
  clearing_member_initiate_operation_confirmed_message_record.status_code = wire[at]; at = at + 1;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 2 -> clearing_member_initiate_operation_confirmed_message_record.member_id[clearing_member_initiate_operation_confirmed_message_at] = wire[at]; at = at + 1; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  clearing_member_initiate_operation_confirmed_message_record.target_id = wire[at]; at = at + 1;
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 4 -> clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[clearing_member_initiate_operation_confirmed_message_at] = wire[at]; at = at + 1; clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Member Initiate Operation Confirmed Message is what was written, byte for byte */
inline equal_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_read, clearing_member_initiate_operation_confirmed_message_written) {
  assert(clearing_member_initiate_operation_confirmed_message_read.status_code == clearing_member_initiate_operation_confirmed_message_written.status_code);
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 2 -> assert(clearing_member_initiate_operation_confirmed_message_read.member_id[clearing_member_initiate_operation_confirmed_message_at] == clearing_member_initiate_operation_confirmed_message_written.member_id[clearing_member_initiate_operation_confirmed_message_at]); clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  assert(clearing_member_initiate_operation_confirmed_message_read.target_id == clearing_member_initiate_operation_confirmed_message_written.target_id);
  clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: clearing_member_initiate_operation_confirmed_message_at < 4 -> assert(clearing_member_initiate_operation_confirmed_message_read.req_cm_seq[clearing_member_initiate_operation_confirmed_message_at] == clearing_member_initiate_operation_confirmed_message_written.req_cm_seq[clearing_member_initiate_operation_confirmed_message_at]); clearing_member_initiate_operation_confirmed_message_at = clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Flex Clearing Member Initiate Operation Message: 14 bytes --------------- */

/* Clearing member initiate FLEX operation message, with which the clearing member subscribes to the FLEX order and execution data of a partition. */
typedef FlexClearingMemberInitiateOperationMessage {
  SubHdr sub_hdr;
  byte part_id;
  byte member_id[2];
  byte target_id;
  byte req_cm_seq[4]
};

int flex_clearing_member_initiate_operation_message_at;

/* every byte of Flex Clearing Member Initiate Operation Message set to one value */
inline fill_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_record, flex_clearing_member_initiate_operation_message_value) {
  fill_sub_hdr(flex_clearing_member_initiate_operation_message_record.sub_hdr, flex_clearing_member_initiate_operation_message_value);
  flex_clearing_member_initiate_operation_message_record.part_id = flex_clearing_member_initiate_operation_message_value;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 2 -> flex_clearing_member_initiate_operation_message_record.member_id[flex_clearing_member_initiate_operation_message_at] = flex_clearing_member_initiate_operation_message_value; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_message_record.target_id = flex_clearing_member_initiate_operation_message_value;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 4 -> flex_clearing_member_initiate_operation_message_record.req_cm_seq[flex_clearing_member_initiate_operation_message_at] = flex_clearing_member_initiate_operation_message_value; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Flex Clearing Member Initiate Operation Message set to where it lies, so a field read out of place says so */
inline ramp_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_record, flex_clearing_member_initiate_operation_message_base) {
  ramp_sub_hdr(flex_clearing_member_initiate_operation_message_record.sub_hdr, flex_clearing_member_initiate_operation_message_base + 0);
  flex_clearing_member_initiate_operation_message_record.part_id = (flex_clearing_member_initiate_operation_message_base + 6 + 1) % 256;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 2 -> flex_clearing_member_initiate_operation_message_record.member_id[flex_clearing_member_initiate_operation_message_at] = (flex_clearing_member_initiate_operation_message_base + 7 + flex_clearing_member_initiate_operation_message_at + 1) % 256; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_message_record.target_id = (flex_clearing_member_initiate_operation_message_base + 9 + 1) % 256;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 4 -> flex_clearing_member_initiate_operation_message_record.req_cm_seq[flex_clearing_member_initiate_operation_message_at] = (flex_clearing_member_initiate_operation_message_base + 10 + flex_clearing_member_initiate_operation_message_at + 1) % 256; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Flex Clearing Member Initiate Operation Message to the wire, 14 bytes from where the cursor stands */
inline encode_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_record) {
  encode_sub_hdr(flex_clearing_member_initiate_operation_message_record.sub_hdr);
  wire[at] = flex_clearing_member_initiate_operation_message_record.part_id; at = at + 1;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 2 -> wire[at] = flex_clearing_member_initiate_operation_message_record.member_id[flex_clearing_member_initiate_operation_message_at]; at = at + 1; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  wire[at] = flex_clearing_member_initiate_operation_message_record.target_id; at = at + 1;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 4 -> wire[at] = flex_clearing_member_initiate_operation_message_record.req_cm_seq[flex_clearing_member_initiate_operation_message_at]; at = at + 1; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Flex Clearing Member Initiate Operation Message off the wire, 14 bytes from where the cursor stands */
inline decode_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_record) {
  decode_sub_hdr(flex_clearing_member_initiate_operation_message_record.sub_hdr);
  flex_clearing_member_initiate_operation_message_record.part_id = wire[at]; at = at + 1;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 2 -> flex_clearing_member_initiate_operation_message_record.member_id[flex_clearing_member_initiate_operation_message_at] = wire[at]; at = at + 1; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_message_record.target_id = wire[at]; at = at + 1;
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 4 -> flex_clearing_member_initiate_operation_message_record.req_cm_seq[flex_clearing_member_initiate_operation_message_at] = wire[at]; at = at + 1; flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Flex Clearing Member Initiate Operation Message is what was written, byte for byte */
inline equal_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_read, flex_clearing_member_initiate_operation_message_written) {
  equal_sub_hdr(flex_clearing_member_initiate_operation_message_read.sub_hdr, flex_clearing_member_initiate_operation_message_written.sub_hdr);
  assert(flex_clearing_member_initiate_operation_message_read.part_id == flex_clearing_member_initiate_operation_message_written.part_id);
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 2 -> assert(flex_clearing_member_initiate_operation_message_read.member_id[flex_clearing_member_initiate_operation_message_at] == flex_clearing_member_initiate_operation_message_written.member_id[flex_clearing_member_initiate_operation_message_at]); flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  assert(flex_clearing_member_initiate_operation_message_read.target_id == flex_clearing_member_initiate_operation_message_written.target_id);
  flex_clearing_member_initiate_operation_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_message_at < 4 -> assert(flex_clearing_member_initiate_operation_message_read.req_cm_seq[flex_clearing_member_initiate_operation_message_at] == flex_clearing_member_initiate_operation_message_written.req_cm_seq[flex_clearing_member_initiate_operation_message_at]); flex_clearing_member_initiate_operation_message_at = flex_clearing_member_initiate_operation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Flex Clearing Member Initiate Operation Confirmed Message: 32 bytes ----- */

/* Clearing member initiate FLEX operation confirmed message, with which Taifex confirms the FLEX subscription. */
typedef FlexClearingMemberInitiateOperationConfirmedMessage {
  SubHdr sub_hdr;
  byte part_id;
  byte wide_status_code[2];
  byte member_id[2];
  byte target_id;
  byte req_cm_seq[4];
  byte reserved_16[16]
};

int flex_clearing_member_initiate_operation_confirmed_message_at;

/* every byte of Flex Clearing Member Initiate Operation Confirmed Message set to one value */
inline fill_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_record, flex_clearing_member_initiate_operation_confirmed_message_value) {
  fill_sub_hdr(flex_clearing_member_initiate_operation_confirmed_message_record.sub_hdr, flex_clearing_member_initiate_operation_confirmed_message_value);
  flex_clearing_member_initiate_operation_confirmed_message_record.part_id = flex_clearing_member_initiate_operation_confirmed_message_value;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> flex_clearing_member_initiate_operation_confirmed_message_record.wide_status_code[flex_clearing_member_initiate_operation_confirmed_message_at] = flex_clearing_member_initiate_operation_confirmed_message_value; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> flex_clearing_member_initiate_operation_confirmed_message_record.member_id[flex_clearing_member_initiate_operation_confirmed_message_at] = flex_clearing_member_initiate_operation_confirmed_message_value; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_record.target_id = flex_clearing_member_initiate_operation_confirmed_message_value;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 4 -> flex_clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[flex_clearing_member_initiate_operation_confirmed_message_at] = flex_clearing_member_initiate_operation_confirmed_message_value; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 16 -> flex_clearing_member_initiate_operation_confirmed_message_record.reserved_16[flex_clearing_member_initiate_operation_confirmed_message_at] = flex_clearing_member_initiate_operation_confirmed_message_value; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Flex Clearing Member Initiate Operation Confirmed Message set to where it lies, so a field read out of place says so */
inline ramp_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_record, flex_clearing_member_initiate_operation_confirmed_message_base) {
  ramp_sub_hdr(flex_clearing_member_initiate_operation_confirmed_message_record.sub_hdr, flex_clearing_member_initiate_operation_confirmed_message_base + 0);
  flex_clearing_member_initiate_operation_confirmed_message_record.part_id = (flex_clearing_member_initiate_operation_confirmed_message_base + 6 + 1) % 256;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> flex_clearing_member_initiate_operation_confirmed_message_record.wide_status_code[flex_clearing_member_initiate_operation_confirmed_message_at] = (flex_clearing_member_initiate_operation_confirmed_message_base + 7 + flex_clearing_member_initiate_operation_confirmed_message_at + 1) % 256; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> flex_clearing_member_initiate_operation_confirmed_message_record.member_id[flex_clearing_member_initiate_operation_confirmed_message_at] = (flex_clearing_member_initiate_operation_confirmed_message_base + 9 + flex_clearing_member_initiate_operation_confirmed_message_at + 1) % 256; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_record.target_id = (flex_clearing_member_initiate_operation_confirmed_message_base + 11 + 1) % 256;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 4 -> flex_clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[flex_clearing_member_initiate_operation_confirmed_message_at] = (flex_clearing_member_initiate_operation_confirmed_message_base + 12 + flex_clearing_member_initiate_operation_confirmed_message_at + 1) % 256; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 16 -> flex_clearing_member_initiate_operation_confirmed_message_record.reserved_16[flex_clearing_member_initiate_operation_confirmed_message_at] = (flex_clearing_member_initiate_operation_confirmed_message_base + 16 + flex_clearing_member_initiate_operation_confirmed_message_at + 1) % 256; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Flex Clearing Member Initiate Operation Confirmed Message to the wire, 32 bytes from where the cursor stands */
inline encode_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_record) {
  encode_sub_hdr(flex_clearing_member_initiate_operation_confirmed_message_record.sub_hdr);
  wire[at] = flex_clearing_member_initiate_operation_confirmed_message_record.part_id; at = at + 1;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> wire[at] = flex_clearing_member_initiate_operation_confirmed_message_record.wide_status_code[flex_clearing_member_initiate_operation_confirmed_message_at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> wire[at] = flex_clearing_member_initiate_operation_confirmed_message_record.member_id[flex_clearing_member_initiate_operation_confirmed_message_at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  wire[at] = flex_clearing_member_initiate_operation_confirmed_message_record.target_id; at = at + 1;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 4 -> wire[at] = flex_clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[flex_clearing_member_initiate_operation_confirmed_message_at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 16 -> wire[at] = flex_clearing_member_initiate_operation_confirmed_message_record.reserved_16[flex_clearing_member_initiate_operation_confirmed_message_at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Flex Clearing Member Initiate Operation Confirmed Message off the wire, 32 bytes from where the cursor stands */
inline decode_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_record) {
  decode_sub_hdr(flex_clearing_member_initiate_operation_confirmed_message_record.sub_hdr);
  flex_clearing_member_initiate_operation_confirmed_message_record.part_id = wire[at]; at = at + 1;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> flex_clearing_member_initiate_operation_confirmed_message_record.wide_status_code[flex_clearing_member_initiate_operation_confirmed_message_at] = wire[at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> flex_clearing_member_initiate_operation_confirmed_message_record.member_id[flex_clearing_member_initiate_operation_confirmed_message_at] = wire[at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_record.target_id = wire[at]; at = at + 1;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 4 -> flex_clearing_member_initiate_operation_confirmed_message_record.req_cm_seq[flex_clearing_member_initiate_operation_confirmed_message_at] = wire[at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 16 -> flex_clearing_member_initiate_operation_confirmed_message_record.reserved_16[flex_clearing_member_initiate_operation_confirmed_message_at] = wire[at]; at = at + 1; flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Flex Clearing Member Initiate Operation Confirmed Message is what was written, byte for byte */
inline equal_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_read, flex_clearing_member_initiate_operation_confirmed_message_written) {
  equal_sub_hdr(flex_clearing_member_initiate_operation_confirmed_message_read.sub_hdr, flex_clearing_member_initiate_operation_confirmed_message_written.sub_hdr);
  assert(flex_clearing_member_initiate_operation_confirmed_message_read.part_id == flex_clearing_member_initiate_operation_confirmed_message_written.part_id);
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> assert(flex_clearing_member_initiate_operation_confirmed_message_read.wide_status_code[flex_clearing_member_initiate_operation_confirmed_message_at] == flex_clearing_member_initiate_operation_confirmed_message_written.wide_status_code[flex_clearing_member_initiate_operation_confirmed_message_at]); flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 2 -> assert(flex_clearing_member_initiate_operation_confirmed_message_read.member_id[flex_clearing_member_initiate_operation_confirmed_message_at] == flex_clearing_member_initiate_operation_confirmed_message_written.member_id[flex_clearing_member_initiate_operation_confirmed_message_at]); flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  assert(flex_clearing_member_initiate_operation_confirmed_message_read.target_id == flex_clearing_member_initiate_operation_confirmed_message_written.target_id);
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 4 -> assert(flex_clearing_member_initiate_operation_confirmed_message_read.req_cm_seq[flex_clearing_member_initiate_operation_confirmed_message_at] == flex_clearing_member_initiate_operation_confirmed_message_written.req_cm_seq[flex_clearing_member_initiate_operation_confirmed_message_at]); flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  flex_clearing_member_initiate_operation_confirmed_message_at = 0;
  do
  :: flex_clearing_member_initiate_operation_confirmed_message_at < 16 -> assert(flex_clearing_member_initiate_operation_confirmed_message_read.reserved_16[flex_clearing_member_initiate_operation_confirmed_message_at] == flex_clearing_member_initiate_operation_confirmed_message_written.reserved_16[flex_clearing_member_initiate_operation_confirmed_message_at]); flex_clearing_member_initiate_operation_confirmed_message_at = flex_clearing_member_initiate_operation_confirmed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Tail: 1 bytes --------------------------------------------------- */

/* Tmp Message Tail, carrying the check sum of a message */
typedef MessageTail {
  byte check_sum
};

/* every byte of Message Tail set to one value */
inline fill_message_tail(message_tail_record, message_tail_value) {
  message_tail_record.check_sum = message_tail_value;
  skip
}

/* each byte of Message Tail set to where it lies, so a field read out of place says so */
inline ramp_message_tail(message_tail_record, message_tail_base) {
  message_tail_record.check_sum = (message_tail_base + 0 + 1) % 256;
  skip
}

/* Message Tail to the wire, 1 bytes from where the cursor stands */
inline encode_message_tail(message_tail_record) {
  wire[at] = message_tail_record.check_sum; at = at + 1;
  skip
}

/* Message Tail off the wire, 1 bytes from where the cursor stands */
inline decode_message_tail(message_tail_record) {
  message_tail_record.check_sum = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Tail is what was written, byte for byte */
inline equal_message_tail(message_tail_read, message_tail_written) {
  assert(message_tail_read.check_sum == message_tail_written.check_sum);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Header Time: encoded, read back, and compared */
proctype check_header_time() {
  HeaderTime header_time_sent;
  HeaderTime header_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_header_time(header_time_sent, 0)
  :: pattern == 1 -> fill_header_time(header_time_sent, 32)
  :: pattern == 2 -> fill_header_time(header_time_sent, 255)
  :: else -> ramp_header_time(header_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_header_time(header_time_sent);
    assert(at == 6);
    at = 0;
    decode_header_time(header_time_got);
    assert(at == 6);
    equal_header_time(header_time_got, header_time_sent)
  }
}

/* Hdr: encoded, read back, and compared */
proctype check_hdr() {
  Hdr hdr_sent;
  Hdr hdr_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_hdr(hdr_sent, 0)
  :: pattern == 1 -> fill_hdr(hdr_sent, 32)
  :: pattern == 2 -> fill_hdr(hdr_sent, 255)
  :: else -> ramp_hdr(hdr_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_hdr(hdr_sent);
    assert(at == 17);
    at = 0;
    decode_hdr(hdr_got);
    assert(at == 17);
    equal_hdr(hdr_got, hdr_sent)
  }
}

/* Wake Up Call Message: encoded, read back, and compared */
proctype check_wake_up_call_message() {
  WakeUpCallMessage wake_up_call_message_sent;
  WakeUpCallMessage wake_up_call_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wake_up_call_message(wake_up_call_message_sent, 0)
  :: pattern == 1 -> fill_wake_up_call_message(wake_up_call_message_sent, 32)
  :: pattern == 2 -> fill_wake_up_call_message(wake_up_call_message_sent, 255)
  :: else -> ramp_wake_up_call_message(wake_up_call_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wake_up_call_message(wake_up_call_message_sent);
    assert(at == 5);
    at = 0;
    decode_wake_up_call_message(wake_up_call_message_got);
    assert(at == 5);
    equal_wake_up_call_message(wake_up_call_message_got, wake_up_call_message_sent)
  }
}

/* Wake Up Call Confirmed Message: encoded, read back, and compared */
proctype check_wake_up_call_confirmed_message() {
  WakeUpCallConfirmedMessage wake_up_call_confirmed_message_sent;
  WakeUpCallConfirmedMessage wake_up_call_confirmed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wake_up_call_confirmed_message(wake_up_call_confirmed_message_sent, 0)
  :: pattern == 1 -> fill_wake_up_call_confirmed_message(wake_up_call_confirmed_message_sent, 32)
  :: pattern == 2 -> fill_wake_up_call_confirmed_message(wake_up_call_confirmed_message_sent, 255)
  :: else -> ramp_wake_up_call_confirmed_message(wake_up_call_confirmed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wake_up_call_confirmed_message(wake_up_call_confirmed_message_sent);
    assert(at == 1);
    at = 0;
    decode_wake_up_call_confirmed_message(wake_up_call_confirmed_message_got);
    assert(at == 1);
    equal_wake_up_call_confirmed_message(wake_up_call_confirmed_message_got, wake_up_call_confirmed_message_sent)
  }
}

/* Logon Notice Message: encoded, read back, and compared */
proctype check_logon_notice_message() {
  LogonNoticeMessage logon_notice_message_sent;
  LogonNoticeMessage logon_notice_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_notice_message(logon_notice_message_sent, 0)
  :: pattern == 1 -> fill_logon_notice_message(logon_notice_message_sent, 32)
  :: pattern == 2 -> fill_logon_notice_message(logon_notice_message_sent, 255)
  :: else -> ramp_logon_notice_message(logon_notice_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_notice_message(logon_notice_message_sent);
    assert(at == 9);
    at = 0;
    decode_logon_notice_message(logon_notice_message_got);
    assert(at == 9);
    equal_logon_notice_message(logon_notice_message_got, logon_notice_message_sent)
  }
}

/* Sub Hdr: encoded, read back, and compared */
proctype check_sub_hdr() {
  SubHdr sub_hdr_sent;
  SubHdr sub_hdr_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sub_hdr(sub_hdr_sent, 0)
  :: pattern == 1 -> fill_sub_hdr(sub_hdr_sent, 32)
  :: pattern == 2 -> fill_sub_hdr(sub_hdr_sent, 255)
  :: else -> ramp_sub_hdr(sub_hdr_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sub_hdr(sub_hdr_sent);
    assert(at == 6);
    at = 0;
    decode_sub_hdr(sub_hdr_got);
    assert(at == 6);
    equal_sub_hdr(sub_hdr_got, sub_hdr_sent)
  }
}

/* Final Sequential Number Notification For Group Message: encoded, read back, and compared */
proctype check_final_sequential_number_notification_for_group_message() {
  FinalSequentialNumberNotificationForGroupMessage final_sequential_number_notification_for_group_message_sent;
  FinalSequentialNumberNotificationForGroupMessage final_sequential_number_notification_for_group_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_sent, 0)
  :: pattern == 1 -> fill_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_sent, 32)
  :: pattern == 2 -> fill_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_sent, 255)
  :: else -> ramp_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_sent);
    assert(at == 21);
    at = 0;
    decode_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_got);
    assert(at == 21);
    equal_final_sequential_number_notification_for_group_message(final_sequential_number_notification_for_group_message_got, final_sequential_number_notification_for_group_message_sent)
  }
}

/* Request Logon Message: encoded, read back, and compared */
proctype check_request_logon_message() {
  RequestLogonMessage request_logon_message_sent;
  RequestLogonMessage request_logon_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_logon_message(request_logon_message_sent, 0)
  :: pattern == 1 -> fill_request_logon_message(request_logon_message_sent, 32)
  :: pattern == 2 -> fill_request_logon_message(request_logon_message_sent, 255)
  :: else -> ramp_request_logon_message(request_logon_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_logon_message(request_logon_message_sent);
    assert(at == 15);
    at = 0;
    decode_request_logon_message(request_logon_message_got);
    assert(at == 15);
    equal_request_logon_message(request_logon_message_got, request_logon_message_sent)
  }
}

/* Activate Application System Message: encoded, read back, and compared */
proctype check_activate_application_system_message() {
  ActivateApplicationSystemMessage activate_application_system_message_sent;
  ActivateApplicationSystemMessage activate_application_system_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_activate_application_system_message(activate_application_system_message_sent, 0)
  :: pattern == 1 -> fill_activate_application_system_message(activate_application_system_message_sent, 32)
  :: pattern == 2 -> fill_activate_application_system_message(activate_application_system_message_sent, 255)
  :: else -> ramp_activate_application_system_message(activate_application_system_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_activate_application_system_message(activate_application_system_message_sent);
    assert(at == 4);
    at = 0;
    decode_activate_application_system_message(activate_application_system_message_got);
    assert(at == 4);
    equal_activate_application_system_message(activate_application_system_message_got, activate_application_system_message_sent)
  }
}

/* Activate Application System Confirmed Message: encoded, read back, and compared */
proctype check_activate_application_system_confirmed_message() {
  ActivateApplicationSystemConfirmedMessage activate_application_system_confirmed_message_sent;
  ActivateApplicationSystemConfirmedMessage activate_application_system_confirmed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_activate_application_system_confirmed_message(activate_application_system_confirmed_message_sent, 0)
  :: pattern == 1 -> fill_activate_application_system_confirmed_message(activate_application_system_confirmed_message_sent, 32)
  :: pattern == 2 -> fill_activate_application_system_confirmed_message(activate_application_system_confirmed_message_sent, 255)
  :: else -> ramp_activate_application_system_confirmed_message(activate_application_system_confirmed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_activate_application_system_confirmed_message(activate_application_system_confirmed_message_sent);
    assert(at == 1);
    at = 0;
    decode_activate_application_system_confirmed_message(activate_application_system_confirmed_message_got);
    assert(at == 1);
    equal_activate_application_system_confirmed_message(activate_application_system_confirmed_message_got, activate_application_system_confirmed_message_sent)
  }
}

/* Logout Confirmed Message: encoded, read back, and compared */
proctype check_logout_confirmed_message() {
  LogoutConfirmedMessage logout_confirmed_message_sent;
  LogoutConfirmedMessage logout_confirmed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_confirmed_message(logout_confirmed_message_sent, 0)
  :: pattern == 1 -> fill_logout_confirmed_message(logout_confirmed_message_sent, 32)
  :: pattern == 2 -> fill_logout_confirmed_message(logout_confirmed_message_sent, 255)
  :: else -> ramp_logout_confirmed_message(logout_confirmed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_confirmed_message(logout_confirmed_message_sent);
    assert(at == 1);
    at = 0;
    decode_logout_confirmed_message(logout_confirmed_message_got);
    assert(at == 1);
    equal_logout_confirmed_message(logout_confirmed_message_got, logout_confirmed_message_sent)
  }
}

/* Confirm Connection Message: encoded, read back, and compared */
proctype check_confirm_connection_message() {
  ConfirmConnectionMessage confirm_connection_message_sent;
  ConfirmConnectionMessage confirm_connection_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_confirm_connection_message(confirm_connection_message_sent, 0)
  :: pattern == 1 -> fill_confirm_connection_message(confirm_connection_message_sent, 32)
  :: pattern == 2 -> fill_confirm_connection_message(confirm_connection_message_sent, 255)
  :: else -> ramp_confirm_connection_message(confirm_connection_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_confirm_connection_message(confirm_connection_message_sent);
    assert(at == 1);
    at = 0;
    decode_confirm_connection_message(confirm_connection_message_got);
    assert(at == 1);
    equal_confirm_connection_message(confirm_connection_message_got, confirm_connection_message_sent)
  }
}

/* Connection Confirmed Message: encoded, read back, and compared */
proctype check_connection_confirmed_message() {
  ConnectionConfirmedMessage connection_confirmed_message_sent;
  ConnectionConfirmedMessage connection_confirmed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_connection_confirmed_message(connection_confirmed_message_sent, 0)
  :: pattern == 1 -> fill_connection_confirmed_message(connection_confirmed_message_sent, 32)
  :: pattern == 2 -> fill_connection_confirmed_message(connection_confirmed_message_sent, 255)
  :: else -> ramp_connection_confirmed_message(connection_confirmed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_connection_confirmed_message(connection_confirmed_message_sent);
    assert(at == 1);
    at = 0;
    decode_connection_confirmed_message(connection_confirmed_message_got);
    assert(at == 1);
    equal_connection_confirmed_message(connection_confirmed_message_got, connection_confirmed_message_sent)
  }
}

/* Symbol Text: encoded, read back, and compared */
proctype check_symbol_text() {
  SymbolText symbol_text_sent;
  SymbolText symbol_text_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_text(symbol_text_sent, 0)
  :: pattern == 1 -> fill_symbol_text(symbol_text_sent, 32)
  :: pattern == 2 -> fill_symbol_text(symbol_text_sent, 255)
  :: else -> ramp_symbol_text(symbol_text_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_text(symbol_text_sent);
    assert(at == 20);
    at = 0;
    decode_symbol_text(symbol_text_got);
    assert(at == 20);
    equal_symbol_text(symbol_text_got, symbol_text_sent)
  }
}

/* Org Trans Time Msg Time: encoded, read back, and compared */
proctype check_org_trans_time_msg_time() {
  OrgTransTimeMsgTime org_trans_time_msg_time_sent;
  OrgTransTimeMsgTime org_trans_time_msg_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_org_trans_time_msg_time(org_trans_time_msg_time_sent, 0)
  :: pattern == 1 -> fill_org_trans_time_msg_time(org_trans_time_msg_time_sent, 32)
  :: pattern == 2 -> fill_org_trans_time_msg_time(org_trans_time_msg_time_sent, 255)
  :: else -> ramp_org_trans_time_msg_time(org_trans_time_msg_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_org_trans_time_msg_time(org_trans_time_msg_time_sent);
    assert(at == 6);
    at = 0;
    decode_org_trans_time_msg_time(org_trans_time_msg_time_got);
    assert(at == 6);
    equal_org_trans_time_msg_time(org_trans_time_msg_time_got, org_trans_time_msg_time_sent)
  }
}

/* Transact Time Msg Time: encoded, read back, and compared */
proctype check_transact_time_msg_time() {
  TransactTimeMsgTime transact_time_msg_time_sent;
  TransactTimeMsgTime transact_time_msg_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transact_time_msg_time(transact_time_msg_time_sent, 0)
  :: pattern == 1 -> fill_transact_time_msg_time(transact_time_msg_time_sent, 32)
  :: pattern == 2 -> fill_transact_time_msg_time(transact_time_msg_time_sent, 255)
  :: else -> ramp_transact_time_msg_time(transact_time_msg_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transact_time_msg_time(transact_time_msg_time_sent);
    assert(at == 6);
    at = 0;
    decode_transact_time_msg_time(transact_time_msg_time_got);
    assert(at == 6);
    equal_transact_time_msg_time(transact_time_msg_time_got, transact_time_msg_time_sent)
  }
}

/* Long Symbol Text: encoded, read back, and compared */
proctype check_long_symbol_text() {
  LongSymbolText long_symbol_text_sent;
  LongSymbolText long_symbol_text_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_symbol_text(long_symbol_text_sent, 0)
  :: pattern == 1 -> fill_long_symbol_text(long_symbol_text_sent, 32)
  :: pattern == 2 -> fill_long_symbol_text(long_symbol_text_sent, 255)
  :: else -> ramp_long_symbol_text(long_symbol_text_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_symbol_text(long_symbol_text_sent);
    assert(at == 40);
    at = 0;
    decode_long_symbol_text(long_symbol_text_got);
    assert(at == 40);
    equal_long_symbol_text(long_symbol_text_got, long_symbol_text_sent)
  }
}

/* Symbol Num X: encoded, read back, and compared */
proctype check_symbol_num_x() {
  SymbolNumX symbol_num_x_sent;
  SymbolNumX symbol_num_x_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_num_x(symbol_num_x_sent, 0)
  :: pattern == 1 -> fill_symbol_num_x(symbol_num_x_sent, 32)
  :: pattern == 2 -> fill_symbol_num_x(symbol_num_x_sent, 255)
  :: else -> ramp_symbol_num_x(symbol_num_x_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_num_x(symbol_num_x_sent);
    assert(at == 4);
    at = 0;
    decode_symbol_num_x(symbol_num_x_got);
    assert(at == 4);
    equal_symbol_num_x(symbol_num_x_got, symbol_num_x_sent)
  }
}

/* Symbol Txt X: encoded, read back, and compared */
proctype check_symbol_txt_x() {
  SymbolTxtX symbol_txt_x_sent;
  SymbolTxtX symbol_txt_x_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_txt_x(symbol_txt_x_sent, 0)
  :: pattern == 1 -> fill_symbol_txt_x(symbol_txt_x_sent, 32)
  :: pattern == 2 -> fill_symbol_txt_x(symbol_txt_x_sent, 255)
  :: else -> ramp_symbol_txt_x(symbol_txt_x_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_txt_x(symbol_txt_x_sent);
    assert(at == 20);
    at = 0;
    decode_symbol_txt_x(symbol_txt_x_got);
    assert(at == 20);
    equal_symbol_txt_x(symbol_txt_x_got, symbol_txt_x_sent)
  }
}

/* Leg Sym Symbol Num X: encoded, read back, and compared */
proctype check_leg_sym_symbol_num_x() {
  LegSymSymbolNumX leg_sym_symbol_num_x_sent;
  LegSymSymbolNumX leg_sym_symbol_num_x_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_sym_symbol_num_x(leg_sym_symbol_num_x_sent, 0)
  :: pattern == 1 -> fill_leg_sym_symbol_num_x(leg_sym_symbol_num_x_sent, 32)
  :: pattern == 2 -> fill_leg_sym_symbol_num_x(leg_sym_symbol_num_x_sent, 255)
  :: else -> ramp_leg_sym_symbol_num_x(leg_sym_symbol_num_x_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_sym_symbol_num_x(leg_sym_symbol_num_x_sent);
    assert(at == 4);
    at = 0;
    decode_leg_sym_symbol_num_x(leg_sym_symbol_num_x_got);
    assert(at == 4);
    equal_leg_sym_symbol_num_x(leg_sym_symbol_num_x_got, leg_sym_symbol_num_x_sent)
  }
}

/* Leg Sym Symbol Txt X: encoded, read back, and compared */
proctype check_leg_sym_symbol_txt_x() {
  LegSymSymbolTxtX leg_sym_symbol_txt_x_sent;
  LegSymSymbolTxtX leg_sym_symbol_txt_x_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_sent, 0)
  :: pattern == 1 -> fill_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_sent, 32)
  :: pattern == 2 -> fill_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_sent, 255)
  :: else -> ramp_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_sent);
    assert(at == 20);
    at = 0;
    decode_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_got);
    assert(at == 20);
    equal_leg_sym_symbol_txt_x(leg_sym_symbol_txt_x_got, leg_sym_symbol_txt_x_sent)
  }
}

/* Org Trans Time Msg Time X: encoded, read back, and compared */
proctype check_org_trans_time_msg_time_x() {
  OrgTransTimeMsgTimeX org_trans_time_msg_time_x_sent;
  OrgTransTimeMsgTimeX org_trans_time_msg_time_x_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_org_trans_time_msg_time_x(org_trans_time_msg_time_x_sent, 0)
  :: pattern == 1 -> fill_org_trans_time_msg_time_x(org_trans_time_msg_time_x_sent, 32)
  :: pattern == 2 -> fill_org_trans_time_msg_time_x(org_trans_time_msg_time_x_sent, 255)
  :: else -> ramp_org_trans_time_msg_time_x(org_trans_time_msg_time_x_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_org_trans_time_msg_time_x(org_trans_time_msg_time_x_sent);
    assert(at == 8);
    at = 0;
    decode_org_trans_time_msg_time_x(org_trans_time_msg_time_x_got);
    assert(at == 8);
    equal_org_trans_time_msg_time_x(org_trans_time_msg_time_x_got, org_trans_time_msg_time_x_sent)
  }
}

/* Transact Time Msg Time X: encoded, read back, and compared */
proctype check_transact_time_msg_time_x() {
  TransactTimeMsgTimeX transact_time_msg_time_x_sent;
  TransactTimeMsgTimeX transact_time_msg_time_x_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transact_time_msg_time_x(transact_time_msg_time_x_sent, 0)
  :: pattern == 1 -> fill_transact_time_msg_time_x(transact_time_msg_time_x_sent, 32)
  :: pattern == 2 -> fill_transact_time_msg_time_x(transact_time_msg_time_x_sent, 255)
  :: else -> ramp_transact_time_msg_time_x(transact_time_msg_time_x_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transact_time_msg_time_x(transact_time_msg_time_x_sent);
    assert(at == 8);
    at = 0;
    decode_transact_time_msg_time_x(transact_time_msg_time_x_got);
    assert(at == 8);
    equal_transact_time_msg_time_x(transact_time_msg_time_x_got, transact_time_msg_time_x_sent)
  }
}

/* Clearing Member Initiate Operation Message: encoded, read back, and compared */
proctype check_clearing_member_initiate_operation_message() {
  ClearingMemberInitiateOperationMessage clearing_member_initiate_operation_message_sent;
  ClearingMemberInitiateOperationMessage clearing_member_initiate_operation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_sent, 0)
  :: pattern == 1 -> fill_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_sent, 32)
  :: pattern == 2 -> fill_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_sent, 255)
  :: else -> ramp_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_sent);
    assert(at == 7);
    at = 0;
    decode_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_got);
    assert(at == 7);
    equal_clearing_member_initiate_operation_message(clearing_member_initiate_operation_message_got, clearing_member_initiate_operation_message_sent)
  }
}

/* Clearing Member Initiate Operation Confirmed Message: encoded, read back, and compared */
proctype check_clearing_member_initiate_operation_confirmed_message() {
  ClearingMemberInitiateOperationConfirmedMessage clearing_member_initiate_operation_confirmed_message_sent;
  ClearingMemberInitiateOperationConfirmedMessage clearing_member_initiate_operation_confirmed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_sent, 0)
  :: pattern == 1 -> fill_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_sent, 32)
  :: pattern == 2 -> fill_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_sent, 255)
  :: else -> ramp_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_sent);
    assert(at == 8);
    at = 0;
    decode_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_got);
    assert(at == 8);
    equal_clearing_member_initiate_operation_confirmed_message(clearing_member_initiate_operation_confirmed_message_got, clearing_member_initiate_operation_confirmed_message_sent)
  }
}

/* Flex Clearing Member Initiate Operation Message: encoded, read back, and compared */
proctype check_flex_clearing_member_initiate_operation_message() {
  FlexClearingMemberInitiateOperationMessage flex_clearing_member_initiate_operation_message_sent;
  FlexClearingMemberInitiateOperationMessage flex_clearing_member_initiate_operation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_sent, 0)
  :: pattern == 1 -> fill_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_sent, 32)
  :: pattern == 2 -> fill_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_sent, 255)
  :: else -> ramp_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_sent);
    assert(at == 14);
    at = 0;
    decode_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_got);
    assert(at == 14);
    equal_flex_clearing_member_initiate_operation_message(flex_clearing_member_initiate_operation_message_got, flex_clearing_member_initiate_operation_message_sent)
  }
}

/* Flex Clearing Member Initiate Operation Confirmed Message: encoded, read back, and compared */
proctype check_flex_clearing_member_initiate_operation_confirmed_message() {
  FlexClearingMemberInitiateOperationConfirmedMessage flex_clearing_member_initiate_operation_confirmed_message_sent;
  FlexClearingMemberInitiateOperationConfirmedMessage flex_clearing_member_initiate_operation_confirmed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_sent, 0)
  :: pattern == 1 -> fill_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_sent, 32)
  :: pattern == 2 -> fill_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_sent, 255)
  :: else -> ramp_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_sent);
    assert(at == 32);
    at = 0;
    decode_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_got);
    assert(at == 32);
    equal_flex_clearing_member_initiate_operation_confirmed_message(flex_clearing_member_initiate_operation_confirmed_message_got, flex_clearing_member_initiate_operation_confirmed_message_sent)
  }
}

/* Message Tail: encoded, read back, and compared */
proctype check_message_tail() {
  MessageTail message_tail_sent;
  MessageTail message_tail_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_tail(message_tail_sent, 0)
  :: pattern == 1 -> fill_message_tail(message_tail_sent, 32)
  :: pattern == 2 -> fill_message_tail(message_tail_sent, 255)
  :: else -> ramp_message_tail(message_tail_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_tail(message_tail_sent);
    assert(at == 1);
    at = 0;
    decode_message_tail(message_tail_got);
    assert(at == 1);
    equal_message_tail(message_tail_got, message_tail_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_header_time()
  :: run check_hdr()
  :: run check_wake_up_call_message()
  :: run check_wake_up_call_confirmed_message()
  :: run check_logon_notice_message()
  :: run check_sub_hdr()
  :: run check_final_sequential_number_notification_for_group_message()
  :: run check_request_logon_message()
  :: run check_activate_application_system_message()
  :: run check_activate_application_system_confirmed_message()
  :: run check_logout_confirmed_message()
  :: run check_confirm_connection_message()
  :: run check_connection_confirmed_message()
  :: run check_symbol_text()
  :: run check_org_trans_time_msg_time()
  :: run check_transact_time_msg_time()
  :: run check_long_symbol_text()
  :: run check_symbol_num_x()
  :: run check_symbol_txt_x()
  :: run check_leg_sym_symbol_num_x()
  :: run check_leg_sym_symbol_txt_x()
  :: run check_org_trans_time_msg_time_x()
  :: run check_transact_time_msg_time_x()
  :: run check_clearing_member_initiate_operation_message()
  :: run check_clearing_member_initiate_operation_confirmed_message()
  :: run check_flex_clearing_member_initiate_operation_message()
  :: run check_flex_clearing_member_initiate_operation_confirmed_message()
  :: run check_message_tail()
  fi
}
