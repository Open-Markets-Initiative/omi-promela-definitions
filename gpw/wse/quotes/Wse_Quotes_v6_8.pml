/*
 * Giełda Papierów Wartościowych w Warszawie Warsaw Stock Exchange Quotes
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 160

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

/* ---- Quotes And Bbo 5 Message: 48 bytes -------------------------------------- */

/* A Quotes & BBO5 message indicates the modification of one or more of the N best limits (N being the number of limits disseminated for the given exchange 1 ) for an instrument and, during the Pre-Opening phase, the modification of the "market summary" for the instrument */
typedef QuotesAndBbo5Message {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte quote_link_id[4];
  byte ask_price[4];
  byte ask_size[4];
  byte bid_price[4];
  byte bid_size[4];
  byte system_id[4];
  byte number_ask_orders[2];
  byte number_bid_orders[2];
  byte source_time_micro_secs[2];
  byte type_of_ask_price;
  byte type_of_bid_price;
  byte quote_condition;
  byte quote_number;
  byte price_scale_code;
  byte reserved_1
};

int quotes_and_bbo5_message_at;

/* every byte of Quotes And Bbo 5 Message set to one value */
inline fill_quotes_and_bbo5_message(quotes_and_bbo5_message_record, quotes_and_bbo5_message_value) {
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.symbol_index[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.source_seq_num[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.source_time[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.quote_link_id[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.ask_price[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.ask_size[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.bid_price[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.bid_size[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.system_id[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.number_ask_orders[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.number_bid_orders[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.source_time_micro_secs[quotes_and_bbo5_message_at] = quotes_and_bbo5_message_value; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_record.type_of_ask_price = quotes_and_bbo5_message_value;
  quotes_and_bbo5_message_record.type_of_bid_price = quotes_and_bbo5_message_value;
  quotes_and_bbo5_message_record.quote_condition = quotes_and_bbo5_message_value;
  quotes_and_bbo5_message_record.quote_number = quotes_and_bbo5_message_value;
  quotes_and_bbo5_message_record.price_scale_code = quotes_and_bbo5_message_value;
  quotes_and_bbo5_message_record.reserved_1 = quotes_and_bbo5_message_value;
  skip
}

/* each byte of Quotes And Bbo 5 Message set to where it lies, so a field read out of place says so */
inline ramp_quotes_and_bbo5_message(quotes_and_bbo5_message_record, quotes_and_bbo5_message_base) {
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.symbol_index[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 0 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.source_seq_num[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 4 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.source_time[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 8 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.quote_link_id[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 12 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.ask_price[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 16 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.ask_size[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 20 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.bid_price[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 24 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.bid_size[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 28 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.system_id[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 32 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.number_ask_orders[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 36 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.number_bid_orders[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 38 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.source_time_micro_secs[quotes_and_bbo5_message_at] = (quotes_and_bbo5_message_base + 40 + quotes_and_bbo5_message_at + 1) % 256; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_record.type_of_ask_price = (quotes_and_bbo5_message_base + 42 + 1) % 256;
  quotes_and_bbo5_message_record.type_of_bid_price = (quotes_and_bbo5_message_base + 43 + 1) % 256;
  quotes_and_bbo5_message_record.quote_condition = (quotes_and_bbo5_message_base + 44 + 1) % 256;
  quotes_and_bbo5_message_record.quote_number = (quotes_and_bbo5_message_base + 45 + 1) % 256;
  quotes_and_bbo5_message_record.price_scale_code = (quotes_and_bbo5_message_base + 46 + 1) % 256;
  quotes_and_bbo5_message_record.reserved_1 = (quotes_and_bbo5_message_base + 47 + 1) % 256;
  skip
}

/* Quotes And Bbo 5 Message to the wire, 48 bytes from where the cursor stands */
inline encode_quotes_and_bbo5_message(quotes_and_bbo5_message_record) {
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.symbol_index[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.source_seq_num[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.source_time[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.quote_link_id[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.ask_price[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.ask_size[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.bid_price[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.bid_size[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> wire[at] = quotes_and_bbo5_message_record.system_id[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> wire[at] = quotes_and_bbo5_message_record.number_ask_orders[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> wire[at] = quotes_and_bbo5_message_record.number_bid_orders[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> wire[at] = quotes_and_bbo5_message_record.source_time_micro_secs[quotes_and_bbo5_message_at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  wire[at] = quotes_and_bbo5_message_record.type_of_ask_price; at = at + 1;
  wire[at] = quotes_and_bbo5_message_record.type_of_bid_price; at = at + 1;
  wire[at] = quotes_and_bbo5_message_record.quote_condition; at = at + 1;
  wire[at] = quotes_and_bbo5_message_record.quote_number; at = at + 1;
  wire[at] = quotes_and_bbo5_message_record.price_scale_code; at = at + 1;
  wire[at] = quotes_and_bbo5_message_record.reserved_1; at = at + 1;
  skip
}

/* Quotes And Bbo 5 Message off the wire, 48 bytes from where the cursor stands */
inline decode_quotes_and_bbo5_message(quotes_and_bbo5_message_record) {
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.symbol_index[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.source_seq_num[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.source_time[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.quote_link_id[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.ask_price[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.ask_size[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.bid_price[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.bid_size[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> quotes_and_bbo5_message_record.system_id[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.number_ask_orders[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.number_bid_orders[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> quotes_and_bbo5_message_record.source_time_micro_secs[quotes_and_bbo5_message_at] = wire[at]; at = at + 1; quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_record.type_of_ask_price = wire[at]; at = at + 1;
  quotes_and_bbo5_message_record.type_of_bid_price = wire[at]; at = at + 1;
  quotes_and_bbo5_message_record.quote_condition = wire[at]; at = at + 1;
  quotes_and_bbo5_message_record.quote_number = wire[at]; at = at + 1;
  quotes_and_bbo5_message_record.price_scale_code = wire[at]; at = at + 1;
  quotes_and_bbo5_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Quotes And Bbo 5 Message is what was written, byte for byte */
inline equal_quotes_and_bbo5_message(quotes_and_bbo5_message_read, quotes_and_bbo5_message_written) {
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.symbol_index[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.symbol_index[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.source_seq_num[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.source_seq_num[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.source_time[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.source_time[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.quote_link_id[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.quote_link_id[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.ask_price[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.ask_price[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.ask_size[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.ask_size[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.bid_price[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.bid_price[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.bid_size[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.bid_size[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 4 -> assert(quotes_and_bbo5_message_read.system_id[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.system_id[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> assert(quotes_and_bbo5_message_read.number_ask_orders[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.number_ask_orders[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> assert(quotes_and_bbo5_message_read.number_bid_orders[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.number_bid_orders[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  quotes_and_bbo5_message_at = 0;
  do
  :: quotes_and_bbo5_message_at < 2 -> assert(quotes_and_bbo5_message_read.source_time_micro_secs[quotes_and_bbo5_message_at] == quotes_and_bbo5_message_written.source_time_micro_secs[quotes_and_bbo5_message_at]); quotes_and_bbo5_message_at = quotes_and_bbo5_message_at + 1
  :: else -> break
  od;
  assert(quotes_and_bbo5_message_read.type_of_ask_price == quotes_and_bbo5_message_written.type_of_ask_price);
  assert(quotes_and_bbo5_message_read.type_of_bid_price == quotes_and_bbo5_message_written.type_of_bid_price);
  assert(quotes_and_bbo5_message_read.quote_condition == quotes_and_bbo5_message_written.quote_condition);
  assert(quotes_and_bbo5_message_read.quote_number == quotes_and_bbo5_message_written.quote_number);
  assert(quotes_and_bbo5_message_read.price_scale_code == quotes_and_bbo5_message_written.price_scale_code);
  assert(quotes_and_bbo5_message_read.reserved_1 == quotes_and_bbo5_message_written.reserved_1);
  skip
}

/* ---- Indication Of Interest Message: 160 bytes ------------------------------- */

/* The Indication of Interest message disseminates an indication of interest for a given instrument to all participants */
typedef IndicationOfInterestMessage {
  byte symbol_index[4];
  byte source_seq_num[4];
  byte source_time[4];
  byte ioiutpid[4];
  byte ioi_qty[4];
  byte price[4];
  byte validity_time[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte price_scale_code;
  byte ioi_trans_type;
  byte firm_id[11];
  byte side;
  byte settlement_date[8];
  byte text[100];
  byte trade_type;
  byte reserved_3[3]
};

int indication_of_interest_message_at;

/* every byte of Indication Of Interest Message set to one value */
inline fill_indication_of_interest_message(indication_of_interest_message_record, indication_of_interest_message_value) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.symbol_index[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.source_seq_num[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.source_time[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioiutpid[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.price[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.validity_time[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.system_id[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 2 -> indication_of_interest_message_record.source_time_micro_secs[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.price_scale_code = indication_of_interest_message_value;
  indication_of_interest_message_record.ioi_trans_type = indication_of_interest_message_value;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 11 -> indication_of_interest_message_record.firm_id[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.side = indication_of_interest_message_value;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.settlement_date[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 100 -> indication_of_interest_message_record.text[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.trade_type = indication_of_interest_message_value;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 3 -> indication_of_interest_message_record.reserved_3[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indication Of Interest Message set to where it lies, so a field read out of place says so */
inline ramp_indication_of_interest_message(indication_of_interest_message_record, indication_of_interest_message_base) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.symbol_index[indication_of_interest_message_at] = (indication_of_interest_message_base + 0 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.source_seq_num[indication_of_interest_message_at] = (indication_of_interest_message_base + 4 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.source_time[indication_of_interest_message_at] = (indication_of_interest_message_base + 8 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioiutpid[indication_of_interest_message_at] = (indication_of_interest_message_base + 12 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at] = (indication_of_interest_message_base + 16 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.price[indication_of_interest_message_at] = (indication_of_interest_message_base + 20 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.validity_time[indication_of_interest_message_at] = (indication_of_interest_message_base + 24 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.system_id[indication_of_interest_message_at] = (indication_of_interest_message_base + 28 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 2 -> indication_of_interest_message_record.source_time_micro_secs[indication_of_interest_message_at] = (indication_of_interest_message_base + 32 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.price_scale_code = (indication_of_interest_message_base + 34 + 1) % 256;
  indication_of_interest_message_record.ioi_trans_type = (indication_of_interest_message_base + 35 + 1) % 256;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 11 -> indication_of_interest_message_record.firm_id[indication_of_interest_message_at] = (indication_of_interest_message_base + 36 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.side = (indication_of_interest_message_base + 47 + 1) % 256;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.settlement_date[indication_of_interest_message_at] = (indication_of_interest_message_base + 48 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 100 -> indication_of_interest_message_record.text[indication_of_interest_message_at] = (indication_of_interest_message_base + 56 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.trade_type = (indication_of_interest_message_base + 156 + 1) % 256;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 3 -> indication_of_interest_message_record.reserved_3[indication_of_interest_message_at] = (indication_of_interest_message_base + 157 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indication Of Interest Message to the wire, 160 bytes from where the cursor stands */
inline encode_indication_of_interest_message(indication_of_interest_message_record) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.symbol_index[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.source_seq_num[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.source_time[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.ioiutpid[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.price[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.validity_time[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.system_id[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 2 -> wire[at] = indication_of_interest_message_record.source_time_micro_secs[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = indication_of_interest_message_record.price_scale_code; at = at + 1;
  wire[at] = indication_of_interest_message_record.ioi_trans_type; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 11 -> wire[at] = indication_of_interest_message_record.firm_id[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = indication_of_interest_message_record.side; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> wire[at] = indication_of_interest_message_record.settlement_date[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 100 -> wire[at] = indication_of_interest_message_record.text[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = indication_of_interest_message_record.trade_type; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 3 -> wire[at] = indication_of_interest_message_record.reserved_3[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Indication Of Interest Message off the wire, 160 bytes from where the cursor stands */
inline decode_indication_of_interest_message(indication_of_interest_message_record) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.symbol_index[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.source_seq_num[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.source_time[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioiutpid[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.price[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.validity_time[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.system_id[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 2 -> indication_of_interest_message_record.source_time_micro_secs[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.price_scale_code = wire[at]; at = at + 1;
  indication_of_interest_message_record.ioi_trans_type = wire[at]; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 11 -> indication_of_interest_message_record.firm_id[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.side = wire[at]; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.settlement_date[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 100 -> indication_of_interest_message_record.text[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.trade_type = wire[at]; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 3 -> indication_of_interest_message_record.reserved_3[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indication Of Interest Message is what was written, byte for byte */
inline equal_indication_of_interest_message(indication_of_interest_message_read, indication_of_interest_message_written) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.symbol_index[indication_of_interest_message_at] == indication_of_interest_message_written.symbol_index[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.source_seq_num[indication_of_interest_message_at] == indication_of_interest_message_written.source_seq_num[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.source_time[indication_of_interest_message_at] == indication_of_interest_message_written.source_time[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.ioiutpid[indication_of_interest_message_at] == indication_of_interest_message_written.ioiutpid[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.ioi_qty[indication_of_interest_message_at] == indication_of_interest_message_written.ioi_qty[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.price[indication_of_interest_message_at] == indication_of_interest_message_written.price[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.validity_time[indication_of_interest_message_at] == indication_of_interest_message_written.validity_time[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.system_id[indication_of_interest_message_at] == indication_of_interest_message_written.system_id[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 2 -> assert(indication_of_interest_message_read.source_time_micro_secs[indication_of_interest_message_at] == indication_of_interest_message_written.source_time_micro_secs[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  assert(indication_of_interest_message_read.price_scale_code == indication_of_interest_message_written.price_scale_code);
  assert(indication_of_interest_message_read.ioi_trans_type == indication_of_interest_message_written.ioi_trans_type);
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 11 -> assert(indication_of_interest_message_read.firm_id[indication_of_interest_message_at] == indication_of_interest_message_written.firm_id[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  assert(indication_of_interest_message_read.side == indication_of_interest_message_written.side);
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> assert(indication_of_interest_message_read.settlement_date[indication_of_interest_message_at] == indication_of_interest_message_written.settlement_date[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 100 -> assert(indication_of_interest_message_read.text[indication_of_interest_message_at] == indication_of_interest_message_written.text[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  assert(indication_of_interest_message_read.trade_type == indication_of_interest_message_written.trade_type);
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 3 -> assert(indication_of_interest_message_read.reserved_3[indication_of_interest_message_at] == indication_of_interest_message_written.reserved_3[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
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

/* Quotes And Bbo 5 Message: encoded, read back, and compared */
proctype check_quotes_and_bbo5_message() {
  QuotesAndBbo5Message quotes_and_bbo5_message_sent;
  QuotesAndBbo5Message quotes_and_bbo5_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quotes_and_bbo5_message(quotes_and_bbo5_message_sent, 0)
  :: pattern == 1 -> fill_quotes_and_bbo5_message(quotes_and_bbo5_message_sent, 32)
  :: pattern == 2 -> fill_quotes_and_bbo5_message(quotes_and_bbo5_message_sent, 255)
  :: else -> ramp_quotes_and_bbo5_message(quotes_and_bbo5_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quotes_and_bbo5_message(quotes_and_bbo5_message_sent);
    assert(at == 48);
    at = 0;
    decode_quotes_and_bbo5_message(quotes_and_bbo5_message_got);
    assert(at == 48);
    equal_quotes_and_bbo5_message(quotes_and_bbo5_message_got, quotes_and_bbo5_message_sent)
  }
}

/* Indication Of Interest Message: encoded, read back, and compared */
proctype check_indication_of_interest_message() {
  IndicationOfInterestMessage indication_of_interest_message_sent;
  IndicationOfInterestMessage indication_of_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indication_of_interest_message(indication_of_interest_message_sent, 0)
  :: pattern == 1 -> fill_indication_of_interest_message(indication_of_interest_message_sent, 32)
  :: pattern == 2 -> fill_indication_of_interest_message(indication_of_interest_message_sent, 255)
  :: else -> ramp_indication_of_interest_message(indication_of_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indication_of_interest_message(indication_of_interest_message_sent);
    assert(at == 160);
    at = 0;
    decode_indication_of_interest_message(indication_of_interest_message_got);
    assert(at == 160);
    equal_indication_of_interest_message(indication_of_interest_message_got, indication_of_interest_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_quotes_and_bbo5_message()
  :: run check_indication_of_interest_message()
  fi
}
