/*
 * Shenzhen Stock Exchange Szse Multicast Market Data
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
 *   - a field read in bits
 *   - a Conversion rule
 *   - a field present only on a condition
 *   - a run counted by a field
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 407

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Szse Binary message header, defining the type and body length of a message */
typedef MessageHeader {
  byte msg_type[4];
  byte body_length[4]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_type[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_length[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.msg_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.body_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.msg_type[message_header_at] == message_header_written.msg_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.body_length[message_header_at] == message_header_written.body_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Channel Heartbeat Message: 12 bytes ------------------------------------- */

/* Sent on a market data channel every 3 seconds, carrying the sequence number of the last market data message on the channel. */
typedef ChannelHeartbeatMessage {
  byte channel_no[2];
  byte appl_last_seq_num[8];
  byte end_of_channel[2]
};

int channel_heartbeat_message_at;

/* every byte of Channel Heartbeat Message set to one value */
inline fill_channel_heartbeat_message(channel_heartbeat_message_record, channel_heartbeat_message_value) {
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> channel_heartbeat_message_record.channel_no[channel_heartbeat_message_at] = channel_heartbeat_message_value; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> channel_heartbeat_message_record.appl_last_seq_num[channel_heartbeat_message_at] = channel_heartbeat_message_value; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> channel_heartbeat_message_record.end_of_channel[channel_heartbeat_message_at] = channel_heartbeat_message_value; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Channel Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_channel_heartbeat_message(channel_heartbeat_message_record, channel_heartbeat_message_base) {
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> channel_heartbeat_message_record.channel_no[channel_heartbeat_message_at] = (channel_heartbeat_message_base + 0 + channel_heartbeat_message_at + 1) % 256; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> channel_heartbeat_message_record.appl_last_seq_num[channel_heartbeat_message_at] = (channel_heartbeat_message_base + 2 + channel_heartbeat_message_at + 1) % 256; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> channel_heartbeat_message_record.end_of_channel[channel_heartbeat_message_at] = (channel_heartbeat_message_base + 10 + channel_heartbeat_message_at + 1) % 256; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Channel Heartbeat Message to the wire, 12 bytes from where the cursor stands */
inline encode_channel_heartbeat_message(channel_heartbeat_message_record) {
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> wire[at] = channel_heartbeat_message_record.channel_no[channel_heartbeat_message_at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> wire[at] = channel_heartbeat_message_record.appl_last_seq_num[channel_heartbeat_message_at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> wire[at] = channel_heartbeat_message_record.end_of_channel[channel_heartbeat_message_at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Channel Heartbeat Message off the wire, 12 bytes from where the cursor stands */
inline decode_channel_heartbeat_message(channel_heartbeat_message_record) {
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> channel_heartbeat_message_record.channel_no[channel_heartbeat_message_at] = wire[at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> channel_heartbeat_message_record.appl_last_seq_num[channel_heartbeat_message_at] = wire[at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> channel_heartbeat_message_record.end_of_channel[channel_heartbeat_message_at] = wire[at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Channel Heartbeat Message is what was written, byte for byte */
inline equal_channel_heartbeat_message(channel_heartbeat_message_read, channel_heartbeat_message_written) {
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> assert(channel_heartbeat_message_read.channel_no[channel_heartbeat_message_at] == channel_heartbeat_message_written.channel_no[channel_heartbeat_message_at]); channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> assert(channel_heartbeat_message_read.appl_last_seq_num[channel_heartbeat_message_at] == channel_heartbeat_message_written.appl_last_seq_num[channel_heartbeat_message_at]); channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 2 -> assert(channel_heartbeat_message_read.end_of_channel[channel_heartbeat_message_at] == channel_heartbeat_message_written.end_of_channel[channel_heartbeat_message_at]); channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmitting Message: 44 bytes ---------------------------------------- */

/* Vendor Supplied System sends a re-transmission message to Market Data GateWay, which returns the re-transmission data needed followed by a re-transmission message indicating completion, or the failure reason if it fails. Market Data GateWay handles multiple requests in the order in which they arrive, so this message type is transmitted by both sides; ResendStatus and RejectText are only effective on the gateway reply. */
typedef RetransmittingMessage {
  byte resend_type;
  byte channel_no[2];
  byte appl_beg_seq_num[8];
  byte appl_end_seq_num[8];
  byte news_id[8];
  byte resend_status;
  byte reject_text[16]
};

int retransmitting_message_at;

/* every byte of Retransmitting Message set to one value */
inline fill_retransmitting_message(retransmitting_message_record, retransmitting_message_value) {
  retransmitting_message_record.resend_type = retransmitting_message_value;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 2 -> retransmitting_message_record.channel_no[retransmitting_message_at] = retransmitting_message_value; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.appl_beg_seq_num[retransmitting_message_at] = retransmitting_message_value; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.appl_end_seq_num[retransmitting_message_at] = retransmitting_message_value; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.news_id[retransmitting_message_at] = retransmitting_message_value; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_record.resend_status = retransmitting_message_value;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 16 -> retransmitting_message_record.reject_text[retransmitting_message_at] = retransmitting_message_value; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmitting Message set to where it lies, so a field read out of place says so */
inline ramp_retransmitting_message(retransmitting_message_record, retransmitting_message_base) {
  retransmitting_message_record.resend_type = (retransmitting_message_base + 0 + 1) % 256;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 2 -> retransmitting_message_record.channel_no[retransmitting_message_at] = (retransmitting_message_base + 1 + retransmitting_message_at + 1) % 256; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.appl_beg_seq_num[retransmitting_message_at] = (retransmitting_message_base + 3 + retransmitting_message_at + 1) % 256; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.appl_end_seq_num[retransmitting_message_at] = (retransmitting_message_base + 11 + retransmitting_message_at + 1) % 256; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.news_id[retransmitting_message_at] = (retransmitting_message_base + 19 + retransmitting_message_at + 1) % 256; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_record.resend_status = (retransmitting_message_base + 27 + 1) % 256;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 16 -> retransmitting_message_record.reject_text[retransmitting_message_at] = (retransmitting_message_base + 28 + retransmitting_message_at + 1) % 256; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmitting Message to the wire, 44 bytes from where the cursor stands */
inline encode_retransmitting_message(retransmitting_message_record) {
  wire[at] = retransmitting_message_record.resend_type; at = at + 1;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 2 -> wire[at] = retransmitting_message_record.channel_no[retransmitting_message_at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> wire[at] = retransmitting_message_record.appl_beg_seq_num[retransmitting_message_at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> wire[at] = retransmitting_message_record.appl_end_seq_num[retransmitting_message_at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> wire[at] = retransmitting_message_record.news_id[retransmitting_message_at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmitting_message_record.resend_status; at = at + 1;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 16 -> wire[at] = retransmitting_message_record.reject_text[retransmitting_message_at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmitting Message off the wire, 44 bytes from where the cursor stands */
inline decode_retransmitting_message(retransmitting_message_record) {
  retransmitting_message_record.resend_type = wire[at]; at = at + 1;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 2 -> retransmitting_message_record.channel_no[retransmitting_message_at] = wire[at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.appl_beg_seq_num[retransmitting_message_at] = wire[at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.appl_end_seq_num[retransmitting_message_at] = wire[at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> retransmitting_message_record.news_id[retransmitting_message_at] = wire[at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_record.resend_status = wire[at]; at = at + 1;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 16 -> retransmitting_message_record.reject_text[retransmitting_message_at] = wire[at]; at = at + 1; retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmitting Message is what was written, byte for byte */
inline equal_retransmitting_message(retransmitting_message_read, retransmitting_message_written) {
  assert(retransmitting_message_read.resend_type == retransmitting_message_written.resend_type);
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 2 -> assert(retransmitting_message_read.channel_no[retransmitting_message_at] == retransmitting_message_written.channel_no[retransmitting_message_at]); retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> assert(retransmitting_message_read.appl_beg_seq_num[retransmitting_message_at] == retransmitting_message_written.appl_beg_seq_num[retransmitting_message_at]); retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> assert(retransmitting_message_read.appl_end_seq_num[retransmitting_message_at] == retransmitting_message_written.appl_end_seq_num[retransmitting_message_at]); retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 8 -> assert(retransmitting_message_read.news_id[retransmitting_message_at] == retransmitting_message_written.news_id[retransmitting_message_at]); retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  assert(retransmitting_message_read.resend_status == retransmitting_message_written.resend_status);
  retransmitting_message_at = 0;
  do
  :: retransmitting_message_at < 16 -> assert(retransmitting_message_read.reject_text[retransmitting_message_at] == retransmitting_message_written.reject_text[retransmitting_message_at]); retransmitting_message_at = retransmitting_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Client User Information Reporting Message: 26 bytes --------------------- */

/* Vendor Supplied System reports the number of client users connected to it at the current time to the Market Data GateWay front-end processor at regular intervals. Only the Vendor Supplied System of a vendor sends this message. */
typedef ClientUserInformationReportingMessage {
  byte orig_time[8];
  byte version_code[16];
  byte user_num[2]
};

int client_user_information_reporting_message_at;

/* every byte of Client User Information Reporting Message set to one value */
inline fill_client_user_information_reporting_message(client_user_information_reporting_message_record, client_user_information_reporting_message_value) {
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 8 -> client_user_information_reporting_message_record.orig_time[client_user_information_reporting_message_at] = client_user_information_reporting_message_value; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 16 -> client_user_information_reporting_message_record.version_code[client_user_information_reporting_message_at] = client_user_information_reporting_message_value; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 2 -> client_user_information_reporting_message_record.user_num[client_user_information_reporting_message_at] = client_user_information_reporting_message_value; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Client User Information Reporting Message set to where it lies, so a field read out of place says so */
inline ramp_client_user_information_reporting_message(client_user_information_reporting_message_record, client_user_information_reporting_message_base) {
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 8 -> client_user_information_reporting_message_record.orig_time[client_user_information_reporting_message_at] = (client_user_information_reporting_message_base + 0 + client_user_information_reporting_message_at + 1) % 256; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 16 -> client_user_information_reporting_message_record.version_code[client_user_information_reporting_message_at] = (client_user_information_reporting_message_base + 8 + client_user_information_reporting_message_at + 1) % 256; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 2 -> client_user_information_reporting_message_record.user_num[client_user_information_reporting_message_at] = (client_user_information_reporting_message_base + 24 + client_user_information_reporting_message_at + 1) % 256; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* Client User Information Reporting Message to the wire, 26 bytes from where the cursor stands */
inline encode_client_user_information_reporting_message(client_user_information_reporting_message_record) {
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 8 -> wire[at] = client_user_information_reporting_message_record.orig_time[client_user_information_reporting_message_at]; at = at + 1; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 16 -> wire[at] = client_user_information_reporting_message_record.version_code[client_user_information_reporting_message_at]; at = at + 1; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 2 -> wire[at] = client_user_information_reporting_message_record.user_num[client_user_information_reporting_message_at]; at = at + 1; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* Client User Information Reporting Message off the wire, 26 bytes from where the cursor stands */
inline decode_client_user_information_reporting_message(client_user_information_reporting_message_record) {
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 8 -> client_user_information_reporting_message_record.orig_time[client_user_information_reporting_message_at] = wire[at]; at = at + 1; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 16 -> client_user_information_reporting_message_record.version_code[client_user_information_reporting_message_at] = wire[at]; at = at + 1; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 2 -> client_user_information_reporting_message_record.user_num[client_user_information_reporting_message_at] = wire[at]; at = at + 1; client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Client User Information Reporting Message is what was written, byte for byte */
inline equal_client_user_information_reporting_message(client_user_information_reporting_message_read, client_user_information_reporting_message_written) {
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 8 -> assert(client_user_information_reporting_message_read.orig_time[client_user_information_reporting_message_at] == client_user_information_reporting_message_written.orig_time[client_user_information_reporting_message_at]); client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 16 -> assert(client_user_information_reporting_message_read.version_code[client_user_information_reporting_message_at] == client_user_information_reporting_message_written.version_code[client_user_information_reporting_message_at]); client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  client_user_information_reporting_message_at = 0;
  do
  :: client_user_information_reporting_message_at < 2 -> assert(client_user_information_reporting_message_read.user_num[client_user_information_reporting_message_at] == client_user_information_reporting_message_written.user_num[client_user_information_reporting_message_at]); client_user_information_reporting_message_at = client_user_information_reporting_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Business Reject Message: 74 bytes --------------------------------------- */

/* Rejects an application layer message that satisfies the session layer rules but does not satisfy the rules of the business layer. It reports on an incorrect re-transmitted message or client user information reporting message declared by the user. */
typedef BusinessRejectMessage {
  byte ref_seq_num[8];
  byte ref_msg_type[4];
  byte business_reject_ref_id[10];
  byte business_reject_reason[2];
  byte business_reject_text[50]
};

int business_reject_message_at;

/* every byte of Business Reject Message set to one value */
inline fill_business_reject_message(business_reject_message_record, business_reject_message_value) {
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 8 -> business_reject_message_record.ref_seq_num[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.ref_msg_type[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> business_reject_message_record.business_reject_ref_id[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 2 -> business_reject_message_record.business_reject_reason[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 50 -> business_reject_message_record.business_reject_text[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Business Reject Message set to where it lies, so a field read out of place says so */
inline ramp_business_reject_message(business_reject_message_record, business_reject_message_base) {
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 8 -> business_reject_message_record.ref_seq_num[business_reject_message_at] = (business_reject_message_base + 0 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.ref_msg_type[business_reject_message_at] = (business_reject_message_base + 8 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> business_reject_message_record.business_reject_ref_id[business_reject_message_at] = (business_reject_message_base + 12 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 2 -> business_reject_message_record.business_reject_reason[business_reject_message_at] = (business_reject_message_base + 22 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 50 -> business_reject_message_record.business_reject_text[business_reject_message_at] = (business_reject_message_base + 24 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Reject Message to the wire, 74 bytes from where the cursor stands */
inline encode_business_reject_message(business_reject_message_record) {
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 8 -> wire[at] = business_reject_message_record.ref_seq_num[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> wire[at] = business_reject_message_record.ref_msg_type[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> wire[at] = business_reject_message_record.business_reject_ref_id[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 2 -> wire[at] = business_reject_message_record.business_reject_reason[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 50 -> wire[at] = business_reject_message_record.business_reject_text[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Reject Message off the wire, 74 bytes from where the cursor stands */
inline decode_business_reject_message(business_reject_message_record) {
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 8 -> business_reject_message_record.ref_seq_num[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.ref_msg_type[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> business_reject_message_record.business_reject_ref_id[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 2 -> business_reject_message_record.business_reject_reason[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 50 -> business_reject_message_record.business_reject_text[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Business Reject Message is what was written, byte for byte */
inline equal_business_reject_message(business_reject_message_read, business_reject_message_written) {
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 8 -> assert(business_reject_message_read.ref_seq_num[business_reject_message_at] == business_reject_message_written.ref_seq_num[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> assert(business_reject_message_read.ref_msg_type[business_reject_message_at] == business_reject_message_written.ref_msg_type[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> assert(business_reject_message_read.business_reject_ref_id[business_reject_message_at] == business_reject_message_written.business_reject_ref_id[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 2 -> assert(business_reject_message_read.business_reject_reason[business_reject_message_at] == business_reject_message_written.business_reject_reason[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 50 -> assert(business_reject_message_read.business_reject_text[business_reject_message_at] == business_reject_message_written.business_reject_text[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Real Time Market Status Message: 69 bytes ------------------------------- */

/* Released every 3 seconds, carrying the trading session state of a market and, for stock connect, the daily quota balance. */
typedef RealTimeMarketStatusMessage {
  byte orig_time[8];
  byte channel_no[2];
  byte market_id[8];
  byte market_segment_id[8];
  byte trading_session_id[4];
  byte trading_session_sub_id[4];
  byte trad_ses_status[2];
  byte trad_ses_start_time[8];
  byte trad_ses_end_time[8];
  byte thredhold_amount[8];
  byte pos_amt[8];
  byte amounts_status
};

int real_time_market_status_message_at;

/* every byte of Real Time Market Status Message set to one value */
inline fill_real_time_market_status_message(real_time_market_status_message_record, real_time_market_status_message_value) {
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.orig_time[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> real_time_market_status_message_record.channel_no[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.market_id[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.market_segment_id[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> real_time_market_status_message_record.trading_session_id[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> real_time_market_status_message_record.trading_session_sub_id[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> real_time_market_status_message_record.trad_ses_status[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.trad_ses_start_time[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.trad_ses_end_time[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.thredhold_amount[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.pos_amt[real_time_market_status_message_at] = real_time_market_status_message_value; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_record.amounts_status = real_time_market_status_message_value;
  skip
}

/* each byte of Real Time Market Status Message set to where it lies, so a field read out of place says so */
inline ramp_real_time_market_status_message(real_time_market_status_message_record, real_time_market_status_message_base) {
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.orig_time[real_time_market_status_message_at] = (real_time_market_status_message_base + 0 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> real_time_market_status_message_record.channel_no[real_time_market_status_message_at] = (real_time_market_status_message_base + 8 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.market_id[real_time_market_status_message_at] = (real_time_market_status_message_base + 10 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.market_segment_id[real_time_market_status_message_at] = (real_time_market_status_message_base + 18 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> real_time_market_status_message_record.trading_session_id[real_time_market_status_message_at] = (real_time_market_status_message_base + 26 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> real_time_market_status_message_record.trading_session_sub_id[real_time_market_status_message_at] = (real_time_market_status_message_base + 30 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> real_time_market_status_message_record.trad_ses_status[real_time_market_status_message_at] = (real_time_market_status_message_base + 34 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.trad_ses_start_time[real_time_market_status_message_at] = (real_time_market_status_message_base + 36 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.trad_ses_end_time[real_time_market_status_message_at] = (real_time_market_status_message_base + 44 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.thredhold_amount[real_time_market_status_message_at] = (real_time_market_status_message_base + 52 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.pos_amt[real_time_market_status_message_at] = (real_time_market_status_message_base + 60 + real_time_market_status_message_at + 1) % 256; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_record.amounts_status = (real_time_market_status_message_base + 68 + 1) % 256;
  skip
}

/* Real Time Market Status Message to the wire, 69 bytes from where the cursor stands */
inline encode_real_time_market_status_message(real_time_market_status_message_record) {
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> wire[at] = real_time_market_status_message_record.orig_time[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> wire[at] = real_time_market_status_message_record.channel_no[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> wire[at] = real_time_market_status_message_record.market_id[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> wire[at] = real_time_market_status_message_record.market_segment_id[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> wire[at] = real_time_market_status_message_record.trading_session_id[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> wire[at] = real_time_market_status_message_record.trading_session_sub_id[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> wire[at] = real_time_market_status_message_record.trad_ses_status[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> wire[at] = real_time_market_status_message_record.trad_ses_start_time[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> wire[at] = real_time_market_status_message_record.trad_ses_end_time[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> wire[at] = real_time_market_status_message_record.thredhold_amount[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> wire[at] = real_time_market_status_message_record.pos_amt[real_time_market_status_message_at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  wire[at] = real_time_market_status_message_record.amounts_status; at = at + 1;
  skip
}

/* Real Time Market Status Message off the wire, 69 bytes from where the cursor stands */
inline decode_real_time_market_status_message(real_time_market_status_message_record) {
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.orig_time[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> real_time_market_status_message_record.channel_no[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.market_id[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.market_segment_id[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> real_time_market_status_message_record.trading_session_id[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> real_time_market_status_message_record.trading_session_sub_id[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> real_time_market_status_message_record.trad_ses_status[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.trad_ses_start_time[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.trad_ses_end_time[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.thredhold_amount[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> real_time_market_status_message_record.pos_amt[real_time_market_status_message_at] = wire[at]; at = at + 1; real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_record.amounts_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Real Time Market Status Message is what was written, byte for byte */
inline equal_real_time_market_status_message(real_time_market_status_message_read, real_time_market_status_message_written) {
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> assert(real_time_market_status_message_read.orig_time[real_time_market_status_message_at] == real_time_market_status_message_written.orig_time[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> assert(real_time_market_status_message_read.channel_no[real_time_market_status_message_at] == real_time_market_status_message_written.channel_no[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> assert(real_time_market_status_message_read.market_id[real_time_market_status_message_at] == real_time_market_status_message_written.market_id[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> assert(real_time_market_status_message_read.market_segment_id[real_time_market_status_message_at] == real_time_market_status_message_written.market_segment_id[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> assert(real_time_market_status_message_read.trading_session_id[real_time_market_status_message_at] == real_time_market_status_message_written.trading_session_id[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 4 -> assert(real_time_market_status_message_read.trading_session_sub_id[real_time_market_status_message_at] == real_time_market_status_message_written.trading_session_sub_id[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 2 -> assert(real_time_market_status_message_read.trad_ses_status[real_time_market_status_message_at] == real_time_market_status_message_written.trad_ses_status[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> assert(real_time_market_status_message_read.trad_ses_start_time[real_time_market_status_message_at] == real_time_market_status_message_written.trad_ses_start_time[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> assert(real_time_market_status_message_read.trad_ses_end_time[real_time_market_status_message_at] == real_time_market_status_message_written.trad_ses_end_time[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> assert(real_time_market_status_message_read.thredhold_amount[real_time_market_status_message_at] == real_time_market_status_message_written.thredhold_amount[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  real_time_market_status_message_at = 0;
  do
  :: real_time_market_status_message_at < 8 -> assert(real_time_market_status_message_read.pos_amt[real_time_market_status_message_at] == real_time_market_status_message_written.pos_amt[real_time_market_status_message_at]); real_time_market_status_message_at = real_time_market_status_message_at + 1
  :: else -> break
  od;
  assert(real_time_market_status_message_read.amounts_status == real_time_market_status_message_written.amounts_status);
  skip
}

/* ---- Statistic Indicator Snapshot Message: 69 bytes -------------------------- */

/* Snapshot carrying market data category 910, statistic indicators. */
typedef StatisticIndicatorSnapshotMessage {
  byte orig_time[8];
  byte channel_no[2];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte trading_phase_code[8];
  byte prev_close_px[8];
  byte num_trades[8];
  byte total_volume_trade[8];
  byte total_value_trade[8];
  byte stock_num[4]
};

int statistic_indicator_snapshot_message_at;

/* every byte of Statistic Indicator Snapshot Message set to one value */
inline fill_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_record, statistic_indicator_snapshot_message_value) {
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.orig_time[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 2 -> statistic_indicator_snapshot_message_record.channel_no[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 3 -> statistic_indicator_snapshot_message_record.md_stream_id[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.security_id[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> statistic_indicator_snapshot_message_record.security_id_source[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.trading_phase_code[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.prev_close_px[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.num_trades[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.total_volume_trade[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.total_value_trade[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> statistic_indicator_snapshot_message_record.stock_num[statistic_indicator_snapshot_message_at] = statistic_indicator_snapshot_message_value; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistic Indicator Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_record, statistic_indicator_snapshot_message_base) {
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.orig_time[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 0 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 2 -> statistic_indicator_snapshot_message_record.channel_no[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 8 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 3 -> statistic_indicator_snapshot_message_record.md_stream_id[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 10 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.security_id[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 13 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> statistic_indicator_snapshot_message_record.security_id_source[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 21 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.trading_phase_code[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 25 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.prev_close_px[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 33 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.num_trades[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 41 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.total_volume_trade[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 49 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.total_value_trade[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 57 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> statistic_indicator_snapshot_message_record.stock_num[statistic_indicator_snapshot_message_at] = (statistic_indicator_snapshot_message_base + 65 + statistic_indicator_snapshot_message_at + 1) % 256; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistic Indicator Snapshot Message to the wire, 69 bytes from where the cursor stands */
inline encode_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_record) {
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> wire[at] = statistic_indicator_snapshot_message_record.orig_time[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 2 -> wire[at] = statistic_indicator_snapshot_message_record.channel_no[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 3 -> wire[at] = statistic_indicator_snapshot_message_record.md_stream_id[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> wire[at] = statistic_indicator_snapshot_message_record.security_id[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> wire[at] = statistic_indicator_snapshot_message_record.security_id_source[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> wire[at] = statistic_indicator_snapshot_message_record.trading_phase_code[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> wire[at] = statistic_indicator_snapshot_message_record.prev_close_px[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> wire[at] = statistic_indicator_snapshot_message_record.num_trades[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> wire[at] = statistic_indicator_snapshot_message_record.total_volume_trade[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> wire[at] = statistic_indicator_snapshot_message_record.total_value_trade[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> wire[at] = statistic_indicator_snapshot_message_record.stock_num[statistic_indicator_snapshot_message_at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistic Indicator Snapshot Message off the wire, 69 bytes from where the cursor stands */
inline decode_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_record) {
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.orig_time[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 2 -> statistic_indicator_snapshot_message_record.channel_no[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 3 -> statistic_indicator_snapshot_message_record.md_stream_id[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.security_id[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> statistic_indicator_snapshot_message_record.security_id_source[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.trading_phase_code[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.prev_close_px[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.num_trades[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.total_volume_trade[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> statistic_indicator_snapshot_message_record.total_value_trade[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> statistic_indicator_snapshot_message_record.stock_num[statistic_indicator_snapshot_message_at] = wire[at]; at = at + 1; statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistic Indicator Snapshot Message is what was written, byte for byte */
inline equal_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_read, statistic_indicator_snapshot_message_written) {
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> assert(statistic_indicator_snapshot_message_read.orig_time[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.orig_time[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 2 -> assert(statistic_indicator_snapshot_message_read.channel_no[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.channel_no[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 3 -> assert(statistic_indicator_snapshot_message_read.md_stream_id[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.md_stream_id[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> assert(statistic_indicator_snapshot_message_read.security_id[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.security_id[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> assert(statistic_indicator_snapshot_message_read.security_id_source[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.security_id_source[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> assert(statistic_indicator_snapshot_message_read.trading_phase_code[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.trading_phase_code[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> assert(statistic_indicator_snapshot_message_read.prev_close_px[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.prev_close_px[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> assert(statistic_indicator_snapshot_message_read.num_trades[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.num_trades[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> assert(statistic_indicator_snapshot_message_read.total_volume_trade[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.total_volume_trade[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 8 -> assert(statistic_indicator_snapshot_message_read.total_value_trade[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.total_value_trade[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  statistic_indicator_snapshot_message_at = 0;
  do
  :: statistic_indicator_snapshot_message_at < 4 -> assert(statistic_indicator_snapshot_message_read.stock_num[statistic_indicator_snapshot_message_at] == statistic_indicator_snapshot_message_written.stock_num[statistic_indicator_snapshot_message_at]); statistic_indicator_snapshot_message_at = statistic_indicator_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Tick Data In Call Auction Message: 51 bytes ----------------------- */

/* Order tick carrying market data categories 011 for equities, funds and bonds in the call auction of the spot market, 021 pledge-style repo and 041 call auction in options. */
typedef OrderTickDataInCallAuctionMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transac_time[8];
  byte ord_type
};

int order_tick_data_in_call_auction_message_at;

/* every byte of Order Tick Data In Call Auction Message set to one value */
inline fill_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_record, order_tick_data_in_call_auction_message_value) {
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 2 -> order_tick_data_in_call_auction_message_record.channel_no[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.appl_seq_num[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 3 -> order_tick_data_in_call_auction_message_record.md_stream_id[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.security_id[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 4 -> order_tick_data_in_call_auction_message_record.security_id_source[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.price[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.order_qty[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_record.side = order_tick_data_in_call_auction_message_value;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.transac_time[order_tick_data_in_call_auction_message_at] = order_tick_data_in_call_auction_message_value; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_record.ord_type = order_tick_data_in_call_auction_message_value;
  skip
}

/* each byte of Order Tick Data In Call Auction Message set to where it lies, so a field read out of place says so */
inline ramp_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_record, order_tick_data_in_call_auction_message_base) {
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 2 -> order_tick_data_in_call_auction_message_record.channel_no[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 0 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.appl_seq_num[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 2 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 3 -> order_tick_data_in_call_auction_message_record.md_stream_id[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 10 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.security_id[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 13 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 4 -> order_tick_data_in_call_auction_message_record.security_id_source[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 21 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.price[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 25 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.order_qty[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 33 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_record.side = (order_tick_data_in_call_auction_message_base + 41 + 1) % 256;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.transac_time[order_tick_data_in_call_auction_message_at] = (order_tick_data_in_call_auction_message_base + 42 + order_tick_data_in_call_auction_message_at + 1) % 256; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_record.ord_type = (order_tick_data_in_call_auction_message_base + 50 + 1) % 256;
  skip
}

/* Order Tick Data In Call Auction Message to the wire, 51 bytes from where the cursor stands */
inline encode_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_record) {
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 2 -> wire[at] = order_tick_data_in_call_auction_message_record.channel_no[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> wire[at] = order_tick_data_in_call_auction_message_record.appl_seq_num[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 3 -> wire[at] = order_tick_data_in_call_auction_message_record.md_stream_id[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> wire[at] = order_tick_data_in_call_auction_message_record.security_id[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 4 -> wire[at] = order_tick_data_in_call_auction_message_record.security_id_source[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> wire[at] = order_tick_data_in_call_auction_message_record.price[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> wire[at] = order_tick_data_in_call_auction_message_record.order_qty[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_in_call_auction_message_record.side; at = at + 1;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> wire[at] = order_tick_data_in_call_auction_message_record.transac_time[order_tick_data_in_call_auction_message_at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_in_call_auction_message_record.ord_type; at = at + 1;
  skip
}

/* Order Tick Data In Call Auction Message off the wire, 51 bytes from where the cursor stands */
inline decode_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_record) {
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 2 -> order_tick_data_in_call_auction_message_record.channel_no[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.appl_seq_num[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 3 -> order_tick_data_in_call_auction_message_record.md_stream_id[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.security_id[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 4 -> order_tick_data_in_call_auction_message_record.security_id_source[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.price[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.order_qty[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_record.side = wire[at]; at = at + 1;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> order_tick_data_in_call_auction_message_record.transac_time[order_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_record.ord_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Tick Data In Call Auction Message is what was written, byte for byte */
inline equal_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_read, order_tick_data_in_call_auction_message_written) {
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 2 -> assert(order_tick_data_in_call_auction_message_read.channel_no[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.channel_no[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> assert(order_tick_data_in_call_auction_message_read.appl_seq_num[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.appl_seq_num[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 3 -> assert(order_tick_data_in_call_auction_message_read.md_stream_id[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.md_stream_id[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> assert(order_tick_data_in_call_auction_message_read.security_id[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.security_id[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 4 -> assert(order_tick_data_in_call_auction_message_read.security_id_source[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.security_id_source[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> assert(order_tick_data_in_call_auction_message_read.price[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.price[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> assert(order_tick_data_in_call_auction_message_read.order_qty[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.order_qty[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_in_call_auction_message_read.side == order_tick_data_in_call_auction_message_written.side);
  order_tick_data_in_call_auction_message_at = 0;
  do
  :: order_tick_data_in_call_auction_message_at < 8 -> assert(order_tick_data_in_call_auction_message_read.transac_time[order_tick_data_in_call_auction_message_at] == order_tick_data_in_call_auction_message_written.transac_time[order_tick_data_in_call_auction_message_at]); order_tick_data_in_call_auction_message_at = order_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_in_call_auction_message_read.ord_type == order_tick_data_in_call_auction_message_written.ord_type);
  skip
}

/* ---- Order Tick Data Of Negotiable Trade Message: 100 bytes ------------------ */

/* Order tick carrying market data categories 051 indication of interest of negotiable trade and 052 quote of negotiable trade. */
typedef OrderTickDataOfNegotiableTradeMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transac_time[8];
  byte confirm_id[8];
  byte contactor[12];
  byte contact_info[30]
};

int order_tick_data_of_negotiable_trade_message_at;

/* every byte of Order Tick Data Of Negotiable Trade Message set to one value */
inline fill_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_record, order_tick_data_of_negotiable_trade_message_value) {
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 2 -> order_tick_data_of_negotiable_trade_message_record.channel_no[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.appl_seq_num[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 3 -> order_tick_data_of_negotiable_trade_message_record.md_stream_id[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.security_id[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 4 -> order_tick_data_of_negotiable_trade_message_record.security_id_source[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.price[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.order_qty[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_record.side = order_tick_data_of_negotiable_trade_message_value;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.transac_time[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.confirm_id[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 12 -> order_tick_data_of_negotiable_trade_message_record.contactor[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 30 -> order_tick_data_of_negotiable_trade_message_record.contact_info[order_tick_data_of_negotiable_trade_message_at] = order_tick_data_of_negotiable_trade_message_value; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Tick Data Of Negotiable Trade Message set to where it lies, so a field read out of place says so */
inline ramp_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_record, order_tick_data_of_negotiable_trade_message_base) {
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 2 -> order_tick_data_of_negotiable_trade_message_record.channel_no[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 0 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.appl_seq_num[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 2 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 3 -> order_tick_data_of_negotiable_trade_message_record.md_stream_id[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 10 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.security_id[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 13 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 4 -> order_tick_data_of_negotiable_trade_message_record.security_id_source[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 21 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.price[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 25 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.order_qty[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 33 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_record.side = (order_tick_data_of_negotiable_trade_message_base + 41 + 1) % 256;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.transac_time[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 42 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.confirm_id[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 50 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 12 -> order_tick_data_of_negotiable_trade_message_record.contactor[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 58 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 30 -> order_tick_data_of_negotiable_trade_message_record.contact_info[order_tick_data_of_negotiable_trade_message_at] = (order_tick_data_of_negotiable_trade_message_base + 70 + order_tick_data_of_negotiable_trade_message_at + 1) % 256; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Tick Data Of Negotiable Trade Message to the wire, 100 bytes from where the cursor stands */
inline encode_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_record) {
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 2 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.channel_no[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.appl_seq_num[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 3 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.md_stream_id[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.security_id[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 4 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.security_id_source[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.price[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.order_qty[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_negotiable_trade_message_record.side; at = at + 1;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.transac_time[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.confirm_id[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 12 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.contactor[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 30 -> wire[at] = order_tick_data_of_negotiable_trade_message_record.contact_info[order_tick_data_of_negotiable_trade_message_at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Tick Data Of Negotiable Trade Message off the wire, 100 bytes from where the cursor stands */
inline decode_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_record) {
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 2 -> order_tick_data_of_negotiable_trade_message_record.channel_no[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.appl_seq_num[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 3 -> order_tick_data_of_negotiable_trade_message_record.md_stream_id[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.security_id[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 4 -> order_tick_data_of_negotiable_trade_message_record.security_id_source[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.price[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.order_qty[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_record.side = wire[at]; at = at + 1;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.transac_time[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> order_tick_data_of_negotiable_trade_message_record.confirm_id[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 12 -> order_tick_data_of_negotiable_trade_message_record.contactor[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 30 -> order_tick_data_of_negotiable_trade_message_record.contact_info[order_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Tick Data Of Negotiable Trade Message is what was written, byte for byte */
inline equal_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_read, order_tick_data_of_negotiable_trade_message_written) {
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 2 -> assert(order_tick_data_of_negotiable_trade_message_read.channel_no[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.channel_no[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> assert(order_tick_data_of_negotiable_trade_message_read.appl_seq_num[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.appl_seq_num[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 3 -> assert(order_tick_data_of_negotiable_trade_message_read.md_stream_id[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.md_stream_id[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> assert(order_tick_data_of_negotiable_trade_message_read.security_id[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.security_id[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 4 -> assert(order_tick_data_of_negotiable_trade_message_read.security_id_source[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.security_id_source[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> assert(order_tick_data_of_negotiable_trade_message_read.price[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.price[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> assert(order_tick_data_of_negotiable_trade_message_read.order_qty[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.order_qty[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_negotiable_trade_message_read.side == order_tick_data_of_negotiable_trade_message_written.side);
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> assert(order_tick_data_of_negotiable_trade_message_read.transac_time[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.transac_time[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 8 -> assert(order_tick_data_of_negotiable_trade_message_read.confirm_id[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.confirm_id[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 12 -> assert(order_tick_data_of_negotiable_trade_message_read.contactor[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.contactor[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: order_tick_data_of_negotiable_trade_message_at < 30 -> assert(order_tick_data_of_negotiable_trade_message_read.contact_info[order_tick_data_of_negotiable_trade_message_at] == order_tick_data_of_negotiable_trade_message_written.contact_info[order_tick_data_of_negotiable_trade_message_at]); order_tick_data_of_negotiable_trade_message_at = order_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Tick Data Of Security Lending Message: 53 bytes ------------------- */

/* Order tick carrying market data category 071, security lending. */
typedef OrderTickDataOfSecurityLendingMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transac_time[8];
  byte expiration_days[2];
  byte expiration_type
};

int order_tick_data_of_security_lending_message_at;

/* every byte of Order Tick Data Of Security Lending Message set to one value */
inline fill_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_record, order_tick_data_of_security_lending_message_value) {
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> order_tick_data_of_security_lending_message_record.channel_no[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.appl_seq_num[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 3 -> order_tick_data_of_security_lending_message_record.md_stream_id[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.security_id[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 4 -> order_tick_data_of_security_lending_message_record.security_id_source[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.price[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.order_qty[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_record.side = order_tick_data_of_security_lending_message_value;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.transac_time[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> order_tick_data_of_security_lending_message_record.expiration_days[order_tick_data_of_security_lending_message_at] = order_tick_data_of_security_lending_message_value; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_record.expiration_type = order_tick_data_of_security_lending_message_value;
  skip
}

/* each byte of Order Tick Data Of Security Lending Message set to where it lies, so a field read out of place says so */
inline ramp_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_record, order_tick_data_of_security_lending_message_base) {
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> order_tick_data_of_security_lending_message_record.channel_no[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 0 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.appl_seq_num[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 2 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 3 -> order_tick_data_of_security_lending_message_record.md_stream_id[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 10 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.security_id[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 13 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 4 -> order_tick_data_of_security_lending_message_record.security_id_source[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 21 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.price[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 25 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.order_qty[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 33 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_record.side = (order_tick_data_of_security_lending_message_base + 41 + 1) % 256;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.transac_time[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 42 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> order_tick_data_of_security_lending_message_record.expiration_days[order_tick_data_of_security_lending_message_at] = (order_tick_data_of_security_lending_message_base + 50 + order_tick_data_of_security_lending_message_at + 1) % 256; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_record.expiration_type = (order_tick_data_of_security_lending_message_base + 52 + 1) % 256;
  skip
}

/* Order Tick Data Of Security Lending Message to the wire, 53 bytes from where the cursor stands */
inline encode_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_record) {
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> wire[at] = order_tick_data_of_security_lending_message_record.channel_no[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> wire[at] = order_tick_data_of_security_lending_message_record.appl_seq_num[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 3 -> wire[at] = order_tick_data_of_security_lending_message_record.md_stream_id[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> wire[at] = order_tick_data_of_security_lending_message_record.security_id[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 4 -> wire[at] = order_tick_data_of_security_lending_message_record.security_id_source[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> wire[at] = order_tick_data_of_security_lending_message_record.price[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> wire[at] = order_tick_data_of_security_lending_message_record.order_qty[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_security_lending_message_record.side; at = at + 1;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> wire[at] = order_tick_data_of_security_lending_message_record.transac_time[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> wire[at] = order_tick_data_of_security_lending_message_record.expiration_days[order_tick_data_of_security_lending_message_at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_security_lending_message_record.expiration_type; at = at + 1;
  skip
}

/* Order Tick Data Of Security Lending Message off the wire, 53 bytes from where the cursor stands */
inline decode_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_record) {
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> order_tick_data_of_security_lending_message_record.channel_no[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.appl_seq_num[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 3 -> order_tick_data_of_security_lending_message_record.md_stream_id[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.security_id[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 4 -> order_tick_data_of_security_lending_message_record.security_id_source[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.price[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.order_qty[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_record.side = wire[at]; at = at + 1;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> order_tick_data_of_security_lending_message_record.transac_time[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> order_tick_data_of_security_lending_message_record.expiration_days[order_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_record.expiration_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Tick Data Of Security Lending Message is what was written, byte for byte */
inline equal_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_read, order_tick_data_of_security_lending_message_written) {
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> assert(order_tick_data_of_security_lending_message_read.channel_no[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.channel_no[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> assert(order_tick_data_of_security_lending_message_read.appl_seq_num[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.appl_seq_num[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 3 -> assert(order_tick_data_of_security_lending_message_read.md_stream_id[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.md_stream_id[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> assert(order_tick_data_of_security_lending_message_read.security_id[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.security_id[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 4 -> assert(order_tick_data_of_security_lending_message_read.security_id_source[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.security_id_source[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> assert(order_tick_data_of_security_lending_message_read.price[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.price[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> assert(order_tick_data_of_security_lending_message_read.order_qty[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.order_qty[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_security_lending_message_read.side == order_tick_data_of_security_lending_message_written.side);
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 8 -> assert(order_tick_data_of_security_lending_message_read.transac_time[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.transac_time[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_security_lending_message_at = 0;
  do
  :: order_tick_data_of_security_lending_message_at < 2 -> assert(order_tick_data_of_security_lending_message_read.expiration_days[order_tick_data_of_security_lending_message_at] == order_tick_data_of_security_lending_message_written.expiration_days[order_tick_data_of_security_lending_message_at]); order_tick_data_of_security_lending_message_at = order_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_security_lending_message_read.expiration_type == order_tick_data_of_security_lending_message_written.expiration_type);
  skip
}

/* ---- Order Tick Data Of Spot Bond Trading Matching Deal Message: 51 bytes ---- */

/* Order tick carrying market data categories 021 bond general pledged repo matching deal and 411 spot bond trading matching deal. */
typedef OrderTickDataOfSpotBondTradingMatchingDealMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transac_time[8];
  byte ord_type
};

int order_tick_data_of_spot_bond_trading_matching_deal_message_at;

/* every byte of Order Tick Data Of Spot Bond Trading Matching Deal Message set to one value */
inline fill_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_record, order_tick_data_of_spot_bond_trading_matching_deal_message_value) {
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 2 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.channel_no[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 3 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 4 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id_source[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.price[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.order_qty[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_record.side = order_tick_data_of_spot_bond_trading_matching_deal_message_value;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.transac_time[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = order_tick_data_of_spot_bond_trading_matching_deal_message_value; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_record.ord_type = order_tick_data_of_spot_bond_trading_matching_deal_message_value;
  skip
}

/* each byte of Order Tick Data Of Spot Bond Trading Matching Deal Message set to where it lies, so a field read out of place says so */
inline ramp_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_record, order_tick_data_of_spot_bond_trading_matching_deal_message_base) {
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 2 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.channel_no[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 0 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 2 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 3 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 10 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 13 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 4 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id_source[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 21 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.price[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 25 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.order_qty[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 33 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_record.side = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 41 + 1) % 256;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.transac_time[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 42 + order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_record.ord_type = (order_tick_data_of_spot_bond_trading_matching_deal_message_base + 50 + 1) % 256;
  skip
}

/* Order Tick Data Of Spot Bond Trading Matching Deal Message to the wire, 51 bytes from where the cursor stands */
inline encode_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_record) {
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 2 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.channel_no[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 3 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 4 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id_source[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.price[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.order_qty[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.side; at = at + 1;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.transac_time[order_tick_data_of_spot_bond_trading_matching_deal_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_spot_bond_trading_matching_deal_message_record.ord_type; at = at + 1;
  skip
}

/* Order Tick Data Of Spot Bond Trading Matching Deal Message off the wire, 51 bytes from where the cursor stands */
inline decode_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_record) {
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 2 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.channel_no[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 3 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 4 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.security_id_source[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.price[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.order_qty[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_record.side = wire[at]; at = at + 1;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> order_tick_data_of_spot_bond_trading_matching_deal_message_record.transac_time[order_tick_data_of_spot_bond_trading_matching_deal_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_record.ord_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Tick Data Of Spot Bond Trading Matching Deal Message is what was written, byte for byte */
inline equal_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_read, order_tick_data_of_spot_bond_trading_matching_deal_message_written) {
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 2 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.channel_no[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.channel_no[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.appl_seq_num[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.appl_seq_num[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 3 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.md_stream_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.md_stream_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.security_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.security_id[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 4 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.security_id_source[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.security_id_source[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.price[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.price[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.order_qty[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.order_qty[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.side == order_tick_data_of_spot_bond_trading_matching_deal_message_written.side);
  order_tick_data_of_spot_bond_trading_matching_deal_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_matching_deal_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.transac_time[order_tick_data_of_spot_bond_trading_matching_deal_message_at] == order_tick_data_of_spot_bond_trading_matching_deal_message_written.transac_time[order_tick_data_of_spot_bond_trading_matching_deal_message_at]); order_tick_data_of_spot_bond_trading_matching_deal_message_at = order_tick_data_of_spot_bond_trading_matching_deal_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_spot_bond_trading_matching_deal_message_read.ord_type == order_tick_data_of_spot_bond_trading_matching_deal_message_written.ord_type);
  skip
}

/* ---- Order Tick Data Of Spot Bond Trading Quotation Message: 377 bytes ------- */

/* Order tick carrying market data categories 415 spot bond trading declaration of intent and 417 spot bond trading large amount matching deal, for spot bond trading other than bid. */
typedef OrderTickDataOfSpotBondTradingQuotationMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transac_time[8];
  byte quote_id[10];
  byte member_id[6];
  byte investor_type[2];
  byte investor_id[10];
  byte investor_name[120];
  byte trader_code[8];
  byte settl_period;
  byte settl_type[2];
  byte memo[160];
  byte min_qty[8]
};

int order_tick_data_of_spot_bond_trading_quotation_message_at;

/* every byte of Order Tick Data Of Spot Bond Trading Quotation Message set to one value */
inline fill_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_record, order_tick_data_of_spot_bond_trading_quotation_message_value) {
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> order_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.security_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> order_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.price[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.order_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_record.side = order_tick_data_of_spot_bond_trading_quotation_message_value;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> order_tick_data_of_spot_bond_trading_quotation_message_record.quote_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 6 -> order_tick_data_of_spot_bond_trading_quotation_message_record.member_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_type[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 120 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_name[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.trader_code[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_record.settl_period = order_tick_data_of_spot_bond_trading_quotation_message_value;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 160 -> order_tick_data_of_spot_bond_trading_quotation_message_record.memo[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.min_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] = order_tick_data_of_spot_bond_trading_quotation_message_value; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Tick Data Of Spot Bond Trading Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_record, order_tick_data_of_spot_bond_trading_quotation_message_base) {
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 0 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 2 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> order_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 10 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.security_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 13 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> order_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 21 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.price[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 25 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.order_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 33 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_record.side = (order_tick_data_of_spot_bond_trading_quotation_message_base + 41 + 1) % 256;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 42 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> order_tick_data_of_spot_bond_trading_quotation_message_record.quote_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 50 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 6 -> order_tick_data_of_spot_bond_trading_quotation_message_record.member_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 60 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_type[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 66 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 68 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 120 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_name[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 78 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.trader_code[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 198 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_record.settl_period = (order_tick_data_of_spot_bond_trading_quotation_message_base + 206 + 1) % 256;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 207 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 160 -> order_tick_data_of_spot_bond_trading_quotation_message_record.memo[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 209 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.min_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] = (order_tick_data_of_spot_bond_trading_quotation_message_base + 369 + order_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Tick Data Of Spot Bond Trading Quotation Message to the wire, 377 bytes from where the cursor stands */
inline encode_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_record) {
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.security_id[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.price[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.order_qty[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.side; at = at + 1;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.quote_id[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 6 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.member_id[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.investor_type[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.investor_id[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 120 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.investor_name[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.trader_code[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.settl_period; at = at + 1;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 160 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.memo[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = order_tick_data_of_spot_bond_trading_quotation_message_record.min_qty[order_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Tick Data Of Spot Bond Trading Quotation Message off the wire, 377 bytes from where the cursor stands */
inline decode_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_record) {
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> order_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.security_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> order_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.price[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.order_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_record.side = wire[at]; at = at + 1;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> order_tick_data_of_spot_bond_trading_quotation_message_record.quote_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 6 -> order_tick_data_of_spot_bond_trading_quotation_message_record.member_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_type[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_id[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 120 -> order_tick_data_of_spot_bond_trading_quotation_message_record.investor_name[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.trader_code[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_record.settl_period = wire[at]; at = at + 1;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> order_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 160 -> order_tick_data_of_spot_bond_trading_quotation_message_record.memo[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> order_tick_data_of_spot_bond_trading_quotation_message_record.min_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Tick Data Of Spot Bond Trading Quotation Message is what was written, byte for byte */
inline equal_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_read, order_tick_data_of_spot_bond_trading_quotation_message_written) {
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.channel_no[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.channel_no[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.appl_seq_num[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.appl_seq_num[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.md_stream_id[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.md_stream_id[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.security_id[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.security_id[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.security_id_source[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.security_id_source[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.price[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.price[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.order_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.order_qty[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_spot_bond_trading_quotation_message_read.side == order_tick_data_of_spot_bond_trading_quotation_message_written.side);
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.transac_time[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.transac_time[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.quote_id[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.quote_id[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 6 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.member_id[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.member_id[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.investor_type[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.investor_type[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 10 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.investor_id[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.investor_id[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 120 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.investor_name[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.investor_name[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.trader_code[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.trader_code[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_spot_bond_trading_quotation_message_read.settl_period == order_tick_data_of_spot_bond_trading_quotation_message_written.settl_period);
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.settl_type[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.settl_type[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 160 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.memo[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.memo[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: order_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(order_tick_data_of_spot_bond_trading_quotation_message_read.min_qty[order_tick_data_of_spot_bond_trading_quotation_message_at] == order_tick_data_of_spot_bond_trading_quotation_message_written.min_qty[order_tick_data_of_spot_bond_trading_quotation_message_at]); order_tick_data_of_spot_bond_trading_quotation_message_at = order_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Tick Data Of Bid Quotation Message: 407 bytes --------------------- */

/* Order tick carrying market data category 416, spot bond trading bidding deal, covering the bid order and bid reservation. */
typedef OrderTickDataOfBidQuotationMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transac_time[8];
  byte member_id[6];
  byte investor_type[2];
  byte investor_id[10];
  byte investor_name[120];
  byte trader_code[8];
  byte settl_period;
  byte settl_type[2];
  byte memo[160];
  byte secondary_order_id[16];
  byte bid_trans_type[2];
  byte bid_exec_inst_type[2];
  byte low_limit_price[8];
  byte high_limit_price[8];
  byte min_qty[8];
  byte trade_date[4]
};

int order_tick_data_of_bid_quotation_message_at;

/* every byte of Order Tick Data Of Bid Quotation Message set to one value */
inline fill_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_record, order_tick_data_of_bid_quotation_message_value) {
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.channel_no[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.appl_seq_num[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 3 -> order_tick_data_of_bid_quotation_message_record.md_stream_id[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.security_id[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> order_tick_data_of_bid_quotation_message_record.security_id_source[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.price[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.order_qty[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_record.side = order_tick_data_of_bid_quotation_message_value;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.transac_time[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 6 -> order_tick_data_of_bid_quotation_message_record.member_id[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.investor_type[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 10 -> order_tick_data_of_bid_quotation_message_record.investor_id[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 120 -> order_tick_data_of_bid_quotation_message_record.investor_name[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.trader_code[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_record.settl_period = order_tick_data_of_bid_quotation_message_value;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.settl_type[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 160 -> order_tick_data_of_bid_quotation_message_record.memo[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 16 -> order_tick_data_of_bid_quotation_message_record.secondary_order_id[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.bid_trans_type[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.low_limit_price[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.high_limit_price[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.min_qty[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> order_tick_data_of_bid_quotation_message_record.trade_date[order_tick_data_of_bid_quotation_message_at] = order_tick_data_of_bid_quotation_message_value; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Tick Data Of Bid Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_record, order_tick_data_of_bid_quotation_message_base) {
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.channel_no[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 0 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.appl_seq_num[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 2 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 3 -> order_tick_data_of_bid_quotation_message_record.md_stream_id[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 10 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.security_id[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 13 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> order_tick_data_of_bid_quotation_message_record.security_id_source[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 21 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.price[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 25 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.order_qty[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 33 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_record.side = (order_tick_data_of_bid_quotation_message_base + 41 + 1) % 256;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.transac_time[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 42 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 6 -> order_tick_data_of_bid_quotation_message_record.member_id[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 50 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.investor_type[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 56 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 10 -> order_tick_data_of_bid_quotation_message_record.investor_id[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 58 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 120 -> order_tick_data_of_bid_quotation_message_record.investor_name[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 68 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.trader_code[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 188 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_record.settl_period = (order_tick_data_of_bid_quotation_message_base + 196 + 1) % 256;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.settl_type[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 197 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 160 -> order_tick_data_of_bid_quotation_message_record.memo[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 199 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 16 -> order_tick_data_of_bid_quotation_message_record.secondary_order_id[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 359 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.bid_trans_type[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 375 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 377 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.low_limit_price[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 379 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.high_limit_price[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 387 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.min_qty[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 395 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> order_tick_data_of_bid_quotation_message_record.trade_date[order_tick_data_of_bid_quotation_message_at] = (order_tick_data_of_bid_quotation_message_base + 403 + order_tick_data_of_bid_quotation_message_at + 1) % 256; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Tick Data Of Bid Quotation Message to the wire, 407 bytes from where the cursor stands */
inline encode_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_record) {
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = order_tick_data_of_bid_quotation_message_record.channel_no[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.appl_seq_num[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 3 -> wire[at] = order_tick_data_of_bid_quotation_message_record.md_stream_id[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.security_id[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> wire[at] = order_tick_data_of_bid_quotation_message_record.security_id_source[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.price[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.order_qty[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_bid_quotation_message_record.side; at = at + 1;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.transac_time[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 6 -> wire[at] = order_tick_data_of_bid_quotation_message_record.member_id[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = order_tick_data_of_bid_quotation_message_record.investor_type[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 10 -> wire[at] = order_tick_data_of_bid_quotation_message_record.investor_id[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 120 -> wire[at] = order_tick_data_of_bid_quotation_message_record.investor_name[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.trader_code[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = order_tick_data_of_bid_quotation_message_record.settl_period; at = at + 1;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = order_tick_data_of_bid_quotation_message_record.settl_type[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 160 -> wire[at] = order_tick_data_of_bid_quotation_message_record.memo[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 16 -> wire[at] = order_tick_data_of_bid_quotation_message_record.secondary_order_id[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = order_tick_data_of_bid_quotation_message_record.bid_trans_type[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = order_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.low_limit_price[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.high_limit_price[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = order_tick_data_of_bid_quotation_message_record.min_qty[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> wire[at] = order_tick_data_of_bid_quotation_message_record.trade_date[order_tick_data_of_bid_quotation_message_at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Tick Data Of Bid Quotation Message off the wire, 407 bytes from where the cursor stands */
inline decode_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_record) {
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.channel_no[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.appl_seq_num[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 3 -> order_tick_data_of_bid_quotation_message_record.md_stream_id[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.security_id[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> order_tick_data_of_bid_quotation_message_record.security_id_source[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.price[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.order_qty[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_record.side = wire[at]; at = at + 1;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.transac_time[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 6 -> order_tick_data_of_bid_quotation_message_record.member_id[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.investor_type[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 10 -> order_tick_data_of_bid_quotation_message_record.investor_id[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 120 -> order_tick_data_of_bid_quotation_message_record.investor_name[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.trader_code[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_record.settl_period = wire[at]; at = at + 1;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.settl_type[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 160 -> order_tick_data_of_bid_quotation_message_record.memo[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 16 -> order_tick_data_of_bid_quotation_message_record.secondary_order_id[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.bid_trans_type[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> order_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.low_limit_price[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.high_limit_price[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> order_tick_data_of_bid_quotation_message_record.min_qty[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> order_tick_data_of_bid_quotation_message_record.trade_date[order_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Tick Data Of Bid Quotation Message is what was written, byte for byte */
inline equal_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_read, order_tick_data_of_bid_quotation_message_written) {
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> assert(order_tick_data_of_bid_quotation_message_read.channel_no[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.channel_no[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.appl_seq_num[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.appl_seq_num[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 3 -> assert(order_tick_data_of_bid_quotation_message_read.md_stream_id[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.md_stream_id[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.security_id[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.security_id[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> assert(order_tick_data_of_bid_quotation_message_read.security_id_source[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.security_id_source[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.price[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.price[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.order_qty[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.order_qty[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_bid_quotation_message_read.side == order_tick_data_of_bid_quotation_message_written.side);
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.transac_time[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.transac_time[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 6 -> assert(order_tick_data_of_bid_quotation_message_read.member_id[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.member_id[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> assert(order_tick_data_of_bid_quotation_message_read.investor_type[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.investor_type[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 10 -> assert(order_tick_data_of_bid_quotation_message_read.investor_id[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.investor_id[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 120 -> assert(order_tick_data_of_bid_quotation_message_read.investor_name[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.investor_name[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.trader_code[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.trader_code[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  assert(order_tick_data_of_bid_quotation_message_read.settl_period == order_tick_data_of_bid_quotation_message_written.settl_period);
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> assert(order_tick_data_of_bid_quotation_message_read.settl_type[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.settl_type[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 160 -> assert(order_tick_data_of_bid_quotation_message_read.memo[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.memo[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 16 -> assert(order_tick_data_of_bid_quotation_message_read.secondary_order_id[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.secondary_order_id[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> assert(order_tick_data_of_bid_quotation_message_read.bid_trans_type[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.bid_trans_type[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 2 -> assert(order_tick_data_of_bid_quotation_message_read.bid_exec_inst_type[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.bid_exec_inst_type[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.low_limit_price[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.low_limit_price[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.high_limit_price[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.high_limit_price[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 8 -> assert(order_tick_data_of_bid_quotation_message_read.min_qty[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.min_qty[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  order_tick_data_of_bid_quotation_message_at = 0;
  do
  :: order_tick_data_of_bid_quotation_message_at < 4 -> assert(order_tick_data_of_bid_quotation_message_read.trade_date[order_tick_data_of_bid_quotation_message_at] == order_tick_data_of_bid_quotation_message_written.trade_date[order_tick_data_of_bid_quotation_message_at]); order_tick_data_of_bid_quotation_message_at = order_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Tick Data In Call Auction Message: 66 bytes ----------------- */

/* Transaction tick carrying market data categories 011 for equities, funds and bonds in the call auction of the spot market, 021 pledge-style repo and 041 call auction in options. The sequence number of tick order and tick transaction data in the same channel is consecutive. */
typedef TransactionTickDataInCallAuctionMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte bid_appl_seq_num[8];
  byte offer_appl_seq_num[8];
  byte security_id[8];
  byte security_id_source[4];
  byte last_px[8];
  byte last_qty[8];
  byte exec_type;
  byte transac_time[8]
};

int transaction_tick_data_in_call_auction_message_at;

/* every byte of Transaction Tick Data In Call Auction Message set to one value */
inline fill_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_record, transaction_tick_data_in_call_auction_message_value) {
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 2 -> transaction_tick_data_in_call_auction_message_record.channel_no[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.appl_seq_num[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 3 -> transaction_tick_data_in_call_auction_message_record.md_stream_id[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.bid_appl_seq_num[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.offer_appl_seq_num[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.security_id[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 4 -> transaction_tick_data_in_call_auction_message_record.security_id_source[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.last_px[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.last_qty[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_record.exec_type = transaction_tick_data_in_call_auction_message_value;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.transac_time[transaction_tick_data_in_call_auction_message_at] = transaction_tick_data_in_call_auction_message_value; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Tick Data In Call Auction Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_record, transaction_tick_data_in_call_auction_message_base) {
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 2 -> transaction_tick_data_in_call_auction_message_record.channel_no[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 0 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.appl_seq_num[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 2 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 3 -> transaction_tick_data_in_call_auction_message_record.md_stream_id[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 10 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.bid_appl_seq_num[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 13 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.offer_appl_seq_num[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 21 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.security_id[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 29 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 4 -> transaction_tick_data_in_call_auction_message_record.security_id_source[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 37 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.last_px[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 41 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.last_qty[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 49 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_record.exec_type = (transaction_tick_data_in_call_auction_message_base + 57 + 1) % 256;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.transac_time[transaction_tick_data_in_call_auction_message_at] = (transaction_tick_data_in_call_auction_message_base + 58 + transaction_tick_data_in_call_auction_message_at + 1) % 256; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data In Call Auction Message to the wire, 66 bytes from where the cursor stands */
inline encode_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_record) {
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 2 -> wire[at] = transaction_tick_data_in_call_auction_message_record.channel_no[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> wire[at] = transaction_tick_data_in_call_auction_message_record.appl_seq_num[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 3 -> wire[at] = transaction_tick_data_in_call_auction_message_record.md_stream_id[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> wire[at] = transaction_tick_data_in_call_auction_message_record.bid_appl_seq_num[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> wire[at] = transaction_tick_data_in_call_auction_message_record.offer_appl_seq_num[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> wire[at] = transaction_tick_data_in_call_auction_message_record.security_id[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 4 -> wire[at] = transaction_tick_data_in_call_auction_message_record.security_id_source[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> wire[at] = transaction_tick_data_in_call_auction_message_record.last_px[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> wire[at] = transaction_tick_data_in_call_auction_message_record.last_qty[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_in_call_auction_message_record.exec_type; at = at + 1;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> wire[at] = transaction_tick_data_in_call_auction_message_record.transac_time[transaction_tick_data_in_call_auction_message_at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data In Call Auction Message off the wire, 66 bytes from where the cursor stands */
inline decode_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_record) {
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 2 -> transaction_tick_data_in_call_auction_message_record.channel_no[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.appl_seq_num[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 3 -> transaction_tick_data_in_call_auction_message_record.md_stream_id[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.bid_appl_seq_num[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.offer_appl_seq_num[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.security_id[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 4 -> transaction_tick_data_in_call_auction_message_record.security_id_source[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.last_px[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.last_qty[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_record.exec_type = wire[at]; at = at + 1;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> transaction_tick_data_in_call_auction_message_record.transac_time[transaction_tick_data_in_call_auction_message_at] = wire[at]; at = at + 1; transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Tick Data In Call Auction Message is what was written, byte for byte */
inline equal_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_read, transaction_tick_data_in_call_auction_message_written) {
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 2 -> assert(transaction_tick_data_in_call_auction_message_read.channel_no[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.channel_no[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> assert(transaction_tick_data_in_call_auction_message_read.appl_seq_num[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.appl_seq_num[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 3 -> assert(transaction_tick_data_in_call_auction_message_read.md_stream_id[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.md_stream_id[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> assert(transaction_tick_data_in_call_auction_message_read.bid_appl_seq_num[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.bid_appl_seq_num[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> assert(transaction_tick_data_in_call_auction_message_read.offer_appl_seq_num[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.offer_appl_seq_num[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> assert(transaction_tick_data_in_call_auction_message_read.security_id[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.security_id[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 4 -> assert(transaction_tick_data_in_call_auction_message_read.security_id_source[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.security_id_source[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> assert(transaction_tick_data_in_call_auction_message_read.last_px[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.last_px[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> assert(transaction_tick_data_in_call_auction_message_read.last_qty[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.last_qty[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_in_call_auction_message_read.exec_type == transaction_tick_data_in_call_auction_message_written.exec_type);
  transaction_tick_data_in_call_auction_message_at = 0;
  do
  :: transaction_tick_data_in_call_auction_message_at < 8 -> assert(transaction_tick_data_in_call_auction_message_read.transac_time[transaction_tick_data_in_call_auction_message_at] == transaction_tick_data_in_call_auction_message_written.transac_time[transaction_tick_data_in_call_auction_message_at]); transaction_tick_data_in_call_auction_message_at = transaction_tick_data_in_call_auction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Tick Data Of Negotiable Trade Message: 66 bytes ------------- */

/* Transaction tick carrying market data categories 051 indication of interest of negotiable trade and 052 quote of negotiable trade. */
typedef TransactionTickDataOfNegotiableTradeMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte bid_appl_seq_num[8];
  byte offer_appl_seq_num[8];
  byte security_id[8];
  byte security_id_source[4];
  byte last_px[8];
  byte last_qty[8];
  byte exec_type;
  byte transac_time[8]
};

int transaction_tick_data_of_negotiable_trade_message_at;

/* every byte of Transaction Tick Data Of Negotiable Trade Message set to one value */
inline fill_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_record, transaction_tick_data_of_negotiable_trade_message_value) {
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 2 -> transaction_tick_data_of_negotiable_trade_message_record.channel_no[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 3 -> transaction_tick_data_of_negotiable_trade_message_record.md_stream_id[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.bid_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.offer_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.security_id[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 4 -> transaction_tick_data_of_negotiable_trade_message_record.security_id_source[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.last_px[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.last_qty[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_record.exec_type = transaction_tick_data_of_negotiable_trade_message_value;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.transac_time[transaction_tick_data_of_negotiable_trade_message_at] = transaction_tick_data_of_negotiable_trade_message_value; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Tick Data Of Negotiable Trade Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_record, transaction_tick_data_of_negotiable_trade_message_base) {
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 2 -> transaction_tick_data_of_negotiable_trade_message_record.channel_no[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 0 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 2 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 3 -> transaction_tick_data_of_negotiable_trade_message_record.md_stream_id[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 10 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.bid_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 13 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.offer_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 21 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.security_id[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 29 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 4 -> transaction_tick_data_of_negotiable_trade_message_record.security_id_source[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 37 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.last_px[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 41 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.last_qty[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 49 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_record.exec_type = (transaction_tick_data_of_negotiable_trade_message_base + 57 + 1) % 256;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.transac_time[transaction_tick_data_of_negotiable_trade_message_at] = (transaction_tick_data_of_negotiable_trade_message_base + 58 + transaction_tick_data_of_negotiable_trade_message_at + 1) % 256; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Negotiable Trade Message to the wire, 66 bytes from where the cursor stands */
inline encode_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_record) {
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 2 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.channel_no[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 3 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.md_stream_id[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.bid_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.offer_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.security_id[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 4 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.security_id_source[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.last_px[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.last_qty[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_of_negotiable_trade_message_record.exec_type; at = at + 1;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> wire[at] = transaction_tick_data_of_negotiable_trade_message_record.transac_time[transaction_tick_data_of_negotiable_trade_message_at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Negotiable Trade Message off the wire, 66 bytes from where the cursor stands */
inline decode_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_record) {
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 2 -> transaction_tick_data_of_negotiable_trade_message_record.channel_no[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 3 -> transaction_tick_data_of_negotiable_trade_message_record.md_stream_id[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.bid_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.offer_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.security_id[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 4 -> transaction_tick_data_of_negotiable_trade_message_record.security_id_source[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.last_px[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.last_qty[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_record.exec_type = wire[at]; at = at + 1;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> transaction_tick_data_of_negotiable_trade_message_record.transac_time[transaction_tick_data_of_negotiable_trade_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Tick Data Of Negotiable Trade Message is what was written, byte for byte */
inline equal_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_read, transaction_tick_data_of_negotiable_trade_message_written) {
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 2 -> assert(transaction_tick_data_of_negotiable_trade_message_read.channel_no[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.channel_no[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> assert(transaction_tick_data_of_negotiable_trade_message_read.appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 3 -> assert(transaction_tick_data_of_negotiable_trade_message_read.md_stream_id[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.md_stream_id[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> assert(transaction_tick_data_of_negotiable_trade_message_read.bid_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.bid_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> assert(transaction_tick_data_of_negotiable_trade_message_read.offer_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.offer_appl_seq_num[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> assert(transaction_tick_data_of_negotiable_trade_message_read.security_id[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.security_id[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 4 -> assert(transaction_tick_data_of_negotiable_trade_message_read.security_id_source[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.security_id_source[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> assert(transaction_tick_data_of_negotiable_trade_message_read.last_px[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.last_px[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> assert(transaction_tick_data_of_negotiable_trade_message_read.last_qty[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.last_qty[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_of_negotiable_trade_message_read.exec_type == transaction_tick_data_of_negotiable_trade_message_written.exec_type);
  transaction_tick_data_of_negotiable_trade_message_at = 0;
  do
  :: transaction_tick_data_of_negotiable_trade_message_at < 8 -> assert(transaction_tick_data_of_negotiable_trade_message_read.transac_time[transaction_tick_data_of_negotiable_trade_message_at] == transaction_tick_data_of_negotiable_trade_message_written.transac_time[transaction_tick_data_of_negotiable_trade_message_at]); transaction_tick_data_of_negotiable_trade_message_at = transaction_tick_data_of_negotiable_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Tick Data Of Security Lending Message: 66 bytes ------------- */

/* Transaction tick carrying market data category 071, security lending. */
typedef TransactionTickDataOfSecurityLendingMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte bid_appl_seq_num[8];
  byte offer_appl_seq_num[8];
  byte security_id[8];
  byte security_id_source[4];
  byte last_px[8];
  byte last_qty[8];
  byte exec_type;
  byte transac_time[8]
};

int transaction_tick_data_of_security_lending_message_at;

/* every byte of Transaction Tick Data Of Security Lending Message set to one value */
inline fill_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_record, transaction_tick_data_of_security_lending_message_value) {
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 2 -> transaction_tick_data_of_security_lending_message_record.channel_no[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.appl_seq_num[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 3 -> transaction_tick_data_of_security_lending_message_record.md_stream_id[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.bid_appl_seq_num[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.offer_appl_seq_num[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.security_id[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 4 -> transaction_tick_data_of_security_lending_message_record.security_id_source[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.last_px[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.last_qty[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_record.exec_type = transaction_tick_data_of_security_lending_message_value;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.transac_time[transaction_tick_data_of_security_lending_message_at] = transaction_tick_data_of_security_lending_message_value; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Tick Data Of Security Lending Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_record, transaction_tick_data_of_security_lending_message_base) {
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 2 -> transaction_tick_data_of_security_lending_message_record.channel_no[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 0 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.appl_seq_num[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 2 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 3 -> transaction_tick_data_of_security_lending_message_record.md_stream_id[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 10 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.bid_appl_seq_num[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 13 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.offer_appl_seq_num[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 21 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.security_id[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 29 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 4 -> transaction_tick_data_of_security_lending_message_record.security_id_source[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 37 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.last_px[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 41 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.last_qty[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 49 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_record.exec_type = (transaction_tick_data_of_security_lending_message_base + 57 + 1) % 256;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.transac_time[transaction_tick_data_of_security_lending_message_at] = (transaction_tick_data_of_security_lending_message_base + 58 + transaction_tick_data_of_security_lending_message_at + 1) % 256; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Security Lending Message to the wire, 66 bytes from where the cursor stands */
inline encode_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_record) {
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 2 -> wire[at] = transaction_tick_data_of_security_lending_message_record.channel_no[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> wire[at] = transaction_tick_data_of_security_lending_message_record.appl_seq_num[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 3 -> wire[at] = transaction_tick_data_of_security_lending_message_record.md_stream_id[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> wire[at] = transaction_tick_data_of_security_lending_message_record.bid_appl_seq_num[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> wire[at] = transaction_tick_data_of_security_lending_message_record.offer_appl_seq_num[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> wire[at] = transaction_tick_data_of_security_lending_message_record.security_id[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 4 -> wire[at] = transaction_tick_data_of_security_lending_message_record.security_id_source[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> wire[at] = transaction_tick_data_of_security_lending_message_record.last_px[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> wire[at] = transaction_tick_data_of_security_lending_message_record.last_qty[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_of_security_lending_message_record.exec_type; at = at + 1;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> wire[at] = transaction_tick_data_of_security_lending_message_record.transac_time[transaction_tick_data_of_security_lending_message_at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Security Lending Message off the wire, 66 bytes from where the cursor stands */
inline decode_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_record) {
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 2 -> transaction_tick_data_of_security_lending_message_record.channel_no[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.appl_seq_num[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 3 -> transaction_tick_data_of_security_lending_message_record.md_stream_id[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.bid_appl_seq_num[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.offer_appl_seq_num[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.security_id[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 4 -> transaction_tick_data_of_security_lending_message_record.security_id_source[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.last_px[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.last_qty[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_record.exec_type = wire[at]; at = at + 1;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> transaction_tick_data_of_security_lending_message_record.transac_time[transaction_tick_data_of_security_lending_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Tick Data Of Security Lending Message is what was written, byte for byte */
inline equal_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_read, transaction_tick_data_of_security_lending_message_written) {
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 2 -> assert(transaction_tick_data_of_security_lending_message_read.channel_no[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.channel_no[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> assert(transaction_tick_data_of_security_lending_message_read.appl_seq_num[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.appl_seq_num[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 3 -> assert(transaction_tick_data_of_security_lending_message_read.md_stream_id[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.md_stream_id[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> assert(transaction_tick_data_of_security_lending_message_read.bid_appl_seq_num[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.bid_appl_seq_num[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> assert(transaction_tick_data_of_security_lending_message_read.offer_appl_seq_num[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.offer_appl_seq_num[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> assert(transaction_tick_data_of_security_lending_message_read.security_id[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.security_id[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 4 -> assert(transaction_tick_data_of_security_lending_message_read.security_id_source[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.security_id_source[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> assert(transaction_tick_data_of_security_lending_message_read.last_px[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.last_px[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> assert(transaction_tick_data_of_security_lending_message_read.last_qty[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.last_qty[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_of_security_lending_message_read.exec_type == transaction_tick_data_of_security_lending_message_written.exec_type);
  transaction_tick_data_of_security_lending_message_at = 0;
  do
  :: transaction_tick_data_of_security_lending_message_at < 8 -> assert(transaction_tick_data_of_security_lending_message_read.transac_time[transaction_tick_data_of_security_lending_message_at] == transaction_tick_data_of_security_lending_message_written.transac_time[transaction_tick_data_of_security_lending_message_at]); transaction_tick_data_of_security_lending_message_at = transaction_tick_data_of_security_lending_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Tick Data Of Bond General Pledged Repo Message: 66 bytes ---- */

/* Transaction tick carrying market data categories 021 bond general pledged repo matching deal and 411 spot bond trading matching deal. */
typedef TransactionTickDataOfBondGeneralPledgedRepoMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte bid_appl_seq_num[8];
  byte offer_appl_seq_num[8];
  byte security_id[8];
  byte security_id_source[4];
  byte last_px[8];
  byte last_qty[8];
  byte exec_type;
  byte transac_time[8]
};

int transaction_tick_data_of_bond_general_pledged_repo_message_at;

/* every byte of Transaction Tick Data Of Bond General Pledged Repo Message set to one value */
inline fill_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_record, transaction_tick_data_of_bond_general_pledged_repo_message_value) {
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 2 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.channel_no[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 3 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.md_stream_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.bid_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.offer_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 4 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id_source[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.last_px[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.last_qty[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_record.exec_type = transaction_tick_data_of_bond_general_pledged_repo_message_value;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.transac_time[transaction_tick_data_of_bond_general_pledged_repo_message_at] = transaction_tick_data_of_bond_general_pledged_repo_message_value; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Tick Data Of Bond General Pledged Repo Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_record, transaction_tick_data_of_bond_general_pledged_repo_message_base) {
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 2 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.channel_no[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 0 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 2 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 3 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.md_stream_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 10 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.bid_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 13 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.offer_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 21 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 29 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 4 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id_source[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 37 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.last_px[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 41 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.last_qty[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 49 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_record.exec_type = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 57 + 1) % 256;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.transac_time[transaction_tick_data_of_bond_general_pledged_repo_message_at] = (transaction_tick_data_of_bond_general_pledged_repo_message_base + 58 + transaction_tick_data_of_bond_general_pledged_repo_message_at + 1) % 256; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Bond General Pledged Repo Message to the wire, 66 bytes from where the cursor stands */
inline encode_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_record) {
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 2 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.channel_no[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 3 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.md_stream_id[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.bid_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.offer_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 4 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id_source[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.last_px[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.last_qty[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.exec_type; at = at + 1;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> wire[at] = transaction_tick_data_of_bond_general_pledged_repo_message_record.transac_time[transaction_tick_data_of_bond_general_pledged_repo_message_at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Bond General Pledged Repo Message off the wire, 66 bytes from where the cursor stands */
inline decode_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_record) {
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 2 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.channel_no[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 3 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.md_stream_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.bid_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.offer_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 4 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.security_id_source[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.last_px[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.last_qty[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_record.exec_type = wire[at]; at = at + 1;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> transaction_tick_data_of_bond_general_pledged_repo_message_record.transac_time[transaction_tick_data_of_bond_general_pledged_repo_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Tick Data Of Bond General Pledged Repo Message is what was written, byte for byte */
inline equal_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_read, transaction_tick_data_of_bond_general_pledged_repo_message_written) {
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 2 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.channel_no[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.channel_no[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 3 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.md_stream_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.md_stream_id[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.bid_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.bid_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.offer_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.offer_appl_seq_num[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.security_id[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.security_id[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 4 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.security_id_source[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.security_id_source[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.last_px[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.last_px[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.last_qty[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.last_qty[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.exec_type == transaction_tick_data_of_bond_general_pledged_repo_message_written.exec_type);
  transaction_tick_data_of_bond_general_pledged_repo_message_at = 0;
  do
  :: transaction_tick_data_of_bond_general_pledged_repo_message_at < 8 -> assert(transaction_tick_data_of_bond_general_pledged_repo_message_read.transac_time[transaction_tick_data_of_bond_general_pledged_repo_message_at] == transaction_tick_data_of_bond_general_pledged_repo_message_written.transac_time[transaction_tick_data_of_bond_general_pledged_repo_message_at]); transaction_tick_data_of_bond_general_pledged_repo_message_at = transaction_tick_data_of_bond_general_pledged_repo_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Tick Data Of Spot Bond Trading Quotation Message: 69 bytes ---- */

/* Transaction tick carrying market data categories 412 spot bond trading negotiated deal, 413 click deal, 414 inquiry deal and 417 large amount matching deal, for spot bond trading other than bid. */
typedef TransactionTickDataOfSpotBondTradingQuotationMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte bid_appl_seq_num[8];
  byte offer_appl_seq_num[8];
  byte security_id[8];
  byte security_id_source[4];
  byte last_px[8];
  byte last_qty[8];
  byte exec_type;
  byte transac_time[8];
  byte settl_period;
  byte settl_type[2]
};

int transaction_tick_data_of_spot_bond_trading_quotation_message_at;

/* every byte of Transaction Tick Data Of Spot Bond Trading Quotation Message set to one value */
inline fill_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_record, transaction_tick_data_of_spot_bond_trading_quotation_message_value) {
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_px[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_qty[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_record.exec_type = transaction_tick_data_of_spot_bond_trading_quotation_message_value;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_period = transaction_tick_data_of_spot_bond_trading_quotation_message_value;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = transaction_tick_data_of_spot_bond_trading_quotation_message_value; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Tick Data Of Spot Bond Trading Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_record, transaction_tick_data_of_spot_bond_trading_quotation_message_base) {
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 0 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 2 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 10 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 13 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 21 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 29 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 37 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_px[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 41 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_qty[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 49 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_record.exec_type = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 57 + 1) % 256;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 58 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_period = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 66 + 1) % 256;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = (transaction_tick_data_of_spot_bond_trading_quotation_message_base + 67 + transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1) % 256; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Spot Bond Trading Quotation Message to the wire, 69 bytes from where the cursor stands */
inline encode_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_record) {
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_px[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_qty[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.exec_type; at = at + 1;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_period; at = at + 1;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> wire[at] = transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[transaction_tick_data_of_spot_bond_trading_quotation_message_at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Spot Bond Trading Quotation Message off the wire, 69 bytes from where the cursor stands */
inline decode_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_record) {
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.channel_no[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.md_stream_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.security_id_source[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_px[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.last_qty[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_record.exec_type = wire[at]; at = at + 1;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.transac_time[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_period = wire[at]; at = at + 1;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> transaction_tick_data_of_spot_bond_trading_quotation_message_record.settl_type[transaction_tick_data_of_spot_bond_trading_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Tick Data Of Spot Bond Trading Quotation Message is what was written, byte for byte */
inline equal_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_read, transaction_tick_data_of_spot_bond_trading_quotation_message_written) {
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.channel_no[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.channel_no[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 3 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.md_stream_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.md_stream_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.bid_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.bid_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.offer_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.offer_appl_seq_num[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.security_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.security_id[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 4 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.security_id_source[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.security_id_source[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.last_px[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.last_px[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.last_qty[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.last_qty[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.exec_type == transaction_tick_data_of_spot_bond_trading_quotation_message_written.exec_type);
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 8 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.transac_time[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.transac_time[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.settl_period == transaction_tick_data_of_spot_bond_trading_quotation_message_written.settl_period);
  transaction_tick_data_of_spot_bond_trading_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_spot_bond_trading_quotation_message_at < 2 -> assert(transaction_tick_data_of_spot_bond_trading_quotation_message_read.settl_type[transaction_tick_data_of_spot_bond_trading_quotation_message_at] == transaction_tick_data_of_spot_bond_trading_quotation_message_written.settl_type[transaction_tick_data_of_spot_bond_trading_quotation_message_at]); transaction_tick_data_of_spot_bond_trading_quotation_message_at = transaction_tick_data_of_spot_bond_trading_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transaction Tick Data Of Bid Quotation Message: 95 bytes ---------------- */

/* Transaction tick carrying market data category 416, spot bond trading bidding deal. */
typedef TransactionTickDataOfBidQuotationMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte bid_appl_seq_num[8];
  byte offer_appl_seq_num[8];
  byte security_id[8];
  byte security_id_source[4];
  byte last_px[8];
  byte last_qty[8];
  byte exec_type;
  byte transac_time[8];
  byte settl_period;
  byte settl_type[2];
  byte secondary_order_id[16];
  byte bid_exec_inst_type[2];
  byte margin_price[8]
};

int transaction_tick_data_of_bid_quotation_message_at;

/* every byte of Transaction Tick Data Of Bid Quotation Message set to one value */
inline fill_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_record, transaction_tick_data_of_bid_quotation_message_value) {
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.channel_no[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 3 -> transaction_tick_data_of_bid_quotation_message_record.md_stream_id[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.security_id[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 4 -> transaction_tick_data_of_bid_quotation_message_record.security_id_source[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.last_px[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.last_qty[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_record.exec_type = transaction_tick_data_of_bid_quotation_message_value;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.transac_time[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_record.settl_period = transaction_tick_data_of_bid_quotation_message_value;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.settl_type[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 16 -> transaction_tick_data_of_bid_quotation_message_record.secondary_order_id[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.margin_price[transaction_tick_data_of_bid_quotation_message_at] = transaction_tick_data_of_bid_quotation_message_value; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transaction Tick Data Of Bid Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_record, transaction_tick_data_of_bid_quotation_message_base) {
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.channel_no[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 0 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 2 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 3 -> transaction_tick_data_of_bid_quotation_message_record.md_stream_id[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 10 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 13 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 21 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.security_id[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 29 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 4 -> transaction_tick_data_of_bid_quotation_message_record.security_id_source[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 37 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.last_px[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 41 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.last_qty[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 49 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_record.exec_type = (transaction_tick_data_of_bid_quotation_message_base + 57 + 1) % 256;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.transac_time[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 58 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_record.settl_period = (transaction_tick_data_of_bid_quotation_message_base + 66 + 1) % 256;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.settl_type[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 67 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 16 -> transaction_tick_data_of_bid_quotation_message_record.secondary_order_id[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 69 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 85 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.margin_price[transaction_tick_data_of_bid_quotation_message_at] = (transaction_tick_data_of_bid_quotation_message_base + 87 + transaction_tick_data_of_bid_quotation_message_at + 1) % 256; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Bid Quotation Message to the wire, 95 bytes from where the cursor stands */
inline encode_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_record) {
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.channel_no[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.appl_seq_num[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 3 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.md_stream_id[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.security_id[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 4 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.security_id_source[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.last_px[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.last_qty[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_of_bid_quotation_message_record.exec_type; at = at + 1;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.transac_time[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = transaction_tick_data_of_bid_quotation_message_record.settl_period; at = at + 1;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.settl_type[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 16 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.secondary_order_id[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> wire[at] = transaction_tick_data_of_bid_quotation_message_record.margin_price[transaction_tick_data_of_bid_quotation_message_at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Transaction Tick Data Of Bid Quotation Message off the wire, 95 bytes from where the cursor stands */
inline decode_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_record) {
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.channel_no[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 3 -> transaction_tick_data_of_bid_quotation_message_record.md_stream_id[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.bid_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.offer_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.security_id[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 4 -> transaction_tick_data_of_bid_quotation_message_record.security_id_source[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.last_px[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.last_qty[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_record.exec_type = wire[at]; at = at + 1;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.transac_time[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_record.settl_period = wire[at]; at = at + 1;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.settl_type[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 16 -> transaction_tick_data_of_bid_quotation_message_record.secondary_order_id[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> transaction_tick_data_of_bid_quotation_message_record.bid_exec_inst_type[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> transaction_tick_data_of_bid_quotation_message_record.margin_price[transaction_tick_data_of_bid_quotation_message_at] = wire[at]; at = at + 1; transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transaction Tick Data Of Bid Quotation Message is what was written, byte for byte */
inline equal_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_read, transaction_tick_data_of_bid_quotation_message_written) {
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> assert(transaction_tick_data_of_bid_quotation_message_read.channel_no[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.channel_no[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.appl_seq_num[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 3 -> assert(transaction_tick_data_of_bid_quotation_message_read.md_stream_id[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.md_stream_id[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.bid_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.bid_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.offer_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.offer_appl_seq_num[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.security_id[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.security_id[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 4 -> assert(transaction_tick_data_of_bid_quotation_message_read.security_id_source[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.security_id_source[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.last_px[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.last_px[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.last_qty[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.last_qty[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_of_bid_quotation_message_read.exec_type == transaction_tick_data_of_bid_quotation_message_written.exec_type);
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.transac_time[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.transac_time[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  assert(transaction_tick_data_of_bid_quotation_message_read.settl_period == transaction_tick_data_of_bid_quotation_message_written.settl_period);
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> assert(transaction_tick_data_of_bid_quotation_message_read.settl_type[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.settl_type[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 16 -> assert(transaction_tick_data_of_bid_quotation_message_read.secondary_order_id[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.secondary_order_id[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 2 -> assert(transaction_tick_data_of_bid_quotation_message_read.bid_exec_inst_type[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.bid_exec_inst_type[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  transaction_tick_data_of_bid_quotation_message_at = 0;
  do
  :: transaction_tick_data_of_bid_quotation_message_at < 8 -> assert(transaction_tick_data_of_bid_quotation_message_read.margin_price[transaction_tick_data_of_bid_quotation_message_at] == transaction_tick_data_of_bid_quotation_message_written.margin_price[transaction_tick_data_of_bid_quotation_message_at]); transaction_tick_data_of_bid_quotation_message_at = transaction_tick_data_of_bid_quotation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Packet Trailer: 4 bytes ------------------------------------------------- */

/* Szse Mddp Packet Trailer, transmitted without encryption */
typedef PacketTrailer {
  byte checksum[4]
};

int packet_trailer_at;

/* every byte of Packet Trailer set to one value */
inline fill_packet_trailer(packet_trailer_record, packet_trailer_value) {
  packet_trailer_at = 0;
  do
  :: packet_trailer_at < 4 -> packet_trailer_record.checksum[packet_trailer_at] = packet_trailer_value; packet_trailer_at = packet_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Trailer set to where it lies, so a field read out of place says so */
inline ramp_packet_trailer(packet_trailer_record, packet_trailer_base) {
  packet_trailer_at = 0;
  do
  :: packet_trailer_at < 4 -> packet_trailer_record.checksum[packet_trailer_at] = (packet_trailer_base + 0 + packet_trailer_at + 1) % 256; packet_trailer_at = packet_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Trailer to the wire, 4 bytes from where the cursor stands */
inline encode_packet_trailer(packet_trailer_record) {
  packet_trailer_at = 0;
  do
  :: packet_trailer_at < 4 -> wire[at] = packet_trailer_record.checksum[packet_trailer_at]; at = at + 1; packet_trailer_at = packet_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Trailer off the wire, 4 bytes from where the cursor stands */
inline decode_packet_trailer(packet_trailer_record) {
  packet_trailer_at = 0;
  do
  :: packet_trailer_at < 4 -> packet_trailer_record.checksum[packet_trailer_at] = wire[at]; at = at + 1; packet_trailer_at = packet_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Trailer is what was written, byte for byte */
inline equal_packet_trailer(packet_trailer_read, packet_trailer_written) {
  packet_trailer_at = 0;
  do
  :: packet_trailer_at < 4 -> assert(packet_trailer_read.checksum[packet_trailer_at] == packet_trailer_written.checksum[packet_trailer_at]); packet_trailer_at = packet_trailer_at + 1
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Channel Heartbeat Message: encoded, read back, and compared */
proctype check_channel_heartbeat_message() {
  ChannelHeartbeatMessage channel_heartbeat_message_sent;
  ChannelHeartbeatMessage channel_heartbeat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_channel_heartbeat_message(channel_heartbeat_message_sent, 0)
  :: pattern == 1 -> fill_channel_heartbeat_message(channel_heartbeat_message_sent, 32)
  :: pattern == 2 -> fill_channel_heartbeat_message(channel_heartbeat_message_sent, 255)
  :: else -> ramp_channel_heartbeat_message(channel_heartbeat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_channel_heartbeat_message(channel_heartbeat_message_sent);
    assert(at == 12);
    at = 0;
    decode_channel_heartbeat_message(channel_heartbeat_message_got);
    assert(at == 12);
    equal_channel_heartbeat_message(channel_heartbeat_message_got, channel_heartbeat_message_sent)
  }
}

/* Retransmitting Message: encoded, read back, and compared */
proctype check_retransmitting_message() {
  RetransmittingMessage retransmitting_message_sent;
  RetransmittingMessage retransmitting_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmitting_message(retransmitting_message_sent, 0)
  :: pattern == 1 -> fill_retransmitting_message(retransmitting_message_sent, 32)
  :: pattern == 2 -> fill_retransmitting_message(retransmitting_message_sent, 255)
  :: else -> ramp_retransmitting_message(retransmitting_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmitting_message(retransmitting_message_sent);
    assert(at == 44);
    at = 0;
    decode_retransmitting_message(retransmitting_message_got);
    assert(at == 44);
    equal_retransmitting_message(retransmitting_message_got, retransmitting_message_sent)
  }
}

/* Client User Information Reporting Message: encoded, read back, and compared */
proctype check_client_user_information_reporting_message() {
  ClientUserInformationReportingMessage client_user_information_reporting_message_sent;
  ClientUserInformationReportingMessage client_user_information_reporting_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_client_user_information_reporting_message(client_user_information_reporting_message_sent, 0)
  :: pattern == 1 -> fill_client_user_information_reporting_message(client_user_information_reporting_message_sent, 32)
  :: pattern == 2 -> fill_client_user_information_reporting_message(client_user_information_reporting_message_sent, 255)
  :: else -> ramp_client_user_information_reporting_message(client_user_information_reporting_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_client_user_information_reporting_message(client_user_information_reporting_message_sent);
    assert(at == 26);
    at = 0;
    decode_client_user_information_reporting_message(client_user_information_reporting_message_got);
    assert(at == 26);
    equal_client_user_information_reporting_message(client_user_information_reporting_message_got, client_user_information_reporting_message_sent)
  }
}

/* Business Reject Message: encoded, read back, and compared */
proctype check_business_reject_message() {
  BusinessRejectMessage business_reject_message_sent;
  BusinessRejectMessage business_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_business_reject_message(business_reject_message_sent, 0)
  :: pattern == 1 -> fill_business_reject_message(business_reject_message_sent, 32)
  :: pattern == 2 -> fill_business_reject_message(business_reject_message_sent, 255)
  :: else -> ramp_business_reject_message(business_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_business_reject_message(business_reject_message_sent);
    assert(at == 74);
    at = 0;
    decode_business_reject_message(business_reject_message_got);
    assert(at == 74);
    equal_business_reject_message(business_reject_message_got, business_reject_message_sent)
  }
}

/* Real Time Market Status Message: encoded, read back, and compared */
proctype check_real_time_market_status_message() {
  RealTimeMarketStatusMessage real_time_market_status_message_sent;
  RealTimeMarketStatusMessage real_time_market_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_real_time_market_status_message(real_time_market_status_message_sent, 0)
  :: pattern == 1 -> fill_real_time_market_status_message(real_time_market_status_message_sent, 32)
  :: pattern == 2 -> fill_real_time_market_status_message(real_time_market_status_message_sent, 255)
  :: else -> ramp_real_time_market_status_message(real_time_market_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_real_time_market_status_message(real_time_market_status_message_sent);
    assert(at == 69);
    at = 0;
    decode_real_time_market_status_message(real_time_market_status_message_got);
    assert(at == 69);
    equal_real_time_market_status_message(real_time_market_status_message_got, real_time_market_status_message_sent)
  }
}

/* Statistic Indicator Snapshot Message: encoded, read back, and compared */
proctype check_statistic_indicator_snapshot_message() {
  StatisticIndicatorSnapshotMessage statistic_indicator_snapshot_message_sent;
  StatisticIndicatorSnapshotMessage statistic_indicator_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_sent, 255)
  :: else -> ramp_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_sent);
    assert(at == 69);
    at = 0;
    decode_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_got);
    assert(at == 69);
    equal_statistic_indicator_snapshot_message(statistic_indicator_snapshot_message_got, statistic_indicator_snapshot_message_sent)
  }
}

/* Order Tick Data In Call Auction Message: encoded, read back, and compared */
proctype check_order_tick_data_in_call_auction_message() {
  OrderTickDataInCallAuctionMessage order_tick_data_in_call_auction_message_sent;
  OrderTickDataInCallAuctionMessage order_tick_data_in_call_auction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_sent, 0)
  :: pattern == 1 -> fill_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_sent, 32)
  :: pattern == 2 -> fill_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_sent, 255)
  :: else -> ramp_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_sent);
    assert(at == 51);
    at = 0;
    decode_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_got);
    assert(at == 51);
    equal_order_tick_data_in_call_auction_message(order_tick_data_in_call_auction_message_got, order_tick_data_in_call_auction_message_sent)
  }
}

/* Order Tick Data Of Negotiable Trade Message: encoded, read back, and compared */
proctype check_order_tick_data_of_negotiable_trade_message() {
  OrderTickDataOfNegotiableTradeMessage order_tick_data_of_negotiable_trade_message_sent;
  OrderTickDataOfNegotiableTradeMessage order_tick_data_of_negotiable_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_sent, 0)
  :: pattern == 1 -> fill_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_sent, 32)
  :: pattern == 2 -> fill_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_sent, 255)
  :: else -> ramp_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_sent);
    assert(at == 100);
    at = 0;
    decode_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_got);
    assert(at == 100);
    equal_order_tick_data_of_negotiable_trade_message(order_tick_data_of_negotiable_trade_message_got, order_tick_data_of_negotiable_trade_message_sent)
  }
}

/* Order Tick Data Of Security Lending Message: encoded, read back, and compared */
proctype check_order_tick_data_of_security_lending_message() {
  OrderTickDataOfSecurityLendingMessage order_tick_data_of_security_lending_message_sent;
  OrderTickDataOfSecurityLendingMessage order_tick_data_of_security_lending_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_sent, 0)
  :: pattern == 1 -> fill_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_sent, 32)
  :: pattern == 2 -> fill_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_sent, 255)
  :: else -> ramp_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_sent);
    assert(at == 53);
    at = 0;
    decode_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_got);
    assert(at == 53);
    equal_order_tick_data_of_security_lending_message(order_tick_data_of_security_lending_message_got, order_tick_data_of_security_lending_message_sent)
  }
}

/* Order Tick Data Of Spot Bond Trading Matching Deal Message: encoded, read back, and compared */
proctype check_order_tick_data_of_spot_bond_trading_matching_deal_message() {
  OrderTickDataOfSpotBondTradingMatchingDealMessage order_tick_data_of_spot_bond_trading_matching_deal_message_sent;
  OrderTickDataOfSpotBondTradingMatchingDealMessage order_tick_data_of_spot_bond_trading_matching_deal_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_sent, 0)
  :: pattern == 1 -> fill_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_sent, 32)
  :: pattern == 2 -> fill_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_sent, 255)
  :: else -> ramp_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_sent);
    assert(at == 51);
    at = 0;
    decode_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_got);
    assert(at == 51);
    equal_order_tick_data_of_spot_bond_trading_matching_deal_message(order_tick_data_of_spot_bond_trading_matching_deal_message_got, order_tick_data_of_spot_bond_trading_matching_deal_message_sent)
  }
}

/* Order Tick Data Of Spot Bond Trading Quotation Message: encoded, read back, and compared */
proctype check_order_tick_data_of_spot_bond_trading_quotation_message() {
  OrderTickDataOfSpotBondTradingQuotationMessage order_tick_data_of_spot_bond_trading_quotation_message_sent;
  OrderTickDataOfSpotBondTradingQuotationMessage order_tick_data_of_spot_bond_trading_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_sent, 0)
  :: pattern == 1 -> fill_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_sent, 32)
  :: pattern == 2 -> fill_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_sent, 255)
  :: else -> ramp_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_sent);
    assert(at == 377);
    at = 0;
    decode_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_got);
    assert(at == 377);
    equal_order_tick_data_of_spot_bond_trading_quotation_message(order_tick_data_of_spot_bond_trading_quotation_message_got, order_tick_data_of_spot_bond_trading_quotation_message_sent)
  }
}

/* Order Tick Data Of Bid Quotation Message: encoded, read back, and compared */
proctype check_order_tick_data_of_bid_quotation_message() {
  OrderTickDataOfBidQuotationMessage order_tick_data_of_bid_quotation_message_sent;
  OrderTickDataOfBidQuotationMessage order_tick_data_of_bid_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_sent, 0)
  :: pattern == 1 -> fill_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_sent, 32)
  :: pattern == 2 -> fill_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_sent, 255)
  :: else -> ramp_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_sent);
    assert(at == 407);
    at = 0;
    decode_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_got);
    assert(at == 407);
    equal_order_tick_data_of_bid_quotation_message(order_tick_data_of_bid_quotation_message_got, order_tick_data_of_bid_quotation_message_sent)
  }
}

/* Transaction Tick Data In Call Auction Message: encoded, read back, and compared */
proctype check_transaction_tick_data_in_call_auction_message() {
  TransactionTickDataInCallAuctionMessage transaction_tick_data_in_call_auction_message_sent;
  TransactionTickDataInCallAuctionMessage transaction_tick_data_in_call_auction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_sent, 0)
  :: pattern == 1 -> fill_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_sent, 32)
  :: pattern == 2 -> fill_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_sent, 255)
  :: else -> ramp_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_sent);
    assert(at == 66);
    at = 0;
    decode_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_got);
    assert(at == 66);
    equal_transaction_tick_data_in_call_auction_message(transaction_tick_data_in_call_auction_message_got, transaction_tick_data_in_call_auction_message_sent)
  }
}

/* Transaction Tick Data Of Negotiable Trade Message: encoded, read back, and compared */
proctype check_transaction_tick_data_of_negotiable_trade_message() {
  TransactionTickDataOfNegotiableTradeMessage transaction_tick_data_of_negotiable_trade_message_sent;
  TransactionTickDataOfNegotiableTradeMessage transaction_tick_data_of_negotiable_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_sent, 0)
  :: pattern == 1 -> fill_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_sent, 32)
  :: pattern == 2 -> fill_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_sent, 255)
  :: else -> ramp_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_sent);
    assert(at == 66);
    at = 0;
    decode_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_got);
    assert(at == 66);
    equal_transaction_tick_data_of_negotiable_trade_message(transaction_tick_data_of_negotiable_trade_message_got, transaction_tick_data_of_negotiable_trade_message_sent)
  }
}

/* Transaction Tick Data Of Security Lending Message: encoded, read back, and compared */
proctype check_transaction_tick_data_of_security_lending_message() {
  TransactionTickDataOfSecurityLendingMessage transaction_tick_data_of_security_lending_message_sent;
  TransactionTickDataOfSecurityLendingMessage transaction_tick_data_of_security_lending_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_sent, 0)
  :: pattern == 1 -> fill_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_sent, 32)
  :: pattern == 2 -> fill_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_sent, 255)
  :: else -> ramp_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_sent);
    assert(at == 66);
    at = 0;
    decode_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_got);
    assert(at == 66);
    equal_transaction_tick_data_of_security_lending_message(transaction_tick_data_of_security_lending_message_got, transaction_tick_data_of_security_lending_message_sent)
  }
}

/* Transaction Tick Data Of Bond General Pledged Repo Message: encoded, read back, and compared */
proctype check_transaction_tick_data_of_bond_general_pledged_repo_message() {
  TransactionTickDataOfBondGeneralPledgedRepoMessage transaction_tick_data_of_bond_general_pledged_repo_message_sent;
  TransactionTickDataOfBondGeneralPledgedRepoMessage transaction_tick_data_of_bond_general_pledged_repo_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_sent, 0)
  :: pattern == 1 -> fill_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_sent, 32)
  :: pattern == 2 -> fill_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_sent, 255)
  :: else -> ramp_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_sent);
    assert(at == 66);
    at = 0;
    decode_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_got);
    assert(at == 66);
    equal_transaction_tick_data_of_bond_general_pledged_repo_message(transaction_tick_data_of_bond_general_pledged_repo_message_got, transaction_tick_data_of_bond_general_pledged_repo_message_sent)
  }
}

/* Transaction Tick Data Of Spot Bond Trading Quotation Message: encoded, read back, and compared */
proctype check_transaction_tick_data_of_spot_bond_trading_quotation_message() {
  TransactionTickDataOfSpotBondTradingQuotationMessage transaction_tick_data_of_spot_bond_trading_quotation_message_sent;
  TransactionTickDataOfSpotBondTradingQuotationMessage transaction_tick_data_of_spot_bond_trading_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_sent, 0)
  :: pattern == 1 -> fill_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_sent, 32)
  :: pattern == 2 -> fill_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_sent, 255)
  :: else -> ramp_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_sent);
    assert(at == 69);
    at = 0;
    decode_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_got);
    assert(at == 69);
    equal_transaction_tick_data_of_spot_bond_trading_quotation_message(transaction_tick_data_of_spot_bond_trading_quotation_message_got, transaction_tick_data_of_spot_bond_trading_quotation_message_sent)
  }
}

/* Transaction Tick Data Of Bid Quotation Message: encoded, read back, and compared */
proctype check_transaction_tick_data_of_bid_quotation_message() {
  TransactionTickDataOfBidQuotationMessage transaction_tick_data_of_bid_quotation_message_sent;
  TransactionTickDataOfBidQuotationMessage transaction_tick_data_of_bid_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_sent, 0)
  :: pattern == 1 -> fill_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_sent, 32)
  :: pattern == 2 -> fill_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_sent, 255)
  :: else -> ramp_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_sent);
    assert(at == 95);
    at = 0;
    decode_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_got);
    assert(at == 95);
    equal_transaction_tick_data_of_bid_quotation_message(transaction_tick_data_of_bid_quotation_message_got, transaction_tick_data_of_bid_quotation_message_sent)
  }
}

/* Packet Trailer: encoded, read back, and compared */
proctype check_packet_trailer() {
  PacketTrailer packet_trailer_sent;
  PacketTrailer packet_trailer_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet_trailer(packet_trailer_sent, 0)
  :: pattern == 1 -> fill_packet_trailer(packet_trailer_sent, 32)
  :: pattern == 2 -> fill_packet_trailer(packet_trailer_sent, 255)
  :: else -> ramp_packet_trailer(packet_trailer_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet_trailer(packet_trailer_sent);
    assert(at == 4);
    at = 0;
    decode_packet_trailer(packet_trailer_got);
    assert(at == 4);
    equal_packet_trailer(packet_trailer_got, packet_trailer_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_channel_heartbeat_message()
  :: run check_retransmitting_message()
  :: run check_client_user_information_reporting_message()
  :: run check_business_reject_message()
  :: run check_real_time_market_status_message()
  :: run check_statistic_indicator_snapshot_message()
  :: run check_order_tick_data_in_call_auction_message()
  :: run check_order_tick_data_of_negotiable_trade_message()
  :: run check_order_tick_data_of_security_lending_message()
  :: run check_order_tick_data_of_spot_bond_trading_matching_deal_message()
  :: run check_order_tick_data_of_spot_bond_trading_quotation_message()
  :: run check_order_tick_data_of_bid_quotation_message()
  :: run check_transaction_tick_data_in_call_auction_message()
  :: run check_transaction_tick_data_of_negotiable_trade_message()
  :: run check_transaction_tick_data_of_security_lending_message()
  :: run check_transaction_tick_data_of_bond_general_pledged_repo_message()
  :: run check_transaction_tick_data_of_spot_bond_trading_quotation_message()
  :: run check_transaction_tick_data_of_bid_quotation_message()
  :: run check_packet_trailer()
  fi
}
