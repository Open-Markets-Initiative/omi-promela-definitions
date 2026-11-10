/*
 * Giełda Papierów Wartościowych w Warszawie BondSpot Market Information
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
#define WIRE 1098

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

/* ---- Class State Change Message: 24 bytes ------------------------------------ */

/* The Class State Change message indicates a change in the state of a class */
typedef ClassStateChangeMessage {
  byte source_seq_num[4];
  byte source_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte instrument_group_code[3];
  byte instrument_group_state;
  byte session_type;
  byte reserved_1;
  byte class_state[4]
};

int class_state_change_message_at;

/* every byte of Class State Change Message set to one value */
inline fill_class_state_change_message(class_state_change_message_record, class_state_change_message_value) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_seq_num[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_time[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.system_id[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> class_state_change_message_record.source_time_micro_secs[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> class_state_change_message_record.instrument_group_code[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_record.instrument_group_state = class_state_change_message_value;
  class_state_change_message_record.session_type = class_state_change_message_value;
  class_state_change_message_record.reserved_1 = class_state_change_message_value;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.class_state[class_state_change_message_at] = class_state_change_message_value; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Class State Change Message set to where it lies, so a field read out of place says so */
inline ramp_class_state_change_message(class_state_change_message_record, class_state_change_message_base) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_seq_num[class_state_change_message_at] = (class_state_change_message_base + 0 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_time[class_state_change_message_at] = (class_state_change_message_base + 4 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.system_id[class_state_change_message_at] = (class_state_change_message_base + 8 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> class_state_change_message_record.source_time_micro_secs[class_state_change_message_at] = (class_state_change_message_base + 12 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> class_state_change_message_record.instrument_group_code[class_state_change_message_at] = (class_state_change_message_base + 14 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_record.instrument_group_state = (class_state_change_message_base + 17 + 1) % 256;
  class_state_change_message_record.session_type = (class_state_change_message_base + 18 + 1) % 256;
  class_state_change_message_record.reserved_1 = (class_state_change_message_base + 19 + 1) % 256;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.class_state[class_state_change_message_at] = (class_state_change_message_base + 20 + class_state_change_message_at + 1) % 256; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Class State Change Message to the wire, 24 bytes from where the cursor stands */
inline encode_class_state_change_message(class_state_change_message_record) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.source_seq_num[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.source_time[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.system_id[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> wire[at] = class_state_change_message_record.source_time_micro_secs[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> wire[at] = class_state_change_message_record.instrument_group_code[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  wire[at] = class_state_change_message_record.instrument_group_state; at = at + 1;
  wire[at] = class_state_change_message_record.session_type; at = at + 1;
  wire[at] = class_state_change_message_record.reserved_1; at = at + 1;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> wire[at] = class_state_change_message_record.class_state[class_state_change_message_at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Class State Change Message off the wire, 24 bytes from where the cursor stands */
inline decode_class_state_change_message(class_state_change_message_record) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_seq_num[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.source_time[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.system_id[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> class_state_change_message_record.source_time_micro_secs[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> class_state_change_message_record.instrument_group_code[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_record.instrument_group_state = wire[at]; at = at + 1;
  class_state_change_message_record.session_type = wire[at]; at = at + 1;
  class_state_change_message_record.reserved_1 = wire[at]; at = at + 1;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> class_state_change_message_record.class_state[class_state_change_message_at] = wire[at]; at = at + 1; class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Class State Change Message is what was written, byte for byte */
inline equal_class_state_change_message(class_state_change_message_read, class_state_change_message_written) {
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.source_seq_num[class_state_change_message_at] == class_state_change_message_written.source_seq_num[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.source_time[class_state_change_message_at] == class_state_change_message_written.source_time[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.system_id[class_state_change_message_at] == class_state_change_message_written.system_id[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 2 -> assert(class_state_change_message_read.source_time_micro_secs[class_state_change_message_at] == class_state_change_message_written.source_time_micro_secs[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 3 -> assert(class_state_change_message_read.instrument_group_code[class_state_change_message_at] == class_state_change_message_written.instrument_group_code[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  assert(class_state_change_message_read.instrument_group_state == class_state_change_message_written.instrument_group_state);
  assert(class_state_change_message_read.session_type == class_state_change_message_written.session_type);
  assert(class_state_change_message_read.reserved_1 == class_state_change_message_written.reserved_1);
  class_state_change_message_at = 0;
  do
  :: class_state_change_message_at < 4 -> assert(class_state_change_message_read.class_state[class_state_change_message_at] == class_state_change_message_written.class_state[class_state_change_message_at]); class_state_change_message_at = class_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mail Message: 1098 bytes ------------------------------------------------ */

/* This message supplies a part or a complete electronic message (E-mail), in order to inform members and rebroadcasting members about quotation conditions on a given listed instrument or a set of listed instruments or otherwise about a technical problem */
typedef MailMessage {
  byte source_seq_num[4];
  byte source_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte scope;
  byte title[80];
  byte text[1000];
  byte reserved_3[3]
};

int mail_message_at;

/* every byte of Mail Message set to one value */
inline fill_mail_message(mail_message_record, mail_message_value) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_seq_num[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_time[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.system_id[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.source_time_micro_secs[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_record.scope = mail_message_value;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> mail_message_record.title[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 1000 -> mail_message_record.text[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> mail_message_record.reserved_3[mail_message_at] = mail_message_value; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mail Message set to where it lies, so a field read out of place says so */
inline ramp_mail_message(mail_message_record, mail_message_base) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_seq_num[mail_message_at] = (mail_message_base + 0 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_time[mail_message_at] = (mail_message_base + 4 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.system_id[mail_message_at] = (mail_message_base + 8 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.source_time_micro_secs[mail_message_at] = (mail_message_base + 12 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_record.scope = (mail_message_base + 14 + 1) % 256;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> mail_message_record.title[mail_message_at] = (mail_message_base + 15 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 1000 -> mail_message_record.text[mail_message_at] = (mail_message_base + 95 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> mail_message_record.reserved_3[mail_message_at] = (mail_message_base + 1095 + mail_message_at + 1) % 256; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mail Message to the wire, 1098 bytes from where the cursor stands */
inline encode_mail_message(mail_message_record) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> wire[at] = mail_message_record.source_seq_num[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> wire[at] = mail_message_record.source_time[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> wire[at] = mail_message_record.system_id[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> wire[at] = mail_message_record.source_time_micro_secs[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  wire[at] = mail_message_record.scope; at = at + 1;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> wire[at] = mail_message_record.title[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 1000 -> wire[at] = mail_message_record.text[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> wire[at] = mail_message_record.reserved_3[mail_message_at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mail Message off the wire, 1098 bytes from where the cursor stands */
inline decode_mail_message(mail_message_record) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_seq_num[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.source_time[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> mail_message_record.system_id[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> mail_message_record.source_time_micro_secs[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_record.scope = wire[at]; at = at + 1;
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> mail_message_record.title[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 1000 -> mail_message_record.text[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> mail_message_record.reserved_3[mail_message_at] = wire[at]; at = at + 1; mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mail Message is what was written, byte for byte */
inline equal_mail_message(mail_message_read, mail_message_written) {
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> assert(mail_message_read.source_seq_num[mail_message_at] == mail_message_written.source_seq_num[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> assert(mail_message_read.source_time[mail_message_at] == mail_message_written.source_time[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 4 -> assert(mail_message_read.system_id[mail_message_at] == mail_message_written.system_id[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 2 -> assert(mail_message_read.source_time_micro_secs[mail_message_at] == mail_message_written.source_time_micro_secs[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  assert(mail_message_read.scope == mail_message_written.scope);
  mail_message_at = 0;
  do
  :: mail_message_at < 80 -> assert(mail_message_read.title[mail_message_at] == mail_message_written.title[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 1000 -> assert(mail_message_read.text[mail_message_at] == mail_message_written.text[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  mail_message_at = 0;
  do
  :: mail_message_at < 3 -> assert(mail_message_read.reserved_3[mail_message_at] == mail_message_written.reserved_3[mail_message_at]); mail_message_at = mail_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Collars Message: 32 bytes ----------------------------------------------- */

/* A Collars message informs Clients of modifications in authorized price fluctuations for an instrument */
typedef CollarsMessage {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte high_collar[4];
  byte low_collar[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte high_scale_code;
  byte low_scale_code;
  byte collar_type;
  byte reserved_3[3]
};

int collars_message_at;

/* every byte of Collars Message set to one value */
inline fill_collars_message(collars_message_record, collars_message_value) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.symbol_index[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_seq_num[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_time[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.high_collar[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.low_collar[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.system_id[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> collars_message_record.source_time_micro_secs[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_record.high_scale_code = collars_message_value;
  collars_message_record.low_scale_code = collars_message_value;
  collars_message_record.collar_type = collars_message_value;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> collars_message_record.reserved_3[collars_message_at] = collars_message_value; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Collars Message set to where it lies, so a field read out of place says so */
inline ramp_collars_message(collars_message_record, collars_message_base) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.symbol_index[collars_message_at] = (collars_message_base + 0 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_seq_num[collars_message_at] = (collars_message_base + 4 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_time[collars_message_at] = (collars_message_base + 8 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.high_collar[collars_message_at] = (collars_message_base + 12 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.low_collar[collars_message_at] = (collars_message_base + 16 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.system_id[collars_message_at] = (collars_message_base + 20 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> collars_message_record.source_time_micro_secs[collars_message_at] = (collars_message_base + 24 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_record.high_scale_code = (collars_message_base + 26 + 1) % 256;
  collars_message_record.low_scale_code = (collars_message_base + 27 + 1) % 256;
  collars_message_record.collar_type = (collars_message_base + 28 + 1) % 256;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> collars_message_record.reserved_3[collars_message_at] = (collars_message_base + 29 + collars_message_at + 1) % 256; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collars Message to the wire, 32 bytes from where the cursor stands */
inline encode_collars_message(collars_message_record) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.symbol_index[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.source_seq_num[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.source_time[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.high_collar[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.low_collar[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> wire[at] = collars_message_record.system_id[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> wire[at] = collars_message_record.source_time_micro_secs[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  wire[at] = collars_message_record.high_scale_code; at = at + 1;
  wire[at] = collars_message_record.low_scale_code; at = at + 1;
  wire[at] = collars_message_record.collar_type; at = at + 1;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> wire[at] = collars_message_record.reserved_3[collars_message_at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* Collars Message off the wire, 32 bytes from where the cursor stands */
inline decode_collars_message(collars_message_record) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.symbol_index[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_seq_num[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.source_time[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.high_collar[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.low_collar[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> collars_message_record.system_id[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> collars_message_record.source_time_micro_secs[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_record.high_scale_code = wire[at]; at = at + 1;
  collars_message_record.low_scale_code = wire[at]; at = at + 1;
  collars_message_record.collar_type = wire[at]; at = at + 1;
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> collars_message_record.reserved_3[collars_message_at] = wire[at]; at = at + 1; collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Collars Message is what was written, byte for byte */
inline equal_collars_message(collars_message_read, collars_message_written) {
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.symbol_index[collars_message_at] == collars_message_written.symbol_index[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.source_seq_num[collars_message_at] == collars_message_written.source_seq_num[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.source_time[collars_message_at] == collars_message_written.source_time[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.high_collar[collars_message_at] == collars_message_written.high_collar[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.low_collar[collars_message_at] == collars_message_written.low_collar[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 4 -> assert(collars_message_read.system_id[collars_message_at] == collars_message_written.system_id[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  collars_message_at = 0;
  do
  :: collars_message_at < 2 -> assert(collars_message_read.source_time_micro_secs[collars_message_at] == collars_message_written.source_time_micro_secs[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  assert(collars_message_read.high_scale_code == collars_message_written.high_scale_code);
  assert(collars_message_read.low_scale_code == collars_message_written.low_scale_code);
  assert(collars_message_read.collar_type == collars_message_written.collar_type);
  collars_message_at = 0;
  do
  :: collars_message_at < 3 -> assert(collars_message_read.reserved_3[collars_message_at] == collars_message_written.reserved_3[collars_message_at]); collars_message_at = collars_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Referential Message: 4 bytes -------------------------------------- */

/* The Start referential message is sent to signal the start of transmission of the Instrument Reference Data Flow */
typedef StartReferentialMessage {
  byte indicator;
  byte reserved_3[3]
};

int start_referential_message_at;

/* every byte of Start Referential Message set to one value */
inline fill_start_referential_message(start_referential_message_record, start_referential_message_value) {
  start_referential_message_record.indicator = start_referential_message_value;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> start_referential_message_record.reserved_3[start_referential_message_at] = start_referential_message_value; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Referential Message set to where it lies, so a field read out of place says so */
inline ramp_start_referential_message(start_referential_message_record, start_referential_message_base) {
  start_referential_message_record.indicator = (start_referential_message_base + 0 + 1) % 256;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> start_referential_message_record.reserved_3[start_referential_message_at] = (start_referential_message_base + 1 + start_referential_message_at + 1) % 256; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Referential Message to the wire, 4 bytes from where the cursor stands */
inline encode_start_referential_message(start_referential_message_record) {
  wire[at] = start_referential_message_record.indicator; at = at + 1;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> wire[at] = start_referential_message_record.reserved_3[start_referential_message_at]; at = at + 1; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Referential Message off the wire, 4 bytes from where the cursor stands */
inline decode_start_referential_message(start_referential_message_record) {
  start_referential_message_record.indicator = wire[at]; at = at + 1;
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> start_referential_message_record.reserved_3[start_referential_message_at] = wire[at]; at = at + 1; start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Referential Message is what was written, byte for byte */
inline equal_start_referential_message(start_referential_message_read, start_referential_message_written) {
  assert(start_referential_message_read.indicator == start_referential_message_written.indicator);
  start_referential_message_at = 0;
  do
  :: start_referential_message_at < 3 -> assert(start_referential_message_read.reserved_3[start_referential_message_at] == start_referential_message_written.reserved_3[start_referential_message_at]); start_referential_message_at = start_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Referential Message: 4 bytes ---------------------------------------- */

/* The End referential message is sent to signal the end of transmission of the Instrument Reference Data Flow */
typedef EndReferentialMessage {
  byte indicator;
  byte reserved_3[3]
};

int end_referential_message_at;

/* every byte of End Referential Message set to one value */
inline fill_end_referential_message(end_referential_message_record, end_referential_message_value) {
  end_referential_message_record.indicator = end_referential_message_value;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> end_referential_message_record.reserved_3[end_referential_message_at] = end_referential_message_value; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Referential Message set to where it lies, so a field read out of place says so */
inline ramp_end_referential_message(end_referential_message_record, end_referential_message_base) {
  end_referential_message_record.indicator = (end_referential_message_base + 0 + 1) % 256;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> end_referential_message_record.reserved_3[end_referential_message_at] = (end_referential_message_base + 1 + end_referential_message_at + 1) % 256; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Referential Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_referential_message(end_referential_message_record) {
  wire[at] = end_referential_message_record.indicator; at = at + 1;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> wire[at] = end_referential_message_record.reserved_3[end_referential_message_at]; at = at + 1; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Referential Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_referential_message(end_referential_message_record) {
  end_referential_message_record.indicator = wire[at]; at = at + 1;
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> end_referential_message_record.reserved_3[end_referential_message_at] = wire[at]; at = at + 1; end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Referential Message is what was written, byte for byte */
inline equal_end_referential_message(end_referential_message_read, end_referential_message_written) {
  assert(end_referential_message_read.indicator == end_referential_message_written.indicator);
  end_referential_message_at = 0;
  do
  :: end_referential_message_at < 3 -> assert(end_referential_message_read.reserved_3[end_referential_message_at] == end_referential_message_written.reserved_3[end_referential_message_at]); end_referential_message_at = end_referential_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Session Summary Message: 260 bytes -------------------------------------- */

/* This message contains statistical data */
typedef SessionSummaryMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte date[4];
  byte multiplier[4];
  byte accumulated_interest[4];
  byte opening_price[4];
  byte maximum_price[4];
  byte minimum_price[4];
  byte closing_price[4];
  byte implied_volatility[4];
  byte average_weighted_price[4];
  byte reference_price[4];
  byte pct_change_price[4];
  byte dividend_rate[4];
  byte settlement_price[4];
  byte settlement_value[4];
  byte reserved_4[4];
  byte open_positions[4];
  byte trading_volume[4];
  byte transactions_number[4];
  byte trading_value[8];
  byte currency_price[4];
  byte delta[4];
  byte gamma[4];
  byte rho[4];
  byte theta[4];
  byte vega[4];
  byte end_trading[4];
  byte number_of_instruments[4];
  byte trading_value_currency[8];
  byte interest_rate[4];
  byte volatility[4];
  byte strike_price[4];
  byte short_selling_trades_number[4];
  byte volume_short_selling_trades[4];
  byte value_short_selling_trades[4];
  byte last_trade_date[4];
  byte last_trade_price[4];
  byte block_trades_number[4];
  byte volume_block_trades[4];
  byte value_block_trades[4];
  byte vwap_blocktrade[4];
  byte maximum_block_price[4];
  byte minimum_block_price[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte multiplier_scale_code;
  byte accumulated_interest_scale_code;
  byte opening_price_scale_code;
  byte maximum_price_scale_code;
  byte minimum_price_scale_code;
  byte closing_price_scale_code;
  byte implied_volatility_scale_code;
  byte average_weighted_price_scale_code;
  byte reference_price_scale_code;
  byte pct_change_price_scale_code;
  byte dividend_rate_scale_code;
  byte settlement_price_scale_code;
  byte settlement_value_scale_code;
  byte reserved_1;
  byte trading_value_scale_code;
  byte currency_price_scale_code;
  byte delta_scale_code;
  byte gamma_scale_code;
  byte rho_scale_code;
  byte theta_scale_code;
  byte vega_scale_code;
  byte trading_value_currency_scale_code;
  byte interest_rate_scale_code;
  byte volatility_scale_code;
  byte strike_price_scale_code;
  byte value_short_selling_trades_scale_code;
  byte last_trade_price_scale_code;
  byte value_block_trades_scale_code;
  byte vwap_blocktrade_scale_code;
  byte maximum_block_price_scale_code;
  byte minimum_block_price_scale_code;
  byte status_indicator;
  byte sector[3];
  byte market;
  byte second_reserved_1;
  byte short_sale;
  byte marker_pct_change_price;
  byte symbol_delta;
  byte symbol_gamma;
  byte symbol_rho;
  byte symbol_theta;
  byte symbol_vega;
  byte third_reserved_1;
  byte fourth_reserved_1;
  byte fifth_reserved_1;
  byte sixth_reserved_1;
  byte seventh_reserved_1;
  byte eighth_reserved_1;
  byte segment[2];
  byte lower_liquidity;
  byte dividend[2];
  byte subscription_right[2];
  byte split[2];
  byte interim_dividend_right[2];
  byte quotation_system[2];
  byte liquidity_support_pge[2];
  byte ninth_reserved_1
};

int session_summary_message_at;

/* every byte of Session Summary Message set to one value */
inline fill_session_summary_message(session_summary_message_record, session_summary_message_value) {
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.symbol_index[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.source_time[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.source_seq_num[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.date[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.multiplier[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.accumulated_interest[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.opening_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.maximum_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.minimum_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.closing_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.implied_volatility[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.average_weighted_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.reference_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.pct_change_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.dividend_rate[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.settlement_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.settlement_value[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.reserved_4[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.open_positions[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.trading_volume[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.transactions_number[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> session_summary_message_record.trading_value[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.currency_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.delta[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.gamma[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.rho[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.theta[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.vega[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.end_trading[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.number_of_instruments[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> session_summary_message_record.trading_value_currency[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.interest_rate[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volatility[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.strike_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.short_selling_trades_number[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volume_short_selling_trades[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.value_short_selling_trades[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.last_trade_date[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.last_trade_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.block_trades_number[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volume_block_trades[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.value_block_trades[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.vwap_blocktrade[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.maximum_block_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.minimum_block_price[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.system_id[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.source_time_micro_secs[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.multiplier_scale_code = session_summary_message_value;
  session_summary_message_record.accumulated_interest_scale_code = session_summary_message_value;
  session_summary_message_record.opening_price_scale_code = session_summary_message_value;
  session_summary_message_record.maximum_price_scale_code = session_summary_message_value;
  session_summary_message_record.minimum_price_scale_code = session_summary_message_value;
  session_summary_message_record.closing_price_scale_code = session_summary_message_value;
  session_summary_message_record.implied_volatility_scale_code = session_summary_message_value;
  session_summary_message_record.average_weighted_price_scale_code = session_summary_message_value;
  session_summary_message_record.reference_price_scale_code = session_summary_message_value;
  session_summary_message_record.pct_change_price_scale_code = session_summary_message_value;
  session_summary_message_record.dividend_rate_scale_code = session_summary_message_value;
  session_summary_message_record.settlement_price_scale_code = session_summary_message_value;
  session_summary_message_record.settlement_value_scale_code = session_summary_message_value;
  session_summary_message_record.reserved_1 = session_summary_message_value;
  session_summary_message_record.trading_value_scale_code = session_summary_message_value;
  session_summary_message_record.currency_price_scale_code = session_summary_message_value;
  session_summary_message_record.delta_scale_code = session_summary_message_value;
  session_summary_message_record.gamma_scale_code = session_summary_message_value;
  session_summary_message_record.rho_scale_code = session_summary_message_value;
  session_summary_message_record.theta_scale_code = session_summary_message_value;
  session_summary_message_record.vega_scale_code = session_summary_message_value;
  session_summary_message_record.trading_value_currency_scale_code = session_summary_message_value;
  session_summary_message_record.interest_rate_scale_code = session_summary_message_value;
  session_summary_message_record.volatility_scale_code = session_summary_message_value;
  session_summary_message_record.strike_price_scale_code = session_summary_message_value;
  session_summary_message_record.value_short_selling_trades_scale_code = session_summary_message_value;
  session_summary_message_record.last_trade_price_scale_code = session_summary_message_value;
  session_summary_message_record.value_block_trades_scale_code = session_summary_message_value;
  session_summary_message_record.vwap_blocktrade_scale_code = session_summary_message_value;
  session_summary_message_record.maximum_block_price_scale_code = session_summary_message_value;
  session_summary_message_record.minimum_block_price_scale_code = session_summary_message_value;
  session_summary_message_record.status_indicator = session_summary_message_value;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 3 -> session_summary_message_record.sector[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.market = session_summary_message_value;
  session_summary_message_record.second_reserved_1 = session_summary_message_value;
  session_summary_message_record.short_sale = session_summary_message_value;
  session_summary_message_record.marker_pct_change_price = session_summary_message_value;
  session_summary_message_record.symbol_delta = session_summary_message_value;
  session_summary_message_record.symbol_gamma = session_summary_message_value;
  session_summary_message_record.symbol_rho = session_summary_message_value;
  session_summary_message_record.symbol_theta = session_summary_message_value;
  session_summary_message_record.symbol_vega = session_summary_message_value;
  session_summary_message_record.third_reserved_1 = session_summary_message_value;
  session_summary_message_record.fourth_reserved_1 = session_summary_message_value;
  session_summary_message_record.fifth_reserved_1 = session_summary_message_value;
  session_summary_message_record.sixth_reserved_1 = session_summary_message_value;
  session_summary_message_record.seventh_reserved_1 = session_summary_message_value;
  session_summary_message_record.eighth_reserved_1 = session_summary_message_value;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.segment[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.lower_liquidity = session_summary_message_value;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.dividend[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.subscription_right[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.split[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.interim_dividend_right[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.quotation_system[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.liquidity_support_pge[session_summary_message_at] = session_summary_message_value; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.ninth_reserved_1 = session_summary_message_value;
  skip
}

/* each byte of Session Summary Message set to where it lies, so a field read out of place says so */
inline ramp_session_summary_message(session_summary_message_record, session_summary_message_base) {
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.symbol_index[session_summary_message_at] = (session_summary_message_base + 0 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.source_time[session_summary_message_at] = (session_summary_message_base + 4 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.source_seq_num[session_summary_message_at] = (session_summary_message_base + 8 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.date[session_summary_message_at] = (session_summary_message_base + 12 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.multiplier[session_summary_message_at] = (session_summary_message_base + 16 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.accumulated_interest[session_summary_message_at] = (session_summary_message_base + 20 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.opening_price[session_summary_message_at] = (session_summary_message_base + 24 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.maximum_price[session_summary_message_at] = (session_summary_message_base + 28 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.minimum_price[session_summary_message_at] = (session_summary_message_base + 32 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.closing_price[session_summary_message_at] = (session_summary_message_base + 36 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.implied_volatility[session_summary_message_at] = (session_summary_message_base + 40 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.average_weighted_price[session_summary_message_at] = (session_summary_message_base + 44 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.reference_price[session_summary_message_at] = (session_summary_message_base + 48 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.pct_change_price[session_summary_message_at] = (session_summary_message_base + 52 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.dividend_rate[session_summary_message_at] = (session_summary_message_base + 56 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.settlement_price[session_summary_message_at] = (session_summary_message_base + 60 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.settlement_value[session_summary_message_at] = (session_summary_message_base + 64 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.reserved_4[session_summary_message_at] = (session_summary_message_base + 68 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.open_positions[session_summary_message_at] = (session_summary_message_base + 72 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.trading_volume[session_summary_message_at] = (session_summary_message_base + 76 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.transactions_number[session_summary_message_at] = (session_summary_message_base + 80 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> session_summary_message_record.trading_value[session_summary_message_at] = (session_summary_message_base + 84 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.currency_price[session_summary_message_at] = (session_summary_message_base + 92 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.delta[session_summary_message_at] = (session_summary_message_base + 96 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.gamma[session_summary_message_at] = (session_summary_message_base + 100 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.rho[session_summary_message_at] = (session_summary_message_base + 104 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.theta[session_summary_message_at] = (session_summary_message_base + 108 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.vega[session_summary_message_at] = (session_summary_message_base + 112 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.end_trading[session_summary_message_at] = (session_summary_message_base + 116 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.number_of_instruments[session_summary_message_at] = (session_summary_message_base + 120 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> session_summary_message_record.trading_value_currency[session_summary_message_at] = (session_summary_message_base + 124 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.interest_rate[session_summary_message_at] = (session_summary_message_base + 132 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volatility[session_summary_message_at] = (session_summary_message_base + 136 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.strike_price[session_summary_message_at] = (session_summary_message_base + 140 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.short_selling_trades_number[session_summary_message_at] = (session_summary_message_base + 144 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volume_short_selling_trades[session_summary_message_at] = (session_summary_message_base + 148 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.value_short_selling_trades[session_summary_message_at] = (session_summary_message_base + 152 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.last_trade_date[session_summary_message_at] = (session_summary_message_base + 156 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.last_trade_price[session_summary_message_at] = (session_summary_message_base + 160 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.block_trades_number[session_summary_message_at] = (session_summary_message_base + 164 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volume_block_trades[session_summary_message_at] = (session_summary_message_base + 168 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.value_block_trades[session_summary_message_at] = (session_summary_message_base + 172 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.vwap_blocktrade[session_summary_message_at] = (session_summary_message_base + 176 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.maximum_block_price[session_summary_message_at] = (session_summary_message_base + 180 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.minimum_block_price[session_summary_message_at] = (session_summary_message_base + 184 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.system_id[session_summary_message_at] = (session_summary_message_base + 188 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.source_time_micro_secs[session_summary_message_at] = (session_summary_message_base + 192 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.multiplier_scale_code = (session_summary_message_base + 194 + 1) % 256;
  session_summary_message_record.accumulated_interest_scale_code = (session_summary_message_base + 195 + 1) % 256;
  session_summary_message_record.opening_price_scale_code = (session_summary_message_base + 196 + 1) % 256;
  session_summary_message_record.maximum_price_scale_code = (session_summary_message_base + 197 + 1) % 256;
  session_summary_message_record.minimum_price_scale_code = (session_summary_message_base + 198 + 1) % 256;
  session_summary_message_record.closing_price_scale_code = (session_summary_message_base + 199 + 1) % 256;
  session_summary_message_record.implied_volatility_scale_code = (session_summary_message_base + 200 + 1) % 256;
  session_summary_message_record.average_weighted_price_scale_code = (session_summary_message_base + 201 + 1) % 256;
  session_summary_message_record.reference_price_scale_code = (session_summary_message_base + 202 + 1) % 256;
  session_summary_message_record.pct_change_price_scale_code = (session_summary_message_base + 203 + 1) % 256;
  session_summary_message_record.dividend_rate_scale_code = (session_summary_message_base + 204 + 1) % 256;
  session_summary_message_record.settlement_price_scale_code = (session_summary_message_base + 205 + 1) % 256;
  session_summary_message_record.settlement_value_scale_code = (session_summary_message_base + 206 + 1) % 256;
  session_summary_message_record.reserved_1 = (session_summary_message_base + 207 + 1) % 256;
  session_summary_message_record.trading_value_scale_code = (session_summary_message_base + 208 + 1) % 256;
  session_summary_message_record.currency_price_scale_code = (session_summary_message_base + 209 + 1) % 256;
  session_summary_message_record.delta_scale_code = (session_summary_message_base + 210 + 1) % 256;
  session_summary_message_record.gamma_scale_code = (session_summary_message_base + 211 + 1) % 256;
  session_summary_message_record.rho_scale_code = (session_summary_message_base + 212 + 1) % 256;
  session_summary_message_record.theta_scale_code = (session_summary_message_base + 213 + 1) % 256;
  session_summary_message_record.vega_scale_code = (session_summary_message_base + 214 + 1) % 256;
  session_summary_message_record.trading_value_currency_scale_code = (session_summary_message_base + 215 + 1) % 256;
  session_summary_message_record.interest_rate_scale_code = (session_summary_message_base + 216 + 1) % 256;
  session_summary_message_record.volatility_scale_code = (session_summary_message_base + 217 + 1) % 256;
  session_summary_message_record.strike_price_scale_code = (session_summary_message_base + 218 + 1) % 256;
  session_summary_message_record.value_short_selling_trades_scale_code = (session_summary_message_base + 219 + 1) % 256;
  session_summary_message_record.last_trade_price_scale_code = (session_summary_message_base + 220 + 1) % 256;
  session_summary_message_record.value_block_trades_scale_code = (session_summary_message_base + 221 + 1) % 256;
  session_summary_message_record.vwap_blocktrade_scale_code = (session_summary_message_base + 222 + 1) % 256;
  session_summary_message_record.maximum_block_price_scale_code = (session_summary_message_base + 223 + 1) % 256;
  session_summary_message_record.minimum_block_price_scale_code = (session_summary_message_base + 224 + 1) % 256;
  session_summary_message_record.status_indicator = (session_summary_message_base + 225 + 1) % 256;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 3 -> session_summary_message_record.sector[session_summary_message_at] = (session_summary_message_base + 226 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.market = (session_summary_message_base + 229 + 1) % 256;
  session_summary_message_record.second_reserved_1 = (session_summary_message_base + 230 + 1) % 256;
  session_summary_message_record.short_sale = (session_summary_message_base + 231 + 1) % 256;
  session_summary_message_record.marker_pct_change_price = (session_summary_message_base + 232 + 1) % 256;
  session_summary_message_record.symbol_delta = (session_summary_message_base + 233 + 1) % 256;
  session_summary_message_record.symbol_gamma = (session_summary_message_base + 234 + 1) % 256;
  session_summary_message_record.symbol_rho = (session_summary_message_base + 235 + 1) % 256;
  session_summary_message_record.symbol_theta = (session_summary_message_base + 236 + 1) % 256;
  session_summary_message_record.symbol_vega = (session_summary_message_base + 237 + 1) % 256;
  session_summary_message_record.third_reserved_1 = (session_summary_message_base + 238 + 1) % 256;
  session_summary_message_record.fourth_reserved_1 = (session_summary_message_base + 239 + 1) % 256;
  session_summary_message_record.fifth_reserved_1 = (session_summary_message_base + 240 + 1) % 256;
  session_summary_message_record.sixth_reserved_1 = (session_summary_message_base + 241 + 1) % 256;
  session_summary_message_record.seventh_reserved_1 = (session_summary_message_base + 242 + 1) % 256;
  session_summary_message_record.eighth_reserved_1 = (session_summary_message_base + 243 + 1) % 256;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.segment[session_summary_message_at] = (session_summary_message_base + 244 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.lower_liquidity = (session_summary_message_base + 246 + 1) % 256;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.dividend[session_summary_message_at] = (session_summary_message_base + 247 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.subscription_right[session_summary_message_at] = (session_summary_message_base + 249 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.split[session_summary_message_at] = (session_summary_message_base + 251 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.interim_dividend_right[session_summary_message_at] = (session_summary_message_base + 253 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.quotation_system[session_summary_message_at] = (session_summary_message_base + 255 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.liquidity_support_pge[session_summary_message_at] = (session_summary_message_base + 257 + session_summary_message_at + 1) % 256; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.ninth_reserved_1 = (session_summary_message_base + 259 + 1) % 256;
  skip
}

/* Session Summary Message to the wire, 260 bytes from where the cursor stands */
inline encode_session_summary_message(session_summary_message_record) {
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.symbol_index[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.source_time[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.source_seq_num[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.date[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.multiplier[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.accumulated_interest[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.opening_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.maximum_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.minimum_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.closing_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.implied_volatility[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.average_weighted_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.reference_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.pct_change_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.dividend_rate[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.settlement_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.settlement_value[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.reserved_4[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.open_positions[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.trading_volume[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.transactions_number[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> wire[at] = session_summary_message_record.trading_value[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.currency_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.delta[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.gamma[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.rho[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.theta[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.vega[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.end_trading[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.number_of_instruments[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> wire[at] = session_summary_message_record.trading_value_currency[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.interest_rate[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.volatility[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.strike_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.short_selling_trades_number[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.volume_short_selling_trades[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.value_short_selling_trades[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.last_trade_date[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.last_trade_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.block_trades_number[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.volume_block_trades[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.value_block_trades[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.vwap_blocktrade[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.maximum_block_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.minimum_block_price[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> wire[at] = session_summary_message_record.system_id[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.source_time_micro_secs[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = session_summary_message_record.multiplier_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.accumulated_interest_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.opening_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.maximum_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.minimum_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.closing_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.implied_volatility_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.average_weighted_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.reference_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.pct_change_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.dividend_rate_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.settlement_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.settlement_value_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.reserved_1; at = at + 1;
  wire[at] = session_summary_message_record.trading_value_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.currency_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.delta_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.gamma_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.rho_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.theta_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.vega_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.trading_value_currency_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.interest_rate_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.volatility_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.strike_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.value_short_selling_trades_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.last_trade_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.value_block_trades_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.vwap_blocktrade_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.maximum_block_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.minimum_block_price_scale_code; at = at + 1;
  wire[at] = session_summary_message_record.status_indicator; at = at + 1;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 3 -> wire[at] = session_summary_message_record.sector[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = session_summary_message_record.market; at = at + 1;
  wire[at] = session_summary_message_record.second_reserved_1; at = at + 1;
  wire[at] = session_summary_message_record.short_sale; at = at + 1;
  wire[at] = session_summary_message_record.marker_pct_change_price; at = at + 1;
  wire[at] = session_summary_message_record.symbol_delta; at = at + 1;
  wire[at] = session_summary_message_record.symbol_gamma; at = at + 1;
  wire[at] = session_summary_message_record.symbol_rho; at = at + 1;
  wire[at] = session_summary_message_record.symbol_theta; at = at + 1;
  wire[at] = session_summary_message_record.symbol_vega; at = at + 1;
  wire[at] = session_summary_message_record.third_reserved_1; at = at + 1;
  wire[at] = session_summary_message_record.fourth_reserved_1; at = at + 1;
  wire[at] = session_summary_message_record.fifth_reserved_1; at = at + 1;
  wire[at] = session_summary_message_record.sixth_reserved_1; at = at + 1;
  wire[at] = session_summary_message_record.seventh_reserved_1; at = at + 1;
  wire[at] = session_summary_message_record.eighth_reserved_1; at = at + 1;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.segment[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = session_summary_message_record.lower_liquidity; at = at + 1;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.dividend[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.subscription_right[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.split[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.interim_dividend_right[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.quotation_system[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> wire[at] = session_summary_message_record.liquidity_support_pge[session_summary_message_at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = session_summary_message_record.ninth_reserved_1; at = at + 1;
  skip
}

/* Session Summary Message off the wire, 260 bytes from where the cursor stands */
inline decode_session_summary_message(session_summary_message_record) {
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.symbol_index[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.source_time[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.source_seq_num[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.date[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.multiplier[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.accumulated_interest[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.opening_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.maximum_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.minimum_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.closing_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.implied_volatility[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.average_weighted_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.reference_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.pct_change_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.dividend_rate[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.settlement_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.settlement_value[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.reserved_4[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.open_positions[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.trading_volume[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.transactions_number[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> session_summary_message_record.trading_value[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.currency_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.delta[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.gamma[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.rho[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.theta[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.vega[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.end_trading[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.number_of_instruments[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> session_summary_message_record.trading_value_currency[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.interest_rate[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volatility[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.strike_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.short_selling_trades_number[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volume_short_selling_trades[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.value_short_selling_trades[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.last_trade_date[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.last_trade_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.block_trades_number[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.volume_block_trades[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.value_block_trades[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.vwap_blocktrade[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.maximum_block_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.minimum_block_price[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> session_summary_message_record.system_id[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.source_time_micro_secs[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.multiplier_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.accumulated_interest_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.opening_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.maximum_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.minimum_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.closing_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.implied_volatility_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.average_weighted_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.reference_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.pct_change_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.dividend_rate_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.settlement_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.settlement_value_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.reserved_1 = wire[at]; at = at + 1;
  session_summary_message_record.trading_value_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.currency_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.delta_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.gamma_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.rho_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.theta_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.vega_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.trading_value_currency_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.interest_rate_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.volatility_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.strike_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.value_short_selling_trades_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.last_trade_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.value_block_trades_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.vwap_blocktrade_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.maximum_block_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.minimum_block_price_scale_code = wire[at]; at = at + 1;
  session_summary_message_record.status_indicator = wire[at]; at = at + 1;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 3 -> session_summary_message_record.sector[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.market = wire[at]; at = at + 1;
  session_summary_message_record.second_reserved_1 = wire[at]; at = at + 1;
  session_summary_message_record.short_sale = wire[at]; at = at + 1;
  session_summary_message_record.marker_pct_change_price = wire[at]; at = at + 1;
  session_summary_message_record.symbol_delta = wire[at]; at = at + 1;
  session_summary_message_record.symbol_gamma = wire[at]; at = at + 1;
  session_summary_message_record.symbol_rho = wire[at]; at = at + 1;
  session_summary_message_record.symbol_theta = wire[at]; at = at + 1;
  session_summary_message_record.symbol_vega = wire[at]; at = at + 1;
  session_summary_message_record.third_reserved_1 = wire[at]; at = at + 1;
  session_summary_message_record.fourth_reserved_1 = wire[at]; at = at + 1;
  session_summary_message_record.fifth_reserved_1 = wire[at]; at = at + 1;
  session_summary_message_record.sixth_reserved_1 = wire[at]; at = at + 1;
  session_summary_message_record.seventh_reserved_1 = wire[at]; at = at + 1;
  session_summary_message_record.eighth_reserved_1 = wire[at]; at = at + 1;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.segment[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.lower_liquidity = wire[at]; at = at + 1;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.dividend[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.subscription_right[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.split[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.interim_dividend_right[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.quotation_system[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> session_summary_message_record.liquidity_support_pge[session_summary_message_at] = wire[at]; at = at + 1; session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_record.ninth_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Session Summary Message is what was written, byte for byte */
inline equal_session_summary_message(session_summary_message_read, session_summary_message_written) {
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.symbol_index[session_summary_message_at] == session_summary_message_written.symbol_index[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.source_time[session_summary_message_at] == session_summary_message_written.source_time[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.source_seq_num[session_summary_message_at] == session_summary_message_written.source_seq_num[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.date[session_summary_message_at] == session_summary_message_written.date[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.multiplier[session_summary_message_at] == session_summary_message_written.multiplier[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.accumulated_interest[session_summary_message_at] == session_summary_message_written.accumulated_interest[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.opening_price[session_summary_message_at] == session_summary_message_written.opening_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.maximum_price[session_summary_message_at] == session_summary_message_written.maximum_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.minimum_price[session_summary_message_at] == session_summary_message_written.minimum_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.closing_price[session_summary_message_at] == session_summary_message_written.closing_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.implied_volatility[session_summary_message_at] == session_summary_message_written.implied_volatility[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.average_weighted_price[session_summary_message_at] == session_summary_message_written.average_weighted_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.reference_price[session_summary_message_at] == session_summary_message_written.reference_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.pct_change_price[session_summary_message_at] == session_summary_message_written.pct_change_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.dividend_rate[session_summary_message_at] == session_summary_message_written.dividend_rate[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.settlement_price[session_summary_message_at] == session_summary_message_written.settlement_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.settlement_value[session_summary_message_at] == session_summary_message_written.settlement_value[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.reserved_4[session_summary_message_at] == session_summary_message_written.reserved_4[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.open_positions[session_summary_message_at] == session_summary_message_written.open_positions[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.trading_volume[session_summary_message_at] == session_summary_message_written.trading_volume[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.transactions_number[session_summary_message_at] == session_summary_message_written.transactions_number[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> assert(session_summary_message_read.trading_value[session_summary_message_at] == session_summary_message_written.trading_value[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.currency_price[session_summary_message_at] == session_summary_message_written.currency_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.delta[session_summary_message_at] == session_summary_message_written.delta[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.gamma[session_summary_message_at] == session_summary_message_written.gamma[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.rho[session_summary_message_at] == session_summary_message_written.rho[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.theta[session_summary_message_at] == session_summary_message_written.theta[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.vega[session_summary_message_at] == session_summary_message_written.vega[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.end_trading[session_summary_message_at] == session_summary_message_written.end_trading[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.number_of_instruments[session_summary_message_at] == session_summary_message_written.number_of_instruments[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 8 -> assert(session_summary_message_read.trading_value_currency[session_summary_message_at] == session_summary_message_written.trading_value_currency[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.interest_rate[session_summary_message_at] == session_summary_message_written.interest_rate[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.volatility[session_summary_message_at] == session_summary_message_written.volatility[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.strike_price[session_summary_message_at] == session_summary_message_written.strike_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.short_selling_trades_number[session_summary_message_at] == session_summary_message_written.short_selling_trades_number[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.volume_short_selling_trades[session_summary_message_at] == session_summary_message_written.volume_short_selling_trades[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.value_short_selling_trades[session_summary_message_at] == session_summary_message_written.value_short_selling_trades[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.last_trade_date[session_summary_message_at] == session_summary_message_written.last_trade_date[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.last_trade_price[session_summary_message_at] == session_summary_message_written.last_trade_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.block_trades_number[session_summary_message_at] == session_summary_message_written.block_trades_number[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.volume_block_trades[session_summary_message_at] == session_summary_message_written.volume_block_trades[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.value_block_trades[session_summary_message_at] == session_summary_message_written.value_block_trades[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.vwap_blocktrade[session_summary_message_at] == session_summary_message_written.vwap_blocktrade[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.maximum_block_price[session_summary_message_at] == session_summary_message_written.maximum_block_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.minimum_block_price[session_summary_message_at] == session_summary_message_written.minimum_block_price[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 4 -> assert(session_summary_message_read.system_id[session_summary_message_at] == session_summary_message_written.system_id[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.source_time_micro_secs[session_summary_message_at] == session_summary_message_written.source_time_micro_secs[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  assert(session_summary_message_read.multiplier_scale_code == session_summary_message_written.multiplier_scale_code);
  assert(session_summary_message_read.accumulated_interest_scale_code == session_summary_message_written.accumulated_interest_scale_code);
  assert(session_summary_message_read.opening_price_scale_code == session_summary_message_written.opening_price_scale_code);
  assert(session_summary_message_read.maximum_price_scale_code == session_summary_message_written.maximum_price_scale_code);
  assert(session_summary_message_read.minimum_price_scale_code == session_summary_message_written.minimum_price_scale_code);
  assert(session_summary_message_read.closing_price_scale_code == session_summary_message_written.closing_price_scale_code);
  assert(session_summary_message_read.implied_volatility_scale_code == session_summary_message_written.implied_volatility_scale_code);
  assert(session_summary_message_read.average_weighted_price_scale_code == session_summary_message_written.average_weighted_price_scale_code);
  assert(session_summary_message_read.reference_price_scale_code == session_summary_message_written.reference_price_scale_code);
  assert(session_summary_message_read.pct_change_price_scale_code == session_summary_message_written.pct_change_price_scale_code);
  assert(session_summary_message_read.dividend_rate_scale_code == session_summary_message_written.dividend_rate_scale_code);
  assert(session_summary_message_read.settlement_price_scale_code == session_summary_message_written.settlement_price_scale_code);
  assert(session_summary_message_read.settlement_value_scale_code == session_summary_message_written.settlement_value_scale_code);
  assert(session_summary_message_read.reserved_1 == session_summary_message_written.reserved_1);
  assert(session_summary_message_read.trading_value_scale_code == session_summary_message_written.trading_value_scale_code);
  assert(session_summary_message_read.currency_price_scale_code == session_summary_message_written.currency_price_scale_code);
  assert(session_summary_message_read.delta_scale_code == session_summary_message_written.delta_scale_code);
  assert(session_summary_message_read.gamma_scale_code == session_summary_message_written.gamma_scale_code);
  assert(session_summary_message_read.rho_scale_code == session_summary_message_written.rho_scale_code);
  assert(session_summary_message_read.theta_scale_code == session_summary_message_written.theta_scale_code);
  assert(session_summary_message_read.vega_scale_code == session_summary_message_written.vega_scale_code);
  assert(session_summary_message_read.trading_value_currency_scale_code == session_summary_message_written.trading_value_currency_scale_code);
  assert(session_summary_message_read.interest_rate_scale_code == session_summary_message_written.interest_rate_scale_code);
  assert(session_summary_message_read.volatility_scale_code == session_summary_message_written.volatility_scale_code);
  assert(session_summary_message_read.strike_price_scale_code == session_summary_message_written.strike_price_scale_code);
  assert(session_summary_message_read.value_short_selling_trades_scale_code == session_summary_message_written.value_short_selling_trades_scale_code);
  assert(session_summary_message_read.last_trade_price_scale_code == session_summary_message_written.last_trade_price_scale_code);
  assert(session_summary_message_read.value_block_trades_scale_code == session_summary_message_written.value_block_trades_scale_code);
  assert(session_summary_message_read.vwap_blocktrade_scale_code == session_summary_message_written.vwap_blocktrade_scale_code);
  assert(session_summary_message_read.maximum_block_price_scale_code == session_summary_message_written.maximum_block_price_scale_code);
  assert(session_summary_message_read.minimum_block_price_scale_code == session_summary_message_written.minimum_block_price_scale_code);
  assert(session_summary_message_read.status_indicator == session_summary_message_written.status_indicator);
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 3 -> assert(session_summary_message_read.sector[session_summary_message_at] == session_summary_message_written.sector[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  assert(session_summary_message_read.market == session_summary_message_written.market);
  assert(session_summary_message_read.second_reserved_1 == session_summary_message_written.second_reserved_1);
  assert(session_summary_message_read.short_sale == session_summary_message_written.short_sale);
  assert(session_summary_message_read.marker_pct_change_price == session_summary_message_written.marker_pct_change_price);
  assert(session_summary_message_read.symbol_delta == session_summary_message_written.symbol_delta);
  assert(session_summary_message_read.symbol_gamma == session_summary_message_written.symbol_gamma);
  assert(session_summary_message_read.symbol_rho == session_summary_message_written.symbol_rho);
  assert(session_summary_message_read.symbol_theta == session_summary_message_written.symbol_theta);
  assert(session_summary_message_read.symbol_vega == session_summary_message_written.symbol_vega);
  assert(session_summary_message_read.third_reserved_1 == session_summary_message_written.third_reserved_1);
  assert(session_summary_message_read.fourth_reserved_1 == session_summary_message_written.fourth_reserved_1);
  assert(session_summary_message_read.fifth_reserved_1 == session_summary_message_written.fifth_reserved_1);
  assert(session_summary_message_read.sixth_reserved_1 == session_summary_message_written.sixth_reserved_1);
  assert(session_summary_message_read.seventh_reserved_1 == session_summary_message_written.seventh_reserved_1);
  assert(session_summary_message_read.eighth_reserved_1 == session_summary_message_written.eighth_reserved_1);
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.segment[session_summary_message_at] == session_summary_message_written.segment[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  assert(session_summary_message_read.lower_liquidity == session_summary_message_written.lower_liquidity);
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.dividend[session_summary_message_at] == session_summary_message_written.dividend[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.subscription_right[session_summary_message_at] == session_summary_message_written.subscription_right[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.split[session_summary_message_at] == session_summary_message_written.split[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.interim_dividend_right[session_summary_message_at] == session_summary_message_written.interim_dividend_right[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.quotation_system[session_summary_message_at] == session_summary_message_written.quotation_system[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  session_summary_message_at = 0;
  do
  :: session_summary_message_at < 2 -> assert(session_summary_message_read.liquidity_support_pge[session_summary_message_at] == session_summary_message_written.liquidity_support_pge[session_summary_message_at]); session_summary_message_at = session_summary_message_at + 1
  :: else -> break
  od;
  assert(session_summary_message_read.ninth_reserved_1 == session_summary_message_written.ninth_reserved_1);
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

/* Class State Change Message: encoded, read back, and compared */
proctype check_class_state_change_message() {
  ClassStateChangeMessage class_state_change_message_sent;
  ClassStateChangeMessage class_state_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_class_state_change_message(class_state_change_message_sent, 0)
  :: pattern == 1 -> fill_class_state_change_message(class_state_change_message_sent, 32)
  :: pattern == 2 -> fill_class_state_change_message(class_state_change_message_sent, 255)
  :: else -> ramp_class_state_change_message(class_state_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_class_state_change_message(class_state_change_message_sent);
    assert(at == 24);
    at = 0;
    decode_class_state_change_message(class_state_change_message_got);
    assert(at == 24);
    equal_class_state_change_message(class_state_change_message_got, class_state_change_message_sent)
  }
}

/* Mail Message: encoded, read back, and compared */
proctype check_mail_message() {
  MailMessage mail_message_sent;
  MailMessage mail_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mail_message(mail_message_sent, 0)
  :: pattern == 1 -> fill_mail_message(mail_message_sent, 32)
  :: pattern == 2 -> fill_mail_message(mail_message_sent, 255)
  :: else -> ramp_mail_message(mail_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mail_message(mail_message_sent);
    assert(at == 1098);
    at = 0;
    decode_mail_message(mail_message_got);
    assert(at == 1098);
    equal_mail_message(mail_message_got, mail_message_sent)
  }
}

/* Collars Message: encoded, read back, and compared */
proctype check_collars_message() {
  CollarsMessage collars_message_sent;
  CollarsMessage collars_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collars_message(collars_message_sent, 0)
  :: pattern == 1 -> fill_collars_message(collars_message_sent, 32)
  :: pattern == 2 -> fill_collars_message(collars_message_sent, 255)
  :: else -> ramp_collars_message(collars_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collars_message(collars_message_sent);
    assert(at == 32);
    at = 0;
    decode_collars_message(collars_message_got);
    assert(at == 32);
    equal_collars_message(collars_message_got, collars_message_sent)
  }
}

/* Start Referential Message: encoded, read back, and compared */
proctype check_start_referential_message() {
  StartReferentialMessage start_referential_message_sent;
  StartReferentialMessage start_referential_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_referential_message(start_referential_message_sent, 0)
  :: pattern == 1 -> fill_start_referential_message(start_referential_message_sent, 32)
  :: pattern == 2 -> fill_start_referential_message(start_referential_message_sent, 255)
  :: else -> ramp_start_referential_message(start_referential_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_referential_message(start_referential_message_sent);
    assert(at == 4);
    at = 0;
    decode_start_referential_message(start_referential_message_got);
    assert(at == 4);
    equal_start_referential_message(start_referential_message_got, start_referential_message_sent)
  }
}

/* End Referential Message: encoded, read back, and compared */
proctype check_end_referential_message() {
  EndReferentialMessage end_referential_message_sent;
  EndReferentialMessage end_referential_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_referential_message(end_referential_message_sent, 0)
  :: pattern == 1 -> fill_end_referential_message(end_referential_message_sent, 32)
  :: pattern == 2 -> fill_end_referential_message(end_referential_message_sent, 255)
  :: else -> ramp_end_referential_message(end_referential_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_referential_message(end_referential_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_referential_message(end_referential_message_got);
    assert(at == 4);
    equal_end_referential_message(end_referential_message_got, end_referential_message_sent)
  }
}

/* Session Summary Message: encoded, read back, and compared */
proctype check_session_summary_message() {
  SessionSummaryMessage session_summary_message_sent;
  SessionSummaryMessage session_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session_summary_message(session_summary_message_sent, 0)
  :: pattern == 1 -> fill_session_summary_message(session_summary_message_sent, 32)
  :: pattern == 2 -> fill_session_summary_message(session_summary_message_sent, 255)
  :: else -> ramp_session_summary_message(session_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session_summary_message(session_summary_message_sent);
    assert(at == 260);
    at = 0;
    decode_session_summary_message(session_summary_message_got);
    assert(at == 260);
    equal_session_summary_message(session_summary_message_got, session_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_class_state_change_message()
  :: run check_mail_message()
  :: run check_collars_message()
  :: run check_start_referential_message()
  :: run check_end_referential_message()
  :: run check_session_summary_message()
  fi
}
