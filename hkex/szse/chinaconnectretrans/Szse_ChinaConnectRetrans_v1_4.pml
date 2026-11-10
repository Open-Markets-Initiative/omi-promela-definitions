/*
 * Hong Kong Exchanges and Clearing Orion Market Data China Connect Retransmission
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 216

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Omd packet header (byte-identical to the Udp form; SeqNum and SendTime set to 0 on Tcp per §3.5) */
typedef PacketHeader {
  byte pkt_size[2];
  byte msg_count;
  byte filler;
  byte seq_num[4];
  byte send_time[8]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = packet_header_value;
  packet_header_record.filler = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.filler = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.pkt_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.msg_count; at = at + 1;
  wire[at] = packet_header_record.filler; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.send_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.msg_count = wire[at]; at = at + 1;
  packet_header_record.filler = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.send_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.pkt_size[packet_header_at] == packet_header_written.pkt_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.msg_count == packet_header_written.msg_count);
  assert(packet_header_read.filler == packet_header_written.filler);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.seq_num[packet_header_at] == packet_header_written.seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.send_time[packet_header_at] == packet_header_written.send_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Msg Header: 4 bytes ----------------------------------------------------- */

/* Omd message header */
typedef MsgHeader {
  byte msg_size[2];
  byte msg_type[2]
};

int msg_header_at;

