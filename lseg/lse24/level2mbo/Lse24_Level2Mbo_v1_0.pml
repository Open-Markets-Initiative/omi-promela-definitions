/*
 * London Stock Exchange Level 2 MBO
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 74

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Unit Header: 8 bytes ---------------------------------------------------- */

typedef UnitHeader {
  byte length[2];
  byte message_count;
  byte market_data_group;
  byte sequence_number[4]
};

int unit_header_at;

/* every byte of Unit Header set to one value */
inline fill_unit_header(unit_header_record, unit_header_value) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = unit_header_value; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = unit_header_value;
  unit_header_record.market_data_group = unit_header_value;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = unit_header_value; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Header set to where it lies, so a field read out of place says so */
inline ramp_unit_header(unit_header_record, unit_header_base) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = (unit_header_base + 0 + unit_header_at + 1) % 256; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = (unit_header_base + 2 + 1) % 256;
  unit_header_record.market_data_group = (unit_header_base + 3 + 1) % 256;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = (unit_header_base + 4 + unit_header_at + 1) % 256; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Header to the wire, 8 bytes from where the cursor stands */
inline encode_unit_header(unit_header_record) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> wire[at] = unit_header_record.length[unit_header_at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  wire[at] = unit_header_record.message_count; at = at + 1;
  wire[at] = unit_header_record.market_data_group; at = at + 1;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> wire[at] = unit_header_record.sequence_number[unit_header_at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Header off the wire, 8 bytes from where the cursor stands */
inline decode_unit_header(unit_header_record) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> unit_header_record.length[unit_header_at] = wire[at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  unit_header_record.message_count = wire[at]; at = at + 1;
  unit_header_record.market_data_group = wire[at]; at = at + 1;
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> unit_header_record.sequence_number[unit_header_at] = wire[at]; at = at + 1; unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Header is what was written, byte for byte */
inline equal_unit_header(unit_header_read, unit_header_written) {
  unit_header_at = 0;
  do
  :: unit_header_at < 2 -> assert(unit_header_read.length[unit_header_at] == unit_header_written.length[unit_header_at]); unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  assert(unit_header_read.message_count == unit_header_written.message_count);
  assert(unit_header_read.market_data_group == unit_header_written.market_data_group);
  unit_header_at = 0;
  do
  :: unit_header_at < 4 -> assert(unit_header_read.sequence_number[unit_header_at] == unit_header_written.sequence_number[unit_header_at]); unit_header_at = unit_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Gtp Udp Message Header */
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

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* Sent to indicate the start and end of the day. */
typedef SystemEventMessage {
  byte timestamp[8];
  byte event_code;
  byte source_venue[2]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = (system_event_message_base + 9 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.source_venue[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.source_venue[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.source_venue[system_event_message_at] == system_event_message_written.source_venue[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Status Message: 27 bytes ------------------------------------- */

/* Used to communicate scheduled and unscheduled session changes. When sent in the recovery channel, used to indicate the current trading status of an instrument. */
typedef InstrumentStatusMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte trading_status;
  byte session_change_reason;
  byte new_end_time[6];
  byte order_book_type
};

int instrument_status_message_at;

/* every byte of Instrument Status Message set to one value */
inline fill_instrument_status_message(instrument_status_message_record, instrument_status_message_value) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = instrument_status_message_value;
  instrument_status_message_record.session_change_reason = instrument_status_message_value;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = instrument_status_message_value; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = instrument_status_message_value;
  skip
}

/* each byte of Instrument Status Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_status_message(instrument_status_message_record, instrument_status_message_base) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = (instrument_status_message_base + 0 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = (instrument_status_message_base + 8 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = (instrument_status_message_base + 16 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = (instrument_status_message_base + 18 + 1) % 256;
  instrument_status_message_record.session_change_reason = (instrument_status_message_base + 19 + 1) % 256;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = (instrument_status_message_base + 20 + instrument_status_message_at + 1) % 256; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = (instrument_status_message_base + 26 + 1) % 256;
  skip
}

/* Instrument Status Message to the wire, 27 bytes from where the cursor stands */
inline encode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> wire[at] = instrument_status_message_record.timestamp[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> wire[at] = instrument_status_message_record.instrument[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> wire[at] = instrument_status_message_record.source_venue[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_message_record.trading_status; at = at + 1;
  wire[at] = instrument_status_message_record.session_change_reason; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> wire[at] = instrument_status_message_record.new_end_time[instrument_status_message_at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_message_record.order_book_type; at = at + 1;
  skip
}

/* Instrument Status Message off the wire, 27 bytes from where the cursor stands */
inline decode_instrument_status_message(instrument_status_message_record) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.timestamp[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> instrument_status_message_record.instrument[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> instrument_status_message_record.source_venue[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.trading_status = wire[at]; at = at + 1;
  instrument_status_message_record.session_change_reason = wire[at]; at = at + 1;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> instrument_status_message_record.new_end_time[instrument_status_message_at] = wire[at]; at = at + 1; instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_record.order_book_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Status Message is what was written, byte for byte */
inline equal_instrument_status_message(instrument_status_message_read, instrument_status_message_written) {
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> assert(instrument_status_message_read.timestamp[instrument_status_message_at] == instrument_status_message_written.timestamp[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 8 -> assert(instrument_status_message_read.instrument[instrument_status_message_at] == instrument_status_message_written.instrument[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 2 -> assert(instrument_status_message_read.source_venue[instrument_status_message_at] == instrument_status_message_written.source_venue[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_status_message_read.trading_status == instrument_status_message_written.trading_status);
  assert(instrument_status_message_read.session_change_reason == instrument_status_message_written.session_change_reason);
  instrument_status_message_at = 0;
  do
  :: instrument_status_message_at < 6 -> assert(instrument_status_message_read.new_end_time[instrument_status_message_at] == instrument_status_message_written.new_end_time[instrument_status_message_at]); instrument_status_message_at = instrument_status_message_at + 1
  :: else -> break
  od;
  assert(instrument_status_message_read.order_book_type == instrument_status_message_written.order_book_type);
  skip
}

/* ---- Add Order Mbo Message: 64 bytes ----------------------------------------- */

/* Indicates the first order of a given side of an MBO snapshot. */
typedef AddOrderMboMessage {
  byte timestamp[8];
  byte order_id[8];
  byte side;
  byte size[8];
  byte instrument[8];
  byte price[8];
  byte reserved_8[8];
  byte source_venue[2];
  byte order_book_type;
  byte participant[11];
  byte depth
};

int add_order_mbo_message_at;

/* every byte of Add Order Mbo Message set to one value */
inline fill_add_order_mbo_message(add_order_mbo_message_record, add_order_mbo_message_value) {
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.timestamp[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.order_id[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.side = add_order_mbo_message_value;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.size[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.instrument[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.price[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.reserved_8[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 2 -> add_order_mbo_message_record.source_venue[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.order_book_type = add_order_mbo_message_value;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 11 -> add_order_mbo_message_record.participant[add_order_mbo_message_at] = add_order_mbo_message_value; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.depth = add_order_mbo_message_value;
  skip
}

/* each byte of Add Order Mbo Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_mbo_message(add_order_mbo_message_record, add_order_mbo_message_base) {
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.timestamp[add_order_mbo_message_at] = (add_order_mbo_message_base + 0 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.order_id[add_order_mbo_message_at] = (add_order_mbo_message_base + 8 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.side = (add_order_mbo_message_base + 16 + 1) % 256;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.size[add_order_mbo_message_at] = (add_order_mbo_message_base + 17 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.instrument[add_order_mbo_message_at] = (add_order_mbo_message_base + 25 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.price[add_order_mbo_message_at] = (add_order_mbo_message_base + 33 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.reserved_8[add_order_mbo_message_at] = (add_order_mbo_message_base + 41 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 2 -> add_order_mbo_message_record.source_venue[add_order_mbo_message_at] = (add_order_mbo_message_base + 49 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.order_book_type = (add_order_mbo_message_base + 51 + 1) % 256;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 11 -> add_order_mbo_message_record.participant[add_order_mbo_message_at] = (add_order_mbo_message_base + 52 + add_order_mbo_message_at + 1) % 256; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.depth = (add_order_mbo_message_base + 63 + 1) % 256;
  skip
}

/* Add Order Mbo Message to the wire, 64 bytes from where the cursor stands */
inline encode_add_order_mbo_message(add_order_mbo_message_record) {
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> wire[at] = add_order_mbo_message_record.timestamp[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> wire[at] = add_order_mbo_message_record.order_id[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_mbo_message_record.side; at = at + 1;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> wire[at] = add_order_mbo_message_record.size[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> wire[at] = add_order_mbo_message_record.instrument[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> wire[at] = add_order_mbo_message_record.price[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> wire[at] = add_order_mbo_message_record.reserved_8[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 2 -> wire[at] = add_order_mbo_message_record.source_venue[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_mbo_message_record.order_book_type; at = at + 1;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 11 -> wire[at] = add_order_mbo_message_record.participant[add_order_mbo_message_at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_mbo_message_record.depth; at = at + 1;
  skip
}

/* Add Order Mbo Message off the wire, 64 bytes from where the cursor stands */
inline decode_add_order_mbo_message(add_order_mbo_message_record) {
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.timestamp[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.order_id[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.side = wire[at]; at = at + 1;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.size[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.instrument[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.price[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> add_order_mbo_message_record.reserved_8[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 2 -> add_order_mbo_message_record.source_venue[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.order_book_type = wire[at]; at = at + 1;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 11 -> add_order_mbo_message_record.participant[add_order_mbo_message_at] = wire[at]; at = at + 1; add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_record.depth = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Mbo Message is what was written, byte for byte */
inline equal_add_order_mbo_message(add_order_mbo_message_read, add_order_mbo_message_written) {
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> assert(add_order_mbo_message_read.timestamp[add_order_mbo_message_at] == add_order_mbo_message_written.timestamp[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> assert(add_order_mbo_message_read.order_id[add_order_mbo_message_at] == add_order_mbo_message_written.order_id[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  assert(add_order_mbo_message_read.side == add_order_mbo_message_written.side);
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> assert(add_order_mbo_message_read.size[add_order_mbo_message_at] == add_order_mbo_message_written.size[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> assert(add_order_mbo_message_read.instrument[add_order_mbo_message_at] == add_order_mbo_message_written.instrument[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> assert(add_order_mbo_message_read.price[add_order_mbo_message_at] == add_order_mbo_message_written.price[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 8 -> assert(add_order_mbo_message_read.reserved_8[add_order_mbo_message_at] == add_order_mbo_message_written.reserved_8[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 2 -> assert(add_order_mbo_message_read.source_venue[add_order_mbo_message_at] == add_order_mbo_message_written.source_venue[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  assert(add_order_mbo_message_read.order_book_type == add_order_mbo_message_written.order_book_type);
  add_order_mbo_message_at = 0;
  do
  :: add_order_mbo_message_at < 11 -> assert(add_order_mbo_message_read.participant[add_order_mbo_message_at] == add_order_mbo_message_written.participant[add_order_mbo_message_at]); add_order_mbo_message_at = add_order_mbo_message_at + 1
  :: else -> break
  od;
  assert(add_order_mbo_message_read.depth == add_order_mbo_message_written.depth);
  skip
}

/* ---- Add Order Short Mbo Message: 43 bytes ----------------------------------- */

/* Used to indicate individual orders of an MBO snapshot. */
typedef AddOrderShortMboMessage {
  byte order_id[8];
  byte size[8];
  byte price[8];
  byte reserved_8[8];
  byte participant[11]
};

int add_order_short_mbo_message_at;

/* every byte of Add Order Short Mbo Message set to one value */
inline fill_add_order_short_mbo_message(add_order_short_mbo_message_record, add_order_short_mbo_message_value) {
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.order_id[add_order_short_mbo_message_at] = add_order_short_mbo_message_value; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.size[add_order_short_mbo_message_at] = add_order_short_mbo_message_value; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.price[add_order_short_mbo_message_at] = add_order_short_mbo_message_value; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.reserved_8[add_order_short_mbo_message_at] = add_order_short_mbo_message_value; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 11 -> add_order_short_mbo_message_record.participant[add_order_short_mbo_message_at] = add_order_short_mbo_message_value; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Short Mbo Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_mbo_message(add_order_short_mbo_message_record, add_order_short_mbo_message_base) {
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.order_id[add_order_short_mbo_message_at] = (add_order_short_mbo_message_base + 0 + add_order_short_mbo_message_at + 1) % 256; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.size[add_order_short_mbo_message_at] = (add_order_short_mbo_message_base + 8 + add_order_short_mbo_message_at + 1) % 256; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.price[add_order_short_mbo_message_at] = (add_order_short_mbo_message_base + 16 + add_order_short_mbo_message_at + 1) % 256; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.reserved_8[add_order_short_mbo_message_at] = (add_order_short_mbo_message_base + 24 + add_order_short_mbo_message_at + 1) % 256; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 11 -> add_order_short_mbo_message_record.participant[add_order_short_mbo_message_at] = (add_order_short_mbo_message_base + 32 + add_order_short_mbo_message_at + 1) % 256; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Mbo Message to the wire, 43 bytes from where the cursor stands */
inline encode_add_order_short_mbo_message(add_order_short_mbo_message_record) {
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> wire[at] = add_order_short_mbo_message_record.order_id[add_order_short_mbo_message_at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> wire[at] = add_order_short_mbo_message_record.size[add_order_short_mbo_message_at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> wire[at] = add_order_short_mbo_message_record.price[add_order_short_mbo_message_at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> wire[at] = add_order_short_mbo_message_record.reserved_8[add_order_short_mbo_message_at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 11 -> wire[at] = add_order_short_mbo_message_record.participant[add_order_short_mbo_message_at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Mbo Message off the wire, 43 bytes from where the cursor stands */
inline decode_add_order_short_mbo_message(add_order_short_mbo_message_record) {
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.order_id[add_order_short_mbo_message_at] = wire[at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.size[add_order_short_mbo_message_at] = wire[at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.price[add_order_short_mbo_message_at] = wire[at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> add_order_short_mbo_message_record.reserved_8[add_order_short_mbo_message_at] = wire[at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 11 -> add_order_short_mbo_message_record.participant[add_order_short_mbo_message_at] = wire[at]; at = at + 1; add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Short Mbo Message is what was written, byte for byte */
inline equal_add_order_short_mbo_message(add_order_short_mbo_message_read, add_order_short_mbo_message_written) {
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> assert(add_order_short_mbo_message_read.order_id[add_order_short_mbo_message_at] == add_order_short_mbo_message_written.order_id[add_order_short_mbo_message_at]); add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> assert(add_order_short_mbo_message_read.size[add_order_short_mbo_message_at] == add_order_short_mbo_message_written.size[add_order_short_mbo_message_at]); add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> assert(add_order_short_mbo_message_read.price[add_order_short_mbo_message_at] == add_order_short_mbo_message_written.price[add_order_short_mbo_message_at]); add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 8 -> assert(add_order_short_mbo_message_read.reserved_8[add_order_short_mbo_message_at] == add_order_short_mbo_message_written.reserved_8[add_order_short_mbo_message_at]); add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  add_order_short_mbo_message_at = 0;
  do
  :: add_order_short_mbo_message_at < 11 -> assert(add_order_short_mbo_message_read.participant[add_order_short_mbo_message_at] == add_order_short_mbo_message_written.participant[add_order_short_mbo_message_at]); add_order_short_mbo_message_at = add_order_short_mbo_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Clear Message: 19 bytes -------------------------------------- */

/* Sent to instruct recipients to remove all orders from the order book for the specified instrument. */
typedef OrderBookClearMessage {
  byte timestamp[8];
  byte source_venue[2];
  byte instrument[8];
  byte order_book_type
};

int order_book_clear_message_at;

/* every byte of Order Book Clear Message set to one value */
inline fill_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_value) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.timestamp[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.source_venue[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.instrument[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.order_book_type = order_book_clear_message_value;
  skip
}

/* each byte of Order Book Clear Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_base) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.timestamp[order_book_clear_message_at] = (order_book_clear_message_base + 0 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.source_venue[order_book_clear_message_at] = (order_book_clear_message_base + 8 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.instrument[order_book_clear_message_at] = (order_book_clear_message_base + 10 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.order_book_type = (order_book_clear_message_base + 18 + 1) % 256;
  skip
}

/* Order Book Clear Message to the wire, 19 bytes from where the cursor stands */
inline encode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> wire[at] = order_book_clear_message_record.timestamp[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> wire[at] = order_book_clear_message_record.source_venue[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> wire[at] = order_book_clear_message_record.instrument[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_clear_message_record.order_book_type; at = at + 1;
  skip
}

/* Order Book Clear Message off the wire, 19 bytes from where the cursor stands */
inline decode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.timestamp[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> order_book_clear_message_record.source_venue[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.instrument[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_record.order_book_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Clear Message is what was written, byte for byte */
inline equal_order_book_clear_message(order_book_clear_message_read, order_book_clear_message_written) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> assert(order_book_clear_message_read.timestamp[order_book_clear_message_at] == order_book_clear_message_written.timestamp[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 2 -> assert(order_book_clear_message_read.source_venue[order_book_clear_message_at] == order_book_clear_message_written.source_venue[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> assert(order_book_clear_message_read.instrument[order_book_clear_message_at] == order_book_clear_message_written.instrument[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  assert(order_book_clear_message_read.order_book_type == order_book_clear_message_written.order_book_type);
  skip
}

/* ---- Statistics Message: 74 bytes -------------------------------------------- */

/* Contains a set of statistics that are updated frequently, usually as a result of executions. */
typedef StatisticsMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte volume[8];
  byte volume_on_book_only[8];
  byte vwap[8];
  byte vwap_on_book_only[8];
  byte number_of_trades[4];
  byte number_of_trades_on_book_only[4];
  byte turnover[8];
  byte turnover_on_book_only[8]
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.timestamp[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.instrument[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> statistics_message_record.source_venue[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover_on_book_only[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.timestamp[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.instrument[statistics_message_at] = (statistics_message_base + 8 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> statistics_message_record.source_venue[statistics_message_at] = (statistics_message_base + 16 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume[statistics_message_at] = (statistics_message_base + 18 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume_on_book_only[statistics_message_at] = (statistics_message_base + 26 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap[statistics_message_at] = (statistics_message_base + 34 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap_on_book_only[statistics_message_at] = (statistics_message_base + 42 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades[statistics_message_at] = (statistics_message_base + 50 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades_on_book_only[statistics_message_at] = (statistics_message_base + 54 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = (statistics_message_base + 58 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover_on_book_only[statistics_message_at] = (statistics_message_base + 66 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message to the wire, 74 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.timestamp[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.instrument[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> wire[at] = statistics_message_record.source_venue[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.volume[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.volume_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.vwap[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.vwap_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.number_of_trades[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> wire[at] = statistics_message_record.number_of_trades_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.turnover[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.turnover_on_book_only[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Statistics Message off the wire, 74 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.timestamp[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.instrument[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> statistics_message_record.source_venue[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.volume_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.vwap_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> statistics_message_record.number_of_trades_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.turnover_on_book_only[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.timestamp[statistics_message_at] == statistics_message_written.timestamp[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.instrument[statistics_message_at] == statistics_message_written.instrument[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 2 -> assert(statistics_message_read.source_venue[statistics_message_at] == statistics_message_written.source_venue[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.volume[statistics_message_at] == statistics_message_written.volume[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.volume_on_book_only[statistics_message_at] == statistics_message_written.volume_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.vwap[statistics_message_at] == statistics_message_written.vwap[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.vwap_on_book_only[statistics_message_at] == statistics_message_written.vwap_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.number_of_trades[statistics_message_at] == statistics_message_written.number_of_trades[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 4 -> assert(statistics_message_read.number_of_trades_on_book_only[statistics_message_at] == statistics_message_written.number_of_trades_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.turnover[statistics_message_at] == statistics_message_written.turnover[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.turnover_on_book_only[statistics_message_at] == statistics_message_written.turnover_on_book_only[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Update Message: 47 bytes ------------------------------------- */

/* Contains a set of statistics that are not updated frequently. */
typedef StatisticsUpdateMessage {
  byte timestamp[8];
  byte instrument[8];
  byte source_venue[2];
  byte statistic_type[2];
  byte statistic_price[8];
  byte statistic_size[8];
  byte auction_type;
  byte imbalance_quantity[8];
  byte auction_info;
  byte opening_closing_price_indicator
};

int statistics_update_message_at;

/* every byte of Statistics Update Message set to one value */
inline fill_statistics_update_message(statistics_update_message_record, statistics_update_message_value) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.timestamp[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.instrument[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.source_venue[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.statistic_type[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_price[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_size[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_type = statistics_update_message_value;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.imbalance_quantity[statistics_update_message_at] = statistics_update_message_value; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_info = statistics_update_message_value;
  statistics_update_message_record.opening_closing_price_indicator = statistics_update_message_value;
  skip
}

/* each byte of Statistics Update Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_update_message(statistics_update_message_record, statistics_update_message_base) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.timestamp[statistics_update_message_at] = (statistics_update_message_base + 0 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.instrument[statistics_update_message_at] = (statistics_update_message_base + 8 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.source_venue[statistics_update_message_at] = (statistics_update_message_base + 16 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.statistic_type[statistics_update_message_at] = (statistics_update_message_base + 18 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_price[statistics_update_message_at] = (statistics_update_message_base + 20 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_size[statistics_update_message_at] = (statistics_update_message_base + 28 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_type = (statistics_update_message_base + 36 + 1) % 256;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.imbalance_quantity[statistics_update_message_at] = (statistics_update_message_base + 37 + statistics_update_message_at + 1) % 256; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_info = (statistics_update_message_base + 45 + 1) % 256;
  statistics_update_message_record.opening_closing_price_indicator = (statistics_update_message_base + 46 + 1) % 256;
  skip
}

/* Statistics Update Message to the wire, 47 bytes from where the cursor stands */
inline encode_statistics_update_message(statistics_update_message_record) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.timestamp[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.instrument[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> wire[at] = statistics_update_message_record.source_venue[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> wire[at] = statistics_update_message_record.statistic_type[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.statistic_price[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.statistic_size[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_update_message_record.auction_type; at = at + 1;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> wire[at] = statistics_update_message_record.imbalance_quantity[statistics_update_message_at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_update_message_record.auction_info; at = at + 1;
  wire[at] = statistics_update_message_record.opening_closing_price_indicator; at = at + 1;
  skip
}

/* Statistics Update Message off the wire, 47 bytes from where the cursor stands */
inline decode_statistics_update_message(statistics_update_message_record) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.timestamp[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.instrument[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.source_venue[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> statistics_update_message_record.statistic_type[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_price[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.statistic_size[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_type = wire[at]; at = at + 1;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> statistics_update_message_record.imbalance_quantity[statistics_update_message_at] = wire[at]; at = at + 1; statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_record.auction_info = wire[at]; at = at + 1;
  statistics_update_message_record.opening_closing_price_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Statistics Update Message is what was written, byte for byte */
inline equal_statistics_update_message(statistics_update_message_read, statistics_update_message_written) {
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.timestamp[statistics_update_message_at] == statistics_update_message_written.timestamp[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.instrument[statistics_update_message_at] == statistics_update_message_written.instrument[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> assert(statistics_update_message_read.source_venue[statistics_update_message_at] == statistics_update_message_written.source_venue[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 2 -> assert(statistics_update_message_read.statistic_type[statistics_update_message_at] == statistics_update_message_written.statistic_type[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.statistic_price[statistics_update_message_at] == statistics_update_message_written.statistic_price[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.statistic_size[statistics_update_message_at] == statistics_update_message_written.statistic_size[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  assert(statistics_update_message_read.auction_type == statistics_update_message_written.auction_type);
  statistics_update_message_at = 0;
  do
  :: statistics_update_message_at < 8 -> assert(statistics_update_message_read.imbalance_quantity[statistics_update_message_at] == statistics_update_message_written.imbalance_quantity[statistics_update_message_at]); statistics_update_message_at = statistics_update_message_at + 1
  :: else -> break
  od;
  assert(statistics_update_message_read.auction_info == statistics_update_message_written.auction_info);
  assert(statistics_update_message_read.opening_closing_price_indicator == statistics_update_message_written.opening_closing_price_indicator);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Unit Header: encoded, read back, and compared */
proctype check_unit_header() {
  UnitHeader unit_header_sent;
  UnitHeader unit_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_header(unit_header_sent, 0)
  :: pattern == 1 -> fill_unit_header(unit_header_sent, 32)
  :: pattern == 2 -> fill_unit_header(unit_header_sent, 255)
  :: else -> ramp_unit_header(unit_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_header(unit_header_sent);
    assert(at == 8);
    at = 0;
    decode_unit_header(unit_header_got);
    assert(at == 8);
    equal_unit_header(unit_header_got, unit_header_sent)
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

/* System Event Message: encoded, read back, and compared */
proctype check_system_event_message() {
  SystemEventMessage system_event_message_sent;
  SystemEventMessage system_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_message(system_event_message_sent, 0)
  :: pattern == 1 -> fill_system_event_message(system_event_message_sent, 32)
  :: pattern == 2 -> fill_system_event_message(system_event_message_sent, 255)
  :: else -> ramp_system_event_message(system_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_message(system_event_message_sent);
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Instrument Status Message: encoded, read back, and compared */
proctype check_instrument_status_message() {
  InstrumentStatusMessage instrument_status_message_sent;
  InstrumentStatusMessage instrument_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_status_message(instrument_status_message_sent, 0)
  :: pattern == 1 -> fill_instrument_status_message(instrument_status_message_sent, 32)
  :: pattern == 2 -> fill_instrument_status_message(instrument_status_message_sent, 255)
  :: else -> ramp_instrument_status_message(instrument_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_status_message(instrument_status_message_sent);
    assert(at == 27);
    at = 0;
    decode_instrument_status_message(instrument_status_message_got);
    assert(at == 27);
    equal_instrument_status_message(instrument_status_message_got, instrument_status_message_sent)
  }
}

/* Add Order Mbo Message: encoded, read back, and compared */
proctype check_add_order_mbo_message() {
  AddOrderMboMessage add_order_mbo_message_sent;
  AddOrderMboMessage add_order_mbo_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_mbo_message(add_order_mbo_message_sent, 0)
  :: pattern == 1 -> fill_add_order_mbo_message(add_order_mbo_message_sent, 32)
  :: pattern == 2 -> fill_add_order_mbo_message(add_order_mbo_message_sent, 255)
  :: else -> ramp_add_order_mbo_message(add_order_mbo_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_mbo_message(add_order_mbo_message_sent);
    assert(at == 64);
    at = 0;
    decode_add_order_mbo_message(add_order_mbo_message_got);
    assert(at == 64);
    equal_add_order_mbo_message(add_order_mbo_message_got, add_order_mbo_message_sent)
  }
}

/* Add Order Short Mbo Message: encoded, read back, and compared */
proctype check_add_order_short_mbo_message() {
  AddOrderShortMboMessage add_order_short_mbo_message_sent;
  AddOrderShortMboMessage add_order_short_mbo_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_mbo_message(add_order_short_mbo_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_mbo_message(add_order_short_mbo_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_mbo_message(add_order_short_mbo_message_sent, 255)
  :: else -> ramp_add_order_short_mbo_message(add_order_short_mbo_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_mbo_message(add_order_short_mbo_message_sent);
    assert(at == 43);
    at = 0;
    decode_add_order_short_mbo_message(add_order_short_mbo_message_got);
    assert(at == 43);
    equal_add_order_short_mbo_message(add_order_short_mbo_message_got, add_order_short_mbo_message_sent)
  }
}

/* Order Book Clear Message: encoded, read back, and compared */
proctype check_order_book_clear_message() {
  OrderBookClearMessage order_book_clear_message_sent;
  OrderBookClearMessage order_book_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_clear_message(order_book_clear_message_sent, 0)
  :: pattern == 1 -> fill_order_book_clear_message(order_book_clear_message_sent, 32)
  :: pattern == 2 -> fill_order_book_clear_message(order_book_clear_message_sent, 255)
  :: else -> ramp_order_book_clear_message(order_book_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_clear_message(order_book_clear_message_sent);
    assert(at == 19);
    at = 0;
    decode_order_book_clear_message(order_book_clear_message_got);
    assert(at == 19);
    equal_order_book_clear_message(order_book_clear_message_got, order_book_clear_message_sent)
  }
}

/* Statistics Message: encoded, read back, and compared */
proctype check_statistics_message() {
  StatisticsMessage statistics_message_sent;
  StatisticsMessage statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_message(statistics_message_sent, 0)
  :: pattern == 1 -> fill_statistics_message(statistics_message_sent, 32)
  :: pattern == 2 -> fill_statistics_message(statistics_message_sent, 255)
  :: else -> ramp_statistics_message(statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_message(statistics_message_sent);
    assert(at == 74);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 74);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
  }
}

/* Statistics Update Message: encoded, read back, and compared */
proctype check_statistics_update_message() {
  StatisticsUpdateMessage statistics_update_message_sent;
  StatisticsUpdateMessage statistics_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_update_message(statistics_update_message_sent, 0)
  :: pattern == 1 -> fill_statistics_update_message(statistics_update_message_sent, 32)
  :: pattern == 2 -> fill_statistics_update_message(statistics_update_message_sent, 255)
  :: else -> ramp_statistics_update_message(statistics_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_update_message(statistics_update_message_sent);
    assert(at == 47);
    at = 0;
    decode_statistics_update_message(statistics_update_message_got);
    assert(at == 47);
    equal_statistics_update_message(statistics_update_message_got, statistics_update_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_unit_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_instrument_status_message()
  :: run check_add_order_mbo_message()
  :: run check_add_order_short_mbo_message()
  :: run check_order_book_clear_message()
  :: run check_statistics_message()
  :: run check_statistics_update_message()
  fi
}
