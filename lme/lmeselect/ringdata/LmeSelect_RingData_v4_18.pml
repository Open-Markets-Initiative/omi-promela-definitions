/*
 * The London Metal Exchange LMEsource RingData
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
#define WIRE 29

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

/* ---- Market State Product Message: 15 bytes ---------------------------------- */

/* Indicates the trading state of the product on the Ring and includes the ring session. */
typedef MarketStateProductMessage {
  byte trading_venue[2];
  byte timeof_event[8];
  byte product_code[2];
  byte trading_state;
  byte ring_session[2]
};

int market_state_product_message_at;

/* every byte of Market State Product Message set to one value */
inline fill_market_state_product_message(market_state_product_message_record, market_state_product_message_value) {
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.trading_venue[market_state_product_message_at] = market_state_product_message_value; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 8 -> market_state_product_message_record.timeof_event[market_state_product_message_at] = market_state_product_message_value; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.product_code[market_state_product_message_at] = market_state_product_message_value; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_record.trading_state = market_state_product_message_value;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.ring_session[market_state_product_message_at] = market_state_product_message_value; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market State Product Message set to where it lies, so a field read out of place says so */
inline ramp_market_state_product_message(market_state_product_message_record, market_state_product_message_base) {
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.trading_venue[market_state_product_message_at] = (market_state_product_message_base + 0 + market_state_product_message_at + 1) % 256; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 8 -> market_state_product_message_record.timeof_event[market_state_product_message_at] = (market_state_product_message_base + 2 + market_state_product_message_at + 1) % 256; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.product_code[market_state_product_message_at] = (market_state_product_message_base + 10 + market_state_product_message_at + 1) % 256; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_record.trading_state = (market_state_product_message_base + 12 + 1) % 256;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.ring_session[market_state_product_message_at] = (market_state_product_message_base + 13 + market_state_product_message_at + 1) % 256; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Product Message to the wire, 15 bytes from where the cursor stands */
inline encode_market_state_product_message(market_state_product_message_record) {
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> wire[at] = market_state_product_message_record.trading_venue[market_state_product_message_at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 8 -> wire[at] = market_state_product_message_record.timeof_event[market_state_product_message_at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> wire[at] = market_state_product_message_record.product_code[market_state_product_message_at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  wire[at] = market_state_product_message_record.trading_state; at = at + 1;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> wire[at] = market_state_product_message_record.ring_session[market_state_product_message_at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Product Message off the wire, 15 bytes from where the cursor stands */
inline decode_market_state_product_message(market_state_product_message_record) {
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.trading_venue[market_state_product_message_at] = wire[at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 8 -> market_state_product_message_record.timeof_event[market_state_product_message_at] = wire[at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.product_code[market_state_product_message_at] = wire[at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_record.trading_state = wire[at]; at = at + 1;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> market_state_product_message_record.ring_session[market_state_product_message_at] = wire[at]; at = at + 1; market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market State Product Message is what was written, byte for byte */
inline equal_market_state_product_message(market_state_product_message_read, market_state_product_message_written) {
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> assert(market_state_product_message_read.trading_venue[market_state_product_message_at] == market_state_product_message_written.trading_venue[market_state_product_message_at]); market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 8 -> assert(market_state_product_message_read.timeof_event[market_state_product_message_at] == market_state_product_message_written.timeof_event[market_state_product_message_at]); market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> assert(market_state_product_message_read.product_code[market_state_product_message_at] == market_state_product_message_written.product_code[market_state_product_message_at]); market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  assert(market_state_product_message_read.trading_state == market_state_product_message_written.trading_state);
  market_state_product_message_at = 0;
  do
  :: market_state_product_message_at < 2 -> assert(market_state_product_message_read.ring_session[market_state_product_message_at] == market_state_product_message_written.ring_session[market_state_product_message_at]); market_state_product_message_at = market_state_product_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indicative Trade Price Message: 29 bytes -------------------------------- */

/* Generated each time there is a trade price and when a price has been deleted. */
typedef IndicativeTradePriceMessage {
  byte timeof_event[8];
  byte tradable_instrument_id[8];
  byte trading_venue[2];
  byte ring_session[2];
  byte indicative_price_type;
  byte indicative_trade_price[8]
};

int indicative_trade_price_message_at;

/* every byte of Indicative Trade Price Message set to one value */
inline fill_indicative_trade_price_message(indicative_trade_price_message_record, indicative_trade_price_message_value) {
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.timeof_event[indicative_trade_price_message_at] = indicative_trade_price_message_value; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.tradable_instrument_id[indicative_trade_price_message_at] = indicative_trade_price_message_value; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> indicative_trade_price_message_record.trading_venue[indicative_trade_price_message_at] = indicative_trade_price_message_value; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> indicative_trade_price_message_record.ring_session[indicative_trade_price_message_at] = indicative_trade_price_message_value; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_record.indicative_price_type = indicative_trade_price_message_value;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.indicative_trade_price[indicative_trade_price_message_at] = indicative_trade_price_message_value; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indicative Trade Price Message set to where it lies, so a field read out of place says so */
inline ramp_indicative_trade_price_message(indicative_trade_price_message_record, indicative_trade_price_message_base) {
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.timeof_event[indicative_trade_price_message_at] = (indicative_trade_price_message_base + 0 + indicative_trade_price_message_at + 1) % 256; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.tradable_instrument_id[indicative_trade_price_message_at] = (indicative_trade_price_message_base + 8 + indicative_trade_price_message_at + 1) % 256; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> indicative_trade_price_message_record.trading_venue[indicative_trade_price_message_at] = (indicative_trade_price_message_base + 16 + indicative_trade_price_message_at + 1) % 256; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> indicative_trade_price_message_record.ring_session[indicative_trade_price_message_at] = (indicative_trade_price_message_base + 18 + indicative_trade_price_message_at + 1) % 256; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_record.indicative_price_type = (indicative_trade_price_message_base + 20 + 1) % 256;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.indicative_trade_price[indicative_trade_price_message_at] = (indicative_trade_price_message_base + 21 + indicative_trade_price_message_at + 1) % 256; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Trade Price Message to the wire, 29 bytes from where the cursor stands */
inline encode_indicative_trade_price_message(indicative_trade_price_message_record) {
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> wire[at] = indicative_trade_price_message_record.timeof_event[indicative_trade_price_message_at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> wire[at] = indicative_trade_price_message_record.tradable_instrument_id[indicative_trade_price_message_at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> wire[at] = indicative_trade_price_message_record.trading_venue[indicative_trade_price_message_at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> wire[at] = indicative_trade_price_message_record.ring_session[indicative_trade_price_message_at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  wire[at] = indicative_trade_price_message_record.indicative_price_type; at = at + 1;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> wire[at] = indicative_trade_price_message_record.indicative_trade_price[indicative_trade_price_message_at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indicative Trade Price Message off the wire, 29 bytes from where the cursor stands */
inline decode_indicative_trade_price_message(indicative_trade_price_message_record) {
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.timeof_event[indicative_trade_price_message_at] = wire[at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.tradable_instrument_id[indicative_trade_price_message_at] = wire[at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> indicative_trade_price_message_record.trading_venue[indicative_trade_price_message_at] = wire[at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> indicative_trade_price_message_record.ring_session[indicative_trade_price_message_at] = wire[at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_record.indicative_price_type = wire[at]; at = at + 1;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> indicative_trade_price_message_record.indicative_trade_price[indicative_trade_price_message_at] = wire[at]; at = at + 1; indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indicative Trade Price Message is what was written, byte for byte */
inline equal_indicative_trade_price_message(indicative_trade_price_message_read, indicative_trade_price_message_written) {
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> assert(indicative_trade_price_message_read.timeof_event[indicative_trade_price_message_at] == indicative_trade_price_message_written.timeof_event[indicative_trade_price_message_at]); indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> assert(indicative_trade_price_message_read.tradable_instrument_id[indicative_trade_price_message_at] == indicative_trade_price_message_written.tradable_instrument_id[indicative_trade_price_message_at]); indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> assert(indicative_trade_price_message_read.trading_venue[indicative_trade_price_message_at] == indicative_trade_price_message_written.trading_venue[indicative_trade_price_message_at]); indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 2 -> assert(indicative_trade_price_message_read.ring_session[indicative_trade_price_message_at] == indicative_trade_price_message_written.ring_session[indicative_trade_price_message_at]); indicative_trade_price_message_at = indicative_trade_price_message_at + 1
  :: else -> break
  od;
  assert(indicative_trade_price_message_read.indicative_price_type == indicative_trade_price_message_written.indicative_price_type);
  indicative_trade_price_message_at = 0;
  do
  :: indicative_trade_price_message_at < 8 -> assert(indicative_trade_price_message_read.indicative_trade_price[indicative_trade_price_message_at] == indicative_trade_price_message_written.indicative_trade_price[indicative_trade_price_message_at]); indicative_trade_price_message_at = indicative_trade_price_message_at + 1
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

/* Market State Product Message: encoded, read back, and compared */
proctype check_market_state_product_message() {
  MarketStateProductMessage market_state_product_message_sent;
  MarketStateProductMessage market_state_product_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_state_product_message(market_state_product_message_sent, 0)
  :: pattern == 1 -> fill_market_state_product_message(market_state_product_message_sent, 32)
  :: pattern == 2 -> fill_market_state_product_message(market_state_product_message_sent, 255)
  :: else -> ramp_market_state_product_message(market_state_product_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_state_product_message(market_state_product_message_sent);
    assert(at == 15);
    at = 0;
    decode_market_state_product_message(market_state_product_message_got);
    assert(at == 15);
    equal_market_state_product_message(market_state_product_message_got, market_state_product_message_sent)
  }
}

/* Indicative Trade Price Message: encoded, read back, and compared */
proctype check_indicative_trade_price_message() {
  IndicativeTradePriceMessage indicative_trade_price_message_sent;
  IndicativeTradePriceMessage indicative_trade_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indicative_trade_price_message(indicative_trade_price_message_sent, 0)
  :: pattern == 1 -> fill_indicative_trade_price_message(indicative_trade_price_message_sent, 32)
  :: pattern == 2 -> fill_indicative_trade_price_message(indicative_trade_price_message_sent, 255)
  :: else -> ramp_indicative_trade_price_message(indicative_trade_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indicative_trade_price_message(indicative_trade_price_message_sent);
    assert(at == 29);
    at = 0;
    decode_indicative_trade_price_message(indicative_trade_price_message_got);
    assert(at == 29);
    equal_indicative_trade_price_message(indicative_trade_price_message_got, indicative_trade_price_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sequence_reset_message()
  :: run check_market_state_product_message()
  :: run check_indicative_trade_price_message()
  fi
}
