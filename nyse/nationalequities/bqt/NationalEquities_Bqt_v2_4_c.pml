/*
 * New York Stock Exchange Best Quote And Trade
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
 *   - a field present only on a condition
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 62

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

typedef PacketHeader {
  byte packet_size[2];
  byte delivery_flag;
  byte message_count;
  byte sequence_number[4];
  SendTime send_time
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = packet_header_value;
  packet_header_record.message_count = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  fill_send_time(packet_header_record.send_time, packet_header_value);
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = (packet_header_base + 2 + 1) % 256;
  packet_header_record.message_count = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  ramp_send_time(packet_header_record.send_time, packet_header_base + 8);
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_size[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.delivery_flag; at = at + 1;
  wire[at] = packet_header_record.message_count; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  encode_send_time(packet_header_record.send_time);
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_size[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = wire[at]; at = at + 1;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  decode_send_time(packet_header_record.send_time);
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_size[packet_header_at] == packet_header_written.packet_size[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.delivery_flag == packet_header_written.delivery_flag);
  assert(packet_header_read.message_count == packet_header_written.message_count);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  equal_send_time(packet_header_read.send_time, packet_header_written.send_time);
  skip
}

/* ---- Message Header: 4 bytes ------------------------------------------------- */

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

/* ---- Symbol Clear Message: 18 bytes ------------------------------------------ */

