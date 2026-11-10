/*
 * The London Metal Exchange LMEsource Level3 Retransmission
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 68

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* LMEsource packet header, giving the packet size, the number of messages it carries, the sequence number of the first of them and the time the packet was sent */
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

/* ---- Message Header: 4 bytes ------------------------------------------------- */

/* LMEsource message header, giving the size of the message and its type */
typedef MessageHeader {
  byte msg_size[2];
  byte msg_type[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.msg_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.msg_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.msg_size[message_header_at] == message_header_written.msg_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.msg_type[message_header_at] == message_header_written.msg_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Reset Message: 4 bytes ----------------------------------------- */

/* Sent on each multicast channel at start of day, and intraday in case of a disaster recovery. The client must ignore the sequence number of the Sequence Reset message itself and set the next expected sequence number to NewSeqNo, clear all cached data for all instruments and subscribe to the refresh channels to receive the current state of the market. */
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

/* ---- Market State Contract Message: 42 bytes --------------------------------- */

/* Indicates the trading state of instruments at the contract level, for example Copper Futures or Aluminium Options. The ContractCode field is common across the Market State - Contract, Outright Definition and Strategy Definition messages and links the contract state to individual tradable instruments. */
typedef MarketStateContractMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte contract_code[12];
  byte trading_state;
  byte start_time[8];
  byte end_time[8];
  byte trading_state_condition;
  byte filler_string_2[2]
};

int market_state_contract_message_at;

/* every byte of Market State Contract Message set to one value */
inline fill_market_state_contract_message(market_state_contract_message_record, market_state_contract_message_value) {
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> market_state_contract_message_record.trading_venue[market_state_contract_message_at] = market_state_contract_message_value; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.time_of_event[market_state_contract_message_at] = market_state_contract_message_value; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 12 -> market_state_contract_message_record.contract_code[market_state_contract_message_at] = market_state_contract_message_value; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_record.trading_state = market_state_contract_message_value;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.start_time[market_state_contract_message_at] = market_state_contract_message_value; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.end_time[market_state_contract_message_at] = market_state_contract_message_value; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_record.trading_state_condition = market_state_contract_message_value;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> market_state_contract_message_record.filler_string_2[market_state_contract_message_at] = market_state_contract_message_value; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market State Contract Message set to where it lies, so a field read out of place says so */
inline ramp_market_state_contract_message(market_state_contract_message_record, market_state_contract_message_base) {
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> market_state_contract_message_record.trading_venue[market_state_contract_message_at] = (market_state_contract_message_base + 0 + market_state_contract_message_at + 1) % 256; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.time_of_event[market_state_contract_message_at] = (market_state_contract_message_base + 2 + market_state_contract_message_at + 1) % 256; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 12 -> market_state_contract_message_record.contract_code[market_state_contract_message_at] = (market_state_contract_message_base + 10 + market_state_contract_message_at + 1) % 256; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_record.trading_state = (market_state_contract_message_base + 22 + 1) % 256;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.start_time[market_state_contract_message_at] = (market_state_contract_message_base + 23 + market_state_contract_message_at + 1) % 256; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.end_time[market_state_contract_message_at] = (market_state_contract_message_base + 31 + market_state_contract_message_at + 1) % 256; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_record.trading_state_condition = (market_state_contract_message_base + 39 + 1) % 256;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> market_state_contract_message_record.filler_string_2[market_state_contract_message_at] = (market_state_contract_message_base + 40 + market_state_contract_message_at + 1) % 256; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Contract Message to the wire, 42 bytes from where the cursor stands */
inline encode_market_state_contract_message(market_state_contract_message_record) {
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> wire[at] = market_state_contract_message_record.trading_venue[market_state_contract_message_at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> wire[at] = market_state_contract_message_record.time_of_event[market_state_contract_message_at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 12 -> wire[at] = market_state_contract_message_record.contract_code[market_state_contract_message_at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  wire[at] = market_state_contract_message_record.trading_state; at = at + 1;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> wire[at] = market_state_contract_message_record.start_time[market_state_contract_message_at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> wire[at] = market_state_contract_message_record.end_time[market_state_contract_message_at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  wire[at] = market_state_contract_message_record.trading_state_condition; at = at + 1;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> wire[at] = market_state_contract_message_record.filler_string_2[market_state_contract_message_at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Contract Message off the wire, 42 bytes from where the cursor stands */
inline decode_market_state_contract_message(market_state_contract_message_record) {
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> market_state_contract_message_record.trading_venue[market_state_contract_message_at] = wire[at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.time_of_event[market_state_contract_message_at] = wire[at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 12 -> market_state_contract_message_record.contract_code[market_state_contract_message_at] = wire[at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_record.trading_state = wire[at]; at = at + 1;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.start_time[market_state_contract_message_at] = wire[at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> market_state_contract_message_record.end_time[market_state_contract_message_at] = wire[at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_record.trading_state_condition = wire[at]; at = at + 1;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> market_state_contract_message_record.filler_string_2[market_state_contract_message_at] = wire[at]; at = at + 1; market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market State Contract Message is what was written, byte for byte */
inline equal_market_state_contract_message(market_state_contract_message_read, market_state_contract_message_written) {
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> assert(market_state_contract_message_read.trading_venue[market_state_contract_message_at] == market_state_contract_message_written.trading_venue[market_state_contract_message_at]); market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> assert(market_state_contract_message_read.time_of_event[market_state_contract_message_at] == market_state_contract_message_written.time_of_event[market_state_contract_message_at]); market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 12 -> assert(market_state_contract_message_read.contract_code[market_state_contract_message_at] == market_state_contract_message_written.contract_code[market_state_contract_message_at]); market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  assert(market_state_contract_message_read.trading_state == market_state_contract_message_written.trading_state);
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> assert(market_state_contract_message_read.start_time[market_state_contract_message_at] == market_state_contract_message_written.start_time[market_state_contract_message_at]); market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 8 -> assert(market_state_contract_message_read.end_time[market_state_contract_message_at] == market_state_contract_message_written.end_time[market_state_contract_message_at]); market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  assert(market_state_contract_message_read.trading_state_condition == market_state_contract_message_written.trading_state_condition);
  market_state_contract_message_at = 0;
  do
  :: market_state_contract_message_at < 2 -> assert(market_state_contract_message_read.filler_string_2[market_state_contract_message_at] == market_state_contract_message_written.filler_string_2[market_state_contract_message_at]); market_state_contract_message_at = market_state_contract_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market State Instrument Message: 40 bytes ------------------------------- */

/* Indicates the trading state of an individual tradable instrument. Sent when the instrument state differs from that at contract level, for example when TOM goes into Post Trade before the contract. */
typedef MarketStateInstrumentMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte tradable_instrument_id[8];
  byte timetable_control_type;
  byte trading_state;
  byte start_time[8];
  byte end_time[8];
  byte trading_state_condition;
  byte filler_string_3[3]
};

int market_state_instrument_message_at;

/* every byte of Market State Instrument Message set to one value */
inline fill_market_state_instrument_message(market_state_instrument_message_record, market_state_instrument_message_value) {
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 2 -> market_state_instrument_message_record.trading_venue[market_state_instrument_message_at] = market_state_instrument_message_value; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.time_of_event[market_state_instrument_message_at] = market_state_instrument_message_value; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.tradable_instrument_id[market_state_instrument_message_at] = market_state_instrument_message_value; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_record.timetable_control_type = market_state_instrument_message_value;
  market_state_instrument_message_record.trading_state = market_state_instrument_message_value;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.start_time[market_state_instrument_message_at] = market_state_instrument_message_value; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.end_time[market_state_instrument_message_at] = market_state_instrument_message_value; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_record.trading_state_condition = market_state_instrument_message_value;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 3 -> market_state_instrument_message_record.filler_string_3[market_state_instrument_message_at] = market_state_instrument_message_value; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market State Instrument Message set to where it lies, so a field read out of place says so */
inline ramp_market_state_instrument_message(market_state_instrument_message_record, market_state_instrument_message_base) {
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 2 -> market_state_instrument_message_record.trading_venue[market_state_instrument_message_at] = (market_state_instrument_message_base + 0 + market_state_instrument_message_at + 1) % 256; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.time_of_event[market_state_instrument_message_at] = (market_state_instrument_message_base + 2 + market_state_instrument_message_at + 1) % 256; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.tradable_instrument_id[market_state_instrument_message_at] = (market_state_instrument_message_base + 10 + market_state_instrument_message_at + 1) % 256; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_record.timetable_control_type = (market_state_instrument_message_base + 18 + 1) % 256;
  market_state_instrument_message_record.trading_state = (market_state_instrument_message_base + 19 + 1) % 256;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.start_time[market_state_instrument_message_at] = (market_state_instrument_message_base + 20 + market_state_instrument_message_at + 1) % 256; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.end_time[market_state_instrument_message_at] = (market_state_instrument_message_base + 28 + market_state_instrument_message_at + 1) % 256; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_record.trading_state_condition = (market_state_instrument_message_base + 36 + 1) % 256;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 3 -> market_state_instrument_message_record.filler_string_3[market_state_instrument_message_at] = (market_state_instrument_message_base + 37 + market_state_instrument_message_at + 1) % 256; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Instrument Message to the wire, 40 bytes from where the cursor stands */
inline encode_market_state_instrument_message(market_state_instrument_message_record) {
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 2 -> wire[at] = market_state_instrument_message_record.trading_venue[market_state_instrument_message_at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> wire[at] = market_state_instrument_message_record.time_of_event[market_state_instrument_message_at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> wire[at] = market_state_instrument_message_record.tradable_instrument_id[market_state_instrument_message_at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  wire[at] = market_state_instrument_message_record.timetable_control_type; at = at + 1;
  wire[at] = market_state_instrument_message_record.trading_state; at = at + 1;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> wire[at] = market_state_instrument_message_record.start_time[market_state_instrument_message_at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> wire[at] = market_state_instrument_message_record.end_time[market_state_instrument_message_at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  wire[at] = market_state_instrument_message_record.trading_state_condition; at = at + 1;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 3 -> wire[at] = market_state_instrument_message_record.filler_string_3[market_state_instrument_message_at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Instrument Message off the wire, 40 bytes from where the cursor stands */
inline decode_market_state_instrument_message(market_state_instrument_message_record) {
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 2 -> market_state_instrument_message_record.trading_venue[market_state_instrument_message_at] = wire[at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.time_of_event[market_state_instrument_message_at] = wire[at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.tradable_instrument_id[market_state_instrument_message_at] = wire[at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_record.timetable_control_type = wire[at]; at = at + 1;
  market_state_instrument_message_record.trading_state = wire[at]; at = at + 1;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.start_time[market_state_instrument_message_at] = wire[at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> market_state_instrument_message_record.end_time[market_state_instrument_message_at] = wire[at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_record.trading_state_condition = wire[at]; at = at + 1;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 3 -> market_state_instrument_message_record.filler_string_3[market_state_instrument_message_at] = wire[at]; at = at + 1; market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market State Instrument Message is what was written, byte for byte */
inline equal_market_state_instrument_message(market_state_instrument_message_read, market_state_instrument_message_written) {
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 2 -> assert(market_state_instrument_message_read.trading_venue[market_state_instrument_message_at] == market_state_instrument_message_written.trading_venue[market_state_instrument_message_at]); market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> assert(market_state_instrument_message_read.time_of_event[market_state_instrument_message_at] == market_state_instrument_message_written.time_of_event[market_state_instrument_message_at]); market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> assert(market_state_instrument_message_read.tradable_instrument_id[market_state_instrument_message_at] == market_state_instrument_message_written.tradable_instrument_id[market_state_instrument_message_at]); market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  assert(market_state_instrument_message_read.timetable_control_type == market_state_instrument_message_written.timetable_control_type);
  assert(market_state_instrument_message_read.trading_state == market_state_instrument_message_written.trading_state);
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> assert(market_state_instrument_message_read.start_time[market_state_instrument_message_at] == market_state_instrument_message_written.start_time[market_state_instrument_message_at]); market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 8 -> assert(market_state_instrument_message_read.end_time[market_state_instrument_message_at] == market_state_instrument_message_written.end_time[market_state_instrument_message_at]); market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  assert(market_state_instrument_message_read.trading_state_condition == market_state_instrument_message_written.trading_state_condition);
  market_state_instrument_message_at = 0;
  do
  :: market_state_instrument_message_at < 3 -> assert(market_state_instrument_message_read.filler_string_3[market_state_instrument_message_at] == market_state_instrument_message_written.filler_string_3[market_state_instrument_message_at]); market_state_instrument_message_at = market_state_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Opening Price Message: 40 bytes ------------------------------ */

/* Carries the price at which a tradable instrument would open, computed by the uncrossing algorithm during Pre-Open. If there are no crossed prices no IOP is calculated or disseminated; where the book is not crossed but has both a bid and an offer, a mid price is calculated and published instead. At the transition from Pre-Open to Open an IOP message is published for every tradable instrument with both prices null and the volume zero, to indicate the prices are no longer valid. */
typedef IndicativeOpeningPriceMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte tradable_instrument_id[8];
  byte indicative_opening_price[8];
  byte indicative_opening_volume[4];
  byte indicative_opening_mid_price[8];
  byte filler_string_2[2]
};

int indicative_opening_price_message_at;

/* every byte of Indicative Opening Price Message set to one value */
inline fill_indicative_opening_price_message(indicative_opening_price_message_record, indicative_opening_price_message_value) {
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> indicative_opening_price_message_record.trading_venue[indicative_opening_price_message_at] = indicative_opening_price_message_value; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.time_of_event[indicative_opening_price_message_at] = indicative_opening_price_message_value; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.tradable_instrument_id[indicative_opening_price_message_at] = indicative_opening_price_message_value; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.indicative_opening_price[indicative_opening_price_message_at] = indicative_opening_price_message_value; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 4 -> indicative_opening_price_message_record.indicative_opening_volume[indicative_opening_price_message_at] = indicative_opening_price_message_value; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.indicative_opening_mid_price[indicative_opening_price_message_at] = indicative_opening_price_message_value; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> indicative_opening_price_message_record.filler_string_2[indicative_opening_price_message_at] = indicative_opening_price_message_value; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Opening Price Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_opening_price_message(indicative_opening_price_message_record, indicative_opening_price_message_base) {
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> indicative_opening_price_message_record.trading_venue[indicative_opening_price_message_at] = (indicative_opening_price_message_base + 0 + indicative_opening_price_message_at + 1) % 256; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.time_of_event[indicative_opening_price_message_at] = (indicative_opening_price_message_base + 2 + indicative_opening_price_message_at + 1) % 256; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.tradable_instrument_id[indicative_opening_price_message_at] = (indicative_opening_price_message_base + 10 + indicative_opening_price_message_at + 1) % 256; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.indicative_opening_price[indicative_opening_price_message_at] = (indicative_opening_price_message_base + 18 + indicative_opening_price_message_at + 1) % 256; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 4 -> indicative_opening_price_message_record.indicative_opening_volume[indicative_opening_price_message_at] = (indicative_opening_price_message_base + 26 + indicative_opening_price_message_at + 1) % 256; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.indicative_opening_mid_price[indicative_opening_price_message_at] = (indicative_opening_price_message_base + 30 + indicative_opening_price_message_at + 1) % 256; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> indicative_opening_price_message_record.filler_string_2[indicative_opening_price_message_at] = (indicative_opening_price_message_base + 38 + indicative_opening_price_message_at + 1) % 256; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Opening Price Message to the wire, 40 bytes from where the cursor stands */
inline encode_indicative_opening_price_message(indicative_opening_price_message_record) {
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> wire[at] = indicative_opening_price_message_record.trading_venue[indicative_opening_price_message_at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> wire[at] = indicative_opening_price_message_record.time_of_event[indicative_opening_price_message_at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> wire[at] = indicative_opening_price_message_record.tradable_instrument_id[indicative_opening_price_message_at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> wire[at] = indicative_opening_price_message_record.indicative_opening_price[indicative_opening_price_message_at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 4 -> wire[at] = indicative_opening_price_message_record.indicative_opening_volume[indicative_opening_price_message_at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> wire[at] = indicative_opening_price_message_record.indicative_opening_mid_price[indicative_opening_price_message_at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> wire[at] = indicative_opening_price_message_record.filler_string_2[indicative_opening_price_message_at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Opening Price Message off the wire, 40 bytes from where the cursor stands */
inline decode_indicative_opening_price_message(indicative_opening_price_message_record) {
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> indicative_opening_price_message_record.trading_venue[indicative_opening_price_message_at] = wire[at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.time_of_event[indicative_opening_price_message_at] = wire[at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.tradable_instrument_id[indicative_opening_price_message_at] = wire[at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.indicative_opening_price[indicative_opening_price_message_at] = wire[at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 4 -> indicative_opening_price_message_record.indicative_opening_volume[indicative_opening_price_message_at] = wire[at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> indicative_opening_price_message_record.indicative_opening_mid_price[indicative_opening_price_message_at] = wire[at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> indicative_opening_price_message_record.filler_string_2[indicative_opening_price_message_at] = wire[at]; at = at + 1; indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Opening Price Message is what was written, byte for byte */
inline equal_indicative_opening_price_message(indicative_opening_price_message_read, indicative_opening_price_message_written) {
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> assert(indicative_opening_price_message_read.trading_venue[indicative_opening_price_message_at] == indicative_opening_price_message_written.trading_venue[indicative_opening_price_message_at]); indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> assert(indicative_opening_price_message_read.time_of_event[indicative_opening_price_message_at] == indicative_opening_price_message_written.time_of_event[indicative_opening_price_message_at]); indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> assert(indicative_opening_price_message_read.tradable_instrument_id[indicative_opening_price_message_at] == indicative_opening_price_message_written.tradable_instrument_id[indicative_opening_price_message_at]); indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> assert(indicative_opening_price_message_read.indicative_opening_price[indicative_opening_price_message_at] == indicative_opening_price_message_written.indicative_opening_price[indicative_opening_price_message_at]); indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 4 -> assert(indicative_opening_price_message_read.indicative_opening_volume[indicative_opening_price_message_at] == indicative_opening_price_message_written.indicative_opening_volume[indicative_opening_price_message_at]); indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 8 -> assert(indicative_opening_price_message_read.indicative_opening_mid_price[indicative_opening_price_message_at] == indicative_opening_price_message_written.indicative_opening_mid_price[indicative_opening_price_message_at]); indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  indicative_opening_price_message_at = 0;
  do
  :: indicative_opening_price_message_at < 2 -> assert(indicative_opening_price_message_read.filler_string_2[indicative_opening_price_message_at] == indicative_opening_price_message_written.filler_string_2[indicative_opening_price_message_at]); indicative_opening_price_message_at = indicative_opening_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Request Message: 26 bytes ----------------------------------------- */

/* Generated when a request for quote is accepted by the Matching Engine. */
typedef QuoteRequestMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte tradable_instrument_id[8];
  byte quote_request_type;
  byte buy_sell;
  byte volume[4];
  byte filler_string_2[2]
};

int quote_request_message_at;

/* every byte of Quote Request Message set to one value */
inline fill_quote_request_message(quote_request_message_record, quote_request_message_value) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> quote_request_message_record.trading_venue[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.time_of_event[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.tradable_instrument_id[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.quote_request_type = quote_request_message_value;
  quote_request_message_record.buy_sell = quote_request_message_value;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.volume[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> quote_request_message_record.filler_string_2[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request Message set to where it lies, so a field read out of place says so */
inline ramp_quote_request_message(quote_request_message_record, quote_request_message_base) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> quote_request_message_record.trading_venue[quote_request_message_at] = (quote_request_message_base + 0 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.time_of_event[quote_request_message_at] = (quote_request_message_base + 2 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.tradable_instrument_id[quote_request_message_at] = (quote_request_message_base + 10 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.quote_request_type = (quote_request_message_base + 18 + 1) % 256;
  quote_request_message_record.buy_sell = (quote_request_message_base + 19 + 1) % 256;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.volume[quote_request_message_at] = (quote_request_message_base + 20 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> quote_request_message_record.filler_string_2[quote_request_message_at] = (quote_request_message_base + 24 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Message to the wire, 26 bytes from where the cursor stands */
inline encode_quote_request_message(quote_request_message_record) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> wire[at] = quote_request_message_record.trading_venue[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> wire[at] = quote_request_message_record.time_of_event[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> wire[at] = quote_request_message_record.tradable_instrument_id[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_message_record.quote_request_type; at = at + 1;
  wire[at] = quote_request_message_record.buy_sell; at = at + 1;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.volume[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> wire[at] = quote_request_message_record.filler_string_2[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Message off the wire, 26 bytes from where the cursor stands */
inline decode_quote_request_message(quote_request_message_record) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> quote_request_message_record.trading_venue[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.time_of_event[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.tradable_instrument_id[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.quote_request_type = wire[at]; at = at + 1;
  quote_request_message_record.buy_sell = wire[at]; at = at + 1;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.volume[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> quote_request_message_record.filler_string_2[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request Message is what was written, byte for byte */
inline equal_quote_request_message(quote_request_message_read, quote_request_message_written) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> assert(quote_request_message_read.trading_venue[quote_request_message_at] == quote_request_message_written.trading_venue[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> assert(quote_request_message_read.time_of_event[quote_request_message_at] == quote_request_message_written.time_of_event[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> assert(quote_request_message_read.tradable_instrument_id[quote_request_message_at] == quote_request_message_written.tradable_instrument_id[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  assert(quote_request_message_read.quote_request_type == quote_request_message_written.quote_request_type);
  assert(quote_request_message_read.buy_sell == quote_request_message_written.buy_sell);
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.volume[quote_request_message_at] == quote_request_message_written.volume[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 2 -> assert(quote_request_message_read.filler_string_2[quote_request_message_at] == quote_request_message_written.filler_string_2[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Clear Message: 18 bytes -------------------------------------- */

/* Generated when the order book is required to be cleared, for example after the transition between certain market states, or when an instrument's Trading State Condition is Trade Halt. Following an Order Book Clear, if an instrument is subsequently open for trading any resting orders are sent as Top Of Book, Aggregate Order Book or Order Add messages to allow clients to rebuild the order book. It is not published when an instrument enters or leaves Trade Pause. */
typedef OrderBookClearMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte tradable_instrument_id[8]
};

int order_book_clear_message_at;

/* every byte of Order Book Clear Message set to one value */
inline fill_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_value) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.trading_venue[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.time_of_event[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.tradable_instrument_id[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Clear Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_base) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.trading_venue[order_book_clear_message_at] = (order_book_clear_message_base + 0 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.time_of_event[order_book_clear_message_at] = (order_book_clear_message_base + 2 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.tradable_instrument_id[order_book_clear_message_at] = (order_book_clear_message_base + 10 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Clear Message to the wire, 18 bytes from where the cursor stands */
inline encode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> wire[at] = order_book_clear_message_record.trading_venue[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> wire[at] = order_book_clear_message_record.time_of_event[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> wire[at] = order_book_clear_message_record.tradable_instrument_id[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Clear Message off the wire, 18 bytes from where the cursor stands */
inline decode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.trading_venue[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.time_of_event[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.tradable_instrument_id[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Clear Message is what was written, byte for byte */
inline equal_order_book_clear_message(order_book_clear_message_read, order_book_clear_message_written) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> assert(order_book_clear_message_read.trading_venue[order_book_clear_message_at] == order_book_clear_message_written.trading_venue[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> assert(order_book_clear_message_read.time_of_event[order_book_clear_message_at] == order_book_clear_message_written.time_of_event[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> assert(order_book_clear_message_read.tradable_instrument_id[order_book_clear_message_at] == order_book_clear_message_written.tradable_instrument_id[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Request Message: 40 bytes ----------------------------------------- */

/* Generated when a cross request is created on LMEselect. */
typedef CrossRequestMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte tradable_instrument_id[8];
  byte cross_id[8];
  byte volume[4];
  byte expire_time[8];
  byte filler_string_2[2]
};

int cross_request_message_at;

/* every byte of Cross Request Message set to one value */
inline fill_cross_request_message(cross_request_message_record, cross_request_message_value) {
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> cross_request_message_record.trading_venue[cross_request_message_at] = cross_request_message_value; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.time_of_event[cross_request_message_at] = cross_request_message_value; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.tradable_instrument_id[cross_request_message_at] = cross_request_message_value; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.cross_id[cross_request_message_at] = cross_request_message_value; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 4 -> cross_request_message_record.volume[cross_request_message_at] = cross_request_message_value; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.expire_time[cross_request_message_at] = cross_request_message_value; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> cross_request_message_record.filler_string_2[cross_request_message_at] = cross_request_message_value; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Request Message set to where it lies, so a field read out of place says so */
inline ramp_cross_request_message(cross_request_message_record, cross_request_message_base) {
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> cross_request_message_record.trading_venue[cross_request_message_at] = (cross_request_message_base + 0 + cross_request_message_at + 1) % 256; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.time_of_event[cross_request_message_at] = (cross_request_message_base + 2 + cross_request_message_at + 1) % 256; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.tradable_instrument_id[cross_request_message_at] = (cross_request_message_base + 10 + cross_request_message_at + 1) % 256; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.cross_id[cross_request_message_at] = (cross_request_message_base + 18 + cross_request_message_at + 1) % 256; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 4 -> cross_request_message_record.volume[cross_request_message_at] = (cross_request_message_base + 26 + cross_request_message_at + 1) % 256; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.expire_time[cross_request_message_at] = (cross_request_message_base + 30 + cross_request_message_at + 1) % 256; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> cross_request_message_record.filler_string_2[cross_request_message_at] = (cross_request_message_base + 38 + cross_request_message_at + 1) % 256; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Request Message to the wire, 40 bytes from where the cursor stands */
inline encode_cross_request_message(cross_request_message_record) {
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> wire[at] = cross_request_message_record.trading_venue[cross_request_message_at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> wire[at] = cross_request_message_record.time_of_event[cross_request_message_at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> wire[at] = cross_request_message_record.tradable_instrument_id[cross_request_message_at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> wire[at] = cross_request_message_record.cross_id[cross_request_message_at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 4 -> wire[at] = cross_request_message_record.volume[cross_request_message_at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> wire[at] = cross_request_message_record.expire_time[cross_request_message_at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> wire[at] = cross_request_message_record.filler_string_2[cross_request_message_at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Request Message off the wire, 40 bytes from where the cursor stands */
inline decode_cross_request_message(cross_request_message_record) {
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> cross_request_message_record.trading_venue[cross_request_message_at] = wire[at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.time_of_event[cross_request_message_at] = wire[at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.tradable_instrument_id[cross_request_message_at] = wire[at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.cross_id[cross_request_message_at] = wire[at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 4 -> cross_request_message_record.volume[cross_request_message_at] = wire[at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> cross_request_message_record.expire_time[cross_request_message_at] = wire[at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> cross_request_message_record.filler_string_2[cross_request_message_at] = wire[at]; at = at + 1; cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Request Message is what was written, byte for byte */
inline equal_cross_request_message(cross_request_message_read, cross_request_message_written) {
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> assert(cross_request_message_read.trading_venue[cross_request_message_at] == cross_request_message_written.trading_venue[cross_request_message_at]); cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> assert(cross_request_message_read.time_of_event[cross_request_message_at] == cross_request_message_written.time_of_event[cross_request_message_at]); cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> assert(cross_request_message_read.tradable_instrument_id[cross_request_message_at] == cross_request_message_written.tradable_instrument_id[cross_request_message_at]); cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> assert(cross_request_message_read.cross_id[cross_request_message_at] == cross_request_message_written.cross_id[cross_request_message_at]); cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 4 -> assert(cross_request_message_read.volume[cross_request_message_at] == cross_request_message_written.volume[cross_request_message_at]); cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 8 -> assert(cross_request_message_read.expire_time[cross_request_message_at] == cross_request_message_written.expire_time[cross_request_message_at]); cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  cross_request_message_at = 0;
  do
  :: cross_request_message_at < 2 -> assert(cross_request_message_read.filler_string_2[cross_request_message_at] == cross_request_message_written.filler_string_2[cross_request_message_at]); cross_request_message_at = cross_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Add Message: 68 bytes --------------------------------------------- */

/* Generated when an order is placed in the order book. An incoming, aggressing order that matches against one or more resting orders is not published as an Order Add unless it has residual volume after matching. For orders submitted during Pre-Open and reloaded GTC and GTD orders the TimeOfEvent reflects the uncrossing event time at market open. */
typedef OrderAddMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte t_1[8];
  byte t_2[8];
  byte t_3[8];
  byte tradable_instrument_id[8];
  byte order_id[8];
  byte buy_sell;
  byte volume[4];
  byte price[8];
  byte order_book_position[4];
  byte filler_string_1
};

int order_add_message_at;

/* every byte of Order Add Message set to one value */
inline fill_order_add_message(order_add_message_record, order_add_message_value) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.trading_venue[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.time_of_event[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_1[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_2[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_3[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.tradable_instrument_id[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.order_id[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.buy_sell = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.volume[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.order_book_position[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.filler_string_1 = order_add_message_value;
  skip
}

/* each byte of Order Add Message set to where it lies, so a field read out of place says so */
inline ramp_order_add_message(order_add_message_record, order_add_message_base) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.trading_venue[order_add_message_at] = (order_add_message_base + 0 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.time_of_event[order_add_message_at] = (order_add_message_base + 2 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_1[order_add_message_at] = (order_add_message_base + 10 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_2[order_add_message_at] = (order_add_message_base + 18 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_3[order_add_message_at] = (order_add_message_base + 26 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.tradable_instrument_id[order_add_message_at] = (order_add_message_base + 34 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.order_id[order_add_message_at] = (order_add_message_base + 42 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.buy_sell = (order_add_message_base + 50 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.volume[order_add_message_at] = (order_add_message_base + 51 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = (order_add_message_base + 55 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.order_book_position[order_add_message_at] = (order_add_message_base + 63 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.filler_string_1 = (order_add_message_base + 67 + 1) % 256;
  skip
}

/* Order Add Message to the wire, 68 bytes from where the cursor stands */
inline encode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> wire[at] = order_add_message_record.trading_venue[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.time_of_event[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.t_1[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.t_2[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.t_3[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.tradable_instrument_id[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.order_id[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.buy_sell; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.volume[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.price[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.order_book_position[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.filler_string_1; at = at + 1;
  skip
}

/* Order Add Message off the wire, 68 bytes from where the cursor stands */
inline decode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.trading_venue[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.time_of_event[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_1[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_2[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.t_3[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.tradable_instrument_id[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.order_id[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.buy_sell = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.volume[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.order_book_position[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.filler_string_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Add Message is what was written, byte for byte */
inline equal_order_add_message(order_add_message_read, order_add_message_written) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> assert(order_add_message_read.trading_venue[order_add_message_at] == order_add_message_written.trading_venue[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.time_of_event[order_add_message_at] == order_add_message_written.time_of_event[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.t_1[order_add_message_at] == order_add_message_written.t_1[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.t_2[order_add_message_at] == order_add_message_written.t_2[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.t_3[order_add_message_at] == order_add_message_written.t_3[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.tradable_instrument_id[order_add_message_at] == order_add_message_written.tradable_instrument_id[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.order_id[order_add_message_at] == order_add_message_written.order_id[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.buy_sell == order_add_message_written.buy_sell);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.volume[order_add_message_at] == order_add_message_written.volume[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.price[order_add_message_at] == order_add_message_written.price[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.order_book_position[order_add_message_at] == order_add_message_written.order_book_position[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.filler_string_1 == order_add_message_written.filler_string_1);
  skip
}

/* ---- Order Amend Message: 68 bytes ------------------------------------------- */

/* Generated when an order amendment updates the volume downward or the position in the order book. */
typedef OrderAmendMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte t_1[8];
  byte t_2[8];
  byte t_3[8];
  byte tradable_instrument_id[8];
  byte order_id[8];
  byte buy_sell;
  byte volume[4];
  byte price[8];
  byte order_book_position[4];
  byte filler_string_1
};

int order_amend_message_at;

/* every byte of Order Amend Message set to one value */
inline fill_order_amend_message(order_amend_message_record, order_amend_message_value) {
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 2 -> order_amend_message_record.trading_venue[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.time_of_event[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_1[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_2[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_3[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.tradable_instrument_id[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.order_id[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_record.buy_sell = order_amend_message_value;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> order_amend_message_record.volume[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.price[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> order_amend_message_record.order_book_position[order_amend_message_at] = order_amend_message_value; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_record.filler_string_1 = order_amend_message_value;
  skip
}

/* each byte of Order Amend Message set to where it lies, so a field read out of place says so */
inline ramp_order_amend_message(order_amend_message_record, order_amend_message_base) {
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 2 -> order_amend_message_record.trading_venue[order_amend_message_at] = (order_amend_message_base + 0 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.time_of_event[order_amend_message_at] = (order_amend_message_base + 2 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_1[order_amend_message_at] = (order_amend_message_base + 10 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_2[order_amend_message_at] = (order_amend_message_base + 18 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_3[order_amend_message_at] = (order_amend_message_base + 26 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.tradable_instrument_id[order_amend_message_at] = (order_amend_message_base + 34 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.order_id[order_amend_message_at] = (order_amend_message_base + 42 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_record.buy_sell = (order_amend_message_base + 50 + 1) % 256;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> order_amend_message_record.volume[order_amend_message_at] = (order_amend_message_base + 51 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.price[order_amend_message_at] = (order_amend_message_base + 55 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> order_amend_message_record.order_book_position[order_amend_message_at] = (order_amend_message_base + 63 + order_amend_message_at + 1) % 256; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_record.filler_string_1 = (order_amend_message_base + 67 + 1) % 256;
  skip
}

/* Order Amend Message to the wire, 68 bytes from where the cursor stands */
inline encode_order_amend_message(order_amend_message_record) {
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 2 -> wire[at] = order_amend_message_record.trading_venue[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> wire[at] = order_amend_message_record.time_of_event[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> wire[at] = order_amend_message_record.t_1[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> wire[at] = order_amend_message_record.t_2[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> wire[at] = order_amend_message_record.t_3[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> wire[at] = order_amend_message_record.tradable_instrument_id[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> wire[at] = order_amend_message_record.order_id[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  wire[at] = order_amend_message_record.buy_sell; at = at + 1;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> wire[at] = order_amend_message_record.volume[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> wire[at] = order_amend_message_record.price[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> wire[at] = order_amend_message_record.order_book_position[order_amend_message_at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  wire[at] = order_amend_message_record.filler_string_1; at = at + 1;
  skip
}

/* Order Amend Message off the wire, 68 bytes from where the cursor stands */
inline decode_order_amend_message(order_amend_message_record) {
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 2 -> order_amend_message_record.trading_venue[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.time_of_event[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_1[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_2[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.t_3[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.tradable_instrument_id[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.order_id[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_record.buy_sell = wire[at]; at = at + 1;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> order_amend_message_record.volume[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> order_amend_message_record.price[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> order_amend_message_record.order_book_position[order_amend_message_at] = wire[at]; at = at + 1; order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_record.filler_string_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Amend Message is what was written, byte for byte */
inline equal_order_amend_message(order_amend_message_read, order_amend_message_written) {
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 2 -> assert(order_amend_message_read.trading_venue[order_amend_message_at] == order_amend_message_written.trading_venue[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> assert(order_amend_message_read.time_of_event[order_amend_message_at] == order_amend_message_written.time_of_event[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> assert(order_amend_message_read.t_1[order_amend_message_at] == order_amend_message_written.t_1[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> assert(order_amend_message_read.t_2[order_amend_message_at] == order_amend_message_written.t_2[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> assert(order_amend_message_read.t_3[order_amend_message_at] == order_amend_message_written.t_3[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> assert(order_amend_message_read.tradable_instrument_id[order_amend_message_at] == order_amend_message_written.tradable_instrument_id[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> assert(order_amend_message_read.order_id[order_amend_message_at] == order_amend_message_written.order_id[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  assert(order_amend_message_read.buy_sell == order_amend_message_written.buy_sell);
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> assert(order_amend_message_read.volume[order_amend_message_at] == order_amend_message_written.volume[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 8 -> assert(order_amend_message_read.price[order_amend_message_at] == order_amend_message_written.price[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  order_amend_message_at = 0;
  do
  :: order_amend_message_at < 4 -> assert(order_amend_message_read.order_book_position[order_amend_message_at] == order_amend_message_written.order_book_position[order_amend_message_at]); order_amend_message_at = order_amend_message_at + 1
  :: else -> break
  od;
  assert(order_amend_message_read.filler_string_1 == order_amend_message_written.filler_string_1);
  skip
}

/* ---- Order Cancel Message: 52 bytes ------------------------------------------ */

/* Generated when an order is cancelled from the order book. */
typedef OrderCancelMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte t_1[8];
  byte t_2[8];
  byte t_3[8];
  byte tradable_instrument_id[8];
  byte order_id[8];
  byte buy_sell;
  byte filler_string_1
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.trading_venue[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.time_of_event[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_1[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_2[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_3[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.tradable_instrument_id[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_id[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_record.buy_sell = order_cancel_message_value;
  order_cancel_message_record.filler_string_1 = order_cancel_message_value;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.trading_venue[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.time_of_event[order_cancel_message_at] = (order_cancel_message_base + 2 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_1[order_cancel_message_at] = (order_cancel_message_base + 10 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_2[order_cancel_message_at] = (order_cancel_message_base + 18 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_3[order_cancel_message_at] = (order_cancel_message_base + 26 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.tradable_instrument_id[order_cancel_message_at] = (order_cancel_message_base + 34 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_id[order_cancel_message_at] = (order_cancel_message_base + 42 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_record.buy_sell = (order_cancel_message_base + 50 + 1) % 256;
  order_cancel_message_record.filler_string_1 = (order_cancel_message_base + 51 + 1) % 256;
  skip
}

/* Order Cancel Message to the wire, 52 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.trading_venue[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.time_of_event[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.t_1[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.t_2[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.t_3[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.tradable_instrument_id[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.order_id[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_message_record.buy_sell; at = at + 1;
  wire[at] = order_cancel_message_record.filler_string_1; at = at + 1;
  skip
}

/* Order Cancel Message off the wire, 52 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.trading_venue[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.time_of_event[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_1[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_2[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.t_3[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.tradable_instrument_id[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_id[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_record.buy_sell = wire[at]; at = at + 1;
  order_cancel_message_record.filler_string_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> assert(order_cancel_message_read.trading_venue[order_cancel_message_at] == order_cancel_message_written.trading_venue[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.time_of_event[order_cancel_message_at] == order_cancel_message_written.time_of_event[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.t_1[order_cancel_message_at] == order_cancel_message_written.t_1[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.t_2[order_cancel_message_at] == order_cancel_message_written.t_2[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.t_3[order_cancel_message_at] == order_cancel_message_written.t_3[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.tradable_instrument_id[order_cancel_message_at] == order_cancel_message_written.tradable_instrument_id[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.order_id[order_cancel_message_at] == order_cancel_message_written.order_id[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_message_read.buy_sell == order_cancel_message_written.buy_sell);
  assert(order_cancel_message_read.filler_string_1 == order_cancel_message_written.filler_string_1);
  skip
}

/* ---- Logon Message: 12 bytes ------------------------------------------------- */

/* Enables client authentication. Not required for multicast channels and only used for retransmission requests. The client sends a Logon containing a username, to which LMEsource responds with a Logon Response. */
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

/* Response to a Logon, carrying the status of the session. */
typedef LogonResponseMessage {
  byte session_status;
  byte filler_string_3[3]
};

int logon_response_message_at;

/* every byte of Logon Response Message set to one value */
inline fill_logon_response_message(logon_response_message_record, logon_response_message_value) {
  logon_response_message_record.session_status = logon_response_message_value;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_string_3[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Response Message set to where it lies, so a field read out of place says so */
inline ramp_logon_response_message(logon_response_message_record, logon_response_message_base) {
  logon_response_message_record.session_status = (logon_response_message_base + 0 + 1) % 256;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_string_3[logon_response_message_at] = (logon_response_message_base + 1 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message to the wire, 4 bytes from where the cursor stands */
inline encode_logon_response_message(logon_response_message_record) {
  wire[at] = logon_response_message_record.session_status; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> wire[at] = logon_response_message_record.filler_string_3[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message off the wire, 4 bytes from where the cursor stands */
inline decode_logon_response_message(logon_response_message_record) {
  logon_response_message_record.session_status = wire[at]; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> logon_response_message_record.filler_string_3[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Response Message is what was written, byte for byte */
inline equal_logon_response_message(logon_response_message_read, logon_response_message_written) {
  assert(logon_response_message_read.session_status == logon_response_message_written.session_status);
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 3 -> assert(logon_response_message_read.filler_string_3[logon_response_message_at] == logon_response_message_written.filler_string_3[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request Message: 12 bytes -------------------------------- */

/* Requests the retransmission of a range of messages on a multicast channel. */
typedef RetransmissionRequestMessage {
  byte channel_id[2];
  byte filler_string_2[2];
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
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_string_2[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
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
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_string_2[retransmission_request_message_at] = (retransmission_request_message_base + 2 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
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
  :: retransmission_request_message_at < 2 -> wire[at] = retransmission_request_message_record.filler_string_2[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
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
  :: retransmission_request_message_at < 2 -> retransmission_request_message_record.filler_string_2[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
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
  :: retransmission_request_message_at < 2 -> assert(retransmission_request_message_read.filler_string_2[retransmission_request_message_at] == retransmission_request_message_written.filler_string_2[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
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

/* Response to a Retransmission Request, carrying the status of the request and the sequence range being resent. */
typedef RetransmissionResponseMessage {
  byte channel_id[2];
  byte retrans_status;
  byte filler_string_1;
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
  retransmission_response_message_record.filler_string_1 = retransmission_response_message_value;
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
  retransmission_response_message_record.filler_string_1 = (retransmission_response_message_base + 3 + 1) % 256;
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
  wire[at] = retransmission_response_message_record.filler_string_1; at = at + 1;
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
  retransmission_response_message_record.filler_string_1 = wire[at]; at = at + 1;
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
  assert(retransmission_response_message_read.filler_string_1 == retransmission_response_message_written.filler_string_1);
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
    assert(at == 4);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 4);
    equal_message_header(message_header_got, message_header_sent)
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

/* Market State Contract Message: encoded, read back, and compared */
proctype check_market_state_contract_message() {
  MarketStateContractMessage market_state_contract_message_sent;
  MarketStateContractMessage market_state_contract_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_state_contract_message(market_state_contract_message_sent, 0)
  :: pattern == 1 -> fill_market_state_contract_message(market_state_contract_message_sent, 32)
  :: pattern == 2 -> fill_market_state_contract_message(market_state_contract_message_sent, 255)
  :: else -> ramp_market_state_contract_message(market_state_contract_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_state_contract_message(market_state_contract_message_sent);
    assert(at == 42);
    at = 0;
    decode_market_state_contract_message(market_state_contract_message_got);
    assert(at == 42);
    equal_market_state_contract_message(market_state_contract_message_got, market_state_contract_message_sent)
  }
}

/* Market State Instrument Message: encoded, read back, and compared */
proctype check_market_state_instrument_message() {
  MarketStateInstrumentMessage market_state_instrument_message_sent;
  MarketStateInstrumentMessage market_state_instrument_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_state_instrument_message(market_state_instrument_message_sent, 0)
  :: pattern == 1 -> fill_market_state_instrument_message(market_state_instrument_message_sent, 32)
  :: pattern == 2 -> fill_market_state_instrument_message(market_state_instrument_message_sent, 255)
  :: else -> ramp_market_state_instrument_message(market_state_instrument_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_state_instrument_message(market_state_instrument_message_sent);
    assert(at == 40);
    at = 0;
    decode_market_state_instrument_message(market_state_instrument_message_got);
    assert(at == 40);
    equal_market_state_instrument_message(market_state_instrument_message_got, market_state_instrument_message_sent)
  }
}

/* Indicative Opening Price Message: encoded, read back, and compared */
proctype check_indicative_opening_price_message() {
  IndicativeOpeningPriceMessage indicative_opening_price_message_sent;
  IndicativeOpeningPriceMessage indicative_opening_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_opening_price_message(indicative_opening_price_message_sent, 0)
  :: pattern == 1 -> fill_indicative_opening_price_message(indicative_opening_price_message_sent, 32)
  :: pattern == 2 -> fill_indicative_opening_price_message(indicative_opening_price_message_sent, 255)
  :: else -> ramp_indicative_opening_price_message(indicative_opening_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_opening_price_message(indicative_opening_price_message_sent);
    assert(at == 40);
    at = 0;
    decode_indicative_opening_price_message(indicative_opening_price_message_got);
    assert(at == 40);
    equal_indicative_opening_price_message(indicative_opening_price_message_got, indicative_opening_price_message_sent)
  }
}

/* Quote Request Message: encoded, read back, and compared */
proctype check_quote_request_message() {
  QuoteRequestMessage quote_request_message_sent;
  QuoteRequestMessage quote_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request_message(quote_request_message_sent, 0)
  :: pattern == 1 -> fill_quote_request_message(quote_request_message_sent, 32)
  :: pattern == 2 -> fill_quote_request_message(quote_request_message_sent, 255)
  :: else -> ramp_quote_request_message(quote_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request_message(quote_request_message_sent);
    assert(at == 26);
    at = 0;
    decode_quote_request_message(quote_request_message_got);
    assert(at == 26);
    equal_quote_request_message(quote_request_message_got, quote_request_message_sent)
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

/* Cross Request Message: encoded, read back, and compared */
proctype check_cross_request_message() {
  CrossRequestMessage cross_request_message_sent;
  CrossRequestMessage cross_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_request_message(cross_request_message_sent, 0)
  :: pattern == 1 -> fill_cross_request_message(cross_request_message_sent, 32)
  :: pattern == 2 -> fill_cross_request_message(cross_request_message_sent, 255)
  :: else -> ramp_cross_request_message(cross_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_request_message(cross_request_message_sent);
    assert(at == 40);
    at = 0;
    decode_cross_request_message(cross_request_message_got);
    assert(at == 40);
    equal_cross_request_message(cross_request_message_got, cross_request_message_sent)
  }
}

/* Order Add Message: encoded, read back, and compared */
proctype check_order_add_message() {
  OrderAddMessage order_add_message_sent;
  OrderAddMessage order_add_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add_message(order_add_message_sent, 0)
  :: pattern == 1 -> fill_order_add_message(order_add_message_sent, 32)
  :: pattern == 2 -> fill_order_add_message(order_add_message_sent, 255)
  :: else -> ramp_order_add_message(order_add_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add_message(order_add_message_sent);
    assert(at == 68);
    at = 0;
    decode_order_add_message(order_add_message_got);
    assert(at == 68);
    equal_order_add_message(order_add_message_got, order_add_message_sent)
  }
}

/* Order Amend Message: encoded, read back, and compared */
proctype check_order_amend_message() {
  OrderAmendMessage order_amend_message_sent;
  OrderAmendMessage order_amend_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_amend_message(order_amend_message_sent, 0)
  :: pattern == 1 -> fill_order_amend_message(order_amend_message_sent, 32)
  :: pattern == 2 -> fill_order_amend_message(order_amend_message_sent, 255)
  :: else -> ramp_order_amend_message(order_amend_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_amend_message(order_amend_message_sent);
    assert(at == 68);
    at = 0;
    decode_order_amend_message(order_amend_message_got);
    assert(at == 68);
    equal_order_amend_message(order_amend_message_got, order_amend_message_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 52);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 52);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sequence_reset_message()
  :: run check_market_state_contract_message()
  :: run check_market_state_instrument_message()
  :: run check_indicative_opening_price_message()
  :: run check_quote_request_message()
  :: run check_order_book_clear_message()
  :: run check_cross_request_message()
  :: run check_order_add_message()
  :: run check_order_amend_message()
  :: run check_order_cancel_message()
  :: run check_logon_message()
  :: run check_logon_response_message()
  :: run check_retransmission_request_message()
  :: run check_retransmission_response_message()
  fi
}
