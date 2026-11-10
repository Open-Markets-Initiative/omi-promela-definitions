/*
 * New York Stock Exchange Top Feed
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
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 61

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

/* ---- Time Reference Message: 12 bytes ---------------------------------------- */

/* This message is sent at the start of every second during periods of active data publication */
typedef TimeReferenceMessage {
  byte id[4];
  byte reserved_4[4];
  byte source_time[4]
};

int time_reference_message_at;

/* every byte of Time Reference Message set to one value */
inline fill_time_reference_message(time_reference_message_record, time_reference_message_value) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.id[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.reserved_4[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.source_time[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Reference Message set to where it lies, so a field read out of place says so */
inline ramp_time_reference_message(time_reference_message_record, time_reference_message_base) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.id[time_reference_message_at] = (time_reference_message_base + 0 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.reserved_4[time_reference_message_at] = (time_reference_message_base + 4 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.source_time[time_reference_message_at] = (time_reference_message_base + 8 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message to the wire, 12 bytes from where the cursor stands */
inline encode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.id[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.reserved_4[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.source_time[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message off the wire, 12 bytes from where the cursor stands */
inline decode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.id[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.reserved_4[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.source_time[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Reference Message is what was written, byte for byte */
inline equal_time_reference_message(time_reference_message_read, time_reference_message_written) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.id[time_reference_message_at] == time_reference_message_written.id[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.reserved_4[time_reference_message_at] == time_reference_message_written.reserved_4[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.source_time[time_reference_message_at] == time_reference_message_written.source_time[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Index Mapping Message: 40 bytes ---------------------------------- */

/* This message is published over the real-time data channels at system startup or in the context of a refresh sequence after a Matching Engine or XDP Publisher failover. It provides referential data for a single specified symbol. */
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
  byte reserved_6[6]
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
  :: symbol_index_mapping_message_at < 6 -> symbol_index_mapping_message_record.reserved_6[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
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
  :: symbol_index_mapping_message_at < 6 -> symbol_index_mapping_message_record.reserved_6[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 34 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
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
  :: symbol_index_mapping_message_at < 6 -> wire[at] = symbol_index_mapping_message_record.reserved_6[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
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
  :: symbol_index_mapping_message_at < 6 -> symbol_index_mapping_message_record.reserved_6[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
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
  :: symbol_index_mapping_message_at < 6 -> assert(symbol_index_mapping_message_read.reserved_6[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.reserved_6[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request Message: 20 bytes -------------------------------- */

/* Clients who have experienced a sequence number gap and need a retransmission of the missed messages should send a Retransmission Request message via TCP to the Request Controller. A Request Response message will be sent over the TCP connection back to the client, and if the request was valid, the requested message(s) will be re-published over the relevant Retransmission multicast channel. */
typedef RetransmissionRequestMessage {
  byte begin_seq_num[4];
  byte end_seq_num[4];
  byte source_id[10];
  byte product_id;
  byte channel_id
};

int retransmission_request_message_at;

/* every byte of Retransmission Request Message set to one value */
inline fill_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_value) {
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
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.source_id[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.product_id = retransmission_request_message_value;
  retransmission_request_message_record.channel_id = retransmission_request_message_value;
  skip
}

/* each byte of Retransmission Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_base) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.begin_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 0 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.end_seq_num[retransmission_request_message_at] = (retransmission_request_message_base + 4 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.source_id[retransmission_request_message_at] = (retransmission_request_message_base + 8 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.product_id = (retransmission_request_message_base + 18 + 1) % 256;
  retransmission_request_message_record.channel_id = (retransmission_request_message_base + 19 + 1) % 256;
  skip
}

/* Retransmission Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_retransmission_request_message(retransmission_request_message_record) {
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
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> wire[at] = retransmission_request_message_record.source_id[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_request_message_record.product_id; at = at + 1;
  wire[at] = retransmission_request_message_record.channel_id; at = at + 1;
  skip
}

/* Retransmission Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_retransmission_request_message(retransmission_request_message_record) {
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
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> retransmission_request_message_record.source_id[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.product_id = wire[at]; at = at + 1;
  retransmission_request_message_record.channel_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmission Request Message is what was written, byte for byte */
inline equal_retransmission_request_message(retransmission_request_message_read, retransmission_request_message_written) {
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
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 10 -> assert(retransmission_request_message_read.source_id[retransmission_request_message_at] == retransmission_request_message_written.source_id[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  assert(retransmission_request_message_read.product_id == retransmission_request_message_written.product_id);
  assert(retransmission_request_message_read.channel_id == retransmission_request_message_written.channel_id);
  skip
}

/* ---- Request Response Message: 25 bytes -------------------------------------- */

/* This message will be sent immediately via TCP/IP in response to the client’s request for retransmission, refresh or Symbol Mapping messages. */
typedef RequestResponseMessage {
  byte request_seq_num[4];
  byte begin_seq_num[4];
  byte end_seq_num[4];
  byte source_id[10];
  byte product_id;
  byte channel_id;
  byte status
};

int request_response_message_at;

/* every byte of Request Response Message set to one value */
inline fill_request_response_message(request_response_message_record, request_response_message_value) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.request_seq_num[request_response_message_at] = request_response_message_value; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.begin_seq_num[request_response_message_at] = request_response_message_value; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.end_seq_num[request_response_message_at] = request_response_message_value; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 10 -> request_response_message_record.source_id[request_response_message_at] = request_response_message_value; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_record.product_id = request_response_message_value;
  request_response_message_record.channel_id = request_response_message_value;
  request_response_message_record.status = request_response_message_value;
  skip
}

/* each byte of Request Response Message set to where it lies, so a field read out of place says so */
inline ramp_request_response_message(request_response_message_record, request_response_message_base) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.request_seq_num[request_response_message_at] = (request_response_message_base + 0 + request_response_message_at + 1) % 256; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.begin_seq_num[request_response_message_at] = (request_response_message_base + 4 + request_response_message_at + 1) % 256; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.end_seq_num[request_response_message_at] = (request_response_message_base + 8 + request_response_message_at + 1) % 256; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 10 -> request_response_message_record.source_id[request_response_message_at] = (request_response_message_base + 12 + request_response_message_at + 1) % 256; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_record.product_id = (request_response_message_base + 22 + 1) % 256;
  request_response_message_record.channel_id = (request_response_message_base + 23 + 1) % 256;
  request_response_message_record.status = (request_response_message_base + 24 + 1) % 256;
  skip
}

/* Request Response Message to the wire, 25 bytes from where the cursor stands */
inline encode_request_response_message(request_response_message_record) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> wire[at] = request_response_message_record.request_seq_num[request_response_message_at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> wire[at] = request_response_message_record.begin_seq_num[request_response_message_at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> wire[at] = request_response_message_record.end_seq_num[request_response_message_at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 10 -> wire[at] = request_response_message_record.source_id[request_response_message_at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  wire[at] = request_response_message_record.product_id; at = at + 1;
  wire[at] = request_response_message_record.channel_id; at = at + 1;
  wire[at] = request_response_message_record.status; at = at + 1;
  skip
}

/* Request Response Message off the wire, 25 bytes from where the cursor stands */
inline decode_request_response_message(request_response_message_record) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.request_seq_num[request_response_message_at] = wire[at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.begin_seq_num[request_response_message_at] = wire[at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> request_response_message_record.end_seq_num[request_response_message_at] = wire[at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 10 -> request_response_message_record.source_id[request_response_message_at] = wire[at]; at = at + 1; request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_record.product_id = wire[at]; at = at + 1;
  request_response_message_record.channel_id = wire[at]; at = at + 1;
  request_response_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Request Response Message is what was written, byte for byte */
inline equal_request_response_message(request_response_message_read, request_response_message_written) {
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> assert(request_response_message_read.request_seq_num[request_response_message_at] == request_response_message_written.request_seq_num[request_response_message_at]); request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> assert(request_response_message_read.begin_seq_num[request_response_message_at] == request_response_message_written.begin_seq_num[request_response_message_at]); request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 4 -> assert(request_response_message_read.end_seq_num[request_response_message_at] == request_response_message_written.end_seq_num[request_response_message_at]); request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  request_response_message_at = 0;
  do
  :: request_response_message_at < 10 -> assert(request_response_message_read.source_id[request_response_message_at] == request_response_message_written.source_id[request_response_message_at]); request_response_message_at = request_response_message_at + 1
  :: else -> break
  od;
  assert(request_response_message_read.product_id == request_response_message_written.product_id);
  assert(request_response_message_read.channel_id == request_response_message_written.channel_id);
  assert(request_response_message_read.status == request_response_message_written.status);
  skip
}

/* ---- Heartbeat Response Message: 10 bytes ------------------------------------ */

/* Clients who remain connected to the Retransmission Server intraday must respond to a Heartbeat with a Heartbeat Response message within 5 seconds. If no timely client response is received, the connection will be closed. */
typedef HeartbeatResponseMessage {
  byte source_id[10]
};

int heartbeat_response_message_at;

/* every byte of Heartbeat Response Message set to one value */
inline fill_heartbeat_response_message(heartbeat_response_message_record, heartbeat_response_message_value) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 10 -> heartbeat_response_message_record.source_id[heartbeat_response_message_at] = heartbeat_response_message_value; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Response Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_response_message(heartbeat_response_message_record, heartbeat_response_message_base) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 10 -> heartbeat_response_message_record.source_id[heartbeat_response_message_at] = (heartbeat_response_message_base + 0 + heartbeat_response_message_at + 1) % 256; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response Message to the wire, 10 bytes from where the cursor stands */
inline encode_heartbeat_response_message(heartbeat_response_message_record) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 10 -> wire[at] = heartbeat_response_message_record.source_id[heartbeat_response_message_at]; at = at + 1; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Response Message off the wire, 10 bytes from where the cursor stands */
inline decode_heartbeat_response_message(heartbeat_response_message_record) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 10 -> heartbeat_response_message_record.source_id[heartbeat_response_message_at] = wire[at]; at = at + 1; heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Response Message is what was written, byte for byte */
inline equal_heartbeat_response_message(heartbeat_response_message_read, heartbeat_response_message_written) {
  heartbeat_response_message_at = 0;
  do
  :: heartbeat_response_message_at < 10 -> assert(heartbeat_response_message_read.source_id[heartbeat_response_message_at] == heartbeat_response_message_written.source_id[heartbeat_response_message_at]); heartbeat_response_message_at = heartbeat_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Index Mapping Request Message: 17 bytes -------------------------- */

/* This message is sent by clients via TCP/IP requesting the Symbol Index Mapping messages for one or all symbols in a specified channel. */
typedef SymbolIndexMappingRequestMessage {
  byte symbol_index[4];
  byte source_id[10];
  byte product_id;
  byte channel_id;
  byte retransmit_method
};

int symbol_index_mapping_request_message_at;

/* every byte of Symbol Index Mapping Request Message set to one value */
inline fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record, symbol_index_mapping_request_message_value) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at] = symbol_index_mapping_request_message_value; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 10 -> symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at] = symbol_index_mapping_request_message_value; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_record.product_id = symbol_index_mapping_request_message_value;
  symbol_index_mapping_request_message_record.channel_id = symbol_index_mapping_request_message_value;
  symbol_index_mapping_request_message_record.retransmit_method = symbol_index_mapping_request_message_value;
  skip
}

/* each byte of Symbol Index Mapping Request Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record, symbol_index_mapping_request_message_base) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at] = (symbol_index_mapping_request_message_base + 0 + symbol_index_mapping_request_message_at + 1) % 256; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 10 -> symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at] = (symbol_index_mapping_request_message_base + 4 + symbol_index_mapping_request_message_at + 1) % 256; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_record.product_id = (symbol_index_mapping_request_message_base + 14 + 1) % 256;
  symbol_index_mapping_request_message_record.channel_id = (symbol_index_mapping_request_message_base + 15 + 1) % 256;
  symbol_index_mapping_request_message_record.retransmit_method = (symbol_index_mapping_request_message_base + 16 + 1) % 256;
  skip
}

/* Symbol Index Mapping Request Message to the wire, 17 bytes from where the cursor stands */
inline encode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> wire[at] = symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 10 -> wire[at] = symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_index_mapping_request_message_record.product_id; at = at + 1;
  wire[at] = symbol_index_mapping_request_message_record.channel_id; at = at + 1;
  wire[at] = symbol_index_mapping_request_message_record.retransmit_method; at = at + 1;
  skip
}

/* Symbol Index Mapping Request Message off the wire, 17 bytes from where the cursor stands */
inline decode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_record) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> symbol_index_mapping_request_message_record.symbol_index[symbol_index_mapping_request_message_at] = wire[at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 10 -> symbol_index_mapping_request_message_record.source_id[symbol_index_mapping_request_message_at] = wire[at]; at = at + 1; symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_record.product_id = wire[at]; at = at + 1;
  symbol_index_mapping_request_message_record.channel_id = wire[at]; at = at + 1;
  symbol_index_mapping_request_message_record.retransmit_method = wire[at]; at = at + 1;
  skip
}

/* what was read of Symbol Index Mapping Request Message is what was written, byte for byte */
inline equal_symbol_index_mapping_request_message(symbol_index_mapping_request_message_read, symbol_index_mapping_request_message_written) {
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 4 -> assert(symbol_index_mapping_request_message_read.symbol_index[symbol_index_mapping_request_message_at] == symbol_index_mapping_request_message_written.symbol_index[symbol_index_mapping_request_message_at]); symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_request_message_at = 0;
  do
  :: symbol_index_mapping_request_message_at < 10 -> assert(symbol_index_mapping_request_message_read.source_id[symbol_index_mapping_request_message_at] == symbol_index_mapping_request_message_written.source_id[symbol_index_mapping_request_message_at]); symbol_index_mapping_request_message_at = symbol_index_mapping_request_message_at + 1
  :: else -> break
  od;
  assert(symbol_index_mapping_request_message_read.product_id == symbol_index_mapping_request_message_written.product_id);
  assert(symbol_index_mapping_request_message_read.channel_id == symbol_index_mapping_request_message_written.channel_id);
  assert(symbol_index_mapping_request_message_read.retransmit_method == symbol_index_mapping_request_message_written.retransmit_method);
  skip
}

/* ---- Refresh Request Message: 16 bytes --------------------------------------- */

/* Clients who have experienced a failure and need a refresh of the state of one or all symbols in a specific channel should send a Retransmission Request message via TCP to the Request Controller. A Request Response message will be sent over the TCP connection back to the client, and if the request was valid, the requested message(s) will be published over the relevant Refresh multicast channel. */
typedef RefreshRequestMessage {
  byte symbol_index[4];
  byte source_id[10];
  byte product_id;
  byte channel_id
};

int refresh_request_message_at;

/* every byte of Refresh Request Message set to one value */
inline fill_refresh_request_message(refresh_request_message_record, refresh_request_message_value) {
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 4 -> refresh_request_message_record.symbol_index[refresh_request_message_at] = refresh_request_message_value; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 10 -> refresh_request_message_record.source_id[refresh_request_message_at] = refresh_request_message_value; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_record.product_id = refresh_request_message_value;
  refresh_request_message_record.channel_id = refresh_request_message_value;
  skip
}

/* each byte of Refresh Request Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_request_message(refresh_request_message_record, refresh_request_message_base) {
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 4 -> refresh_request_message_record.symbol_index[refresh_request_message_at] = (refresh_request_message_base + 0 + refresh_request_message_at + 1) % 256; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 10 -> refresh_request_message_record.source_id[refresh_request_message_at] = (refresh_request_message_base + 4 + refresh_request_message_at + 1) % 256; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_record.product_id = (refresh_request_message_base + 14 + 1) % 256;
  refresh_request_message_record.channel_id = (refresh_request_message_base + 15 + 1) % 256;
  skip
}

/* Refresh Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_refresh_request_message(refresh_request_message_record) {
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 4 -> wire[at] = refresh_request_message_record.symbol_index[refresh_request_message_at]; at = at + 1; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 10 -> wire[at] = refresh_request_message_record.source_id[refresh_request_message_at]; at = at + 1; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_request_message_record.product_id; at = at + 1;
  wire[at] = refresh_request_message_record.channel_id; at = at + 1;
  skip
}

/* Refresh Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_refresh_request_message(refresh_request_message_record) {
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 4 -> refresh_request_message_record.symbol_index[refresh_request_message_at] = wire[at]; at = at + 1; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 10 -> refresh_request_message_record.source_id[refresh_request_message_at] = wire[at]; at = at + 1; refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_record.product_id = wire[at]; at = at + 1;
  refresh_request_message_record.channel_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Refresh Request Message is what was written, byte for byte */
inline equal_refresh_request_message(refresh_request_message_read, refresh_request_message_written) {
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 4 -> assert(refresh_request_message_read.symbol_index[refresh_request_message_at] == refresh_request_message_written.symbol_index[refresh_request_message_at]); refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  refresh_request_message_at = 0;
  do
  :: refresh_request_message_at < 10 -> assert(refresh_request_message_read.source_id[refresh_request_message_at] == refresh_request_message_written.source_id[refresh_request_message_at]); refresh_request_message_at = refresh_request_message_at + 1
  :: else -> break
  od;
  assert(refresh_request_message_read.product_id == refresh_request_message_written.product_id);
  assert(refresh_request_message_read.channel_id == refresh_request_message_written.channel_id);
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

/* ---- Symbol Clear Message: 16 bytes ------------------------------------------ */

/* In case of a failure and recovery of a Matching Engine or an XDP Publisher, the publisher may send a full state refresh for every symbol affected. This kind of unrequested refresh is preceded by a Symbol Clear message. The client should react to receipt of a Symbol Clear message by clearing all state information for the specified symbol in anticipation of receiving a full state refresh. */
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

/* ---- Outright Series Index Mapping Message: 51 bytes ------------------------- */

/* This message is published over the real-time data channels at system startup or in the context of a refresh sequence after a Matching Engine or PILLAR Publisher failover. */
typedef OutrightSeriesIndexMappingMessage {
  byte series_index[4];
  byte series_type;
  byte market_id[2];
  byte system_id;
  byte option_symbol_root[6];
  byte underlying_symbol[11];
  byte underlying_index[4];
  byte price_scale_code;
  byte contract_multiplier[2];
  byte maturity_date[6];
  byte put_or_call;
  byte strike_price[10];
  byte closing_only_indicator;
  byte reserved_1
};

int outright_series_index_mapping_message_at;

/* every byte of Outright Series Index Mapping Message set to one value */
inline fill_outright_series_index_mapping_message(outright_series_index_mapping_message_record, outright_series_index_mapping_message_value) {
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> outright_series_index_mapping_message_record.series_index[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.series_type = outright_series_index_mapping_message_value;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> outright_series_index_mapping_message_record.market_id[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.system_id = outright_series_index_mapping_message_value;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> outright_series_index_mapping_message_record.option_symbol_root[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 11 -> outright_series_index_mapping_message_record.underlying_symbol[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> outright_series_index_mapping_message_record.underlying_index[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.price_scale_code = outright_series_index_mapping_message_value;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> outright_series_index_mapping_message_record.contract_multiplier[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> outright_series_index_mapping_message_record.maturity_date[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.put_or_call = outright_series_index_mapping_message_value;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 10 -> outright_series_index_mapping_message_record.strike_price[outright_series_index_mapping_message_at] = outright_series_index_mapping_message_value; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.closing_only_indicator = outright_series_index_mapping_message_value;
  outright_series_index_mapping_message_record.reserved_1 = outright_series_index_mapping_message_value;
  skip
}

/* each byte of Outright Series Index Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_outright_series_index_mapping_message(outright_series_index_mapping_message_record, outright_series_index_mapping_message_base) {
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> outright_series_index_mapping_message_record.series_index[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 0 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.series_type = (outright_series_index_mapping_message_base + 4 + 1) % 256;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> outright_series_index_mapping_message_record.market_id[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 5 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.system_id = (outright_series_index_mapping_message_base + 7 + 1) % 256;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> outright_series_index_mapping_message_record.option_symbol_root[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 8 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 11 -> outright_series_index_mapping_message_record.underlying_symbol[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 14 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> outright_series_index_mapping_message_record.underlying_index[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 25 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.price_scale_code = (outright_series_index_mapping_message_base + 29 + 1) % 256;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> outright_series_index_mapping_message_record.contract_multiplier[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 30 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> outright_series_index_mapping_message_record.maturity_date[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 32 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.put_or_call = (outright_series_index_mapping_message_base + 38 + 1) % 256;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 10 -> outright_series_index_mapping_message_record.strike_price[outright_series_index_mapping_message_at] = (outright_series_index_mapping_message_base + 39 + outright_series_index_mapping_message_at + 1) % 256; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.closing_only_indicator = (outright_series_index_mapping_message_base + 49 + 1) % 256;
  outright_series_index_mapping_message_record.reserved_1 = (outright_series_index_mapping_message_base + 50 + 1) % 256;
  skip
}

/* Outright Series Index Mapping Message to the wire, 51 bytes from where the cursor stands */
inline encode_outright_series_index_mapping_message(outright_series_index_mapping_message_record) {
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> wire[at] = outright_series_index_mapping_message_record.series_index[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_series_index_mapping_message_record.series_type; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> wire[at] = outright_series_index_mapping_message_record.market_id[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_series_index_mapping_message_record.system_id; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> wire[at] = outright_series_index_mapping_message_record.option_symbol_root[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 11 -> wire[at] = outright_series_index_mapping_message_record.underlying_symbol[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> wire[at] = outright_series_index_mapping_message_record.underlying_index[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_series_index_mapping_message_record.price_scale_code; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> wire[at] = outright_series_index_mapping_message_record.contract_multiplier[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> wire[at] = outright_series_index_mapping_message_record.maturity_date[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_series_index_mapping_message_record.put_or_call; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 10 -> wire[at] = outright_series_index_mapping_message_record.strike_price[outright_series_index_mapping_message_at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_series_index_mapping_message_record.closing_only_indicator; at = at + 1;
  wire[at] = outright_series_index_mapping_message_record.reserved_1; at = at + 1;
  skip
}

/* Outright Series Index Mapping Message off the wire, 51 bytes from where the cursor stands */
inline decode_outright_series_index_mapping_message(outright_series_index_mapping_message_record) {
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> outright_series_index_mapping_message_record.series_index[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.series_type = wire[at]; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> outright_series_index_mapping_message_record.market_id[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.system_id = wire[at]; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> outright_series_index_mapping_message_record.option_symbol_root[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 11 -> outright_series_index_mapping_message_record.underlying_symbol[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> outright_series_index_mapping_message_record.underlying_index[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.price_scale_code = wire[at]; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> outright_series_index_mapping_message_record.contract_multiplier[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> outright_series_index_mapping_message_record.maturity_date[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.put_or_call = wire[at]; at = at + 1;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 10 -> outright_series_index_mapping_message_record.strike_price[outright_series_index_mapping_message_at] = wire[at]; at = at + 1; outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_record.closing_only_indicator = wire[at]; at = at + 1;
  outright_series_index_mapping_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Outright Series Index Mapping Message is what was written, byte for byte */
inline equal_outright_series_index_mapping_message(outright_series_index_mapping_message_read, outright_series_index_mapping_message_written) {
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> assert(outright_series_index_mapping_message_read.series_index[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.series_index[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(outright_series_index_mapping_message_read.series_type == outright_series_index_mapping_message_written.series_type);
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> assert(outright_series_index_mapping_message_read.market_id[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.market_id[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(outright_series_index_mapping_message_read.system_id == outright_series_index_mapping_message_written.system_id);
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> assert(outright_series_index_mapping_message_read.option_symbol_root[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.option_symbol_root[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 11 -> assert(outright_series_index_mapping_message_read.underlying_symbol[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.underlying_symbol[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 4 -> assert(outright_series_index_mapping_message_read.underlying_index[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.underlying_index[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(outright_series_index_mapping_message_read.price_scale_code == outright_series_index_mapping_message_written.price_scale_code);
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 2 -> assert(outright_series_index_mapping_message_read.contract_multiplier[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.contract_multiplier[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 6 -> assert(outright_series_index_mapping_message_read.maturity_date[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.maturity_date[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(outright_series_index_mapping_message_read.put_or_call == outright_series_index_mapping_message_written.put_or_call);
  outright_series_index_mapping_message_at = 0;
  do
  :: outright_series_index_mapping_message_at < 10 -> assert(outright_series_index_mapping_message_read.strike_price[outright_series_index_mapping_message_at] == outright_series_index_mapping_message_written.strike_price[outright_series_index_mapping_message_at]); outright_series_index_mapping_message_at = outright_series_index_mapping_message_at + 1
  :: else -> break
  od;
  assert(outright_series_index_mapping_message_read.closing_only_indicator == outright_series_index_mapping_message_written.closing_only_indicator);
  assert(outright_series_index_mapping_message_read.reserved_1 == outright_series_index_mapping_message_written.reserved_1);
  skip
}

/* ---- Options Status Message: 19 bytes ---------------------------------------- */

/* This message informs clients of changes in the status of a specific option outright series and complex series */
typedef OptionsStatusMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte series_seq_num[4];
  byte series_status;
  byte market_state;
  byte halt_condition
};

int options_status_message_at;

/* every byte of Options Status Message set to one value */
inline fill_options_status_message(options_status_message_record, options_status_message_value) {
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.source_time[options_status_message_at] = options_status_message_value; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.source_time_ns[options_status_message_at] = options_status_message_value; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.series_index[options_status_message_at] = options_status_message_value; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.series_seq_num[options_status_message_at] = options_status_message_value; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_record.series_status = options_status_message_value;
  options_status_message_record.market_state = options_status_message_value;
  options_status_message_record.halt_condition = options_status_message_value;
  skip
}

/* each byte of Options Status Message set to where it lies, so a field read out of place says so */
inline ramp_options_status_message(options_status_message_record, options_status_message_base) {
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.source_time[options_status_message_at] = (options_status_message_base + 0 + options_status_message_at + 1) % 256; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.source_time_ns[options_status_message_at] = (options_status_message_base + 4 + options_status_message_at + 1) % 256; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.series_index[options_status_message_at] = (options_status_message_base + 8 + options_status_message_at + 1) % 256; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.series_seq_num[options_status_message_at] = (options_status_message_base + 12 + options_status_message_at + 1) % 256; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_record.series_status = (options_status_message_base + 16 + 1) % 256;
  options_status_message_record.market_state = (options_status_message_base + 17 + 1) % 256;
  options_status_message_record.halt_condition = (options_status_message_base + 18 + 1) % 256;
  skip
}

/* Options Status Message to the wire, 19 bytes from where the cursor stands */
inline encode_options_status_message(options_status_message_record) {
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> wire[at] = options_status_message_record.source_time[options_status_message_at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> wire[at] = options_status_message_record.source_time_ns[options_status_message_at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> wire[at] = options_status_message_record.series_index[options_status_message_at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> wire[at] = options_status_message_record.series_seq_num[options_status_message_at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  wire[at] = options_status_message_record.series_status; at = at + 1;
  wire[at] = options_status_message_record.market_state; at = at + 1;
  wire[at] = options_status_message_record.halt_condition; at = at + 1;
  skip
}

/* Options Status Message off the wire, 19 bytes from where the cursor stands */
inline decode_options_status_message(options_status_message_record) {
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.source_time[options_status_message_at] = wire[at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.source_time_ns[options_status_message_at] = wire[at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.series_index[options_status_message_at] = wire[at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> options_status_message_record.series_seq_num[options_status_message_at] = wire[at]; at = at + 1; options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_record.series_status = wire[at]; at = at + 1;
  options_status_message_record.market_state = wire[at]; at = at + 1;
  options_status_message_record.halt_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Options Status Message is what was written, byte for byte */
inline equal_options_status_message(options_status_message_read, options_status_message_written) {
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> assert(options_status_message_read.source_time[options_status_message_at] == options_status_message_written.source_time[options_status_message_at]); options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> assert(options_status_message_read.source_time_ns[options_status_message_at] == options_status_message_written.source_time_ns[options_status_message_at]); options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> assert(options_status_message_read.series_index[options_status_message_at] == options_status_message_written.series_index[options_status_message_at]); options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  options_status_message_at = 0;
  do
  :: options_status_message_at < 4 -> assert(options_status_message_read.series_seq_num[options_status_message_at] == options_status_message_written.series_seq_num[options_status_message_at]); options_status_message_at = options_status_message_at + 1
  :: else -> break
  od;
  assert(options_status_message_read.series_status == options_status_message_written.series_status);
  assert(options_status_message_read.market_state == options_status_message_written.market_state);
  assert(options_status_message_read.halt_condition == options_status_message_written.halt_condition);
  skip
}

/* ---- Options Quote Message: 38 bytes ----------------------------------------- */

/* An Options quote message is sent when any event results in a new top of book value on either side of the market */
typedef OptionsQuoteMessage {
  byte source_time_ns[4];
  byte series_index[4];
  byte series_seq_num[4];
  byte ask_price[4];
  byte ask_volume[4];
  byte bid_price[4];
  byte bid_volume[4];
  byte quote_condition;
  byte reserved_1;
  byte ask_customer_volume[4];
  byte bid_customer_volume[4]
};

int options_quote_message_at;

/* every byte of Options Quote Message set to one value */
inline fill_options_quote_message(options_quote_message_record, options_quote_message_value) {
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.source_time_ns[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.series_index[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.series_seq_num[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_price[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_volume[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_price[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_volume[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_record.quote_condition = options_quote_message_value;
  options_quote_message_record.reserved_1 = options_quote_message_value;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_customer_volume[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_customer_volume[options_quote_message_at] = options_quote_message_value; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Quote Message set to where it lies, so a field read out of place says so */
inline ramp_options_quote_message(options_quote_message_record, options_quote_message_base) {
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.source_time_ns[options_quote_message_at] = (options_quote_message_base + 0 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.series_index[options_quote_message_at] = (options_quote_message_base + 4 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.series_seq_num[options_quote_message_at] = (options_quote_message_base + 8 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_price[options_quote_message_at] = (options_quote_message_base + 12 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_volume[options_quote_message_at] = (options_quote_message_base + 16 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_price[options_quote_message_at] = (options_quote_message_base + 20 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_volume[options_quote_message_at] = (options_quote_message_base + 24 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_record.quote_condition = (options_quote_message_base + 28 + 1) % 256;
  options_quote_message_record.reserved_1 = (options_quote_message_base + 29 + 1) % 256;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_customer_volume[options_quote_message_at] = (options_quote_message_base + 30 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_customer_volume[options_quote_message_at] = (options_quote_message_base + 34 + options_quote_message_at + 1) % 256; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Quote Message to the wire, 38 bytes from where the cursor stands */
inline encode_options_quote_message(options_quote_message_record) {
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.source_time_ns[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.series_index[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.series_seq_num[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.ask_price[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.ask_volume[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.bid_price[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.bid_volume[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = options_quote_message_record.quote_condition; at = at + 1;
  wire[at] = options_quote_message_record.reserved_1; at = at + 1;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.ask_customer_volume[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> wire[at] = options_quote_message_record.bid_customer_volume[options_quote_message_at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Quote Message off the wire, 38 bytes from where the cursor stands */
inline decode_options_quote_message(options_quote_message_record) {
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.source_time_ns[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.series_index[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.series_seq_num[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_price[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_volume[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_price[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_volume[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_record.quote_condition = wire[at]; at = at + 1;
  options_quote_message_record.reserved_1 = wire[at]; at = at + 1;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.ask_customer_volume[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> options_quote_message_record.bid_customer_volume[options_quote_message_at] = wire[at]; at = at + 1; options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Quote Message is what was written, byte for byte */
inline equal_options_quote_message(options_quote_message_read, options_quote_message_written) {
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.source_time_ns[options_quote_message_at] == options_quote_message_written.source_time_ns[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.series_index[options_quote_message_at] == options_quote_message_written.series_index[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.series_seq_num[options_quote_message_at] == options_quote_message_written.series_seq_num[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.ask_price[options_quote_message_at] == options_quote_message_written.ask_price[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.ask_volume[options_quote_message_at] == options_quote_message_written.ask_volume[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.bid_price[options_quote_message_at] == options_quote_message_written.bid_price[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.bid_volume[options_quote_message_at] == options_quote_message_written.bid_volume[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  assert(options_quote_message_read.quote_condition == options_quote_message_written.quote_condition);
  assert(options_quote_message_read.reserved_1 == options_quote_message_written.reserved_1);
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.ask_customer_volume[options_quote_message_at] == options_quote_message_written.ask_customer_volume[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  options_quote_message_at = 0;
  do
  :: options_quote_message_at < 4 -> assert(options_quote_message_read.bid_customer_volume[options_quote_message_at] == options_quote_message_written.bid_customer_volume[options_quote_message_at]); options_quote_message_at = options_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Condition: 4 bytes ------------------------------------------------ */

/* Trade Condition */
typedef TradeCondition {
  byte series;
  byte opening;
  byte reserved_1;
  byte offical
};

/* every byte of Trade Condition set to one value */
inline fill_trade_condition(trade_condition_record, trade_condition_value) {
  trade_condition_record.series = trade_condition_value;
  trade_condition_record.opening = trade_condition_value;
  trade_condition_record.reserved_1 = trade_condition_value;
  trade_condition_record.offical = trade_condition_value;
  skip
}

/* each byte of Trade Condition set to where it lies, so a field read out of place says so */
inline ramp_trade_condition(trade_condition_record, trade_condition_base) {
  trade_condition_record.series = (trade_condition_base + 0 + 1) % 256;
  trade_condition_record.opening = (trade_condition_base + 1 + 1) % 256;
  trade_condition_record.reserved_1 = (trade_condition_base + 2 + 1) % 256;
  trade_condition_record.offical = (trade_condition_base + 3 + 1) % 256;
  skip
}

/* Trade Condition to the wire, 4 bytes from where the cursor stands */
inline encode_trade_condition(trade_condition_record) {
  wire[at] = trade_condition_record.series; at = at + 1;
  wire[at] = trade_condition_record.opening; at = at + 1;
  wire[at] = trade_condition_record.reserved_1; at = at + 1;
  wire[at] = trade_condition_record.offical; at = at + 1;
  skip
}

/* Trade Condition off the wire, 4 bytes from where the cursor stands */
inline decode_trade_condition(trade_condition_record) {
  trade_condition_record.series = wire[at]; at = at + 1;
  trade_condition_record.opening = wire[at]; at = at + 1;
  trade_condition_record.reserved_1 = wire[at]; at = at + 1;
  trade_condition_record.offical = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Condition is what was written, byte for byte */
inline equal_trade_condition(trade_condition_read, trade_condition_written) {
  assert(trade_condition_read.series == trade_condition_written.series);
  assert(trade_condition_read.opening == trade_condition_written.opening);
  assert(trade_condition_read.reserved_1 == trade_condition_written.reserved_1);
  assert(trade_condition_read.offical == trade_condition_written.offical);
  skip
}

/* ---- Options Trade Message: 32 bytes ----------------------------------------- */

/* An Options Trade message is sent when there is an execution on the order book. */
typedef OptionsTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte series_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte volume[4];
  TradeCondition trade_condition
};

int options_trade_message_at;

/* every byte of Options Trade Message set to one value */
inline fill_options_trade_message(options_trade_message_record, options_trade_message_value) {
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.source_time[options_trade_message_at] = options_trade_message_value; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.source_time_ns[options_trade_message_at] = options_trade_message_value; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.series_index[options_trade_message_at] = options_trade_message_value; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.series_seq_num[options_trade_message_at] = options_trade_message_value; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.trade_id[options_trade_message_at] = options_trade_message_value; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.price[options_trade_message_at] = options_trade_message_value; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.volume[options_trade_message_at] = options_trade_message_value; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  fill_trade_condition(options_trade_message_record.trade_condition, options_trade_message_value);
  skip
}

/* each byte of Options Trade Message set to where it lies, so a field read out of place says so */
inline ramp_options_trade_message(options_trade_message_record, options_trade_message_base) {
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.source_time[options_trade_message_at] = (options_trade_message_base + 0 + options_trade_message_at + 1) % 256; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.source_time_ns[options_trade_message_at] = (options_trade_message_base + 4 + options_trade_message_at + 1) % 256; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.series_index[options_trade_message_at] = (options_trade_message_base + 8 + options_trade_message_at + 1) % 256; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.series_seq_num[options_trade_message_at] = (options_trade_message_base + 12 + options_trade_message_at + 1) % 256; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.trade_id[options_trade_message_at] = (options_trade_message_base + 16 + options_trade_message_at + 1) % 256; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.price[options_trade_message_at] = (options_trade_message_base + 20 + options_trade_message_at + 1) % 256; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.volume[options_trade_message_at] = (options_trade_message_base + 24 + options_trade_message_at + 1) % 256; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  ramp_trade_condition(options_trade_message_record.trade_condition, options_trade_message_base + 28);
  skip
}

/* Options Trade Message to the wire, 32 bytes from where the cursor stands */
inline encode_options_trade_message(options_trade_message_record) {
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> wire[at] = options_trade_message_record.source_time[options_trade_message_at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> wire[at] = options_trade_message_record.source_time_ns[options_trade_message_at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> wire[at] = options_trade_message_record.series_index[options_trade_message_at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> wire[at] = options_trade_message_record.series_seq_num[options_trade_message_at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> wire[at] = options_trade_message_record.trade_id[options_trade_message_at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> wire[at] = options_trade_message_record.price[options_trade_message_at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> wire[at] = options_trade_message_record.volume[options_trade_message_at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  encode_trade_condition(options_trade_message_record.trade_condition);
  skip
}

/* Options Trade Message off the wire, 32 bytes from where the cursor stands */
inline decode_options_trade_message(options_trade_message_record) {
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.source_time[options_trade_message_at] = wire[at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.source_time_ns[options_trade_message_at] = wire[at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.series_index[options_trade_message_at] = wire[at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.series_seq_num[options_trade_message_at] = wire[at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.trade_id[options_trade_message_at] = wire[at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.price[options_trade_message_at] = wire[at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> options_trade_message_record.volume[options_trade_message_at] = wire[at]; at = at + 1; options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  decode_trade_condition(options_trade_message_record.trade_condition);
  skip
}

/* what was read of Options Trade Message is what was written, byte for byte */
inline equal_options_trade_message(options_trade_message_read, options_trade_message_written) {
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> assert(options_trade_message_read.source_time[options_trade_message_at] == options_trade_message_written.source_time[options_trade_message_at]); options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> assert(options_trade_message_read.source_time_ns[options_trade_message_at] == options_trade_message_written.source_time_ns[options_trade_message_at]); options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> assert(options_trade_message_read.series_index[options_trade_message_at] == options_trade_message_written.series_index[options_trade_message_at]); options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> assert(options_trade_message_read.series_seq_num[options_trade_message_at] == options_trade_message_written.series_seq_num[options_trade_message_at]); options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> assert(options_trade_message_read.trade_id[options_trade_message_at] == options_trade_message_written.trade_id[options_trade_message_at]); options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> assert(options_trade_message_read.price[options_trade_message_at] == options_trade_message_written.price[options_trade_message_at]); options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  options_trade_message_at = 0;
  do
  :: options_trade_message_at < 4 -> assert(options_trade_message_read.volume[options_trade_message_at] == options_trade_message_written.volume[options_trade_message_at]); options_trade_message_at = options_trade_message_at + 1
  :: else -> break
  od;
  equal_trade_condition(options_trade_message_read.trade_condition, options_trade_message_written.trade_condition);
  skip
}

/* ---- Options Trade Cancel Message: 20 bytes ---------------------------------- */

/* In the event that an earlier trade has been reported in error, an Options Trade Cancel message is sent */
typedef OptionsTradeCancelMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte series_seq_num[4];
  byte original_trade_id[4]
};

int options_trade_cancel_message_at;

/* every byte of Options Trade Cancel Message set to one value */
inline fill_options_trade_cancel_message(options_trade_cancel_message_record, options_trade_cancel_message_value) {
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.source_time[options_trade_cancel_message_at] = options_trade_cancel_message_value; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.source_time_ns[options_trade_cancel_message_at] = options_trade_cancel_message_value; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.series_index[options_trade_cancel_message_at] = options_trade_cancel_message_value; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.series_seq_num[options_trade_cancel_message_at] = options_trade_cancel_message_value; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.original_trade_id[options_trade_cancel_message_at] = options_trade_cancel_message_value; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_options_trade_cancel_message(options_trade_cancel_message_record, options_trade_cancel_message_base) {
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.source_time[options_trade_cancel_message_at] = (options_trade_cancel_message_base + 0 + options_trade_cancel_message_at + 1) % 256; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.source_time_ns[options_trade_cancel_message_at] = (options_trade_cancel_message_base + 4 + options_trade_cancel_message_at + 1) % 256; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.series_index[options_trade_cancel_message_at] = (options_trade_cancel_message_base + 8 + options_trade_cancel_message_at + 1) % 256; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.series_seq_num[options_trade_cancel_message_at] = (options_trade_cancel_message_base + 12 + options_trade_cancel_message_at + 1) % 256; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.original_trade_id[options_trade_cancel_message_at] = (options_trade_cancel_message_base + 16 + options_trade_cancel_message_at + 1) % 256; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Trade Cancel Message to the wire, 20 bytes from where the cursor stands */
inline encode_options_trade_cancel_message(options_trade_cancel_message_record) {
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> wire[at] = options_trade_cancel_message_record.source_time[options_trade_cancel_message_at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> wire[at] = options_trade_cancel_message_record.source_time_ns[options_trade_cancel_message_at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> wire[at] = options_trade_cancel_message_record.series_index[options_trade_cancel_message_at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> wire[at] = options_trade_cancel_message_record.series_seq_num[options_trade_cancel_message_at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> wire[at] = options_trade_cancel_message_record.original_trade_id[options_trade_cancel_message_at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Trade Cancel Message off the wire, 20 bytes from where the cursor stands */
inline decode_options_trade_cancel_message(options_trade_cancel_message_record) {
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.source_time[options_trade_cancel_message_at] = wire[at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.source_time_ns[options_trade_cancel_message_at] = wire[at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.series_index[options_trade_cancel_message_at] = wire[at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.series_seq_num[options_trade_cancel_message_at] = wire[at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> options_trade_cancel_message_record.original_trade_id[options_trade_cancel_message_at] = wire[at]; at = at + 1; options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Trade Cancel Message is what was written, byte for byte */
inline equal_options_trade_cancel_message(options_trade_cancel_message_read, options_trade_cancel_message_written) {
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> assert(options_trade_cancel_message_read.source_time[options_trade_cancel_message_at] == options_trade_cancel_message_written.source_time[options_trade_cancel_message_at]); options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> assert(options_trade_cancel_message_read.source_time_ns[options_trade_cancel_message_at] == options_trade_cancel_message_written.source_time_ns[options_trade_cancel_message_at]); options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> assert(options_trade_cancel_message_read.series_index[options_trade_cancel_message_at] == options_trade_cancel_message_written.series_index[options_trade_cancel_message_at]); options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> assert(options_trade_cancel_message_read.series_seq_num[options_trade_cancel_message_at] == options_trade_cancel_message_written.series_seq_num[options_trade_cancel_message_at]); options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  options_trade_cancel_message_at = 0;
  do
  :: options_trade_cancel_message_at < 4 -> assert(options_trade_cancel_message_read.original_trade_id[options_trade_cancel_message_at] == options_trade_cancel_message_written.original_trade_id[options_trade_cancel_message_at]); options_trade_cancel_message_at = options_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Correction Condition: 4 bytes ------------------------------------------- */

/* Correction Condition */
typedef CorrectionCondition {
  byte transaction;
  byte reserved_3[3]
};

int correction_condition_at;

/* every byte of Correction Condition set to one value */
inline fill_correction_condition(correction_condition_record, correction_condition_value) {
  correction_condition_record.transaction = correction_condition_value;
  correction_condition_at = 0;
  do
  :: correction_condition_at < 3 -> correction_condition_record.reserved_3[correction_condition_at] = correction_condition_value; correction_condition_at = correction_condition_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Correction Condition set to where it lies, so a field read out of place says so */
inline ramp_correction_condition(correction_condition_record, correction_condition_base) {
  correction_condition_record.transaction = (correction_condition_base + 0 + 1) % 256;
  correction_condition_at = 0;
  do
  :: correction_condition_at < 3 -> correction_condition_record.reserved_3[correction_condition_at] = (correction_condition_base + 1 + correction_condition_at + 1) % 256; correction_condition_at = correction_condition_at + 1
  :: else -> break
  od;
  skip
}

/* Correction Condition to the wire, 4 bytes from where the cursor stands */
inline encode_correction_condition(correction_condition_record) {
  wire[at] = correction_condition_record.transaction; at = at + 1;
  correction_condition_at = 0;
  do
  :: correction_condition_at < 3 -> wire[at] = correction_condition_record.reserved_3[correction_condition_at]; at = at + 1; correction_condition_at = correction_condition_at + 1
  :: else -> break
  od;
  skip
}

/* Correction Condition off the wire, 4 bytes from where the cursor stands */
inline decode_correction_condition(correction_condition_record) {
  correction_condition_record.transaction = wire[at]; at = at + 1;
  correction_condition_at = 0;
  do
  :: correction_condition_at < 3 -> correction_condition_record.reserved_3[correction_condition_at] = wire[at]; at = at + 1; correction_condition_at = correction_condition_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Correction Condition is what was written, byte for byte */
inline equal_correction_condition(correction_condition_read, correction_condition_written) {
  assert(correction_condition_read.transaction == correction_condition_written.transaction);
  correction_condition_at = 0;
  do
  :: correction_condition_at < 3 -> assert(correction_condition_read.reserved_3[correction_condition_at] == correction_condition_written.reserved_3[correction_condition_at]); correction_condition_at = correction_condition_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Trade Correction Message: 36 bytes ------------------------------ */

/* In the event that an earlier trade has been reported with one or multiple fields in error */
typedef OptionsTradeCorrectionMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte series_seq_num[4];
  byte original_trade_id[4];
  byte trade_id[4];
  byte price[4];
  byte volume[4];
  CorrectionCondition correction_condition
};

int options_trade_correction_message_at;

/* every byte of Options Trade Correction Message set to one value */
inline fill_options_trade_correction_message(options_trade_correction_message_record, options_trade_correction_message_value) {
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.source_time[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.source_time_ns[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.series_index[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.series_seq_num[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.original_trade_id[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.trade_id[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.price[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.volume[options_trade_correction_message_at] = options_trade_correction_message_value; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  fill_correction_condition(options_trade_correction_message_record.correction_condition, options_trade_correction_message_value);
  skip
}

/* each byte of Options Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_options_trade_correction_message(options_trade_correction_message_record, options_trade_correction_message_base) {
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.source_time[options_trade_correction_message_at] = (options_trade_correction_message_base + 0 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.source_time_ns[options_trade_correction_message_at] = (options_trade_correction_message_base + 4 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.series_index[options_trade_correction_message_at] = (options_trade_correction_message_base + 8 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.series_seq_num[options_trade_correction_message_at] = (options_trade_correction_message_base + 12 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.original_trade_id[options_trade_correction_message_at] = (options_trade_correction_message_base + 16 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.trade_id[options_trade_correction_message_at] = (options_trade_correction_message_base + 20 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.price[options_trade_correction_message_at] = (options_trade_correction_message_base + 24 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.volume[options_trade_correction_message_at] = (options_trade_correction_message_base + 28 + options_trade_correction_message_at + 1) % 256; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  ramp_correction_condition(options_trade_correction_message_record.correction_condition, options_trade_correction_message_base + 32);
  skip
}

/* Options Trade Correction Message to the wire, 36 bytes from where the cursor stands */
inline encode_options_trade_correction_message(options_trade_correction_message_record) {
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.source_time[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.source_time_ns[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.series_index[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.series_seq_num[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.original_trade_id[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.trade_id[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.price[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> wire[at] = options_trade_correction_message_record.volume[options_trade_correction_message_at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  encode_correction_condition(options_trade_correction_message_record.correction_condition);
  skip
}

/* Options Trade Correction Message off the wire, 36 bytes from where the cursor stands */
inline decode_options_trade_correction_message(options_trade_correction_message_record) {
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.source_time[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.source_time_ns[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.series_index[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.series_seq_num[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.original_trade_id[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.trade_id[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.price[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> options_trade_correction_message_record.volume[options_trade_correction_message_at] = wire[at]; at = at + 1; options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  decode_correction_condition(options_trade_correction_message_record.correction_condition);
  skip
}

/* what was read of Options Trade Correction Message is what was written, byte for byte */
inline equal_options_trade_correction_message(options_trade_correction_message_read, options_trade_correction_message_written) {
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.source_time[options_trade_correction_message_at] == options_trade_correction_message_written.source_time[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.source_time_ns[options_trade_correction_message_at] == options_trade_correction_message_written.source_time_ns[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.series_index[options_trade_correction_message_at] == options_trade_correction_message_written.series_index[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.series_seq_num[options_trade_correction_message_at] == options_trade_correction_message_written.series_seq_num[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.original_trade_id[options_trade_correction_message_at] == options_trade_correction_message_written.original_trade_id[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.trade_id[options_trade_correction_message_at] == options_trade_correction_message_written.trade_id[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.price[options_trade_correction_message_at] == options_trade_correction_message_written.price[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  options_trade_correction_message_at = 0;
  do
  :: options_trade_correction_message_at < 4 -> assert(options_trade_correction_message_read.volume[options_trade_correction_message_at] == options_trade_correction_message_written.volume[options_trade_correction_message_at]); options_trade_correction_message_at = options_trade_correction_message_at + 1
  :: else -> break
  od;
  equal_correction_condition(options_trade_correction_message_read.correction_condition, options_trade_correction_message_written.correction_condition);
  skip
}

/* ---- Options Imbalance Message: 61 bytes ------------------------------------- */

/* Options Imbalance messages are published once a second during opening and reopening auctions to update price and volume information */
typedef OptionsImbalanceMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte series_seq_num[4];
  byte reserved_4[4];
  byte paired_qty[4];
  byte total_imbalance_qty[4];
  byte market_imbalance_qty[4];
  byte reserved_2[2];
  byte auction_type;
  byte imbalance_side;
  byte continuous_book_clearing_price[4];
  byte auction_interest_clearing_price[4];
  byte second_reserved_4[4];
  byte indicative_match_price[4];
  byte upper_collar[4];
  byte lower_collar[4];
  byte auction_status
};

int options_imbalance_message_at;

/* every byte of Options Imbalance Message set to one value */
inline fill_options_imbalance_message(options_imbalance_message_record, options_imbalance_message_value) {
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.source_time[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.source_time_ns[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.series_index[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.series_seq_num[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.reserved_4[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.paired_qty[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.total_imbalance_qty[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.market_imbalance_qty[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 2 -> options_imbalance_message_record.reserved_2[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_record.auction_type = options_imbalance_message_value;
  options_imbalance_message_record.imbalance_side = options_imbalance_message_value;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.continuous_book_clearing_price[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.auction_interest_clearing_price[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.second_reserved_4[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.indicative_match_price[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.upper_collar[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.lower_collar[options_imbalance_message_at] = options_imbalance_message_value; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_record.auction_status = options_imbalance_message_value;
  skip
}

/* each byte of Options Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_options_imbalance_message(options_imbalance_message_record, options_imbalance_message_base) {
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.source_time[options_imbalance_message_at] = (options_imbalance_message_base + 0 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.source_time_ns[options_imbalance_message_at] = (options_imbalance_message_base + 4 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.series_index[options_imbalance_message_at] = (options_imbalance_message_base + 8 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.series_seq_num[options_imbalance_message_at] = (options_imbalance_message_base + 12 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.reserved_4[options_imbalance_message_at] = (options_imbalance_message_base + 16 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.paired_qty[options_imbalance_message_at] = (options_imbalance_message_base + 20 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.total_imbalance_qty[options_imbalance_message_at] = (options_imbalance_message_base + 24 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.market_imbalance_qty[options_imbalance_message_at] = (options_imbalance_message_base + 28 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 2 -> options_imbalance_message_record.reserved_2[options_imbalance_message_at] = (options_imbalance_message_base + 32 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_record.auction_type = (options_imbalance_message_base + 34 + 1) % 256;
  options_imbalance_message_record.imbalance_side = (options_imbalance_message_base + 35 + 1) % 256;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.continuous_book_clearing_price[options_imbalance_message_at] = (options_imbalance_message_base + 36 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.auction_interest_clearing_price[options_imbalance_message_at] = (options_imbalance_message_base + 40 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.second_reserved_4[options_imbalance_message_at] = (options_imbalance_message_base + 44 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.indicative_match_price[options_imbalance_message_at] = (options_imbalance_message_base + 48 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.upper_collar[options_imbalance_message_at] = (options_imbalance_message_base + 52 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.lower_collar[options_imbalance_message_at] = (options_imbalance_message_base + 56 + options_imbalance_message_at + 1) % 256; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_record.auction_status = (options_imbalance_message_base + 60 + 1) % 256;
  skip
}

/* Options Imbalance Message to the wire, 61 bytes from where the cursor stands */
inline encode_options_imbalance_message(options_imbalance_message_record) {
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.source_time[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.source_time_ns[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.series_index[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.series_seq_num[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.reserved_4[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.paired_qty[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.total_imbalance_qty[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.market_imbalance_qty[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 2 -> wire[at] = options_imbalance_message_record.reserved_2[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = options_imbalance_message_record.auction_type; at = at + 1;
  wire[at] = options_imbalance_message_record.imbalance_side; at = at + 1;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.continuous_book_clearing_price[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.auction_interest_clearing_price[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.second_reserved_4[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.indicative_match_price[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.upper_collar[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> wire[at] = options_imbalance_message_record.lower_collar[options_imbalance_message_at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = options_imbalance_message_record.auction_status; at = at + 1;
  skip
}

/* Options Imbalance Message off the wire, 61 bytes from where the cursor stands */
inline decode_options_imbalance_message(options_imbalance_message_record) {
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.source_time[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.source_time_ns[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.series_index[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.series_seq_num[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.reserved_4[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.paired_qty[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.total_imbalance_qty[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.market_imbalance_qty[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 2 -> options_imbalance_message_record.reserved_2[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_record.auction_type = wire[at]; at = at + 1;
  options_imbalance_message_record.imbalance_side = wire[at]; at = at + 1;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.continuous_book_clearing_price[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.auction_interest_clearing_price[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.second_reserved_4[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.indicative_match_price[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.upper_collar[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> options_imbalance_message_record.lower_collar[options_imbalance_message_at] = wire[at]; at = at + 1; options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_record.auction_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Options Imbalance Message is what was written, byte for byte */
inline equal_options_imbalance_message(options_imbalance_message_read, options_imbalance_message_written) {
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.source_time[options_imbalance_message_at] == options_imbalance_message_written.source_time[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.source_time_ns[options_imbalance_message_at] == options_imbalance_message_written.source_time_ns[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.series_index[options_imbalance_message_at] == options_imbalance_message_written.series_index[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.series_seq_num[options_imbalance_message_at] == options_imbalance_message_written.series_seq_num[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.reserved_4[options_imbalance_message_at] == options_imbalance_message_written.reserved_4[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.paired_qty[options_imbalance_message_at] == options_imbalance_message_written.paired_qty[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.total_imbalance_qty[options_imbalance_message_at] == options_imbalance_message_written.total_imbalance_qty[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.market_imbalance_qty[options_imbalance_message_at] == options_imbalance_message_written.market_imbalance_qty[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 2 -> assert(options_imbalance_message_read.reserved_2[options_imbalance_message_at] == options_imbalance_message_written.reserved_2[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  assert(options_imbalance_message_read.auction_type == options_imbalance_message_written.auction_type);
  assert(options_imbalance_message_read.imbalance_side == options_imbalance_message_written.imbalance_side);
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.continuous_book_clearing_price[options_imbalance_message_at] == options_imbalance_message_written.continuous_book_clearing_price[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.auction_interest_clearing_price[options_imbalance_message_at] == options_imbalance_message_written.auction_interest_clearing_price[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.second_reserved_4[options_imbalance_message_at] == options_imbalance_message_written.second_reserved_4[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.indicative_match_price[options_imbalance_message_at] == options_imbalance_message_written.indicative_match_price[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.upper_collar[options_imbalance_message_at] == options_imbalance_message_written.upper_collar[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  options_imbalance_message_at = 0;
  do
  :: options_imbalance_message_at < 4 -> assert(options_imbalance_message_read.lower_collar[options_imbalance_message_at] == options_imbalance_message_written.lower_collar[options_imbalance_message_at]); options_imbalance_message_at = options_imbalance_message_at + 1
  :: else -> break
  od;
  assert(options_imbalance_message_read.auction_status == options_imbalance_message_written.auction_status);
  skip
}

/* ---- Series Rfq Message: 40 bytes -------------------------------------------- */

/* The Request for Series RFQ message is published for outright series. */
typedef SeriesRfqMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte series_seq_num[4];
  byte side;
  byte type;
  byte capacity;
  byte total_quantity[4];
  byte working_price[4];
  byte participant[4];
  byte auction_id[8];
  byte rfq_status
};

int series_rfq_message_at;

/* every byte of Series Rfq Message set to one value */
inline fill_series_rfq_message(series_rfq_message_record, series_rfq_message_value) {
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.source_time[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.source_time_ns[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.series_index[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.series_seq_num[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_record.side = series_rfq_message_value;
  series_rfq_message_record.type = series_rfq_message_value;
  series_rfq_message_record.capacity = series_rfq_message_value;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.total_quantity[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.working_price[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.participant[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 8 -> series_rfq_message_record.auction_id[series_rfq_message_at] = series_rfq_message_value; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_record.rfq_status = series_rfq_message_value;
  skip
}

/* each byte of Series Rfq Message set to where it lies, so a field read out of place says so */
inline ramp_series_rfq_message(series_rfq_message_record, series_rfq_message_base) {
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.source_time[series_rfq_message_at] = (series_rfq_message_base + 0 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.source_time_ns[series_rfq_message_at] = (series_rfq_message_base + 4 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.series_index[series_rfq_message_at] = (series_rfq_message_base + 8 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.series_seq_num[series_rfq_message_at] = (series_rfq_message_base + 12 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_record.side = (series_rfq_message_base + 16 + 1) % 256;
  series_rfq_message_record.type = (series_rfq_message_base + 17 + 1) % 256;
  series_rfq_message_record.capacity = (series_rfq_message_base + 18 + 1) % 256;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.total_quantity[series_rfq_message_at] = (series_rfq_message_base + 19 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.working_price[series_rfq_message_at] = (series_rfq_message_base + 23 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.participant[series_rfq_message_at] = (series_rfq_message_base + 27 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 8 -> series_rfq_message_record.auction_id[series_rfq_message_at] = (series_rfq_message_base + 31 + series_rfq_message_at + 1) % 256; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_record.rfq_status = (series_rfq_message_base + 39 + 1) % 256;
  skip
}

/* Series Rfq Message to the wire, 40 bytes from where the cursor stands */
inline encode_series_rfq_message(series_rfq_message_record) {
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> wire[at] = series_rfq_message_record.source_time[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> wire[at] = series_rfq_message_record.source_time_ns[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> wire[at] = series_rfq_message_record.series_index[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> wire[at] = series_rfq_message_record.series_seq_num[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  wire[at] = series_rfq_message_record.side; at = at + 1;
  wire[at] = series_rfq_message_record.type; at = at + 1;
  wire[at] = series_rfq_message_record.capacity; at = at + 1;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> wire[at] = series_rfq_message_record.total_quantity[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> wire[at] = series_rfq_message_record.working_price[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> wire[at] = series_rfq_message_record.participant[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 8 -> wire[at] = series_rfq_message_record.auction_id[series_rfq_message_at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  wire[at] = series_rfq_message_record.rfq_status; at = at + 1;
  skip
}

/* Series Rfq Message off the wire, 40 bytes from where the cursor stands */
inline decode_series_rfq_message(series_rfq_message_record) {
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.source_time[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.source_time_ns[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.series_index[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.series_seq_num[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_record.side = wire[at]; at = at + 1;
  series_rfq_message_record.type = wire[at]; at = at + 1;
  series_rfq_message_record.capacity = wire[at]; at = at + 1;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.total_quantity[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.working_price[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> series_rfq_message_record.participant[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 8 -> series_rfq_message_record.auction_id[series_rfq_message_at] = wire[at]; at = at + 1; series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_record.rfq_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Series Rfq Message is what was written, byte for byte */
inline equal_series_rfq_message(series_rfq_message_read, series_rfq_message_written) {
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> assert(series_rfq_message_read.source_time[series_rfq_message_at] == series_rfq_message_written.source_time[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> assert(series_rfq_message_read.source_time_ns[series_rfq_message_at] == series_rfq_message_written.source_time_ns[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> assert(series_rfq_message_read.series_index[series_rfq_message_at] == series_rfq_message_written.series_index[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> assert(series_rfq_message_read.series_seq_num[series_rfq_message_at] == series_rfq_message_written.series_seq_num[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  assert(series_rfq_message_read.side == series_rfq_message_written.side);
  assert(series_rfq_message_read.type == series_rfq_message_written.type);
  assert(series_rfq_message_read.capacity == series_rfq_message_written.capacity);
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> assert(series_rfq_message_read.total_quantity[series_rfq_message_at] == series_rfq_message_written.total_quantity[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> assert(series_rfq_message_read.working_price[series_rfq_message_at] == series_rfq_message_written.working_price[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 4 -> assert(series_rfq_message_read.participant[series_rfq_message_at] == series_rfq_message_written.participant[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  series_rfq_message_at = 0;
  do
  :: series_rfq_message_at < 8 -> assert(series_rfq_message_read.auction_id[series_rfq_message_at] == series_rfq_message_written.auction_id[series_rfq_message_at]); series_rfq_message_at = series_rfq_message_at + 1
  :: else -> break
  od;
  assert(series_rfq_message_read.rfq_status == series_rfq_message_written.rfq_status);
  skip
}

/* ---- Outright Series Summary Message: 32 bytes ------------------------------- */

/* The Series Summary message will provide the following trade statistics per series: high, low, open, close and total volume */
typedef OutrightSeriesSummaryMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte series_index[4];
  byte high_price[4];
  byte low_price[4];
  byte open[4];
  byte close[4];
  byte total_volume[4]
};

int outright_series_summary_message_at;

/* every byte of Outright Series Summary Message set to one value */
inline fill_outright_series_summary_message(outright_series_summary_message_record, outright_series_summary_message_value) {
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.source_time[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.source_time_ns[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.series_index[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.high_price[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.low_price[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.open[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.close[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.total_volume[outright_series_summary_message_at] = outright_series_summary_message_value; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outright Series Summary Message set to where it lies, so a field read out of place says so */
inline ramp_outright_series_summary_message(outright_series_summary_message_record, outright_series_summary_message_base) {
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.source_time[outright_series_summary_message_at] = (outright_series_summary_message_base + 0 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.source_time_ns[outright_series_summary_message_at] = (outright_series_summary_message_base + 4 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.series_index[outright_series_summary_message_at] = (outright_series_summary_message_base + 8 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.high_price[outright_series_summary_message_at] = (outright_series_summary_message_base + 12 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.low_price[outright_series_summary_message_at] = (outright_series_summary_message_base + 16 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.open[outright_series_summary_message_at] = (outright_series_summary_message_base + 20 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.close[outright_series_summary_message_at] = (outright_series_summary_message_base + 24 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.total_volume[outright_series_summary_message_at] = (outright_series_summary_message_base + 28 + outright_series_summary_message_at + 1) % 256; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Series Summary Message to the wire, 32 bytes from where the cursor stands */
inline encode_outright_series_summary_message(outright_series_summary_message_record) {
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.source_time[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.source_time_ns[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.series_index[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.high_price[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.low_price[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.open[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.close[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> wire[at] = outright_series_summary_message_record.total_volume[outright_series_summary_message_at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Outright Series Summary Message off the wire, 32 bytes from where the cursor stands */
inline decode_outright_series_summary_message(outright_series_summary_message_record) {
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.source_time[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.source_time_ns[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.series_index[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.high_price[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.low_price[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.open[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.close[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> outright_series_summary_message_record.total_volume[outright_series_summary_message_at] = wire[at]; at = at + 1; outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outright Series Summary Message is what was written, byte for byte */
inline equal_outright_series_summary_message(outright_series_summary_message_read, outright_series_summary_message_written) {
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.source_time[outright_series_summary_message_at] == outright_series_summary_message_written.source_time[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.source_time_ns[outright_series_summary_message_at] == outright_series_summary_message_written.source_time_ns[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.series_index[outright_series_summary_message_at] == outright_series_summary_message_written.series_index[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.high_price[outright_series_summary_message_at] == outright_series_summary_message_written.high_price[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.low_price[outright_series_summary_message_at] == outright_series_summary_message_written.low_price[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.open[outright_series_summary_message_at] == outright_series_summary_message_written.open[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.close[outright_series_summary_message_at] == outright_series_summary_message_written.close[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
  outright_series_summary_message_at = 0;
  do
  :: outright_series_summary_message_at < 4 -> assert(outright_series_summary_message_read.total_volume[outright_series_summary_message_at] == outright_series_summary_message_written.total_volume[outright_series_summary_message_at]); outright_series_summary_message_at = outright_series_summary_message_at + 1
  :: else -> break
  od;
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

/* Time Reference Message: encoded, read back, and compared */
proctype check_time_reference_message() {
  TimeReferenceMessage time_reference_message_sent;
  TimeReferenceMessage time_reference_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_reference_message(time_reference_message_sent, 0)
  :: pattern == 1 -> fill_time_reference_message(time_reference_message_sent, 32)
  :: pattern == 2 -> fill_time_reference_message(time_reference_message_sent, 255)
  :: else -> ramp_time_reference_message(time_reference_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_reference_message(time_reference_message_sent);
    assert(at == 12);
    at = 0;
    decode_time_reference_message(time_reference_message_got);
    assert(at == 12);
    equal_time_reference_message(time_reference_message_got, time_reference_message_sent)
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
    assert(at == 20);
    at = 0;
    decode_retransmission_request_message(retransmission_request_message_got);
    assert(at == 20);
    equal_retransmission_request_message(retransmission_request_message_got, retransmission_request_message_sent)
  }
}

/* Request Response Message: encoded, read back, and compared */
proctype check_request_response_message() {
  RequestResponseMessage request_response_message_sent;
  RequestResponseMessage request_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_response_message(request_response_message_sent, 0)
  :: pattern == 1 -> fill_request_response_message(request_response_message_sent, 32)
  :: pattern == 2 -> fill_request_response_message(request_response_message_sent, 255)
  :: else -> ramp_request_response_message(request_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_response_message(request_response_message_sent);
    assert(at == 25);
    at = 0;
    decode_request_response_message(request_response_message_got);
    assert(at == 25);
    equal_request_response_message(request_response_message_got, request_response_message_sent)
  }
}

/* Heartbeat Response Message: encoded, read back, and compared */
proctype check_heartbeat_response_message() {
  HeartbeatResponseMessage heartbeat_response_message_sent;
  HeartbeatResponseMessage heartbeat_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_response_message(heartbeat_response_message_sent, 255)
  :: else -> ramp_heartbeat_response_message(heartbeat_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_response_message(heartbeat_response_message_sent);
    assert(at == 10);
    at = 0;
    decode_heartbeat_response_message(heartbeat_response_message_got);
    assert(at == 10);
    equal_heartbeat_response_message(heartbeat_response_message_got, heartbeat_response_message_sent)
  }
}

/* Symbol Index Mapping Request Message: encoded, read back, and compared */
proctype check_symbol_index_mapping_request_message() {
  SymbolIndexMappingRequestMessage symbol_index_mapping_request_message_sent;
  SymbolIndexMappingRequestMessage symbol_index_mapping_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 0)
  :: pattern == 1 -> fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 32)
  :: pattern == 2 -> fill_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 255)
  :: else -> ramp_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_sent);
    assert(at == 17);
    at = 0;
    decode_symbol_index_mapping_request_message(symbol_index_mapping_request_message_got);
    assert(at == 17);
    equal_symbol_index_mapping_request_message(symbol_index_mapping_request_message_got, symbol_index_mapping_request_message_sent)
  }
}

/* Refresh Request Message: encoded, read back, and compared */
proctype check_refresh_request_message() {
  RefreshRequestMessage refresh_request_message_sent;
  RefreshRequestMessage refresh_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_request_message(refresh_request_message_sent, 0)
  :: pattern == 1 -> fill_refresh_request_message(refresh_request_message_sent, 32)
  :: pattern == 2 -> fill_refresh_request_message(refresh_request_message_sent, 255)
  :: else -> ramp_refresh_request_message(refresh_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_request_message(refresh_request_message_sent);
    assert(at == 16);
    at = 0;
    decode_refresh_request_message(refresh_request_message_got);
    assert(at == 16);
    equal_refresh_request_message(refresh_request_message_got, refresh_request_message_sent)
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

/* Outright Series Index Mapping Message: encoded, read back, and compared */
proctype check_outright_series_index_mapping_message() {
  OutrightSeriesIndexMappingMessage outright_series_index_mapping_message_sent;
  OutrightSeriesIndexMappingMessage outright_series_index_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_series_index_mapping_message(outright_series_index_mapping_message_sent, 0)
  :: pattern == 1 -> fill_outright_series_index_mapping_message(outright_series_index_mapping_message_sent, 32)
  :: pattern == 2 -> fill_outright_series_index_mapping_message(outright_series_index_mapping_message_sent, 255)
  :: else -> ramp_outright_series_index_mapping_message(outright_series_index_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_series_index_mapping_message(outright_series_index_mapping_message_sent);
    assert(at == 51);
    at = 0;
    decode_outright_series_index_mapping_message(outright_series_index_mapping_message_got);
    assert(at == 51);
    equal_outright_series_index_mapping_message(outright_series_index_mapping_message_got, outright_series_index_mapping_message_sent)
  }
}

/* Options Status Message: encoded, read back, and compared */
proctype check_options_status_message() {
  OptionsStatusMessage options_status_message_sent;
  OptionsStatusMessage options_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_status_message(options_status_message_sent, 0)
  :: pattern == 1 -> fill_options_status_message(options_status_message_sent, 32)
  :: pattern == 2 -> fill_options_status_message(options_status_message_sent, 255)
  :: else -> ramp_options_status_message(options_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_status_message(options_status_message_sent);
    assert(at == 19);
    at = 0;
    decode_options_status_message(options_status_message_got);
    assert(at == 19);
    equal_options_status_message(options_status_message_got, options_status_message_sent)
  }
}

/* Options Quote Message: encoded, read back, and compared */
proctype check_options_quote_message() {
  OptionsQuoteMessage options_quote_message_sent;
  OptionsQuoteMessage options_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_quote_message(options_quote_message_sent, 0)
  :: pattern == 1 -> fill_options_quote_message(options_quote_message_sent, 32)
  :: pattern == 2 -> fill_options_quote_message(options_quote_message_sent, 255)
  :: else -> ramp_options_quote_message(options_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_quote_message(options_quote_message_sent);
    assert(at == 38);
    at = 0;
    decode_options_quote_message(options_quote_message_got);
    assert(at == 38);
    equal_options_quote_message(options_quote_message_got, options_quote_message_sent)
  }
}

/* Trade Condition: encoded, read back, and compared */
proctype check_trade_condition() {
  TradeCondition trade_condition_sent;
  TradeCondition trade_condition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_condition(trade_condition_sent, 0)
  :: pattern == 1 -> fill_trade_condition(trade_condition_sent, 32)
  :: pattern == 2 -> fill_trade_condition(trade_condition_sent, 255)
  :: else -> ramp_trade_condition(trade_condition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_condition(trade_condition_sent);
    assert(at == 4);
    at = 0;
    decode_trade_condition(trade_condition_got);
    assert(at == 4);
    equal_trade_condition(trade_condition_got, trade_condition_sent)
  }
}

/* Options Trade Message: encoded, read back, and compared */
proctype check_options_trade_message() {
  OptionsTradeMessage options_trade_message_sent;
  OptionsTradeMessage options_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_trade_message(options_trade_message_sent, 0)
  :: pattern == 1 -> fill_options_trade_message(options_trade_message_sent, 32)
  :: pattern == 2 -> fill_options_trade_message(options_trade_message_sent, 255)
  :: else -> ramp_options_trade_message(options_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_trade_message(options_trade_message_sent);
    assert(at == 32);
    at = 0;
    decode_options_trade_message(options_trade_message_got);
    assert(at == 32);
    equal_options_trade_message(options_trade_message_got, options_trade_message_sent)
  }
}

/* Options Trade Cancel Message: encoded, read back, and compared */
proctype check_options_trade_cancel_message() {
  OptionsTradeCancelMessage options_trade_cancel_message_sent;
  OptionsTradeCancelMessage options_trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_trade_cancel_message(options_trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_options_trade_cancel_message(options_trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_options_trade_cancel_message(options_trade_cancel_message_sent, 255)
  :: else -> ramp_options_trade_cancel_message(options_trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_trade_cancel_message(options_trade_cancel_message_sent);
    assert(at == 20);
    at = 0;
    decode_options_trade_cancel_message(options_trade_cancel_message_got);
    assert(at == 20);
    equal_options_trade_cancel_message(options_trade_cancel_message_got, options_trade_cancel_message_sent)
  }
}

/* Correction Condition: encoded, read back, and compared */
proctype check_correction_condition() {
  CorrectionCondition correction_condition_sent;
  CorrectionCondition correction_condition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_correction_condition(correction_condition_sent, 0)
  :: pattern == 1 -> fill_correction_condition(correction_condition_sent, 32)
  :: pattern == 2 -> fill_correction_condition(correction_condition_sent, 255)
  :: else -> ramp_correction_condition(correction_condition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_correction_condition(correction_condition_sent);
    assert(at == 4);
    at = 0;
    decode_correction_condition(correction_condition_got);
    assert(at == 4);
    equal_correction_condition(correction_condition_got, correction_condition_sent)
  }
}

/* Options Trade Correction Message: encoded, read back, and compared */
proctype check_options_trade_correction_message() {
  OptionsTradeCorrectionMessage options_trade_correction_message_sent;
  OptionsTradeCorrectionMessage options_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_trade_correction_message(options_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_options_trade_correction_message(options_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_options_trade_correction_message(options_trade_correction_message_sent, 255)
  :: else -> ramp_options_trade_correction_message(options_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_trade_correction_message(options_trade_correction_message_sent);
    assert(at == 36);
    at = 0;
    decode_options_trade_correction_message(options_trade_correction_message_got);
    assert(at == 36);
    equal_options_trade_correction_message(options_trade_correction_message_got, options_trade_correction_message_sent)
  }
}

/* Options Imbalance Message: encoded, read back, and compared */
proctype check_options_imbalance_message() {
  OptionsImbalanceMessage options_imbalance_message_sent;
  OptionsImbalanceMessage options_imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_imbalance_message(options_imbalance_message_sent, 0)
  :: pattern == 1 -> fill_options_imbalance_message(options_imbalance_message_sent, 32)
  :: pattern == 2 -> fill_options_imbalance_message(options_imbalance_message_sent, 255)
  :: else -> ramp_options_imbalance_message(options_imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_imbalance_message(options_imbalance_message_sent);
    assert(at == 61);
    at = 0;
    decode_options_imbalance_message(options_imbalance_message_got);
    assert(at == 61);
    equal_options_imbalance_message(options_imbalance_message_got, options_imbalance_message_sent)
  }
}

/* Series Rfq Message: encoded, read back, and compared */
proctype check_series_rfq_message() {
  SeriesRfqMessage series_rfq_message_sent;
  SeriesRfqMessage series_rfq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_rfq_message(series_rfq_message_sent, 0)
  :: pattern == 1 -> fill_series_rfq_message(series_rfq_message_sent, 32)
  :: pattern == 2 -> fill_series_rfq_message(series_rfq_message_sent, 255)
  :: else -> ramp_series_rfq_message(series_rfq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_rfq_message(series_rfq_message_sent);
    assert(at == 40);
    at = 0;
    decode_series_rfq_message(series_rfq_message_got);
    assert(at == 40);
    equal_series_rfq_message(series_rfq_message_got, series_rfq_message_sent)
  }
}

/* Outright Series Summary Message: encoded, read back, and compared */
proctype check_outright_series_summary_message() {
  OutrightSeriesSummaryMessage outright_series_summary_message_sent;
  OutrightSeriesSummaryMessage outright_series_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_series_summary_message(outright_series_summary_message_sent, 0)
  :: pattern == 1 -> fill_outright_series_summary_message(outright_series_summary_message_sent, 32)
  :: pattern == 2 -> fill_outright_series_summary_message(outright_series_summary_message_sent, 255)
  :: else -> ramp_outright_series_summary_message(outright_series_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_series_summary_message(outright_series_summary_message_sent);
    assert(at == 32);
    at = 0;
    decode_outright_series_summary_message(outright_series_summary_message_got);
    assert(at == 32);
    equal_outright_series_summary_message(outright_series_summary_message_got, outright_series_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_send_time()
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sequence_number_reset_message()
  :: run check_time_reference_message()
  :: run check_symbol_index_mapping_message()
  :: run check_retransmission_request_message()
  :: run check_request_response_message()
  :: run check_heartbeat_response_message()
  :: run check_symbol_index_mapping_request_message()
  :: run check_refresh_request_message()
  :: run check_message_unavailable_message()
  :: run check_symbol_clear_message()
  :: run check_security_status_message()
  :: run check_outright_series_index_mapping_message()
  :: run check_options_status_message()
  :: run check_options_quote_message()
  :: run check_trade_condition()
  :: run check_options_trade_message()
  :: run check_options_trade_cancel_message()
  :: run check_correction_condition()
  :: run check_options_trade_correction_message()
  :: run check_options_imbalance_message()
  :: run check_series_rfq_message()
  :: run check_outright_series_summary_message()
  fi
}
