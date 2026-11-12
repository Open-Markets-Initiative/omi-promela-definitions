/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 22
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
#define WIRE 130

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- INTRA Multicast Header: 17 bytes ---------------------------------------- */

/* BMV INTRA Multicast Header */
typedef INTRAMulticastHeader {
  byte length[2];
  byte total_messages;
  byte market_data_group;
  byte session;
  byte sequence_number[4];
  byte datetime[8]
};

int i_n_t_r_a_multicast_header_at;

/* every byte of INTRA Multicast Header set to one value */
inline fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_value) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.market_data_group = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.session = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of INTRA Multicast Header set to where it lies, so a field read out of place says so */
inline ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_base) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 0 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = (i_n_t_r_a_multicast_header_base + 2 + 1) % 256;
  i_n_t_r_a_multicast_header_record.market_data_group = (i_n_t_r_a_multicast_header_base + 3 + 1) % 256;
  i_n_t_r_a_multicast_header_record.session = (i_n_t_r_a_multicast_header_base + 4 + 1) % 256;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 5 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 9 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header to the wire, 17 bytes from where the cursor stands */
inline encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> wire[at] = i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  wire[at] = i_n_t_r_a_multicast_header_record.total_messages; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.market_data_group; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.session; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> wire[at] = i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> wire[at] = i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header off the wire, 17 bytes from where the cursor stands */
inline decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.market_data_group = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.session = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of INTRA Multicast Header is what was written, byte for byte */
inline equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_read, i_n_t_r_a_multicast_header_written) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> assert(i_n_t_r_a_multicast_header_read.length[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.length[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  assert(i_n_t_r_a_multicast_header_read.total_messages == i_n_t_r_a_multicast_header_written.total_messages);
  assert(i_n_t_r_a_multicast_header_read.market_data_group == i_n_t_r_a_multicast_header_written.market_data_group);
  assert(i_n_t_r_a_multicast_header_read.session == i_n_t_r_a_multicast_header_written.session);
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> assert(i_n_t_r_a_multicast_header_read.sequence_number[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.sequence_number[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> assert(i_n_t_r_a_multicast_header_read.datetime[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.datetime[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Message length and message type */
typedef MessageHeader {
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Events System Message: 22 bytes ----------------------------------------- */

/* The system of events message is used to inform that an event has occurred, which needs to be of public domain. */
typedef EventsSystemMessage {
  byte instrument_number[4];
  byte event_code;
  byte market;
  byte sending_time[8];
  byte ending_time[8]
};

int events_system_message_at;

/* every byte of Events System Message set to one value */
inline fill_events_system_message(events_system_message_record, events_system_message_value) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> events_system_message_record.instrument_number[events_system_message_at] = events_system_message_value; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_record.event_code = events_system_message_value;
  events_system_message_record.market = events_system_message_value;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.sending_time[events_system_message_at] = events_system_message_value; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.ending_time[events_system_message_at] = events_system_message_value; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Events System Message set to where it lies, so a field read out of place says so */
inline ramp_events_system_message(events_system_message_record, events_system_message_base) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> events_system_message_record.instrument_number[events_system_message_at] = (events_system_message_base + 0 + events_system_message_at + 1) % 256; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_record.event_code = (events_system_message_base + 4 + 1) % 256;
  events_system_message_record.market = (events_system_message_base + 5 + 1) % 256;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.sending_time[events_system_message_at] = (events_system_message_base + 6 + events_system_message_at + 1) % 256; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.ending_time[events_system_message_at] = (events_system_message_base + 14 + events_system_message_at + 1) % 256; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* Events System Message to the wire, 22 bytes from where the cursor stands */
inline encode_events_system_message(events_system_message_record) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> wire[at] = events_system_message_record.instrument_number[events_system_message_at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  wire[at] = events_system_message_record.event_code; at = at + 1;
  wire[at] = events_system_message_record.market; at = at + 1;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> wire[at] = events_system_message_record.sending_time[events_system_message_at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> wire[at] = events_system_message_record.ending_time[events_system_message_at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* Events System Message off the wire, 22 bytes from where the cursor stands */
inline decode_events_system_message(events_system_message_record) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> events_system_message_record.instrument_number[events_system_message_at] = wire[at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_record.event_code = wire[at]; at = at + 1;
  events_system_message_record.market = wire[at]; at = at + 1;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.sending_time[events_system_message_at] = wire[at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> events_system_message_record.ending_time[events_system_message_at] = wire[at]; at = at + 1; events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Events System Message is what was written, byte for byte */
inline equal_events_system_message(events_system_message_read, events_system_message_written) {
  events_system_message_at = 0;
  do
  :: events_system_message_at < 4 -> assert(events_system_message_read.instrument_number[events_system_message_at] == events_system_message_written.instrument_number[events_system_message_at]); events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  assert(events_system_message_read.event_code == events_system_message_written.event_code);
  assert(events_system_message_read.market == events_system_message_written.market);
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> assert(events_system_message_read.sending_time[events_system_message_at] == events_system_message_written.sending_time[events_system_message_at]); events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  events_system_message_at = 0;
  do
  :: events_system_message_at < 8 -> assert(events_system_message_read.ending_time[events_system_message_at] == events_system_message_written.ending_time[events_system_message_at]); events_system_message_at = events_system_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Dollar Buy Sell Message: 38 bytes --------------------------------------- */

/* Dollar Buy/Sell */
typedef DollarBuySellMessage {
  byte posture_date[8];
  byte currency[5];
  byte dollar_side;
  byte buy[8];
  byte sell[8];
  byte last_deal[8]
};

int dollar_buy_sell_message_at;

/* every byte of Dollar Buy Sell Message set to one value */
inline fill_dollar_buy_sell_message(dollar_buy_sell_message_record, dollar_buy_sell_message_value) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_record.dollar_side = dollar_buy_sell_message_value;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.buy[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.sell[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at] = dollar_buy_sell_message_value; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Dollar Buy Sell Message set to where it lies, so a field read out of place says so */
inline ramp_dollar_buy_sell_message(dollar_buy_sell_message_record, dollar_buy_sell_message_base) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 0 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 8 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_record.dollar_side = (dollar_buy_sell_message_base + 13 + 1) % 256;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.buy[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 14 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.sell[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 22 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at] = (dollar_buy_sell_message_base + 30 + dollar_buy_sell_message_at + 1) % 256; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dollar Buy Sell Message to the wire, 38 bytes from where the cursor stands */
inline encode_dollar_buy_sell_message(dollar_buy_sell_message_record) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> wire[at] = dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  wire[at] = dollar_buy_sell_message_record.dollar_side; at = at + 1;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.buy[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.sell[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> wire[at] = dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* Dollar Buy Sell Message off the wire, 38 bytes from where the cursor stands */
inline decode_dollar_buy_sell_message(dollar_buy_sell_message_record) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.posture_date[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> dollar_buy_sell_message_record.currency[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_record.dollar_side = wire[at]; at = at + 1;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.buy[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.sell[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> dollar_buy_sell_message_record.last_deal[dollar_buy_sell_message_at] = wire[at]; at = at + 1; dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Dollar Buy Sell Message is what was written, byte for byte */
inline equal_dollar_buy_sell_message(dollar_buy_sell_message_read, dollar_buy_sell_message_written) {
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.posture_date[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.posture_date[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 5 -> assert(dollar_buy_sell_message_read.currency[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.currency[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  assert(dollar_buy_sell_message_read.dollar_side == dollar_buy_sell_message_written.dollar_side);
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.buy[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.buy[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.sell[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.sell[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  dollar_buy_sell_message_at = 0;
  do
  :: dollar_buy_sell_message_at < 8 -> assert(dollar_buy_sell_message_read.last_deal[dollar_buy_sell_message_at] == dollar_buy_sell_message_written.last_deal[dollar_buy_sell_message_at]); dollar_buy_sell_message_at = dollar_buy_sell_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Sales Balances Per Instrument Message: 44 bytes ------------------- */

/* Short sales balances per instrument */
typedef ShortSalesBalancesPerInstrumentMessage {
  byte instrument_number[4];
  byte date[8];
  byte previous_balance[8];
  byte amount_traded[8];
  byte buybacks[8];
  byte current_balance[8]
};

int short_sales_balances_per_instrument_message_at;

/* every byte of Short Sales Balances Per Instrument Message set to one value */
inline fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record, short_sales_balances_per_instrument_message_value) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at] = short_sales_balances_per_instrument_message_value; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Sales Balances Per Instrument Message set to where it lies, so a field read out of place says so */
inline ramp_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record, short_sales_balances_per_instrument_message_base) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 0 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 4 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 12 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 20 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 28 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at] = (short_sales_balances_per_instrument_message_base + 36 + short_sales_balances_per_instrument_message_at + 1) % 256; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Sales Balances Per Instrument Message to the wire, 44 bytes from where the cursor stands */
inline encode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> wire[at] = short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> wire[at] = short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Sales Balances Per Instrument Message off the wire, 44 bytes from where the cursor stands */
inline decode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_record) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> short_sales_balances_per_instrument_message_record.instrument_number[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.date[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.previous_balance[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.amount_traded[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.buybacks[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> short_sales_balances_per_instrument_message_record.current_balance[short_sales_balances_per_instrument_message_at] = wire[at]; at = at + 1; short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Sales Balances Per Instrument Message is what was written, byte for byte */
inline equal_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_read, short_sales_balances_per_instrument_message_written) {
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 4 -> assert(short_sales_balances_per_instrument_message_read.instrument_number[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.instrument_number[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.date[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.date[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.previous_balance[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.previous_balance[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.amount_traded[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.amount_traded[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.buybacks[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.buybacks[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  short_sales_balances_per_instrument_message_at = 0;
  do
  :: short_sales_balances_per_instrument_message_at < 8 -> assert(short_sales_balances_per_instrument_message_read.current_balance[short_sales_balances_per_instrument_message_at] == short_sales_balances_per_instrument_message_written.current_balance[short_sales_balances_per_instrument_message_at]); short_sales_balances_per_instrument_message_at = short_sales_balances_per_instrument_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Capital Market Multiples Message: 130 bytes ----------------------------- */

/* Capital Market Multiples */
typedef CapitalMarketMultiplesMessage {
  byte instrument_id[4];
  byte multiple_type;
  byte registry_number;
  byte sector;
  byte subsector;
  byte business_line;
  byte sub_line;
  byte pflepa_multiple[8];
  byte pfepa_multiple[8];
  byte ve_uaiida_multiple[8];
  byte p_u[8];
  byte p_vl[8];
  byte f_1_p_unoc[8];
  byte f_2_p_unoc[8];
  byte f_1_p_ue[8];
  byte f_2_p_ue[8];
  byte f_1_ve_uaiida[8];
  byte f_2_ve_uaiida[8];
  byte f_1_p_u[8];
  byte f_2_p_u[8];
  byte f_1_p_vl[8];
  byte f_2_p_vl[8]
};

int capital_market_multiples_message_at;

/* every byte of Capital Market Multiples Message set to one value */
inline fill_capital_market_multiples_message(capital_market_multiples_message_record, capital_market_multiples_message_value) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_record.multiple_type = capital_market_multiples_message_value;
  capital_market_multiples_message_record.registry_number = capital_market_multiples_message_value;
  capital_market_multiples_message_record.sector = capital_market_multiples_message_value;
  capital_market_multiples_message_record.subsector = capital_market_multiples_message_value;
  capital_market_multiples_message_record.business_line = capital_market_multiples_message_value;
  capital_market_multiples_message_record.sub_line = capital_market_multiples_message_value;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_u[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at] = capital_market_multiples_message_value; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Capital Market Multiples Message set to where it lies, so a field read out of place says so */
inline ramp_capital_market_multiples_message(capital_market_multiples_message_record, capital_market_multiples_message_base) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 0 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_record.multiple_type = (capital_market_multiples_message_base + 4 + 1) % 256;
  capital_market_multiples_message_record.registry_number = (capital_market_multiples_message_base + 5 + 1) % 256;
  capital_market_multiples_message_record.sector = (capital_market_multiples_message_base + 6 + 1) % 256;
  capital_market_multiples_message_record.subsector = (capital_market_multiples_message_base + 7 + 1) % 256;
  capital_market_multiples_message_record.business_line = (capital_market_multiples_message_base + 8 + 1) % 256;
  capital_market_multiples_message_record.sub_line = (capital_market_multiples_message_base + 9 + 1) % 256;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 10 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 18 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 26 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_u[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 34 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 42 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 50 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 58 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 66 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 74 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 82 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 90 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 98 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 106 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 114 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at] = (capital_market_multiples_message_base + 122 + capital_market_multiples_message_at + 1) % 256; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capital Market Multiples Message to the wire, 130 bytes from where the cursor stands */
inline encode_capital_market_multiples_message(capital_market_multiples_message_record) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> wire[at] = capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_market_multiples_message_record.multiple_type; at = at + 1;
  wire[at] = capital_market_multiples_message_record.registry_number; at = at + 1;
  wire[at] = capital_market_multiples_message_record.sector; at = at + 1;
  wire[at] = capital_market_multiples_message_record.subsector; at = at + 1;
  wire[at] = capital_market_multiples_message_record.business_line; at = at + 1;
  wire[at] = capital_market_multiples_message_record.sub_line; at = at + 1;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.p_u[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> wire[at] = capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capital Market Multiples Message off the wire, 130 bytes from where the cursor stands */
inline decode_capital_market_multiples_message(capital_market_multiples_message_record) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> capital_market_multiples_message_record.instrument_id[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_record.multiple_type = wire[at]; at = at + 1;
  capital_market_multiples_message_record.registry_number = wire[at]; at = at + 1;
  capital_market_multiples_message_record.sector = wire[at]; at = at + 1;
  capital_market_multiples_message_record.subsector = wire[at]; at = at + 1;
  capital_market_multiples_message_record.business_line = wire[at]; at = at + 1;
  capital_market_multiples_message_record.sub_line = wire[at]; at = at + 1;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pflepa_multiple[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.pfepa_multiple[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.ve_uaiida_multiple[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_u[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.p_vl[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_unoc[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_unoc[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_ue[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_ue[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_ve_uaiida[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_ve_uaiida[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_u[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_u[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_1_p_vl[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> capital_market_multiples_message_record.f_2_p_vl[capital_market_multiples_message_at] = wire[at]; at = at + 1; capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Capital Market Multiples Message is what was written, byte for byte */
inline equal_capital_market_multiples_message(capital_market_multiples_message_read, capital_market_multiples_message_written) {
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 4 -> assert(capital_market_multiples_message_read.instrument_id[capital_market_multiples_message_at] == capital_market_multiples_message_written.instrument_id[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  assert(capital_market_multiples_message_read.multiple_type == capital_market_multiples_message_written.multiple_type);
  assert(capital_market_multiples_message_read.registry_number == capital_market_multiples_message_written.registry_number);
  assert(capital_market_multiples_message_read.sector == capital_market_multiples_message_written.sector);
  assert(capital_market_multiples_message_read.subsector == capital_market_multiples_message_written.subsector);
  assert(capital_market_multiples_message_read.business_line == capital_market_multiples_message_written.business_line);
  assert(capital_market_multiples_message_read.sub_line == capital_market_multiples_message_written.sub_line);
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.pflepa_multiple[capital_market_multiples_message_at] == capital_market_multiples_message_written.pflepa_multiple[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.pfepa_multiple[capital_market_multiples_message_at] == capital_market_multiples_message_written.pfepa_multiple[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.ve_uaiida_multiple[capital_market_multiples_message_at] == capital_market_multiples_message_written.ve_uaiida_multiple[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.p_u[capital_market_multiples_message_at] == capital_market_multiples_message_written.p_u[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.p_vl[capital_market_multiples_message_at] == capital_market_multiples_message_written.p_vl[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_unoc[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_unoc[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_unoc[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_unoc[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_ue[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_ue[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_ue[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_ue[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_ve_uaiida[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_ve_uaiida[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_ve_uaiida[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_ve_uaiida[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_u[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_u[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_u[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_u[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_1_p_vl[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_1_p_vl[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  capital_market_multiples_message_at = 0;
  do
  :: capital_market_multiples_message_at < 8 -> assert(capital_market_multiples_message_read.f_2_p_vl[capital_market_multiples_message_at] == capital_market_multiples_message_written.f_2_p_vl[capital_market_multiples_message_at]); capital_market_multiples_message_at = capital_market_multiples_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Capitalization Rules Message: 39 bytes ---------------------------------- */

/* Capitalization Rules */
typedef CapitalizationRulesMessage {
  byte instrument_number[4];
  byte date_indicators[8];
  byte bursatility_indices[4];
  byte bursatility_indices_sign;
  byte beta_coefficient[8];
  byte beta_coefficient_sign;
  byte correlation_coefficient[8];
  byte correlation_coefficient_sign;
  byte delta_difference[4]
};

int capitalization_rules_message_at;

/* every byte of Capitalization Rules Message set to one value */
inline fill_capitalization_rules_message(capitalization_rules_message_record, capitalization_rules_message_value) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.instrument_number[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.date_indicators[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.bursatility_indices_sign = capitalization_rules_message_value;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.beta_coefficient_sign = capitalization_rules_message_value;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.correlation_coefficient_sign = capitalization_rules_message_value;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.delta_difference[capitalization_rules_message_at] = capitalization_rules_message_value; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Capitalization Rules Message set to where it lies, so a field read out of place says so */
inline ramp_capitalization_rules_message(capitalization_rules_message_record, capitalization_rules_message_base) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.instrument_number[capitalization_rules_message_at] = (capitalization_rules_message_base + 0 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.date_indicators[capitalization_rules_message_at] = (capitalization_rules_message_base + 4 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at] = (capitalization_rules_message_base + 12 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.bursatility_indices_sign = (capitalization_rules_message_base + 16 + 1) % 256;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at] = (capitalization_rules_message_base + 17 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.beta_coefficient_sign = (capitalization_rules_message_base + 25 + 1) % 256;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at] = (capitalization_rules_message_base + 26 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.correlation_coefficient_sign = (capitalization_rules_message_base + 34 + 1) % 256;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.delta_difference[capitalization_rules_message_at] = (capitalization_rules_message_base + 35 + capitalization_rules_message_at + 1) % 256; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capitalization Rules Message to the wire, 39 bytes from where the cursor stands */
inline encode_capitalization_rules_message(capitalization_rules_message_record) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> wire[at] = capitalization_rules_message_record.instrument_number[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> wire[at] = capitalization_rules_message_record.date_indicators[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> wire[at] = capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  wire[at] = capitalization_rules_message_record.bursatility_indices_sign; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> wire[at] = capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  wire[at] = capitalization_rules_message_record.beta_coefficient_sign; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> wire[at] = capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  wire[at] = capitalization_rules_message_record.correlation_coefficient_sign; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> wire[at] = capitalization_rules_message_record.delta_difference[capitalization_rules_message_at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* Capitalization Rules Message off the wire, 39 bytes from where the cursor stands */
inline decode_capitalization_rules_message(capitalization_rules_message_record) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.instrument_number[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.date_indicators[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.bursatility_indices[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.bursatility_indices_sign = wire[at]; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.beta_coefficient[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.beta_coefficient_sign = wire[at]; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> capitalization_rules_message_record.correlation_coefficient[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_record.correlation_coefficient_sign = wire[at]; at = at + 1;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> capitalization_rules_message_record.delta_difference[capitalization_rules_message_at] = wire[at]; at = at + 1; capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Capitalization Rules Message is what was written, byte for byte */
inline equal_capitalization_rules_message(capitalization_rules_message_read, capitalization_rules_message_written) {
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> assert(capitalization_rules_message_read.instrument_number[capitalization_rules_message_at] == capitalization_rules_message_written.instrument_number[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> assert(capitalization_rules_message_read.date_indicators[capitalization_rules_message_at] == capitalization_rules_message_written.date_indicators[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> assert(capitalization_rules_message_read.bursatility_indices[capitalization_rules_message_at] == capitalization_rules_message_written.bursatility_indices[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  assert(capitalization_rules_message_read.bursatility_indices_sign == capitalization_rules_message_written.bursatility_indices_sign);
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> assert(capitalization_rules_message_read.beta_coefficient[capitalization_rules_message_at] == capitalization_rules_message_written.beta_coefficient[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  assert(capitalization_rules_message_read.beta_coefficient_sign == capitalization_rules_message_written.beta_coefficient_sign);
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 8 -> assert(capitalization_rules_message_read.correlation_coefficient[capitalization_rules_message_at] == capitalization_rules_message_written.correlation_coefficient[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  assert(capitalization_rules_message_read.correlation_coefficient_sign == capitalization_rules_message_written.correlation_coefficient_sign);
  capitalization_rules_message_at = 0;
  do
  :: capitalization_rules_message_at < 4 -> assert(capitalization_rules_message_read.delta_difference[capitalization_rules_message_at] == capitalization_rules_message_written.delta_difference[capitalization_rules_message_at]); capitalization_rules_message_at = capitalization_rules_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* INTRA Multicast Header: encoded, read back, and compared */
proctype check_i_n_t_r_a_multicast_header() {
  INTRAMulticastHeader i_n_t_r_a_multicast_header_sent;
  INTRAMulticastHeader i_n_t_r_a_multicast_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  :: pattern == 1 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 32)
  :: pattern == 2 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 255)
  :: else -> ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent);
    assert(at == 17);
    at = 0;
    decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got);
    assert(at == 17);
    equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got, i_n_t_r_a_multicast_header_sent)
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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Events System Message: encoded, read back, and compared */
proctype check_events_system_message() {
  EventsSystemMessage events_system_message_sent;
  EventsSystemMessage events_system_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_events_system_message(events_system_message_sent, 0)
  :: pattern == 1 -> fill_events_system_message(events_system_message_sent, 32)
  :: pattern == 2 -> fill_events_system_message(events_system_message_sent, 255)
  :: else -> ramp_events_system_message(events_system_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_events_system_message(events_system_message_sent);
    assert(at == 22);
    at = 0;
    decode_events_system_message(events_system_message_got);
    assert(at == 22);
    equal_events_system_message(events_system_message_got, events_system_message_sent)
  }
}

/* Dollar Buy Sell Message: encoded, read back, and compared */
proctype check_dollar_buy_sell_message() {
  DollarBuySellMessage dollar_buy_sell_message_sent;
  DollarBuySellMessage dollar_buy_sell_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_dollar_buy_sell_message(dollar_buy_sell_message_sent, 0)
  :: pattern == 1 -> fill_dollar_buy_sell_message(dollar_buy_sell_message_sent, 32)
  :: pattern == 2 -> fill_dollar_buy_sell_message(dollar_buy_sell_message_sent, 255)
  :: else -> ramp_dollar_buy_sell_message(dollar_buy_sell_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_dollar_buy_sell_message(dollar_buy_sell_message_sent);
    assert(at == 38);
    at = 0;
    decode_dollar_buy_sell_message(dollar_buy_sell_message_got);
    assert(at == 38);
    equal_dollar_buy_sell_message(dollar_buy_sell_message_got, dollar_buy_sell_message_sent)
  }
}

/* Short Sales Balances Per Instrument Message: encoded, read back, and compared */
proctype check_short_sales_balances_per_instrument_message() {
  ShortSalesBalancesPerInstrumentMessage short_sales_balances_per_instrument_message_sent;
  ShortSalesBalancesPerInstrumentMessage short_sales_balances_per_instrument_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 0)
  :: pattern == 1 -> fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 32)
  :: pattern == 2 -> fill_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 255)
  :: else -> ramp_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_sent);
    assert(at == 44);
    at = 0;
    decode_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_got);
    assert(at == 44);
    equal_short_sales_balances_per_instrument_message(short_sales_balances_per_instrument_message_got, short_sales_balances_per_instrument_message_sent)
  }
}

/* Capital Market Multiples Message: encoded, read back, and compared */
proctype check_capital_market_multiples_message() {
  CapitalMarketMultiplesMessage capital_market_multiples_message_sent;
  CapitalMarketMultiplesMessage capital_market_multiples_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_capital_market_multiples_message(capital_market_multiples_message_sent, 0)
  :: pattern == 1 -> fill_capital_market_multiples_message(capital_market_multiples_message_sent, 32)
  :: pattern == 2 -> fill_capital_market_multiples_message(capital_market_multiples_message_sent, 255)
  :: else -> ramp_capital_market_multiples_message(capital_market_multiples_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_capital_market_multiples_message(capital_market_multiples_message_sent);
    assert(at == 130);
    at = 0;
    decode_capital_market_multiples_message(capital_market_multiples_message_got);
    assert(at == 130);
    equal_capital_market_multiples_message(capital_market_multiples_message_got, capital_market_multiples_message_sent)
  }
}

/* Capitalization Rules Message: encoded, read back, and compared */
proctype check_capitalization_rules_message() {
  CapitalizationRulesMessage capitalization_rules_message_sent;
  CapitalizationRulesMessage capitalization_rules_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_capitalization_rules_message(capitalization_rules_message_sent, 0)
  :: pattern == 1 -> fill_capitalization_rules_message(capitalization_rules_message_sent, 32)
  :: pattern == 2 -> fill_capitalization_rules_message(capitalization_rules_message_sent, 255)
  :: else -> ramp_capitalization_rules_message(capitalization_rules_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_capitalization_rules_message(capitalization_rules_message_sent);
    assert(at == 39);
    at = 0;
    decode_capitalization_rules_message(capitalization_rules_message_got);
    assert(at == 39);
    equal_capitalization_rules_message(capitalization_rules_message_got, capitalization_rules_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_events_system_message()
  :: run check_dollar_buy_sell_message()
  :: run check_short_sales_balances_per_instrument_message()
  :: run check_capital_market_multiples_message()
  :: run check_capitalization_rules_message()
  fi
}
