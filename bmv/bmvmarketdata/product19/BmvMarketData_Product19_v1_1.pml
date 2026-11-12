/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 19
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
#define WIRE 44

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

/* ---- Open Interest Message: 8 bytes ------------------------------------------ */

/* Open Interest */
typedef OpenInterestMessage {
  byte instrument_number[4];
  byte open_interest[4]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.instrument_number[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.instrument_number[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = (open_interest_message_base + 4 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 8 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.instrument_number[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.open_interest[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 8 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.instrument_number[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.instrument_number[open_interest_message_at] == open_interest_message_written.instrument_number[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.open_interest[open_interest_message_at] == open_interest_message_written.open_interest[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Derivatives Market Trades Message: 43 bytes ----------------------------- */

/* Contains information on any MexDer accepted transaction. */
typedef DerivativesMarketTradesMessage {
  byte instrument_number[4];
  byte trade_time[8];
  byte volume[4];
  byte price_rate[8];
  byte concertation_type;
  byte trade_number[4];
  byte operation_type;
  byte amount[8];
  byte parent_trade_number[4];
  byte leg_type
};

int derivatives_market_trades_message_at;

/* every byte of Derivatives Market Trades Message set to one value */
inline fill_derivatives_market_trades_message(derivatives_market_trades_message_record, derivatives_market_trades_message_value) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.volume[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.concertation_type = derivatives_market_trades_message_value;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.operation_type = derivatives_market_trades_message_value;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at] = derivatives_market_trades_message_value; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.leg_type = derivatives_market_trades_message_value;
  skip
}

/* each byte of Derivatives Market Trades Message set to where it lies, so a field read out of place says so */
inline ramp_derivatives_market_trades_message(derivatives_market_trades_message_record, derivatives_market_trades_message_base) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 0 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 4 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.volume[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 12 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 16 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.concertation_type = (derivatives_market_trades_message_base + 24 + 1) % 256;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 25 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.operation_type = (derivatives_market_trades_message_base + 29 + 1) % 256;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 30 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at] = (derivatives_market_trades_message_base + 38 + derivatives_market_trades_message_at + 1) % 256; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.leg_type = (derivatives_market_trades_message_base + 42 + 1) % 256;
  skip
}

/* Derivatives Market Trades Message to the wire, 43 bytes from where the cursor stands */
inline encode_derivatives_market_trades_message(derivatives_market_trades_message_record) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> wire[at] = derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.volume[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> wire[at] = derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = derivatives_market_trades_message_record.concertation_type; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = derivatives_market_trades_message_record.operation_type; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> wire[at] = derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> wire[at] = derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = derivatives_market_trades_message_record.leg_type; at = at + 1;
  skip
}

/* Derivatives Market Trades Message off the wire, 43 bytes from where the cursor stands */
inline decode_derivatives_market_trades_message(derivatives_market_trades_message_record) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.instrument_number[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.trade_time[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.volume[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.price_rate[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.concertation_type = wire[at]; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.trade_number[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.operation_type = wire[at]; at = at + 1;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> derivatives_market_trades_message_record.amount[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> derivatives_market_trades_message_record.parent_trade_number[derivatives_market_trades_message_at] = wire[at]; at = at + 1; derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_record.leg_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Derivatives Market Trades Message is what was written, byte for byte */
inline equal_derivatives_market_trades_message(derivatives_market_trades_message_read, derivatives_market_trades_message_written) {
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.instrument_number[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.instrument_number[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> assert(derivatives_market_trades_message_read.trade_time[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.trade_time[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.volume[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.volume[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> assert(derivatives_market_trades_message_read.price_rate[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.price_rate[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  assert(derivatives_market_trades_message_read.concertation_type == derivatives_market_trades_message_written.concertation_type);
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.trade_number[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.trade_number[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  assert(derivatives_market_trades_message_read.operation_type == derivatives_market_trades_message_written.operation_type);
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 8 -> assert(derivatives_market_trades_message_read.amount[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.amount[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  derivatives_market_trades_message_at = 0;
  do
  :: derivatives_market_trades_message_at < 4 -> assert(derivatives_market_trades_message_read.parent_trade_number[derivatives_market_trades_message_at] == derivatives_market_trades_message_written.parent_trade_number[derivatives_market_trades_message_at]); derivatives_market_trades_message_at = derivatives_market_trades_message_at + 1
  :: else -> break
  od;
  assert(derivatives_market_trades_message_read.leg_type == derivatives_market_trades_message_written.leg_type);
  skip
}

/* ---- Statistics Of Instruments Message: 44 bytes ----------------------------- */

/* Update message from derivatives statistics sent each time there is an update on the trading floor at any level price. */
typedef StatisticsOfInstrumentsMessage {
  byte instrument_number[4];
  byte previous_settlement_price[8];
  byte opening_price[8];
  byte max_price_of_the_day[8];
  byte lower_price_of_the_day[8];
  byte last_price_of_the_day[8]
};

int statistics_of_instruments_message_at;

/* every byte of Statistics Of Instruments Message set to one value */
inline fill_statistics_of_instruments_message(statistics_of_instruments_message_record, statistics_of_instruments_message_value) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at] = statistics_of_instruments_message_value; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Of Instruments Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_of_instruments_message(statistics_of_instruments_message_record, statistics_of_instruments_message_base) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 0 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 4 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 12 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 20 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 28 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at] = (statistics_of_instruments_message_base + 36 + statistics_of_instruments_message_at + 1) % 256; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Of Instruments Message to the wire, 44 bytes from where the cursor stands */
inline encode_statistics_of_instruments_message(statistics_of_instruments_message_record) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> wire[at] = statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> wire[at] = statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Of Instruments Message off the wire, 44 bytes from where the cursor stands */
inline decode_statistics_of_instruments_message(statistics_of_instruments_message_record) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> statistics_of_instruments_message_record.instrument_number[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.previous_settlement_price[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.opening_price[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.max_price_of_the_day[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.lower_price_of_the_day[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> statistics_of_instruments_message_record.last_price_of_the_day[statistics_of_instruments_message_at] = wire[at]; at = at + 1; statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Of Instruments Message is what was written, byte for byte */
inline equal_statistics_of_instruments_message(statistics_of_instruments_message_read, statistics_of_instruments_message_written) {
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 4 -> assert(statistics_of_instruments_message_read.instrument_number[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.instrument_number[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.previous_settlement_price[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.previous_settlement_price[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.opening_price[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.opening_price[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.max_price_of_the_day[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.max_price_of_the_day[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.lower_price_of_the_day[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.lower_price_of_the_day[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
  :: else -> break
  od;
  statistics_of_instruments_message_at = 0;
  do
  :: statistics_of_instruments_message_at < 8 -> assert(statistics_of_instruments_message_read.last_price_of_the_day[statistics_of_instruments_message_at] == statistics_of_instruments_message_written.last_price_of_the_day[statistics_of_instruments_message_at]); statistics_of_instruments_message_at = statistics_of_instruments_message_at + 1
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

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 8);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 8);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Derivatives Market Trades Message: encoded, read back, and compared */
proctype check_derivatives_market_trades_message() {
  DerivativesMarketTradesMessage derivatives_market_trades_message_sent;
  DerivativesMarketTradesMessage derivatives_market_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_derivatives_market_trades_message(derivatives_market_trades_message_sent, 0)
  :: pattern == 1 -> fill_derivatives_market_trades_message(derivatives_market_trades_message_sent, 32)
  :: pattern == 2 -> fill_derivatives_market_trades_message(derivatives_market_trades_message_sent, 255)
  :: else -> ramp_derivatives_market_trades_message(derivatives_market_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_derivatives_market_trades_message(derivatives_market_trades_message_sent);
    assert(at == 43);
    at = 0;
    decode_derivatives_market_trades_message(derivatives_market_trades_message_got);
    assert(at == 43);
    equal_derivatives_market_trades_message(derivatives_market_trades_message_got, derivatives_market_trades_message_sent)
  }
}

/* Statistics Of Instruments Message: encoded, read back, and compared */
proctype check_statistics_of_instruments_message() {
  StatisticsOfInstrumentsMessage statistics_of_instruments_message_sent;
  StatisticsOfInstrumentsMessage statistics_of_instruments_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_of_instruments_message(statistics_of_instruments_message_sent, 0)
  :: pattern == 1 -> fill_statistics_of_instruments_message(statistics_of_instruments_message_sent, 32)
  :: pattern == 2 -> fill_statistics_of_instruments_message(statistics_of_instruments_message_sent, 255)
  :: else -> ramp_statistics_of_instruments_message(statistics_of_instruments_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_of_instruments_message(statistics_of_instruments_message_sent);
    assert(at == 44);
    at = 0;
    decode_statistics_of_instruments_message(statistics_of_instruments_message_got);
    assert(at == 44);
    equal_statistics_of_instruments_message(statistics_of_instruments_message_got, statistics_of_instruments_message_sent)
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
  :: run check_open_interest_message()
  :: run check_derivatives_market_trades_message()
  :: run check_statistics_of_instruments_message()
  fi
}
