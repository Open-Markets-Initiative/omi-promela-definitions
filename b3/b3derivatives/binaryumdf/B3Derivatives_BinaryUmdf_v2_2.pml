/*
 * Brasil, Bolsa, Balcão Binary Unified Market Data Feed
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
 *   - a field read in bits
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 64

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* B3 Mdp Packet Header */
typedef PacketHeader {
  byte channel_id;
  byte packet_reserved;
  byte sequence_version[2];
  byte sequence_number[4];
  byte sending_time[8]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_record.channel_id = packet_header_value;
  packet_header_record.packet_reserved = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.sequence_version[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_record.channel_id = (packet_header_base + 0 + 1) % 256;
  packet_header_record.packet_reserved = (packet_header_base + 1 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.sequence_version[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  wire[at] = packet_header_record.channel_id; at = at + 1;
  wire[at] = packet_header_record.packet_reserved; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.sequence_version[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sending_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_record.channel_id = wire[at]; at = at + 1;
  packet_header_record.packet_reserved = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.sequence_version[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sending_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  assert(packet_header_read.channel_id == packet_header_written.channel_id);
  assert(packet_header_read.packet_reserved == packet_header_written.packet_reserved);
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.sequence_version[packet_header_at] == packet_header_written.sequence_version[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sending_time[packet_header_at] == packet_header_written.sending_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Framing Header: 4 bytes ------------------------------------------------- */

/* B3 Sbe framing header */
typedef FramingHeader {
  byte message_length[2];
  byte encoding_type[2]
};

int framing_header_at;

/* every byte of Framing Header set to one value */
inline fill_framing_header(framing_header_record, framing_header_value) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.message_length[framing_header_at] = framing_header_value; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.encoding_type[framing_header_at] = framing_header_value; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Framing Header set to where it lies, so a field read out of place says so */
inline ramp_framing_header(framing_header_record, framing_header_base) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.message_length[framing_header_at] = (framing_header_base + 0 + framing_header_at + 1) % 256; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.encoding_type[framing_header_at] = (framing_header_base + 2 + framing_header_at + 1) % 256; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Framing Header to the wire, 4 bytes from where the cursor stands */
inline encode_framing_header(framing_header_record) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> wire[at] = framing_header_record.message_length[framing_header_at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> wire[at] = framing_header_record.encoding_type[framing_header_at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Framing Header off the wire, 4 bytes from where the cursor stands */
inline decode_framing_header(framing_header_record) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.message_length[framing_header_at] = wire[at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> framing_header_record.encoding_type[framing_header_at] = wire[at]; at = at + 1; framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Framing Header is what was written, byte for byte */
inline equal_framing_header(framing_header_read, framing_header_written) {
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> assert(framing_header_read.message_length[framing_header_at] == framing_header_written.message_length[framing_header_at]); framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  framing_header_at = 0;
  do
  :: framing_header_at < 2 -> assert(framing_header_read.encoding_type[framing_header_at] == framing_header_written.encoding_type[framing_header_at]); framing_header_at = framing_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* B3 Sbe message header — message identifiers and length of message root */
typedef MessageHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.block_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.schema_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.version[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.block_length[message_header_at] == message_header_written.block_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.schema_id[message_header_at] == message_header_written.schema_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.version[message_header_at] == message_header_written.version[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sequence Message: 4 bytes ----------------------------------------------- */

/* Sequence_2Message */
typedef SequenceMessage {
  byte next_seq_no[4]
};

int sequence_message_at;

/* every byte of Sequence Message set to one value */
inline fill_sequence_message(sequence_message_record, sequence_message_value) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> sequence_message_record.next_seq_no[sequence_message_at] = sequence_message_value; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_message(sequence_message_record, sequence_message_base) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> sequence_message_record.next_seq_no[sequence_message_at] = (sequence_message_base + 0 + sequence_message_at + 1) % 256; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_message(sequence_message_record) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> wire[at] = sequence_message_record.next_seq_no[sequence_message_at]; at = at + 1; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_message(sequence_message_record) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> sequence_message_record.next_seq_no[sequence_message_at] = wire[at]; at = at + 1; sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Message is what was written, byte for byte */
inline equal_sequence_message(sequence_message_read, sequence_message_written) {
  sequence_message_at = 0;
  do
  :: sequence_message_at < 4 -> assert(sequence_message_read.next_seq_no[sequence_message_at] == sequence_message_written.next_seq_no[sequence_message_at]); sequence_message_at = sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Maturity Month Year: 5 bytes -------------------------------------------- */

/* SecurityDefinition_12Message */
typedef MaturityMonthYear {
  byte year[2];
  byte month;
  byte day;
  byte week
};

int maturity_month_year_at;

/* every byte of Maturity Month Year set to one value */
inline fill_maturity_month_year(maturity_month_year_record, maturity_month_year_value) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = maturity_month_year_value; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = maturity_month_year_value;
  maturity_month_year_record.day = maturity_month_year_value;
  maturity_month_year_record.week = maturity_month_year_value;
  skip
}

/* each byte of Maturity Month Year set to where it lies, so a field read out of place says so */
inline ramp_maturity_month_year(maturity_month_year_record, maturity_month_year_base) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = (maturity_month_year_base + 0 + maturity_month_year_at + 1) % 256; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = (maturity_month_year_base + 2 + 1) % 256;
  maturity_month_year_record.day = (maturity_month_year_base + 3 + 1) % 256;
  maturity_month_year_record.week = (maturity_month_year_base + 4 + 1) % 256;
  skip
}

/* Maturity Month Year to the wire, 5 bytes from where the cursor stands */
inline encode_maturity_month_year(maturity_month_year_record) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> wire[at] = maturity_month_year_record.year[maturity_month_year_at]; at = at + 1; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  wire[at] = maturity_month_year_record.month; at = at + 1;
  wire[at] = maturity_month_year_record.day; at = at + 1;
  wire[at] = maturity_month_year_record.week; at = at + 1;
  skip
}

/* Maturity Month Year off the wire, 5 bytes from where the cursor stands */
inline decode_maturity_month_year(maturity_month_year_record) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> maturity_month_year_record.year[maturity_month_year_at] = wire[at]; at = at + 1; maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  maturity_month_year_record.month = wire[at]; at = at + 1;
  maturity_month_year_record.day = wire[at]; at = at + 1;
  maturity_month_year_record.week = wire[at]; at = at + 1;
  skip
}

/* what was read of Maturity Month Year is what was written, byte for byte */
inline equal_maturity_month_year(maturity_month_year_read, maturity_month_year_written) {
  maturity_month_year_at = 0;
  do
  :: maturity_month_year_at < 2 -> assert(maturity_month_year_read.year[maturity_month_year_at] == maturity_month_year_written.year[maturity_month_year_at]); maturity_month_year_at = maturity_month_year_at + 1
  :: else -> break
  od;
  assert(maturity_month_year_read.month == maturity_month_year_written.month);
  assert(maturity_month_year_read.day == maturity_month_year_written.day);
  assert(maturity_month_year_read.week == maturity_month_year_written.week);
  skip
}

/* ---- Contract Settl Month: 5 bytes ------------------------------------------- */

/* SecurityDefinition_12Message */
typedef ContractSettlMonth {
  byte year[2];
  byte month;
  byte day;
  byte week
};

int contract_settl_month_at;

/* every byte of Contract Settl Month set to one value */
inline fill_contract_settl_month(contract_settl_month_record, contract_settl_month_value) {
  contract_settl_month_at = 0;
  do
  :: contract_settl_month_at < 2 -> contract_settl_month_record.year[contract_settl_month_at] = contract_settl_month_value; contract_settl_month_at = contract_settl_month_at + 1
  :: else -> break
  od;
  contract_settl_month_record.month = contract_settl_month_value;
  contract_settl_month_record.day = contract_settl_month_value;
  contract_settl_month_record.week = contract_settl_month_value;
  skip
}

/* each byte of Contract Settl Month set to where it lies, so a field read out of place says so */
inline ramp_contract_settl_month(contract_settl_month_record, contract_settl_month_base) {
  contract_settl_month_at = 0;
  do
  :: contract_settl_month_at < 2 -> contract_settl_month_record.year[contract_settl_month_at] = (contract_settl_month_base + 0 + contract_settl_month_at + 1) % 256; contract_settl_month_at = contract_settl_month_at + 1
  :: else -> break
  od;
  contract_settl_month_record.month = (contract_settl_month_base + 2 + 1) % 256;
  contract_settl_month_record.day = (contract_settl_month_base + 3 + 1) % 256;
  contract_settl_month_record.week = (contract_settl_month_base + 4 + 1) % 256;
  skip
}

/* Contract Settl Month to the wire, 5 bytes from where the cursor stands */
inline encode_contract_settl_month(contract_settl_month_record) {
  contract_settl_month_at = 0;
  do
  :: contract_settl_month_at < 2 -> wire[at] = contract_settl_month_record.year[contract_settl_month_at]; at = at + 1; contract_settl_month_at = contract_settl_month_at + 1
  :: else -> break
  od;
  wire[at] = contract_settl_month_record.month; at = at + 1;
  wire[at] = contract_settl_month_record.day; at = at + 1;
  wire[at] = contract_settl_month_record.week; at = at + 1;
  skip
}

/* Contract Settl Month off the wire, 5 bytes from where the cursor stands */
inline decode_contract_settl_month(contract_settl_month_record) {
  contract_settl_month_at = 0;
  do
  :: contract_settl_month_at < 2 -> contract_settl_month_record.year[contract_settl_month_at] = wire[at]; at = at + 1; contract_settl_month_at = contract_settl_month_at + 1
  :: else -> break
  od;
  contract_settl_month_record.month = wire[at]; at = at + 1;
  contract_settl_month_record.day = wire[at]; at = at + 1;
  contract_settl_month_record.week = wire[at]; at = at + 1;
  skip
}

/* what was read of Contract Settl Month is what was written, byte for byte */
inline equal_contract_settl_month(contract_settl_month_read, contract_settl_month_written) {
  contract_settl_month_at = 0;
  do
  :: contract_settl_month_at < 2 -> assert(contract_settl_month_read.year[contract_settl_month_at] == contract_settl_month_written.year[contract_settl_month_at]); contract_settl_month_at = contract_settl_month_at + 1
  :: else -> break
  od;
  assert(contract_settl_month_read.month == contract_settl_month_written.month);
  assert(contract_settl_month_read.day == contract_settl_month_written.day);
  assert(contract_settl_month_read.week == contract_settl_month_written.week);
  skip
}

/* ---- Group Size Encoding: 3 bytes -------------------------------------------- */

/* GroupSizeEncoding */
typedef GroupSizeEncoding {
  byte block_length[2];
  byte num_in_group
};

int group_size_encoding_at;

/* every byte of Group Size Encoding set to one value */
inline fill_group_size_encoding(group_size_encoding_record, group_size_encoding_value) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_record.num_in_group = group_size_encoding_value;
  skip
}

/* each byte of Group Size Encoding set to where it lies, so a field read out of place says so */
inline ramp_group_size_encoding(group_size_encoding_record, group_size_encoding_base) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = (group_size_encoding_base + 0 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_record.num_in_group = (group_size_encoding_base + 2 + 1) % 256;
  skip
}

/* Group Size Encoding to the wire, 3 bytes from where the cursor stands */
inline encode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.block_length[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  wire[at] = group_size_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Group Size Encoding off the wire, 3 bytes from where the cursor stands */
inline decode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size Encoding is what was written, byte for byte */
inline equal_group_size_encoding(group_size_encoding_read, group_size_encoding_written) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.block_length[group_size_encoding_at] == group_size_encoding_written.block_length[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  assert(group_size_encoding_read.num_in_group == group_size_encoding_written.num_in_group);
  skip
}

/* ---- Snapshot Full Refresh Header 30 Message: 34 bytes ----------------------- */

/* SnapshotFullRefresh_Header_30Message */
typedef SnapshotFullRefreshHeader30Message {
  byte security_id[8];
  byte last_msg_seq_num_processed[4];
  byte tot_num_reports[4];
  byte tot_num_bids[4];
  byte tot_num_offers[4];
  byte tot_num_stats[2];
  byte offset_26_padding_2[2];
  byte last_rpt_seq[4];
  byte last_sequence_version[2]
};

int snapshot_full_refresh_header30_message_at;

/* every byte of Snapshot Full Refresh Header 30 Message set to one value */
inline fill_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_record, snapshot_full_refresh_header30_message_value) {
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 8 -> snapshot_full_refresh_header30_message_record.security_id[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.last_msg_seq_num_processed[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_reports[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_bids[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_offers[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.tot_num_stats[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.offset_26_padding_2[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.last_rpt_seq[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.last_sequence_version[snapshot_full_refresh_header30_message_at] = snapshot_full_refresh_header30_message_value; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Full Refresh Header 30 Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_record, snapshot_full_refresh_header30_message_base) {
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 8 -> snapshot_full_refresh_header30_message_record.security_id[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 0 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.last_msg_seq_num_processed[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 8 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_reports[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 12 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_bids[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 16 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_offers[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 20 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.tot_num_stats[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 24 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.offset_26_padding_2[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 26 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.last_rpt_seq[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 28 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.last_sequence_version[snapshot_full_refresh_header30_message_at] = (snapshot_full_refresh_header30_message_base + 32 + snapshot_full_refresh_header30_message_at + 1) % 256; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Full Refresh Header 30 Message to the wire, 34 bytes from where the cursor stands */
inline encode_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_record) {
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 8 -> wire[at] = snapshot_full_refresh_header30_message_record.security_id[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> wire[at] = snapshot_full_refresh_header30_message_record.last_msg_seq_num_processed[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> wire[at] = snapshot_full_refresh_header30_message_record.tot_num_reports[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> wire[at] = snapshot_full_refresh_header30_message_record.tot_num_bids[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> wire[at] = snapshot_full_refresh_header30_message_record.tot_num_offers[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> wire[at] = snapshot_full_refresh_header30_message_record.tot_num_stats[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> wire[at] = snapshot_full_refresh_header30_message_record.offset_26_padding_2[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> wire[at] = snapshot_full_refresh_header30_message_record.last_rpt_seq[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> wire[at] = snapshot_full_refresh_header30_message_record.last_sequence_version[snapshot_full_refresh_header30_message_at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Full Refresh Header 30 Message off the wire, 34 bytes from where the cursor stands */
inline decode_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_record) {
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 8 -> snapshot_full_refresh_header30_message_record.security_id[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.last_msg_seq_num_processed[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_reports[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_bids[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.tot_num_offers[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.tot_num_stats[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.offset_26_padding_2[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> snapshot_full_refresh_header30_message_record.last_rpt_seq[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> snapshot_full_refresh_header30_message_record.last_sequence_version[snapshot_full_refresh_header30_message_at] = wire[at]; at = at + 1; snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Full Refresh Header 30 Message is what was written, byte for byte */
inline equal_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_read, snapshot_full_refresh_header30_message_written) {
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 8 -> assert(snapshot_full_refresh_header30_message_read.security_id[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.security_id[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> assert(snapshot_full_refresh_header30_message_read.last_msg_seq_num_processed[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.last_msg_seq_num_processed[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> assert(snapshot_full_refresh_header30_message_read.tot_num_reports[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.tot_num_reports[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> assert(snapshot_full_refresh_header30_message_read.tot_num_bids[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.tot_num_bids[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> assert(snapshot_full_refresh_header30_message_read.tot_num_offers[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.tot_num_offers[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> assert(snapshot_full_refresh_header30_message_read.tot_num_stats[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.tot_num_stats[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> assert(snapshot_full_refresh_header30_message_read.offset_26_padding_2[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.offset_26_padding_2[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 4 -> assert(snapshot_full_refresh_header30_message_read.last_rpt_seq[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.last_rpt_seq[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  snapshot_full_refresh_header30_message_at = 0;
  do
  :: snapshot_full_refresh_header30_message_at < 2 -> assert(snapshot_full_refresh_header30_message_read.last_sequence_version[snapshot_full_refresh_header30_message_at] == snapshot_full_refresh_header30_message_written.last_sequence_version[snapshot_full_refresh_header30_message_at]); snapshot_full_refresh_header30_message_at = snapshot_full_refresh_header30_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Summary 55 Message: 64 bytes ---------------------------------- */

/* ExecutionSummary_55Message */
typedef ExecutionSummary55Message {
  byte security_id[8];
  byte offset_8_padding_2[2];
  byte aggressor_side;
  byte offset_11_padding_1;
  byte last_px[8];
  byte fill_qty[8];
  byte traded_hidden_qty[8];
  byte cxl_qty[8];
  byte aggressor_time[8];
  byte rpt_seq[4];
  byte transact_time[8]
};

int execution_summary55_message_at;

/* every byte of Execution Summary 55 Message set to one value */
inline fill_execution_summary55_message(execution_summary55_message_record, execution_summary55_message_value) {
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.security_id[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 2 -> execution_summary55_message_record.offset_8_padding_2[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_record.aggressor_side = execution_summary55_message_value;
  execution_summary55_message_record.offset_11_padding_1 = execution_summary55_message_value;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.last_px[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.fill_qty[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.traded_hidden_qty[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.cxl_qty[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.aggressor_time[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 4 -> execution_summary55_message_record.rpt_seq[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.transact_time[execution_summary55_message_at] = execution_summary55_message_value; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Summary 55 Message set to where it lies, so a field read out of place says so */
inline ramp_execution_summary55_message(execution_summary55_message_record, execution_summary55_message_base) {
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.security_id[execution_summary55_message_at] = (execution_summary55_message_base + 0 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 2 -> execution_summary55_message_record.offset_8_padding_2[execution_summary55_message_at] = (execution_summary55_message_base + 8 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_record.aggressor_side = (execution_summary55_message_base + 10 + 1) % 256;
  execution_summary55_message_record.offset_11_padding_1 = (execution_summary55_message_base + 11 + 1) % 256;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.last_px[execution_summary55_message_at] = (execution_summary55_message_base + 12 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.fill_qty[execution_summary55_message_at] = (execution_summary55_message_base + 20 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.traded_hidden_qty[execution_summary55_message_at] = (execution_summary55_message_base + 28 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.cxl_qty[execution_summary55_message_at] = (execution_summary55_message_base + 36 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.aggressor_time[execution_summary55_message_at] = (execution_summary55_message_base + 44 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 4 -> execution_summary55_message_record.rpt_seq[execution_summary55_message_at] = (execution_summary55_message_base + 52 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.transact_time[execution_summary55_message_at] = (execution_summary55_message_base + 56 + execution_summary55_message_at + 1) % 256; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary 55 Message to the wire, 64 bytes from where the cursor stands */
inline encode_execution_summary55_message(execution_summary55_message_record) {
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> wire[at] = execution_summary55_message_record.security_id[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 2 -> wire[at] = execution_summary55_message_record.offset_8_padding_2[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_summary55_message_record.aggressor_side; at = at + 1;
  wire[at] = execution_summary55_message_record.offset_11_padding_1; at = at + 1;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> wire[at] = execution_summary55_message_record.last_px[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> wire[at] = execution_summary55_message_record.fill_qty[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> wire[at] = execution_summary55_message_record.traded_hidden_qty[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> wire[at] = execution_summary55_message_record.cxl_qty[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> wire[at] = execution_summary55_message_record.aggressor_time[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 4 -> wire[at] = execution_summary55_message_record.rpt_seq[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> wire[at] = execution_summary55_message_record.transact_time[execution_summary55_message_at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Summary 55 Message off the wire, 64 bytes from where the cursor stands */
inline decode_execution_summary55_message(execution_summary55_message_record) {
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.security_id[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 2 -> execution_summary55_message_record.offset_8_padding_2[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_record.aggressor_side = wire[at]; at = at + 1;
  execution_summary55_message_record.offset_11_padding_1 = wire[at]; at = at + 1;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.last_px[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.fill_qty[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.traded_hidden_qty[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.cxl_qty[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.aggressor_time[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 4 -> execution_summary55_message_record.rpt_seq[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> execution_summary55_message_record.transact_time[execution_summary55_message_at] = wire[at]; at = at + 1; execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Summary 55 Message is what was written, byte for byte */
inline equal_execution_summary55_message(execution_summary55_message_read, execution_summary55_message_written) {
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> assert(execution_summary55_message_read.security_id[execution_summary55_message_at] == execution_summary55_message_written.security_id[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 2 -> assert(execution_summary55_message_read.offset_8_padding_2[execution_summary55_message_at] == execution_summary55_message_written.offset_8_padding_2[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  assert(execution_summary55_message_read.aggressor_side == execution_summary55_message_written.aggressor_side);
  assert(execution_summary55_message_read.offset_11_padding_1 == execution_summary55_message_written.offset_11_padding_1);
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> assert(execution_summary55_message_read.last_px[execution_summary55_message_at] == execution_summary55_message_written.last_px[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> assert(execution_summary55_message_read.fill_qty[execution_summary55_message_at] == execution_summary55_message_written.fill_qty[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> assert(execution_summary55_message_read.traded_hidden_qty[execution_summary55_message_at] == execution_summary55_message_written.traded_hidden_qty[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> assert(execution_summary55_message_read.cxl_qty[execution_summary55_message_at] == execution_summary55_message_written.cxl_qty[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> assert(execution_summary55_message_read.aggressor_time[execution_summary55_message_at] == execution_summary55_message_written.aggressor_time[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 4 -> assert(execution_summary55_message_read.rpt_seq[execution_summary55_message_at] == execution_summary55_message_written.rpt_seq[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
  :: else -> break
  od;
  execution_summary55_message_at = 0;
  do
  :: execution_summary55_message_at < 8 -> assert(execution_summary55_message_read.transact_time[execution_summary55_message_at] == execution_summary55_message_written.transact_time[execution_summary55_message_at]); execution_summary55_message_at = execution_summary55_message_at + 1
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

/* Framing Header: encoded, read back, and compared */
proctype check_framing_header() {
  FramingHeader framing_header_sent;
  FramingHeader framing_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_framing_header(framing_header_sent, 0)
  :: pattern == 1 -> fill_framing_header(framing_header_sent, 32)
  :: pattern == 2 -> fill_framing_header(framing_header_sent, 255)
  :: else -> ramp_framing_header(framing_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_framing_header(framing_header_sent);
    assert(at == 4);
    at = 0;
    decode_framing_header(framing_header_got);
    assert(at == 4);
    equal_framing_header(framing_header_got, framing_header_sent)
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Sequence Message: encoded, read back, and compared */
proctype check_sequence_message() {
  SequenceMessage sequence_message_sent;
  SequenceMessage sequence_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_message(sequence_message_sent, 0)
  :: pattern == 1 -> fill_sequence_message(sequence_message_sent, 32)
  :: pattern == 2 -> fill_sequence_message(sequence_message_sent, 255)
  :: else -> ramp_sequence_message(sequence_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_message(sequence_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_message(sequence_message_got);
    assert(at == 4);
    equal_sequence_message(sequence_message_got, sequence_message_sent)
  }
}

/* Maturity Month Year: encoded, read back, and compared */
proctype check_maturity_month_year() {
  MaturityMonthYear maturity_month_year_sent;
  MaturityMonthYear maturity_month_year_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_maturity_month_year(maturity_month_year_sent, 0)
  :: pattern == 1 -> fill_maturity_month_year(maturity_month_year_sent, 32)
  :: pattern == 2 -> fill_maturity_month_year(maturity_month_year_sent, 255)
  :: else -> ramp_maturity_month_year(maturity_month_year_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_maturity_month_year(maturity_month_year_sent);
    assert(at == 5);
    at = 0;
    decode_maturity_month_year(maturity_month_year_got);
    assert(at == 5);
    equal_maturity_month_year(maturity_month_year_got, maturity_month_year_sent)
  }
}

/* Contract Settl Month: encoded, read back, and compared */
proctype check_contract_settl_month() {
  ContractSettlMonth contract_settl_month_sent;
  ContractSettlMonth contract_settl_month_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_settl_month(contract_settl_month_sent, 0)
  :: pattern == 1 -> fill_contract_settl_month(contract_settl_month_sent, 32)
  :: pattern == 2 -> fill_contract_settl_month(contract_settl_month_sent, 255)
  :: else -> ramp_contract_settl_month(contract_settl_month_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_settl_month(contract_settl_month_sent);
    assert(at == 5);
    at = 0;
    decode_contract_settl_month(contract_settl_month_got);
    assert(at == 5);
    equal_contract_settl_month(contract_settl_month_got, contract_settl_month_sent)
  }
}

/* Group Size Encoding: encoded, read back, and compared */
proctype check_group_size_encoding() {
  GroupSizeEncoding group_size_encoding_sent;
  GroupSizeEncoding group_size_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size_encoding(group_size_encoding_sent, 0)
  :: pattern == 1 -> fill_group_size_encoding(group_size_encoding_sent, 32)
  :: pattern == 2 -> fill_group_size_encoding(group_size_encoding_sent, 255)
  :: else -> ramp_group_size_encoding(group_size_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size_encoding(group_size_encoding_sent);
    assert(at == 3);
    at = 0;
    decode_group_size_encoding(group_size_encoding_got);
    assert(at == 3);
    equal_group_size_encoding(group_size_encoding_got, group_size_encoding_sent)
  }
}

/* Snapshot Full Refresh Header 30 Message: encoded, read back, and compared */
proctype check_snapshot_full_refresh_header30_message() {
  SnapshotFullRefreshHeader30Message snapshot_full_refresh_header30_message_sent;
  SnapshotFullRefreshHeader30Message snapshot_full_refresh_header30_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_sent, 255)
  :: else -> ramp_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_sent);
    assert(at == 34);
    at = 0;
    decode_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_got);
    assert(at == 34);
    equal_snapshot_full_refresh_header30_message(snapshot_full_refresh_header30_message_got, snapshot_full_refresh_header30_message_sent)
  }
}

/* Execution Summary 55 Message: encoded, read back, and compared */
proctype check_execution_summary55_message() {
  ExecutionSummary55Message execution_summary55_message_sent;
  ExecutionSummary55Message execution_summary55_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_summary55_message(execution_summary55_message_sent, 0)
  :: pattern == 1 -> fill_execution_summary55_message(execution_summary55_message_sent, 32)
  :: pattern == 2 -> fill_execution_summary55_message(execution_summary55_message_sent, 255)
  :: else -> ramp_execution_summary55_message(execution_summary55_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_summary55_message(execution_summary55_message_sent);
    assert(at == 64);
    at = 0;
    decode_execution_summary55_message(execution_summary55_message_got);
    assert(at == 64);
    equal_execution_summary55_message(execution_summary55_message_got, execution_summary55_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_framing_header()
  :: run check_message_header()
  :: run check_sequence_message()
  :: run check_maturity_month_year()
  :: run check_contract_settl_month()
  :: run check_group_size_encoding()
  :: run check_snapshot_full_refresh_header30_message()
  :: run check_execution_summary55_message()
  fi
}
