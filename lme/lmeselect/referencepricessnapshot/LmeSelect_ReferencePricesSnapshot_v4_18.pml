/*
 * The London Metal Exchange LMEsource ReferencePrices Refresh
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
#define WIRE 94

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

/* ---- Reference Price Message: 94 bytes --------------------------------------- */

/* Reference prices are published for instruments with an InstrumentID for the Official, Settlement, Closing and Index price types. Instruments are published in the Instrument Definition message. */
typedef ReferencePriceMessage {
  byte time_of_event[8];
  byte reference_price_category;
  byte reference_price_type[32];
  byte price_status[12];
  byte business_date[4];
  byte instrument_id[8];
  byte product_code[2];
  byte currency_code[3];
  byte bid[8];
  byte price[8];
  byte ask[8]
};

int reference_price_message_at;

/* every byte of Reference Price Message set to one value */
inline fill_reference_price_message(reference_price_message_record, reference_price_message_value) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.time_of_event[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.reference_price_category = reference_price_message_value;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 32 -> reference_price_message_record.reference_price_type[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 12 -> reference_price_message_record.price_status[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.business_date[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.instrument_id[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 2 -> reference_price_message_record.product_code[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 3 -> reference_price_message_record.currency_code[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.bid[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.ask[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_reference_price_message(reference_price_message_record, reference_price_message_base) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.time_of_event[reference_price_message_at] = (reference_price_message_base + 0 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.reference_price_category = (reference_price_message_base + 8 + 1) % 256;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 32 -> reference_price_message_record.reference_price_type[reference_price_message_at] = (reference_price_message_base + 9 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 12 -> reference_price_message_record.price_status[reference_price_message_at] = (reference_price_message_base + 41 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.business_date[reference_price_message_at] = (reference_price_message_base + 53 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.instrument_id[reference_price_message_at] = (reference_price_message_base + 57 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 2 -> reference_price_message_record.product_code[reference_price_message_at] = (reference_price_message_base + 65 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 3 -> reference_price_message_record.currency_code[reference_price_message_at] = (reference_price_message_base + 67 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.bid[reference_price_message_at] = (reference_price_message_base + 70 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = (reference_price_message_base + 78 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.ask[reference_price_message_at] = (reference_price_message_base + 86 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message to the wire, 94 bytes from where the cursor stands */
inline encode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.time_of_event[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = reference_price_message_record.reference_price_category; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 32 -> wire[at] = reference_price_message_record.reference_price_type[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 12 -> wire[at] = reference_price_message_record.price_status[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.business_date[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.instrument_id[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 2 -> wire[at] = reference_price_message_record.product_code[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 3 -> wire[at] = reference_price_message_record.currency_code[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.bid[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.ask[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Price Message off the wire, 94 bytes from where the cursor stands */
inline decode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.time_of_event[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.reference_price_category = wire[at]; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 32 -> reference_price_message_record.reference_price_type[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 12 -> reference_price_message_record.price_status[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.business_date[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.instrument_id[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 2 -> reference_price_message_record.product_code[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 3 -> reference_price_message_record.currency_code[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.bid[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.ask[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reference Price Message is what was written, byte for byte */
inline equal_reference_price_message(reference_price_message_read, reference_price_message_written) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.time_of_event[reference_price_message_at] == reference_price_message_written.time_of_event[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  assert(reference_price_message_read.reference_price_category == reference_price_message_written.reference_price_category);
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 32 -> assert(reference_price_message_read.reference_price_type[reference_price_message_at] == reference_price_message_written.reference_price_type[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 12 -> assert(reference_price_message_read.price_status[reference_price_message_at] == reference_price_message_written.price_status[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.business_date[reference_price_message_at] == reference_price_message_written.business_date[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.instrument_id[reference_price_message_at] == reference_price_message_written.instrument_id[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 2 -> assert(reference_price_message_read.product_code[reference_price_message_at] == reference_price_message_written.product_code[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 3 -> assert(reference_price_message_read.currency_code[reference_price_message_at] == reference_price_message_written.currency_code[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.bid[reference_price_message_at] == reference_price_message_written.bid[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.price[reference_price_message_at] == reference_price_message_written.price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.ask[reference_price_message_at] == reference_price_message_written.ask[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reference Fx Rate Message: 25 bytes ------------------------------------- */

/* Exchange FX rates are published for the Cash prompt. Daily and Monthly Moving Average Exchange FX rates are published each day, with the Monthly Average Exchange FX rate published on the last business day of the month. MonthlyMovingAverage and MonthlyAverage are published only for the Exchange category. */
typedef ReferenceFxRateMessage {
  byte fx_rate_category;
  byte fx_rate_type[2];
  byte business_date[4];
  byte maturity_date[4];
  byte base_currency_code[3];
  byte target_currency_code[3];
  byte conversion_rate[8]
};

int reference_fx_rate_message_at;

/* every byte of Reference Fx Rate Message set to one value */
inline fill_reference_fx_rate_message(reference_fx_rate_message_record, reference_fx_rate_message_value) {
  reference_fx_rate_message_record.fx_rate_category = reference_fx_rate_message_value;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 2 -> reference_fx_rate_message_record.fx_rate_type[reference_fx_rate_message_at] = reference_fx_rate_message_value; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> reference_fx_rate_message_record.business_date[reference_fx_rate_message_at] = reference_fx_rate_message_value; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> reference_fx_rate_message_record.maturity_date[reference_fx_rate_message_at] = reference_fx_rate_message_value; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> reference_fx_rate_message_record.base_currency_code[reference_fx_rate_message_at] = reference_fx_rate_message_value; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> reference_fx_rate_message_record.target_currency_code[reference_fx_rate_message_at] = reference_fx_rate_message_value; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 8 -> reference_fx_rate_message_record.conversion_rate[reference_fx_rate_message_at] = reference_fx_rate_message_value; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reference Fx Rate Message set to where it lies, so a field read out of place says so */
inline ramp_reference_fx_rate_message(reference_fx_rate_message_record, reference_fx_rate_message_base) {
  reference_fx_rate_message_record.fx_rate_category = (reference_fx_rate_message_base + 0 + 1) % 256;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 2 -> reference_fx_rate_message_record.fx_rate_type[reference_fx_rate_message_at] = (reference_fx_rate_message_base + 1 + reference_fx_rate_message_at + 1) % 256; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> reference_fx_rate_message_record.business_date[reference_fx_rate_message_at] = (reference_fx_rate_message_base + 3 + reference_fx_rate_message_at + 1) % 256; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> reference_fx_rate_message_record.maturity_date[reference_fx_rate_message_at] = (reference_fx_rate_message_base + 7 + reference_fx_rate_message_at + 1) % 256; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> reference_fx_rate_message_record.base_currency_code[reference_fx_rate_message_at] = (reference_fx_rate_message_base + 11 + reference_fx_rate_message_at + 1) % 256; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> reference_fx_rate_message_record.target_currency_code[reference_fx_rate_message_at] = (reference_fx_rate_message_base + 14 + reference_fx_rate_message_at + 1) % 256; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 8 -> reference_fx_rate_message_record.conversion_rate[reference_fx_rate_message_at] = (reference_fx_rate_message_base + 17 + reference_fx_rate_message_at + 1) % 256; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Fx Rate Message to the wire, 25 bytes from where the cursor stands */
inline encode_reference_fx_rate_message(reference_fx_rate_message_record) {
  wire[at] = reference_fx_rate_message_record.fx_rate_category; at = at + 1;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 2 -> wire[at] = reference_fx_rate_message_record.fx_rate_type[reference_fx_rate_message_at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> wire[at] = reference_fx_rate_message_record.business_date[reference_fx_rate_message_at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> wire[at] = reference_fx_rate_message_record.maturity_date[reference_fx_rate_message_at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> wire[at] = reference_fx_rate_message_record.base_currency_code[reference_fx_rate_message_at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> wire[at] = reference_fx_rate_message_record.target_currency_code[reference_fx_rate_message_at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 8 -> wire[at] = reference_fx_rate_message_record.conversion_rate[reference_fx_rate_message_at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reference Fx Rate Message off the wire, 25 bytes from where the cursor stands */
inline decode_reference_fx_rate_message(reference_fx_rate_message_record) {
  reference_fx_rate_message_record.fx_rate_category = wire[at]; at = at + 1;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 2 -> reference_fx_rate_message_record.fx_rate_type[reference_fx_rate_message_at] = wire[at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> reference_fx_rate_message_record.business_date[reference_fx_rate_message_at] = wire[at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> reference_fx_rate_message_record.maturity_date[reference_fx_rate_message_at] = wire[at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> reference_fx_rate_message_record.base_currency_code[reference_fx_rate_message_at] = wire[at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> reference_fx_rate_message_record.target_currency_code[reference_fx_rate_message_at] = wire[at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 8 -> reference_fx_rate_message_record.conversion_rate[reference_fx_rate_message_at] = wire[at]; at = at + 1; reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reference Fx Rate Message is what was written, byte for byte */
inline equal_reference_fx_rate_message(reference_fx_rate_message_read, reference_fx_rate_message_written) {
  assert(reference_fx_rate_message_read.fx_rate_category == reference_fx_rate_message_written.fx_rate_category);
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 2 -> assert(reference_fx_rate_message_read.fx_rate_type[reference_fx_rate_message_at] == reference_fx_rate_message_written.fx_rate_type[reference_fx_rate_message_at]); reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> assert(reference_fx_rate_message_read.business_date[reference_fx_rate_message_at] == reference_fx_rate_message_written.business_date[reference_fx_rate_message_at]); reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 4 -> assert(reference_fx_rate_message_read.maturity_date[reference_fx_rate_message_at] == reference_fx_rate_message_written.maturity_date[reference_fx_rate_message_at]); reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> assert(reference_fx_rate_message_read.base_currency_code[reference_fx_rate_message_at] == reference_fx_rate_message_written.base_currency_code[reference_fx_rate_message_at]); reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 3 -> assert(reference_fx_rate_message_read.target_currency_code[reference_fx_rate_message_at] == reference_fx_rate_message_written.target_currency_code[reference_fx_rate_message_at]); reference_fx_rate_message_at = reference_fx_rate_message_at + 1
  :: else -> break
  od;
  reference_fx_rate_message_at = 0;
  do
  :: reference_fx_rate_message_at < 8 -> assert(reference_fx_rate_message_read.conversion_rate[reference_fx_rate_message_at] == reference_fx_rate_message_written.conversion_rate[reference_fx_rate_message_at]); reference_fx_rate_message_at = reference_fx_rate_message_at + 1
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

/* Reference Price Message: encoded, read back, and compared */
proctype check_reference_price_message() {
  ReferencePriceMessage reference_price_message_sent;
  ReferencePriceMessage reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_price_message(reference_price_message_sent, 0)
  :: pattern == 1 -> fill_reference_price_message(reference_price_message_sent, 32)
  :: pattern == 2 -> fill_reference_price_message(reference_price_message_sent, 255)
  :: else -> ramp_reference_price_message(reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_price_message(reference_price_message_sent);
    assert(at == 94);
    at = 0;
    decode_reference_price_message(reference_price_message_got);
    assert(at == 94);
    equal_reference_price_message(reference_price_message_got, reference_price_message_sent)
  }
}

/* Reference Fx Rate Message: encoded, read back, and compared */
proctype check_reference_fx_rate_message() {
  ReferenceFxRateMessage reference_fx_rate_message_sent;
  ReferenceFxRateMessage reference_fx_rate_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_fx_rate_message(reference_fx_rate_message_sent, 0)
  :: pattern == 1 -> fill_reference_fx_rate_message(reference_fx_rate_message_sent, 32)
  :: pattern == 2 -> fill_reference_fx_rate_message(reference_fx_rate_message_sent, 255)
  :: else -> ramp_reference_fx_rate_message(reference_fx_rate_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_fx_rate_message(reference_fx_rate_message_sent);
    assert(at == 25);
    at = 0;
    decode_reference_fx_rate_message(reference_fx_rate_message_got);
    assert(at == 25);
    equal_reference_fx_rate_message(reference_fx_rate_message_got, reference_fx_rate_message_sent)
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
  :: run check_reference_price_message()
  :: run check_reference_fx_rate_message()
  :: run check_refresh_complete_message()
  fi
}
