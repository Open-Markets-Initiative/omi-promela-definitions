/*
 * The London Metal Exchange LMEsource DailySummaries Refresh
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
#define WIRE 36

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

/* ---- Open Interest Message: 32 bytes ----------------------------------------- */

/* Reports Exchange and Market Open Interest for open positions in futures and options contracts. Exchange open interest volumes are provided per currency, by contract code, and not aggregated across currencies, whereas market open interest volumes are aggregated across currencies and reported against USD denominated instruments. */
typedef OpenInterestMessage {
  byte business_date[4];
  byte open_interest_type;
  byte instrument_id[8];
  byte product_code[2];
  byte contract_code[12];
  byte contract_type;
  byte volume[4]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.business_date[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_record.open_interest_type = open_interest_message_value;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.instrument_id[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.product_code[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 12 -> open_interest_message_record.contract_code[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_record.contract_type = open_interest_message_value;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.volume[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.business_date[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_record.open_interest_type = (open_interest_message_base + 4 + 1) % 256;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.instrument_id[open_interest_message_at] = (open_interest_message_base + 5 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.product_code[open_interest_message_at] = (open_interest_message_base + 13 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 12 -> open_interest_message_record.contract_code[open_interest_message_at] = (open_interest_message_base + 15 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_record.contract_type = (open_interest_message_base + 27 + 1) % 256;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.volume[open_interest_message_at] = (open_interest_message_base + 28 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 32 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.business_date[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = open_interest_message_record.open_interest_type; at = at + 1;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.instrument_id[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> wire[at] = open_interest_message_record.product_code[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 12 -> wire[at] = open_interest_message_record.contract_code[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = open_interest_message_record.contract_type; at = at + 1;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.volume[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 32 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.business_date[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_record.open_interest_type = wire[at]; at = at + 1;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.instrument_id[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> open_interest_message_record.product_code[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 12 -> open_interest_message_record.contract_code[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_record.contract_type = wire[at]; at = at + 1;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.volume[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.business_date[open_interest_message_at] == open_interest_message_written.business_date[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  assert(open_interest_message_read.open_interest_type == open_interest_message_written.open_interest_type);
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.instrument_id[open_interest_message_at] == open_interest_message_written.instrument_id[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 2 -> assert(open_interest_message_read.product_code[open_interest_message_at] == open_interest_message_written.product_code[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 12 -> assert(open_interest_message_read.contract_code[open_interest_message_at] == open_interest_message_written.contract_code[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  assert(open_interest_message_read.contract_type == open_interest_message_written.contract_type);
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.volume[open_interest_message_at] == open_interest_message_written.volume[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Volume Message: 36 bytes ---------------------------------------- */

/* Provides the traded volume in lots for matched trades in futures and options instruments. All trades resulting from Cross Order execution, whether off-book or not, are included in the trading volume calculation. */
typedef TradingVolumeMessage {
  byte business_date[4];
  byte trade_date[4];
  byte calculation_type;
  byte instrument_id[8];
  byte product_code[2];
  byte contract_code[12];
  byte contract_type;
  byte volume[4]
};

int trading_volume_message_at;

/* every byte of Trading Volume Message set to one value */
inline fill_trading_volume_message(trading_volume_message_record, trading_volume_message_value) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.business_date[trading_volume_message_at] = trading_volume_message_value; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.trade_date[trading_volume_message_at] = trading_volume_message_value; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_record.calculation_type = trading_volume_message_value;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 8 -> trading_volume_message_record.instrument_id[trading_volume_message_at] = trading_volume_message_value; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> trading_volume_message_record.product_code[trading_volume_message_at] = trading_volume_message_value; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 12 -> trading_volume_message_record.contract_code[trading_volume_message_at] = trading_volume_message_value; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_record.contract_type = trading_volume_message_value;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.volume[trading_volume_message_at] = trading_volume_message_value; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Volume Message set to where it lies, so a field read out of place says so */
inline ramp_trading_volume_message(trading_volume_message_record, trading_volume_message_base) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.business_date[trading_volume_message_at] = (trading_volume_message_base + 0 + trading_volume_message_at + 1) % 256; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.trade_date[trading_volume_message_at] = (trading_volume_message_base + 4 + trading_volume_message_at + 1) % 256; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_record.calculation_type = (trading_volume_message_base + 8 + 1) % 256;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 8 -> trading_volume_message_record.instrument_id[trading_volume_message_at] = (trading_volume_message_base + 9 + trading_volume_message_at + 1) % 256; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> trading_volume_message_record.product_code[trading_volume_message_at] = (trading_volume_message_base + 17 + trading_volume_message_at + 1) % 256; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 12 -> trading_volume_message_record.contract_code[trading_volume_message_at] = (trading_volume_message_base + 19 + trading_volume_message_at + 1) % 256; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_record.contract_type = (trading_volume_message_base + 31 + 1) % 256;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.volume[trading_volume_message_at] = (trading_volume_message_base + 32 + trading_volume_message_at + 1) % 256; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Volume Message to the wire, 36 bytes from where the cursor stands */
inline encode_trading_volume_message(trading_volume_message_record) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> wire[at] = trading_volume_message_record.business_date[trading_volume_message_at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> wire[at] = trading_volume_message_record.trade_date[trading_volume_message_at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_volume_message_record.calculation_type; at = at + 1;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 8 -> wire[at] = trading_volume_message_record.instrument_id[trading_volume_message_at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> wire[at] = trading_volume_message_record.product_code[trading_volume_message_at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 12 -> wire[at] = trading_volume_message_record.contract_code[trading_volume_message_at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_volume_message_record.contract_type; at = at + 1;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> wire[at] = trading_volume_message_record.volume[trading_volume_message_at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Volume Message off the wire, 36 bytes from where the cursor stands */
inline decode_trading_volume_message(trading_volume_message_record) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.business_date[trading_volume_message_at] = wire[at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.trade_date[trading_volume_message_at] = wire[at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_record.calculation_type = wire[at]; at = at + 1;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 8 -> trading_volume_message_record.instrument_id[trading_volume_message_at] = wire[at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> trading_volume_message_record.product_code[trading_volume_message_at] = wire[at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 12 -> trading_volume_message_record.contract_code[trading_volume_message_at] = wire[at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_record.contract_type = wire[at]; at = at + 1;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> trading_volume_message_record.volume[trading_volume_message_at] = wire[at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Volume Message is what was written, byte for byte */
inline equal_trading_volume_message(trading_volume_message_read, trading_volume_message_written) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> assert(trading_volume_message_read.business_date[trading_volume_message_at] == trading_volume_message_written.business_date[trading_volume_message_at]); trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> assert(trading_volume_message_read.trade_date[trading_volume_message_at] == trading_volume_message_written.trade_date[trading_volume_message_at]); trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  assert(trading_volume_message_read.calculation_type == trading_volume_message_written.calculation_type);
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 8 -> assert(trading_volume_message_read.instrument_id[trading_volume_message_at] == trading_volume_message_written.instrument_id[trading_volume_message_at]); trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> assert(trading_volume_message_read.product_code[trading_volume_message_at] == trading_volume_message_written.product_code[trading_volume_message_at]); trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 12 -> assert(trading_volume_message_read.contract_code[trading_volume_message_at] == trading_volume_message_written.contract_code[trading_volume_message_at]); trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  assert(trading_volume_message_read.contract_type == trading_volume_message_written.contract_type);
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 4 -> assert(trading_volume_message_read.volume[trading_volume_message_at] == trading_volume_message_written.volume[trading_volume_message_at]); trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Complete Message: 4 bytes --------------------------------------- */

/* Published to mark the end of a refresh cycle. */
typedef RefreshCompleteMessage {
  byte last_seq_num[4]
};

int refresh_complete_message_at;

/* every byte of Refresh Complete Message set to one value */
inline fill_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_value) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = refresh_complete_message_value; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Complete Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_complete_message(refresh_complete_message_record, refresh_complete_message_base) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = (refresh_complete_message_base + 0 + refresh_complete_message_at + 1) % 256; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message to the wire, 4 bytes from where the cursor stands */
inline encode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> wire[at] = refresh_complete_message_record.last_seq_num[refresh_complete_message_at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Complete Message off the wire, 4 bytes from where the cursor stands */
inline decode_refresh_complete_message(refresh_complete_message_record) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> refresh_complete_message_record.last_seq_num[refresh_complete_message_at] = wire[at]; at = at + 1; refresh_complete_message_at = refresh_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Complete Message is what was written, byte for byte */
inline equal_refresh_complete_message(refresh_complete_message_read, refresh_complete_message_written) {
  refresh_complete_message_at = 0;
  do
  :: refresh_complete_message_at < 4 -> assert(refresh_complete_message_read.last_seq_num[refresh_complete_message_at] == refresh_complete_message_written.last_seq_num[refresh_complete_message_at]); refresh_complete_message_at = refresh_complete_message_at + 1
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
    assert(at == 32);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 32);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Trading Volume Message: encoded, read back, and compared */
proctype check_trading_volume_message() {
  TradingVolumeMessage trading_volume_message_sent;
  TradingVolumeMessage trading_volume_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_volume_message(trading_volume_message_sent, 0)
  :: pattern == 1 -> fill_trading_volume_message(trading_volume_message_sent, 32)
  :: pattern == 2 -> fill_trading_volume_message(trading_volume_message_sent, 255)
  :: else -> ramp_trading_volume_message(trading_volume_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_volume_message(trading_volume_message_sent);
    assert(at == 36);
    at = 0;
    decode_trading_volume_message(trading_volume_message_got);
    assert(at == 36);
    equal_trading_volume_message(trading_volume_message_got, trading_volume_message_sent)
  }
}

/* Refresh Complete Message: encoded, read back, and compared */
proctype check_refresh_complete_message() {
  RefreshCompleteMessage refresh_complete_message_sent;
  RefreshCompleteMessage refresh_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_complete_message(refresh_complete_message_sent, 0)
  :: pattern == 1 -> fill_refresh_complete_message(refresh_complete_message_sent, 32)
  :: pattern == 2 -> fill_refresh_complete_message(refresh_complete_message_sent, 255)
  :: else -> ramp_refresh_complete_message(refresh_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_complete_message(refresh_complete_message_sent);
    assert(at == 4);
    at = 0;
    decode_refresh_complete_message(refresh_complete_message_got);
    assert(at == 4);
    equal_refresh_complete_message(refresh_complete_message_got, refresh_complete_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sequence_reset_message()
  :: run check_open_interest_message()
  :: run check_trading_volume_message()
  :: run check_refresh_complete_message()
  fi
}
