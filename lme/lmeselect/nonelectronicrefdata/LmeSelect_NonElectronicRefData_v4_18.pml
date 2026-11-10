/*
 * The London Metal Exchange LMEsource NonElectronicRefData
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
#define WIRE 99

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

/* ---- Instrument Definition Message: 99 bytes --------------------------------- */

/* Describes a futures outright prompt date or option call or put strike. */
typedef InstrumentDefinitionMessage {
  byte instrument_id[8];
  byte name[40];
  byte contract_code[12];
  byte underlying_instrument_id[8];
  byte expiry_date[4];
  byte strike_price[8];
  byte option_type;
  byte cfi_code[6];
  byte isin[12]
};

int instrument_definition_message_at;

/* every byte of Instrument Definition Message set to one value */
inline fill_instrument_definition_message(instrument_definition_message_record, instrument_definition_message_value) {
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.instrument_id[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 40 -> instrument_definition_message_record.name[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> instrument_definition_message_record.contract_code[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.underlying_instrument_id[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 4 -> instrument_definition_message_record.expiry_date[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.strike_price[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_record.option_type = instrument_definition_message_value;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 6 -> instrument_definition_message_record.cfi_code[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> instrument_definition_message_record.isin[instrument_definition_message_at] = instrument_definition_message_value; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Definition Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_definition_message(instrument_definition_message_record, instrument_definition_message_base) {
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.instrument_id[instrument_definition_message_at] = (instrument_definition_message_base + 0 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 40 -> instrument_definition_message_record.name[instrument_definition_message_at] = (instrument_definition_message_base + 8 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> instrument_definition_message_record.contract_code[instrument_definition_message_at] = (instrument_definition_message_base + 48 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.underlying_instrument_id[instrument_definition_message_at] = (instrument_definition_message_base + 60 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 4 -> instrument_definition_message_record.expiry_date[instrument_definition_message_at] = (instrument_definition_message_base + 68 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.strike_price[instrument_definition_message_at] = (instrument_definition_message_base + 72 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_record.option_type = (instrument_definition_message_base + 80 + 1) % 256;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 6 -> instrument_definition_message_record.cfi_code[instrument_definition_message_at] = (instrument_definition_message_base + 81 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> instrument_definition_message_record.isin[instrument_definition_message_at] = (instrument_definition_message_base + 87 + instrument_definition_message_at + 1) % 256; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition Message to the wire, 99 bytes from where the cursor stands */
inline encode_instrument_definition_message(instrument_definition_message_record) {
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> wire[at] = instrument_definition_message_record.instrument_id[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 40 -> wire[at] = instrument_definition_message_record.name[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> wire[at] = instrument_definition_message_record.contract_code[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> wire[at] = instrument_definition_message_record.underlying_instrument_id[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 4 -> wire[at] = instrument_definition_message_record.expiry_date[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> wire[at] = instrument_definition_message_record.strike_price[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_message_record.option_type; at = at + 1;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 6 -> wire[at] = instrument_definition_message_record.cfi_code[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> wire[at] = instrument_definition_message_record.isin[instrument_definition_message_at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition Message off the wire, 99 bytes from where the cursor stands */
inline decode_instrument_definition_message(instrument_definition_message_record) {
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.instrument_id[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 40 -> instrument_definition_message_record.name[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> instrument_definition_message_record.contract_code[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.underlying_instrument_id[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 4 -> instrument_definition_message_record.expiry_date[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> instrument_definition_message_record.strike_price[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_record.option_type = wire[at]; at = at + 1;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 6 -> instrument_definition_message_record.cfi_code[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> instrument_definition_message_record.isin[instrument_definition_message_at] = wire[at]; at = at + 1; instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Definition Message is what was written, byte for byte */
inline equal_instrument_definition_message(instrument_definition_message_read, instrument_definition_message_written) {
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> assert(instrument_definition_message_read.instrument_id[instrument_definition_message_at] == instrument_definition_message_written.instrument_id[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 40 -> assert(instrument_definition_message_read.name[instrument_definition_message_at] == instrument_definition_message_written.name[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> assert(instrument_definition_message_read.contract_code[instrument_definition_message_at] == instrument_definition_message_written.contract_code[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> assert(instrument_definition_message_read.underlying_instrument_id[instrument_definition_message_at] == instrument_definition_message_written.underlying_instrument_id[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 4 -> assert(instrument_definition_message_read.expiry_date[instrument_definition_message_at] == instrument_definition_message_written.expiry_date[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 8 -> assert(instrument_definition_message_read.strike_price[instrument_definition_message_at] == instrument_definition_message_written.strike_price[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(instrument_definition_message_read.option_type == instrument_definition_message_written.option_type);
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 6 -> assert(instrument_definition_message_read.cfi_code[instrument_definition_message_at] == instrument_definition_message_written.cfi_code[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  instrument_definition_message_at = 0;
  do
  :: instrument_definition_message_at < 12 -> assert(instrument_definition_message_read.isin[instrument_definition_message_at] == instrument_definition_message_written.isin[instrument_definition_message_at]); instrument_definition_message_at = instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Statistics Intraday Message: 36 bytes ----------------------------- */

/* Generated at the end of each Ring trading session for instruments that have traded. Two messages are published, one for each high price and low price. If no price has been received the field is set to null. */
typedef OrderStatisticsIntradayMessage {
  byte time_of_event[8];
  byte tradable_instrument_id[8];
  byte trading_venue[2];
  byte ring_session[2];
  byte order_high[8];
  byte order_low[8]
};

int order_statistics_intraday_message_at;

/* every byte of Order Statistics Intraday Message set to one value */
inline fill_order_statistics_intraday_message(order_statistics_intraday_message_record, order_statistics_intraday_message_value) {
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.time_of_event[order_statistics_intraday_message_at] = order_statistics_intraday_message_value; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.tradable_instrument_id[order_statistics_intraday_message_at] = order_statistics_intraday_message_value; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> order_statistics_intraday_message_record.trading_venue[order_statistics_intraday_message_at] = order_statistics_intraday_message_value; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> order_statistics_intraday_message_record.ring_session[order_statistics_intraday_message_at] = order_statistics_intraday_message_value; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.order_high[order_statistics_intraday_message_at] = order_statistics_intraday_message_value; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.order_low[order_statistics_intraday_message_at] = order_statistics_intraday_message_value; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Statistics Intraday Message set to where it lies, so a field read out of place says so */
inline ramp_order_statistics_intraday_message(order_statistics_intraday_message_record, order_statistics_intraday_message_base) {
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.time_of_event[order_statistics_intraday_message_at] = (order_statistics_intraday_message_base + 0 + order_statistics_intraday_message_at + 1) % 256; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.tradable_instrument_id[order_statistics_intraday_message_at] = (order_statistics_intraday_message_base + 8 + order_statistics_intraday_message_at + 1) % 256; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> order_statistics_intraday_message_record.trading_venue[order_statistics_intraday_message_at] = (order_statistics_intraday_message_base + 16 + order_statistics_intraday_message_at + 1) % 256; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> order_statistics_intraday_message_record.ring_session[order_statistics_intraday_message_at] = (order_statistics_intraday_message_base + 18 + order_statistics_intraday_message_at + 1) % 256; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.order_high[order_statistics_intraday_message_at] = (order_statistics_intraday_message_base + 20 + order_statistics_intraday_message_at + 1) % 256; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.order_low[order_statistics_intraday_message_at] = (order_statistics_intraday_message_base + 28 + order_statistics_intraday_message_at + 1) % 256; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Statistics Intraday Message to the wire, 36 bytes from where the cursor stands */
inline encode_order_statistics_intraday_message(order_statistics_intraday_message_record) {
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> wire[at] = order_statistics_intraday_message_record.time_of_event[order_statistics_intraday_message_at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> wire[at] = order_statistics_intraday_message_record.tradable_instrument_id[order_statistics_intraday_message_at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> wire[at] = order_statistics_intraday_message_record.trading_venue[order_statistics_intraday_message_at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> wire[at] = order_statistics_intraday_message_record.ring_session[order_statistics_intraday_message_at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> wire[at] = order_statistics_intraday_message_record.order_high[order_statistics_intraday_message_at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> wire[at] = order_statistics_intraday_message_record.order_low[order_statistics_intraday_message_at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Statistics Intraday Message off the wire, 36 bytes from where the cursor stands */
inline decode_order_statistics_intraday_message(order_statistics_intraday_message_record) {
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.time_of_event[order_statistics_intraday_message_at] = wire[at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.tradable_instrument_id[order_statistics_intraday_message_at] = wire[at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> order_statistics_intraday_message_record.trading_venue[order_statistics_intraday_message_at] = wire[at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> order_statistics_intraday_message_record.ring_session[order_statistics_intraday_message_at] = wire[at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.order_high[order_statistics_intraday_message_at] = wire[at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> order_statistics_intraday_message_record.order_low[order_statistics_intraday_message_at] = wire[at]; at = at + 1; order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Statistics Intraday Message is what was written, byte for byte */
inline equal_order_statistics_intraday_message(order_statistics_intraday_message_read, order_statistics_intraday_message_written) {
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> assert(order_statistics_intraday_message_read.time_of_event[order_statistics_intraday_message_at] == order_statistics_intraday_message_written.time_of_event[order_statistics_intraday_message_at]); order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> assert(order_statistics_intraday_message_read.tradable_instrument_id[order_statistics_intraday_message_at] == order_statistics_intraday_message_written.tradable_instrument_id[order_statistics_intraday_message_at]); order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> assert(order_statistics_intraday_message_read.trading_venue[order_statistics_intraday_message_at] == order_statistics_intraday_message_written.trading_venue[order_statistics_intraday_message_at]); order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 2 -> assert(order_statistics_intraday_message_read.ring_session[order_statistics_intraday_message_at] == order_statistics_intraday_message_written.ring_session[order_statistics_intraday_message_at]); order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> assert(order_statistics_intraday_message_read.order_high[order_statistics_intraday_message_at] == order_statistics_intraday_message_written.order_high[order_statistics_intraday_message_at]); order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
  :: else -> break
  od;
  order_statistics_intraday_message_at = 0;
  do
  :: order_statistics_intraday_message_at < 8 -> assert(order_statistics_intraday_message_read.order_low[order_statistics_intraday_message_at] == order_statistics_intraday_message_written.order_low[order_statistics_intraday_message_at]); order_statistics_intraday_message_at = order_statistics_intraday_message_at + 1
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

/* Instrument Definition Message: encoded, read back, and compared */
proctype check_instrument_definition_message() {
  InstrumentDefinitionMessage instrument_definition_message_sent;
  InstrumentDefinitionMessage instrument_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_definition_message(instrument_definition_message_sent, 0)
  :: pattern == 1 -> fill_instrument_definition_message(instrument_definition_message_sent, 32)
  :: pattern == 2 -> fill_instrument_definition_message(instrument_definition_message_sent, 255)
  :: else -> ramp_instrument_definition_message(instrument_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_definition_message(instrument_definition_message_sent);
    assert(at == 99);
    at = 0;
    decode_instrument_definition_message(instrument_definition_message_got);
    assert(at == 99);
    equal_instrument_definition_message(instrument_definition_message_got, instrument_definition_message_sent)
  }
}

/* Order Statistics Intraday Message: encoded, read back, and compared */
proctype check_order_statistics_intraday_message() {
  OrderStatisticsIntradayMessage order_statistics_intraday_message_sent;
  OrderStatisticsIntradayMessage order_statistics_intraday_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_statistics_intraday_message(order_statistics_intraday_message_sent, 0)
  :: pattern == 1 -> fill_order_statistics_intraday_message(order_statistics_intraday_message_sent, 32)
  :: pattern == 2 -> fill_order_statistics_intraday_message(order_statistics_intraday_message_sent, 255)
  :: else -> ramp_order_statistics_intraday_message(order_statistics_intraday_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_statistics_intraday_message(order_statistics_intraday_message_sent);
    assert(at == 36);
    at = 0;
    decode_order_statistics_intraday_message(order_statistics_intraday_message_got);
    assert(at == 36);
    equal_order_statistics_intraday_message(order_statistics_intraday_message_got, order_statistics_intraday_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_sequence_reset_message()
  :: run check_instrument_definition_message()
  :: run check_order_statistics_intraday_message()
  fi
}
