/*
 * New York Stock Exchange Integrated Feed Retransmission
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
 *   - the dispatch that chooses a message by its type
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 69

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Send Time: 8 bytes ------------------------------------------------------ */

/* The time when this packet was published to the multicast channel */
typedef SendTime {
  byte seconds[4];
  byte nanoseconds[4]
};

int send_time_at;

/* every byte of Send Time set to one value */
inline fill_send_time(send_time_record, send_time_value) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.seconds[send_time_at] = send_time_value; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.nanoseconds[send_time_at] = send_time_value; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Send Time set to where it lies, so a field read out of place says so */
inline ramp_send_time(send_time_record, send_time_base) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.seconds[send_time_at] = (send_time_base + 0 + send_time_at + 1) % 256; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.nanoseconds[send_time_at] = (send_time_base + 4 + send_time_at + 1) % 256; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* Send Time to the wire, 8 bytes from where the cursor stands */
inline encode_send_time(send_time_record) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> wire[at] = send_time_record.seconds[send_time_at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> wire[at] = send_time_record.nanoseconds[send_time_at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* Send Time off the wire, 8 bytes from where the cursor stands */
inline decode_send_time(send_time_record) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.seconds[send_time_at] = wire[at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> send_time_record.nanoseconds[send_time_at] = wire[at]; at = at + 1; send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Send Time is what was written, byte for byte */
inline equal_send_time(send_time_read, send_time_written) {
  send_time_at = 0;
  do
  :: send_time_at < 4 -> assert(send_time_read.seconds[send_time_at] == send_time_written.seconds[send_time_at]); send_time_at = send_time_at + 1
  :: else -> break
  od;
  send_time_at = 0;
  do
  :: send_time_at < 4 -> assert(send_time_read.nanoseconds[send_time_at] == send_time_written.nanoseconds[send_time_at]); send_time_at = send_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Pillar common client udp packet header */
typedef PacketHeader {
  byte pkt_size[2];
  byte delivery_flag;
  byte number_msgs;
  byte seq_num[4];
  SendTime send_time
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = packet_header_value;
  packet_header_record.number_msgs = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  fill_send_time(packet_header_record.send_time, packet_header_value);
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = (packet_header_base + 2 + 1) % 256;
  packet_header_record.number_msgs = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  ramp_send_time(packet_header_record.send_time, packet_header_base + 8);
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.pkt_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.delivery_flag; at = at + 1;
  wire[at] = packet_header_record.number_msgs; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.seq_num[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  encode_send_time(packet_header_record.send_time);
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.pkt_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = wire[at]; at = at + 1;
  packet_header_record.number_msgs = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.seq_num[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  decode_send_time(packet_header_record.send_time);
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.pkt_size[packet_header_at] == packet_header_written.pkt_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.delivery_flag == packet_header_written.delivery_flag);
  assert(packet_header_read.number_msgs == packet_header_written.number_msgs);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.seq_num[packet_header_at] == packet_header_written.seq_num[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  equal_send_time(packet_header_read.send_time, packet_header_written.send_time);
  skip
}

/* ---- Message Header: 4 bytes ------------------------------------------------- */

/* Pillar message header */
typedef MessageHeader {
  byte message_size[2];
  byte message_type[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_size[message_header_at] == message_header_written.message_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Number Reset Message: 10 bytes --------------------------------- */

/* This message is sent to reset the Message Sequence Number at start of day, or in response to failures. */
typedef SequenceNumberResetMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte product_id;
  byte channel_id
};

int sequence_number_reset_message_at;

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_record.product_id = sequence_number_reset_message_value;
  sequence_number_reset_message_record.channel_id = sequence_number_reset_message_value;
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 0 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 4 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_record.product_id = (sequence_number_reset_message_base + 8 + 1) % 256;
  sequence_number_reset_message_record.channel_id = (sequence_number_reset_message_base + 9 + 1) % 256;
  skip
}

/* Sequence Number Reset Message to the wire, 10 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.source_time[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  wire[at] = sequence_number_reset_message_record.product_id; at = at + 1;
  wire[at] = sequence_number_reset_message_record.channel_id; at = at + 1;
  skip
}

/* Sequence Number Reset Message off the wire, 10 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.source_time_ns[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_record.product_id = wire[at]; at = at + 1;
  sequence_number_reset_message_record.channel_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.source_time[sequence_number_reset_message_at] == sequence_number_reset_message_written.source_time[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.source_time_ns[sequence_number_reset_message_at] == sequence_number_reset_message_written.source_time_ns[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  assert(sequence_number_reset_message_read.product_id == sequence_number_reset_message_written.product_id);
  assert(sequence_number_reset_message_read.channel_id == sequence_number_reset_message_written.channel_id);
  skip
}

/* ---- Source Time Reference Message: 12 bytes --------------------------------- */

/* For high-volume feeds, this message is sent at the start of every second during periods of active data publication. The client can concatenate the SourceTime field with the SourceTimeNS field in subsequent market data messages to get full 8-byte Matching Engine event timestamps. */
typedef SourceTimeReferenceMessage {
  byte id[4];
  byte symbol_seq_num[4];
  byte source_time[4]
};

int source_time_reference_message_at;

/* every byte of Source Time Reference Message set to one value */
inline fill_source_time_reference_message(source_time_reference_message_record, source_time_reference_message_value) {
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.id[source_time_reference_message_at] = source_time_reference_message_value; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.symbol_seq_num[source_time_reference_message_at] = source_time_reference_message_value; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.source_time[source_time_reference_message_at] = source_time_reference_message_value; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Source Time Reference Message set to where it lies, so a field read out of place says so */
inline ramp_source_time_reference_message(source_time_reference_message_record, source_time_reference_message_base) {
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.id[source_time_reference_message_at] = (source_time_reference_message_base + 0 + source_time_reference_message_at + 1) % 256; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.symbol_seq_num[source_time_reference_message_at] = (source_time_reference_message_base + 4 + source_time_reference_message_at + 1) % 256; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.source_time[source_time_reference_message_at] = (source_time_reference_message_base + 8 + source_time_reference_message_at + 1) % 256; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Source Time Reference Message to the wire, 12 bytes from where the cursor stands */
inline encode_source_time_reference_message(source_time_reference_message_record) {
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> wire[at] = source_time_reference_message_record.id[source_time_reference_message_at]; at = at + 1; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> wire[at] = source_time_reference_message_record.symbol_seq_num[source_time_reference_message_at]; at = at + 1; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> wire[at] = source_time_reference_message_record.source_time[source_time_reference_message_at]; at = at + 1; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Source Time Reference Message off the wire, 12 bytes from where the cursor stands */
inline decode_source_time_reference_message(source_time_reference_message_record) {
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.id[source_time_reference_message_at] = wire[at]; at = at + 1; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.symbol_seq_num[source_time_reference_message_at] = wire[at]; at = at + 1; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> source_time_reference_message_record.source_time[source_time_reference_message_at] = wire[at]; at = at + 1; source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Source Time Reference Message is what was written, byte for byte */
inline equal_source_time_reference_message(source_time_reference_message_read, source_time_reference_message_written) {
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> assert(source_time_reference_message_read.id[source_time_reference_message_at] == source_time_reference_message_written.id[source_time_reference_message_at]); source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> assert(source_time_reference_message_read.symbol_seq_num[source_time_reference_message_at] == source_time_reference_message_written.symbol_seq_num[source_time_reference_message_at]); source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  source_time_reference_message_at = 0;
  do
  :: source_time_reference_message_at < 4 -> assert(source_time_reference_message_read.source_time[source_time_reference_message_at] == source_time_reference_message_written.source_time[source_time_reference_message_at]); source_time_reference_message_at = source_time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Index Mapping Message: 40 bytes ---------------------------------- */

/* This message is published over the real-time data channels at system startup or in the context of a refresh sequence after a Matching Engine or Pillar Publisher failover. It provides referential data for a single specified symbol. */
typedef SymbolIndexMappingMessage {
  byte symbol_index[4];
  byte symbol[11];
  byte reserved_1;
  byte market_id[2];
  byte system_id;
  byte exchange_code;
  byte price_scale_code;
  byte security_type;
  byte lot_size[2];
  byte prev_close_price[4];
  byte prev_close_volume[4];
  byte price_resolution;
  byte round_lot;
  byte mpv[2];
  byte unit_of_trade[2];
  byte reserved_2[2]
};

int symbol_index_mapping_message_at;

/* every byte of Symbol Index Mapping Message set to one value */
inline fill_symbol_index_mapping_message(symbol_index_mapping_message_record, symbol_index_mapping_message_value) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 11 -> symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.reserved_1 = symbol_index_mapping_message_value;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.market_id[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.system_id = symbol_index_mapping_message_value;
  symbol_index_mapping_message_record.exchange_code = symbol_index_mapping_message_value;
  symbol_index_mapping_message_record.price_scale_code = symbol_index_mapping_message_value;
  symbol_index_mapping_message_record.security_type = symbol_index_mapping_message_value;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.lot_size[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.prev_close_price[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.prev_close_volume[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.price_resolution = symbol_index_mapping_message_value;
  symbol_index_mapping_message_record.round_lot = symbol_index_mapping_message_value;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.mpv[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.unit_of_trade[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.reserved_2[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Index Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_index_mapping_message(symbol_index_mapping_message_record, symbol_index_mapping_message_base) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 0 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 11 -> symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 4 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.reserved_1 = (symbol_index_mapping_message_base + 15 + 1) % 256;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.market_id[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 16 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.system_id = (symbol_index_mapping_message_base + 18 + 1) % 256;
  symbol_index_mapping_message_record.exchange_code = (symbol_index_mapping_message_base + 19 + 1) % 256;
  symbol_index_mapping_message_record.price_scale_code = (symbol_index_mapping_message_base + 20 + 1) % 256;
  symbol_index_mapping_message_record.security_type = (symbol_index_mapping_message_base + 21 + 1) % 256;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.lot_size[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 22 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.prev_close_price[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 24 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.prev_close_volume[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 28 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.price_resolution = (symbol_index_mapping_message_base + 32 + 1) % 256;
  symbol_index_mapping_message_record.round_lot = (symbol_index_mapping_message_base + 33 + 1) % 256;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.mpv[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 34 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.unit_of_trade[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 36 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.reserved_2[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 38 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Index Mapping Message to the wire, 40 bytes from where the cursor stands */
inline encode_symbol_index_mapping_message(symbol_index_mapping_message_record) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> wire[at] = symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 11 -> wire[at] = symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_index_mapping_message_record.reserved_1; at = at + 1;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> wire[at] = symbol_index_mapping_message_record.market_id[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_index_mapping_message_record.system_id; at = at + 1;
  wire[at] = symbol_index_mapping_message_record.exchange_code; at = at + 1;
  wire[at] = symbol_index_mapping_message_record.price_scale_code; at = at + 1;
  wire[at] = symbol_index_mapping_message_record.security_type; at = at + 1;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> wire[at] = symbol_index_mapping_message_record.lot_size[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> wire[at] = symbol_index_mapping_message_record.prev_close_price[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> wire[at] = symbol_index_mapping_message_record.prev_close_volume[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_index_mapping_message_record.price_resolution; at = at + 1;
  wire[at] = symbol_index_mapping_message_record.round_lot; at = at + 1;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> wire[at] = symbol_index_mapping_message_record.mpv[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> wire[at] = symbol_index_mapping_message_record.unit_of_trade[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> wire[at] = symbol_index_mapping_message_record.reserved_2[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Index Mapping Message off the wire, 40 bytes from where the cursor stands */
inline decode_symbol_index_mapping_message(symbol_index_mapping_message_record) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 11 -> symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.reserved_1 = wire[at]; at = at + 1;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.market_id[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.system_id = wire[at]; at = at + 1;
  symbol_index_mapping_message_record.exchange_code = wire[at]; at = at + 1;
  symbol_index_mapping_message_record.price_scale_code = wire[at]; at = at + 1;
  symbol_index_mapping_message_record.security_type = wire[at]; at = at + 1;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.lot_size[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.prev_close_price[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.prev_close_volume[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_record.price_resolution = wire[at]; at = at + 1;
  symbol_index_mapping_message_record.round_lot = wire[at]; at = at + 1;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.mpv[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.unit_of_trade[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> symbol_index_mapping_message_record.reserved_2[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Index Mapping Message is what was written, byte for byte */
inline equal_symbol_index_mapping_message(symbol_index_mapping_message_read, symbol_index_mapping_message_written) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> assert(symbol_index_mapping_message_read.symbol_index[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.symbol_index[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 11 -> assert(symbol_index_mapping_message_read.symbol[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.symbol[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_index_mapping_message_read.reserved_1 == symbol_index_mapping_message_written.reserved_1);
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> assert(symbol_index_mapping_message_read.market_id[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.market_id[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_index_mapping_message_read.system_id == symbol_index_mapping_message_written.system_id);
  assert(symbol_index_mapping_message_read.exchange_code == symbol_index_mapping_message_written.exchange_code);
  assert(symbol_index_mapping_message_read.price_scale_code == symbol_index_mapping_message_written.price_scale_code);
  assert(symbol_index_mapping_message_read.security_type == symbol_index_mapping_message_written.security_type);
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> assert(symbol_index_mapping_message_read.lot_size[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.lot_size[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> assert(symbol_index_mapping_message_read.prev_close_price[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.prev_close_price[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> assert(symbol_index_mapping_message_read.prev_close_volume[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.prev_close_volume[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_index_mapping_message_read.price_resolution == symbol_index_mapping_message_written.price_resolution);
  assert(symbol_index_mapping_message_read.round_lot == symbol_index_mapping_message_written.round_lot);
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> assert(symbol_index_mapping_message_read.mpv[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.mpv[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> assert(symbol_index_mapping_message_read.unit_of_trade[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.unit_of_trade[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 2 -> assert(symbol_index_mapping_message_read.reserved_2[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.reserved_2[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Clear Message: 16 bytes ------------------------------------------ */

/* In case of a failure and recovery of a Matching Engine or an Pillar Publisher, the publisher may send a full state refresh for every symbol affected. This unrequested refresh is preceded by a Symbol Clear message. The client should react to receipt of a Symbol Clear message by clearing all state information for the specified symbol in anticipation of receiving a full state refresh. */
typedef SymbolClearMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte next_source_seq_num[4]
};

int symbol_clear_message_at;

/* every byte of Symbol Clear Message set to one value */
inline fill_symbol_clear_message(symbol_clear_message_record, symbol_clear_message_value) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.source_time[symbol_clear_message_at] = symbol_clear_message_value; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.source_time_ns[symbol_clear_message_at] = symbol_clear_message_value; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.symbol_index[symbol_clear_message_at] = symbol_clear_message_value; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.next_source_seq_num[symbol_clear_message_at] = symbol_clear_message_value; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Clear Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_clear_message(symbol_clear_message_record, symbol_clear_message_base) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.source_time[symbol_clear_message_at] = (symbol_clear_message_base + 0 + symbol_clear_message_at + 1) % 256; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.source_time_ns[symbol_clear_message_at] = (symbol_clear_message_base + 4 + symbol_clear_message_at + 1) % 256; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.symbol_index[symbol_clear_message_at] = (symbol_clear_message_base + 8 + symbol_clear_message_at + 1) % 256; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.next_source_seq_num[symbol_clear_message_at] = (symbol_clear_message_base + 12 + symbol_clear_message_at + 1) % 256; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message to the wire, 16 bytes from where the cursor stands */
inline encode_symbol_clear_message(symbol_clear_message_record) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> wire[at] = symbol_clear_message_record.source_time[symbol_clear_message_at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> wire[at] = symbol_clear_message_record.source_time_ns[symbol_clear_message_at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> wire[at] = symbol_clear_message_record.symbol_index[symbol_clear_message_at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> wire[at] = symbol_clear_message_record.next_source_seq_num[symbol_clear_message_at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message off the wire, 16 bytes from where the cursor stands */
inline decode_symbol_clear_message(symbol_clear_message_record) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.source_time[symbol_clear_message_at] = wire[at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.source_time_ns[symbol_clear_message_at] = wire[at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.symbol_index[symbol_clear_message_at] = wire[at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> symbol_clear_message_record.next_source_seq_num[symbol_clear_message_at] = wire[at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Clear Message is what was written, byte for byte */
inline equal_symbol_clear_message(symbol_clear_message_read, symbol_clear_message_written) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> assert(symbol_clear_message_read.source_time[symbol_clear_message_at] == symbol_clear_message_written.source_time[symbol_clear_message_at]); symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> assert(symbol_clear_message_read.source_time_ns[symbol_clear_message_at] == symbol_clear_message_written.source_time_ns[symbol_clear_message_at]); symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> assert(symbol_clear_message_read.symbol_index[symbol_clear_message_at] == symbol_clear_message_written.symbol_index[symbol_clear_message_at]); symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 4 -> assert(symbol_clear_message_read.next_source_seq_num[symbol_clear_message_at] == symbol_clear_message_written.next_source_seq_num[symbol_clear_message_at]); symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Status Message: 42 bytes --------------------------------------- */

/* This message informs clients of changes in the status of a specific security, such as Trading Halts, Short Sale Restriction state changes, etc. */
typedef SecurityStatusMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte security_status;
  byte halt_condition;
  byte reserved_4[4];
  byte price_1[4];
  byte price_2[4];
  byte ssr_triggering_exchange_id;
  byte ssr_triggering_volume[4];
  byte time[4];
  byte ssr_state;
  byte market_state;
  byte session_state
};

int security_status_message_at;

/* every byte of Security Status Message set to one value */
inline fill_security_status_message(security_status_message_record, security_status_message_value) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.source_time[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.source_time_ns[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.symbol_index[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.symbol_seq_num[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_status = security_status_message_value;
  security_status_message_record.halt_condition = security_status_message_value;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.reserved_4[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.price_1[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.price_2[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.ssr_triggering_exchange_id = security_status_message_value;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.ssr_triggering_volume[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.time[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.ssr_state = security_status_message_value;
  security_status_message_record.market_state = security_status_message_value;
  security_status_message_record.session_state = security_status_message_value;
  skip
}

/* each byte of Security Status Message set to where it lies, so a field read out of place says so */
inline ramp_security_status_message(security_status_message_record, security_status_message_base) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.source_time[security_status_message_at] = (security_status_message_base + 0 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.source_time_ns[security_status_message_at] = (security_status_message_base + 4 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.symbol_index[security_status_message_at] = (security_status_message_base + 8 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.symbol_seq_num[security_status_message_at] = (security_status_message_base + 12 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_status = (security_status_message_base + 16 + 1) % 256;
  security_status_message_record.halt_condition = (security_status_message_base + 17 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.reserved_4[security_status_message_at] = (security_status_message_base + 18 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.price_1[security_status_message_at] = (security_status_message_base + 22 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.price_2[security_status_message_at] = (security_status_message_base + 26 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.ssr_triggering_exchange_id = (security_status_message_base + 30 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.ssr_triggering_volume[security_status_message_at] = (security_status_message_base + 31 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.time[security_status_message_at] = (security_status_message_base + 35 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.ssr_state = (security_status_message_base + 39 + 1) % 256;
  security_status_message_record.market_state = (security_status_message_base + 40 + 1) % 256;
  security_status_message_record.session_state = (security_status_message_base + 41 + 1) % 256;
  skip
}

/* Security Status Message to the wire, 42 bytes from where the cursor stands */
inline encode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.source_time[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.source_time_ns[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.symbol_index[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.symbol_seq_num[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.security_status; at = at + 1;
  wire[at] = security_status_message_record.halt_condition; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.reserved_4[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.price_1[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.price_2[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.ssr_triggering_exchange_id; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.ssr_triggering_volume[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.time[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.ssr_state; at = at + 1;
  wire[at] = security_status_message_record.market_state; at = at + 1;
  wire[at] = security_status_message_record.session_state; at = at + 1;
  skip
}

/* Security Status Message off the wire, 42 bytes from where the cursor stands */
inline decode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.source_time[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.source_time_ns[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.symbol_index[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.symbol_seq_num[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_status = wire[at]; at = at + 1;
  security_status_message_record.halt_condition = wire[at]; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.reserved_4[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.price_1[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.price_2[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.ssr_triggering_exchange_id = wire[at]; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.ssr_triggering_volume[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.time[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.ssr_state = wire[at]; at = at + 1;
  security_status_message_record.market_state = wire[at]; at = at + 1;
  security_status_message_record.session_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Security Status Message is what was written, byte for byte */
inline equal_security_status_message(security_status_message_read, security_status_message_written) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.source_time[security_status_message_at] == security_status_message_written.source_time[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.source_time_ns[security_status_message_at] == security_status_message_written.source_time_ns[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.symbol_index[security_status_message_at] == security_status_message_written.symbol_index[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.symbol_seq_num[security_status_message_at] == security_status_message_written.symbol_seq_num[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.security_status == security_status_message_written.security_status);
  assert(security_status_message_read.halt_condition == security_status_message_written.halt_condition);
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.reserved_4[security_status_message_at] == security_status_message_written.reserved_4[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.price_1[security_status_message_at] == security_status_message_written.price_1[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.price_2[security_status_message_at] == security_status_message_written.price_2[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.ssr_triggering_exchange_id == security_status_message_written.ssr_triggering_exchange_id);
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.ssr_triggering_volume[security_status_message_at] == security_status_message_written.ssr_triggering_volume[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.time[security_status_message_at] == security_status_message_written.time[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.ssr_state == security_status_message_written.ssr_state);
  assert(security_status_message_read.market_state == security_status_message_written.market_state);
  assert(security_status_message_read.session_state == security_status_message_written.session_state);
  skip
}

/* ---- Message Unavailable Message: 10 bytes ----------------------------------- */

/* This message will be sent over the Retransmission multicast channels to inform clients of unavailability of a range of messages (or part of a range) for which they may have requested a retransmission. */
typedef MessageUnavailableMessage {
  byte begin_seq_num[4];
  byte end_seq_num[4];
  byte product_id;
  byte channel_id
};

int message_unavailable_message_at;

/* every byte of Message Unavailable Message set to one value */
inline fill_message_unavailable_message(message_unavailable_message_record, message_unavailable_message_value) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.begin_seq_num[message_unavailable_message_at] = message_unavailable_message_value; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.end_seq_num[message_unavailable_message_at] = message_unavailable_message_value; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_record.product_id = message_unavailable_message_value;
  message_unavailable_message_record.channel_id = message_unavailable_message_value;
  skip
}

/* each byte of Message Unavailable Message set to where it lies, so a field read out of place says so */
inline ramp_message_unavailable_message(message_unavailable_message_record, message_unavailable_message_base) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.begin_seq_num[message_unavailable_message_at] = (message_unavailable_message_base + 0 + message_unavailable_message_at + 1) % 256; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.end_seq_num[message_unavailable_message_at] = (message_unavailable_message_base + 4 + message_unavailable_message_at + 1) % 256; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_record.product_id = (message_unavailable_message_base + 8 + 1) % 256;
  message_unavailable_message_record.channel_id = (message_unavailable_message_base + 9 + 1) % 256;
  skip
}

/* Message Unavailable Message to the wire, 10 bytes from where the cursor stands */
inline encode_message_unavailable_message(message_unavailable_message_record) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> wire[at] = message_unavailable_message_record.begin_seq_num[message_unavailable_message_at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> wire[at] = message_unavailable_message_record.end_seq_num[message_unavailable_message_at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  wire[at] = message_unavailable_message_record.product_id; at = at + 1;
  wire[at] = message_unavailable_message_record.channel_id; at = at + 1;
  skip
}

/* Message Unavailable Message off the wire, 10 bytes from where the cursor stands */
inline decode_message_unavailable_message(message_unavailable_message_record) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.begin_seq_num[message_unavailable_message_at] = wire[at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.end_seq_num[message_unavailable_message_at] = wire[at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_record.product_id = wire[at]; at = at + 1;
  message_unavailable_message_record.channel_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Unavailable Message is what was written, byte for byte */
inline equal_message_unavailable_message(message_unavailable_message_read, message_unavailable_message_written) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> assert(message_unavailable_message_read.begin_seq_num[message_unavailable_message_at] == message_unavailable_message_written.begin_seq_num[message_unavailable_message_at]); message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> assert(message_unavailable_message_read.end_seq_num[message_unavailable_message_at] == message_unavailable_message_written.end_seq_num[message_unavailable_message_at]); message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  assert(message_unavailable_message_read.product_id == message_unavailable_message_written.product_id);
  assert(message_unavailable_message_read.channel_id == message_unavailable_message_written.channel_id);
  skip
}

/* ---- Add Order Message: 35 bytes --------------------------------------------- */

/* An Add Order message is published when a new visible order has been received and added to the book. */
typedef AddOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[8];
  byte price[4];
  byte volume[4];
  byte side;
  byte firm_id[5];
  byte reserved_1
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.source_time_ns[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_index[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_seq_num[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.volume[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> add_order_message_record.firm_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.reserved_1 = add_order_message_value;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.source_time_ns[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_index[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_seq_num[add_order_message_at] = (add_order_message_base + 8 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 12 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 20 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.volume[add_order_message_at] = (add_order_message_base + 24 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = (add_order_message_base + 28 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> add_order_message_record.firm_id[add_order_message_at] = (add_order_message_base + 29 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.reserved_1 = (add_order_message_base + 34 + 1) % 256;
  skip
}

/* Add Order Message to the wire, 35 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.source_time_ns[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.symbol_index[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.symbol_seq_num[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.volume[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.side; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> wire[at] = add_order_message_record.firm_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.reserved_1; at = at + 1;
  skip
}

/* Add Order Message off the wire, 35 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.source_time_ns[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_index[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.symbol_seq_num[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.volume[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> add_order_message_record.firm_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.source_time_ns[add_order_message_at] == add_order_message_written.source_time_ns[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.symbol_index[add_order_message_at] == add_order_message_written.symbol_index[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.symbol_seq_num[add_order_message_at] == add_order_message_written.symbol_seq_num[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.volume[add_order_message_at] == add_order_message_written.volume[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.side == add_order_message_written.side);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> assert(add_order_message_read.firm_id[add_order_message_at] == add_order_message_written.firm_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.reserved_1 == add_order_message_written.reserved_1);
  skip
}

/* ---- Modify Order Message: 31 bytes ------------------------------------------ */

/* A Modify Order message is sent when the price or volume of an order is changed. */
typedef ModifyOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[8];
  byte price[4];
  byte volume[4];
  byte position_change;
  byte side;
  byte reserved_1
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.source_time_ns[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_index[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_seq_num[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.volume[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.position_change = modify_order_message_value;
  modify_order_message_record.side = modify_order_message_value;
  modify_order_message_record.reserved_1 = modify_order_message_value;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.source_time_ns[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_index[modify_order_message_at] = (modify_order_message_base + 4 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_seq_num[modify_order_message_at] = (modify_order_message_base + 8 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = (modify_order_message_base + 12 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = (modify_order_message_base + 20 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.volume[modify_order_message_at] = (modify_order_message_base + 24 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.position_change = (modify_order_message_base + 28 + 1) % 256;
  modify_order_message_record.side = (modify_order_message_base + 29 + 1) % 256;
  modify_order_message_record.reserved_1 = (modify_order_message_base + 30 + 1) % 256;
  skip
}

/* Modify Order Message to the wire, 31 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.source_time_ns[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.symbol_index[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.symbol_seq_num[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.order_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.price[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.volume[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.position_change; at = at + 1;
  wire[at] = modify_order_message_record.side; at = at + 1;
  wire[at] = modify_order_message_record.reserved_1; at = at + 1;
  skip
}

/* Modify Order Message off the wire, 31 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.source_time_ns[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_index[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.symbol_seq_num[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.volume[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.position_change = wire[at]; at = at + 1;
  modify_order_message_record.side = wire[at]; at = at + 1;
  modify_order_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.source_time_ns[modify_order_message_at] == modify_order_message_written.source_time_ns[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.symbol_index[modify_order_message_at] == modify_order_message_written.symbol_index[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.symbol_seq_num[modify_order_message_at] == modify_order_message_written.symbol_seq_num[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.order_id[modify_order_message_at] == modify_order_message_written.order_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.price[modify_order_message_at] == modify_order_message_written.price[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.volume[modify_order_message_at] == modify_order_message_written.volume[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.position_change == modify_order_message_written.position_change);
  assert(modify_order_message_read.side == modify_order_message_written.side);
  assert(modify_order_message_read.reserved_1 == modify_order_message_written.reserved_1);
  skip
}

/* ---- Delete Order Message: 21 bytes ------------------------------------------ */

/* A Delete Order message is published when an order is taken off of the book. */
typedef DeleteOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[8];
  byte reserved_1
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.source_time_ns[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_index[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_seq_num[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.reserved_1 = delete_order_message_value;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.source_time_ns[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_index[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_seq_num[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 12 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.reserved_1 = (delete_order_message_base + 20 + 1) % 256;
  skip
}

/* Delete Order Message to the wire, 21 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.source_time_ns[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.symbol_index[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.symbol_seq_num[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  wire[at] = delete_order_message_record.reserved_1; at = at + 1;
  skip
}

/* Delete Order Message off the wire, 21 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.source_time_ns[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_index[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.symbol_seq_num[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.source_time_ns[delete_order_message_at] == delete_order_message_written.source_time_ns[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.symbol_index[delete_order_message_at] == delete_order_message_written.symbol_index[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.symbol_seq_num[delete_order_message_at] == delete_order_message_written.symbol_seq_num[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  assert(delete_order_message_read.reserved_1 == delete_order_message_written.reserved_1);
  skip
}

/* ---- Order Execution Message: 38 bytes --------------------------------------- */

/* An Order Execution message is sent when an order is partially or fully executed. */
typedef OrderExecutionMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[8];
  byte trade_id[4];
  byte price[4];
  byte volume[4];
  byte printable_flag;
  byte reserved_1;
  byte trade_cond_1;
  byte trade_cond_2;
  byte trade_cond_3;
  byte trade_cond_4
};

int order_execution_message_at;

/* every byte of Order Execution Message set to one value */
inline fill_order_execution_message(order_execution_message_record, order_execution_message_value) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.source_time_ns[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.symbol_index[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.symbol_seq_num[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.order_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.price[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.volume[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.printable_flag = order_execution_message_value;
  order_execution_message_record.reserved_1 = order_execution_message_value;
  order_execution_message_record.trade_cond_1 = order_execution_message_value;
  order_execution_message_record.trade_cond_2 = order_execution_message_value;
  order_execution_message_record.trade_cond_3 = order_execution_message_value;
  order_execution_message_record.trade_cond_4 = order_execution_message_value;
  skip
}

/* each byte of Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_message(order_execution_message_record, order_execution_message_base) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.source_time_ns[order_execution_message_at] = (order_execution_message_base + 0 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.symbol_index[order_execution_message_at] = (order_execution_message_base + 4 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.symbol_seq_num[order_execution_message_at] = (order_execution_message_base + 8 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.order_id[order_execution_message_at] = (order_execution_message_base + 12 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_id[order_execution_message_at] = (order_execution_message_base + 20 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.price[order_execution_message_at] = (order_execution_message_base + 24 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.volume[order_execution_message_at] = (order_execution_message_base + 28 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.printable_flag = (order_execution_message_base + 32 + 1) % 256;
  order_execution_message_record.reserved_1 = (order_execution_message_base + 33 + 1) % 256;
  order_execution_message_record.trade_cond_1 = (order_execution_message_base + 34 + 1) % 256;
  order_execution_message_record.trade_cond_2 = (order_execution_message_base + 35 + 1) % 256;
  order_execution_message_record.trade_cond_3 = (order_execution_message_base + 36 + 1) % 256;
  order_execution_message_record.trade_cond_4 = (order_execution_message_base + 37 + 1) % 256;
  skip
}

/* Order Execution Message to the wire, 38 bytes from where the cursor stands */
inline encode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.source_time_ns[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.symbol_index[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.symbol_seq_num[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.order_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.trade_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.price[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.volume[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.printable_flag; at = at + 1;
  wire[at] = order_execution_message_record.reserved_1; at = at + 1;
  wire[at] = order_execution_message_record.trade_cond_1; at = at + 1;
  wire[at] = order_execution_message_record.trade_cond_2; at = at + 1;
  wire[at] = order_execution_message_record.trade_cond_3; at = at + 1;
  wire[at] = order_execution_message_record.trade_cond_4; at = at + 1;
  skip
}

/* Order Execution Message off the wire, 38 bytes from where the cursor stands */
inline decode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.source_time_ns[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.symbol_index[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.symbol_seq_num[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.order_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.trade_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.price[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.volume[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.printable_flag = wire[at]; at = at + 1;
  order_execution_message_record.reserved_1 = wire[at]; at = at + 1;
  order_execution_message_record.trade_cond_1 = wire[at]; at = at + 1;
  order_execution_message_record.trade_cond_2 = wire[at]; at = at + 1;
  order_execution_message_record.trade_cond_3 = wire[at]; at = at + 1;
  order_execution_message_record.trade_cond_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Execution Message is what was written, byte for byte */
inline equal_order_execution_message(order_execution_message_read, order_execution_message_written) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.source_time_ns[order_execution_message_at] == order_execution_message_written.source_time_ns[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.symbol_index[order_execution_message_at] == order_execution_message_written.symbol_index[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.symbol_seq_num[order_execution_message_at] == order_execution_message_written.symbol_seq_num[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.order_id[order_execution_message_at] == order_execution_message_written.order_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.trade_id[order_execution_message_at] == order_execution_message_written.trade_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.price[order_execution_message_at] == order_execution_message_written.price[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.volume[order_execution_message_at] == order_execution_message_written.volume[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.printable_flag == order_execution_message_written.printable_flag);
  assert(order_execution_message_read.reserved_1 == order_execution_message_written.reserved_1);
  assert(order_execution_message_read.trade_cond_1 == order_execution_message_written.trade_cond_1);
  assert(order_execution_message_read.trade_cond_2 == order_execution_message_written.trade_cond_2);
  assert(order_execution_message_read.trade_cond_3 == order_execution_message_written.trade_cond_3);
  assert(order_execution_message_read.trade_cond_4 == order_execution_message_written.trade_cond_4);
  skip
}

/* ---- Replace Order Message: 38 bytes ----------------------------------------- */

/* A Replace Order message is published when a cancel/replace order is received and executed. */
typedef ReplaceOrderMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[8];
  byte new_order_id[8];
  byte price[4];
  byte volume[4];
  byte side;
  byte reserved_1
};

int replace_order_message_at;

/* every byte of Replace Order Message set to one value */
inline fill_replace_order_message(replace_order_message_record, replace_order_message_value) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.source_time_ns[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.symbol_index[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.symbol_seq_num[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.order_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_order_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.volume[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.side = replace_order_message_value;
  replace_order_message_record.reserved_1 = replace_order_message_value;
  skip
}

/* each byte of Replace Order Message set to where it lies, so a field read out of place says so */
inline ramp_replace_order_message(replace_order_message_record, replace_order_message_base) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.source_time_ns[replace_order_message_at] = (replace_order_message_base + 0 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.symbol_index[replace_order_message_at] = (replace_order_message_base + 4 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.symbol_seq_num[replace_order_message_at] = (replace_order_message_base + 8 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.order_id[replace_order_message_at] = (replace_order_message_base + 12 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_order_id[replace_order_message_at] = (replace_order_message_base + 20 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = (replace_order_message_base + 28 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.volume[replace_order_message_at] = (replace_order_message_base + 32 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.side = (replace_order_message_base + 36 + 1) % 256;
  replace_order_message_record.reserved_1 = (replace_order_message_base + 37 + 1) % 256;
  skip
}

/* Replace Order Message to the wire, 38 bytes from where the cursor stands */
inline encode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.source_time_ns[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.symbol_index[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.symbol_seq_num[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.order_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.new_order_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.price[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.volume[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  wire[at] = replace_order_message_record.side; at = at + 1;
  wire[at] = replace_order_message_record.reserved_1; at = at + 1;
  skip
}

/* Replace Order Message off the wire, 38 bytes from where the cursor stands */
inline decode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.source_time_ns[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.symbol_index[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.symbol_seq_num[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.order_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_order_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.price[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.volume[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_record.side = wire[at]; at = at + 1;
  replace_order_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Replace Order Message is what was written, byte for byte */
inline equal_replace_order_message(replace_order_message_read, replace_order_message_written) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.source_time_ns[replace_order_message_at] == replace_order_message_written.source_time_ns[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.symbol_index[replace_order_message_at] == replace_order_message_written.symbol_index[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.symbol_seq_num[replace_order_message_at] == replace_order_message_written.symbol_seq_num[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.order_id[replace_order_message_at] == replace_order_message_written.order_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.new_order_id[replace_order_message_at] == replace_order_message_written.new_order_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.price[replace_order_message_at] == replace_order_message_written.price[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.volume[replace_order_message_at] == replace_order_message_written.volume[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  assert(replace_order_message_read.side == replace_order_message_written.side);
  assert(replace_order_message_read.reserved_1 == replace_order_message_written.reserved_1);
  skip
}

/* ---- Imbalance Message: 69 bytes --------------------------------------------- */

/* Imbalance messages are published once a second during auctions to update price and volume information. */
typedef ImbalanceMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte reference_price[4];
  byte paired_qty[4];
  byte total_imbalance_qty[4];
  byte market_imbalance_qty[4];
  byte auction_time[2];
  byte auction_type;
  byte imbalance_side;
  byte continuous_book_clearing_price[4];
  byte auction_interest_clearing_price[4];
  byte ssr_filing_price[4];
  byte indicative_match_price[4];
  byte upper_collar[4];
  byte lower_collar[4];
  byte auction_status;
  byte freeze_status;
  byte num_extensions;
  byte unpaired_qty[4];
  byte unpaired_side;
  byte reserved_1
};

int imbalance_message_at;

/* every byte of Imbalance Message set to one value */
inline fill_imbalance_message(imbalance_message_record, imbalance_message_value) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time_ns[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_index[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_seq_num[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.reference_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.paired_qty[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance_qty[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance_qty[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> imbalance_message_record.auction_time[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_type = imbalance_message_value;
  imbalance_message_record.imbalance_side = imbalance_message_value;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.continuous_book_clearing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.auction_interest_clearing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.ssr_filing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.indicative_match_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.upper_collar[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.lower_collar[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_status = imbalance_message_value;
  imbalance_message_record.freeze_status = imbalance_message_value;
  imbalance_message_record.num_extensions = imbalance_message_value;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.unpaired_qty[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.unpaired_side = imbalance_message_value;
  imbalance_message_record.reserved_1 = imbalance_message_value;
  skip
}

/* each byte of Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_imbalance_message(imbalance_message_record, imbalance_message_base) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time[imbalance_message_at] = (imbalance_message_base + 0 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time_ns[imbalance_message_at] = (imbalance_message_base + 4 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_index[imbalance_message_at] = (imbalance_message_base + 8 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_seq_num[imbalance_message_at] = (imbalance_message_base + 12 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.reference_price[imbalance_message_at] = (imbalance_message_base + 16 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.paired_qty[imbalance_message_at] = (imbalance_message_base + 20 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance_qty[imbalance_message_at] = (imbalance_message_base + 24 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance_qty[imbalance_message_at] = (imbalance_message_base + 28 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> imbalance_message_record.auction_time[imbalance_message_at] = (imbalance_message_base + 32 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_type = (imbalance_message_base + 34 + 1) % 256;
  imbalance_message_record.imbalance_side = (imbalance_message_base + 35 + 1) % 256;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.continuous_book_clearing_price[imbalance_message_at] = (imbalance_message_base + 36 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.auction_interest_clearing_price[imbalance_message_at] = (imbalance_message_base + 40 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.ssr_filing_price[imbalance_message_at] = (imbalance_message_base + 44 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.indicative_match_price[imbalance_message_at] = (imbalance_message_base + 48 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.upper_collar[imbalance_message_at] = (imbalance_message_base + 52 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.lower_collar[imbalance_message_at] = (imbalance_message_base + 56 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_status = (imbalance_message_base + 60 + 1) % 256;
  imbalance_message_record.freeze_status = (imbalance_message_base + 61 + 1) % 256;
  imbalance_message_record.num_extensions = (imbalance_message_base + 62 + 1) % 256;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.unpaired_qty[imbalance_message_at] = (imbalance_message_base + 63 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.unpaired_side = (imbalance_message_base + 67 + 1) % 256;
  imbalance_message_record.reserved_1 = (imbalance_message_base + 68 + 1) % 256;
  skip
}

/* Imbalance Message to the wire, 69 bytes from where the cursor stands */
inline encode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.source_time[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.source_time_ns[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.symbol_index[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.symbol_seq_num[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.reference_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.paired_qty[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.total_imbalance_qty[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.market_imbalance_qty[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> wire[at] = imbalance_message_record.auction_time[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_message_record.auction_type; at = at + 1;
  wire[at] = imbalance_message_record.imbalance_side; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.continuous_book_clearing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.auction_interest_clearing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.ssr_filing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.indicative_match_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.upper_collar[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.lower_collar[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_message_record.auction_status; at = at + 1;
  wire[at] = imbalance_message_record.freeze_status; at = at + 1;
  wire[at] = imbalance_message_record.num_extensions; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.unpaired_qty[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_message_record.unpaired_side; at = at + 1;
  wire[at] = imbalance_message_record.reserved_1; at = at + 1;
  skip
}

/* Imbalance Message off the wire, 69 bytes from where the cursor stands */
inline decode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.source_time_ns[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_index[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.symbol_seq_num[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.reference_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.paired_qty[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance_qty[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance_qty[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> imbalance_message_record.auction_time[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_type = wire[at]; at = at + 1;
  imbalance_message_record.imbalance_side = wire[at]; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.continuous_book_clearing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.auction_interest_clearing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.ssr_filing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.indicative_match_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.upper_collar[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.lower_collar[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.auction_status = wire[at]; at = at + 1;
  imbalance_message_record.freeze_status = wire[at]; at = at + 1;
  imbalance_message_record.num_extensions = wire[at]; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.unpaired_qty[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.unpaired_side = wire[at]; at = at + 1;
  imbalance_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Imbalance Message is what was written, byte for byte */
inline equal_imbalance_message(imbalance_message_read, imbalance_message_written) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.source_time[imbalance_message_at] == imbalance_message_written.source_time[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.source_time_ns[imbalance_message_at] == imbalance_message_written.source_time_ns[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.symbol_index[imbalance_message_at] == imbalance_message_written.symbol_index[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.symbol_seq_num[imbalance_message_at] == imbalance_message_written.symbol_seq_num[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.reference_price[imbalance_message_at] == imbalance_message_written.reference_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.paired_qty[imbalance_message_at] == imbalance_message_written.paired_qty[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.total_imbalance_qty[imbalance_message_at] == imbalance_message_written.total_imbalance_qty[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.market_imbalance_qty[imbalance_message_at] == imbalance_message_written.market_imbalance_qty[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 2 -> assert(imbalance_message_read.auction_time[imbalance_message_at] == imbalance_message_written.auction_time[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  assert(imbalance_message_read.auction_type == imbalance_message_written.auction_type);
  assert(imbalance_message_read.imbalance_side == imbalance_message_written.imbalance_side);
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.continuous_book_clearing_price[imbalance_message_at] == imbalance_message_written.continuous_book_clearing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.auction_interest_clearing_price[imbalance_message_at] == imbalance_message_written.auction_interest_clearing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.ssr_filing_price[imbalance_message_at] == imbalance_message_written.ssr_filing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.indicative_match_price[imbalance_message_at] == imbalance_message_written.indicative_match_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.upper_collar[imbalance_message_at] == imbalance_message_written.upper_collar[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.lower_collar[imbalance_message_at] == imbalance_message_written.lower_collar[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  assert(imbalance_message_read.auction_status == imbalance_message_written.auction_status);
  assert(imbalance_message_read.freeze_status == imbalance_message_written.freeze_status);
  assert(imbalance_message_read.num_extensions == imbalance_message_written.num_extensions);
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.unpaired_qty[imbalance_message_at] == imbalance_message_written.unpaired_qty[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  assert(imbalance_message_read.unpaired_side == imbalance_message_written.unpaired_side);
  assert(imbalance_message_read.reserved_1 == imbalance_message_written.reserved_1);
  skip
}

/* ---- Add Order Refresh Message: 39 bytes ------------------------------------- */

/* The Add Order Refresh message can be sent in either of two contexts: refresh response or symbol refresh. */
typedef AddOrderRefreshMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte order_id[8];
  byte price[4];
  byte volume[4];
  byte side;
  byte firm_id[5];
  byte reserved_1
};

int add_order_refresh_message_at;

/* every byte of Add Order Refresh Message set to one value */
inline fill_add_order_refresh_message(add_order_refresh_message_record, add_order_refresh_message_value) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_index[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 8 -> add_order_refresh_message_record.order_id[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.price[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.volume[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.side = add_order_refresh_message_value;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 5 -> add_order_refresh_message_record.firm_id[add_order_refresh_message_at] = add_order_refresh_message_value; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.reserved_1 = add_order_refresh_message_value;
  skip
}

/* each byte of Add Order Refresh Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_refresh_message(add_order_refresh_message_record, add_order_refresh_message_base) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time[add_order_refresh_message_at] = (add_order_refresh_message_base + 0 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at] = (add_order_refresh_message_base + 4 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_index[add_order_refresh_message_at] = (add_order_refresh_message_base + 8 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at] = (add_order_refresh_message_base + 12 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 8 -> add_order_refresh_message_record.order_id[add_order_refresh_message_at] = (add_order_refresh_message_base + 16 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.price[add_order_refresh_message_at] = (add_order_refresh_message_base + 24 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.volume[add_order_refresh_message_at] = (add_order_refresh_message_base + 28 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.side = (add_order_refresh_message_base + 32 + 1) % 256;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 5 -> add_order_refresh_message_record.firm_id[add_order_refresh_message_at] = (add_order_refresh_message_base + 33 + add_order_refresh_message_at + 1) % 256; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.reserved_1 = (add_order_refresh_message_base + 38 + 1) % 256;
  skip
}

/* Add Order Refresh Message to the wire, 39 bytes from where the cursor stands */
inline encode_add_order_refresh_message(add_order_refresh_message_record) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.source_time[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.symbol_index[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 8 -> wire[at] = add_order_refresh_message_record.order_id[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.price[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> wire[at] = add_order_refresh_message_record.volume[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_refresh_message_record.side; at = at + 1;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 5 -> wire[at] = add_order_refresh_message_record.firm_id[add_order_refresh_message_at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_refresh_message_record.reserved_1; at = at + 1;
  skip
}

/* Add Order Refresh Message off the wire, 39 bytes from where the cursor stands */
inline decode_add_order_refresh_message(add_order_refresh_message_record) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.source_time_ns[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_index[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.symbol_seq_num[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 8 -> add_order_refresh_message_record.order_id[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.price[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> add_order_refresh_message_record.volume[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.side = wire[at]; at = at + 1;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 5 -> add_order_refresh_message_record.firm_id[add_order_refresh_message_at] = wire[at]; at = at + 1; add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Refresh Message is what was written, byte for byte */
inline equal_add_order_refresh_message(add_order_refresh_message_read, add_order_refresh_message_written) {
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.source_time[add_order_refresh_message_at] == add_order_refresh_message_written.source_time[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.source_time_ns[add_order_refresh_message_at] == add_order_refresh_message_written.source_time_ns[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.symbol_index[add_order_refresh_message_at] == add_order_refresh_message_written.symbol_index[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.symbol_seq_num[add_order_refresh_message_at] == add_order_refresh_message_written.symbol_seq_num[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 8 -> assert(add_order_refresh_message_read.order_id[add_order_refresh_message_at] == add_order_refresh_message_written.order_id[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.price[add_order_refresh_message_at] == add_order_refresh_message_written.price[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 4 -> assert(add_order_refresh_message_read.volume[add_order_refresh_message_at] == add_order_refresh_message_written.volume[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  assert(add_order_refresh_message_read.side == add_order_refresh_message_written.side);
  add_order_refresh_message_at = 0;
  do
  :: add_order_refresh_message_at < 5 -> assert(add_order_refresh_message_read.firm_id[add_order_refresh_message_at] == add_order_refresh_message_written.firm_id[add_order_refresh_message_at]); add_order_refresh_message_at = add_order_refresh_message_at + 1
  :: else -> break
  od;
  assert(add_order_refresh_message_read.reserved_1 == add_order_refresh_message_written.reserved_1);
  skip
}

/* ---- Non Displayed Trade Message: 29 bytes ----------------------------------- */

/* A Non Displayed Trade message is sent as a result of a match between two non-displayed orders. */
typedef NonDisplayedTradeMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte volume[4];
  byte printable_flag;
  byte trade_cond_1;
  byte trade_cond_2;
  byte trade_cond_3;
  byte trade_cond_4
};

int non_displayed_trade_message_at;

/* every byte of Non Displayed Trade Message set to one value */
inline fill_non_displayed_trade_message(non_displayed_trade_message_record, non_displayed_trade_message_value) {
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.source_time_ns[non_displayed_trade_message_at] = non_displayed_trade_message_value; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.symbol_index[non_displayed_trade_message_at] = non_displayed_trade_message_value; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.symbol_seq_num[non_displayed_trade_message_at] = non_displayed_trade_message_value; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.trade_id[non_displayed_trade_message_at] = non_displayed_trade_message_value; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.price[non_displayed_trade_message_at] = non_displayed_trade_message_value; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.volume[non_displayed_trade_message_at] = non_displayed_trade_message_value; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_record.printable_flag = non_displayed_trade_message_value;
  non_displayed_trade_message_record.trade_cond_1 = non_displayed_trade_message_value;
  non_displayed_trade_message_record.trade_cond_2 = non_displayed_trade_message_value;
  non_displayed_trade_message_record.trade_cond_3 = non_displayed_trade_message_value;
  non_displayed_trade_message_record.trade_cond_4 = non_displayed_trade_message_value;
  skip
}

/* each byte of Non Displayed Trade Message set to where it lies, so a field read out of place says so */
inline ramp_non_displayed_trade_message(non_displayed_trade_message_record, non_displayed_trade_message_base) {
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.source_time_ns[non_displayed_trade_message_at] = (non_displayed_trade_message_base + 0 + non_displayed_trade_message_at + 1) % 256; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.symbol_index[non_displayed_trade_message_at] = (non_displayed_trade_message_base + 4 + non_displayed_trade_message_at + 1) % 256; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.symbol_seq_num[non_displayed_trade_message_at] = (non_displayed_trade_message_base + 8 + non_displayed_trade_message_at + 1) % 256; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.trade_id[non_displayed_trade_message_at] = (non_displayed_trade_message_base + 12 + non_displayed_trade_message_at + 1) % 256; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.price[non_displayed_trade_message_at] = (non_displayed_trade_message_base + 16 + non_displayed_trade_message_at + 1) % 256; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.volume[non_displayed_trade_message_at] = (non_displayed_trade_message_base + 20 + non_displayed_trade_message_at + 1) % 256; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_record.printable_flag = (non_displayed_trade_message_base + 24 + 1) % 256;
  non_displayed_trade_message_record.trade_cond_1 = (non_displayed_trade_message_base + 25 + 1) % 256;
  non_displayed_trade_message_record.trade_cond_2 = (non_displayed_trade_message_base + 26 + 1) % 256;
  non_displayed_trade_message_record.trade_cond_3 = (non_displayed_trade_message_base + 27 + 1) % 256;
  non_displayed_trade_message_record.trade_cond_4 = (non_displayed_trade_message_base + 28 + 1) % 256;
  skip
}

/* Non Displayed Trade Message to the wire, 29 bytes from where the cursor stands */
inline encode_non_displayed_trade_message(non_displayed_trade_message_record) {
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> wire[at] = non_displayed_trade_message_record.source_time_ns[non_displayed_trade_message_at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> wire[at] = non_displayed_trade_message_record.symbol_index[non_displayed_trade_message_at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> wire[at] = non_displayed_trade_message_record.symbol_seq_num[non_displayed_trade_message_at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> wire[at] = non_displayed_trade_message_record.trade_id[non_displayed_trade_message_at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> wire[at] = non_displayed_trade_message_record.price[non_displayed_trade_message_at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> wire[at] = non_displayed_trade_message_record.volume[non_displayed_trade_message_at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = non_displayed_trade_message_record.printable_flag; at = at + 1;
  wire[at] = non_displayed_trade_message_record.trade_cond_1; at = at + 1;
  wire[at] = non_displayed_trade_message_record.trade_cond_2; at = at + 1;
  wire[at] = non_displayed_trade_message_record.trade_cond_3; at = at + 1;
  wire[at] = non_displayed_trade_message_record.trade_cond_4; at = at + 1;
  skip
}

/* Non Displayed Trade Message off the wire, 29 bytes from where the cursor stands */
inline decode_non_displayed_trade_message(non_displayed_trade_message_record) {
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.source_time_ns[non_displayed_trade_message_at] = wire[at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.symbol_index[non_displayed_trade_message_at] = wire[at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.symbol_seq_num[non_displayed_trade_message_at] = wire[at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.trade_id[non_displayed_trade_message_at] = wire[at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.price[non_displayed_trade_message_at] = wire[at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> non_displayed_trade_message_record.volume[non_displayed_trade_message_at] = wire[at]; at = at + 1; non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_record.printable_flag = wire[at]; at = at + 1;
  non_displayed_trade_message_record.trade_cond_1 = wire[at]; at = at + 1;
  non_displayed_trade_message_record.trade_cond_2 = wire[at]; at = at + 1;
  non_displayed_trade_message_record.trade_cond_3 = wire[at]; at = at + 1;
  non_displayed_trade_message_record.trade_cond_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Non Displayed Trade Message is what was written, byte for byte */
inline equal_non_displayed_trade_message(non_displayed_trade_message_read, non_displayed_trade_message_written) {
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> assert(non_displayed_trade_message_read.source_time_ns[non_displayed_trade_message_at] == non_displayed_trade_message_written.source_time_ns[non_displayed_trade_message_at]); non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> assert(non_displayed_trade_message_read.symbol_index[non_displayed_trade_message_at] == non_displayed_trade_message_written.symbol_index[non_displayed_trade_message_at]); non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> assert(non_displayed_trade_message_read.symbol_seq_num[non_displayed_trade_message_at] == non_displayed_trade_message_written.symbol_seq_num[non_displayed_trade_message_at]); non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> assert(non_displayed_trade_message_read.trade_id[non_displayed_trade_message_at] == non_displayed_trade_message_written.trade_id[non_displayed_trade_message_at]); non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> assert(non_displayed_trade_message_read.price[non_displayed_trade_message_at] == non_displayed_trade_message_written.price[non_displayed_trade_message_at]); non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  non_displayed_trade_message_at = 0;
  do
  :: non_displayed_trade_message_at < 4 -> assert(non_displayed_trade_message_read.volume[non_displayed_trade_message_at] == non_displayed_trade_message_written.volume[non_displayed_trade_message_at]); non_displayed_trade_message_at = non_displayed_trade_message_at + 1
  :: else -> break
  od;
  assert(non_displayed_trade_message_read.printable_flag == non_displayed_trade_message_written.printable_flag);
  assert(non_displayed_trade_message_read.trade_cond_1 == non_displayed_trade_message_written.trade_cond_1);
  assert(non_displayed_trade_message_read.trade_cond_2 == non_displayed_trade_message_written.trade_cond_2);
  assert(non_displayed_trade_message_read.trade_cond_3 == non_displayed_trade_message_written.trade_cond_3);
  assert(non_displayed_trade_message_read.trade_cond_4 == non_displayed_trade_message_written.trade_cond_4);
  skip
}

/* ---- Cross Trade Message: 25 bytes ------------------------------------------- */

/* A Cross Trade message is published on completion of a crossing auction. */
typedef CrossTradeMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte cross_id[4];
  byte price[4];
  byte volume[4];
  byte cross_type
};

int cross_trade_message_at;

/* every byte of Cross Trade Message set to one value */
inline fill_cross_trade_message(cross_trade_message_record, cross_trade_message_value) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.source_time_ns[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.symbol_index[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.symbol_seq_num[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_id[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.price[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.volume[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = cross_trade_message_value;
  skip
}

/* each byte of Cross Trade Message set to where it lies, so a field read out of place says so */
inline ramp_cross_trade_message(cross_trade_message_record, cross_trade_message_base) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.source_time_ns[cross_trade_message_at] = (cross_trade_message_base + 0 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.symbol_index[cross_trade_message_at] = (cross_trade_message_base + 4 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.symbol_seq_num[cross_trade_message_at] = (cross_trade_message_base + 8 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_id[cross_trade_message_at] = (cross_trade_message_base + 12 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.price[cross_trade_message_at] = (cross_trade_message_base + 16 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.volume[cross_trade_message_at] = (cross_trade_message_base + 20 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = (cross_trade_message_base + 24 + 1) % 256;
  skip
}

/* Cross Trade Message to the wire, 25 bytes from where the cursor stands */
inline encode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.source_time_ns[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.symbol_index[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.symbol_seq_num[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.cross_id[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.price[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.volume[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_trade_message_record.cross_type; at = at + 1;
  skip
}

/* Cross Trade Message off the wire, 25 bytes from where the cursor stands */
inline decode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.source_time_ns[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.symbol_index[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.symbol_seq_num[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_id[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.price[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.volume[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Cross Trade Message is what was written, byte for byte */
inline equal_cross_trade_message(cross_trade_message_read, cross_trade_message_written) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.source_time_ns[cross_trade_message_at] == cross_trade_message_written.source_time_ns[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.symbol_index[cross_trade_message_at] == cross_trade_message_written.symbol_index[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.symbol_seq_num[cross_trade_message_at] == cross_trade_message_written.symbol_seq_num[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.cross_id[cross_trade_message_at] == cross_trade_message_written.cross_id[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.price[cross_trade_message_at] == cross_trade_message_written.price[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.volume[cross_trade_message_at] == cross_trade_message_written.volume[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  assert(cross_trade_message_read.cross_type == cross_trade_message_written.cross_type);
  skip
}

/* ---- Trade Cancel Message: 16 bytes ------------------------------------------ */

/* In the event that an earlier trade has been reported in error, a Trade Cancel message is sent. */
typedef TradeCancelMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4]
};

int trade_cancel_message_at;

/* every byte of Trade Cancel Message set to one value */
inline fill_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_value) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.source_time_ns[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_index[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_seq_num[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_base) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.source_time_ns[trade_cancel_message_at] = (trade_cancel_message_base + 0 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_index[trade_cancel_message_at] = (trade_cancel_message_base + 4 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_seq_num[trade_cancel_message_at] = (trade_cancel_message_base + 8 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = (trade_cancel_message_base + 12 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Message to the wire, 16 bytes from where the cursor stands */
inline encode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.source_time_ns[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.symbol_index[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.symbol_seq_num[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.trade_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Message off the wire, 16 bytes from where the cursor stands */
inline decode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.source_time_ns[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_index[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_seq_num[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Message is what was written, byte for byte */
inline equal_trade_cancel_message(trade_cancel_message_read, trade_cancel_message_written) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.source_time_ns[trade_cancel_message_at] == trade_cancel_message_written.source_time_ns[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.symbol_index[trade_cancel_message_at] == trade_cancel_message_written.symbol_index[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.symbol_seq_num[trade_cancel_message_at] == trade_cancel_message_written.symbol_seq_num[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.trade_id[trade_cancel_message_at] == trade_cancel_message_written.trade_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Correction Message: 20 bytes -------------------------------------- */

/* In the event that an earlier Cross Trade has been reported in error, a Cross Correction message is sent. */
typedef CrossCorrectionMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte cross_id[4];
  byte volume[4]
};

int cross_correction_message_at;

/* every byte of Cross Correction Message set to one value */
inline fill_cross_correction_message(cross_correction_message_record, cross_correction_message_value) {
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.source_time_ns[cross_correction_message_at] = cross_correction_message_value; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.symbol_index[cross_correction_message_at] = cross_correction_message_value; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.symbol_seq_num[cross_correction_message_at] = cross_correction_message_value; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.cross_id[cross_correction_message_at] = cross_correction_message_value; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.volume[cross_correction_message_at] = cross_correction_message_value; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Correction Message set to where it lies, so a field read out of place says so */
inline ramp_cross_correction_message(cross_correction_message_record, cross_correction_message_base) {
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.source_time_ns[cross_correction_message_at] = (cross_correction_message_base + 0 + cross_correction_message_at + 1) % 256; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.symbol_index[cross_correction_message_at] = (cross_correction_message_base + 4 + cross_correction_message_at + 1) % 256; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.symbol_seq_num[cross_correction_message_at] = (cross_correction_message_base + 8 + cross_correction_message_at + 1) % 256; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.cross_id[cross_correction_message_at] = (cross_correction_message_base + 12 + cross_correction_message_at + 1) % 256; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.volume[cross_correction_message_at] = (cross_correction_message_base + 16 + cross_correction_message_at + 1) % 256; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Correction Message to the wire, 20 bytes from where the cursor stands */
inline encode_cross_correction_message(cross_correction_message_record) {
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> wire[at] = cross_correction_message_record.source_time_ns[cross_correction_message_at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> wire[at] = cross_correction_message_record.symbol_index[cross_correction_message_at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> wire[at] = cross_correction_message_record.symbol_seq_num[cross_correction_message_at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> wire[at] = cross_correction_message_record.cross_id[cross_correction_message_at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> wire[at] = cross_correction_message_record.volume[cross_correction_message_at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Correction Message off the wire, 20 bytes from where the cursor stands */
inline decode_cross_correction_message(cross_correction_message_record) {
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.source_time_ns[cross_correction_message_at] = wire[at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.symbol_index[cross_correction_message_at] = wire[at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.symbol_seq_num[cross_correction_message_at] = wire[at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.cross_id[cross_correction_message_at] = wire[at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> cross_correction_message_record.volume[cross_correction_message_at] = wire[at]; at = at + 1; cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Correction Message is what was written, byte for byte */
inline equal_cross_correction_message(cross_correction_message_read, cross_correction_message_written) {
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> assert(cross_correction_message_read.source_time_ns[cross_correction_message_at] == cross_correction_message_written.source_time_ns[cross_correction_message_at]); cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> assert(cross_correction_message_read.symbol_index[cross_correction_message_at] == cross_correction_message_written.symbol_index[cross_correction_message_at]); cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> assert(cross_correction_message_read.symbol_seq_num[cross_correction_message_at] == cross_correction_message_written.symbol_seq_num[cross_correction_message_at]); cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> assert(cross_correction_message_read.cross_id[cross_correction_message_at] == cross_correction_message_written.cross_id[cross_correction_message_at]); cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  cross_correction_message_at = 0;
  do
  :: cross_correction_message_at < 4 -> assert(cross_correction_message_read.volume[cross_correction_message_at] == cross_correction_message_written.volume[cross_correction_message_at]); cross_correction_message_at = cross_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retail Price Improvement Message: 13 bytes ------------------------------ */

/* Published when RPI interest is added or removed between the best bid and best offer price. */
typedef RetailPriceImprovementMessage {
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte rpi_indicator
};

int retail_price_improvement_message_at;

/* every byte of Retail Price Improvement Message set to one value */
inline fill_retail_price_improvement_message(retail_price_improvement_message_record, retail_price_improvement_message_value) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.source_time_ns[retail_price_improvement_message_at] = retail_price_improvement_message_value; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.symbol_index[retail_price_improvement_message_at] = retail_price_improvement_message_value; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.symbol_seq_num[retail_price_improvement_message_at] = retail_price_improvement_message_value; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.rpi_indicator = retail_price_improvement_message_value;
  skip
}

/* each byte of Retail Price Improvement Message set to where it lies, so a field read out of place says so */
inline ramp_retail_price_improvement_message(retail_price_improvement_message_record, retail_price_improvement_message_base) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.source_time_ns[retail_price_improvement_message_at] = (retail_price_improvement_message_base + 0 + retail_price_improvement_message_at + 1) % 256; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.symbol_index[retail_price_improvement_message_at] = (retail_price_improvement_message_base + 4 + retail_price_improvement_message_at + 1) % 256; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.symbol_seq_num[retail_price_improvement_message_at] = (retail_price_improvement_message_base + 8 + retail_price_improvement_message_at + 1) % 256; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.rpi_indicator = (retail_price_improvement_message_base + 12 + 1) % 256;
  skip
}

/* Retail Price Improvement Message to the wire, 13 bytes from where the cursor stands */
inline encode_retail_price_improvement_message(retail_price_improvement_message_record) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> wire[at] = retail_price_improvement_message_record.source_time_ns[retail_price_improvement_message_at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> wire[at] = retail_price_improvement_message_record.symbol_index[retail_price_improvement_message_at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> wire[at] = retail_price_improvement_message_record.symbol_seq_num[retail_price_improvement_message_at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  wire[at] = retail_price_improvement_message_record.rpi_indicator; at = at + 1;
  skip
}

/* Retail Price Improvement Message off the wire, 13 bytes from where the cursor stands */
inline decode_retail_price_improvement_message(retail_price_improvement_message_record) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.source_time_ns[retail_price_improvement_message_at] = wire[at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.symbol_index[retail_price_improvement_message_at] = wire[at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> retail_price_improvement_message_record.symbol_seq_num[retail_price_improvement_message_at] = wire[at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.rpi_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Retail Price Improvement Message is what was written, byte for byte */
inline equal_retail_price_improvement_message(retail_price_improvement_message_read, retail_price_improvement_message_written) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> assert(retail_price_improvement_message_read.source_time_ns[retail_price_improvement_message_at] == retail_price_improvement_message_written.source_time_ns[retail_price_improvement_message_at]); retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> assert(retail_price_improvement_message_read.symbol_index[retail_price_improvement_message_at] == retail_price_improvement_message_written.symbol_index[retail_price_improvement_message_at]); retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 4 -> assert(retail_price_improvement_message_read.symbol_seq_num[retail_price_improvement_message_at] == retail_price_improvement_message_written.symbol_seq_num[retail_price_improvement_message_at]); retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  assert(retail_price_improvement_message_read.rpi_indicator == retail_price_improvement_message_written.rpi_indicator);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Send Time: encoded, read back, and compared */
proctype check_send_time() {
  SendTime send_time_sent;
  SendTime send_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_send_time(send_time_sent, 0)
  :: pattern == 1 -> fill_send_time(send_time_sent, 32)
  :: pattern == 2 -> fill_send_time(send_time_sent, 255)
  :: else -> ramp_send_time(send_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_send_time(send_time_sent);
    assert(at == 8);
    at = 0;
    decode_send_time(send_time_got);
    assert(at == 8);
    equal_send_time(send_time_got, send_time_sent)
  }
}

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

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 10);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 10);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
  }
}

/* Source Time Reference Message: encoded, read back, and compared */
proctype check_source_time_reference_message() {
  SourceTimeReferenceMessage source_time_reference_message_sent;
  SourceTimeReferenceMessage source_time_reference_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_source_time_reference_message(source_time_reference_message_sent, 0)
  :: pattern == 1 -> fill_source_time_reference_message(source_time_reference_message_sent, 32)
  :: pattern == 2 -> fill_source_time_reference_message(source_time_reference_message_sent, 255)
  :: else -> ramp_source_time_reference_message(source_time_reference_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_source_time_reference_message(source_time_reference_message_sent);
    assert(at == 12);
    at = 0;
    decode_source_time_reference_message(source_time_reference_message_got);
    assert(at == 12);
    equal_source_time_reference_message(source_time_reference_message_got, source_time_reference_message_sent)
  }
}

/* Symbol Index Mapping Message: encoded, read back, and compared */
proctype check_symbol_index_mapping_message() {
  SymbolIndexMappingMessage symbol_index_mapping_message_sent;
  SymbolIndexMappingMessage symbol_index_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_index_mapping_message(symbol_index_mapping_message_sent, 0)
  :: pattern == 1 -> fill_symbol_index_mapping_message(symbol_index_mapping_message_sent, 32)
  :: pattern == 2 -> fill_symbol_index_mapping_message(symbol_index_mapping_message_sent, 255)
  :: else -> ramp_symbol_index_mapping_message(symbol_index_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_index_mapping_message(symbol_index_mapping_message_sent);
    assert(at == 40);
    at = 0;
    decode_symbol_index_mapping_message(symbol_index_mapping_message_got);
    assert(at == 40);
    equal_symbol_index_mapping_message(symbol_index_mapping_message_got, symbol_index_mapping_message_sent)
  }
}

/* Symbol Clear Message: encoded, read back, and compared */
proctype check_symbol_clear_message() {
  SymbolClearMessage symbol_clear_message_sent;
  SymbolClearMessage symbol_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_clear_message(symbol_clear_message_sent, 0)
  :: pattern == 1 -> fill_symbol_clear_message(symbol_clear_message_sent, 32)
  :: pattern == 2 -> fill_symbol_clear_message(symbol_clear_message_sent, 255)
  :: else -> ramp_symbol_clear_message(symbol_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_clear_message(symbol_clear_message_sent);
    assert(at == 16);
    at = 0;
    decode_symbol_clear_message(symbol_clear_message_got);
    assert(at == 16);
    equal_symbol_clear_message(symbol_clear_message_got, symbol_clear_message_sent)
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
    assert(at == 42);
    at = 0;
    decode_security_status_message(security_status_message_got);
    assert(at == 42);
    equal_security_status_message(security_status_message_got, security_status_message_sent)
  }
}

/* Message Unavailable Message: encoded, read back, and compared */
proctype check_message_unavailable_message() {
  MessageUnavailableMessage message_unavailable_message_sent;
  MessageUnavailableMessage message_unavailable_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_unavailable_message(message_unavailable_message_sent, 0)
  :: pattern == 1 -> fill_message_unavailable_message(message_unavailable_message_sent, 32)
  :: pattern == 2 -> fill_message_unavailable_message(message_unavailable_message_sent, 255)
  :: else -> ramp_message_unavailable_message(message_unavailable_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_unavailable_message(message_unavailable_message_sent);
    assert(at == 10);
    at = 0;
    decode_message_unavailable_message(message_unavailable_message_got);
    assert(at == 10);
    equal_message_unavailable_message(message_unavailable_message_got, message_unavailable_message_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 35);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 35);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Modify Order Message: encoded, read back, and compared */
proctype check_modify_order_message() {
  ModifyOrderMessage modify_order_message_sent;
  ModifyOrderMessage modify_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_message(modify_order_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_message(modify_order_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_message(modify_order_message_sent, 255)
  :: else -> ramp_modify_order_message(modify_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_message(modify_order_message_sent);
    assert(at == 31);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 31);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 21);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 21);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Order Execution Message: encoded, read back, and compared */
proctype check_order_execution_message() {
  OrderExecutionMessage order_execution_message_sent;
  OrderExecutionMessage order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_message(order_execution_message_sent, 0)
  :: pattern == 1 -> fill_order_execution_message(order_execution_message_sent, 32)
  :: pattern == 2 -> fill_order_execution_message(order_execution_message_sent, 255)
  :: else -> ramp_order_execution_message(order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_message(order_execution_message_sent);
    assert(at == 38);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 38);
    equal_order_execution_message(order_execution_message_got, order_execution_message_sent)
  }
}

/* Replace Order Message: encoded, read back, and compared */
proctype check_replace_order_message() {
  ReplaceOrderMessage replace_order_message_sent;
  ReplaceOrderMessage replace_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replace_order_message(replace_order_message_sent, 0)
  :: pattern == 1 -> fill_replace_order_message(replace_order_message_sent, 32)
  :: pattern == 2 -> fill_replace_order_message(replace_order_message_sent, 255)
  :: else -> ramp_replace_order_message(replace_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replace_order_message(replace_order_message_sent);
    assert(at == 38);
    at = 0;
    decode_replace_order_message(replace_order_message_got);
    assert(at == 38);
    equal_replace_order_message(replace_order_message_got, replace_order_message_sent)
  }
}

/* Imbalance Message: encoded, read back, and compared */
proctype check_imbalance_message() {
  ImbalanceMessage imbalance_message_sent;
  ImbalanceMessage imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_imbalance_message(imbalance_message_sent, 0)
  :: pattern == 1 -> fill_imbalance_message(imbalance_message_sent, 32)
  :: pattern == 2 -> fill_imbalance_message(imbalance_message_sent, 255)
  :: else -> ramp_imbalance_message(imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_imbalance_message(imbalance_message_sent);
    assert(at == 69);
    at = 0;
    decode_imbalance_message(imbalance_message_got);
    assert(at == 69);
    equal_imbalance_message(imbalance_message_got, imbalance_message_sent)
  }
}

/* Add Order Refresh Message: encoded, read back, and compared */
proctype check_add_order_refresh_message() {
  AddOrderRefreshMessage add_order_refresh_message_sent;
  AddOrderRefreshMessage add_order_refresh_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_refresh_message(add_order_refresh_message_sent, 0)
  :: pattern == 1 -> fill_add_order_refresh_message(add_order_refresh_message_sent, 32)
  :: pattern == 2 -> fill_add_order_refresh_message(add_order_refresh_message_sent, 255)
  :: else -> ramp_add_order_refresh_message(add_order_refresh_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_refresh_message(add_order_refresh_message_sent);
    assert(at == 39);
    at = 0;
    decode_add_order_refresh_message(add_order_refresh_message_got);
    assert(at == 39);
    equal_add_order_refresh_message(add_order_refresh_message_got, add_order_refresh_message_sent)
  }
}

/* Non Displayed Trade Message: encoded, read back, and compared */
proctype check_non_displayed_trade_message() {
  NonDisplayedTradeMessage non_displayed_trade_message_sent;
  NonDisplayedTradeMessage non_displayed_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_non_displayed_trade_message(non_displayed_trade_message_sent, 0)
  :: pattern == 1 -> fill_non_displayed_trade_message(non_displayed_trade_message_sent, 32)
  :: pattern == 2 -> fill_non_displayed_trade_message(non_displayed_trade_message_sent, 255)
  :: else -> ramp_non_displayed_trade_message(non_displayed_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_non_displayed_trade_message(non_displayed_trade_message_sent);
    assert(at == 29);
    at = 0;
    decode_non_displayed_trade_message(non_displayed_trade_message_got);
    assert(at == 29);
    equal_non_displayed_trade_message(non_displayed_trade_message_got, non_displayed_trade_message_sent)
  }
}

/* Cross Trade Message: encoded, read back, and compared */
proctype check_cross_trade_message() {
  CrossTradeMessage cross_trade_message_sent;
  CrossTradeMessage cross_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_trade_message(cross_trade_message_sent, 0)
  :: pattern == 1 -> fill_cross_trade_message(cross_trade_message_sent, 32)
  :: pattern == 2 -> fill_cross_trade_message(cross_trade_message_sent, 255)
  :: else -> ramp_cross_trade_message(cross_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_trade_message(cross_trade_message_sent);
    assert(at == 25);
    at = 0;
    decode_cross_trade_message(cross_trade_message_got);
    assert(at == 25);
    equal_cross_trade_message(cross_trade_message_got, cross_trade_message_sent)
  }
}

/* Trade Cancel Message: encoded, read back, and compared */
proctype check_trade_cancel_message() {
  TradeCancelMessage trade_cancel_message_sent;
  TradeCancelMessage trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_message(trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_message(trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_message(trade_cancel_message_sent, 255)
  :: else -> ramp_trade_cancel_message(trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_message(trade_cancel_message_sent);
    assert(at == 16);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 16);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* Cross Correction Message: encoded, read back, and compared */
proctype check_cross_correction_message() {
  CrossCorrectionMessage cross_correction_message_sent;
  CrossCorrectionMessage cross_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_correction_message(cross_correction_message_sent, 0)
  :: pattern == 1 -> fill_cross_correction_message(cross_correction_message_sent, 32)
  :: pattern == 2 -> fill_cross_correction_message(cross_correction_message_sent, 255)
  :: else -> ramp_cross_correction_message(cross_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_correction_message(cross_correction_message_sent);
    assert(at == 20);
    at = 0;
    decode_cross_correction_message(cross_correction_message_got);
    assert(at == 20);
    equal_cross_correction_message(cross_correction_message_got, cross_correction_message_sent)
  }
}

/* Retail Price Improvement Message: encoded, read back, and compared */
proctype check_retail_price_improvement_message() {
  RetailPriceImprovementMessage retail_price_improvement_message_sent;
  RetailPriceImprovementMessage retail_price_improvement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 0)
  :: pattern == 1 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 32)
  :: pattern == 2 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 255)
  :: else -> ramp_retail_price_improvement_message(retail_price_improvement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retail_price_improvement_message(retail_price_improvement_message_sent);
    assert(at == 13);
    at = 0;
    decode_retail_price_improvement_message(retail_price_improvement_message_got);
    assert(at == 13);
    equal_retail_price_improvement_message(retail_price_improvement_message_got, retail_price_improvement_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_send_time()
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sequence_number_reset_message()
  :: run check_source_time_reference_message()
  :: run check_symbol_index_mapping_message()
  :: run check_symbol_clear_message()
  :: run check_security_status_message()
  :: run check_message_unavailable_message()
  :: run check_add_order_message()
  :: run check_modify_order_message()
  :: run check_delete_order_message()
  :: run check_order_execution_message()
  :: run check_replace_order_message()
  :: run check_imbalance_message()
  :: run check_add_order_refresh_message()
  :: run check_non_displayed_trade_message()
  :: run check_cross_trade_message()
  :: run check_trade_cancel_message()
  :: run check_cross_correction_message()
  :: run check_retail_price_improvement_message()
  fi
}
