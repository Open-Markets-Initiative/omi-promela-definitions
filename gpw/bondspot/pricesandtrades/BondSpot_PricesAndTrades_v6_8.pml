/*
 * Giełda Papierów Wartościowych w Warszawie BondSpot Prices and Trades
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
#define WIRE 272

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

/* ---- Trade Full Information Message: 272 bytes ------------------------------- */

/* Trade full information message is sent each time a trade or a cancellation of a trade has occurred */
typedef TradeFullInformationMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte trade_id_number[4];
  byte venue_of_execution[4];
  byte source_seq_num[4];
  byte price_notation[4];
  byte transaction_to_be_cleared[4];
  byte cumulative_quantity[4];
  byte highest_price[4];
  byte lowest_price[4];
  byte variation_last_price[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte price_currency[3];
  byte last_trade_indicator;
  byte type_of_trade;
  byte trade_origin;
  byte tick_direction;
  byte opening_trade_indicator;
  byte variation_scale_code;
  byte price_scale_code;
  byte trading_date_time[27];
  byte publication_date_time[27];
  byte instrument_id_code_type[4];
  byte instrument_id_code[12];
  byte price_ascii_ch_20[20];
  byte quantity[20];
  byte notional_amount[20];
  byte notional_currency[3];
  byte reserved_1;
  byte transaction_id_code[52];
  byte mmt_market_mechanism;
  byte mmt_trading_mode;
  byte mmt_algorithmic_indicator[4];
  byte mmt_modification_indicator[4];
  byte mmt_negotiation_indicator[4];
  byte mmt_special_dividend_indicator[4];
  byte mmt_contribution_to_price[4];
  byte mmt_benchmark_indicator[4]
};

int trade_full_information_message_at;