/* In case of a failure and recovery of a Matching Engine or an Pillar Publisher, the publisher may send a full state refresh for every symbol affected. This unrequested refresh is preceded by a Symbol Clear message. The client should react to receipt of a Symbol Clear message by clearing all state information for the specified symbol in anticipation of receiving a full state refresh. */
typedef SymbolClearMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte next_source_seq_num[4];
  byte market_id[2]
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
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 2 -> symbol_clear_message_record.market_id[symbol_clear_message_at] = symbol_clear_message_value; symbol_clear_message_at = symbol_clear_message_at + 1
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
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 2 -> symbol_clear_message_record.market_id[symbol_clear_message_at] = (symbol_clear_message_base + 16 + symbol_clear_message_at + 1) % 256; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message to the wire, 18 bytes from where the cursor stands */
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
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 2 -> wire[at] = symbol_clear_message_record.market_id[symbol_clear_message_at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message off the wire, 18 bytes from where the cursor stands */
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
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 2 -> symbol_clear_message_record.market_id[symbol_clear_message_at] = wire[at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
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
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 2 -> assert(symbol_clear_message_read.market_id[symbol_clear_message_at] == symbol_clear_message_written.market_id[symbol_clear_message_at]); symbol_clear_message_at = symbol_clear_message_at + 1
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
  byte market_id[2];
  byte reserved_2[2];
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
  :: security_status_message_at < 2 -> security_status_message_record.market_id[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 2 -> security_status_message_record.reserved_2[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
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
  :: security_status_message_at < 2 -> security_status_message_record.market_id[security_status_message_at] = (security_status_message_base + 18 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 2 -> security_status_message_record.reserved_2[security_status_message_at] = (security_status_message_base + 20 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
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
  :: security_status_message_at < 2 -> wire[at] = security_status_message_record.market_id[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 2 -> wire[at] = security_status_message_record.reserved_2[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
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
  :: security_status_message_at < 2 -> security_status_message_record.market_id[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 2 -> security_status_message_record.reserved_2[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
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
  :: security_status_message_at < 2 -> assert(security_status_message_read.market_id[security_status_message_at] == security_status_message_written.market_id[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 2 -> assert(security_status_message_read.reserved_2[security_status_message_at] == security_status_message_written.reserved_2[security_status_message_at]); security_status_message_at = security_status_message_at + 1
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

/* ---- Retransmission Request Message: 20 bytes -------------------------------- */

/* Clients who have experienced a sequence number gap and need a retransmission of the missed messages should send a Retransmission Request message via TCP to the Request Controller. */
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

/* Clients who have experienced a failure and need a refresh of the state of one or all symbols in a specific channel should send a Refresh Request message via TCP to the Request Controller. */
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

/* ---- Request Response Message: 25 bytes -------------------------------------- */

/* This message will be sent immediately via TCP/IP in response to the client's request for retransmission, refresh or Symbol Mapping messages. */
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

/* ---- Trf Fractional Trade Message: 46 bytes ---------------------------------- */

/* TRF Fractional Trade Message */
typedef TrfFractionalTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte fractional_volume[8];
  byte trade_cond_1;
  byte trade_cond_2;
  byte trade_cond_3;
  byte trade_cond_4;
  byte exec_day_time[4];
  byte exec_day_time_ns[4];
  byte market_id[2]
};

int trf_fractional_trade_message_at;

/* every byte of Trf Fractional Trade Message set to one value */
inline fill_trf_fractional_trade_message(trf_fractional_trade_message_record, trf_fractional_trade_message_value) {
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.source_time[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.source_time_ns[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.symbol_index[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.symbol_seq_num[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.trade_id[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.price[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 8 -> trf_fractional_trade_message_record.fractional_volume[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_record.trade_cond_1 = trf_fractional_trade_message_value;
  trf_fractional_trade_message_record.trade_cond_2 = trf_fractional_trade_message_value;
  trf_fractional_trade_message_record.trade_cond_3 = trf_fractional_trade_message_value;
  trf_fractional_trade_message_record.trade_cond_4 = trf_fractional_trade_message_value;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.exec_day_time[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.exec_day_time_ns[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 2 -> trf_fractional_trade_message_record.market_id[trf_fractional_trade_message_at] = trf_fractional_trade_message_value; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trf Fractional Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trf_fractional_trade_message(trf_fractional_trade_message_record, trf_fractional_trade_message_base) {
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.source_time[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 0 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.source_time_ns[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 4 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.symbol_index[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 8 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.symbol_seq_num[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 12 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.trade_id[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 16 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.price[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 20 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 8 -> trf_fractional_trade_message_record.fractional_volume[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 24 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_record.trade_cond_1 = (trf_fractional_trade_message_base + 32 + 1) % 256;
  trf_fractional_trade_message_record.trade_cond_2 = (trf_fractional_trade_message_base + 33 + 1) % 256;
  trf_fractional_trade_message_record.trade_cond_3 = (trf_fractional_trade_message_base + 34 + 1) % 256;
  trf_fractional_trade_message_record.trade_cond_4 = (trf_fractional_trade_message_base + 35 + 1) % 256;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.exec_day_time[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 36 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.exec_day_time_ns[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 40 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 2 -> trf_fractional_trade_message_record.market_id[trf_fractional_trade_message_at] = (trf_fractional_trade_message_base + 44 + trf_fractional_trade_message_at + 1) % 256; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Trade Message to the wire, 46 bytes from where the cursor stands */
inline encode_trf_fractional_trade_message(trf_fractional_trade_message_record) {
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.source_time[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.source_time_ns[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.symbol_index[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.symbol_seq_num[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.trade_id[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.price[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 8 -> wire[at] = trf_fractional_trade_message_record.fractional_volume[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trf_fractional_trade_message_record.trade_cond_1; at = at + 1;
  wire[at] = trf_fractional_trade_message_record.trade_cond_2; at = at + 1;
  wire[at] = trf_fractional_trade_message_record.trade_cond_3; at = at + 1;
  wire[at] = trf_fractional_trade_message_record.trade_cond_4; at = at + 1;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.exec_day_time[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> wire[at] = trf_fractional_trade_message_record.exec_day_time_ns[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 2 -> wire[at] = trf_fractional_trade_message_record.market_id[trf_fractional_trade_message_at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Trade Message off the wire, 46 bytes from where the cursor stands */
inline decode_trf_fractional_trade_message(trf_fractional_trade_message_record) {
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.source_time[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.source_time_ns[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.symbol_index[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.symbol_seq_num[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.trade_id[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.price[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 8 -> trf_fractional_trade_message_record.fractional_volume[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_record.trade_cond_1 = wire[at]; at = at + 1;
  trf_fractional_trade_message_record.trade_cond_2 = wire[at]; at = at + 1;
  trf_fractional_trade_message_record.trade_cond_3 = wire[at]; at = at + 1;
  trf_fractional_trade_message_record.trade_cond_4 = wire[at]; at = at + 1;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.exec_day_time[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> trf_fractional_trade_message_record.exec_day_time_ns[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 2 -> trf_fractional_trade_message_record.market_id[trf_fractional_trade_message_at] = wire[at]; at = at + 1; trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trf Fractional Trade Message is what was written, byte for byte */
inline equal_trf_fractional_trade_message(trf_fractional_trade_message_read, trf_fractional_trade_message_written) {
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.source_time[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.source_time[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.source_time_ns[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.source_time_ns[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.symbol_index[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.symbol_index[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.symbol_seq_num[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.symbol_seq_num[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.trade_id[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.trade_id[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.price[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.price[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 8 -> assert(trf_fractional_trade_message_read.fractional_volume[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.fractional_volume[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  assert(trf_fractional_trade_message_read.trade_cond_1 == trf_fractional_trade_message_written.trade_cond_1);
  assert(trf_fractional_trade_message_read.trade_cond_2 == trf_fractional_trade_message_written.trade_cond_2);
  assert(trf_fractional_trade_message_read.trade_cond_3 == trf_fractional_trade_message_written.trade_cond_3);
  assert(trf_fractional_trade_message_read.trade_cond_4 == trf_fractional_trade_message_written.trade_cond_4);
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.exec_day_time[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.exec_day_time[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 4 -> assert(trf_fractional_trade_message_read.exec_day_time_ns[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.exec_day_time_ns[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_message_at = 0;
  do
  :: trf_fractional_trade_message_at < 2 -> assert(trf_fractional_trade_message_read.market_id[trf_fractional_trade_message_at] == trf_fractional_trade_message_written.market_id[trf_fractional_trade_message_at]); trf_fractional_trade_message_at = trf_fractional_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated Trade Message: 34 bytes ------------------------------------ */

/* Consolidated Trade Message */
typedef ConsolidatedTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_number[4];
  byte trade_id[4];
  byte price[4];
  byte volume[4];
  byte trade_condition_1;
  byte trade_condition_2;
  byte trade_condition_3;
  byte trade_condition_4;
  byte market_id[2]
};

int consolidated_trade_message_at;

/* every byte of Consolidated Trade Message set to one value */
inline fill_consolidated_trade_message(consolidated_trade_message_record, consolidated_trade_message_value) {
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.source_time[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.source_time_ns[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.symbol_index[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.symbol_seq_number[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.trade_id[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.price[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.volume[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_record.trade_condition_1 = consolidated_trade_message_value;
  consolidated_trade_message_record.trade_condition_2 = consolidated_trade_message_value;
  consolidated_trade_message_record.trade_condition_3 = consolidated_trade_message_value;
  consolidated_trade_message_record.trade_condition_4 = consolidated_trade_message_value;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 2 -> consolidated_trade_message_record.market_id[consolidated_trade_message_at] = consolidated_trade_message_value; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Trade Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_trade_message(consolidated_trade_message_record, consolidated_trade_message_base) {
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.source_time[consolidated_trade_message_at] = (consolidated_trade_message_base + 0 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.source_time_ns[consolidated_trade_message_at] = (consolidated_trade_message_base + 4 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.symbol_index[consolidated_trade_message_at] = (consolidated_trade_message_base + 8 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.symbol_seq_number[consolidated_trade_message_at] = (consolidated_trade_message_base + 12 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.trade_id[consolidated_trade_message_at] = (consolidated_trade_message_base + 16 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.price[consolidated_trade_message_at] = (consolidated_trade_message_base + 20 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.volume[consolidated_trade_message_at] = (consolidated_trade_message_base + 24 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_record.trade_condition_1 = (consolidated_trade_message_base + 28 + 1) % 256;
  consolidated_trade_message_record.trade_condition_2 = (consolidated_trade_message_base + 29 + 1) % 256;
  consolidated_trade_message_record.trade_condition_3 = (consolidated_trade_message_base + 30 + 1) % 256;
  consolidated_trade_message_record.trade_condition_4 = (consolidated_trade_message_base + 31 + 1) % 256;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 2 -> consolidated_trade_message_record.market_id[consolidated_trade_message_at] = (consolidated_trade_message_base + 32 + consolidated_trade_message_at + 1) % 256; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Message to the wire, 34 bytes from where the cursor stands */
inline encode_consolidated_trade_message(consolidated_trade_message_record) {
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> wire[at] = consolidated_trade_message_record.source_time[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> wire[at] = consolidated_trade_message_record.source_time_ns[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> wire[at] = consolidated_trade_message_record.symbol_index[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> wire[at] = consolidated_trade_message_record.symbol_seq_number[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> wire[at] = consolidated_trade_message_record.trade_id[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> wire[at] = consolidated_trade_message_record.price[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> wire[at] = consolidated_trade_message_record.volume[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_trade_message_record.trade_condition_1; at = at + 1;
  wire[at] = consolidated_trade_message_record.trade_condition_2; at = at + 1;
  wire[at] = consolidated_trade_message_record.trade_condition_3; at = at + 1;
  wire[at] = consolidated_trade_message_record.trade_condition_4; at = at + 1;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 2 -> wire[at] = consolidated_trade_message_record.market_id[consolidated_trade_message_at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Message off the wire, 34 bytes from where the cursor stands */
inline decode_consolidated_trade_message(consolidated_trade_message_record) {
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.source_time[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.source_time_ns[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.symbol_index[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.symbol_seq_number[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.trade_id[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.price[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> consolidated_trade_message_record.volume[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_record.trade_condition_1 = wire[at]; at = at + 1;
  consolidated_trade_message_record.trade_condition_2 = wire[at]; at = at + 1;
  consolidated_trade_message_record.trade_condition_3 = wire[at]; at = at + 1;
  consolidated_trade_message_record.trade_condition_4 = wire[at]; at = at + 1;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 2 -> consolidated_trade_message_record.market_id[consolidated_trade_message_at] = wire[at]; at = at + 1; consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Trade Message is what was written, byte for byte */
inline equal_consolidated_trade_message(consolidated_trade_message_read, consolidated_trade_message_written) {
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> assert(consolidated_trade_message_read.source_time[consolidated_trade_message_at] == consolidated_trade_message_written.source_time[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> assert(consolidated_trade_message_read.source_time_ns[consolidated_trade_message_at] == consolidated_trade_message_written.source_time_ns[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> assert(consolidated_trade_message_read.symbol_index[consolidated_trade_message_at] == consolidated_trade_message_written.symbol_index[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> assert(consolidated_trade_message_read.symbol_seq_number[consolidated_trade_message_at] == consolidated_trade_message_written.symbol_seq_number[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> assert(consolidated_trade_message_read.trade_id[consolidated_trade_message_at] == consolidated_trade_message_written.trade_id[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> assert(consolidated_trade_message_read.price[consolidated_trade_message_at] == consolidated_trade_message_written.price[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 4 -> assert(consolidated_trade_message_read.volume[consolidated_trade_message_at] == consolidated_trade_message_written.volume[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  assert(consolidated_trade_message_read.trade_condition_1 == consolidated_trade_message_written.trade_condition_1);
  assert(consolidated_trade_message_read.trade_condition_2 == consolidated_trade_message_written.trade_condition_2);
  assert(consolidated_trade_message_read.trade_condition_3 == consolidated_trade_message_written.trade_condition_3);
  assert(consolidated_trade_message_read.trade_condition_4 == consolidated_trade_message_written.trade_condition_4);
  consolidated_trade_message_at = 0;
  do
  :: consolidated_trade_message_at < 2 -> assert(consolidated_trade_message_read.market_id[consolidated_trade_message_at] == consolidated_trade_message_written.market_id[consolidated_trade_message_at]); consolidated_trade_message_at = consolidated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated Trade Cancel Message: 22 bytes ----------------------------- */

/* This message is published when a trade is cancelled. */
typedef ConsolidatedTradeCancelMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_number[4];
  byte original_trade_id[4];
  byte market_id[2]
};

int consolidated_trade_cancel_message_at;

/* every byte of Consolidated Trade Cancel Message set to one value */
inline fill_consolidated_trade_cancel_message(consolidated_trade_cancel_message_record, consolidated_trade_cancel_message_value) {
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.source_time[consolidated_trade_cancel_message_at] = consolidated_trade_cancel_message_value; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.source_time_ns[consolidated_trade_cancel_message_at] = consolidated_trade_cancel_message_value; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.symbol_index[consolidated_trade_cancel_message_at] = consolidated_trade_cancel_message_value; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.symbol_seq_number[consolidated_trade_cancel_message_at] = consolidated_trade_cancel_message_value; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.original_trade_id[consolidated_trade_cancel_message_at] = consolidated_trade_cancel_message_value; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 2 -> consolidated_trade_cancel_message_record.market_id[consolidated_trade_cancel_message_at] = consolidated_trade_cancel_message_value; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_trade_cancel_message(consolidated_trade_cancel_message_record, consolidated_trade_cancel_message_base) {
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.source_time[consolidated_trade_cancel_message_at] = (consolidated_trade_cancel_message_base + 0 + consolidated_trade_cancel_message_at + 1) % 256; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.source_time_ns[consolidated_trade_cancel_message_at] = (consolidated_trade_cancel_message_base + 4 + consolidated_trade_cancel_message_at + 1) % 256; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.symbol_index[consolidated_trade_cancel_message_at] = (consolidated_trade_cancel_message_base + 8 + consolidated_trade_cancel_message_at + 1) % 256; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.symbol_seq_number[consolidated_trade_cancel_message_at] = (consolidated_trade_cancel_message_base + 12 + consolidated_trade_cancel_message_at + 1) % 256; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.original_trade_id[consolidated_trade_cancel_message_at] = (consolidated_trade_cancel_message_base + 16 + consolidated_trade_cancel_message_at + 1) % 256; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 2 -> consolidated_trade_cancel_message_record.market_id[consolidated_trade_cancel_message_at] = (consolidated_trade_cancel_message_base + 20 + consolidated_trade_cancel_message_at + 1) % 256; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Cancel Message to the wire, 22 bytes from where the cursor stands */
inline encode_consolidated_trade_cancel_message(consolidated_trade_cancel_message_record) {
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> wire[at] = consolidated_trade_cancel_message_record.source_time[consolidated_trade_cancel_message_at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> wire[at] = consolidated_trade_cancel_message_record.source_time_ns[consolidated_trade_cancel_message_at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> wire[at] = consolidated_trade_cancel_message_record.symbol_index[consolidated_trade_cancel_message_at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> wire[at] = consolidated_trade_cancel_message_record.symbol_seq_number[consolidated_trade_cancel_message_at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> wire[at] = consolidated_trade_cancel_message_record.original_trade_id[consolidated_trade_cancel_message_at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 2 -> wire[at] = consolidated_trade_cancel_message_record.market_id[consolidated_trade_cancel_message_at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Cancel Message off the wire, 22 bytes from where the cursor stands */
inline decode_consolidated_trade_cancel_message(consolidated_trade_cancel_message_record) {
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.source_time[consolidated_trade_cancel_message_at] = wire[at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.source_time_ns[consolidated_trade_cancel_message_at] = wire[at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.symbol_index[consolidated_trade_cancel_message_at] = wire[at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.symbol_seq_number[consolidated_trade_cancel_message_at] = wire[at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> consolidated_trade_cancel_message_record.original_trade_id[consolidated_trade_cancel_message_at] = wire[at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 2 -> consolidated_trade_cancel_message_record.market_id[consolidated_trade_cancel_message_at] = wire[at]; at = at + 1; consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Trade Cancel Message is what was written, byte for byte */
inline equal_consolidated_trade_cancel_message(consolidated_trade_cancel_message_read, consolidated_trade_cancel_message_written) {
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> assert(consolidated_trade_cancel_message_read.source_time[consolidated_trade_cancel_message_at] == consolidated_trade_cancel_message_written.source_time[consolidated_trade_cancel_message_at]); consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> assert(consolidated_trade_cancel_message_read.source_time_ns[consolidated_trade_cancel_message_at] == consolidated_trade_cancel_message_written.source_time_ns[consolidated_trade_cancel_message_at]); consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> assert(consolidated_trade_cancel_message_read.symbol_index[consolidated_trade_cancel_message_at] == consolidated_trade_cancel_message_written.symbol_index[consolidated_trade_cancel_message_at]); consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> assert(consolidated_trade_cancel_message_read.symbol_seq_number[consolidated_trade_cancel_message_at] == consolidated_trade_cancel_message_written.symbol_seq_number[consolidated_trade_cancel_message_at]); consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 4 -> assert(consolidated_trade_cancel_message_read.original_trade_id[consolidated_trade_cancel_message_at] == consolidated_trade_cancel_message_written.original_trade_id[consolidated_trade_cancel_message_at]); consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancel_message_at = 0;
  do
  :: consolidated_trade_cancel_message_at < 2 -> assert(consolidated_trade_cancel_message_read.market_id[consolidated_trade_cancel_message_at] == consolidated_trade_cancel_message_written.market_id[consolidated_trade_cancel_message_at]); consolidated_trade_cancel_message_at = consolidated_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trf Fractional Trade Correction Message: 50 bytes ----------------------- */

/* TRF Fractional Trade Correction Message */
typedef TrfFractionalTradeCorrectionMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte original_trade_id[4];
  byte trade_id[4];
  byte price[4];
  byte fractional_volume[8];
  byte trade_cond_1;
  byte trade_cond_2;
  byte trade_cond_3;
  byte trade_cond_4;
  byte exec_day_time[4];
  byte exec_day_time_ns[4];
  byte market_id[2]
};

int trf_fractional_trade_correction_message_at;

/* every byte of Trf Fractional Trade Correction Message set to one value */
inline fill_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_record, trf_fractional_trade_correction_message_value) {
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.source_time[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.source_time_ns[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.symbol_index[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.symbol_seq_num[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.original_trade_id[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.trade_id[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.price[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 8 -> trf_fractional_trade_correction_message_record.fractional_volume[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_record.trade_cond_1 = trf_fractional_trade_correction_message_value;
  trf_fractional_trade_correction_message_record.trade_cond_2 = trf_fractional_trade_correction_message_value;
  trf_fractional_trade_correction_message_record.trade_cond_3 = trf_fractional_trade_correction_message_value;
  trf_fractional_trade_correction_message_record.trade_cond_4 = trf_fractional_trade_correction_message_value;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.exec_day_time[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.exec_day_time_ns[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 2 -> trf_fractional_trade_correction_message_record.market_id[trf_fractional_trade_correction_message_at] = trf_fractional_trade_correction_message_value; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trf Fractional Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_record, trf_fractional_trade_correction_message_base) {
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.source_time[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 0 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.source_time_ns[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 4 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.symbol_index[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 8 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.symbol_seq_num[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 12 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.original_trade_id[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 16 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.trade_id[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 20 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.price[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 24 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 8 -> trf_fractional_trade_correction_message_record.fractional_volume[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 28 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_record.trade_cond_1 = (trf_fractional_trade_correction_message_base + 36 + 1) % 256;
  trf_fractional_trade_correction_message_record.trade_cond_2 = (trf_fractional_trade_correction_message_base + 37 + 1) % 256;
  trf_fractional_trade_correction_message_record.trade_cond_3 = (trf_fractional_trade_correction_message_base + 38 + 1) % 256;
  trf_fractional_trade_correction_message_record.trade_cond_4 = (trf_fractional_trade_correction_message_base + 39 + 1) % 256;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.exec_day_time[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 40 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.exec_day_time_ns[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 44 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 2 -> trf_fractional_trade_correction_message_record.market_id[trf_fractional_trade_correction_message_at] = (trf_fractional_trade_correction_message_base + 48 + trf_fractional_trade_correction_message_at + 1) % 256; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Trade Correction Message to the wire, 50 bytes from where the cursor stands */
inline encode_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_record) {
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.source_time[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.source_time_ns[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.symbol_index[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.symbol_seq_num[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.original_trade_id[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.trade_id[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.price[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 8 -> wire[at] = trf_fractional_trade_correction_message_record.fractional_volume[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trf_fractional_trade_correction_message_record.trade_cond_1; at = at + 1;
  wire[at] = trf_fractional_trade_correction_message_record.trade_cond_2; at = at + 1;
  wire[at] = trf_fractional_trade_correction_message_record.trade_cond_3; at = at + 1;
  wire[at] = trf_fractional_trade_correction_message_record.trade_cond_4; at = at + 1;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.exec_day_time[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> wire[at] = trf_fractional_trade_correction_message_record.exec_day_time_ns[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 2 -> wire[at] = trf_fractional_trade_correction_message_record.market_id[trf_fractional_trade_correction_message_at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Trade Correction Message off the wire, 50 bytes from where the cursor stands */
inline decode_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_record) {
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.source_time[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.source_time_ns[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.symbol_index[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.symbol_seq_num[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.original_trade_id[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.trade_id[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.price[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 8 -> trf_fractional_trade_correction_message_record.fractional_volume[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_record.trade_cond_1 = wire[at]; at = at + 1;
  trf_fractional_trade_correction_message_record.trade_cond_2 = wire[at]; at = at + 1;
  trf_fractional_trade_correction_message_record.trade_cond_3 = wire[at]; at = at + 1;
  trf_fractional_trade_correction_message_record.trade_cond_4 = wire[at]; at = at + 1;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.exec_day_time[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> trf_fractional_trade_correction_message_record.exec_day_time_ns[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 2 -> trf_fractional_trade_correction_message_record.market_id[trf_fractional_trade_correction_message_at] = wire[at]; at = at + 1; trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trf Fractional Trade Correction Message is what was written, byte for byte */
inline equal_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_read, trf_fractional_trade_correction_message_written) {
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.source_time[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.source_time[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.source_time_ns[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.source_time_ns[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.symbol_index[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.symbol_index[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.symbol_seq_num[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.symbol_seq_num[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.original_trade_id[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.original_trade_id[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.trade_id[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.trade_id[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.price[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.price[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 8 -> assert(trf_fractional_trade_correction_message_read.fractional_volume[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.fractional_volume[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trf_fractional_trade_correction_message_read.trade_cond_1 == trf_fractional_trade_correction_message_written.trade_cond_1);
  assert(trf_fractional_trade_correction_message_read.trade_cond_2 == trf_fractional_trade_correction_message_written.trade_cond_2);
  assert(trf_fractional_trade_correction_message_read.trade_cond_3 == trf_fractional_trade_correction_message_written.trade_cond_3);
  assert(trf_fractional_trade_correction_message_read.trade_cond_4 == trf_fractional_trade_correction_message_written.trade_cond_4);
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.exec_day_time[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.exec_day_time[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 4 -> assert(trf_fractional_trade_correction_message_read.exec_day_time_ns[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.exec_day_time_ns[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  trf_fractional_trade_correction_message_at = 0;
  do
  :: trf_fractional_trade_correction_message_at < 2 -> assert(trf_fractional_trade_correction_message_read.market_id[trf_fractional_trade_correction_message_at] == trf_fractional_trade_correction_message_written.market_id[trf_fractional_trade_correction_message_at]); trf_fractional_trade_correction_message_at = trf_fractional_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated Trade Correction Message: 38 bytes ------------------------- */

/* This message is published when a trade is corrected. */
typedef ConsolidatedTradeCorrectionMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_number[4];
  byte original_trade_id[4];
  byte trade_id[4];
  byte price[4];
  byte volume[4];
  byte trade_condition_1;
  byte trade_condition_2;
  byte trade_condition_3;
  byte trade_condition_4;
  byte market_id[2]
};

int consolidated_trade_correction_message_at;

/* every byte of Consolidated Trade Correction Message set to one value */
inline fill_consolidated_trade_correction_message(consolidated_trade_correction_message_record, consolidated_trade_correction_message_value) {
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.source_time[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.source_time_ns[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.symbol_index[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.symbol_seq_number[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.original_trade_id[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.trade_id[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.price[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.volume[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_record.trade_condition_1 = consolidated_trade_correction_message_value;
  consolidated_trade_correction_message_record.trade_condition_2 = consolidated_trade_correction_message_value;
  consolidated_trade_correction_message_record.trade_condition_3 = consolidated_trade_correction_message_value;
  consolidated_trade_correction_message_record.trade_condition_4 = consolidated_trade_correction_message_value;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 2 -> consolidated_trade_correction_message_record.market_id[consolidated_trade_correction_message_at] = consolidated_trade_correction_message_value; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_trade_correction_message(consolidated_trade_correction_message_record, consolidated_trade_correction_message_base) {
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.source_time[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 0 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.source_time_ns[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 4 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.symbol_index[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 8 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.symbol_seq_number[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 12 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.original_trade_id[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 16 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.trade_id[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 20 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.price[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 24 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.volume[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 28 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_record.trade_condition_1 = (consolidated_trade_correction_message_base + 32 + 1) % 256;
  consolidated_trade_correction_message_record.trade_condition_2 = (consolidated_trade_correction_message_base + 33 + 1) % 256;
  consolidated_trade_correction_message_record.trade_condition_3 = (consolidated_trade_correction_message_base + 34 + 1) % 256;
  consolidated_trade_correction_message_record.trade_condition_4 = (consolidated_trade_correction_message_base + 35 + 1) % 256;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 2 -> consolidated_trade_correction_message_record.market_id[consolidated_trade_correction_message_at] = (consolidated_trade_correction_message_base + 36 + consolidated_trade_correction_message_at + 1) % 256; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Correction Message to the wire, 38 bytes from where the cursor stands */
inline encode_consolidated_trade_correction_message(consolidated_trade_correction_message_record) {
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.source_time[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.source_time_ns[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.symbol_index[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.symbol_seq_number[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.original_trade_id[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.trade_id[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.price[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> wire[at] = consolidated_trade_correction_message_record.volume[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_trade_correction_message_record.trade_condition_1; at = at + 1;
  wire[at] = consolidated_trade_correction_message_record.trade_condition_2; at = at + 1;
  wire[at] = consolidated_trade_correction_message_record.trade_condition_3; at = at + 1;
  wire[at] = consolidated_trade_correction_message_record.trade_condition_4; at = at + 1;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 2 -> wire[at] = consolidated_trade_correction_message_record.market_id[consolidated_trade_correction_message_at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Correction Message off the wire, 38 bytes from where the cursor stands */
inline decode_consolidated_trade_correction_message(consolidated_trade_correction_message_record) {
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.source_time[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.source_time_ns[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.symbol_index[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.symbol_seq_number[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.original_trade_id[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.trade_id[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.price[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> consolidated_trade_correction_message_record.volume[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_record.trade_condition_1 = wire[at]; at = at + 1;
  consolidated_trade_correction_message_record.trade_condition_2 = wire[at]; at = at + 1;
  consolidated_trade_correction_message_record.trade_condition_3 = wire[at]; at = at + 1;
  consolidated_trade_correction_message_record.trade_condition_4 = wire[at]; at = at + 1;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 2 -> consolidated_trade_correction_message_record.market_id[consolidated_trade_correction_message_at] = wire[at]; at = at + 1; consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Trade Correction Message is what was written, byte for byte */
inline equal_consolidated_trade_correction_message(consolidated_trade_correction_message_read, consolidated_trade_correction_message_written) {
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.source_time[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.source_time[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.source_time_ns[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.source_time_ns[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.symbol_index[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.symbol_index[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.symbol_seq_number[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.symbol_seq_number[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.original_trade_id[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.original_trade_id[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.trade_id[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.trade_id[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.price[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.price[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 4 -> assert(consolidated_trade_correction_message_read.volume[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.volume[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  assert(consolidated_trade_correction_message_read.trade_condition_1 == consolidated_trade_correction_message_written.trade_condition_1);
  assert(consolidated_trade_correction_message_read.trade_condition_2 == consolidated_trade_correction_message_written.trade_condition_2);
  assert(consolidated_trade_correction_message_read.trade_condition_3 == consolidated_trade_correction_message_written.trade_condition_3);
  assert(consolidated_trade_correction_message_read.trade_condition_4 == consolidated_trade_correction_message_written.trade_condition_4);
  consolidated_trade_correction_message_at = 0;
  do
  :: consolidated_trade_correction_message_at < 2 -> assert(consolidated_trade_correction_message_read.market_id[consolidated_trade_correction_message_at] == consolidated_trade_correction_message_written.market_id[consolidated_trade_correction_message_at]); consolidated_trade_correction_message_at = consolidated_trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trf Fractional Prior Day Trade Message: 44 bytes ------------------------ */

/* TRF Fractional Prior Day Trade Message */
typedef TrfFractionalPriorDayTradeMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte fractional_volume[8];
  byte trade_cond_1;
  byte trade_cond_2;
  byte trade_cond_3;
  byte trade_cond_4;
  byte prior_day_time[4];
  byte prior_day_time_ns[4]
};

int trf_fractional_prior_day_trade_message_at;

/* every byte of Trf Fractional Prior Day Trade Message set to one value */
inline fill_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_record, trf_fractional_prior_day_trade_message_value) {
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.source_time[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.source_time_ns[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.symbol_index[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.symbol_seq_num[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.trade_id[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.price[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 8 -> trf_fractional_prior_day_trade_message_record.fractional_volume[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_record.trade_cond_1 = trf_fractional_prior_day_trade_message_value;
  trf_fractional_prior_day_trade_message_record.trade_cond_2 = trf_fractional_prior_day_trade_message_value;
  trf_fractional_prior_day_trade_message_record.trade_cond_3 = trf_fractional_prior_day_trade_message_value;
  trf_fractional_prior_day_trade_message_record.trade_cond_4 = trf_fractional_prior_day_trade_message_value;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.prior_day_time[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_message_at] = trf_fractional_prior_day_trade_message_value; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trf Fractional Prior Day Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_record, trf_fractional_prior_day_trade_message_base) {
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.source_time[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 0 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.source_time_ns[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 4 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.symbol_index[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 8 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.symbol_seq_num[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 12 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.trade_id[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 16 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.price[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 20 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 8 -> trf_fractional_prior_day_trade_message_record.fractional_volume[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 24 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_record.trade_cond_1 = (trf_fractional_prior_day_trade_message_base + 32 + 1) % 256;
  trf_fractional_prior_day_trade_message_record.trade_cond_2 = (trf_fractional_prior_day_trade_message_base + 33 + 1) % 256;
  trf_fractional_prior_day_trade_message_record.trade_cond_3 = (trf_fractional_prior_day_trade_message_base + 34 + 1) % 256;
  trf_fractional_prior_day_trade_message_record.trade_cond_4 = (trf_fractional_prior_day_trade_message_base + 35 + 1) % 256;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.prior_day_time[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 36 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_message_at] = (trf_fractional_prior_day_trade_message_base + 40 + trf_fractional_prior_day_trade_message_at + 1) % 256; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Prior Day Trade Message to the wire, 44 bytes from where the cursor stands */
inline encode_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_record) {
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.source_time[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.source_time_ns[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.symbol_index[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.symbol_seq_num[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.trade_id[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.price[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 8 -> wire[at] = trf_fractional_prior_day_trade_message_record.fractional_volume[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trf_fractional_prior_day_trade_message_record.trade_cond_1; at = at + 1;
  wire[at] = trf_fractional_prior_day_trade_message_record.trade_cond_2; at = at + 1;
  wire[at] = trf_fractional_prior_day_trade_message_record.trade_cond_3; at = at + 1;
  wire[at] = trf_fractional_prior_day_trade_message_record.trade_cond_4; at = at + 1;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.prior_day_time[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_message_at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Prior Day Trade Message off the wire, 44 bytes from where the cursor stands */
inline decode_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_record) {
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.source_time[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.source_time_ns[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.symbol_index[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.symbol_seq_num[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.trade_id[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.price[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 8 -> trf_fractional_prior_day_trade_message_record.fractional_volume[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_record.trade_cond_1 = wire[at]; at = at + 1;
  trf_fractional_prior_day_trade_message_record.trade_cond_2 = wire[at]; at = at + 1;
  trf_fractional_prior_day_trade_message_record.trade_cond_3 = wire[at]; at = at + 1;
  trf_fractional_prior_day_trade_message_record.trade_cond_4 = wire[at]; at = at + 1;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.prior_day_time[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> trf_fractional_prior_day_trade_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trf Fractional Prior Day Trade Message is what was written, byte for byte */
inline equal_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_read, trf_fractional_prior_day_trade_message_written) {
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.source_time[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.source_time[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.source_time_ns[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.source_time_ns[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.symbol_index[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.symbol_index[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.symbol_seq_num[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.symbol_seq_num[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.trade_id[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.trade_id[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.price[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.price[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 8 -> assert(trf_fractional_prior_day_trade_message_read.fractional_volume[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.fractional_volume[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  assert(trf_fractional_prior_day_trade_message_read.trade_cond_1 == trf_fractional_prior_day_trade_message_written.trade_cond_1);
  assert(trf_fractional_prior_day_trade_message_read.trade_cond_2 == trf_fractional_prior_day_trade_message_written.trade_cond_2);
  assert(trf_fractional_prior_day_trade_message_read.trade_cond_3 == trf_fractional_prior_day_trade_message_written.trade_cond_3);
  assert(trf_fractional_prior_day_trade_message_read.trade_cond_4 == trf_fractional_prior_day_trade_message_written.trade_cond_4);
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.prior_day_time[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.prior_day_time[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_message_at < 4 -> assert(trf_fractional_prior_day_trade_message_read.prior_day_time_ns[trf_fractional_prior_day_trade_message_at] == trf_fractional_prior_day_trade_message_written.prior_day_time_ns[trf_fractional_prior_day_trade_message_at]); trf_fractional_prior_day_trade_message_at = trf_fractional_prior_day_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trf Fractional Prior Day Trade Cancel Message: 40 bytes ----------------- */

/* TRF Fractional Prior Day Trade Cancel Message */
typedef TrfFractionalPriorDayTradeCancelMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte symbol_seq_num[4];
  byte trade_id[4];
  byte price[4];
  byte fractional_volume[8];
  byte prior_day_time[4];
  byte prior_day_time_ns[4]
};

int trf_fractional_prior_day_trade_cancel_message_at;

/* every byte of Trf Fractional Prior Day Trade Cancel Message set to one value */
inline fill_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_record, trf_fractional_prior_day_trade_cancel_message_value) {
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.source_time[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.source_time_ns[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.symbol_index[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.symbol_seq_num[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.trade_id[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.price[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 8 -> trf_fractional_prior_day_trade_cancel_message_record.fractional_volume[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.prior_day_time[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_cancel_message_at] = trf_fractional_prior_day_trade_cancel_message_value; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trf Fractional Prior Day Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_record, trf_fractional_prior_day_trade_cancel_message_base) {
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.source_time[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 0 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.source_time_ns[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 4 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.symbol_index[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 8 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.symbol_seq_num[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 12 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.trade_id[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 16 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.price[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 20 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 8 -> trf_fractional_prior_day_trade_cancel_message_record.fractional_volume[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 24 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.prior_day_time[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 32 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_cancel_message_at] = (trf_fractional_prior_day_trade_cancel_message_base + 36 + trf_fractional_prior_day_trade_cancel_message_at + 1) % 256; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Prior Day Trade Cancel Message to the wire, 40 bytes from where the cursor stands */
inline encode_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_record) {
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.source_time[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.source_time_ns[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.symbol_index[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.symbol_seq_num[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.trade_id[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.price[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 8 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.fractional_volume[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.prior_day_time[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> wire[at] = trf_fractional_prior_day_trade_cancel_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_cancel_message_at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trf Fractional Prior Day Trade Cancel Message off the wire, 40 bytes from where the cursor stands */
inline decode_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_record) {
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.source_time[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.source_time_ns[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.symbol_index[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.symbol_seq_num[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.trade_id[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.price[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 8 -> trf_fractional_prior_day_trade_cancel_message_record.fractional_volume[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.prior_day_time[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> trf_fractional_prior_day_trade_cancel_message_record.prior_day_time_ns[trf_fractional_prior_day_trade_cancel_message_at] = wire[at]; at = at + 1; trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trf Fractional Prior Day Trade Cancel Message is what was written, byte for byte */
inline equal_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_read, trf_fractional_prior_day_trade_cancel_message_written) {
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.source_time[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.source_time[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.source_time_ns[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.source_time_ns[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.symbol_index[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.symbol_index[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.symbol_seq_num[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.symbol_seq_num[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.trade_id[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.trade_id[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.price[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.price[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 8 -> assert(trf_fractional_prior_day_trade_cancel_message_read.fractional_volume[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.fractional_volume[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.prior_day_time[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.prior_day_time[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  trf_fractional_prior_day_trade_cancel_message_at = 0;
  do
  :: trf_fractional_prior_day_trade_cancel_message_at < 4 -> assert(trf_fractional_prior_day_trade_cancel_message_read.prior_day_time_ns[trf_fractional_prior_day_trade_cancel_message_at] == trf_fractional_prior_day_trade_cancel_message_written.prior_day_time_ns[trf_fractional_prior_day_trade_cancel_message_at]); trf_fractional_prior_day_trade_cancel_message_at = trf_fractional_prior_day_trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated Fractional Stock Summary Message: 62 bytes ----------------- */

/* The stock summary message is sent every 1 minute, after a security is Open. */
typedef ConsolidatedFractionalStockSummaryMessage {
  byte source_time[4];
  byte source_time_ns[4];
  byte symbol_index[4];
  byte nyse_group_high_price[4];
  byte nyse_group_low_price[4];
  byte primary_listing_market_official_open_price[4];
  byte fractional_nyse_group_volume[8];
  byte nyse_group_market_id_of_high_price[2];
  byte nyse_group_market_id_of_low_price[2];
  byte market_id_of_open_price[2];
  byte num_close_prices;
  byte nyse_group_market_id_of_the_close[2];
  byte primary_listing_market_official_close_price[4];
  byte consolidated_high_price[4];
  byte consolidated_low_price[4];
  byte consolidated_first_price[4];
  byte consolidated_last_price[4];
  byte complete
};

int consolidated_fractional_stock_summary_message_at;

/* every byte of Consolidated Fractional Stock Summary Message set to one value */
inline fill_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_record, consolidated_fractional_stock_summary_message_value) {
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.source_time[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.source_time_ns[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.symbol_index[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.nyse_group_high_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.nyse_group_low_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.primary_listing_market_official_open_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 8 -> consolidated_fractional_stock_summary_message_record.fractional_nyse_group_volume[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_high_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_low_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.market_id_of_open_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_record.num_close_prices = consolidated_fractional_stock_summary_message_value;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_the_close[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.primary_listing_market_official_close_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_high_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_low_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_first_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_last_price[consolidated_fractional_stock_summary_message_at] = consolidated_fractional_stock_summary_message_value; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_record.complete = consolidated_fractional_stock_summary_message_value;
  skip
}

/* each byte of Consolidated Fractional Stock Summary Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_record, consolidated_fractional_stock_summary_message_base) {
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.source_time[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 0 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.source_time_ns[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 4 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.symbol_index[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 8 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.nyse_group_high_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 12 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.nyse_group_low_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 16 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.primary_listing_market_official_open_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 20 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 8 -> consolidated_fractional_stock_summary_message_record.fractional_nyse_group_volume[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 24 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_high_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 32 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_low_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 34 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.market_id_of_open_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 36 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_record.num_close_prices = (consolidated_fractional_stock_summary_message_base + 38 + 1) % 256;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_the_close[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 39 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.primary_listing_market_official_close_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 41 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_high_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 45 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_low_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 49 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_first_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 53 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_last_price[consolidated_fractional_stock_summary_message_at] = (consolidated_fractional_stock_summary_message_base + 57 + consolidated_fractional_stock_summary_message_at + 1) % 256; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_record.complete = (consolidated_fractional_stock_summary_message_base + 61 + 1) % 256;
  skip
}

/* Consolidated Fractional Stock Summary Message to the wire, 62 bytes from where the cursor stands */
inline encode_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_record) {
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.source_time[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.source_time_ns[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.symbol_index[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.nyse_group_high_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.nyse_group_low_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.primary_listing_market_official_open_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 8 -> wire[at] = consolidated_fractional_stock_summary_message_record.fractional_nyse_group_volume[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> wire[at] = consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_high_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> wire[at] = consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_low_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> wire[at] = consolidated_fractional_stock_summary_message_record.market_id_of_open_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_fractional_stock_summary_message_record.num_close_prices; at = at + 1;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> wire[at] = consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_the_close[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.primary_listing_market_official_close_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.consolidated_high_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.consolidated_low_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.consolidated_first_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> wire[at] = consolidated_fractional_stock_summary_message_record.consolidated_last_price[consolidated_fractional_stock_summary_message_at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_fractional_stock_summary_message_record.complete; at = at + 1;
  skip
}

/* Consolidated Fractional Stock Summary Message off the wire, 62 bytes from where the cursor stands */
inline decode_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_record) {
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.source_time[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.source_time_ns[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.symbol_index[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.nyse_group_high_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.nyse_group_low_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.primary_listing_market_official_open_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 8 -> consolidated_fractional_stock_summary_message_record.fractional_nyse_group_volume[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_high_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_low_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.market_id_of_open_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_record.num_close_prices = wire[at]; at = at + 1;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> consolidated_fractional_stock_summary_message_record.nyse_group_market_id_of_the_close[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.primary_listing_market_official_close_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_high_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_low_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_first_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> consolidated_fractional_stock_summary_message_record.consolidated_last_price[consolidated_fractional_stock_summary_message_at] = wire[at]; at = at + 1; consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_record.complete = wire[at]; at = at + 1;
  skip
}

/* what was read of Consolidated Fractional Stock Summary Message is what was written, byte for byte */
inline equal_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_read, consolidated_fractional_stock_summary_message_written) {
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.source_time[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.source_time[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.source_time_ns[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.source_time_ns[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.symbol_index[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.symbol_index[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.nyse_group_high_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.nyse_group_high_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.nyse_group_low_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.nyse_group_low_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.primary_listing_market_official_open_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.primary_listing_market_official_open_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 8 -> assert(consolidated_fractional_stock_summary_message_read.fractional_nyse_group_volume[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.fractional_nyse_group_volume[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> assert(consolidated_fractional_stock_summary_message_read.nyse_group_market_id_of_high_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.nyse_group_market_id_of_high_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> assert(consolidated_fractional_stock_summary_message_read.nyse_group_market_id_of_low_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.nyse_group_market_id_of_low_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> assert(consolidated_fractional_stock_summary_message_read.market_id_of_open_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.market_id_of_open_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  assert(consolidated_fractional_stock_summary_message_read.num_close_prices == consolidated_fractional_stock_summary_message_written.num_close_prices);
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 2 -> assert(consolidated_fractional_stock_summary_message_read.nyse_group_market_id_of_the_close[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.nyse_group_market_id_of_the_close[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.primary_listing_market_official_close_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.primary_listing_market_official_close_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.consolidated_high_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.consolidated_high_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.consolidated_low_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.consolidated_low_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.consolidated_first_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.consolidated_first_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_stock_summary_message_at = 0;
  do
  :: consolidated_fractional_stock_summary_message_at < 4 -> assert(consolidated_fractional_stock_summary_message_read.consolidated_last_price[consolidated_fractional_stock_summary_message_at] == consolidated_fractional_stock_summary_message_written.consolidated_last_price[consolidated_fractional_stock_summary_message_at]); consolidated_fractional_stock_summary_message_at = consolidated_fractional_stock_summary_message_at + 1
  :: else -> break
  od;
  assert(consolidated_fractional_stock_summary_message_read.complete == consolidated_fractional_stock_summary_message_written.complete);
  skip
}

/* ---- Consolidated Fractional Volume Message: 18 bytes ------------------------ */

/* Consolidated Fractional Volume Message */
typedef ConsolidatedFractionalVolumeMessage {
  byte symbol_index[4];
  byte symbol_seq_number[4];
  byte fractional_consolidated_volume[8];
  byte reason;
  byte complete
};

int consolidated_fractional_volume_message_at;

/* every byte of Consolidated Fractional Volume Message set to one value */
inline fill_consolidated_fractional_volume_message(consolidated_fractional_volume_message_record, consolidated_fractional_volume_message_value) {
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> consolidated_fractional_volume_message_record.symbol_index[consolidated_fractional_volume_message_at] = consolidated_fractional_volume_message_value; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> consolidated_fractional_volume_message_record.symbol_seq_number[consolidated_fractional_volume_message_at] = consolidated_fractional_volume_message_value; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 8 -> consolidated_fractional_volume_message_record.fractional_consolidated_volume[consolidated_fractional_volume_message_at] = consolidated_fractional_volume_message_value; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_record.reason = consolidated_fractional_volume_message_value;
  consolidated_fractional_volume_message_record.complete = consolidated_fractional_volume_message_value;
  skip
}

/* each byte of Consolidated Fractional Volume Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_fractional_volume_message(consolidated_fractional_volume_message_record, consolidated_fractional_volume_message_base) {
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> consolidated_fractional_volume_message_record.symbol_index[consolidated_fractional_volume_message_at] = (consolidated_fractional_volume_message_base + 0 + consolidated_fractional_volume_message_at + 1) % 256; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> consolidated_fractional_volume_message_record.symbol_seq_number[consolidated_fractional_volume_message_at] = (consolidated_fractional_volume_message_base + 4 + consolidated_fractional_volume_message_at + 1) % 256; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 8 -> consolidated_fractional_volume_message_record.fractional_consolidated_volume[consolidated_fractional_volume_message_at] = (consolidated_fractional_volume_message_base + 8 + consolidated_fractional_volume_message_at + 1) % 256; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_record.reason = (consolidated_fractional_volume_message_base + 16 + 1) % 256;
  consolidated_fractional_volume_message_record.complete = (consolidated_fractional_volume_message_base + 17 + 1) % 256;
  skip
}

/* Consolidated Fractional Volume Message to the wire, 18 bytes from where the cursor stands */
inline encode_consolidated_fractional_volume_message(consolidated_fractional_volume_message_record) {
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> wire[at] = consolidated_fractional_volume_message_record.symbol_index[consolidated_fractional_volume_message_at]; at = at + 1; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> wire[at] = consolidated_fractional_volume_message_record.symbol_seq_number[consolidated_fractional_volume_message_at]; at = at + 1; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 8 -> wire[at] = consolidated_fractional_volume_message_record.fractional_consolidated_volume[consolidated_fractional_volume_message_at]; at = at + 1; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_fractional_volume_message_record.reason; at = at + 1;
  wire[at] = consolidated_fractional_volume_message_record.complete; at = at + 1;
  skip
}

/* Consolidated Fractional Volume Message off the wire, 18 bytes from where the cursor stands */
inline decode_consolidated_fractional_volume_message(consolidated_fractional_volume_message_record) {
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> consolidated_fractional_volume_message_record.symbol_index[consolidated_fractional_volume_message_at] = wire[at]; at = at + 1; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> consolidated_fractional_volume_message_record.symbol_seq_number[consolidated_fractional_volume_message_at] = wire[at]; at = at + 1; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 8 -> consolidated_fractional_volume_message_record.fractional_consolidated_volume[consolidated_fractional_volume_message_at] = wire[at]; at = at + 1; consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_record.reason = wire[at]; at = at + 1;
  consolidated_fractional_volume_message_record.complete = wire[at]; at = at + 1;
  skip
}

/* what was read of Consolidated Fractional Volume Message is what was written, byte for byte */
inline equal_consolidated_fractional_volume_message(consolidated_fractional_volume_message_read, consolidated_fractional_volume_message_written) {
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> assert(consolidated_fractional_volume_message_read.symbol_index[consolidated_fractional_volume_message_at] == consolidated_fractional_volume_message_written.symbol_index[consolidated_fractional_volume_message_at]); consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 4 -> assert(consolidated_fractional_volume_message_read.symbol_seq_number[consolidated_fractional_volume_message_at] == consolidated_fractional_volume_message_written.symbol_seq_number[consolidated_fractional_volume_message_at]); consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  consolidated_fractional_volume_message_at = 0;
  do
  :: consolidated_fractional_volume_message_at < 8 -> assert(consolidated_fractional_volume_message_read.fractional_consolidated_volume[consolidated_fractional_volume_message_at] == consolidated_fractional_volume_message_written.fractional_consolidated_volume[consolidated_fractional_volume_message_at]); consolidated_fractional_volume_message_at = consolidated_fractional_volume_message_at + 1
  :: else -> break
  od;
  assert(consolidated_fractional_volume_message_read.reason == consolidated_fractional_volume_message_written.reason);
  assert(consolidated_fractional_volume_message_read.complete == consolidated_fractional_volume_message_written.complete);
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
    assert(at == 18);
    at = 0;
    decode_symbol_clear_message(symbol_clear_message_got);
    assert(at == 18);
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

/* Trf Fractional Trade Message: encoded, read back, and compared */
proctype check_trf_fractional_trade_message() {
  TrfFractionalTradeMessage trf_fractional_trade_message_sent;
  TrfFractionalTradeMessage trf_fractional_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trf_fractional_trade_message(trf_fractional_trade_message_sent, 0)
  :: pattern == 1 -> fill_trf_fractional_trade_message(trf_fractional_trade_message_sent, 32)
  :: pattern == 2 -> fill_trf_fractional_trade_message(trf_fractional_trade_message_sent, 255)
  :: else -> ramp_trf_fractional_trade_message(trf_fractional_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trf_fractional_trade_message(trf_fractional_trade_message_sent);
    assert(at == 46);
    at = 0;
    decode_trf_fractional_trade_message(trf_fractional_trade_message_got);
    assert(at == 46);
    equal_trf_fractional_trade_message(trf_fractional_trade_message_got, trf_fractional_trade_message_sent)
  }
}

/* Consolidated Trade Message: encoded, read back, and compared */
proctype check_consolidated_trade_message() {
  ConsolidatedTradeMessage consolidated_trade_message_sent;
  ConsolidatedTradeMessage consolidated_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_trade_message(consolidated_trade_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_trade_message(consolidated_trade_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_trade_message(consolidated_trade_message_sent, 255)
  :: else -> ramp_consolidated_trade_message(consolidated_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_trade_message(consolidated_trade_message_sent);
    assert(at == 34);
    at = 0;
    decode_consolidated_trade_message(consolidated_trade_message_got);
    assert(at == 34);
    equal_consolidated_trade_message(consolidated_trade_message_got, consolidated_trade_message_sent)
  }
}

/* Consolidated Trade Cancel Message: encoded, read back, and compared */
proctype check_consolidated_trade_cancel_message() {
  ConsolidatedTradeCancelMessage consolidated_trade_cancel_message_sent;
  ConsolidatedTradeCancelMessage consolidated_trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_trade_cancel_message(consolidated_trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_trade_cancel_message(consolidated_trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_trade_cancel_message(consolidated_trade_cancel_message_sent, 255)
  :: else -> ramp_consolidated_trade_cancel_message(consolidated_trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_trade_cancel_message(consolidated_trade_cancel_message_sent);
    assert(at == 22);
    at = 0;
    decode_consolidated_trade_cancel_message(consolidated_trade_cancel_message_got);
    assert(at == 22);
    equal_consolidated_trade_cancel_message(consolidated_trade_cancel_message_got, consolidated_trade_cancel_message_sent)
  }
}

/* Trf Fractional Trade Correction Message: encoded, read back, and compared */
proctype check_trf_fractional_trade_correction_message() {
  TrfFractionalTradeCorrectionMessage trf_fractional_trade_correction_message_sent;
  TrfFractionalTradeCorrectionMessage trf_fractional_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_sent, 255)
  :: else -> ramp_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_sent);
    assert(at == 50);
    at = 0;
    decode_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_got);
    assert(at == 50);
    equal_trf_fractional_trade_correction_message(trf_fractional_trade_correction_message_got, trf_fractional_trade_correction_message_sent)
  }
}

/* Consolidated Trade Correction Message: encoded, read back, and compared */
proctype check_consolidated_trade_correction_message() {
  ConsolidatedTradeCorrectionMessage consolidated_trade_correction_message_sent;
  ConsolidatedTradeCorrectionMessage consolidated_trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_trade_correction_message(consolidated_trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_trade_correction_message(consolidated_trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_trade_correction_message(consolidated_trade_correction_message_sent, 255)
  :: else -> ramp_consolidated_trade_correction_message(consolidated_trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_trade_correction_message(consolidated_trade_correction_message_sent);
    assert(at == 38);
    at = 0;
    decode_consolidated_trade_correction_message(consolidated_trade_correction_message_got);
    assert(at == 38);
    equal_consolidated_trade_correction_message(consolidated_trade_correction_message_got, consolidated_trade_correction_message_sent)
  }
}

/* Trf Fractional Prior Day Trade Message: encoded, read back, and compared */
proctype check_trf_fractional_prior_day_trade_message() {
  TrfFractionalPriorDayTradeMessage trf_fractional_prior_day_trade_message_sent;
  TrfFractionalPriorDayTradeMessage trf_fractional_prior_day_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_sent, 0)
  :: pattern == 1 -> fill_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_sent, 32)
  :: pattern == 2 -> fill_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_sent, 255)
  :: else -> ramp_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_sent);
    assert(at == 44);
    at = 0;
    decode_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_got);
    assert(at == 44);
    equal_trf_fractional_prior_day_trade_message(trf_fractional_prior_day_trade_message_got, trf_fractional_prior_day_trade_message_sent)
  }
}

/* Trf Fractional Prior Day Trade Cancel Message: encoded, read back, and compared */
proctype check_trf_fractional_prior_day_trade_cancel_message() {
  TrfFractionalPriorDayTradeCancelMessage trf_fractional_prior_day_trade_cancel_message_sent;
  TrfFractionalPriorDayTradeCancelMessage trf_fractional_prior_day_trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_sent, 255)
  :: else -> ramp_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_sent);
    assert(at == 40);
    at = 0;
    decode_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_got);
    assert(at == 40);
    equal_trf_fractional_prior_day_trade_cancel_message(trf_fractional_prior_day_trade_cancel_message_got, trf_fractional_prior_day_trade_cancel_message_sent)
  }
}

/* Consolidated Fractional Stock Summary Message: encoded, read back, and compared */
proctype check_consolidated_fractional_stock_summary_message() {
  ConsolidatedFractionalStockSummaryMessage consolidated_fractional_stock_summary_message_sent;
  ConsolidatedFractionalStockSummaryMessage consolidated_fractional_stock_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_sent, 255)
  :: else -> ramp_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_sent);
    assert(at == 62);
    at = 0;
    decode_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_got);
    assert(at == 62);
    equal_consolidated_fractional_stock_summary_message(consolidated_fractional_stock_summary_message_got, consolidated_fractional_stock_summary_message_sent)
  }
}

/* Consolidated Fractional Volume Message: encoded, read back, and compared */
proctype check_consolidated_fractional_volume_message() {
  ConsolidatedFractionalVolumeMessage consolidated_fractional_volume_message_sent;
  ConsolidatedFractionalVolumeMessage consolidated_fractional_volume_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_fractional_volume_message(consolidated_fractional_volume_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_fractional_volume_message(consolidated_fractional_volume_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_fractional_volume_message(consolidated_fractional_volume_message_sent, 255)
  :: else -> ramp_consolidated_fractional_volume_message(consolidated_fractional_volume_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_fractional_volume_message(consolidated_fractional_volume_message_sent);
    assert(at == 18);
    at = 0;
    decode_consolidated_fractional_volume_message(consolidated_fractional_volume_message_got);
    assert(at == 18);
    equal_consolidated_fractional_volume_message(consolidated_fractional_volume_message_got, consolidated_fractional_volume_message_sent)
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
  :: run check_retransmission_request_message()
  :: run check_symbol_index_mapping_request_message()
  :: run check_refresh_request_message()
  :: run check_message_unavailable_message()
  :: run check_request_response_message()
  :: run check_heartbeat_response_message()
  :: run check_trf_fractional_trade_message()
  :: run check_consolidated_trade_message()
  :: run check_consolidated_trade_cancel_message()
  :: run check_trf_fractional_trade_correction_message()
  :: run check_consolidated_trade_correction_message()
  :: run check_trf_fractional_prior_day_trade_message()
  :: run check_trf_fractional_prior_day_trade_cancel_message()
  :: run check_consolidated_fractional_stock_summary_message()
  :: run check_consolidated_fractional_volume_message()
  fi
}