/* every byte of Msg Header set to one value */
inline fill_msg_header(msg_header_record, msg_header_value) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = msg_header_value; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Msg Header set to where it lies, so a field read out of place says so */
inline ramp_msg_header(msg_header_record, msg_header_base) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = (msg_header_base + 0 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = (msg_header_base + 2 + msg_header_at + 1) % 256; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header to the wire, 4 bytes from where the cursor stands */
inline encode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_size[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> wire[at] = msg_header_record.msg_type[msg_header_at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* Msg Header off the wire, 4 bytes from where the cursor stands */
inline decode_msg_header(msg_header_record) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_size[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> msg_header_record.msg_type[msg_header_at] = wire[at]; at = at + 1; msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Msg Header is what was written, byte for byte */
inline equal_msg_header(msg_header_read, msg_header_written) {
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_size[msg_header_at] == msg_header_written.msg_size[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  msg_header_at = 0;
  do
  :: msg_header_at < 2 -> assert(msg_header_read.msg_type[msg_header_at] == msg_header_written.msg_type[msg_header_at]); msg_header_at = msg_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset Message: 4 bytes ----------------------------------------- */

/* The Sequence Reset message is sent on each multicast channel at start of day. The client must ignore the sequence number of the Sequence Reset message itself, and set the next expected sequence number to NewSeqNo. On receipt clients must clear all cached data for all eligible instruments traded in SSE and SZSE and then subscribe to the refresh channels. */
typedef SequenceResetMessage {
  byte new_seq_no[4]
};

int sequence_reset_message_at;

/* every byte of Sequence Reset Message set to one value */
inline fill_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_value) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = sequence_reset_message_value; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_reset_message(sequence_reset_message_record, sequence_reset_message_base) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = (sequence_reset_message_base + 0 + sequence_reset_message_at + 1) % 256; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> wire[at] = sequence_reset_message_record.new_seq_no[sequence_reset_message_at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Reset Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_reset_message(sequence_reset_message_record) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> sequence_reset_message_record.new_seq_no[sequence_reset_message_at] = wire[at]; at = at + 1; sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Reset Message is what was written, byte for byte */
inline equal_sequence_reset_message(sequence_reset_message_read, sequence_reset_message_written) {
  sequence_reset_message_at = 0;
  do
  :: sequence_reset_message_at < 4 -> assert(sequence_reset_message_read.new_seq_no[sequence_reset_message_at] == sequence_reset_message_written.new_seq_no[sequence_reset_message_at]); sequence_reset_message_at = sequence_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disaster Recovery Signal Message: 4 bytes ------------------------------- */

/* The Disaster Recovery (DR) Signal message is sent on a dedicated multicast channel whenever site failover is triggered. */
typedef DisasterRecoverySignalMessage {
  byte dr_status[4]
};

int disaster_recovery_signal_message_at;

/* every byte of Disaster Recovery Signal Message set to one value */
inline fill_disaster_recovery_signal_message(disaster_recovery_signal_message_record, disaster_recovery_signal_message_value) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = disaster_recovery_signal_message_value; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disaster Recovery Signal Message set to where it lies, so a field read out of place says so */
inline ramp_disaster_recovery_signal_message(disaster_recovery_signal_message_record, disaster_recovery_signal_message_base) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = (disaster_recovery_signal_message_base + 0 + disaster_recovery_signal_message_at + 1) % 256; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Signal Message to the wire, 4 bytes from where the cursor stands */
inline encode_disaster_recovery_signal_message(disaster_recovery_signal_message_record) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> wire[at] = disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at]; at = at + 1; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Signal Message off the wire, 4 bytes from where the cursor stands */
inline decode_disaster_recovery_signal_message(disaster_recovery_signal_message_record) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> disaster_recovery_signal_message_record.dr_status[disaster_recovery_signal_message_at] = wire[at]; at = at + 1; disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disaster Recovery Signal Message is what was written, byte for byte */
inline equal_disaster_recovery_signal_message(disaster_recovery_signal_message_read, disaster_recovery_signal_message_written) {
  disaster_recovery_signal_message_at = 0;
  do
  :: disaster_recovery_signal_message_at < 4 -> assert(disaster_recovery_signal_message_read.dr_status[disaster_recovery_signal_message_at] == disaster_recovery_signal_message_written.dr_status[disaster_recovery_signal_message_at]); disaster_recovery_signal_message_at = disaster_recovery_signal_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Definition Message: 36 bytes ------------------------------------- */

/* The Market Definition message is generated at the start of the business day for each market (SSE or SZSE). Market Definition messages for different markets are sent via different channels. */
typedef MarketDefinitionMessage {
  byte market_code[4];
  byte market_name[25];
  byte currency_code[3];
  byte number_of_securities[4]
};

int market_definition_message_at;

/* every byte of Market Definition Message set to one value */
inline fill_market_definition_message(market_definition_message_record, market_definition_message_value) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = market_definition_message_value; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Definition Message set to where it lies, so a field read out of place says so */
inline ramp_market_definition_message(market_definition_message_record, market_definition_message_base) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = (market_definition_message_base + 0 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = (market_definition_message_base + 4 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = (market_definition_message_base + 29 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = (market_definition_message_base + 32 + market_definition_message_at + 1) % 256; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Definition Message to the wire, 36 bytes from where the cursor stands */
inline encode_market_definition_message(market_definition_message_record) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> wire[at] = market_definition_message_record.market_code[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> wire[at] = market_definition_message_record.market_name[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> wire[at] = market_definition_message_record.currency_code[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> wire[at] = market_definition_message_record.number_of_securities[market_definition_message_at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Definition Message off the wire, 36 bytes from where the cursor stands */
inline decode_market_definition_message(market_definition_message_record) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.market_code[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> market_definition_message_record.market_name[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> market_definition_message_record.currency_code[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> market_definition_message_record.number_of_securities[market_definition_message_at] = wire[at]; at = at + 1; market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Definition Message is what was written, byte for byte */
inline equal_market_definition_message(market_definition_message_read, market_definition_message_written) {
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> assert(market_definition_message_read.market_code[market_definition_message_at] == market_definition_message_written.market_code[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 25 -> assert(market_definition_message_read.market_name[market_definition_message_at] == market_definition_message_written.market_name[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 3 -> assert(market_definition_message_read.currency_code[market_definition_message_at] == market_definition_message_written.currency_code[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  market_definition_message_at = 0;
  do
  :: market_definition_message_at < 4 -> assert(market_definition_message_read.number_of_securities[market_definition_message_at] == market_definition_message_written.number_of_securities[market_definition_message_at]); market_definition_message_at = market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Message: 12 bytes ------------------------------------------------- */

/* The Logon message enables client authentication. Not required for multicast channels; only used for retransmission requests. Client sends Logon containing username to OMD-CC which responds with Logon Response. */
typedef LogonMessage {
  byte username[12]
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> logon_message_record.username[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> logon_message_record.username[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message to the wire, 12 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> wire[at] = logon_message_record.username[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message off the wire, 12 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> logon_message_record.username[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 12 -> assert(logon_message_read.username[logon_message_at] == logon_message_written.username[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Response Message: 4 bytes ----------------------------------------- */

/* Response to a Logon request indicating session status. */
typedef LogonResponseMessage {
  byte session_status;
  byte filler_3[3]
};

int logon_response_message_at;

/* every byte of Logon Response Message set to one value */
inline fill_logon_response_message(logon_response_message_record, logon_response_message_value) {
  logon_response_message_record.session_status = logon_response_message_value;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_3[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Response Message set to where it lies, so a field read out of place says so */
inline ramp_logon_response_message(logon_response_message_record, logon_response_message_base) {
  logon_response_message_record.session_status = (logon_response_message_base + 0 + 1) % 256;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_3[logon_response_message_at] = (logon_response_message_base + 1 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message to the wire, 4 bytes from where the cursor stands */
inline encode_logon_response_message(logon_response_message_record) {
  wire[at] = logon_response_message_record.session_status; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> wire[at] = logon_response_message_record.filler_3[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message off the wire, 4 bytes from where the cursor stands */
inline decode_logon_response_message(logon_response_message_record) {
  logon_response_message_record.session_status = wire[at]; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_3[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Response Message is what was written, byte for byte */
inline equal_logon_response_message(logon_response_message_read, logon_response_message_written) {
  assert(logon_response_message_read.session_status == logon_response_message_written.session_status);
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> assert(logon_response_message_read.filler_3[logon_response_message_at] == logon_response_message_written.filler_3[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request Message: 12 bytes -------------------------------- */

/* Client-initiated request to retransmit a range of messages from a specific multicast channel. */
typedef RetransmissionRequestMessage {
  byte channel_id[2];
  byte filler_2[2];
  byte begin_seq_num[4];
  byte end_seq_num[4]
};

int retransmission_request_message_at;

/* every byte of Retransmission Request Message set to one value */
inline fill_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_value) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_2[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_base) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = (retransmission_request_message_base + 0 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_2[retransmission_request_message_at] = (retransmission_request_message_base + 2 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 4 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 8 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> wire[at] = retransmission_request_message_record.channel_id[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> wire[at] = retransmission_request_message_record.filler_2[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.begin_seq_num[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.end_seq_num[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.channel_id[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_2[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request Message is what was written, byte for byte */
inline equal_retransmission_request_message(retransmission_request_message_read, retransmission_request_message_written) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> assert(retransmission_request_message_read.channel_id[retransmission_request_message_at] == retransmission_request_message_written.channel_id[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 2 -> assert(retransmission_request_message_read.filler_2[retransmission_request_message_at] == retransmission_request_message_written.filler_2[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.begin_seq_num[retransmission_request_message_at] == retransmission_request_message_written.begin_seq_num[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.end_seq_num[retransmission_request_message_at] == retransmission_request_message_written.end_seq_num[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Response Message: 12 bytes ------------------------------- */

/* Server response to a Retransmission Request indicating whether the range can be resent. */
typedef RetransmissionResponseMessage {
  byte channel_id[2];
  byte retrans_status;
  byte filler_1;
  byte begin_seq_num[4];
  byte end_seq_num[4]
};

int retransmission_response_message_at;

/* every byte of Retransmission Response Message set to one value */
inline fill_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_value) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retrans_status = retransmission_response_message_value;
  retransmission_response_message_record.filler_1 = retransmission_response_message_value;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.begin_seq_num[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.end_seq_num[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Response Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_base) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = (retransmission_response_message_base + 0 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retrans_status = (retransmission_response_message_base + 2 + 1) % 256;
  retransmission_response_message_record.filler_1 = (retransmission_response_message_base + 3 + 1) % 256;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.begin_seq_num[retransmission_response_message_at] = (retransmission_response_message_base + 4 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.end_seq_num[retransmission_response_message_at] = (retransmission_response_message_base + 8 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Response Message to the wire, 12 bytes from where the cursor stands */
inline encode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> wire[at] = retransmission_response_message_record.channel_id[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_response_message_record.retrans_status; at = at + 1;
  wire[at] = retransmission_response_message_record.filler_1; at = at + 1;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.begin_seq_num[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.end_seq_num[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Response Message off the wire, 12 bytes from where the cursor stands */
inline decode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> retransmission_response_message_record.channel_id[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retrans_status = wire[at]; at = at + 1;
  retransmission_response_message_record.filler_1 = wire[at]; at = at + 1;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.begin_seq_num[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.end_seq_num[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Response Message is what was written, byte for byte */
inline equal_retransmission_response_message(retransmission_response_message_read, retransmission_response_message_written) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 2 -> assert(retransmission_response_message_read.channel_id[retransmission_response_message_at] == retransmission_response_message_written.channel_id[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  assert(retransmission_response_message_read.retrans_status == retransmission_response_message_written.retrans_status);
  assert(retransmission_response_message_read.filler_1 == retransmission_response_message_written.filler_1);
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.begin_seq_num[retransmission_response_message_at] == retransmission_response_message_written.begin_seq_num[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.end_seq_num[retransmission_response_message_at] == retransmission_response_message_written.end_seq_num[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Definition Message: 216 bytes ---------------------------------- */

/* The Security Definition message contains all the reference data for a security. Security Definition messages for different markets (SSE and SZSE) are sent via different channels. */
typedef SecurityDefinitionMessage {
  byte security_code[4];
  byte market_code[4];
  byte isin_code[12];
  byte instrument_type[4];
  byte filler_2[2];
  byte security_short_name[40];
  byte currency_code[3];
  byte filler_60[60];
  byte security_name_gb[60];
  byte lot_size[4];
  byte previous_closing_price[4];
  byte filler_1;
  byte shortsell_flag;
  byte filler_6[6];
  byte listing_date[4];
  byte filler_7[7]
};

int security_definition_message_at;

/* every byte of Security Definition Message set to one value */
inline fill_security_definition_message(security_definition_message_record, security_definition_message_value) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.security_code[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.market_code[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> security_definition_message_record.isin_code[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.instrument_type[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> security_definition_message_record.filler_2[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 40 -> security_definition_message_record.security_short_name[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> security_definition_message_record.currency_code[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> security_definition_message_record.filler_60[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> security_definition_message_record.security_name_gb[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.lot_size[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.previous_closing_price[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_record.filler_1 = security_definition_message_value;
  security_definition_message_record.shortsell_flag = security_definition_message_value;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> security_definition_message_record.filler_6[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.listing_date[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 7 -> security_definition_message_record.filler_7[security_definition_message_at] = security_definition_message_value; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Definition Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_message(security_definition_message_record, security_definition_message_base) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.security_code[security_definition_message_at] = (security_definition_message_base + 0 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.market_code[security_definition_message_at] = (security_definition_message_base + 4 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> security_definition_message_record.isin_code[security_definition_message_at] = (security_definition_message_base + 8 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.instrument_type[security_definition_message_at] = (security_definition_message_base + 20 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> security_definition_message_record.filler_2[security_definition_message_at] = (security_definition_message_base + 24 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 40 -> security_definition_message_record.security_short_name[security_definition_message_at] = (security_definition_message_base + 26 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> security_definition_message_record.currency_code[security_definition_message_at] = (security_definition_message_base + 66 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> security_definition_message_record.filler_60[security_definition_message_at] = (security_definition_message_base + 69 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> security_definition_message_record.security_name_gb[security_definition_message_at] = (security_definition_message_base + 129 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.lot_size[security_definition_message_at] = (security_definition_message_base + 189 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.previous_closing_price[security_definition_message_at] = (security_definition_message_base + 193 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_record.filler_1 = (security_definition_message_base + 197 + 1) % 256;
  security_definition_message_record.shortsell_flag = (security_definition_message_base + 198 + 1) % 256;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> security_definition_message_record.filler_6[security_definition_message_at] = (security_definition_message_base + 199 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.listing_date[security_definition_message_at] = (security_definition_message_base + 205 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 7 -> security_definition_message_record.filler_7[security_definition_message_at] = (security_definition_message_base + 209 + security_definition_message_at + 1) % 256; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Message to the wire, 216 bytes from where the cursor stands */
inline encode_security_definition_message(security_definition_message_record) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> wire[at] = security_definition_message_record.security_code[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> wire[at] = security_definition_message_record.market_code[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> wire[at] = security_definition_message_record.isin_code[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> wire[at] = security_definition_message_record.instrument_type[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> wire[at] = security_definition_message_record.filler_2[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 40 -> wire[at] = security_definition_message_record.security_short_name[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> wire[at] = security_definition_message_record.currency_code[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> wire[at] = security_definition_message_record.filler_60[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> wire[at] = security_definition_message_record.security_name_gb[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> wire[at] = security_definition_message_record.lot_size[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> wire[at] = security_definition_message_record.previous_closing_price[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_message_record.filler_1; at = at + 1;
  wire[at] = security_definition_message_record.shortsell_flag; at = at + 1;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> wire[at] = security_definition_message_record.filler_6[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> wire[at] = security_definition_message_record.listing_date[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 7 -> wire[at] = security_definition_message_record.filler_7[security_definition_message_at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Message off the wire, 216 bytes from where the cursor stands */
inline decode_security_definition_message(security_definition_message_record) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.security_code[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.market_code[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> security_definition_message_record.isin_code[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.instrument_type[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> security_definition_message_record.filler_2[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 40 -> security_definition_message_record.security_short_name[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> security_definition_message_record.currency_code[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> security_definition_message_record.filler_60[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> security_definition_message_record.security_name_gb[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.lot_size[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.previous_closing_price[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_record.filler_1 = wire[at]; at = at + 1;
  security_definition_message_record.shortsell_flag = wire[at]; at = at + 1;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> security_definition_message_record.filler_6[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> security_definition_message_record.listing_date[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 7 -> security_definition_message_record.filler_7[security_definition_message_at] = wire[at]; at = at + 1; security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Definition Message is what was written, byte for byte */
inline equal_security_definition_message(security_definition_message_read, security_definition_message_written) {
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> assert(security_definition_message_read.security_code[security_definition_message_at] == security_definition_message_written.security_code[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> assert(security_definition_message_read.market_code[security_definition_message_at] == security_definition_message_written.market_code[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 12 -> assert(security_definition_message_read.isin_code[security_definition_message_at] == security_definition_message_written.isin_code[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> assert(security_definition_message_read.instrument_type[security_definition_message_at] == security_definition_message_written.instrument_type[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 2 -> assert(security_definition_message_read.filler_2[security_definition_message_at] == security_definition_message_written.filler_2[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 40 -> assert(security_definition_message_read.security_short_name[security_definition_message_at] == security_definition_message_written.security_short_name[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 3 -> assert(security_definition_message_read.currency_code[security_definition_message_at] == security_definition_message_written.currency_code[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> assert(security_definition_message_read.filler_60[security_definition_message_at] == security_definition_message_written.filler_60[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 60 -> assert(security_definition_message_read.security_name_gb[security_definition_message_at] == security_definition_message_written.security_name_gb[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> assert(security_definition_message_read.lot_size[security_definition_message_at] == security_definition_message_written.lot_size[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> assert(security_definition_message_read.previous_closing_price[security_definition_message_at] == security_definition_message_written.previous_closing_price[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  assert(security_definition_message_read.filler_1 == security_definition_message_written.filler_1);
  assert(security_definition_message_read.shortsell_flag == security_definition_message_written.shortsell_flag);
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 6 -> assert(security_definition_message_read.filler_6[security_definition_message_at] == security_definition_message_written.filler_6[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 4 -> assert(security_definition_message_read.listing_date[security_definition_message_at] == security_definition_message_written.listing_date[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  security_definition_message_at = 0;
  do
  :: security_definition_message_at < 7 -> assert(security_definition_message_read.filler_7[security_definition_message_at] == security_definition_message_written.filler_7[security_definition_message_at]); security_definition_message_at = security_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Status Message: 16 bytes --------------------------------------- */

/* The Security Status message is generated at the start of the business day if the security is halted, and whenever a security state or trading phase changes. Security Status messages for different markets (SSE and SZSE) are sent via different channels. */
typedef SecurityStatusMessage {
  byte security_code[4];
  byte security_trading_status;
  byte filler_3[3];
  byte trading_phase_code[8]
};

int security_status_message_at;

/* every byte of Security Status Message set to one value */
inline fill_security_status_message(security_status_message_record, security_status_message_value) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_trading_status = security_status_message_value;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.trading_phase_code[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Status Message set to where it lies, so a field read out of place says so */
inline ramp_security_status_message(security_status_message_record, security_status_message_base) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = (security_status_message_base + 0 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_trading_status = (security_status_message_base + 4 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = (security_status_message_base + 5 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.trading_phase_code[security_status_message_at] = (security_status_message_base + 8 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.security_code[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.security_trading_status; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> wire[at] = security_status_message_record.filler_3[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> wire[at] = security_status_message_record.trading_phase_code[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_trading_status = wire[at]; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> security_status_message_record.filler_3[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.trading_phase_code[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Status Message is what was written, byte for byte */
inline equal_security_status_message(security_status_message_read, security_status_message_written) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.security_code[security_status_message_at] == security_status_message_written.security_code[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.security_trading_status == security_status_message_written.security_trading_status);
  security_status_message_at = 0;
  do
  :: security_status_message_at < 3 -> assert(security_status_message_read.filler_3[security_status_message_at] == security_status_message_written.filler_3[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> assert(security_status_message_read.trading_phase_code[security_status_message_at] == security_status_message_written.trading_phase_code[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Message: 48 bytes -------------------------------------------- */

/* The Statistics message provides statistics including turnover. Statistics messages for different markets (SSE and SZSE) are sent via different channels. */
typedef StatisticsMessage {
  byte security_code[4];
  byte shares_traded[8];
  byte turnover[8];
  byte high_price[4];
  byte low_price[4];
  byte last_price[4];
  byte opening_price[4];
  byte filler_12[12]
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.opening_price[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 12 -> statistics_message_record.filler_12[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = (statistics_message_base + 4 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = (statistics_message_base + 12 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = (statistics_message_base + 20 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = (statistics_message_base + 24 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = (statistics_message_base + 28 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.opening_price[statistics_message_at] = (statistics_message_base + 32 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 12 -> statistics_message_record.filler_12[statistics_message_at] = (statistics_message_base + 36 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message to the wire, 48 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.security_code[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.shares_traded[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.turnover[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.high_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.low_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.last_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.opening_price[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 12 -> wire[at] = statistics_message_record.filler_12[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message off the wire, 48 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.security_code[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.shares_traded[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.high_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.low_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.last_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.opening_price[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 12 -> statistics_message_record.filler_12[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.security_code[statistics_message_at] == statistics_message_written.security_code[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.shares_traded[statistics_message_at] == statistics_message_written.shares_traded[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.turnover[statistics_message_at] == statistics_message_written.turnover[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.high_price[statistics_message_at] == statistics_message_written.high_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.low_price[statistics_message_at] == statistics_message_written.low_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.last_price[statistics_message_at] == statistics_message_written.last_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.opening_price[statistics_message_at] == statistics_message_written.opening_price[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 12 -> assert(statistics_message_read.filler_12[statistics_message_at] == statistics_message_written.filler_12[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Of Book Message: 36 bytes ------------------------------------------- */

/* The Top Of Book (TOB) message is generated when the top price level has been modified. TOB messages for different markets (SSE and SZSE) are sent via different channels. */
typedef TopOfBookMessage {
  byte security_code[4];
  byte aggregate_bid_quantity[8];
  byte aggregate_ask_quantity[8];
  byte bid_price[4];
  byte ask_price[4];
  byte filler_8[8]
};

int top_of_book_message_at;

/* every byte of Top Of Book Message set to one value */
inline fill_top_of_book_message(top_of_book_message_record, top_of_book_message_value) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.security_code[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.aggregate_bid_quantity[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.aggregate_ask_quantity[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_price[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_price[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.filler_8[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Top Of Book Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_book_message(top_of_book_message_record, top_of_book_message_base) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.security_code[top_of_book_message_at] = (top_of_book_message_base + 0 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.aggregate_bid_quantity[top_of_book_message_at] = (top_of_book_message_base + 4 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.aggregate_ask_quantity[top_of_book_message_at] = (top_of_book_message_base + 12 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_price[top_of_book_message_at] = (top_of_book_message_base + 20 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_price[top_of_book_message_at] = (top_of_book_message_base + 24 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.filler_8[top_of_book_message_at] = (top_of_book_message_base + 28 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message to the wire, 36 bytes from where the cursor stands */
inline encode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.security_code[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.aggregate_bid_quantity[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.aggregate_ask_quantity[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.bid_price[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.ask_price[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.filler_8[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message off the wire, 36 bytes from where the cursor stands */
inline decode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.security_code[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.aggregate_bid_quantity[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.aggregate_ask_quantity[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_price[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_price[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.filler_8[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Top Of Book Message is what was written, byte for byte */
inline equal_top_of_book_message(top_of_book_message_read, top_of_book_message_written) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.security_code[top_of_book_message_at] == top_of_book_message_written.security_code[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.aggregate_bid_quantity[top_of_book_message_at] == top_of_book_message_written.aggregate_bid_quantity[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.aggregate_ask_quantity[top_of_book_message_at] == top_of_book_message_written.aggregate_ask_quantity[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.bid_price[top_of_book_message_at] == top_of_book_message_written.bid_price[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.ask_price[top_of_book_message_at] == top_of_book_message_written.ask_price[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.filler_8[top_of_book_message_at] == top_of_book_message_written.filler_8[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Packet Header: encoded, read back, and compared */
proctype check_packet_header() {
  PacketHeader packet_header_sent;
  PacketHeader packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet_header(packet_header_sent, 0)
  :: pattern == 1 -> fill_packet_header(packet_header_sent, 32)
  :: pattern == 2 -> fill_packet_header(packet_header_sent, 255)
  :: else -> ramp_packet_header(packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet_header(packet_header_sent);
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
    equal_packet_header(packet_header_got, packet_header_sent)
  }
}

/* Msg Header: encoded, read back, and compared */
proctype check_msg_header() {
  MsgHeader msg_header_sent;
  MsgHeader msg_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_msg_header(msg_header_sent, 0)
  :: pattern == 1 -> fill_msg_header(msg_header_sent, 32)
  :: pattern == 2 -> fill_msg_header(msg_header_sent, 255)
  :: else -> ramp_msg_header(msg_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_msg_header(msg_header_sent);
    assert(at == 4);
    at = 0;
    decode_msg_header(msg_header_got);
    assert(at == 4);
    equal_msg_header(msg_header_got, msg_header_sent)
  }
}

/* Sequence Reset Message: encoded, read back, and compared */
proctype check_sequence_reset_message() {
  SequenceResetMessage sequence_reset_message_sent;
  SequenceResetMessage sequence_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_reset_message(sequence_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_reset_message(sequence_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_reset_message(sequence_reset_message_sent, 255)
  :: else -> ramp_sequence_reset_message(sequence_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_reset_message(sequence_reset_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_reset_message(sequence_reset_message_got);
    assert(at == 4);
    equal_sequence_reset_message(sequence_reset_message_got, sequence_reset_message_sent)
  }
}

/* Disaster Recovery Signal Message: encoded, read back, and compared */
proctype check_disaster_recovery_signal_message() {
  DisasterRecoverySignalMessage disaster_recovery_signal_message_sent;
  DisasterRecoverySignalMessage disaster_recovery_signal_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 0)
  :: pattern == 1 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 32)
  :: pattern == 2 -> fill_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 255)
  :: else -> ramp_disaster_recovery_signal_message(disaster_recovery_signal_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disaster_recovery_signal_message(disaster_recovery_signal_message_sent);
    assert(at == 4);
    at = 0;
    decode_disaster_recovery_signal_message(disaster_recovery_signal_message_got);
    assert(at == 4);
    equal_disaster_recovery_signal_message(disaster_recovery_signal_message_got, disaster_recovery_signal_message_sent)
  }
}

/* Market Definition Message: encoded, read back, and compared */
proctype check_market_definition_message() {
  MarketDefinitionMessage market_definition_message_sent;
  MarketDefinitionMessage market_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_definition_message(market_definition_message_sent, 0)
  :: pattern == 1 -> fill_market_definition_message(market_definition_message_sent, 32)
  :: pattern == 2 -> fill_market_definition_message(market_definition_message_sent, 255)
  :: else -> ramp_market_definition_message(market_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_definition_message(market_definition_message_sent);
    assert(at == 36);
    at = 0;
    decode_market_definition_message(market_definition_message_got);
    assert(at == 36);
    equal_market_definition_message(market_definition_message_got, market_definition_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 12);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Response Message: encoded, read back, and compared */
proctype check_logon_response_message() {
  LogonResponseMessage logon_response_message_sent;
  LogonResponseMessage logon_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_response_message(logon_response_message_sent, 0)
  :: pattern == 1 -> fill_logon_response_message(logon_response_message_sent, 32)
  :: pattern == 2 -> fill_logon_response_message(logon_response_message_sent, 255)
  :: else -> ramp_logon_response_message(logon_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_response_message(logon_response_message_sent);
    assert(at == 4);
    at = 0;
    decode_logon_response_message(logon_response_message_got);
    assert(at == 4);
    equal_logon_response_message(logon_response_message_got, logon_response_message_sent)
  }
}

/* Retransmission Request Message: encoded, read back, and compared */
proctype check_retransmission_request_message() {
  RetransmissionRequestMessage retransmission_request_message_sent;
  RetransmissionRequestMessage retransmission_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request_message(retransmission_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_request_message(retransmission_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_request_message(retransmission_request_message_sent, 255)
  :: else -> ramp_retransmission_request_message(retransmission_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request_message(retransmission_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_retransmission_request_message(retransmission_request_message_got);
    assert(at == 12);
    equal_retransmission_request_message(retransmission_request_message_got, retransmission_request_message_sent)
  }
}

/* Retransmission Response Message: encoded, read back, and compared */
proctype check_retransmission_response_message() {
  RetransmissionResponseMessage retransmission_response_message_sent;
  RetransmissionResponseMessage retransmission_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_response_message(retransmission_response_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_response_message(retransmission_response_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_response_message(retransmission_response_message_sent, 255)
  :: else -> ramp_retransmission_response_message(retransmission_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_response_message(retransmission_response_message_sent);
    assert(at == 12);
    at = 0;
    decode_retransmission_response_message(retransmission_response_message_got);
    assert(at == 12);
    equal_retransmission_response_message(retransmission_response_message_got, retransmission_response_message_sent)
  }
}

/* Security Definition Message: encoded, read back, and compared */
proctype check_security_definition_message() {
  SecurityDefinitionMessage security_definition_message_sent;
  SecurityDefinitionMessage security_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_message(security_definition_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_message(security_definition_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_message(security_definition_message_sent, 255)
  :: else -> ramp_security_definition_message(security_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_message(security_definition_message_sent);
    assert(at == 216);
    at = 0;
    decode_security_definition_message(security_definition_message_got);
    assert(at == 216);
    equal_security_definition_message(security_definition_message_got, security_definition_message_sent)
  }
}

/* Security Status Message: encoded, read back, and compared */
proctype check_security_status_message() {
  SecurityStatusMessage security_status_message_sent;
  SecurityStatusMessage security_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_status_message(security_status_message_sent, 0)
  :: pattern == 1 -> fill_security_status_message(security_status_message_sent, 32)
  :: pattern == 2 -> fill_security_status_message(security_status_message_sent, 255)
  :: else -> ramp_security_status_message(security_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_status_message(security_status_message_sent);
    assert(at == 16);
    at = 0;
    decode_security_status_message(security_status_message_got);
    assert(at == 16);
    equal_security_status_message(security_status_message_got, security_status_message_sent)
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
    assert(at == 48);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 48);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
  }
}

/* Top Of Book Message: encoded, read back, and compared */
proctype check_top_of_book_message() {
  TopOfBookMessage top_of_book_message_sent;
  TopOfBookMessage top_of_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_book_message(top_of_book_message_sent, 0)
  :: pattern == 1 -> fill_top_of_book_message(top_of_book_message_sent, 32)
  :: pattern == 2 -> fill_top_of_book_message(top_of_book_message_sent, 255)
  :: else -> ramp_top_of_book_message(top_of_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_book_message(top_of_book_message_sent);
    assert(at == 36);
    at = 0;
    decode_top_of_book_message(top_of_book_message_got);
    assert(at == 36);
    equal_top_of_book_message(top_of_book_message_got, top_of_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_msg_header()
  :: run check_sequence_reset_message()
  :: run check_disaster_recovery_signal_message()
  :: run check_market_definition_message()
  :: run check_logon_message()
  :: run check_logon_response_message()
  :: run check_retransmission_request_message()
  :: run check_retransmission_response_message()
  :: run check_security_definition_message()
  :: run check_security_status_message()
  :: run check_statistics_message()
  :: run check_top_of_book_message()
  fi
}
