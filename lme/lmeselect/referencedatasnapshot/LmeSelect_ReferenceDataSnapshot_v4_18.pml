/*
 * The London Metal Exchange LMEsource ReferenceData Refresh
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
#define WIRE 134

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

/* ---- Contract Definition Message: 134 bytes ---------------------------------- */

/* Published for a new contract prior to its first trading date, to enable participants to configure risk management parameters before the contract becomes tradable. */
typedef ContractDefinitionMessage {
  byte trading_venue[2];
  byte contract_code[12];
  byte name[64];
  byte contract_type;
  byte product_code[2];
  byte underlying_type;
  byte underlying_contract_code[12];
  byte trading_currency[3];
  byte settlement_type;
  byte settlement_pricing_method;
  byte exercise_style;
  byte lot_unit[20];
  byte lot_size[8];
  byte lot_size_type;
  byte contract_price_type;
  byte first_trading_date[4]
};

int contract_definition_message_at;

/* every byte of Contract Definition Message set to one value */
inline fill_contract_definition_message(contract_definition_message_record, contract_definition_message_value) {
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> contract_definition_message_record.trading_venue[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> contract_definition_message_record.contract_code[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 64 -> contract_definition_message_record.name[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.contract_type = contract_definition_message_value;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> contract_definition_message_record.product_code[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.underlying_type = contract_definition_message_value;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> contract_definition_message_record.underlying_contract_code[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 3 -> contract_definition_message_record.trading_currency[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.settlement_type = contract_definition_message_value;
  contract_definition_message_record.settlement_pricing_method = contract_definition_message_value;
  contract_definition_message_record.exercise_style = contract_definition_message_value;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 20 -> contract_definition_message_record.lot_unit[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 8 -> contract_definition_message_record.lot_size[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.lot_size_type = contract_definition_message_value;
  contract_definition_message_record.contract_price_type = contract_definition_message_value;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 4 -> contract_definition_message_record.first_trading_date[contract_definition_message_at] = contract_definition_message_value; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contract Definition Message set to where it lies, so a field read out of place says so */
inline ramp_contract_definition_message(contract_definition_message_record, contract_definition_message_base) {
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> contract_definition_message_record.trading_venue[contract_definition_message_at] = (contract_definition_message_base + 0 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> contract_definition_message_record.contract_code[contract_definition_message_at] = (contract_definition_message_base + 2 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 64 -> contract_definition_message_record.name[contract_definition_message_at] = (contract_definition_message_base + 14 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.contract_type = (contract_definition_message_base + 78 + 1) % 256;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> contract_definition_message_record.product_code[contract_definition_message_at] = (contract_definition_message_base + 79 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.underlying_type = (contract_definition_message_base + 81 + 1) % 256;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> contract_definition_message_record.underlying_contract_code[contract_definition_message_at] = (contract_definition_message_base + 82 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 3 -> contract_definition_message_record.trading_currency[contract_definition_message_at] = (contract_definition_message_base + 94 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.settlement_type = (contract_definition_message_base + 97 + 1) % 256;
  contract_definition_message_record.settlement_pricing_method = (contract_definition_message_base + 98 + 1) % 256;
  contract_definition_message_record.exercise_style = (contract_definition_message_base + 99 + 1) % 256;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 20 -> contract_definition_message_record.lot_unit[contract_definition_message_at] = (contract_definition_message_base + 100 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 8 -> contract_definition_message_record.lot_size[contract_definition_message_at] = (contract_definition_message_base + 120 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.lot_size_type = (contract_definition_message_base + 128 + 1) % 256;
  contract_definition_message_record.contract_price_type = (contract_definition_message_base + 129 + 1) % 256;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 4 -> contract_definition_message_record.first_trading_date[contract_definition_message_at] = (contract_definition_message_base + 130 + contract_definition_message_at + 1) % 256; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Definition Message to the wire, 134 bytes from where the cursor stands */
inline encode_contract_definition_message(contract_definition_message_record) {
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> wire[at] = contract_definition_message_record.trading_venue[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> wire[at] = contract_definition_message_record.contract_code[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 64 -> wire[at] = contract_definition_message_record.name[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = contract_definition_message_record.contract_type; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> wire[at] = contract_definition_message_record.product_code[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = contract_definition_message_record.underlying_type; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> wire[at] = contract_definition_message_record.underlying_contract_code[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 3 -> wire[at] = contract_definition_message_record.trading_currency[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = contract_definition_message_record.settlement_type; at = at + 1;
  wire[at] = contract_definition_message_record.settlement_pricing_method; at = at + 1;
  wire[at] = contract_definition_message_record.exercise_style; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 20 -> wire[at] = contract_definition_message_record.lot_unit[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 8 -> wire[at] = contract_definition_message_record.lot_size[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = contract_definition_message_record.lot_size_type; at = at + 1;
  wire[at] = contract_definition_message_record.contract_price_type; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 4 -> wire[at] = contract_definition_message_record.first_trading_date[contract_definition_message_at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Definition Message off the wire, 134 bytes from where the cursor stands */
inline decode_contract_definition_message(contract_definition_message_record) {
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> contract_definition_message_record.trading_venue[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> contract_definition_message_record.contract_code[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 64 -> contract_definition_message_record.name[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.contract_type = wire[at]; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> contract_definition_message_record.product_code[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.underlying_type = wire[at]; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> contract_definition_message_record.underlying_contract_code[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 3 -> contract_definition_message_record.trading_currency[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.settlement_type = wire[at]; at = at + 1;
  contract_definition_message_record.settlement_pricing_method = wire[at]; at = at + 1;
  contract_definition_message_record.exercise_style = wire[at]; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 20 -> contract_definition_message_record.lot_unit[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 8 -> contract_definition_message_record.lot_size[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_record.lot_size_type = wire[at]; at = at + 1;
  contract_definition_message_record.contract_price_type = wire[at]; at = at + 1;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 4 -> contract_definition_message_record.first_trading_date[contract_definition_message_at] = wire[at]; at = at + 1; contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contract Definition Message is what was written, byte for byte */
inline equal_contract_definition_message(contract_definition_message_read, contract_definition_message_written) {
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> assert(contract_definition_message_read.trading_venue[contract_definition_message_at] == contract_definition_message_written.trading_venue[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> assert(contract_definition_message_read.contract_code[contract_definition_message_at] == contract_definition_message_written.contract_code[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 64 -> assert(contract_definition_message_read.name[contract_definition_message_at] == contract_definition_message_written.name[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  assert(contract_definition_message_read.contract_type == contract_definition_message_written.contract_type);
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 2 -> assert(contract_definition_message_read.product_code[contract_definition_message_at] == contract_definition_message_written.product_code[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  assert(contract_definition_message_read.underlying_type == contract_definition_message_written.underlying_type);
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 12 -> assert(contract_definition_message_read.underlying_contract_code[contract_definition_message_at] == contract_definition_message_written.underlying_contract_code[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 3 -> assert(contract_definition_message_read.trading_currency[contract_definition_message_at] == contract_definition_message_written.trading_currency[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  assert(contract_definition_message_read.settlement_type == contract_definition_message_written.settlement_type);
  assert(contract_definition_message_read.settlement_pricing_method == contract_definition_message_written.settlement_pricing_method);
  assert(contract_definition_message_read.exercise_style == contract_definition_message_written.exercise_style);
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 20 -> assert(contract_definition_message_read.lot_unit[contract_definition_message_at] == contract_definition_message_written.lot_unit[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 8 -> assert(contract_definition_message_read.lot_size[contract_definition_message_at] == contract_definition_message_written.lot_size[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  assert(contract_definition_message_read.lot_size_type == contract_definition_message_written.lot_size_type);
  assert(contract_definition_message_read.contract_price_type == contract_definition_message_written.contract_price_type);
  contract_definition_message_at = 0;
  do
  :: contract_definition_message_at < 4 -> assert(contract_definition_message_read.first_trading_date[contract_definition_message_at] == contract_definition_message_written.first_trading_date[contract_definition_message_at]); contract_definition_message_at = contract_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outright Definition Message: 121 bytes ---------------------------------- */

/* Describes individual outright tradable instruments available from LMEsource. */
typedef OutrightDefinitionMessage {
  byte trading_venue[2];
  byte tradable_instrument_id[8];
  byte merged_tradable_instrument_id[8];
  byte linked_tradable_instrument_id[8];
  byte product_code[2];
  byte contract_type;
  byte trading_currency[3];
  byte contract_code[12];
  byte expiry_date[4];
  byte prompt_type;
  byte strike_price[8];
  byte option_type;
  byte exercise_style;
  byte prompt_date_label[6];
  byte price_code[2];
  byte isin[12];
  byte cfi_code[6];
  byte market_code[4];
  byte market_segment_code[12];
  byte tick_size_id[4];
  byte lot_size[8];
  byte lot_size_type;
  byte last_trading_date[4];
  byte settlement_type;
  byte settlement_pricing_method;
  byte underlying_type
};

int outright_definition_message_at;

/* every byte of Outright Definition Message set to one value */
inline fill_outright_definition_message(outright_definition_message_record, outright_definition_message_value) {
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.trading_venue[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.tradable_instrument_id[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.merged_tradable_instrument_id[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.linked_tradable_instrument_id[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.product_code[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.contract_type = outright_definition_message_value;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 3 -> outright_definition_message_record.trading_currency[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.contract_code[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.expiry_date[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.prompt_type = outright_definition_message_value;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.strike_price[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.option_type = outright_definition_message_value;
  outright_definition_message_record.exercise_style = outright_definition_message_value;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> outright_definition_message_record.prompt_date_label[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.price_code[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.isin[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> outright_definition_message_record.cfi_code[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.market_code[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.market_segment_code[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.tick_size_id[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.lot_size[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.lot_size_type = outright_definition_message_value;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.last_trading_date[outright_definition_message_at] = outright_definition_message_value; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.settlement_type = outright_definition_message_value;
  outright_definition_message_record.settlement_pricing_method = outright_definition_message_value;
  outright_definition_message_record.underlying_type = outright_definition_message_value;
  skip
}

/* each byte of Outright Definition Message set to where it lies, so a field read out of place says so */
inline ramp_outright_definition_message(outright_definition_message_record, outright_definition_message_base) {
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.trading_venue[outright_definition_message_at] = (outright_definition_message_base + 0 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.tradable_instrument_id[outright_definition_message_at] = (outright_definition_message_base + 2 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.merged_tradable_instrument_id[outright_definition_message_at] = (outright_definition_message_base + 10 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.linked_tradable_instrument_id[outright_definition_message_at] = (outright_definition_message_base + 18 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.product_code[outright_definition_message_at] = (outright_definition_message_base + 26 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.contract_type = (outright_definition_message_base + 28 + 1) % 256;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 3 -> outright_definition_message_record.trading_currency[outright_definition_message_at] = (outright_definition_message_base + 29 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.contract_code[outright_definition_message_at] = (outright_definition_message_base + 32 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.expiry_date[outright_definition_message_at] = (outright_definition_message_base + 44 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.prompt_type = (outright_definition_message_base + 48 + 1) % 256;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.strike_price[outright_definition_message_at] = (outright_definition_message_base + 49 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.option_type = (outright_definition_message_base + 57 + 1) % 256;
  outright_definition_message_record.exercise_style = (outright_definition_message_base + 58 + 1) % 256;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> outright_definition_message_record.prompt_date_label[outright_definition_message_at] = (outright_definition_message_base + 59 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.price_code[outright_definition_message_at] = (outright_definition_message_base + 65 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.isin[outright_definition_message_at] = (outright_definition_message_base + 67 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> outright_definition_message_record.cfi_code[outright_definition_message_at] = (outright_definition_message_base + 79 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.market_code[outright_definition_message_at] = (outright_definition_message_base + 85 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.market_segment_code[outright_definition_message_at] = (outright_definition_message_base + 89 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.tick_size_id[outright_definition_message_at] = (outright_definition_message_base + 101 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.lot_size[outright_definition_message_at] = (outright_definition_message_base + 105 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.lot_size_type = (outright_definition_message_base + 113 + 1) % 256;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.last_trading_date[outright_definition_message_at] = (outright_definition_message_base + 114 + outright_definition_message_at + 1) % 256; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.settlement_type = (outright_definition_message_base + 118 + 1) % 256;
  outright_definition_message_record.settlement_pricing_method = (outright_definition_message_base + 119 + 1) % 256;
  outright_definition_message_record.underlying_type = (outright_definition_message_base + 120 + 1) % 256;
  skip
}

/* Outright Definition Message to the wire, 121 bytes from where the cursor stands */
inline encode_outright_definition_message(outright_definition_message_record) {
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> wire[at] = outright_definition_message_record.trading_venue[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> wire[at] = outright_definition_message_record.tradable_instrument_id[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> wire[at] = outright_definition_message_record.merged_tradable_instrument_id[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> wire[at] = outright_definition_message_record.linked_tradable_instrument_id[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> wire[at] = outright_definition_message_record.product_code[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_definition_message_record.contract_type; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 3 -> wire[at] = outright_definition_message_record.trading_currency[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> wire[at] = outright_definition_message_record.contract_code[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> wire[at] = outright_definition_message_record.expiry_date[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_definition_message_record.prompt_type; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> wire[at] = outright_definition_message_record.strike_price[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_definition_message_record.option_type; at = at + 1;
  wire[at] = outright_definition_message_record.exercise_style; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> wire[at] = outright_definition_message_record.prompt_date_label[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> wire[at] = outright_definition_message_record.price_code[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> wire[at] = outright_definition_message_record.isin[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> wire[at] = outright_definition_message_record.cfi_code[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> wire[at] = outright_definition_message_record.market_code[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> wire[at] = outright_definition_message_record.market_segment_code[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> wire[at] = outright_definition_message_record.tick_size_id[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> wire[at] = outright_definition_message_record.lot_size[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_definition_message_record.lot_size_type; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> wire[at] = outright_definition_message_record.last_trading_date[outright_definition_message_at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = outright_definition_message_record.settlement_type; at = at + 1;
  wire[at] = outright_definition_message_record.settlement_pricing_method; at = at + 1;
  wire[at] = outright_definition_message_record.underlying_type; at = at + 1;
  skip
}

/* Outright Definition Message off the wire, 121 bytes from where the cursor stands */
inline decode_outright_definition_message(outright_definition_message_record) {
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.trading_venue[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.tradable_instrument_id[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.merged_tradable_instrument_id[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.linked_tradable_instrument_id[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.product_code[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.contract_type = wire[at]; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 3 -> outright_definition_message_record.trading_currency[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.contract_code[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.expiry_date[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.prompt_type = wire[at]; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.strike_price[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.option_type = wire[at]; at = at + 1;
  outright_definition_message_record.exercise_style = wire[at]; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> outright_definition_message_record.prompt_date_label[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> outright_definition_message_record.price_code[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.isin[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> outright_definition_message_record.cfi_code[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.market_code[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> outright_definition_message_record.market_segment_code[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.tick_size_id[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> outright_definition_message_record.lot_size[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.lot_size_type = wire[at]; at = at + 1;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> outright_definition_message_record.last_trading_date[outright_definition_message_at] = wire[at]; at = at + 1; outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_record.settlement_type = wire[at]; at = at + 1;
  outright_definition_message_record.settlement_pricing_method = wire[at]; at = at + 1;
  outright_definition_message_record.underlying_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Outright Definition Message is what was written, byte for byte */
inline equal_outright_definition_message(outright_definition_message_read, outright_definition_message_written) {
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> assert(outright_definition_message_read.trading_venue[outright_definition_message_at] == outright_definition_message_written.trading_venue[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> assert(outright_definition_message_read.tradable_instrument_id[outright_definition_message_at] == outright_definition_message_written.tradable_instrument_id[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> assert(outright_definition_message_read.merged_tradable_instrument_id[outright_definition_message_at] == outright_definition_message_written.merged_tradable_instrument_id[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> assert(outright_definition_message_read.linked_tradable_instrument_id[outright_definition_message_at] == outright_definition_message_written.linked_tradable_instrument_id[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> assert(outright_definition_message_read.product_code[outright_definition_message_at] == outright_definition_message_written.product_code[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  assert(outright_definition_message_read.contract_type == outright_definition_message_written.contract_type);
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 3 -> assert(outright_definition_message_read.trading_currency[outright_definition_message_at] == outright_definition_message_written.trading_currency[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> assert(outright_definition_message_read.contract_code[outright_definition_message_at] == outright_definition_message_written.contract_code[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> assert(outright_definition_message_read.expiry_date[outright_definition_message_at] == outright_definition_message_written.expiry_date[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  assert(outright_definition_message_read.prompt_type == outright_definition_message_written.prompt_type);
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> assert(outright_definition_message_read.strike_price[outright_definition_message_at] == outright_definition_message_written.strike_price[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  assert(outright_definition_message_read.option_type == outright_definition_message_written.option_type);
  assert(outright_definition_message_read.exercise_style == outright_definition_message_written.exercise_style);
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> assert(outright_definition_message_read.prompt_date_label[outright_definition_message_at] == outright_definition_message_written.prompt_date_label[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 2 -> assert(outright_definition_message_read.price_code[outright_definition_message_at] == outright_definition_message_written.price_code[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> assert(outright_definition_message_read.isin[outright_definition_message_at] == outright_definition_message_written.isin[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 6 -> assert(outright_definition_message_read.cfi_code[outright_definition_message_at] == outright_definition_message_written.cfi_code[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> assert(outright_definition_message_read.market_code[outright_definition_message_at] == outright_definition_message_written.market_code[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 12 -> assert(outright_definition_message_read.market_segment_code[outright_definition_message_at] == outright_definition_message_written.market_segment_code[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> assert(outright_definition_message_read.tick_size_id[outright_definition_message_at] == outright_definition_message_written.tick_size_id[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 8 -> assert(outright_definition_message_read.lot_size[outright_definition_message_at] == outright_definition_message_written.lot_size[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  assert(outright_definition_message_read.lot_size_type == outright_definition_message_written.lot_size_type);
  outright_definition_message_at = 0;
  do
  :: outright_definition_message_at < 4 -> assert(outright_definition_message_read.last_trading_date[outright_definition_message_at] == outright_definition_message_written.last_trading_date[outright_definition_message_at]); outright_definition_message_at = outright_definition_message_at + 1
  :: else -> break
  od;
  assert(outright_definition_message_read.settlement_type == outright_definition_message_written.settlement_type);
  assert(outright_definition_message_read.settlement_pricing_method == outright_definition_message_written.settlement_pricing_method);
  assert(outright_definition_message_read.underlying_type == outright_definition_message_written.underlying_type);
  skip
}

/* ---- Price Limits Message: 32 bytes ------------------------------------------ */

/* Describes the upper and lower price limits for an outright tradable instrument. Where Daily Price Limits are enabled for a contract they are published for electronic tradable instruments, and the same limits also apply to non-electronic tradable instruments. */
typedef PriceLimitsMessage {
  byte tradable_instrument_id[8];
  byte upper_price_limit[8];
  byte lower_price_limit[8];
  byte transaction_time[8]
};

int price_limits_message_at;

/* every byte of Price Limits Message set to one value */
inline fill_price_limits_message(price_limits_message_record, price_limits_message_value) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.tradable_instrument_id[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.transaction_time[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Limits Message set to where it lies, so a field read out of place says so */
inline ramp_price_limits_message(price_limits_message_record, price_limits_message_base) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.tradable_instrument_id[price_limits_message_at] = (price_limits_message_base + 0 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = (price_limits_message_base + 8 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = (price_limits_message_base + 16 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.transaction_time[price_limits_message_at] = (price_limits_message_base + 24 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message to the wire, 32 bytes from where the cursor stands */
inline encode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.tradable_instrument_id[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.upper_price_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.lower_price_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.transaction_time[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message off the wire, 32 bytes from where the cursor stands */
inline decode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.tradable_instrument_id[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.transaction_time[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Limits Message is what was written, byte for byte */
inline equal_price_limits_message(price_limits_message_read, price_limits_message_written) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.tradable_instrument_id[price_limits_message_at] == price_limits_message_written.tradable_instrument_id[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.upper_price_limit[price_limits_message_at] == price_limits_message_written.upper_price_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.lower_price_limit[price_limits_message_at] == price_limits_message_written.lower_price_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.transaction_time[price_limits_message_at] == price_limits_message_written.transaction_time[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Statistics End Of Day Message: 50 bytes --------------------------- */

/* Generated when the market moves to the Post-Trade session for instruments that have traded. LMEsource publishes the LMEselect Opening and Closing Prices, LMEselect Trading High and LMEselect Trading Low for all contracts that have traded during the day. Off book trades resulting from Cross Order execution are not used in the calculation. */
typedef TradeStatisticsEndOfDayMessage {
  byte trading_venue[2];
  byte time_of_event[8];
  byte tradable_instrument_id[8];
  byte open_price[8];
  byte trade_high[8];
  byte trade_low[8];
  byte closing_price[8]
};

int trade_statistics_end_of_day_message_at;

/* every byte of Trade Statistics End Of Day Message set to one value */
inline fill_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_record, trade_statistics_end_of_day_message_value) {
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 2 -> trade_statistics_end_of_day_message_record.trading_venue[trade_statistics_end_of_day_message_at] = trade_statistics_end_of_day_message_value; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.time_of_event[trade_statistics_end_of_day_message_at] = trade_statistics_end_of_day_message_value; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.tradable_instrument_id[trade_statistics_end_of_day_message_at] = trade_statistics_end_of_day_message_value; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.open_price[trade_statistics_end_of_day_message_at] = trade_statistics_end_of_day_message_value; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.trade_high[trade_statistics_end_of_day_message_at] = trade_statistics_end_of_day_message_value; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.trade_low[trade_statistics_end_of_day_message_at] = trade_statistics_end_of_day_message_value; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.closing_price[trade_statistics_end_of_day_message_at] = trade_statistics_end_of_day_message_value; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Statistics End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_record, trade_statistics_end_of_day_message_base) {
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 2 -> trade_statistics_end_of_day_message_record.trading_venue[trade_statistics_end_of_day_message_at] = (trade_statistics_end_of_day_message_base + 0 + trade_statistics_end_of_day_message_at + 1) % 256; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.time_of_event[trade_statistics_end_of_day_message_at] = (trade_statistics_end_of_day_message_base + 2 + trade_statistics_end_of_day_message_at + 1) % 256; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.tradable_instrument_id[trade_statistics_end_of_day_message_at] = (trade_statistics_end_of_day_message_base + 10 + trade_statistics_end_of_day_message_at + 1) % 256; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.open_price[trade_statistics_end_of_day_message_at] = (trade_statistics_end_of_day_message_base + 18 + trade_statistics_end_of_day_message_at + 1) % 256; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.trade_high[trade_statistics_end_of_day_message_at] = (trade_statistics_end_of_day_message_base + 26 + trade_statistics_end_of_day_message_at + 1) % 256; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.trade_low[trade_statistics_end_of_day_message_at] = (trade_statistics_end_of_day_message_base + 34 + trade_statistics_end_of_day_message_at + 1) % 256; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.closing_price[trade_statistics_end_of_day_message_at] = (trade_statistics_end_of_day_message_base + 42 + trade_statistics_end_of_day_message_at + 1) % 256; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Statistics End Of Day Message to the wire, 50 bytes from where the cursor stands */
inline encode_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_record) {
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 2 -> wire[at] = trade_statistics_end_of_day_message_record.trading_venue[trade_statistics_end_of_day_message_at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> wire[at] = trade_statistics_end_of_day_message_record.time_of_event[trade_statistics_end_of_day_message_at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> wire[at] = trade_statistics_end_of_day_message_record.tradable_instrument_id[trade_statistics_end_of_day_message_at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> wire[at] = trade_statistics_end_of_day_message_record.open_price[trade_statistics_end_of_day_message_at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> wire[at] = trade_statistics_end_of_day_message_record.trade_high[trade_statistics_end_of_day_message_at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> wire[at] = trade_statistics_end_of_day_message_record.trade_low[trade_statistics_end_of_day_message_at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> wire[at] = trade_statistics_end_of_day_message_record.closing_price[trade_statistics_end_of_day_message_at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Statistics End Of Day Message off the wire, 50 bytes from where the cursor stands */
inline decode_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_record) {
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 2 -> trade_statistics_end_of_day_message_record.trading_venue[trade_statistics_end_of_day_message_at] = wire[at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.time_of_event[trade_statistics_end_of_day_message_at] = wire[at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.tradable_instrument_id[trade_statistics_end_of_day_message_at] = wire[at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.open_price[trade_statistics_end_of_day_message_at] = wire[at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.trade_high[trade_statistics_end_of_day_message_at] = wire[at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.trade_low[trade_statistics_end_of_day_message_at] = wire[at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> trade_statistics_end_of_day_message_record.closing_price[trade_statistics_end_of_day_message_at] = wire[at]; at = at + 1; trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Statistics End Of Day Message is what was written, byte for byte */
inline equal_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_read, trade_statistics_end_of_day_message_written) {
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 2 -> assert(trade_statistics_end_of_day_message_read.trading_venue[trade_statistics_end_of_day_message_at] == trade_statistics_end_of_day_message_written.trading_venue[trade_statistics_end_of_day_message_at]); trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> assert(trade_statistics_end_of_day_message_read.time_of_event[trade_statistics_end_of_day_message_at] == trade_statistics_end_of_day_message_written.time_of_event[trade_statistics_end_of_day_message_at]); trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> assert(trade_statistics_end_of_day_message_read.tradable_instrument_id[trade_statistics_end_of_day_message_at] == trade_statistics_end_of_day_message_written.tradable_instrument_id[trade_statistics_end_of_day_message_at]); trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> assert(trade_statistics_end_of_day_message_read.open_price[trade_statistics_end_of_day_message_at] == trade_statistics_end_of_day_message_written.open_price[trade_statistics_end_of_day_message_at]); trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> assert(trade_statistics_end_of_day_message_read.trade_high[trade_statistics_end_of_day_message_at] == trade_statistics_end_of_day_message_written.trade_high[trade_statistics_end_of_day_message_at]); trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> assert(trade_statistics_end_of_day_message_read.trade_low[trade_statistics_end_of_day_message_at] == trade_statistics_end_of_day_message_written.trade_low[trade_statistics_end_of_day_message_at]); trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
  :: else -> break
  od;
  trade_statistics_end_of_day_message_at = 0;
  do
  :: trade_statistics_end_of_day_message_at < 8 -> assert(trade_statistics_end_of_day_message_read.closing_price[trade_statistics_end_of_day_message_at] == trade_statistics_end_of_day_message_written.closing_price[trade_statistics_end_of_day_message_at]); trade_statistics_end_of_day_message_at = trade_statistics_end_of_day_message_at + 1
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

/* Contract Definition Message: encoded, read back, and compared */
proctype check_contract_definition_message() {
  ContractDefinitionMessage contract_definition_message_sent;
  ContractDefinitionMessage contract_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_definition_message(contract_definition_message_sent, 0)
  :: pattern == 1 -> fill_contract_definition_message(contract_definition_message_sent, 32)
  :: pattern == 2 -> fill_contract_definition_message(contract_definition_message_sent, 255)
  :: else -> ramp_contract_definition_message(contract_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_definition_message(contract_definition_message_sent);
    assert(at == 134);
    at = 0;
    decode_contract_definition_message(contract_definition_message_got);
    assert(at == 134);
    equal_contract_definition_message(contract_definition_message_got, contract_definition_message_sent)
  }
}

/* Outright Definition Message: encoded, read back, and compared */
proctype check_outright_definition_message() {
  OutrightDefinitionMessage outright_definition_message_sent;
  OutrightDefinitionMessage outright_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outright_definition_message(outright_definition_message_sent, 0)
  :: pattern == 1 -> fill_outright_definition_message(outright_definition_message_sent, 32)
  :: pattern == 2 -> fill_outright_definition_message(outright_definition_message_sent, 255)
  :: else -> ramp_outright_definition_message(outright_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outright_definition_message(outright_definition_message_sent);
    assert(at == 121);
    at = 0;
    decode_outright_definition_message(outright_definition_message_got);
    assert(at == 121);
    equal_outright_definition_message(outright_definition_message_got, outright_definition_message_sent)
  }
}

/* Price Limits Message: encoded, read back, and compared */
proctype check_price_limits_message() {
  PriceLimitsMessage price_limits_message_sent;
  PriceLimitsMessage price_limits_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_limits_message(price_limits_message_sent, 0)
  :: pattern == 1 -> fill_price_limits_message(price_limits_message_sent, 32)
  :: pattern == 2 -> fill_price_limits_message(price_limits_message_sent, 255)
  :: else -> ramp_price_limits_message(price_limits_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_limits_message(price_limits_message_sent);
    assert(at == 32);
    at = 0;
    decode_price_limits_message(price_limits_message_got);
    assert(at == 32);
    equal_price_limits_message(price_limits_message_got, price_limits_message_sent)
  }
}

/* Trade Statistics End Of Day Message: encoded, read back, and compared */
proctype check_trade_statistics_end_of_day_message() {
  TradeStatisticsEndOfDayMessage trade_statistics_end_of_day_message_sent;
  TradeStatisticsEndOfDayMessage trade_statistics_end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_sent, 255)
  :: else -> ramp_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_sent);
    assert(at == 50);
    at = 0;
    decode_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_got);
    assert(at == 50);
    equal_trade_statistics_end_of_day_message(trade_statistics_end_of_day_message_got, trade_statistics_end_of_day_message_sent)
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
  :: run check_contract_definition_message()
  :: run check_outright_definition_message()
  :: run check_price_limits_message()
  :: run check_trade_statistics_end_of_day_message()
  :: run check_refresh_complete_message()
  fi
}
