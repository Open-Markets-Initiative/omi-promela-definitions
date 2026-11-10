/*
 * Beijing Stock Exchange Bjse Multicast Market Data
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
#define WIRE 76

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Bjse Binary message header, defining the type and body length of a message */
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

/* ---- Channel Heartbeat Message: 20 bytes ------------------------------------- */

/* Sent on a market data channel every 3 seconds, carrying the sequence number of the last tick message on the channel. */
typedef ChannelHeartbeatMessage {
  byte channel_no[2];
  byte appl_last_seq_num[8];
  byte end_of_channel[2];
  byte orig_time[8]
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
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> channel_heartbeat_message_record.orig_time[channel_heartbeat_message_at] = channel_heartbeat_message_value; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
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
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> channel_heartbeat_message_record.orig_time[channel_heartbeat_message_at] = (channel_heartbeat_message_base + 12 + channel_heartbeat_message_at + 1) % 256; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Channel Heartbeat Message to the wire, 20 bytes from where the cursor stands */
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
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> wire[at] = channel_heartbeat_message_record.orig_time[channel_heartbeat_message_at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Channel Heartbeat Message off the wire, 20 bytes from where the cursor stands */
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
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> channel_heartbeat_message_record.orig_time[channel_heartbeat_message_at] = wire[at]; at = at + 1; channel_heartbeat_message_at = channel_heartbeat_message_at + 1
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
  channel_heartbeat_message_at = 0;
  do
  :: channel_heartbeat_message_at < 8 -> assert(channel_heartbeat_message_read.orig_time[channel_heartbeat_message_at] == channel_heartbeat_message_written.orig_time[channel_heartbeat_message_at]); channel_heartbeat_message_at = channel_heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Message: 52 bytes ---------------------------------------- */

/* Sent by the Vendor Supplied System to request tick data or announcements again; the gateway returns the data and then the same message type to mark the retransmission complete or report why it failed, so both sides transmit this message type. */
typedef RetransmissionMessage {
  byte resend_type;
  byte channel_no[2];
  byte appl_beg_seq_num[8];
  byte appl_end_seq_num[8];
  byte news_id[16];
  byte resend_status;
  byte reject_text[16]
};

int retransmission_message_at;

/* every byte of Retransmission Message set to one value */
inline fill_retransmission_message(retransmission_message_record, retransmission_message_value) {
  retransmission_message_record.resend_type = retransmission_message_value;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> retransmission_message_record.channel_no[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.appl_beg_seq_num[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.appl_end_seq_num[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> retransmission_message_record.news_id[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_record.resend_status = retransmission_message_value;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> retransmission_message_record.reject_text[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_message(retransmission_message_record, retransmission_message_base) {
  retransmission_message_record.resend_type = (retransmission_message_base + 0 + 1) % 256;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> retransmission_message_record.channel_no[retransmission_message_at] = (retransmission_message_base + 1 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.appl_beg_seq_num[retransmission_message_at] = (retransmission_message_base + 3 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.appl_end_seq_num[retransmission_message_at] = (retransmission_message_base + 11 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> retransmission_message_record.news_id[retransmission_message_at] = (retransmission_message_base + 19 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_record.resend_status = (retransmission_message_base + 35 + 1) % 256;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> retransmission_message_record.reject_text[retransmission_message_at] = (retransmission_message_base + 36 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message to the wire, 52 bytes from where the cursor stands */
inline encode_retransmission_message(retransmission_message_record) {
  wire[at] = retransmission_message_record.resend_type; at = at + 1;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> wire[at] = retransmission_message_record.channel_no[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> wire[at] = retransmission_message_record.appl_beg_seq_num[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> wire[at] = retransmission_message_record.appl_end_seq_num[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> wire[at] = retransmission_message_record.news_id[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_message_record.resend_status; at = at + 1;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> wire[at] = retransmission_message_record.reject_text[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message off the wire, 52 bytes from where the cursor stands */
inline decode_retransmission_message(retransmission_message_record) {
  retransmission_message_record.resend_type = wire[at]; at = at + 1;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> retransmission_message_record.channel_no[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.appl_beg_seq_num[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> retransmission_message_record.appl_end_seq_num[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> retransmission_message_record.news_id[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_record.resend_status = wire[at]; at = at + 1;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> retransmission_message_record.reject_text[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Message is what was written, byte for byte */
inline equal_retransmission_message(retransmission_message_read, retransmission_message_written) {
  assert(retransmission_message_read.resend_type == retransmission_message_written.resend_type);
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> assert(retransmission_message_read.channel_no[retransmission_message_at] == retransmission_message_written.channel_no[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> assert(retransmission_message_read.appl_beg_seq_num[retransmission_message_at] == retransmission_message_written.appl_beg_seq_num[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 8 -> assert(retransmission_message_read.appl_end_seq_num[retransmission_message_at] == retransmission_message_written.appl_end_seq_num[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> assert(retransmission_message_read.news_id[retransmission_message_at] == retransmission_message_written.news_id[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  assert(retransmission_message_read.resend_status == retransmission_message_written.resend_status);
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 16 -> assert(retransmission_message_read.reject_text[retransmission_message_at] == retransmission_message_written.reject_text[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Business Reject Message: 74 bytes --------------------------------------- */

/* Rejects an application message that satisfies the session layer rules but not the business layer rules, mainly an invalid retransmission request. */
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

/* ---- Bond Spot Matching Large Order Tick Message: 53 bytes ------------------- */

/* Order tick of large lot matching in spot bond trading, market data category 011, published in real time. */
typedef BondSpotMatchingLargeOrderTickMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transact_time[8];
  byte ord_type;
  byte settl_type;
  byte settl_period
};

int bond_spot_matching_large_order_tick_message_at;

/* every byte of Bond Spot Matching Large Order Tick Message set to one value */
inline fill_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_record, bond_spot_matching_large_order_tick_message_value) {
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 2 -> bond_spot_matching_large_order_tick_message_record.channel_no[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.appl_seq_num[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 3 -> bond_spot_matching_large_order_tick_message_record.md_stream_id[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.security_id[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 4 -> bond_spot_matching_large_order_tick_message_record.security_id_source[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.price[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.order_qty[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_record.side = bond_spot_matching_large_order_tick_message_value;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.transact_time[bond_spot_matching_large_order_tick_message_at] = bond_spot_matching_large_order_tick_message_value; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_record.ord_type = bond_spot_matching_large_order_tick_message_value;
  bond_spot_matching_large_order_tick_message_record.settl_type = bond_spot_matching_large_order_tick_message_value;
  bond_spot_matching_large_order_tick_message_record.settl_period = bond_spot_matching_large_order_tick_message_value;
  skip
}

/* each byte of Bond Spot Matching Large Order Tick Message set to where it lies, so a field read out of place says so */
inline ramp_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_record, bond_spot_matching_large_order_tick_message_base) {
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 2 -> bond_spot_matching_large_order_tick_message_record.channel_no[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 0 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.appl_seq_num[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 2 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 3 -> bond_spot_matching_large_order_tick_message_record.md_stream_id[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 10 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.security_id[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 13 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 4 -> bond_spot_matching_large_order_tick_message_record.security_id_source[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 21 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.price[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 25 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.order_qty[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 33 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_record.side = (bond_spot_matching_large_order_tick_message_base + 41 + 1) % 256;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.transact_time[bond_spot_matching_large_order_tick_message_at] = (bond_spot_matching_large_order_tick_message_base + 42 + bond_spot_matching_large_order_tick_message_at + 1) % 256; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_record.ord_type = (bond_spot_matching_large_order_tick_message_base + 50 + 1) % 256;
  bond_spot_matching_large_order_tick_message_record.settl_type = (bond_spot_matching_large_order_tick_message_base + 51 + 1) % 256;
  bond_spot_matching_large_order_tick_message_record.settl_period = (bond_spot_matching_large_order_tick_message_base + 52 + 1) % 256;
  skip
}

/* Bond Spot Matching Large Order Tick Message to the wire, 53 bytes from where the cursor stands */
inline encode_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_record) {
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 2 -> wire[at] = bond_spot_matching_large_order_tick_message_record.channel_no[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_order_tick_message_record.appl_seq_num[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 3 -> wire[at] = bond_spot_matching_large_order_tick_message_record.md_stream_id[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_order_tick_message_record.security_id[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 4 -> wire[at] = bond_spot_matching_large_order_tick_message_record.security_id_source[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_order_tick_message_record.price[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_order_tick_message_record.order_qty[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_spot_matching_large_order_tick_message_record.side; at = at + 1;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_order_tick_message_record.transact_time[bond_spot_matching_large_order_tick_message_at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_spot_matching_large_order_tick_message_record.ord_type; at = at + 1;
  wire[at] = bond_spot_matching_large_order_tick_message_record.settl_type; at = at + 1;
  wire[at] = bond_spot_matching_large_order_tick_message_record.settl_period; at = at + 1;
  skip
}

/* Bond Spot Matching Large Order Tick Message off the wire, 53 bytes from where the cursor stands */
inline decode_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_record) {
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 2 -> bond_spot_matching_large_order_tick_message_record.channel_no[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.appl_seq_num[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 3 -> bond_spot_matching_large_order_tick_message_record.md_stream_id[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.security_id[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 4 -> bond_spot_matching_large_order_tick_message_record.security_id_source[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.price[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.order_qty[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_record.side = wire[at]; at = at + 1;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> bond_spot_matching_large_order_tick_message_record.transact_time[bond_spot_matching_large_order_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_record.ord_type = wire[at]; at = at + 1;
  bond_spot_matching_large_order_tick_message_record.settl_type = wire[at]; at = at + 1;
  bond_spot_matching_large_order_tick_message_record.settl_period = wire[at]; at = at + 1;
  skip
}

/* what was read of Bond Spot Matching Large Order Tick Message is what was written, byte for byte */
inline equal_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_read, bond_spot_matching_large_order_tick_message_written) {
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 2 -> assert(bond_spot_matching_large_order_tick_message_read.channel_no[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.channel_no[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> assert(bond_spot_matching_large_order_tick_message_read.appl_seq_num[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.appl_seq_num[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 3 -> assert(bond_spot_matching_large_order_tick_message_read.md_stream_id[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.md_stream_id[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> assert(bond_spot_matching_large_order_tick_message_read.security_id[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.security_id[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 4 -> assert(bond_spot_matching_large_order_tick_message_read.security_id_source[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.security_id_source[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> assert(bond_spot_matching_large_order_tick_message_read.price[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.price[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> assert(bond_spot_matching_large_order_tick_message_read.order_qty[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.order_qty[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  assert(bond_spot_matching_large_order_tick_message_read.side == bond_spot_matching_large_order_tick_message_written.side);
  bond_spot_matching_large_order_tick_message_at = 0;
  do
  :: bond_spot_matching_large_order_tick_message_at < 8 -> assert(bond_spot_matching_large_order_tick_message_read.transact_time[bond_spot_matching_large_order_tick_message_at] == bond_spot_matching_large_order_tick_message_written.transact_time[bond_spot_matching_large_order_tick_message_at]); bond_spot_matching_large_order_tick_message_at = bond_spot_matching_large_order_tick_message_at + 1
  :: else -> break
  od;
  assert(bond_spot_matching_large_order_tick_message_read.ord_type == bond_spot_matching_large_order_tick_message_written.ord_type);
  assert(bond_spot_matching_large_order_tick_message_read.settl_type == bond_spot_matching_large_order_tick_message_written.settl_type);
  assert(bond_spot_matching_large_order_tick_message_read.settl_period == bond_spot_matching_large_order_tick_message_written.settl_period);
  skip
}

/* ---- Agreement Trading Order Tick Message: 54 bytes -------------------------- */

/* Order tick of agreement trading on the trading support platform, market data category 021, published in real time; not yet enabled. */
typedef AgreementTradingOrderTickMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transact_time[8];
  byte confirm_id[4]
};

int agreement_trading_order_tick_message_at;

/* every byte of Agreement Trading Order Tick Message set to one value */
inline fill_agreement_trading_order_tick_message(agreement_trading_order_tick_message_record, agreement_trading_order_tick_message_value) {
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 2 -> agreement_trading_order_tick_message_record.channel_no[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.appl_seq_num[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 3 -> agreement_trading_order_tick_message_record.md_stream_id[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.security_id[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> agreement_trading_order_tick_message_record.security_id_source[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.price[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.order_qty[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_record.side = agreement_trading_order_tick_message_value;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.transact_time[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> agreement_trading_order_tick_message_record.confirm_id[agreement_trading_order_tick_message_at] = agreement_trading_order_tick_message_value; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Agreement Trading Order Tick Message set to where it lies, so a field read out of place says so */
inline ramp_agreement_trading_order_tick_message(agreement_trading_order_tick_message_record, agreement_trading_order_tick_message_base) {
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 2 -> agreement_trading_order_tick_message_record.channel_no[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 0 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.appl_seq_num[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 2 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 3 -> agreement_trading_order_tick_message_record.md_stream_id[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 10 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.security_id[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 13 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> agreement_trading_order_tick_message_record.security_id_source[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 21 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.price[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 25 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.order_qty[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 33 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_record.side = (agreement_trading_order_tick_message_base + 41 + 1) % 256;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.transact_time[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 42 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> agreement_trading_order_tick_message_record.confirm_id[agreement_trading_order_tick_message_at] = (agreement_trading_order_tick_message_base + 50 + agreement_trading_order_tick_message_at + 1) % 256; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* Agreement Trading Order Tick Message to the wire, 54 bytes from where the cursor stands */
inline encode_agreement_trading_order_tick_message(agreement_trading_order_tick_message_record) {
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 2 -> wire[at] = agreement_trading_order_tick_message_record.channel_no[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> wire[at] = agreement_trading_order_tick_message_record.appl_seq_num[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 3 -> wire[at] = agreement_trading_order_tick_message_record.md_stream_id[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> wire[at] = agreement_trading_order_tick_message_record.security_id[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> wire[at] = agreement_trading_order_tick_message_record.security_id_source[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> wire[at] = agreement_trading_order_tick_message_record.price[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> wire[at] = agreement_trading_order_tick_message_record.order_qty[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = agreement_trading_order_tick_message_record.side; at = at + 1;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> wire[at] = agreement_trading_order_tick_message_record.transact_time[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> wire[at] = agreement_trading_order_tick_message_record.confirm_id[agreement_trading_order_tick_message_at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* Agreement Trading Order Tick Message off the wire, 54 bytes from where the cursor stands */
inline decode_agreement_trading_order_tick_message(agreement_trading_order_tick_message_record) {
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 2 -> agreement_trading_order_tick_message_record.channel_no[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.appl_seq_num[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 3 -> agreement_trading_order_tick_message_record.md_stream_id[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.security_id[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> agreement_trading_order_tick_message_record.security_id_source[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.price[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.order_qty[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_record.side = wire[at]; at = at + 1;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> agreement_trading_order_tick_message_record.transact_time[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> agreement_trading_order_tick_message_record.confirm_id[agreement_trading_order_tick_message_at] = wire[at]; at = at + 1; agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Agreement Trading Order Tick Message is what was written, byte for byte */
inline equal_agreement_trading_order_tick_message(agreement_trading_order_tick_message_read, agreement_trading_order_tick_message_written) {
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 2 -> assert(agreement_trading_order_tick_message_read.channel_no[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.channel_no[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> assert(agreement_trading_order_tick_message_read.appl_seq_num[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.appl_seq_num[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 3 -> assert(agreement_trading_order_tick_message_read.md_stream_id[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.md_stream_id[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> assert(agreement_trading_order_tick_message_read.security_id[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.security_id[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> assert(agreement_trading_order_tick_message_read.security_id_source[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.security_id_source[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> assert(agreement_trading_order_tick_message_read.price[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.price[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> assert(agreement_trading_order_tick_message_read.order_qty[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.order_qty[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  assert(agreement_trading_order_tick_message_read.side == agreement_trading_order_tick_message_written.side);
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 8 -> assert(agreement_trading_order_tick_message_read.transact_time[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.transact_time[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  agreement_trading_order_tick_message_at = 0;
  do
  :: agreement_trading_order_tick_message_at < 4 -> assert(agreement_trading_order_tick_message_read.confirm_id[agreement_trading_order_tick_message_at] == agreement_trading_order_tick_message_written.confirm_id[agreement_trading_order_tick_message_at]); agreement_trading_order_tick_message_at = agreement_trading_order_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Securities Lending Order Tick Message: 53 bytes ------------------------- */

/* Order tick of refinancing securities lending, market data category 023, published in real time; not yet enabled. */
typedef SecuritiesLendingOrderTickMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte price[8];
  byte order_qty[8];
  byte side;
  byte transact_time[8];
  byte expiration_days[2];
  byte expiration_type
};

int securities_lending_order_tick_message_at;

/* every byte of Securities Lending Order Tick Message set to one value */
inline fill_securities_lending_order_tick_message(securities_lending_order_tick_message_record, securities_lending_order_tick_message_value) {
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> securities_lending_order_tick_message_record.channel_no[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.appl_seq_num[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 3 -> securities_lending_order_tick_message_record.md_stream_id[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.security_id[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 4 -> securities_lending_order_tick_message_record.security_id_source[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.price[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.order_qty[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_record.side = securities_lending_order_tick_message_value;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.transact_time[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> securities_lending_order_tick_message_record.expiration_days[securities_lending_order_tick_message_at] = securities_lending_order_tick_message_value; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_record.expiration_type = securities_lending_order_tick_message_value;
  skip
}

/* each byte of Securities Lending Order Tick Message set to where it lies, so a field read out of place says so */
inline ramp_securities_lending_order_tick_message(securities_lending_order_tick_message_record, securities_lending_order_tick_message_base) {
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> securities_lending_order_tick_message_record.channel_no[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 0 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.appl_seq_num[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 2 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 3 -> securities_lending_order_tick_message_record.md_stream_id[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 10 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.security_id[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 13 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 4 -> securities_lending_order_tick_message_record.security_id_source[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 21 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.price[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 25 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.order_qty[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 33 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_record.side = (securities_lending_order_tick_message_base + 41 + 1) % 256;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.transact_time[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 42 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> securities_lending_order_tick_message_record.expiration_days[securities_lending_order_tick_message_at] = (securities_lending_order_tick_message_base + 50 + securities_lending_order_tick_message_at + 1) % 256; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_record.expiration_type = (securities_lending_order_tick_message_base + 52 + 1) % 256;
  skip
}

/* Securities Lending Order Tick Message to the wire, 53 bytes from where the cursor stands */
inline encode_securities_lending_order_tick_message(securities_lending_order_tick_message_record) {
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> wire[at] = securities_lending_order_tick_message_record.channel_no[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> wire[at] = securities_lending_order_tick_message_record.appl_seq_num[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 3 -> wire[at] = securities_lending_order_tick_message_record.md_stream_id[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> wire[at] = securities_lending_order_tick_message_record.security_id[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 4 -> wire[at] = securities_lending_order_tick_message_record.security_id_source[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> wire[at] = securities_lending_order_tick_message_record.price[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> wire[at] = securities_lending_order_tick_message_record.order_qty[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_lending_order_tick_message_record.side; at = at + 1;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> wire[at] = securities_lending_order_tick_message_record.transact_time[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> wire[at] = securities_lending_order_tick_message_record.expiration_days[securities_lending_order_tick_message_at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_lending_order_tick_message_record.expiration_type; at = at + 1;
  skip
}

/* Securities Lending Order Tick Message off the wire, 53 bytes from where the cursor stands */
inline decode_securities_lending_order_tick_message(securities_lending_order_tick_message_record) {
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> securities_lending_order_tick_message_record.channel_no[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.appl_seq_num[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 3 -> securities_lending_order_tick_message_record.md_stream_id[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.security_id[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 4 -> securities_lending_order_tick_message_record.security_id_source[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.price[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.order_qty[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_record.side = wire[at]; at = at + 1;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> securities_lending_order_tick_message_record.transact_time[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> securities_lending_order_tick_message_record.expiration_days[securities_lending_order_tick_message_at] = wire[at]; at = at + 1; securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_record.expiration_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Securities Lending Order Tick Message is what was written, byte for byte */
inline equal_securities_lending_order_tick_message(securities_lending_order_tick_message_read, securities_lending_order_tick_message_written) {
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> assert(securities_lending_order_tick_message_read.channel_no[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.channel_no[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> assert(securities_lending_order_tick_message_read.appl_seq_num[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.appl_seq_num[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 3 -> assert(securities_lending_order_tick_message_read.md_stream_id[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.md_stream_id[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> assert(securities_lending_order_tick_message_read.security_id[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.security_id[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 4 -> assert(securities_lending_order_tick_message_read.security_id_source[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.security_id_source[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> assert(securities_lending_order_tick_message_read.price[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.price[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> assert(securities_lending_order_tick_message_read.order_qty[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.order_qty[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  assert(securities_lending_order_tick_message_read.side == securities_lending_order_tick_message_written.side);
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 8 -> assert(securities_lending_order_tick_message_read.transact_time[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.transact_time[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_order_tick_message_at = 0;
  do
  :: securities_lending_order_tick_message_at < 2 -> assert(securities_lending_order_tick_message_read.expiration_days[securities_lending_order_tick_message_at] == securities_lending_order_tick_message_written.expiration_days[securities_lending_order_tick_message_at]); securities_lending_order_tick_message_at = securities_lending_order_tick_message_at + 1
  :: else -> break
  od;
  assert(securities_lending_order_tick_message_read.expiration_type == securities_lending_order_tick_message_written.expiration_type);
  skip
}

/* ---- Bond Spot Matching Large Trade Tick Message: 76 bytes ------------------- */

/* Trade tick of large lot matching in spot bond trading, market data category 011, published in real time. */
typedef BondSpotMatchingLargeTradeTickMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte bid_appl_seq_num[8];
  byte ask_appl_seq_num[8];
  byte trade_price[8];
  byte trade_qty[8];
  byte trade_money[8];
  byte exec_type;
  byte transact_time[8];
  byte settl_period;
  byte settl_type
};

int bond_spot_matching_large_trade_tick_message_at;

/* every byte of Bond Spot Matching Large Trade Tick Message set to one value */
inline fill_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_record, bond_spot_matching_large_trade_tick_message_value) {
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 2 -> bond_spot_matching_large_trade_tick_message_record.channel_no[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 3 -> bond_spot_matching_large_trade_tick_message_record.md_stream_id[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.security_id[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 4 -> bond_spot_matching_large_trade_tick_message_record.security_id_source[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.bid_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.ask_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_price[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_qty[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_money[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_record.exec_type = bond_spot_matching_large_trade_tick_message_value;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.transact_time[bond_spot_matching_large_trade_tick_message_at] = bond_spot_matching_large_trade_tick_message_value; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_record.settl_period = bond_spot_matching_large_trade_tick_message_value;
  bond_spot_matching_large_trade_tick_message_record.settl_type = bond_spot_matching_large_trade_tick_message_value;
  skip
}

/* each byte of Bond Spot Matching Large Trade Tick Message set to where it lies, so a field read out of place says so */
inline ramp_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_record, bond_spot_matching_large_trade_tick_message_base) {
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 2 -> bond_spot_matching_large_trade_tick_message_record.channel_no[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 0 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 2 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 3 -> bond_spot_matching_large_trade_tick_message_record.md_stream_id[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 10 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.security_id[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 13 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 4 -> bond_spot_matching_large_trade_tick_message_record.security_id_source[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 21 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.bid_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 25 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.ask_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 33 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_price[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 41 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_qty[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 49 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_money[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 57 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_record.exec_type = (bond_spot_matching_large_trade_tick_message_base + 65 + 1) % 256;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.transact_time[bond_spot_matching_large_trade_tick_message_at] = (bond_spot_matching_large_trade_tick_message_base + 66 + bond_spot_matching_large_trade_tick_message_at + 1) % 256; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_record.settl_period = (bond_spot_matching_large_trade_tick_message_base + 74 + 1) % 256;
  bond_spot_matching_large_trade_tick_message_record.settl_type = (bond_spot_matching_large_trade_tick_message_base + 75 + 1) % 256;
  skip
}

/* Bond Spot Matching Large Trade Tick Message to the wire, 76 bytes from where the cursor stands */
inline encode_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_record) {
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 2 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.channel_no[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.appl_seq_num[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 3 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.md_stream_id[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.security_id[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 4 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.security_id_source[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.bid_appl_seq_num[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.ask_appl_seq_num[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.trade_price[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.trade_qty[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.trade_money[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_spot_matching_large_trade_tick_message_record.exec_type; at = at + 1;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> wire[at] = bond_spot_matching_large_trade_tick_message_record.transact_time[bond_spot_matching_large_trade_tick_message_at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_spot_matching_large_trade_tick_message_record.settl_period; at = at + 1;
  wire[at] = bond_spot_matching_large_trade_tick_message_record.settl_type; at = at + 1;
  skip
}

/* Bond Spot Matching Large Trade Tick Message off the wire, 76 bytes from where the cursor stands */
inline decode_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_record) {
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 2 -> bond_spot_matching_large_trade_tick_message_record.channel_no[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 3 -> bond_spot_matching_large_trade_tick_message_record.md_stream_id[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.security_id[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 4 -> bond_spot_matching_large_trade_tick_message_record.security_id_source[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.bid_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.ask_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_price[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_qty[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.trade_money[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_record.exec_type = wire[at]; at = at + 1;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> bond_spot_matching_large_trade_tick_message_record.transact_time[bond_spot_matching_large_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_record.settl_period = wire[at]; at = at + 1;
  bond_spot_matching_large_trade_tick_message_record.settl_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Bond Spot Matching Large Trade Tick Message is what was written, byte for byte */
inline equal_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_read, bond_spot_matching_large_trade_tick_message_written) {
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 2 -> assert(bond_spot_matching_large_trade_tick_message_read.channel_no[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.channel_no[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.appl_seq_num[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.appl_seq_num[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 3 -> assert(bond_spot_matching_large_trade_tick_message_read.md_stream_id[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.md_stream_id[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.security_id[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.security_id[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 4 -> assert(bond_spot_matching_large_trade_tick_message_read.security_id_source[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.security_id_source[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.bid_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.bid_appl_seq_num[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.ask_appl_seq_num[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.ask_appl_seq_num[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.trade_price[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.trade_price[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.trade_qty[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.trade_qty[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.trade_money[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.trade_money[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  assert(bond_spot_matching_large_trade_tick_message_read.exec_type == bond_spot_matching_large_trade_tick_message_written.exec_type);
  bond_spot_matching_large_trade_tick_message_at = 0;
  do
  :: bond_spot_matching_large_trade_tick_message_at < 8 -> assert(bond_spot_matching_large_trade_tick_message_read.transact_time[bond_spot_matching_large_trade_tick_message_at] == bond_spot_matching_large_trade_tick_message_written.transact_time[bond_spot_matching_large_trade_tick_message_at]); bond_spot_matching_large_trade_tick_message_at = bond_spot_matching_large_trade_tick_message_at + 1
  :: else -> break
  od;
  assert(bond_spot_matching_large_trade_tick_message_read.settl_period == bond_spot_matching_large_trade_tick_message_written.settl_period);
  assert(bond_spot_matching_large_trade_tick_message_read.settl_type == bond_spot_matching_large_trade_tick_message_written.settl_type);
  skip
}

/* ---- Bond Spot Negotiated Trade Tick Message: 76 bytes ----------------------- */

/* Trade tick of negotiated trading in spot bond trading, market data category 012, published in real time. */
typedef BondSpotNegotiatedTradeTickMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte bid_appl_seq_num[8];
  byte ask_appl_seq_num[8];
  byte trade_price[8];
  byte trade_qty[8];
  byte trade_money[8];
  byte exec_type;
  byte transact_time[8];
  byte settl_period;
  byte settl_type
};

int bond_spot_negotiated_trade_tick_message_at;

/* every byte of Bond Spot Negotiated Trade Tick Message set to one value */
inline fill_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_record, bond_spot_negotiated_trade_tick_message_value) {
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 2 -> bond_spot_negotiated_trade_tick_message_record.channel_no[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 3 -> bond_spot_negotiated_trade_tick_message_record.md_stream_id[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.security_id[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 4 -> bond_spot_negotiated_trade_tick_message_record.security_id_source[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.bid_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.ask_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_price[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_qty[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_money[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_record.exec_type = bond_spot_negotiated_trade_tick_message_value;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.transact_time[bond_spot_negotiated_trade_tick_message_at] = bond_spot_negotiated_trade_tick_message_value; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_record.settl_period = bond_spot_negotiated_trade_tick_message_value;
  bond_spot_negotiated_trade_tick_message_record.settl_type = bond_spot_negotiated_trade_tick_message_value;
  skip
}

/* each byte of Bond Spot Negotiated Trade Tick Message set to where it lies, so a field read out of place says so */
inline ramp_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_record, bond_spot_negotiated_trade_tick_message_base) {
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 2 -> bond_spot_negotiated_trade_tick_message_record.channel_no[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 0 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 2 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 3 -> bond_spot_negotiated_trade_tick_message_record.md_stream_id[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 10 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.security_id[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 13 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 4 -> bond_spot_negotiated_trade_tick_message_record.security_id_source[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 21 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.bid_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 25 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.ask_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 33 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_price[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 41 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_qty[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 49 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_money[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 57 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_record.exec_type = (bond_spot_negotiated_trade_tick_message_base + 65 + 1) % 256;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.transact_time[bond_spot_negotiated_trade_tick_message_at] = (bond_spot_negotiated_trade_tick_message_base + 66 + bond_spot_negotiated_trade_tick_message_at + 1) % 256; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_record.settl_period = (bond_spot_negotiated_trade_tick_message_base + 74 + 1) % 256;
  bond_spot_negotiated_trade_tick_message_record.settl_type = (bond_spot_negotiated_trade_tick_message_base + 75 + 1) % 256;
  skip
}

/* Bond Spot Negotiated Trade Tick Message to the wire, 76 bytes from where the cursor stands */
inline encode_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_record) {
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 2 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.channel_no[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.appl_seq_num[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 3 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.md_stream_id[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.security_id[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 4 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.security_id_source[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.bid_appl_seq_num[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.ask_appl_seq_num[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.trade_price[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.trade_qty[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.trade_money[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_spot_negotiated_trade_tick_message_record.exec_type; at = at + 1;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> wire[at] = bond_spot_negotiated_trade_tick_message_record.transact_time[bond_spot_negotiated_trade_tick_message_at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = bond_spot_negotiated_trade_tick_message_record.settl_period; at = at + 1;
  wire[at] = bond_spot_negotiated_trade_tick_message_record.settl_type; at = at + 1;
  skip
}

/* Bond Spot Negotiated Trade Tick Message off the wire, 76 bytes from where the cursor stands */
inline decode_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_record) {
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 2 -> bond_spot_negotiated_trade_tick_message_record.channel_no[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 3 -> bond_spot_negotiated_trade_tick_message_record.md_stream_id[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.security_id[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 4 -> bond_spot_negotiated_trade_tick_message_record.security_id_source[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.bid_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.ask_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_price[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_qty[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.trade_money[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_record.exec_type = wire[at]; at = at + 1;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> bond_spot_negotiated_trade_tick_message_record.transact_time[bond_spot_negotiated_trade_tick_message_at] = wire[at]; at = at + 1; bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_record.settl_period = wire[at]; at = at + 1;
  bond_spot_negotiated_trade_tick_message_record.settl_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Bond Spot Negotiated Trade Tick Message is what was written, byte for byte */
inline equal_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_read, bond_spot_negotiated_trade_tick_message_written) {
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 2 -> assert(bond_spot_negotiated_trade_tick_message_read.channel_no[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.channel_no[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.appl_seq_num[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.appl_seq_num[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 3 -> assert(bond_spot_negotiated_trade_tick_message_read.md_stream_id[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.md_stream_id[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.security_id[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.security_id[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 4 -> assert(bond_spot_negotiated_trade_tick_message_read.security_id_source[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.security_id_source[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.bid_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.bid_appl_seq_num[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.ask_appl_seq_num[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.ask_appl_seq_num[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.trade_price[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.trade_price[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.trade_qty[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.trade_qty[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.trade_money[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.trade_money[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  assert(bond_spot_negotiated_trade_tick_message_read.exec_type == bond_spot_negotiated_trade_tick_message_written.exec_type);
  bond_spot_negotiated_trade_tick_message_at = 0;
  do
  :: bond_spot_negotiated_trade_tick_message_at < 8 -> assert(bond_spot_negotiated_trade_tick_message_read.transact_time[bond_spot_negotiated_trade_tick_message_at] == bond_spot_negotiated_trade_tick_message_written.transact_time[bond_spot_negotiated_trade_tick_message_at]); bond_spot_negotiated_trade_tick_message_at = bond_spot_negotiated_trade_tick_message_at + 1
  :: else -> break
  od;
  assert(bond_spot_negotiated_trade_tick_message_read.settl_period == bond_spot_negotiated_trade_tick_message_written.settl_period);
  assert(bond_spot_negotiated_trade_tick_message_read.settl_type == bond_spot_negotiated_trade_tick_message_written.settl_type);
  skip
}

/* ---- Securities Lending Trade Tick Message: 74 bytes ------------------------- */

/* Trade tick of refinancing securities lending, market data category 023, published in real time; it has no extension fields and is not yet enabled. */
typedef SecuritiesLendingTradeTickMessage {
  byte channel_no[2];
  byte appl_seq_num[8];
  byte md_stream_id[3];
  byte security_id[8];
  byte security_id_source[4];
  byte bid_appl_seq_num[8];
  byte ask_appl_seq_num[8];
  byte trade_price[8];
  byte trade_qty[8];
  byte trade_money[8];
  byte exec_type;
  byte transact_time[8]
};

int securities_lending_trade_tick_message_at;

/* every byte of Securities Lending Trade Tick Message set to one value */
inline fill_securities_lending_trade_tick_message(securities_lending_trade_tick_message_record, securities_lending_trade_tick_message_value) {
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 2 -> securities_lending_trade_tick_message_record.channel_no[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.appl_seq_num[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 3 -> securities_lending_trade_tick_message_record.md_stream_id[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.security_id[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 4 -> securities_lending_trade_tick_message_record.security_id_source[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.bid_appl_seq_num[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.ask_appl_seq_num[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_price[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_qty[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_money[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_record.exec_type = securities_lending_trade_tick_message_value;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.transact_time[securities_lending_trade_tick_message_at] = securities_lending_trade_tick_message_value; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Securities Lending Trade Tick Message set to where it lies, so a field read out of place says so */
inline ramp_securities_lending_trade_tick_message(securities_lending_trade_tick_message_record, securities_lending_trade_tick_message_base) {
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 2 -> securities_lending_trade_tick_message_record.channel_no[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 0 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.appl_seq_num[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 2 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 3 -> securities_lending_trade_tick_message_record.md_stream_id[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 10 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.security_id[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 13 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 4 -> securities_lending_trade_tick_message_record.security_id_source[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 21 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.bid_appl_seq_num[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 25 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.ask_appl_seq_num[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 33 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_price[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 41 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_qty[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 49 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_money[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 57 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_record.exec_type = (securities_lending_trade_tick_message_base + 65 + 1) % 256;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.transact_time[securities_lending_trade_tick_message_at] = (securities_lending_trade_tick_message_base + 66 + securities_lending_trade_tick_message_at + 1) % 256; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* Securities Lending Trade Tick Message to the wire, 74 bytes from where the cursor stands */
inline encode_securities_lending_trade_tick_message(securities_lending_trade_tick_message_record) {
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 2 -> wire[at] = securities_lending_trade_tick_message_record.channel_no[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.appl_seq_num[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 3 -> wire[at] = securities_lending_trade_tick_message_record.md_stream_id[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.security_id[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 4 -> wire[at] = securities_lending_trade_tick_message_record.security_id_source[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.bid_appl_seq_num[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.ask_appl_seq_num[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.trade_price[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.trade_qty[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.trade_money[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  wire[at] = securities_lending_trade_tick_message_record.exec_type; at = at + 1;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> wire[at] = securities_lending_trade_tick_message_record.transact_time[securities_lending_trade_tick_message_at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* Securities Lending Trade Tick Message off the wire, 74 bytes from where the cursor stands */
inline decode_securities_lending_trade_tick_message(securities_lending_trade_tick_message_record) {
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 2 -> securities_lending_trade_tick_message_record.channel_no[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.appl_seq_num[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 3 -> securities_lending_trade_tick_message_record.md_stream_id[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.security_id[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 4 -> securities_lending_trade_tick_message_record.security_id_source[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.bid_appl_seq_num[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.ask_appl_seq_num[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_price[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_qty[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.trade_money[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_record.exec_type = wire[at]; at = at + 1;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> securities_lending_trade_tick_message_record.transact_time[securities_lending_trade_tick_message_at] = wire[at]; at = at + 1; securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Securities Lending Trade Tick Message is what was written, byte for byte */
inline equal_securities_lending_trade_tick_message(securities_lending_trade_tick_message_read, securities_lending_trade_tick_message_written) {
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 2 -> assert(securities_lending_trade_tick_message_read.channel_no[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.channel_no[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.appl_seq_num[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.appl_seq_num[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 3 -> assert(securities_lending_trade_tick_message_read.md_stream_id[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.md_stream_id[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.security_id[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.security_id[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 4 -> assert(securities_lending_trade_tick_message_read.security_id_source[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.security_id_source[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.bid_appl_seq_num[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.bid_appl_seq_num[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.ask_appl_seq_num[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.ask_appl_seq_num[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.trade_price[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.trade_price[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.trade_qty[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.trade_qty[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.trade_money[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.trade_money[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  assert(securities_lending_trade_tick_message_read.exec_type == securities_lending_trade_tick_message_written.exec_type);
  securities_lending_trade_tick_message_at = 0;
  do
  :: securities_lending_trade_tick_message_at < 8 -> assert(securities_lending_trade_tick_message_read.transact_time[securities_lending_trade_tick_message_at] == securities_lending_trade_tick_message_written.transact_time[securities_lending_trade_tick_message_at]); securities_lending_trade_tick_message_at = securities_lending_trade_tick_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Packet Trailer: 4 bytes ------------------------------------------------- */

/* Bjse Mddp Packet Trailer, transmitted without encryption */
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
    assert(at == 20);
    at = 0;
    decode_channel_heartbeat_message(channel_heartbeat_message_got);
    assert(at == 20);
    equal_channel_heartbeat_message(channel_heartbeat_message_got, channel_heartbeat_message_sent)
  }
}

/* Retransmission Message: encoded, read back, and compared */
proctype check_retransmission_message() {
  RetransmissionMessage retransmission_message_sent;
  RetransmissionMessage retransmission_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_message(retransmission_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_message(retransmission_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_message(retransmission_message_sent, 255)
  :: else -> ramp_retransmission_message(retransmission_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_message(retransmission_message_sent);
    assert(at == 52);
    at = 0;
    decode_retransmission_message(retransmission_message_got);
    assert(at == 52);
    equal_retransmission_message(retransmission_message_got, retransmission_message_sent)
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

/* Bond Spot Matching Large Order Tick Message: encoded, read back, and compared */
proctype check_bond_spot_matching_large_order_tick_message() {
  BondSpotMatchingLargeOrderTickMessage bond_spot_matching_large_order_tick_message_sent;
  BondSpotMatchingLargeOrderTickMessage bond_spot_matching_large_order_tick_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_sent, 0)
  :: pattern == 1 -> fill_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_sent, 32)
  :: pattern == 2 -> fill_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_sent, 255)
  :: else -> ramp_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_sent);
    assert(at == 53);
    at = 0;
    decode_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_got);
    assert(at == 53);
    equal_bond_spot_matching_large_order_tick_message(bond_spot_matching_large_order_tick_message_got, bond_spot_matching_large_order_tick_message_sent)
  }
}

/* Agreement Trading Order Tick Message: encoded, read back, and compared */
proctype check_agreement_trading_order_tick_message() {
  AgreementTradingOrderTickMessage agreement_trading_order_tick_message_sent;
  AgreementTradingOrderTickMessage agreement_trading_order_tick_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_agreement_trading_order_tick_message(agreement_trading_order_tick_message_sent, 0)
  :: pattern == 1 -> fill_agreement_trading_order_tick_message(agreement_trading_order_tick_message_sent, 32)
  :: pattern == 2 -> fill_agreement_trading_order_tick_message(agreement_trading_order_tick_message_sent, 255)
  :: else -> ramp_agreement_trading_order_tick_message(agreement_trading_order_tick_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_agreement_trading_order_tick_message(agreement_trading_order_tick_message_sent);
    assert(at == 54);
    at = 0;
    decode_agreement_trading_order_tick_message(agreement_trading_order_tick_message_got);
    assert(at == 54);
    equal_agreement_trading_order_tick_message(agreement_trading_order_tick_message_got, agreement_trading_order_tick_message_sent)
  }
}

/* Securities Lending Order Tick Message: encoded, read back, and compared */
proctype check_securities_lending_order_tick_message() {
  SecuritiesLendingOrderTickMessage securities_lending_order_tick_message_sent;
  SecuritiesLendingOrderTickMessage securities_lending_order_tick_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_lending_order_tick_message(securities_lending_order_tick_message_sent, 0)
  :: pattern == 1 -> fill_securities_lending_order_tick_message(securities_lending_order_tick_message_sent, 32)
  :: pattern == 2 -> fill_securities_lending_order_tick_message(securities_lending_order_tick_message_sent, 255)
  :: else -> ramp_securities_lending_order_tick_message(securities_lending_order_tick_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_lending_order_tick_message(securities_lending_order_tick_message_sent);
    assert(at == 53);
    at = 0;
    decode_securities_lending_order_tick_message(securities_lending_order_tick_message_got);
    assert(at == 53);
    equal_securities_lending_order_tick_message(securities_lending_order_tick_message_got, securities_lending_order_tick_message_sent)
  }
}

/* Bond Spot Matching Large Trade Tick Message: encoded, read back, and compared */
proctype check_bond_spot_matching_large_trade_tick_message() {
  BondSpotMatchingLargeTradeTickMessage bond_spot_matching_large_trade_tick_message_sent;
  BondSpotMatchingLargeTradeTickMessage bond_spot_matching_large_trade_tick_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_sent, 0)
  :: pattern == 1 -> fill_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_sent, 32)
  :: pattern == 2 -> fill_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_sent, 255)
  :: else -> ramp_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_sent);
    assert(at == 76);
    at = 0;
    decode_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_got);
    assert(at == 76);
    equal_bond_spot_matching_large_trade_tick_message(bond_spot_matching_large_trade_tick_message_got, bond_spot_matching_large_trade_tick_message_sent)
  }
}

/* Bond Spot Negotiated Trade Tick Message: encoded, read back, and compared */
proctype check_bond_spot_negotiated_trade_tick_message() {
  BondSpotNegotiatedTradeTickMessage bond_spot_negotiated_trade_tick_message_sent;
  BondSpotNegotiatedTradeTickMessage bond_spot_negotiated_trade_tick_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_sent, 0)
  :: pattern == 1 -> fill_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_sent, 32)
  :: pattern == 2 -> fill_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_sent, 255)
  :: else -> ramp_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_sent);
    assert(at == 76);
    at = 0;
    decode_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_got);
    assert(at == 76);
    equal_bond_spot_negotiated_trade_tick_message(bond_spot_negotiated_trade_tick_message_got, bond_spot_negotiated_trade_tick_message_sent)
  }
}

/* Securities Lending Trade Tick Message: encoded, read back, and compared */
proctype check_securities_lending_trade_tick_message() {
  SecuritiesLendingTradeTickMessage securities_lending_trade_tick_message_sent;
  SecuritiesLendingTradeTickMessage securities_lending_trade_tick_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_securities_lending_trade_tick_message(securities_lending_trade_tick_message_sent, 0)
  :: pattern == 1 -> fill_securities_lending_trade_tick_message(securities_lending_trade_tick_message_sent, 32)
  :: pattern == 2 -> fill_securities_lending_trade_tick_message(securities_lending_trade_tick_message_sent, 255)
  :: else -> ramp_securities_lending_trade_tick_message(securities_lending_trade_tick_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_securities_lending_trade_tick_message(securities_lending_trade_tick_message_sent);
    assert(at == 74);
    at = 0;
    decode_securities_lending_trade_tick_message(securities_lending_trade_tick_message_got);
    assert(at == 74);
    equal_securities_lending_trade_tick_message(securities_lending_trade_tick_message_got, securities_lending_trade_tick_message_sent)
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
  :: run check_retransmission_message()
  :: run check_business_reject_message()
  :: run check_bond_spot_matching_large_order_tick_message()
  :: run check_agreement_trading_order_tick_message()
  :: run check_securities_lending_order_tick_message()
  :: run check_bond_spot_matching_large_trade_tick_message()
  :: run check_bond_spot_negotiated_trade_tick_message()
  :: run check_securities_lending_trade_tick_message()
  :: run check_packet_trailer()
  fi
}
