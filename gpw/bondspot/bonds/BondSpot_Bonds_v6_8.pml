/*
 * Giełda Papierów Wartościowych w Warszawie BondSpot Bonds
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
 *   - a field filling what is left of what holds it
 *   - a run filling what frames it
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 44

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* All messages are preceded by a common packet header format, which section 1.1 states for every Market Information message */
typedef PacketHeader {
  byte packet_length[2];
  byte packet_type[2];
  byte packet_sequence_number[4];
  byte send_time[4];
  byte service_id[2];
  byte delivery_flag;
  byte number_msg_entries
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = packet_header_value;
  packet_header_record.number_msg_entries = packet_header_value;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = (packet_header_base + 12 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = (packet_header_base + 14 + 1) % 256;
  packet_header_record.number_msg_entries = (packet_header_base + 15 + 1) % 256;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.packet_type[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.packet_sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.send_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.service_id[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.delivery_flag; at = at + 1;
  wire[at] = packet_header_record.number_msg_entries; at = at + 1;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.packet_type[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.packet_sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.send_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.service_id[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.delivery_flag = wire[at]; at = at + 1;
  packet_header_record.number_msg_entries = wire[at]; at = at + 1;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_length[packet_header_at] == packet_header_written.packet_length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.packet_type[packet_header_at] == packet_header_written.packet_type[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.packet_sequence_number[packet_header_at] == packet_header_written.packet_sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.send_time[packet_header_at] == packet_header_written.send_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.service_id[packet_header_at] == packet_header_written.service_id[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.delivery_flag == packet_header_written.delivery_flag);
  assert(packet_header_read.number_msg_entries == packet_header_written.number_msg_entries);
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

/* ---- Interest For Settlement Day Message: 40 bytes --------------------------- */

/* This message informs about the interest for settlement day for bonds and mortgage-backed bonds */
typedef InterestForSettlementDayMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte system_id[4];
  byte date[4];
  byte settlement_date[8];
  byte interest[4];
  byte source_time_micro_secs[2];
  byte currency[3];
  byte interest_scale_code;
  byte reserved_2[2]
};

int interest_for_settlement_day_message_at;

/* every byte of Interest For Settlement Day Message set to one value */
inline fill_interest_for_settlement_day_message(interest_for_settlement_day_message_record, interest_for_settlement_day_message_value) {
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.symbol_index[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.source_time[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.source_seq_num[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.system_id[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.date[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 8 -> interest_for_settlement_day_message_record.settlement_date[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.interest[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> interest_for_settlement_day_message_record.source_time_micro_secs[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 3 -> interest_for_settlement_day_message_record.currency[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_record.interest_scale_code = interest_for_settlement_day_message_value;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> interest_for_settlement_day_message_record.reserved_2[interest_for_settlement_day_message_at] = interest_for_settlement_day_message_value; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Interest For Settlement Day Message set to where it lies, so a field read out of place says so */
inline ramp_interest_for_settlement_day_message(interest_for_settlement_day_message_record, interest_for_settlement_day_message_base) {
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.symbol_index[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 0 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.source_time[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 4 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.source_seq_num[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 8 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.system_id[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 12 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.date[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 16 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 8 -> interest_for_settlement_day_message_record.settlement_date[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 20 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.interest[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 28 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> interest_for_settlement_day_message_record.source_time_micro_secs[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 32 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 3 -> interest_for_settlement_day_message_record.currency[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 34 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_record.interest_scale_code = (interest_for_settlement_day_message_base + 37 + 1) % 256;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> interest_for_settlement_day_message_record.reserved_2[interest_for_settlement_day_message_at] = (interest_for_settlement_day_message_base + 38 + interest_for_settlement_day_message_at + 1) % 256; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Interest For Settlement Day Message to the wire, 40 bytes from where the cursor stands */
inline encode_interest_for_settlement_day_message(interest_for_settlement_day_message_record) {
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> wire[at] = interest_for_settlement_day_message_record.symbol_index[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> wire[at] = interest_for_settlement_day_message_record.source_time[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> wire[at] = interest_for_settlement_day_message_record.source_seq_num[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> wire[at] = interest_for_settlement_day_message_record.system_id[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> wire[at] = interest_for_settlement_day_message_record.date[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 8 -> wire[at] = interest_for_settlement_day_message_record.settlement_date[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> wire[at] = interest_for_settlement_day_message_record.interest[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> wire[at] = interest_for_settlement_day_message_record.source_time_micro_secs[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 3 -> wire[at] = interest_for_settlement_day_message_record.currency[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  wire[at] = interest_for_settlement_day_message_record.interest_scale_code; at = at + 1;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> wire[at] = interest_for_settlement_day_message_record.reserved_2[interest_for_settlement_day_message_at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Interest For Settlement Day Message off the wire, 40 bytes from where the cursor stands */
inline decode_interest_for_settlement_day_message(interest_for_settlement_day_message_record) {
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.symbol_index[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.source_time[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.source_seq_num[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.system_id[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.date[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 8 -> interest_for_settlement_day_message_record.settlement_date[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> interest_for_settlement_day_message_record.interest[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> interest_for_settlement_day_message_record.source_time_micro_secs[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 3 -> interest_for_settlement_day_message_record.currency[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_record.interest_scale_code = wire[at]; at = at + 1;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> interest_for_settlement_day_message_record.reserved_2[interest_for_settlement_day_message_at] = wire[at]; at = at + 1; interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Interest For Settlement Day Message is what was written, byte for byte */
inline equal_interest_for_settlement_day_message(interest_for_settlement_day_message_read, interest_for_settlement_day_message_written) {
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> assert(interest_for_settlement_day_message_read.symbol_index[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.symbol_index[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> assert(interest_for_settlement_day_message_read.source_time[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.source_time[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> assert(interest_for_settlement_day_message_read.source_seq_num[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.source_seq_num[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> assert(interest_for_settlement_day_message_read.system_id[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.system_id[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> assert(interest_for_settlement_day_message_read.date[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.date[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 8 -> assert(interest_for_settlement_day_message_read.settlement_date[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.settlement_date[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 4 -> assert(interest_for_settlement_day_message_read.interest[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.interest[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> assert(interest_for_settlement_day_message_read.source_time_micro_secs[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.source_time_micro_secs[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 3 -> assert(interest_for_settlement_day_message_read.currency[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.currency[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  assert(interest_for_settlement_day_message_read.interest_scale_code == interest_for_settlement_day_message_written.interest_scale_code);
  interest_for_settlement_day_message_at = 0;
  do
  :: interest_for_settlement_day_message_at < 2 -> assert(interest_for_settlement_day_message_read.reserved_2[interest_for_settlement_day_message_at] == interest_for_settlement_day_message_written.reserved_2[interest_for_settlement_day_message_at]); interest_for_settlement_day_message_at = interest_for_settlement_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Yield To Maturity Message: 44 bytes ------------------------------------- */

/* This message informs about the values of particular types of yield to maturity (YTM) */
typedef YieldToMaturityMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte system_id[4];
  byte date[4];
  byte price[4];
  byte source_time_micro_secs[2];
  byte ytm_scale_code;
  byte price_scale_code;
  byte ytm[4];
  byte message_indicator;
  byte algorithm_indicator;
  byte maturity_indicator;
  byte message_level;
  byte maturity_date[4];
  byte trade_id_number[4]
};

int yield_to_maturity_message_at;

/* every byte of Yield To Maturity Message set to one value */
inline fill_yield_to_maturity_message(yield_to_maturity_message_record, yield_to_maturity_message_value) {
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.symbol_index[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.source_time[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.source_seq_num[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.system_id[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.date[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.price[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 2 -> yield_to_maturity_message_record.source_time_micro_secs[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_record.ytm_scale_code = yield_to_maturity_message_value;
  yield_to_maturity_message_record.price_scale_code = yield_to_maturity_message_value;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.ytm[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_record.message_indicator = yield_to_maturity_message_value;
  yield_to_maturity_message_record.algorithm_indicator = yield_to_maturity_message_value;
  yield_to_maturity_message_record.maturity_indicator = yield_to_maturity_message_value;
  yield_to_maturity_message_record.message_level = yield_to_maturity_message_value;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.maturity_date[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.trade_id_number[yield_to_maturity_message_at] = yield_to_maturity_message_value; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Yield To Maturity Message set to where it lies, so a field read out of place says so */
inline ramp_yield_to_maturity_message(yield_to_maturity_message_record, yield_to_maturity_message_base) {
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.symbol_index[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 0 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.source_time[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 4 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.source_seq_num[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 8 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.system_id[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 12 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.date[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 16 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.price[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 20 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 2 -> yield_to_maturity_message_record.source_time_micro_secs[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 24 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_record.ytm_scale_code = (yield_to_maturity_message_base + 26 + 1) % 256;
  yield_to_maturity_message_record.price_scale_code = (yield_to_maturity_message_base + 27 + 1) % 256;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.ytm[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 28 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_record.message_indicator = (yield_to_maturity_message_base + 32 + 1) % 256;
  yield_to_maturity_message_record.algorithm_indicator = (yield_to_maturity_message_base + 33 + 1) % 256;
  yield_to_maturity_message_record.maturity_indicator = (yield_to_maturity_message_base + 34 + 1) % 256;
  yield_to_maturity_message_record.message_level = (yield_to_maturity_message_base + 35 + 1) % 256;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.maturity_date[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 36 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.trade_id_number[yield_to_maturity_message_at] = (yield_to_maturity_message_base + 40 + yield_to_maturity_message_at + 1) % 256; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Yield To Maturity Message to the wire, 44 bytes from where the cursor stands */
inline encode_yield_to_maturity_message(yield_to_maturity_message_record) {
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.symbol_index[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.source_time[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.source_seq_num[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.system_id[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.date[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.price[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 2 -> wire[at] = yield_to_maturity_message_record.source_time_micro_secs[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  wire[at] = yield_to_maturity_message_record.ytm_scale_code; at = at + 1;
  wire[at] = yield_to_maturity_message_record.price_scale_code; at = at + 1;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.ytm[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  wire[at] = yield_to_maturity_message_record.message_indicator; at = at + 1;
  wire[at] = yield_to_maturity_message_record.algorithm_indicator; at = at + 1;
  wire[at] = yield_to_maturity_message_record.maturity_indicator; at = at + 1;
  wire[at] = yield_to_maturity_message_record.message_level; at = at + 1;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.maturity_date[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> wire[at] = yield_to_maturity_message_record.trade_id_number[yield_to_maturity_message_at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Yield To Maturity Message off the wire, 44 bytes from where the cursor stands */
inline decode_yield_to_maturity_message(yield_to_maturity_message_record) {
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.symbol_index[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.source_time[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.source_seq_num[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.system_id[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.date[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.price[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 2 -> yield_to_maturity_message_record.source_time_micro_secs[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_record.ytm_scale_code = wire[at]; at = at + 1;
  yield_to_maturity_message_record.price_scale_code = wire[at]; at = at + 1;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.ytm[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_record.message_indicator = wire[at]; at = at + 1;
  yield_to_maturity_message_record.algorithm_indicator = wire[at]; at = at + 1;
  yield_to_maturity_message_record.maturity_indicator = wire[at]; at = at + 1;
  yield_to_maturity_message_record.message_level = wire[at]; at = at + 1;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.maturity_date[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> yield_to_maturity_message_record.trade_id_number[yield_to_maturity_message_at] = wire[at]; at = at + 1; yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Yield To Maturity Message is what was written, byte for byte */
inline equal_yield_to_maturity_message(yield_to_maturity_message_read, yield_to_maturity_message_written) {
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.symbol_index[yield_to_maturity_message_at] == yield_to_maturity_message_written.symbol_index[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.source_time[yield_to_maturity_message_at] == yield_to_maturity_message_written.source_time[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.source_seq_num[yield_to_maturity_message_at] == yield_to_maturity_message_written.source_seq_num[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.system_id[yield_to_maturity_message_at] == yield_to_maturity_message_written.system_id[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.date[yield_to_maturity_message_at] == yield_to_maturity_message_written.date[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.price[yield_to_maturity_message_at] == yield_to_maturity_message_written.price[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 2 -> assert(yield_to_maturity_message_read.source_time_micro_secs[yield_to_maturity_message_at] == yield_to_maturity_message_written.source_time_micro_secs[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  assert(yield_to_maturity_message_read.ytm_scale_code == yield_to_maturity_message_written.ytm_scale_code);
  assert(yield_to_maturity_message_read.price_scale_code == yield_to_maturity_message_written.price_scale_code);
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.ytm[yield_to_maturity_message_at] == yield_to_maturity_message_written.ytm[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  assert(yield_to_maturity_message_read.message_indicator == yield_to_maturity_message_written.message_indicator);
  assert(yield_to_maturity_message_read.algorithm_indicator == yield_to_maturity_message_written.algorithm_indicator);
  assert(yield_to_maturity_message_read.maturity_indicator == yield_to_maturity_message_written.maturity_indicator);
  assert(yield_to_maturity_message_read.message_level == yield_to_maturity_message_written.message_level);
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.maturity_date[yield_to_maturity_message_at] == yield_to_maturity_message_written.maturity_date[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
  :: else -> break
  od;
  yield_to_maturity_message_at = 0;
  do
  :: yield_to_maturity_message_at < 4 -> assert(yield_to_maturity_message_read.trade_id_number[yield_to_maturity_message_at] == yield_to_maturity_message_written.trade_id_number[yield_to_maturity_message_at]); yield_to_maturity_message_at = yield_to_maturity_message_at + 1
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

/* Interest For Settlement Day Message: encoded, read back, and compared */
proctype check_interest_for_settlement_day_message() {
  InterestForSettlementDayMessage interest_for_settlement_day_message_sent;
  InterestForSettlementDayMessage interest_for_settlement_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_interest_for_settlement_day_message(interest_for_settlement_day_message_sent, 0)
  :: pattern == 1 -> fill_interest_for_settlement_day_message(interest_for_settlement_day_message_sent, 32)
  :: pattern == 2 -> fill_interest_for_settlement_day_message(interest_for_settlement_day_message_sent, 255)
  :: else -> ramp_interest_for_settlement_day_message(interest_for_settlement_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_interest_for_settlement_day_message(interest_for_settlement_day_message_sent);
    assert(at == 40);
    at = 0;
    decode_interest_for_settlement_day_message(interest_for_settlement_day_message_got);
    assert(at == 40);
    equal_interest_for_settlement_day_message(interest_for_settlement_day_message_got, interest_for_settlement_day_message_sent)
  }
}

/* Yield To Maturity Message: encoded, read back, and compared */
proctype check_yield_to_maturity_message() {
  YieldToMaturityMessage yield_to_maturity_message_sent;
  YieldToMaturityMessage yield_to_maturity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_yield_to_maturity_message(yield_to_maturity_message_sent, 0)
  :: pattern == 1 -> fill_yield_to_maturity_message(yield_to_maturity_message_sent, 32)
  :: pattern == 2 -> fill_yield_to_maturity_message(yield_to_maturity_message_sent, 255)
  :: else -> ramp_yield_to_maturity_message(yield_to_maturity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_yield_to_maturity_message(yield_to_maturity_message_sent);
    assert(at == 44);
    at = 0;
    decode_yield_to_maturity_message(yield_to_maturity_message_got);
    assert(at == 44);
    equal_yield_to_maturity_message(yield_to_maturity_message_got, yield_to_maturity_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_interest_for_settlement_day_message()
  :: run check_yield_to_maturity_message()
  fi
}
