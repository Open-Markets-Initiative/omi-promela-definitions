/*
 * Shanghai Stock Exchange Market Data Gateway
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
 *   - the dispatch that chooses a message by its type
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 260

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Standard Header: 24 bytes ----------------------------------------------- */

typedef StandardHeader {
  byte msg_type[4];
  byte sending_time[8];
  byte msg_seq_num[8];
  byte body_length[4]
};

int standard_header_at;

/* every byte of Standard Header set to one value */
inline fill_standard_header(standard_header_record, standard_header_value) {
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> standard_header_record.msg_type[standard_header_at] = standard_header_value; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> standard_header_record.sending_time[standard_header_at] = standard_header_value; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> standard_header_record.msg_seq_num[standard_header_at] = standard_header_value; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> standard_header_record.body_length[standard_header_at] = standard_header_value; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Standard Header set to where it lies, so a field read out of place says so */
inline ramp_standard_header(standard_header_record, standard_header_base) {
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> standard_header_record.msg_type[standard_header_at] = (standard_header_base + 0 + standard_header_at + 1) % 256; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> standard_header_record.sending_time[standard_header_at] = (standard_header_base + 4 + standard_header_at + 1) % 256; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> standard_header_record.msg_seq_num[standard_header_at] = (standard_header_base + 12 + standard_header_at + 1) % 256; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> standard_header_record.body_length[standard_header_at] = (standard_header_base + 20 + standard_header_at + 1) % 256; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Header to the wire, 24 bytes from where the cursor stands */
inline encode_standard_header(standard_header_record) {
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> wire[at] = standard_header_record.msg_type[standard_header_at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> wire[at] = standard_header_record.sending_time[standard_header_at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> wire[at] = standard_header_record.msg_seq_num[standard_header_at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> wire[at] = standard_header_record.body_length[standard_header_at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Header off the wire, 24 bytes from where the cursor stands */
inline decode_standard_header(standard_header_record) {
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> standard_header_record.msg_type[standard_header_at] = wire[at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> standard_header_record.sending_time[standard_header_at] = wire[at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> standard_header_record.msg_seq_num[standard_header_at] = wire[at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> standard_header_record.body_length[standard_header_at] = wire[at]; at = at + 1; standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Standard Header is what was written, byte for byte */
inline equal_standard_header(standard_header_read, standard_header_written) {
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> assert(standard_header_read.msg_type[standard_header_at] == standard_header_written.msg_type[standard_header_at]); standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> assert(standard_header_read.sending_time[standard_header_at] == standard_header_written.sending_time[standard_header_at]); standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 8 -> assert(standard_header_read.msg_seq_num[standard_header_at] == standard_header_written.msg_seq_num[standard_header_at]); standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  standard_header_at = 0;
  do
  :: standard_header_at < 4 -> assert(standard_header_read.body_length[standard_header_at] == standard_header_written.body_length[standard_header_at]); standard_header_at = standard_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Message: 74 bytes ------------------------------------------------- */

/* The client must send this message first when starting a market data session. */
typedef LogonMessage {
  byte sender_comp_i_d[32];
  byte target_comp_i_d[32];
  byte heart_bt_int[2];
  byte appl_ver_i_d[8]
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.sender_comp_i_d[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.target_comp_i_d[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.heart_bt_int[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> logon_message_record.appl_ver_i_d[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.sender_comp_i_d[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.target_comp_i_d[logon_message_at] = (logon_message_base + 32 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.heart_bt_int[logon_message_at] = (logon_message_base + 64 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> logon_message_record.appl_ver_i_d[logon_message_at] = (logon_message_base + 66 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message to the wire, 74 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> wire[at] = logon_message_record.sender_comp_i_d[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> wire[at] = logon_message_record.target_comp_i_d[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> wire[at] = logon_message_record.heart_bt_int[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> wire[at] = logon_message_record.appl_ver_i_d[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message off the wire, 74 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.sender_comp_i_d[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> logon_message_record.target_comp_i_d[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.heart_bt_int[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> logon_message_record.appl_ver_i_d[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> assert(logon_message_read.sender_comp_i_d[logon_message_at] == logon_message_written.sender_comp_i_d[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 32 -> assert(logon_message_read.target_comp_i_d[logon_message_at] == logon_message_written.target_comp_i_d[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> assert(logon_message_read.heart_bt_int[logon_message_at] == logon_message_written.heart_bt_int[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 8 -> assert(logon_message_read.appl_ver_i_d[logon_message_at] == logon_message_written.appl_ver_i_d[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 260 bytes ----------------------------------------------- */

/* The logout message starts or confirms the end of a market data session. A disconnection without an exchange of logout messages is treated as an abnormal disconnection. After sending a logout message, neither side of the connection should send any further message. */
typedef LogoutMessage {
  byte session_status[4];
  byte text[256]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> logout_message_record.session_status[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> logout_message_record.text[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> logout_message_record.session_status[logout_message_at] = (logout_message_base + 0 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> logout_message_record.text[logout_message_at] = (logout_message_base + 4 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 260 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> wire[at] = logout_message_record.session_status[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> wire[at] = logout_message_record.text[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 260 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> logout_message_record.session_status[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> logout_message_record.text[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> assert(logout_message_read.session_status[logout_message_at] == logout_message_written.session_status[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 256 -> assert(logout_message_read.text[logout_message_at] == logout_message_written.text[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Channel Heartbeat: 12 bytes --------------------------------------------- */

/* Tick-by-tick market data supports sending a heartbeat every 3 seconds during idle periods of data sending. If data sending stays busy, the channel heartbeat interval can exceed 3s. */
typedef ChannelHeartbeat {
  byte channel_heartbeat_security_type;
  byte channel_heartbeat_channel_n_o[2];
  byte appl_last_seq_num[8];
  byte end_of_channel
};

int channel_heartbeat_at;

/* every byte of Channel Heartbeat set to one value */
inline fill_channel_heartbeat(channel_heartbeat_record, channel_heartbeat_value) {
  channel_heartbeat_record.channel_heartbeat_security_type = channel_heartbeat_value;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 2 -> channel_heartbeat_record.channel_heartbeat_channel_n_o[channel_heartbeat_at] = channel_heartbeat_value; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 8 -> channel_heartbeat_record.appl_last_seq_num[channel_heartbeat_at] = channel_heartbeat_value; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_record.end_of_channel = channel_heartbeat_value;
  skip
}

/* each byte of Channel Heartbeat set to where it lies, so a field read out of place says so */
inline ramp_channel_heartbeat(channel_heartbeat_record, channel_heartbeat_base) {
  channel_heartbeat_record.channel_heartbeat_security_type = (channel_heartbeat_base + 0 + 1) % 256;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 2 -> channel_heartbeat_record.channel_heartbeat_channel_n_o[channel_heartbeat_at] = (channel_heartbeat_base + 1 + channel_heartbeat_at + 1) % 256; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 8 -> channel_heartbeat_record.appl_last_seq_num[channel_heartbeat_at] = (channel_heartbeat_base + 3 + channel_heartbeat_at + 1) % 256; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_record.end_of_channel = (channel_heartbeat_base + 11 + 1) % 256;
  skip
}

/* Channel Heartbeat to the wire, 12 bytes from where the cursor stands */
inline encode_channel_heartbeat(channel_heartbeat_record) {
  wire[at] = channel_heartbeat_record.channel_heartbeat_security_type; at = at + 1;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 2 -> wire[at] = channel_heartbeat_record.channel_heartbeat_channel_n_o[channel_heartbeat_at]; at = at + 1; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 8 -> wire[at] = channel_heartbeat_record.appl_last_seq_num[channel_heartbeat_at]; at = at + 1; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  wire[at] = channel_heartbeat_record.end_of_channel; at = at + 1;
  skip
}

/* Channel Heartbeat off the wire, 12 bytes from where the cursor stands */
inline decode_channel_heartbeat(channel_heartbeat_record) {
  channel_heartbeat_record.channel_heartbeat_security_type = wire[at]; at = at + 1;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 2 -> channel_heartbeat_record.channel_heartbeat_channel_n_o[channel_heartbeat_at] = wire[at]; at = at + 1; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 8 -> channel_heartbeat_record.appl_last_seq_num[channel_heartbeat_at] = wire[at]; at = at + 1; channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_record.end_of_channel = wire[at]; at = at + 1;
  skip
}

/* what was read of Channel Heartbeat is what was written, byte for byte */
inline equal_channel_heartbeat(channel_heartbeat_read, channel_heartbeat_written) {
  assert(channel_heartbeat_read.channel_heartbeat_security_type == channel_heartbeat_written.channel_heartbeat_security_type);
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 2 -> assert(channel_heartbeat_read.channel_heartbeat_channel_n_o[channel_heartbeat_at] == channel_heartbeat_written.channel_heartbeat_channel_n_o[channel_heartbeat_at]); channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  channel_heartbeat_at = 0;
  do
  :: channel_heartbeat_at < 8 -> assert(channel_heartbeat_read.appl_last_seq_num[channel_heartbeat_at] == channel_heartbeat_written.appl_last_seq_num[channel_heartbeat_at]); channel_heartbeat_at = channel_heartbeat_at + 1
  :: else -> break
  od;
  assert(channel_heartbeat_read.end_of_channel == channel_heartbeat_written.end_of_channel);
  skip
}

/* ---- Retransmission Message: 52 bytes ---------------------------------------- */

/* The retransmission message is used to request market data on a channel that supports retransmission. For application messages that can be retransmitted (all types of tick-by-tick market data messages), if application messages are missing, the user can send a retransmission message upstream, which represents a retransmission request. The upstream handles retransmission requests in a "request–reply" manner: it returns the data to be retransmitted according to the start and end sequence numbers specified in the retransmission message, and after the retransmission is complete it returns a retransmission message reporting that the retransmission is complete; if the retransmission fails, it returns a retransmission message reporting that the retransmission failed. The upstream system supports retransmission of only one message gap at a time; when the upstream receives multiple retransmission requests, it returns a retransmission failure for the other request messages. For tick-by-tick market data, the channel code and the message record number can be used to determine whether messages have been lost. When the message record number received is <= the largest message record number already received on this channel, the message has already been received and should be ignored. When the message record number received is > the largest message record number already received +1 (for example, the largest message record number received is 100 and the new message record number is 102), messages have been lost, and the lost data should be recovered by sending a retransmission request. */
typedef RetransmissionMessage {
  byte retransmission_message_channel_n_o[2];
  byte resend_type;
  byte appl_beg_seq_num[8];
  byte appl_end_seq_num[8];
  byte resend_status;
  byte reject_text[32]
};

int retransmission_message_at;

/* every byte of Retransmission Message set to one value */
inline fill_retransmission_message(retransmission_message_record, retransmission_message_value) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> retransmission_message_record.retransmission_message_channel_n_o[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_record.resend_type = retransmission_message_value;
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
  retransmission_message_record.resend_status = retransmission_message_value;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 32 -> retransmission_message_record.reject_text[retransmission_message_at] = retransmission_message_value; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_message(retransmission_message_record, retransmission_message_base) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> retransmission_message_record.retransmission_message_channel_n_o[retransmission_message_at] = (retransmission_message_base + 0 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_record.resend_type = (retransmission_message_base + 2 + 1) % 256;
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
  retransmission_message_record.resend_status = (retransmission_message_base + 19 + 1) % 256;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 32 -> retransmission_message_record.reject_text[retransmission_message_at] = (retransmission_message_base + 20 + retransmission_message_at + 1) % 256; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message to the wire, 52 bytes from where the cursor stands */
inline encode_retransmission_message(retransmission_message_record) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> wire[at] = retransmission_message_record.retransmission_message_channel_n_o[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_message_record.resend_type; at = at + 1;
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
  wire[at] = retransmission_message_record.resend_status; at = at + 1;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 32 -> wire[at] = retransmission_message_record.reject_text[retransmission_message_at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Message off the wire, 52 bytes from where the cursor stands */
inline decode_retransmission_message(retransmission_message_record) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> retransmission_message_record.retransmission_message_channel_n_o[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  retransmission_message_record.resend_type = wire[at]; at = at + 1;
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
  retransmission_message_record.resend_status = wire[at]; at = at + 1;
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 32 -> retransmission_message_record.reject_text[retransmission_message_at] = wire[at]; at = at + 1; retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Message is what was written, byte for byte */
inline equal_retransmission_message(retransmission_message_read, retransmission_message_written) {
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 2 -> assert(retransmission_message_read.retransmission_message_channel_n_o[retransmission_message_at] == retransmission_message_written.retransmission_message_channel_n_o[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  assert(retransmission_message_read.resend_type == retransmission_message_written.resend_type);
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
  assert(retransmission_message_read.resend_status == retransmission_message_written.resend_status);
  retransmission_message_at = 0;
  do
  :: retransmission_message_at < 32 -> assert(retransmission_message_read.reject_text[retransmission_message_at] == retransmission_message_written.reject_text[retransmission_message_at]); retransmission_message_at = retransmission_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Status Message: 14 bytes ----------------------------------------- */

/* The market status message is used by the exchange to publish information such as the market status and the number of products. It is published periodically and when the market status changes. */
typedef MarketStatusMessage {
  byte market_status_message_security_type;
  byte trad_ses_mode;
  byte trading_session_i_d[8];
  byte tot_no_related_sym[4]
};

int market_status_message_at;

/* every byte of Market Status Message set to one value */
inline fill_market_status_message(market_status_message_record, market_status_message_value) {
  market_status_message_record.market_status_message_security_type = market_status_message_value;
  market_status_message_record.trad_ses_mode = market_status_message_value;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.trading_session_i_d[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> market_status_message_record.tot_no_related_sym[market_status_message_at] = market_status_message_value; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_status_message(market_status_message_record, market_status_message_base) {
  market_status_message_record.market_status_message_security_type = (market_status_message_base + 0 + 1) % 256;
  market_status_message_record.trad_ses_mode = (market_status_message_base + 1 + 1) % 256;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.trading_session_i_d[market_status_message_at] = (market_status_message_base + 2 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> market_status_message_record.tot_no_related_sym[market_status_message_at] = (market_status_message_base + 10 + market_status_message_at + 1) % 256; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status Message to the wire, 14 bytes from where the cursor stands */
inline encode_market_status_message(market_status_message_record) {
  wire[at] = market_status_message_record.market_status_message_security_type; at = at + 1;
  wire[at] = market_status_message_record.trad_ses_mode; at = at + 1;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> wire[at] = market_status_message_record.trading_session_i_d[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> wire[at] = market_status_message_record.tot_no_related_sym[market_status_message_at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Status Message off the wire, 14 bytes from where the cursor stands */
inline decode_market_status_message(market_status_message_record) {
  market_status_message_record.market_status_message_security_type = wire[at]; at = at + 1;
  market_status_message_record.trad_ses_mode = wire[at]; at = at + 1;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> market_status_message_record.trading_session_i_d[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> market_status_message_record.tot_no_related_sym[market_status_message_at] = wire[at]; at = at + 1; market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Status Message is what was written, byte for byte */
inline equal_market_status_message(market_status_message_read, market_status_message_written) {
  assert(market_status_message_read.market_status_message_security_type == market_status_message_written.market_status_message_security_type);
  assert(market_status_message_read.trad_ses_mode == market_status_message_written.trad_ses_mode);
  market_status_message_at = 0;
  do
  :: market_status_message_at < 8 -> assert(market_status_message_read.trading_session_i_d[market_status_message_at] == market_status_message_written.trading_session_i_d[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  market_status_message_at = 0;
  do
  :: market_status_message_at < 4 -> assert(market_status_message_read.tot_no_related_sym[market_status_message_at] == market_status_message_written.tot_no_related_sym[market_status_message_at]); market_status_message_at = market_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick-by-Tick Order Market Data Extension Fields: 139 bytes -------------- */

typedef Tick_by_TickOrderMarketDataExtensionFields {
  byte side;
  byte quote_i_d[18];
  byte member_i_d[12];
  byte trader_code[12];
  byte full_amount_trade;
  byte settl_type;
  byte contract_multiplier[4];
  byte expiration_days[2];
  byte tick_by_tick_order_market_data_extension_fields_total_value_traded[8];
  byte basket_i_d[16];
  byte investor_name[32];
  byte bid_trans_type;
  byte bid_exec_inst_type;
  byte expire_date[4];
  byte secondary_order_i_d[18];
  byte min_qty[8]
};

int tick_by_tick_order_market_data_extension_fields_at;

/* every byte of Tick-by-Tick Order Market Data Extension Fields set to one value */
inline fill_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_record, tick_by_tick_order_market_data_extension_fields_value) {
  tick_by_tick_order_market_data_extension_fields_record.side = tick_by_tick_order_market_data_extension_fields_value;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> tick_by_tick_order_market_data_extension_fields_record.quote_i_d[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> tick_by_tick_order_market_data_extension_fields_record.member_i_d[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> tick_by_tick_order_market_data_extension_fields_record.trader_code[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_record.full_amount_trade = tick_by_tick_order_market_data_extension_fields_value;
  tick_by_tick_order_market_data_extension_fields_record.settl_type = tick_by_tick_order_market_data_extension_fields_value;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> tick_by_tick_order_market_data_extension_fields_record.contract_multiplier[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 2 -> tick_by_tick_order_market_data_extension_fields_record.expiration_days[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> tick_by_tick_order_market_data_extension_fields_record.tick_by_tick_order_market_data_extension_fields_total_value_traded[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 16 -> tick_by_tick_order_market_data_extension_fields_record.basket_i_d[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 32 -> tick_by_tick_order_market_data_extension_fields_record.investor_name[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_record.bid_trans_type = tick_by_tick_order_market_data_extension_fields_value;
  tick_by_tick_order_market_data_extension_fields_record.bid_exec_inst_type = tick_by_tick_order_market_data_extension_fields_value;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> tick_by_tick_order_market_data_extension_fields_record.expire_date[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> tick_by_tick_order_market_data_extension_fields_record.secondary_order_i_d[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> tick_by_tick_order_market_data_extension_fields_record.min_qty[tick_by_tick_order_market_data_extension_fields_at] = tick_by_tick_order_market_data_extension_fields_value; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick-by-Tick Order Market Data Extension Fields set to where it lies, so a field read out of place says so */
inline ramp_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_record, tick_by_tick_order_market_data_extension_fields_base) {
  tick_by_tick_order_market_data_extension_fields_record.side = (tick_by_tick_order_market_data_extension_fields_base + 0 + 1) % 256;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> tick_by_tick_order_market_data_extension_fields_record.quote_i_d[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 1 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> tick_by_tick_order_market_data_extension_fields_record.member_i_d[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 19 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> tick_by_tick_order_market_data_extension_fields_record.trader_code[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 31 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_record.full_amount_trade = (tick_by_tick_order_market_data_extension_fields_base + 43 + 1) % 256;
  tick_by_tick_order_market_data_extension_fields_record.settl_type = (tick_by_tick_order_market_data_extension_fields_base + 44 + 1) % 256;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> tick_by_tick_order_market_data_extension_fields_record.contract_multiplier[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 45 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 2 -> tick_by_tick_order_market_data_extension_fields_record.expiration_days[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 49 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> tick_by_tick_order_market_data_extension_fields_record.tick_by_tick_order_market_data_extension_fields_total_value_traded[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 51 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 16 -> tick_by_tick_order_market_data_extension_fields_record.basket_i_d[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 59 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 32 -> tick_by_tick_order_market_data_extension_fields_record.investor_name[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 75 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_record.bid_trans_type = (tick_by_tick_order_market_data_extension_fields_base + 107 + 1) % 256;
  tick_by_tick_order_market_data_extension_fields_record.bid_exec_inst_type = (tick_by_tick_order_market_data_extension_fields_base + 108 + 1) % 256;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> tick_by_tick_order_market_data_extension_fields_record.expire_date[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 109 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> tick_by_tick_order_market_data_extension_fields_record.secondary_order_i_d[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 113 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> tick_by_tick_order_market_data_extension_fields_record.min_qty[tick_by_tick_order_market_data_extension_fields_at] = (tick_by_tick_order_market_data_extension_fields_base + 131 + tick_by_tick_order_market_data_extension_fields_at + 1) % 256; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* Tick-by-Tick Order Market Data Extension Fields to the wire, 139 bytes from where the cursor stands */
inline encode_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_record) {
  wire[at] = tick_by_tick_order_market_data_extension_fields_record.side; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.quote_i_d[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.member_i_d[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.trader_code[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  wire[at] = tick_by_tick_order_market_data_extension_fields_record.full_amount_trade; at = at + 1;
  wire[at] = tick_by_tick_order_market_data_extension_fields_record.settl_type; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.contract_multiplier[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 2 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.expiration_days[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.tick_by_tick_order_market_data_extension_fields_total_value_traded[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 16 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.basket_i_d[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 32 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.investor_name[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  wire[at] = tick_by_tick_order_market_data_extension_fields_record.bid_trans_type; at = at + 1;
  wire[at] = tick_by_tick_order_market_data_extension_fields_record.bid_exec_inst_type; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.expire_date[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.secondary_order_i_d[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> wire[at] = tick_by_tick_order_market_data_extension_fields_record.min_qty[tick_by_tick_order_market_data_extension_fields_at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* Tick-by-Tick Order Market Data Extension Fields off the wire, 139 bytes from where the cursor stands */
inline decode_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_record) {
  tick_by_tick_order_market_data_extension_fields_record.side = wire[at]; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> tick_by_tick_order_market_data_extension_fields_record.quote_i_d[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> tick_by_tick_order_market_data_extension_fields_record.member_i_d[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> tick_by_tick_order_market_data_extension_fields_record.trader_code[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_record.full_amount_trade = wire[at]; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_record.settl_type = wire[at]; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> tick_by_tick_order_market_data_extension_fields_record.contract_multiplier[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 2 -> tick_by_tick_order_market_data_extension_fields_record.expiration_days[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> tick_by_tick_order_market_data_extension_fields_record.tick_by_tick_order_market_data_extension_fields_total_value_traded[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 16 -> tick_by_tick_order_market_data_extension_fields_record.basket_i_d[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 32 -> tick_by_tick_order_market_data_extension_fields_record.investor_name[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_record.bid_trans_type = wire[at]; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_record.bid_exec_inst_type = wire[at]; at = at + 1;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> tick_by_tick_order_market_data_extension_fields_record.expire_date[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> tick_by_tick_order_market_data_extension_fields_record.secondary_order_i_d[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> tick_by_tick_order_market_data_extension_fields_record.min_qty[tick_by_tick_order_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick-by-Tick Order Market Data Extension Fields is what was written, byte for byte */
inline equal_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_read, tick_by_tick_order_market_data_extension_fields_written) {
  assert(tick_by_tick_order_market_data_extension_fields_read.side == tick_by_tick_order_market_data_extension_fields_written.side);
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> assert(tick_by_tick_order_market_data_extension_fields_read.quote_i_d[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.quote_i_d[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> assert(tick_by_tick_order_market_data_extension_fields_read.member_i_d[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.member_i_d[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 12 -> assert(tick_by_tick_order_market_data_extension_fields_read.trader_code[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.trader_code[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  assert(tick_by_tick_order_market_data_extension_fields_read.full_amount_trade == tick_by_tick_order_market_data_extension_fields_written.full_amount_trade);
  assert(tick_by_tick_order_market_data_extension_fields_read.settl_type == tick_by_tick_order_market_data_extension_fields_written.settl_type);
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> assert(tick_by_tick_order_market_data_extension_fields_read.contract_multiplier[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.contract_multiplier[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 2 -> assert(tick_by_tick_order_market_data_extension_fields_read.expiration_days[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.expiration_days[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> assert(tick_by_tick_order_market_data_extension_fields_read.tick_by_tick_order_market_data_extension_fields_total_value_traded[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.tick_by_tick_order_market_data_extension_fields_total_value_traded[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 16 -> assert(tick_by_tick_order_market_data_extension_fields_read.basket_i_d[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.basket_i_d[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 32 -> assert(tick_by_tick_order_market_data_extension_fields_read.investor_name[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.investor_name[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  assert(tick_by_tick_order_market_data_extension_fields_read.bid_trans_type == tick_by_tick_order_market_data_extension_fields_written.bid_trans_type);
  assert(tick_by_tick_order_market_data_extension_fields_read.bid_exec_inst_type == tick_by_tick_order_market_data_extension_fields_written.bid_exec_inst_type);
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 4 -> assert(tick_by_tick_order_market_data_extension_fields_read.expire_date[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.expire_date[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 18 -> assert(tick_by_tick_order_market_data_extension_fields_read.secondary_order_i_d[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.secondary_order_i_d[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_order_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_order_market_data_extension_fields_at < 8 -> assert(tick_by_tick_order_market_data_extension_fields_read.min_qty[tick_by_tick_order_market_data_extension_fields_at] == tick_by_tick_order_market_data_extension_fields_written.min_qty[tick_by_tick_order_market_data_extension_fields_at]); tick_by_tick_order_market_data_extension_fields_at = tick_by_tick_order_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick-by-Tick Trade Market Data Extension Fields: 53 bytes --------------- */

typedef Tick_by_TickTradeMarketDataExtensionFields {
  byte bid_appl_seq_num[18];
  byte offer_appl_seq_num[18];
  byte tick_by_tick_trade_market_data_extension_fields_total_value_traded[8];
  byte trade_method;
  byte margin_price[8]
};

int tick_by_tick_trade_market_data_extension_fields_at;

/* every byte of Tick-by-Tick Trade Market Data Extension Fields set to one value */
inline fill_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_record, tick_by_tick_trade_market_data_extension_fields_value) {
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> tick_by_tick_trade_market_data_extension_fields_record.bid_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] = tick_by_tick_trade_market_data_extension_fields_value; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> tick_by_tick_trade_market_data_extension_fields_record.offer_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] = tick_by_tick_trade_market_data_extension_fields_value; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> tick_by_tick_trade_market_data_extension_fields_record.tick_by_tick_trade_market_data_extension_fields_total_value_traded[tick_by_tick_trade_market_data_extension_fields_at] = tick_by_tick_trade_market_data_extension_fields_value; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_record.trade_method = tick_by_tick_trade_market_data_extension_fields_value;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> tick_by_tick_trade_market_data_extension_fields_record.margin_price[tick_by_tick_trade_market_data_extension_fields_at] = tick_by_tick_trade_market_data_extension_fields_value; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick-by-Tick Trade Market Data Extension Fields set to where it lies, so a field read out of place says so */
inline ramp_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_record, tick_by_tick_trade_market_data_extension_fields_base) {
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> tick_by_tick_trade_market_data_extension_fields_record.bid_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] = (tick_by_tick_trade_market_data_extension_fields_base + 0 + tick_by_tick_trade_market_data_extension_fields_at + 1) % 256; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> tick_by_tick_trade_market_data_extension_fields_record.offer_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] = (tick_by_tick_trade_market_data_extension_fields_base + 18 + tick_by_tick_trade_market_data_extension_fields_at + 1) % 256; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> tick_by_tick_trade_market_data_extension_fields_record.tick_by_tick_trade_market_data_extension_fields_total_value_traded[tick_by_tick_trade_market_data_extension_fields_at] = (tick_by_tick_trade_market_data_extension_fields_base + 36 + tick_by_tick_trade_market_data_extension_fields_at + 1) % 256; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_record.trade_method = (tick_by_tick_trade_market_data_extension_fields_base + 44 + 1) % 256;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> tick_by_tick_trade_market_data_extension_fields_record.margin_price[tick_by_tick_trade_market_data_extension_fields_at] = (tick_by_tick_trade_market_data_extension_fields_base + 45 + tick_by_tick_trade_market_data_extension_fields_at + 1) % 256; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* Tick-by-Tick Trade Market Data Extension Fields to the wire, 53 bytes from where the cursor stands */
inline encode_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_record) {
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> wire[at] = tick_by_tick_trade_market_data_extension_fields_record.bid_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> wire[at] = tick_by_tick_trade_market_data_extension_fields_record.offer_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> wire[at] = tick_by_tick_trade_market_data_extension_fields_record.tick_by_tick_trade_market_data_extension_fields_total_value_traded[tick_by_tick_trade_market_data_extension_fields_at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  wire[at] = tick_by_tick_trade_market_data_extension_fields_record.trade_method; at = at + 1;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> wire[at] = tick_by_tick_trade_market_data_extension_fields_record.margin_price[tick_by_tick_trade_market_data_extension_fields_at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* Tick-by-Tick Trade Market Data Extension Fields off the wire, 53 bytes from where the cursor stands */
inline decode_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_record) {
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> tick_by_tick_trade_market_data_extension_fields_record.bid_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> tick_by_tick_trade_market_data_extension_fields_record.offer_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> tick_by_tick_trade_market_data_extension_fields_record.tick_by_tick_trade_market_data_extension_fields_total_value_traded[tick_by_tick_trade_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_record.trade_method = wire[at]; at = at + 1;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> tick_by_tick_trade_market_data_extension_fields_record.margin_price[tick_by_tick_trade_market_data_extension_fields_at] = wire[at]; at = at + 1; tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick-by-Tick Trade Market Data Extension Fields is what was written, byte for byte */
inline equal_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_read, tick_by_tick_trade_market_data_extension_fields_written) {
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> assert(tick_by_tick_trade_market_data_extension_fields_read.bid_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] == tick_by_tick_trade_market_data_extension_fields_written.bid_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at]); tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 18 -> assert(tick_by_tick_trade_market_data_extension_fields_read.offer_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at] == tick_by_tick_trade_market_data_extension_fields_written.offer_appl_seq_num[tick_by_tick_trade_market_data_extension_fields_at]); tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> assert(tick_by_tick_trade_market_data_extension_fields_read.tick_by_tick_trade_market_data_extension_fields_total_value_traded[tick_by_tick_trade_market_data_extension_fields_at] == tick_by_tick_trade_market_data_extension_fields_written.tick_by_tick_trade_market_data_extension_fields_total_value_traded[tick_by_tick_trade_market_data_extension_fields_at]); tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  assert(tick_by_tick_trade_market_data_extension_fields_read.trade_method == tick_by_tick_trade_market_data_extension_fields_written.trade_method);
  tick_by_tick_trade_market_data_extension_fields_at = 0;
  do
  :: tick_by_tick_trade_market_data_extension_fields_at < 8 -> assert(tick_by_tick_trade_market_data_extension_fields_read.margin_price[tick_by_tick_trade_market_data_extension_fields_at] == tick_by_tick_trade_market_data_extension_fields_written.margin_price[tick_by_tick_trade_market_data_extension_fields_at]); tick_by_tick_trade_market_data_extension_fields_at = tick_by_tick_trade_market_data_extension_fields_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Standard Trailer: 4 bytes ----------------------------------------------- */

/* The checksum is calculated from the start of the message header (header included) to the end of the message body. See Appendix 1 "Calculating the checksum" for sample code. */
typedef StandardTrailer {
  byte check_sum[4]
};

int standard_trailer_at;

/* every byte of Standard Trailer set to one value */
inline fill_standard_trailer(standard_trailer_record, standard_trailer_value) {
  standard_trailer_at = 0;
  do
  :: standard_trailer_at < 4 -> standard_trailer_record.check_sum[standard_trailer_at] = standard_trailer_value; standard_trailer_at = standard_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Standard Trailer set to where it lies, so a field read out of place says so */
inline ramp_standard_trailer(standard_trailer_record, standard_trailer_base) {
  standard_trailer_at = 0;
  do
  :: standard_trailer_at < 4 -> standard_trailer_record.check_sum[standard_trailer_at] = (standard_trailer_base + 0 + standard_trailer_at + 1) % 256; standard_trailer_at = standard_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Trailer to the wire, 4 bytes from where the cursor stands */
inline encode_standard_trailer(standard_trailer_record) {
  standard_trailer_at = 0;
  do
  :: standard_trailer_at < 4 -> wire[at] = standard_trailer_record.check_sum[standard_trailer_at]; at = at + 1; standard_trailer_at = standard_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Trailer off the wire, 4 bytes from where the cursor stands */
inline decode_standard_trailer(standard_trailer_record) {
  standard_trailer_at = 0;
  do
  :: standard_trailer_at < 4 -> standard_trailer_record.check_sum[standard_trailer_at] = wire[at]; at = at + 1; standard_trailer_at = standard_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Standard Trailer is what was written, byte for byte */
inline equal_standard_trailer(standard_trailer_read, standard_trailer_written) {
  standard_trailer_at = 0;
  do
  :: standard_trailer_at < 4 -> assert(standard_trailer_read.check_sum[standard_trailer_at] == standard_trailer_written.check_sum[standard_trailer_at]); standard_trailer_at = standard_trailer_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Standard Header: encoded, read back, and compared */
proctype check_standard_header() {
  StandardHeader standard_header_sent;
  StandardHeader standard_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_standard_header(standard_header_sent, 0)
  :: pattern == 1 -> fill_standard_header(standard_header_sent, 32)
  :: pattern == 2 -> fill_standard_header(standard_header_sent, 255)
  :: else -> ramp_standard_header(standard_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_standard_header(standard_header_sent);
    assert(at == 24);
    at = 0;
    decode_standard_header(standard_header_got);
    assert(at == 24);
    equal_standard_header(standard_header_got, standard_header_sent)
  }
}

/* Logon Message: encoded, read back, and compared */
proctype check_logon_message() {
  LogonMessage logon_message_sent;
  LogonMessage logon_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_message(logon_message_sent, 0)
  :: pattern == 1 -> fill_logon_message(logon_message_sent, 32)
  :: pattern == 2 -> fill_logon_message(logon_message_sent, 255)
  :: else -> ramp_logon_message(logon_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_message(logon_message_sent);
    assert(at == 74);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 74);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logout Message: encoded, read back, and compared */
proctype check_logout_message() {
  LogoutMessage logout_message_sent;
  LogoutMessage logout_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_message(logout_message_sent, 0)
  :: pattern == 1 -> fill_logout_message(logout_message_sent, 32)
  :: pattern == 2 -> fill_logout_message(logout_message_sent, 255)
  :: else -> ramp_logout_message(logout_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_message(logout_message_sent);
    assert(at == 260);
    at = 0;
    decode_logout_message(logout_message_got);
    assert(at == 260);
    equal_logout_message(logout_message_got, logout_message_sent)
  }
}

/* Channel Heartbeat: encoded, read back, and compared */
proctype check_channel_heartbeat() {
  ChannelHeartbeat channel_heartbeat_sent;
  ChannelHeartbeat channel_heartbeat_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_channel_heartbeat(channel_heartbeat_sent, 0)
  :: pattern == 1 -> fill_channel_heartbeat(channel_heartbeat_sent, 32)
  :: pattern == 2 -> fill_channel_heartbeat(channel_heartbeat_sent, 255)
  :: else -> ramp_channel_heartbeat(channel_heartbeat_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_channel_heartbeat(channel_heartbeat_sent);
    assert(at == 12);
    at = 0;
    decode_channel_heartbeat(channel_heartbeat_got);
    assert(at == 12);
    equal_channel_heartbeat(channel_heartbeat_got, channel_heartbeat_sent)
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

/* Market Status Message: encoded, read back, and compared */
proctype check_market_status_message() {
  MarketStatusMessage market_status_message_sent;
  MarketStatusMessage market_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_status_message(market_status_message_sent, 0)
  :: pattern == 1 -> fill_market_status_message(market_status_message_sent, 32)
  :: pattern == 2 -> fill_market_status_message(market_status_message_sent, 255)
  :: else -> ramp_market_status_message(market_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_status_message(market_status_message_sent);
    assert(at == 14);
    at = 0;
    decode_market_status_message(market_status_message_got);
    assert(at == 14);
    equal_market_status_message(market_status_message_got, market_status_message_sent)
  }
}

/* Tick-by-Tick Order Market Data Extension Fields: encoded, read back, and compared */
proctype check_tick_by_tick_order_market_data_extension_fields() {
  Tick_by_TickOrderMarketDataExtensionFields tick_by_tick_order_market_data_extension_fields_sent;
  Tick_by_TickOrderMarketDataExtensionFields tick_by_tick_order_market_data_extension_fields_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_sent, 0)
  :: pattern == 1 -> fill_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_sent, 32)
  :: pattern == 2 -> fill_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_sent, 255)
  :: else -> ramp_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_sent);
    assert(at == 139);
    at = 0;
    decode_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_got);
    assert(at == 139);
    equal_tick_by_tick_order_market_data_extension_fields(tick_by_tick_order_market_data_extension_fields_got, tick_by_tick_order_market_data_extension_fields_sent)
  }
}

/* Tick-by-Tick Trade Market Data Extension Fields: encoded, read back, and compared */
proctype check_tick_by_tick_trade_market_data_extension_fields() {
  Tick_by_TickTradeMarketDataExtensionFields tick_by_tick_trade_market_data_extension_fields_sent;
  Tick_by_TickTradeMarketDataExtensionFields tick_by_tick_trade_market_data_extension_fields_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_sent, 0)
  :: pattern == 1 -> fill_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_sent, 32)
  :: pattern == 2 -> fill_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_sent, 255)
  :: else -> ramp_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_sent);
    assert(at == 53);
    at = 0;
    decode_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_got);
    assert(at == 53);
    equal_tick_by_tick_trade_market_data_extension_fields(tick_by_tick_trade_market_data_extension_fields_got, tick_by_tick_trade_market_data_extension_fields_sent)
  }
}

/* Standard Trailer: encoded, read back, and compared */
proctype check_standard_trailer() {
  StandardTrailer standard_trailer_sent;
  StandardTrailer standard_trailer_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_standard_trailer(standard_trailer_sent, 0)
  :: pattern == 1 -> fill_standard_trailer(standard_trailer_sent, 32)
  :: pattern == 2 -> fill_standard_trailer(standard_trailer_sent, 255)
  :: else -> ramp_standard_trailer(standard_trailer_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_standard_trailer(standard_trailer_sent);
    assert(at == 4);
    at = 0;
    decode_standard_trailer(standard_trailer_got);
    assert(at == 4);
    equal_standard_trailer(standard_trailer_got, standard_trailer_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_standard_header()
  :: run check_logon_message()
  :: run check_logout_message()
  :: run check_channel_heartbeat()
  :: run check_retransmission_message()
  :: run check_market_status_message()
  :: run check_tick_by_tick_order_market_data_extension_fields()
  :: run check_tick_by_tick_trade_market_data_extension_fields()
  :: run check_standard_trailer()
  fi
}