/* every byte of Trade Full Information Message set to one value */
inline fill_trade_full_information_message(trade_full_information_message_record, trade_full_information_message_value) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.symbol_index[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_time[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.trade_id_number[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.venue_of_execution[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_seq_num[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.price_notation[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.transaction_to_be_cleared[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.highest_price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.lowest_price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.variation_last_price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.system_id[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> trade_full_information_message_record.price_currency[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.last_trade_indicator = trade_full_information_message_value;
  trade_full_information_message_record.type_of_trade = trade_full_information_message_value;
  trade_full_information_message_record.trade_origin = trade_full_information_message_value;
  trade_full_information_message_record.tick_direction = trade_full_information_message_value;
  trade_full_information_message_record.opening_trade_indicator = trade_full_information_message_value;
  trade_full_information_message_record.variation_scale_code = trade_full_information_message_value;
  trade_full_information_message_record.price_scale_code = trade_full_information_message_value;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> trade_full_information_message_record.trading_date_time[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> trade_full_information_message_record.publication_date_time[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.instrument_id_code_type[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 12 -> trade_full_information_message_record.instrument_id_code[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.price_ascii_ch_20[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.quantity[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.notional_amount[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> trade_full_information_message_record.notional_currency[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.reserved_1 = trade_full_information_message_value;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 52 -> trade_full_information_message_record.transaction_id_code[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.mmt_market_mechanism = trade_full_information_message_value;
  trade_full_information_message_record.mmt_trading_mode = trade_full_information_message_value;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_algorithmic_indicator[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_modification_indicator[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_negotiation_indicator[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_special_dividend_indicator[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_contribution_to_price[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_benchmark_indicator[trade_full_information_message_at] = trade_full_information_message_value; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Full Information Message set to where it lies, so a field read out of place says so */
inline ramp_trade_full_information_message(trade_full_information_message_record, trade_full_information_message_base) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.symbol_index[trade_full_information_message_at] = (trade_full_information_message_base + 0 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_time[trade_full_information_message_at] = (trade_full_information_message_base + 4 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.trade_id_number[trade_full_information_message_at] = (trade_full_information_message_base + 8 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.venue_of_execution[trade_full_information_message_at] = (trade_full_information_message_base + 12 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_seq_num[trade_full_information_message_at] = (trade_full_information_message_base + 16 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.price_notation[trade_full_information_message_at] = (trade_full_information_message_base + 20 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.transaction_to_be_cleared[trade_full_information_message_at] = (trade_full_information_message_base + 24 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at] = (trade_full_information_message_base + 28 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.highest_price[trade_full_information_message_at] = (trade_full_information_message_base + 32 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.lowest_price[trade_full_information_message_at] = (trade_full_information_message_base + 36 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.variation_last_price[trade_full_information_message_at] = (trade_full_information_message_base + 40 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.system_id[trade_full_information_message_at] = (trade_full_information_message_base + 44 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at] = (trade_full_information_message_base + 48 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> trade_full_information_message_record.price_currency[trade_full_information_message_at] = (trade_full_information_message_base + 50 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.last_trade_indicator = (trade_full_information_message_base + 53 + 1) % 256;
  trade_full_information_message_record.type_of_trade = (trade_full_information_message_base + 54 + 1) % 256;
  trade_full_information_message_record.trade_origin = (trade_full_information_message_base + 55 + 1) % 256;
  trade_full_information_message_record.tick_direction = (trade_full_information_message_base + 56 + 1) % 256;
  trade_full_information_message_record.opening_trade_indicator = (trade_full_information_message_base + 57 + 1) % 256;
  trade_full_information_message_record.variation_scale_code = (trade_full_information_message_base + 58 + 1) % 256;
  trade_full_information_message_record.price_scale_code = (trade_full_information_message_base + 59 + 1) % 256;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> trade_full_information_message_record.trading_date_time[trade_full_information_message_at] = (trade_full_information_message_base + 60 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> trade_full_information_message_record.publication_date_time[trade_full_information_message_at] = (trade_full_information_message_base + 87 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.instrument_id_code_type[trade_full_information_message_at] = (trade_full_information_message_base + 114 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 12 -> trade_full_information_message_record.instrument_id_code[trade_full_information_message_at] = (trade_full_information_message_base + 118 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.price_ascii_ch_20[trade_full_information_message_at] = (trade_full_information_message_base + 130 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.quantity[trade_full_information_message_at] = (trade_full_information_message_base + 150 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.notional_amount[trade_full_information_message_at] = (trade_full_information_message_base + 170 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> trade_full_information_message_record.notional_currency[trade_full_information_message_at] = (trade_full_information_message_base + 190 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.reserved_1 = (trade_full_information_message_base + 193 + 1) % 256;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 52 -> trade_full_information_message_record.transaction_id_code[trade_full_information_message_at] = (trade_full_information_message_base + 194 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.mmt_market_mechanism = (trade_full_information_message_base + 246 + 1) % 256;
  trade_full_information_message_record.mmt_trading_mode = (trade_full_information_message_base + 247 + 1) % 256;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_algorithmic_indicator[trade_full_information_message_at] = (trade_full_information_message_base + 248 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_modification_indicator[trade_full_information_message_at] = (trade_full_information_message_base + 252 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_negotiation_indicator[trade_full_information_message_at] = (trade_full_information_message_base + 256 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_special_dividend_indicator[trade_full_information_message_at] = (trade_full_information_message_base + 260 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_contribution_to_price[trade_full_information_message_at] = (trade_full_information_message_base + 264 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_benchmark_indicator[trade_full_information_message_at] = (trade_full_information_message_base + 268 + trade_full_information_message_at + 1) % 256; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Full Information Message to the wire, 272 bytes from where the cursor stands */
inline encode_trade_full_information_message(trade_full_information_message_record) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.symbol_index[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.source_time[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.trade_id_number[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.venue_of_execution[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.source_seq_num[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.price_notation[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.transaction_to_be_cleared[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.highest_price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.lowest_price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.variation_last_price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.system_id[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> wire[at] = trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> wire[at] = trade_full_information_message_record.price_currency[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_full_information_message_record.last_trade_indicator; at = at + 1;
  wire[at] = trade_full_information_message_record.type_of_trade; at = at + 1;
  wire[at] = trade_full_information_message_record.trade_origin; at = at + 1;
  wire[at] = trade_full_information_message_record.tick_direction; at = at + 1;
  wire[at] = trade_full_information_message_record.opening_trade_indicator; at = at + 1;
  wire[at] = trade_full_information_message_record.variation_scale_code; at = at + 1;
  wire[at] = trade_full_information_message_record.price_scale_code; at = at + 1;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> wire[at] = trade_full_information_message_record.trading_date_time[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> wire[at] = trade_full_information_message_record.publication_date_time[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.instrument_id_code_type[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 12 -> wire[at] = trade_full_information_message_record.instrument_id_code[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> wire[at] = trade_full_information_message_record.price_ascii_ch_20[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> wire[at] = trade_full_information_message_record.quantity[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> wire[at] = trade_full_information_message_record.notional_amount[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> wire[at] = trade_full_information_message_record.notional_currency[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_full_information_message_record.reserved_1; at = at + 1;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 52 -> wire[at] = trade_full_information_message_record.transaction_id_code[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_full_information_message_record.mmt_market_mechanism; at = at + 1;
  wire[at] = trade_full_information_message_record.mmt_trading_mode; at = at + 1;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.mmt_algorithmic_indicator[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.mmt_modification_indicator[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.mmt_negotiation_indicator[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.mmt_special_dividend_indicator[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.mmt_contribution_to_price[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> wire[at] = trade_full_information_message_record.mmt_benchmark_indicator[trade_full_information_message_at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Full Information Message off the wire, 272 bytes from where the cursor stands */
inline decode_trade_full_information_message(trade_full_information_message_record) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.symbol_index[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_time[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.trade_id_number[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.venue_of_execution[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.source_seq_num[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.price_notation[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.transaction_to_be_cleared[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.cumulative_quantity[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.highest_price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.lowest_price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.variation_last_price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.system_id[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> trade_full_information_message_record.source_time_micro_secs[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> trade_full_information_message_record.price_currency[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.last_trade_indicator = wire[at]; at = at + 1;
  trade_full_information_message_record.type_of_trade = wire[at]; at = at + 1;
  trade_full_information_message_record.trade_origin = wire[at]; at = at + 1;
  trade_full_information_message_record.tick_direction = wire[at]; at = at + 1;
  trade_full_information_message_record.opening_trade_indicator = wire[at]; at = at + 1;
  trade_full_information_message_record.variation_scale_code = wire[at]; at = at + 1;
  trade_full_information_message_record.price_scale_code = wire[at]; at = at + 1;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> trade_full_information_message_record.trading_date_time[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> trade_full_information_message_record.publication_date_time[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.instrument_id_code_type[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 12 -> trade_full_information_message_record.instrument_id_code[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.price_ascii_ch_20[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.quantity[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> trade_full_information_message_record.notional_amount[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> trade_full_information_message_record.notional_currency[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 52 -> trade_full_information_message_record.transaction_id_code[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_record.mmt_market_mechanism = wire[at]; at = at + 1;
  trade_full_information_message_record.mmt_trading_mode = wire[at]; at = at + 1;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_algorithmic_indicator[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_modification_indicator[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_negotiation_indicator[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_special_dividend_indicator[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_contribution_to_price[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> trade_full_information_message_record.mmt_benchmark_indicator[trade_full_information_message_at] = wire[at]; at = at + 1; trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Full Information Message is what was written, byte for byte */
inline equal_trade_full_information_message(trade_full_information_message_read, trade_full_information_message_written) {
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.symbol_index[trade_full_information_message_at] == trade_full_information_message_written.symbol_index[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.source_time[trade_full_information_message_at] == trade_full_information_message_written.source_time[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.trade_id_number[trade_full_information_message_at] == trade_full_information_message_written.trade_id_number[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.venue_of_execution[trade_full_information_message_at] == trade_full_information_message_written.venue_of_execution[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.source_seq_num[trade_full_information_message_at] == trade_full_information_message_written.source_seq_num[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.price_notation[trade_full_information_message_at] == trade_full_information_message_written.price_notation[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.transaction_to_be_cleared[trade_full_information_message_at] == trade_full_information_message_written.transaction_to_be_cleared[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.cumulative_quantity[trade_full_information_message_at] == trade_full_information_message_written.cumulative_quantity[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.highest_price[trade_full_information_message_at] == trade_full_information_message_written.highest_price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.lowest_price[trade_full_information_message_at] == trade_full_information_message_written.lowest_price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.variation_last_price[trade_full_information_message_at] == trade_full_information_message_written.variation_last_price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.system_id[trade_full_information_message_at] == trade_full_information_message_written.system_id[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 2 -> assert(trade_full_information_message_read.source_time_micro_secs[trade_full_information_message_at] == trade_full_information_message_written.source_time_micro_secs[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> assert(trade_full_information_message_read.price_currency[trade_full_information_message_at] == trade_full_information_message_written.price_currency[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  assert(trade_full_information_message_read.last_trade_indicator == trade_full_information_message_written.last_trade_indicator);
  assert(trade_full_information_message_read.type_of_trade == trade_full_information_message_written.type_of_trade);
  assert(trade_full_information_message_read.trade_origin == trade_full_information_message_written.trade_origin);
  assert(trade_full_information_message_read.tick_direction == trade_full_information_message_written.tick_direction);
  assert(trade_full_information_message_read.opening_trade_indicator == trade_full_information_message_written.opening_trade_indicator);
  assert(trade_full_information_message_read.variation_scale_code == trade_full_information_message_written.variation_scale_code);
  assert(trade_full_information_message_read.price_scale_code == trade_full_information_message_written.price_scale_code);
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> assert(trade_full_information_message_read.trading_date_time[trade_full_information_message_at] == trade_full_information_message_written.trading_date_time[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 27 -> assert(trade_full_information_message_read.publication_date_time[trade_full_information_message_at] == trade_full_information_message_written.publication_date_time[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.instrument_id_code_type[trade_full_information_message_at] == trade_full_information_message_written.instrument_id_code_type[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 12 -> assert(trade_full_information_message_read.instrument_id_code[trade_full_information_message_at] == trade_full_information_message_written.instrument_id_code[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> assert(trade_full_information_message_read.price_ascii_ch_20[trade_full_information_message_at] == trade_full_information_message_written.price_ascii_ch_20[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> assert(trade_full_information_message_read.quantity[trade_full_information_message_at] == trade_full_information_message_written.quantity[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 20 -> assert(trade_full_information_message_read.notional_amount[trade_full_information_message_at] == trade_full_information_message_written.notional_amount[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 3 -> assert(trade_full_information_message_read.notional_currency[trade_full_information_message_at] == trade_full_information_message_written.notional_currency[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  assert(trade_full_information_message_read.reserved_1 == trade_full_information_message_written.reserved_1);
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 52 -> assert(trade_full_information_message_read.transaction_id_code[trade_full_information_message_at] == trade_full_information_message_written.transaction_id_code[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  assert(trade_full_information_message_read.mmt_market_mechanism == trade_full_information_message_written.mmt_market_mechanism);
  assert(trade_full_information_message_read.mmt_trading_mode == trade_full_information_message_written.mmt_trading_mode);
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.mmt_algorithmic_indicator[trade_full_information_message_at] == trade_full_information_message_written.mmt_algorithmic_indicator[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.mmt_modification_indicator[trade_full_information_message_at] == trade_full_information_message_written.mmt_modification_indicator[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.mmt_negotiation_indicator[trade_full_information_message_at] == trade_full_information_message_written.mmt_negotiation_indicator[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.mmt_special_dividend_indicator[trade_full_information_message_at] == trade_full_information_message_written.mmt_special_dividend_indicator[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.mmt_contribution_to_price[trade_full_information_message_at] == trade_full_information_message_written.mmt_contribution_to_price[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  trade_full_information_message_at = 0;
  do
  :: trade_full_information_message_at < 4 -> assert(trade_full_information_message_read.mmt_benchmark_indicator[trade_full_information_message_at] == trade_full_information_message_written.mmt_benchmark_indicator[trade_full_information_message_at]); trade_full_information_message_at = trade_full_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Update Message: 40 bytes ------------------------------------------ */

/* The Price update message contains a bid price or an ask price in case of alternative indicative price (AIP), or the modification of the last reference price on a given instrument */
typedef PriceUpdateMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte source_seq_num[4];
  byte price_binary_int_4[4];
  byte highest_price[4];
  byte lowest_price[4];
  byte variation_last_price[4];
  byte system_id[4];
  byte source_time_micro_secs[2];
  byte type_of_price[2];
  byte reserved_2[2];
  byte price_scale_code;
  byte variation_scale_code
};

int price_update_message_at;

/* every byte of Price Update Message set to one value */
inline fill_price_update_message(price_update_message_record, price_update_message_value) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.symbol_index[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_time[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_seq_num[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.price_binary_int_4[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.highest_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.lowest_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.variation_last_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.system_id[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.source_time_micro_secs[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.type_of_price[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.reserved_2[price_update_message_at] = price_update_message_value; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_record.price_scale_code = price_update_message_value;
  price_update_message_record.variation_scale_code = price_update_message_value;
  skip
}

/* each byte of Price Update Message set to where it lies, so a field read out of place says so */
inline ramp_price_update_message(price_update_message_record, price_update_message_base) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.symbol_index[price_update_message_at] = (price_update_message_base + 0 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_time[price_update_message_at] = (price_update_message_base + 4 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_seq_num[price_update_message_at] = (price_update_message_base + 8 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.price_binary_int_4[price_update_message_at] = (price_update_message_base + 12 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.highest_price[price_update_message_at] = (price_update_message_base + 16 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.lowest_price[price_update_message_at] = (price_update_message_base + 20 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.variation_last_price[price_update_message_at] = (price_update_message_base + 24 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.system_id[price_update_message_at] = (price_update_message_base + 28 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.source_time_micro_secs[price_update_message_at] = (price_update_message_base + 32 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.type_of_price[price_update_message_at] = (price_update_message_base + 34 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.reserved_2[price_update_message_at] = (price_update_message_base + 36 + price_update_message_at + 1) % 256; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_record.price_scale_code = (price_update_message_base + 38 + 1) % 256;
  price_update_message_record.variation_scale_code = (price_update_message_base + 39 + 1) % 256;
  skip
}

/* Price Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_price_update_message(price_update_message_record) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.symbol_index[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.source_time[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.source_seq_num[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.price_binary_int_4[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.highest_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.lowest_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.variation_last_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> wire[at] = price_update_message_record.system_id[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> wire[at] = price_update_message_record.source_time_micro_secs[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> wire[at] = price_update_message_record.type_of_price[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> wire[at] = price_update_message_record.reserved_2[price_update_message_at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  wire[at] = price_update_message_record.price_scale_code; at = at + 1;
  wire[at] = price_update_message_record.variation_scale_code; at = at + 1;
  skip
}

/* Price Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_price_update_message(price_update_message_record) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.symbol_index[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_time[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.source_seq_num[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.price_binary_int_4[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.highest_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.lowest_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.variation_last_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> price_update_message_record.system_id[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.source_time_micro_secs[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.type_of_price[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> price_update_message_record.reserved_2[price_update_message_at] = wire[at]; at = at + 1; price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_record.price_scale_code = wire[at]; at = at + 1;
  price_update_message_record.variation_scale_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Price Update Message is what was written, byte for byte */
inline equal_price_update_message(price_update_message_read, price_update_message_written) {
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.symbol_index[price_update_message_at] == price_update_message_written.symbol_index[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.source_time[price_update_message_at] == price_update_message_written.source_time[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.source_seq_num[price_update_message_at] == price_update_message_written.source_seq_num[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.price_binary_int_4[price_update_message_at] == price_update_message_written.price_binary_int_4[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.highest_price[price_update_message_at] == price_update_message_written.highest_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.lowest_price[price_update_message_at] == price_update_message_written.lowest_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.variation_last_price[price_update_message_at] == price_update_message_written.variation_last_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 4 -> assert(price_update_message_read.system_id[price_update_message_at] == price_update_message_written.system_id[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> assert(price_update_message_read.source_time_micro_secs[price_update_message_at] == price_update_message_written.source_time_micro_secs[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> assert(price_update_message_read.type_of_price[price_update_message_at] == price_update_message_written.type_of_price[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  price_update_message_at = 0;
  do
  :: price_update_message_at < 2 -> assert(price_update_message_read.reserved_2[price_update_message_at] == price_update_message_written.reserved_2[price_update_message_at]); price_update_message_at = price_update_message_at + 1
  :: else -> break
  od;
  assert(price_update_message_read.price_scale_code == price_update_message_written.price_scale_code);
  assert(price_update_message_read.variation_scale_code == price_update_message_written.variation_scale_code);
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

/* Trade Full Information Message: encoded, read back, and compared */
proctype check_trade_full_information_message() {
  TradeFullInformationMessage trade_full_information_message_sent;
  TradeFullInformationMessage trade_full_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_full_information_message(trade_full_information_message_sent, 0)
  :: pattern == 1 -> fill_trade_full_information_message(trade_full_information_message_sent, 32)
  :: pattern == 2 -> fill_trade_full_information_message(trade_full_information_message_sent, 255)
  :: else -> ramp_trade_full_information_message(trade_full_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_full_information_message(trade_full_information_message_sent);
    assert(at == 272);
    at = 0;
    decode_trade_full_information_message(trade_full_information_message_got);
    assert(at == 272);
    equal_trade_full_information_message(trade_full_information_message_got, trade_full_information_message_sent)
  }
}

/* Price Update Message: encoded, read back, and compared */
proctype check_price_update_message() {
  PriceUpdateMessage price_update_message_sent;
  PriceUpdateMessage price_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_update_message(price_update_message_sent, 0)
  :: pattern == 1 -> fill_price_update_message(price_update_message_sent, 32)
  :: pattern == 2 -> fill_price_update_message(price_update_message_sent, 255)
  :: else -> ramp_price_update_message(price_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_update_message(price_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_price_update_message(price_update_message_got);
    assert(at == 40);
    equal_price_update_message(price_update_message_got, price_update_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_trade_full_information_message()
  :: run check_price_update_message()
  fi
}
