/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 17
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
#define WIRE 66

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

/* ---- Trade Cancellation Message: 8 bytes ------------------------------------- */

/* This message is sent when a transaction is cancelled from the BMV system. */
typedef TradeCancellationMessage {
  byte instrument_number[4];
  byte trade_number[4]
};

int trade_cancellation_message_at;

/* every byte of Trade Cancellation Message set to one value */
inline fill_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_value) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.instrument_number[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.trade_number[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_base) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.instrument_number[trade_cancellation_message_at] = (trade_cancellation_message_base + 0 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.trade_number[trade_cancellation_message_at] = (trade_cancellation_message_base + 4 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message to the wire, 8 bytes from where the cursor stands */
inline encode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.instrument_number[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.trade_number[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message off the wire, 8 bytes from where the cursor stands */
inline decode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.instrument_number[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.trade_number[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Message is what was written, byte for byte */
inline equal_trade_cancellation_message(trade_cancellation_message_read, trade_cancellation_message_written) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.instrument_number[trade_cancellation_message_at] == trade_cancellation_message_written.instrument_number[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.trade_number[trade_cancellation_message_at] == trade_cancellation_message_written.trade_number[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Status Changes Message: 5 bytes ----------------------------------------- */

/* All instruments are in a certain status before and during trading session. */
typedef StatusChangesMessage {
  byte instrument_number[4];
  byte instrument_status
};

int status_changes_message_at;

/* every byte of Status Changes Message set to one value */
inline fill_status_changes_message(status_changes_message_record, status_changes_message_value) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> status_changes_message_record.instrument_number[status_changes_message_at] = status_changes_message_value; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  status_changes_message_record.instrument_status = status_changes_message_value;
  skip
}

/* each byte of Status Changes Message set to where it lies, so a field read out of place says so */
inline ramp_status_changes_message(status_changes_message_record, status_changes_message_base) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> status_changes_message_record.instrument_number[status_changes_message_at] = (status_changes_message_base + 0 + status_changes_message_at + 1) % 256; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  status_changes_message_record.instrument_status = (status_changes_message_base + 4 + 1) % 256;
  skip
}

/* Status Changes Message to the wire, 5 bytes from where the cursor stands */
inline encode_status_changes_message(status_changes_message_record) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> wire[at] = status_changes_message_record.instrument_number[status_changes_message_at]; at = at + 1; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  wire[at] = status_changes_message_record.instrument_status; at = at + 1;
  skip
}

/* Status Changes Message off the wire, 5 bytes from where the cursor stands */
inline decode_status_changes_message(status_changes_message_record) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> status_changes_message_record.instrument_number[status_changes_message_at] = wire[at]; at = at + 1; status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  status_changes_message_record.instrument_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Status Changes Message is what was written, byte for byte */
inline equal_status_changes_message(status_changes_message_read, status_changes_message_written) {
  status_changes_message_at = 0;
  do
  :: status_changes_message_at < 4 -> assert(status_changes_message_read.instrument_number[status_changes_message_at] == status_changes_message_written.instrument_number[status_changes_message_at]); status_changes_message_at = status_changes_message_at + 1
  :: else -> break
  od;
  assert(status_changes_message_read.instrument_status == status_changes_message_written.instrument_status);
  skip
}

/* ---- Weighted Average Price Settlement Prices Message: 20 bytes -------------- */

/* For equities market, this message will be sent for each operation containing weighted average price per instrument generated within WAP calculation period (last 20 minutes of trading). */
typedef WeightedAveragePriceSettlementPricesMessage {
  byte instrument_number[4];
  byte weighted_average_price[8];
  byte volatility[8]
};

int weighted_average_price_settlement_prices_message_at;

/* every byte of Weighted Average Price Settlement Prices Message set to one value */
inline fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record, weighted_average_price_settlement_prices_message_value) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at] = weighted_average_price_settlement_prices_message_value; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at] = weighted_average_price_settlement_prices_message_value; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at] = weighted_average_price_settlement_prices_message_value; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Weighted Average Price Settlement Prices Message set to where it lies, so a field read out of place says so */
inline ramp_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record, weighted_average_price_settlement_prices_message_base) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at] = (weighted_average_price_settlement_prices_message_base + 0 + weighted_average_price_settlement_prices_message_at + 1) % 256; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at] = (weighted_average_price_settlement_prices_message_base + 4 + weighted_average_price_settlement_prices_message_at + 1) % 256; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at] = (weighted_average_price_settlement_prices_message_base + 12 + weighted_average_price_settlement_prices_message_at + 1) % 256; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Settlement Prices Message to the wire, 20 bytes from where the cursor stands */
inline encode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> wire[at] = weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> wire[at] = weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> wire[at] = weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Settlement Prices Message off the wire, 20 bytes from where the cursor stands */
inline decode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_record) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> weighted_average_price_settlement_prices_message_record.instrument_number[weighted_average_price_settlement_prices_message_at] = wire[at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.weighted_average_price[weighted_average_price_settlement_prices_message_at] = wire[at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> weighted_average_price_settlement_prices_message_record.volatility[weighted_average_price_settlement_prices_message_at] = wire[at]; at = at + 1; weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Weighted Average Price Settlement Prices Message is what was written, byte for byte */
inline equal_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_read, weighted_average_price_settlement_prices_message_written) {
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 4 -> assert(weighted_average_price_settlement_prices_message_read.instrument_number[weighted_average_price_settlement_prices_message_at] == weighted_average_price_settlement_prices_message_written.instrument_number[weighted_average_price_settlement_prices_message_at]); weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> assert(weighted_average_price_settlement_prices_message_read.weighted_average_price[weighted_average_price_settlement_prices_message_at] == weighted_average_price_settlement_prices_message_written.weighted_average_price[weighted_average_price_settlement_prices_message_at]); weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  weighted_average_price_settlement_prices_message_at = 0;
  do
  :: weighted_average_price_settlement_prices_message_at < 8 -> assert(weighted_average_price_settlement_prices_message_read.volatility[weighted_average_price_settlement_prices_message_at] == weighted_average_price_settlement_prices_message_written.volatility[weighted_average_price_settlement_prices_message_at]); weighted_average_price_settlement_prices_message_at = weighted_average_price_settlement_prices_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Capital Trades Message: 51 bytes ---------------------------------------- */

/* Contains information on any BMV accepted transaction. */
typedef CapitalTradesMessage {
  byte instrument_number[4];
  byte trade_time[8];
  byte volume_int_324[4];
  byte price[8];
  byte concertation_type;
  byte trade_number[4];
  byte price_setter;
  byte operation_type;
  byte amount[8];
  byte buy[5];
  byte sell[5];
  byte settlement;
  byte auction_indicator
};

int capital_trades_message_at;

/* every byte of Capital Trades Message set to one value */
inline fill_capital_trades_message(capital_trades_message_record, capital_trades_message_value) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.instrument_number[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.trade_time[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.volume_int_324[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.price[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.concertation_type = capital_trades_message_value;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.trade_number[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.price_setter = capital_trades_message_value;
  capital_trades_message_record.operation_type = capital_trades_message_value;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.amount[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.buy[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.sell[capital_trades_message_at] = capital_trades_message_value; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.settlement = capital_trades_message_value;
  capital_trades_message_record.auction_indicator = capital_trades_message_value;
  skip
}

/* each byte of Capital Trades Message set to where it lies, so a field read out of place says so */
inline ramp_capital_trades_message(capital_trades_message_record, capital_trades_message_base) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.instrument_number[capital_trades_message_at] = (capital_trades_message_base + 0 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.trade_time[capital_trades_message_at] = (capital_trades_message_base + 4 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.volume_int_324[capital_trades_message_at] = (capital_trades_message_base + 12 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.price[capital_trades_message_at] = (capital_trades_message_base + 16 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.concertation_type = (capital_trades_message_base + 24 + 1) % 256;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.trade_number[capital_trades_message_at] = (capital_trades_message_base + 25 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.price_setter = (capital_trades_message_base + 29 + 1) % 256;
  capital_trades_message_record.operation_type = (capital_trades_message_base + 30 + 1) % 256;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.amount[capital_trades_message_at] = (capital_trades_message_base + 31 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.buy[capital_trades_message_at] = (capital_trades_message_base + 39 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.sell[capital_trades_message_at] = (capital_trades_message_base + 44 + capital_trades_message_at + 1) % 256; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.settlement = (capital_trades_message_base + 49 + 1) % 256;
  capital_trades_message_record.auction_indicator = (capital_trades_message_base + 50 + 1) % 256;
  skip
}

/* Capital Trades Message to the wire, 51 bytes from where the cursor stands */
inline encode_capital_trades_message(capital_trades_message_record) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> wire[at] = capital_trades_message_record.instrument_number[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> wire[at] = capital_trades_message_record.trade_time[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> wire[at] = capital_trades_message_record.volume_int_324[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> wire[at] = capital_trades_message_record.price[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_trades_message_record.concertation_type; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> wire[at] = capital_trades_message_record.trade_number[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_trades_message_record.price_setter; at = at + 1;
  wire[at] = capital_trades_message_record.operation_type; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> wire[at] = capital_trades_message_record.amount[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> wire[at] = capital_trades_message_record.buy[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> wire[at] = capital_trades_message_record.sell[capital_trades_message_at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = capital_trades_message_record.settlement; at = at + 1;
  wire[at] = capital_trades_message_record.auction_indicator; at = at + 1;
  skip
}

/* Capital Trades Message off the wire, 51 bytes from where the cursor stands */
inline decode_capital_trades_message(capital_trades_message_record) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.instrument_number[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.trade_time[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.volume_int_324[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.price[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.concertation_type = wire[at]; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> capital_trades_message_record.trade_number[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.price_setter = wire[at]; at = at + 1;
  capital_trades_message_record.operation_type = wire[at]; at = at + 1;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> capital_trades_message_record.amount[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.buy[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> capital_trades_message_record.sell[capital_trades_message_at] = wire[at]; at = at + 1; capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_record.settlement = wire[at]; at = at + 1;
  capital_trades_message_record.auction_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Capital Trades Message is what was written, byte for byte */
inline equal_capital_trades_message(capital_trades_message_read, capital_trades_message_written) {
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> assert(capital_trades_message_read.instrument_number[capital_trades_message_at] == capital_trades_message_written.instrument_number[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> assert(capital_trades_message_read.trade_time[capital_trades_message_at] == capital_trades_message_written.trade_time[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> assert(capital_trades_message_read.volume_int_324[capital_trades_message_at] == capital_trades_message_written.volume_int_324[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> assert(capital_trades_message_read.price[capital_trades_message_at] == capital_trades_message_written.price[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  assert(capital_trades_message_read.concertation_type == capital_trades_message_written.concertation_type);
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 4 -> assert(capital_trades_message_read.trade_number[capital_trades_message_at] == capital_trades_message_written.trade_number[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  assert(capital_trades_message_read.price_setter == capital_trades_message_written.price_setter);
  assert(capital_trades_message_read.operation_type == capital_trades_message_written.operation_type);
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 8 -> assert(capital_trades_message_read.amount[capital_trades_message_at] == capital_trades_message_written.amount[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> assert(capital_trades_message_read.buy[capital_trades_message_at] == capital_trades_message_written.buy[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  capital_trades_message_at = 0;
  do
  :: capital_trades_message_at < 5 -> assert(capital_trades_message_read.sell[capital_trades_message_at] == capital_trades_message_written.sell[capital_trades_message_at]); capital_trades_message_at = capital_trades_message_at + 1
  :: else -> break
  od;
  assert(capital_trades_message_read.settlement == capital_trades_message_written.settlement);
  assert(capital_trades_message_read.auction_indicator == capital_trades_message_written.auction_indicator);
  skip
}

/* ---- Probable Allocation Price Message: 16 bytes ----------------------------- */

/* Sent during any auction type (Opening, Continuous, Volatility and Intraday) and only on instruments where there is already a virtual match or pre-allocation. */
typedef ProbableAllocationPriceMessage {
  byte instrument_number[4];
  byte probable_allocation_price[8];
  byte volume_int_324[4]
};

int probable_allocation_price_message_at;

/* every byte of Probable Allocation Price Message set to one value */
inline fill_probable_allocation_price_message(probable_allocation_price_message_record, probable_allocation_price_message_value) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at] = probable_allocation_price_message_value; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at] = probable_allocation_price_message_value; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at] = probable_allocation_price_message_value; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Probable Allocation Price Message set to where it lies, so a field read out of place says so */
inline ramp_probable_allocation_price_message(probable_allocation_price_message_record, probable_allocation_price_message_base) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at] = (probable_allocation_price_message_base + 0 + probable_allocation_price_message_at + 1) % 256; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at] = (probable_allocation_price_message_base + 4 + probable_allocation_price_message_at + 1) % 256; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at] = (probable_allocation_price_message_base + 12 + probable_allocation_price_message_at + 1) % 256; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Allocation Price Message to the wire, 16 bytes from where the cursor stands */
inline encode_probable_allocation_price_message(probable_allocation_price_message_record) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> wire[at] = probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> wire[at] = probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> wire[at] = probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Allocation Price Message off the wire, 16 bytes from where the cursor stands */
inline decode_probable_allocation_price_message(probable_allocation_price_message_record) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.instrument_number[probable_allocation_price_message_at] = wire[at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> probable_allocation_price_message_record.probable_allocation_price[probable_allocation_price_message_at] = wire[at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> probable_allocation_price_message_record.volume_int_324[probable_allocation_price_message_at] = wire[at]; at = at + 1; probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Probable Allocation Price Message is what was written, byte for byte */
inline equal_probable_allocation_price_message(probable_allocation_price_message_read, probable_allocation_price_message_written) {
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> assert(probable_allocation_price_message_read.instrument_number[probable_allocation_price_message_at] == probable_allocation_price_message_written.instrument_number[probable_allocation_price_message_at]); probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 8 -> assert(probable_allocation_price_message_read.probable_allocation_price[probable_allocation_price_message_at] == probable_allocation_price_message_written.probable_allocation_price[probable_allocation_price_message_at]); probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  probable_allocation_price_message_at = 0;
  do
  :: probable_allocation_price_message_at < 4 -> assert(probable_allocation_price_message_read.volume_int_324[probable_allocation_price_message_at] == probable_allocation_price_message_written.volume_int_324[probable_allocation_price_message_at]); probable_allocation_price_message_at = probable_allocation_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Continuous Auctions Beginning Message: 20 bytes ------------------------- */

/* Sent at the moment one of the Continuous, Volatility or SIC auctions is generated. */
typedef ContinuousAuctionsBeginningMessage {
  byte instrument_number[4];
  byte beginning_time_of_auction[8];
  byte end_auction_time[8]
};

int continuous_auctions_beginning_message_at;

/* every byte of Continuous Auctions Beginning Message set to one value */
inline fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record, continuous_auctions_beginning_message_value) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at] = continuous_auctions_beginning_message_value; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at] = continuous_auctions_beginning_message_value; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at] = continuous_auctions_beginning_message_value; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Continuous Auctions Beginning Message set to where it lies, so a field read out of place says so */
inline ramp_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record, continuous_auctions_beginning_message_base) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at] = (continuous_auctions_beginning_message_base + 0 + continuous_auctions_beginning_message_at + 1) % 256; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at] = (continuous_auctions_beginning_message_base + 4 + continuous_auctions_beginning_message_at + 1) % 256; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at] = (continuous_auctions_beginning_message_base + 12 + continuous_auctions_beginning_message_at + 1) % 256; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Continuous Auctions Beginning Message to the wire, 20 bytes from where the cursor stands */
inline encode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> wire[at] = continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> wire[at] = continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> wire[at] = continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* Continuous Auctions Beginning Message off the wire, 20 bytes from where the cursor stands */
inline decode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_record) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> continuous_auctions_beginning_message_record.instrument_number[continuous_auctions_beginning_message_at] = wire[at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.beginning_time_of_auction[continuous_auctions_beginning_message_at] = wire[at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> continuous_auctions_beginning_message_record.end_auction_time[continuous_auctions_beginning_message_at] = wire[at]; at = at + 1; continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Continuous Auctions Beginning Message is what was written, byte for byte */
inline equal_continuous_auctions_beginning_message(continuous_auctions_beginning_message_read, continuous_auctions_beginning_message_written) {
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 4 -> assert(continuous_auctions_beginning_message_read.instrument_number[continuous_auctions_beginning_message_at] == continuous_auctions_beginning_message_written.instrument_number[continuous_auctions_beginning_message_at]); continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> assert(continuous_auctions_beginning_message_read.beginning_time_of_auction[continuous_auctions_beginning_message_at] == continuous_auctions_beginning_message_written.beginning_time_of_auction[continuous_auctions_beginning_message_at]); continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  continuous_auctions_beginning_message_at = 0;
  do
  :: continuous_auctions_beginning_message_at < 8 -> assert(continuous_auctions_beginning_message_read.end_auction_time[continuous_auctions_beginning_message_at] == continuous_auctions_beginning_message_written.end_auction_time[continuous_auctions_beginning_message_at]); continuous_auctions_beginning_message_at = continuous_auctions_beginning_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Middle Price Existing Quotes Message: 5 bytes --------------------------- */

/* Generated when an instrument enters a posture in the hidden electronic Middle Price book. */
typedef MiddlePriceExistingQuotesMessage {
  byte instrument_number[4];
  byte existing_postures
};

int middle_price_existing_quotes_message_at;

/* every byte of Middle Price Existing Quotes Message set to one value */
inline fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record, middle_price_existing_quotes_message_value) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at] = middle_price_existing_quotes_message_value; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  middle_price_existing_quotes_message_record.existing_postures = middle_price_existing_quotes_message_value;
  skip
}

/* each byte of Middle Price Existing Quotes Message set to where it lies, so a field read out of place says so */
inline ramp_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record, middle_price_existing_quotes_message_base) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at] = (middle_price_existing_quotes_message_base + 0 + middle_price_existing_quotes_message_at + 1) % 256; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  middle_price_existing_quotes_message_record.existing_postures = (middle_price_existing_quotes_message_base + 4 + 1) % 256;
  skip
}

/* Middle Price Existing Quotes Message to the wire, 5 bytes from where the cursor stands */
inline encode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> wire[at] = middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at]; at = at + 1; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  wire[at] = middle_price_existing_quotes_message_record.existing_postures; at = at + 1;
  skip
}

/* Middle Price Existing Quotes Message off the wire, 5 bytes from where the cursor stands */
inline decode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_record) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> middle_price_existing_quotes_message_record.instrument_number[middle_price_existing_quotes_message_at] = wire[at]; at = at + 1; middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  middle_price_existing_quotes_message_record.existing_postures = wire[at]; at = at + 1;
  skip
}

/* what was read of Middle Price Existing Quotes Message is what was written, byte for byte */
inline equal_middle_price_existing_quotes_message(middle_price_existing_quotes_message_read, middle_price_existing_quotes_message_written) {
  middle_price_existing_quotes_message_at = 0;
  do
  :: middle_price_existing_quotes_message_at < 4 -> assert(middle_price_existing_quotes_message_read.instrument_number[middle_price_existing_quotes_message_at] == middle_price_existing_quotes_message_written.instrument_number[middle_price_existing_quotes_message_at]); middle_price_existing_quotes_message_at = middle_price_existing_quotes_message_at + 1
  :: else -> break
  od;
  assert(middle_price_existing_quotes_message_read.existing_postures == middle_price_existing_quotes_message_written.existing_postures);
  skip
}

/* ---- Registry Operations Message: 61 bytes ----------------------------------- */

/* Sent whenever there is a debt or capital instrument placement. */
typedef RegistryOperationsMessage {
  byte instrument_number[4];
  byte offer_type;
  byte income;
  byte value_type[4];
  byte issuer[7];
  byte series[6];
  byte maximum_volume[8];
  byte registered_volume[8];
  byte price_rate[8];
  byte settlement_date[8];
  byte firm[5];
  byte movement
};

int registry_operations_message_at;

/* every byte of Registry Operations Message set to one value */
inline fill_registry_operations_message(registry_operations_message_record, registry_operations_message_value) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.instrument_number[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.offer_type = registry_operations_message_value;
  registry_operations_message_record.income = registry_operations_message_value;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.value_type[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> registry_operations_message_record.issuer[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> registry_operations_message_record.series[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.maximum_volume[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.registered_volume[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.price_rate[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.settlement_date[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> registry_operations_message_record.firm[registry_operations_message_at] = registry_operations_message_value; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.movement = registry_operations_message_value;
  skip
}

/* each byte of Registry Operations Message set to where it lies, so a field read out of place says so */
inline ramp_registry_operations_message(registry_operations_message_record, registry_operations_message_base) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.instrument_number[registry_operations_message_at] = (registry_operations_message_base + 0 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.offer_type = (registry_operations_message_base + 4 + 1) % 256;
  registry_operations_message_record.income = (registry_operations_message_base + 5 + 1) % 256;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.value_type[registry_operations_message_at] = (registry_operations_message_base + 6 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> registry_operations_message_record.issuer[registry_operations_message_at] = (registry_operations_message_base + 10 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> registry_operations_message_record.series[registry_operations_message_at] = (registry_operations_message_base + 17 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.maximum_volume[registry_operations_message_at] = (registry_operations_message_base + 23 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.registered_volume[registry_operations_message_at] = (registry_operations_message_base + 31 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.price_rate[registry_operations_message_at] = (registry_operations_message_base + 39 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.settlement_date[registry_operations_message_at] = (registry_operations_message_base + 47 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> registry_operations_message_record.firm[registry_operations_message_at] = (registry_operations_message_base + 55 + registry_operations_message_at + 1) % 256; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.movement = (registry_operations_message_base + 60 + 1) % 256;
  skip
}

/* Registry Operations Message to the wire, 61 bytes from where the cursor stands */
inline encode_registry_operations_message(registry_operations_message_record) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> wire[at] = registry_operations_message_record.instrument_number[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  wire[at] = registry_operations_message_record.offer_type; at = at + 1;
  wire[at] = registry_operations_message_record.income; at = at + 1;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> wire[at] = registry_operations_message_record.value_type[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> wire[at] = registry_operations_message_record.issuer[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> wire[at] = registry_operations_message_record.series[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.maximum_volume[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.registered_volume[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.price_rate[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> wire[at] = registry_operations_message_record.settlement_date[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> wire[at] = registry_operations_message_record.firm[registry_operations_message_at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  wire[at] = registry_operations_message_record.movement; at = at + 1;
  skip
}

/* Registry Operations Message off the wire, 61 bytes from where the cursor stands */
inline decode_registry_operations_message(registry_operations_message_record) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.instrument_number[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.offer_type = wire[at]; at = at + 1;
  registry_operations_message_record.income = wire[at]; at = at + 1;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> registry_operations_message_record.value_type[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> registry_operations_message_record.issuer[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> registry_operations_message_record.series[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.maximum_volume[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.registered_volume[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.price_rate[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> registry_operations_message_record.settlement_date[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> registry_operations_message_record.firm[registry_operations_message_at] = wire[at]; at = at + 1; registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_record.movement = wire[at]; at = at + 1;
  skip
}

/* what was read of Registry Operations Message is what was written, byte for byte */
inline equal_registry_operations_message(registry_operations_message_read, registry_operations_message_written) {
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> assert(registry_operations_message_read.instrument_number[registry_operations_message_at] == registry_operations_message_written.instrument_number[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  assert(registry_operations_message_read.offer_type == registry_operations_message_written.offer_type);
  assert(registry_operations_message_read.income == registry_operations_message_written.income);
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 4 -> assert(registry_operations_message_read.value_type[registry_operations_message_at] == registry_operations_message_written.value_type[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 7 -> assert(registry_operations_message_read.issuer[registry_operations_message_at] == registry_operations_message_written.issuer[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 6 -> assert(registry_operations_message_read.series[registry_operations_message_at] == registry_operations_message_written.series[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.maximum_volume[registry_operations_message_at] == registry_operations_message_written.maximum_volume[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.registered_volume[registry_operations_message_at] == registry_operations_message_written.registered_volume[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.price_rate[registry_operations_message_at] == registry_operations_message_written.price_rate[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 8 -> assert(registry_operations_message_read.settlement_date[registry_operations_message_at] == registry_operations_message_written.settlement_date[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  registry_operations_message_at = 0;
  do
  :: registry_operations_message_at < 5 -> assert(registry_operations_message_read.firm[registry_operations_message_at] == registry_operations_message_written.firm[registry_operations_message_at]); registry_operations_message_at = registry_operations_message_at + 1
  :: else -> break
  od;
  assert(registry_operations_message_read.movement == registry_operations_message_written.movement);
  skip
}

/* ---- Mutual Fund Trades Message: 52 bytes ------------------------------------ */

/* Contains any mutual funds operation realized. */
typedef MutualFundTradesMessage {
  byte instrument_number[4];
  byte trade_date[8];
  byte price[8];
  byte book_value[8];
  byte number_of_sales_transactions[4];
  byte sales_volume[8];
  byte number_of_buy_transactions[4];
  byte buy_volume[8]
};

int mutual_fund_trades_message_at;

/* every byte of Mutual Fund Trades Message set to one value */
inline fill_mutual_fund_trades_message(mutual_fund_trades_message_record, mutual_fund_trades_message_value) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.price[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at] = mutual_fund_trades_message_value; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mutual Fund Trades Message set to where it lies, so a field read out of place says so */
inline ramp_mutual_fund_trades_message(mutual_fund_trades_message_record, mutual_fund_trades_message_base) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 0 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 4 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.price[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 12 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 20 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 28 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 32 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 40 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at] = (mutual_fund_trades_message_base + 44 + mutual_fund_trades_message_at + 1) % 256; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Fund Trades Message to the wire, 52 bytes from where the cursor stands */
inline encode_mutual_fund_trades_message(mutual_fund_trades_message_record) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> wire[at] = mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.price[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> wire[at] = mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> wire[at] = mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> wire[at] = mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Fund Trades Message off the wire, 52 bytes from where the cursor stands */
inline decode_mutual_fund_trades_message(mutual_fund_trades_message_record) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.instrument_number[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.trade_date[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.price[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.book_value[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_sales_transactions[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.sales_volume[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> mutual_fund_trades_message_record.number_of_buy_transactions[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> mutual_fund_trades_message_record.buy_volume[mutual_fund_trades_message_at] = wire[at]; at = at + 1; mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mutual Fund Trades Message is what was written, byte for byte */
inline equal_mutual_fund_trades_message(mutual_fund_trades_message_read, mutual_fund_trades_message_written) {
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> assert(mutual_fund_trades_message_read.instrument_number[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.instrument_number[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.trade_date[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.trade_date[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.price[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.price[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.book_value[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.book_value[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> assert(mutual_fund_trades_message_read.number_of_sales_transactions[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.number_of_sales_transactions[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.sales_volume[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.sales_volume[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 4 -> assert(mutual_fund_trades_message_read.number_of_buy_transactions[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.number_of_buy_transactions[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  mutual_fund_trades_message_at = 0;
  do
  :: mutual_fund_trades_message_at < 8 -> assert(mutual_fund_trades_message_read.buy_volume[mutual_fund_trades_message_at] == mutual_fund_trades_message_written.buy_volume[mutual_fund_trades_message_at]); mutual_fund_trades_message_at = mutual_fund_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Best Offer Message: 18 bytes -------------------------------------------- */

/* Message sent by instrument when best offer changes in the electronic book. */
typedef BestOfferMessage {
  byte instrument_number[4];
  byte volume_int_324[4];
  byte price_rate[8];
  byte offer_direction;
  byte operation_type
};

int best_offer_message_at;

/* every byte of Best Offer Message set to one value */
inline fill_best_offer_message(best_offer_message_record, best_offer_message_value) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.instrument_number[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.volume_int_324[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.price_rate[best_offer_message_at] = best_offer_message_value; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_record.offer_direction = best_offer_message_value;
  best_offer_message_record.operation_type = best_offer_message_value;
  skip
}

/* each byte of Best Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_offer_message(best_offer_message_record, best_offer_message_base) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.instrument_number[best_offer_message_at] = (best_offer_message_base + 0 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.volume_int_324[best_offer_message_at] = (best_offer_message_base + 4 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.price_rate[best_offer_message_at] = (best_offer_message_base + 8 + best_offer_message_at + 1) % 256; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_record.offer_direction = (best_offer_message_base + 16 + 1) % 256;
  best_offer_message_record.operation_type = (best_offer_message_base + 17 + 1) % 256;
  skip
}

/* Best Offer Message to the wire, 18 bytes from where the cursor stands */
inline encode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> wire[at] = best_offer_message_record.instrument_number[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> wire[at] = best_offer_message_record.volume_int_324[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> wire[at] = best_offer_message_record.price_rate[best_offer_message_at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = best_offer_message_record.offer_direction; at = at + 1;
  wire[at] = best_offer_message_record.operation_type; at = at + 1;
  skip
}

/* Best Offer Message off the wire, 18 bytes from where the cursor stands */
inline decode_best_offer_message(best_offer_message_record) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.instrument_number[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> best_offer_message_record.volume_int_324[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> best_offer_message_record.price_rate[best_offer_message_at] = wire[at]; at = at + 1; best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_record.offer_direction = wire[at]; at = at + 1;
  best_offer_message_record.operation_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Best Offer Message is what was written, byte for byte */
inline equal_best_offer_message(best_offer_message_read, best_offer_message_written) {
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> assert(best_offer_message_read.instrument_number[best_offer_message_at] == best_offer_message_written.instrument_number[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 4 -> assert(best_offer_message_read.volume_int_324[best_offer_message_at] == best_offer_message_written.volume_int_324[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  best_offer_message_at = 0;
  do
  :: best_offer_message_at < 8 -> assert(best_offer_message_read.price_rate[best_offer_message_at] == best_offer_message_written.price_rate[best_offer_message_at]); best_offer_message_at = best_offer_message_at + 1
  :: else -> break
  od;
  assert(best_offer_message_read.offer_direction == best_offer_message_written.offer_direction);
  assert(best_offer_message_read.operation_type == best_offer_message_written.operation_type);
  skip
}

/* ---- Public Offerings Message: 66 bytes -------------------------------------- */

/* Trade from a Public offering. */
typedef PublicOfferingsMessage {
  byte instrument_number[4];
  byte number[4];
  byte volume_int_648[8];
  byte discount_rate_or_price[8];
  byte rate_of_return[4];
  byte term_days[2];
  byte currency_type;
  byte settlement;
  byte buy[5];
  byte sell[5];
  byte placement_date[8];
  byte issue_date[8];
  byte maturity_date[8]
};

int public_offerings_message_at;

/* every byte of Public Offerings Message set to one value */
inline fill_public_offerings_message(public_offerings_message_record, public_offerings_message_value) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.instrument_number[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.number[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.volume_int_648[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.discount_rate_or_price[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.rate_of_return[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> public_offerings_message_record.term_days[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_record.currency_type = public_offerings_message_value;
  public_offerings_message_record.settlement = public_offerings_message_value;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.buy[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.sell[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.placement_date[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.issue_date[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.maturity_date[public_offerings_message_at] = public_offerings_message_value; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Public Offerings Message set to where it lies, so a field read out of place says so */
inline ramp_public_offerings_message(public_offerings_message_record, public_offerings_message_base) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.instrument_number[public_offerings_message_at] = (public_offerings_message_base + 0 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.number[public_offerings_message_at] = (public_offerings_message_base + 4 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.volume_int_648[public_offerings_message_at] = (public_offerings_message_base + 8 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.discount_rate_or_price[public_offerings_message_at] = (public_offerings_message_base + 16 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.rate_of_return[public_offerings_message_at] = (public_offerings_message_base + 24 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> public_offerings_message_record.term_days[public_offerings_message_at] = (public_offerings_message_base + 28 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_record.currency_type = (public_offerings_message_base + 30 + 1) % 256;
  public_offerings_message_record.settlement = (public_offerings_message_base + 31 + 1) % 256;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.buy[public_offerings_message_at] = (public_offerings_message_base + 32 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.sell[public_offerings_message_at] = (public_offerings_message_base + 37 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.placement_date[public_offerings_message_at] = (public_offerings_message_base + 42 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.issue_date[public_offerings_message_at] = (public_offerings_message_base + 50 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.maturity_date[public_offerings_message_at] = (public_offerings_message_base + 58 + public_offerings_message_at + 1) % 256; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* Public Offerings Message to the wire, 66 bytes from where the cursor stands */
inline encode_public_offerings_message(public_offerings_message_record) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> wire[at] = public_offerings_message_record.instrument_number[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> wire[at] = public_offerings_message_record.number[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.volume_int_648[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.discount_rate_or_price[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> wire[at] = public_offerings_message_record.rate_of_return[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> wire[at] = public_offerings_message_record.term_days[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  wire[at] = public_offerings_message_record.currency_type; at = at + 1;
  wire[at] = public_offerings_message_record.settlement; at = at + 1;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> wire[at] = public_offerings_message_record.buy[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> wire[at] = public_offerings_message_record.sell[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.placement_date[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.issue_date[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> wire[at] = public_offerings_message_record.maturity_date[public_offerings_message_at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* Public Offerings Message off the wire, 66 bytes from where the cursor stands */
inline decode_public_offerings_message(public_offerings_message_record) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.instrument_number[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.number[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.volume_int_648[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.discount_rate_or_price[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> public_offerings_message_record.rate_of_return[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> public_offerings_message_record.term_days[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_record.currency_type = wire[at]; at = at + 1;
  public_offerings_message_record.settlement = wire[at]; at = at + 1;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.buy[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> public_offerings_message_record.sell[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.placement_date[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.issue_date[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> public_offerings_message_record.maturity_date[public_offerings_message_at] = wire[at]; at = at + 1; public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Public Offerings Message is what was written, byte for byte */
inline equal_public_offerings_message(public_offerings_message_read, public_offerings_message_written) {
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> assert(public_offerings_message_read.instrument_number[public_offerings_message_at] == public_offerings_message_written.instrument_number[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> assert(public_offerings_message_read.number[public_offerings_message_at] == public_offerings_message_written.number[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.volume_int_648[public_offerings_message_at] == public_offerings_message_written.volume_int_648[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.discount_rate_or_price[public_offerings_message_at] == public_offerings_message_written.discount_rate_or_price[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 4 -> assert(public_offerings_message_read.rate_of_return[public_offerings_message_at] == public_offerings_message_written.rate_of_return[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 2 -> assert(public_offerings_message_read.term_days[public_offerings_message_at] == public_offerings_message_written.term_days[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  assert(public_offerings_message_read.currency_type == public_offerings_message_written.currency_type);
  assert(public_offerings_message_read.settlement == public_offerings_message_written.settlement);
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> assert(public_offerings_message_read.buy[public_offerings_message_at] == public_offerings_message_written.buy[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 5 -> assert(public_offerings_message_read.sell[public_offerings_message_at] == public_offerings_message_written.sell[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.placement_date[public_offerings_message_at] == public_offerings_message_written.placement_date[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.issue_date[public_offerings_message_at] == public_offerings_message_written.issue_date[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
  :: else -> break
  od;
  public_offerings_message_at = 0;
  do
  :: public_offerings_message_at < 8 -> assert(public_offerings_message_read.maturity_date[public_offerings_message_at] == public_offerings_message_written.maturity_date[public_offerings_message_at]); public_offerings_message_at = public_offerings_message_at + 1
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

/* Trade Cancellation Message: encoded, read back, and compared */
proctype check_trade_cancellation_message() {
  TradeCancellationMessage trade_cancellation_message_sent;
  TradeCancellationMessage trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 255)
  :: else -> ramp_trade_cancellation_message(trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_message(trade_cancellation_message_sent);
    assert(at == 8);
    at = 0;
    decode_trade_cancellation_message(trade_cancellation_message_got);
    assert(at == 8);
    equal_trade_cancellation_message(trade_cancellation_message_got, trade_cancellation_message_sent)
  }
}

/* Status Changes Message: encoded, read back, and compared */
proctype check_status_changes_message() {
  StatusChangesMessage status_changes_message_sent;
  StatusChangesMessage status_changes_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_status_changes_message(status_changes_message_sent, 0)
  :: pattern == 1 -> fill_status_changes_message(status_changes_message_sent, 32)
  :: pattern == 2 -> fill_status_changes_message(status_changes_message_sent, 255)
  :: else -> ramp_status_changes_message(status_changes_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_status_changes_message(status_changes_message_sent);
    assert(at == 5);
    at = 0;
    decode_status_changes_message(status_changes_message_got);
    assert(at == 5);
    equal_status_changes_message(status_changes_message_got, status_changes_message_sent)
  }
}

/* Weighted Average Price Settlement Prices Message: encoded, read back, and compared */
proctype check_weighted_average_price_settlement_prices_message() {
  WeightedAveragePriceSettlementPricesMessage weighted_average_price_settlement_prices_message_sent;
  WeightedAveragePriceSettlementPricesMessage weighted_average_price_settlement_prices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 0)
  :: pattern == 1 -> fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 32)
  :: pattern == 2 -> fill_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 255)
  :: else -> ramp_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_sent);
    assert(at == 20);
    at = 0;
    decode_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_got);
    assert(at == 20);
    equal_weighted_average_price_settlement_prices_message(weighted_average_price_settlement_prices_message_got, weighted_average_price_settlement_prices_message_sent)
  }
}

/* Capital Trades Message: encoded, read back, and compared */
proctype check_capital_trades_message() {
  CapitalTradesMessage capital_trades_message_sent;
  CapitalTradesMessage capital_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_capital_trades_message(capital_trades_message_sent, 0)
  :: pattern == 1 -> fill_capital_trades_message(capital_trades_message_sent, 32)
  :: pattern == 2 -> fill_capital_trades_message(capital_trades_message_sent, 255)
  :: else -> ramp_capital_trades_message(capital_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_capital_trades_message(capital_trades_message_sent);
    assert(at == 51);
    at = 0;
    decode_capital_trades_message(capital_trades_message_got);
    assert(at == 51);
    equal_capital_trades_message(capital_trades_message_got, capital_trades_message_sent)
  }
}

/* Probable Allocation Price Message: encoded, read back, and compared */
proctype check_probable_allocation_price_message() {
  ProbableAllocationPriceMessage probable_allocation_price_message_sent;
  ProbableAllocationPriceMessage probable_allocation_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_probable_allocation_price_message(probable_allocation_price_message_sent, 0)
  :: pattern == 1 -> fill_probable_allocation_price_message(probable_allocation_price_message_sent, 32)
  :: pattern == 2 -> fill_probable_allocation_price_message(probable_allocation_price_message_sent, 255)
  :: else -> ramp_probable_allocation_price_message(probable_allocation_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_probable_allocation_price_message(probable_allocation_price_message_sent);
    assert(at == 16);
    at = 0;
    decode_probable_allocation_price_message(probable_allocation_price_message_got);
    assert(at == 16);
    equal_probable_allocation_price_message(probable_allocation_price_message_got, probable_allocation_price_message_sent)
  }
}

/* Continuous Auctions Beginning Message: encoded, read back, and compared */
proctype check_continuous_auctions_beginning_message() {
  ContinuousAuctionsBeginningMessage continuous_auctions_beginning_message_sent;
  ContinuousAuctionsBeginningMessage continuous_auctions_beginning_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 0)
  :: pattern == 1 -> fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 32)
  :: pattern == 2 -> fill_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 255)
  :: else -> ramp_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_sent);
    assert(at == 20);
    at = 0;
    decode_continuous_auctions_beginning_message(continuous_auctions_beginning_message_got);
    assert(at == 20);
    equal_continuous_auctions_beginning_message(continuous_auctions_beginning_message_got, continuous_auctions_beginning_message_sent)
  }
}

/* Middle Price Existing Quotes Message: encoded, read back, and compared */
proctype check_middle_price_existing_quotes_message() {
  MiddlePriceExistingQuotesMessage middle_price_existing_quotes_message_sent;
  MiddlePriceExistingQuotesMessage middle_price_existing_quotes_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 0)
  :: pattern == 1 -> fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 32)
  :: pattern == 2 -> fill_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 255)
  :: else -> ramp_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_sent);
    assert(at == 5);
    at = 0;
    decode_middle_price_existing_quotes_message(middle_price_existing_quotes_message_got);
    assert(at == 5);
    equal_middle_price_existing_quotes_message(middle_price_existing_quotes_message_got, middle_price_existing_quotes_message_sent)
  }
}

/* Registry Operations Message: encoded, read back, and compared */
proctype check_registry_operations_message() {
  RegistryOperationsMessage registry_operations_message_sent;
  RegistryOperationsMessage registry_operations_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_registry_operations_message(registry_operations_message_sent, 0)
  :: pattern == 1 -> fill_registry_operations_message(registry_operations_message_sent, 32)
  :: pattern == 2 -> fill_registry_operations_message(registry_operations_message_sent, 255)
  :: else -> ramp_registry_operations_message(registry_operations_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_registry_operations_message(registry_operations_message_sent);
    assert(at == 61);
    at = 0;
    decode_registry_operations_message(registry_operations_message_got);
    assert(at == 61);
    equal_registry_operations_message(registry_operations_message_got, registry_operations_message_sent)
  }
}

/* Mutual Fund Trades Message: encoded, read back, and compared */
proctype check_mutual_fund_trades_message() {
  MutualFundTradesMessage mutual_fund_trades_message_sent;
  MutualFundTradesMessage mutual_fund_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mutual_fund_trades_message(mutual_fund_trades_message_sent, 0)
  :: pattern == 1 -> fill_mutual_fund_trades_message(mutual_fund_trades_message_sent, 32)
  :: pattern == 2 -> fill_mutual_fund_trades_message(mutual_fund_trades_message_sent, 255)
  :: else -> ramp_mutual_fund_trades_message(mutual_fund_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mutual_fund_trades_message(mutual_fund_trades_message_sent);
    assert(at == 52);
    at = 0;
    decode_mutual_fund_trades_message(mutual_fund_trades_message_got);
    assert(at == 52);
    equal_mutual_fund_trades_message(mutual_fund_trades_message_got, mutual_fund_trades_message_sent)
  }
}

/* Best Offer Message: encoded, read back, and compared */
proctype check_best_offer_message() {
  BestOfferMessage best_offer_message_sent;
  BestOfferMessage best_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_offer_message(best_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_offer_message(best_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_offer_message(best_offer_message_sent, 255)
  :: else -> ramp_best_offer_message(best_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_offer_message(best_offer_message_sent);
    assert(at == 18);
    at = 0;
    decode_best_offer_message(best_offer_message_got);
    assert(at == 18);
    equal_best_offer_message(best_offer_message_got, best_offer_message_sent)
  }
}

/* Public Offerings Message: encoded, read back, and compared */
proctype check_public_offerings_message() {
  PublicOfferingsMessage public_offerings_message_sent;
  PublicOfferingsMessage public_offerings_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_public_offerings_message(public_offerings_message_sent, 0)
  :: pattern == 1 -> fill_public_offerings_message(public_offerings_message_sent, 32)
  :: pattern == 2 -> fill_public_offerings_message(public_offerings_message_sent, 255)
  :: else -> ramp_public_offerings_message(public_offerings_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_public_offerings_message(public_offerings_message_sent);
    assert(at == 66);
    at = 0;
    decode_public_offerings_message(public_offerings_message_got);
    assert(at == 66);
    equal_public_offerings_message(public_offerings_message_got, public_offerings_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_events_system_message()
  :: run check_trade_cancellation_message()
  :: run check_status_changes_message()
  :: run check_weighted_average_price_settlement_prices_message()
  :: run check_capital_trades_message()
  :: run check_probable_allocation_price_message()
  :: run check_continuous_auctions_beginning_message()
  :: run check_middle_price_existing_quotes_message()
  :: run check_registry_operations_message()
  :: run check_mutual_fund_trades_message()
  :: run check_best_offer_message()
  :: run check_public_offerings_message()
  fi
}
