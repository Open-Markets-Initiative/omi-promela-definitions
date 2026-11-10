/*
 * London Stock Exchange Level 2
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
#define WIRE 63

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

/* ---- Message Header: 2 bytes ------------------------------------------------- */

/* Mitch Udp Message Header */
typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Time Message: 4 bytes --------------------------------------------------- */

/* Sent by the server for every second for which at least one application message is generated. */
typedef TimeMessage {
  byte seconds[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.seconds[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.seconds[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.seconds[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.seconds[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.seconds[time_message_at] == time_message_written.seconds[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 5 bytes ------------------------------------------- */

/* Sent to indicate the start and end of the day. */
typedef SystemEventMessage {
  byte nanosecond[4];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanosecond[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanosecond[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 4 + 1) % 256;
  skip
}

/* System Event Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanosecond[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanosecond[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.nanosecond[system_event_message_at] == system_event_message_written.nanosecond[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Symbol Directory Message: 63 bytes -------------------------------------- */

/* Used to disseminate information (symbol, segment, ISIN, underlying, etc.) on each instrument */
typedef SymbolDirectoryMessage {
  byte nanosecond[4];
  byte instrument_id[4];
  byte reserved_a;
  byte reserved_b;
  byte symbol_status;
  byte isin[12];
  byte sedol[12];
  byte segment[6];
  byte underlying[6];
  byte currency[3];
  byte reserved_byte;
  byte reserved_4[4];
  byte previous_close_price[8]
};

int symbol_directory_message_at;

/* every byte of Symbol Directory Message set to one value */
inline fill_symbol_directory_message(symbol_directory_message_record, symbol_directory_message_value) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.nanosecond[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.instrument_id[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.reserved_a = symbol_directory_message_value;
  symbol_directory_message_record.reserved_b = symbol_directory_message_value;
  symbol_directory_message_record.symbol_status = symbol_directory_message_value;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.isin[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.sedol[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> symbol_directory_message_record.segment[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> symbol_directory_message_record.underlying[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> symbol_directory_message_record.currency[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.reserved_byte = symbol_directory_message_value;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.reserved_4[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.previous_close_price[symbol_directory_message_at] = symbol_directory_message_value; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_directory_message(symbol_directory_message_record, symbol_directory_message_base) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.nanosecond[symbol_directory_message_at] = (symbol_directory_message_base + 0 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.instrument_id[symbol_directory_message_at] = (symbol_directory_message_base + 4 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.reserved_a = (symbol_directory_message_base + 8 + 1) % 256;
  symbol_directory_message_record.reserved_b = (symbol_directory_message_base + 9 + 1) % 256;
  symbol_directory_message_record.symbol_status = (symbol_directory_message_base + 10 + 1) % 256;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.isin[symbol_directory_message_at] = (symbol_directory_message_base + 11 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.sedol[symbol_directory_message_at] = (symbol_directory_message_base + 23 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> symbol_directory_message_record.segment[symbol_directory_message_at] = (symbol_directory_message_base + 35 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> symbol_directory_message_record.underlying[symbol_directory_message_at] = (symbol_directory_message_base + 41 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> symbol_directory_message_record.currency[symbol_directory_message_at] = (symbol_directory_message_base + 47 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.reserved_byte = (symbol_directory_message_base + 50 + 1) % 256;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.reserved_4[symbol_directory_message_at] = (symbol_directory_message_base + 51 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.previous_close_price[symbol_directory_message_at] = (symbol_directory_message_base + 55 + symbol_directory_message_at + 1) % 256; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Directory Message to the wire, 63 bytes from where the cursor stands */
inline encode_symbol_directory_message(symbol_directory_message_record) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> wire[at] = symbol_directory_message_record.nanosecond[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> wire[at] = symbol_directory_message_record.instrument_id[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_directory_message_record.reserved_a; at = at + 1;
  wire[at] = symbol_directory_message_record.reserved_b; at = at + 1;
  wire[at] = symbol_directory_message_record.symbol_status; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> wire[at] = symbol_directory_message_record.isin[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> wire[at] = symbol_directory_message_record.sedol[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> wire[at] = symbol_directory_message_record.segment[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> wire[at] = symbol_directory_message_record.underlying[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> wire[at] = symbol_directory_message_record.currency[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_directory_message_record.reserved_byte; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> wire[at] = symbol_directory_message_record.reserved_4[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> wire[at] = symbol_directory_message_record.previous_close_price[symbol_directory_message_at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Directory Message off the wire, 63 bytes from where the cursor stands */
inline decode_symbol_directory_message(symbol_directory_message_record) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.nanosecond[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.instrument_id[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.reserved_a = wire[at]; at = at + 1;
  symbol_directory_message_record.reserved_b = wire[at]; at = at + 1;
  symbol_directory_message_record.symbol_status = wire[at]; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.isin[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> symbol_directory_message_record.sedol[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> symbol_directory_message_record.segment[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> symbol_directory_message_record.underlying[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> symbol_directory_message_record.currency[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_record.reserved_byte = wire[at]; at = at + 1;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> symbol_directory_message_record.reserved_4[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> symbol_directory_message_record.previous_close_price[symbol_directory_message_at] = wire[at]; at = at + 1; symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Directory Message is what was written, byte for byte */
inline equal_symbol_directory_message(symbol_directory_message_read, symbol_directory_message_written) {
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> assert(symbol_directory_message_read.nanosecond[symbol_directory_message_at] == symbol_directory_message_written.nanosecond[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> assert(symbol_directory_message_read.instrument_id[symbol_directory_message_at] == symbol_directory_message_written.instrument_id[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(symbol_directory_message_read.reserved_a == symbol_directory_message_written.reserved_a);
  assert(symbol_directory_message_read.reserved_b == symbol_directory_message_written.reserved_b);
  assert(symbol_directory_message_read.symbol_status == symbol_directory_message_written.symbol_status);
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> assert(symbol_directory_message_read.isin[symbol_directory_message_at] == symbol_directory_message_written.isin[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 12 -> assert(symbol_directory_message_read.sedol[symbol_directory_message_at] == symbol_directory_message_written.sedol[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> assert(symbol_directory_message_read.segment[symbol_directory_message_at] == symbol_directory_message_written.segment[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 6 -> assert(symbol_directory_message_read.underlying[symbol_directory_message_at] == symbol_directory_message_written.underlying[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 3 -> assert(symbol_directory_message_read.currency[symbol_directory_message_at] == symbol_directory_message_written.currency[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(symbol_directory_message_read.reserved_byte == symbol_directory_message_written.reserved_byte);
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 4 -> assert(symbol_directory_message_read.reserved_4[symbol_directory_message_at] == symbol_directory_message_written.reserved_4[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  symbol_directory_message_at = 0;
  do
  :: symbol_directory_message_at < 8 -> assert(symbol_directory_message_read.previous_close_price[symbol_directory_message_at] == symbol_directory_message_written.previous_close_price[symbol_directory_message_at]); symbol_directory_message_at = symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 24 bytes ---------------------------------------- */

/* Indicates that the displayed portion of an order is fully or partially filled at its displayed price. */
typedef OrderExecutedMessage {
  byte nanosecond[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte trade_match_id[8]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanosecond[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_match_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanosecond[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_match_id[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 24 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanosecond[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.trade_match_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 24 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanosecond[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_match_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.nanosecond[order_executed_message_at] == order_executed_message_written.nanosecond[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.trade_match_id[order_executed_message_at] == order_executed_message_written.trade_match_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Size Message: 37 bytes ------------------------ */

/* Sent if a displayed order is fully or partially filled at a price that is different from its displayed price. */
typedef OrderExecutedWithPriceSizeMessage {
  byte nanosecond[4];
  byte order_id[8];
  byte executed_quantity[4];
  byte display_quantity[4];
  byte trade_match_id[8];
  byte printable;
  byte price[8]
};

int order_executed_with_price_size_message_at;

/* every byte of Order Executed With Price Size Message set to one value */
inline fill_order_executed_with_price_size_message(order_executed_with_price_size_message_record, order_executed_with_price_size_message_value) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.trade_match_id[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_record.printable = order_executed_with_price_size_message_value;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = order_executed_with_price_size_message_value; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed With Price Size Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_size_message(order_executed_with_price_size_message_record, order_executed_with_price_size_message_base) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 0 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 4 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 12 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 16 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.trade_match_id[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 20 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_record.printable = (order_executed_with_price_size_message_base + 28 + 1) % 256;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = (order_executed_with_price_size_message_base + 29 + order_executed_with_price_size_message_at + 1) % 256; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Size Message to the wire, 37 bytes from where the cursor stands */
inline encode_order_executed_with_price_size_message(order_executed_with_price_size_message_record) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> wire[at] = order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.trade_match_id[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_size_message_record.printable; at = at + 1;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> wire[at] = order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Size Message off the wire, 37 bytes from where the cursor stands */
inline decode_order_executed_with_price_size_message(order_executed_with_price_size_message_record) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.nanosecond[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.order_id[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.executed_quantity[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> order_executed_with_price_size_message_record.display_quantity[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.trade_match_id[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_record.printable = wire[at]; at = at + 1;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> order_executed_with_price_size_message_record.price[order_executed_with_price_size_message_at] = wire[at]; at = at + 1; order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed With Price Size Message is what was written, byte for byte */
inline equal_order_executed_with_price_size_message(order_executed_with_price_size_message_read, order_executed_with_price_size_message_written) {
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.nanosecond[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.nanosecond[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.order_id[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.order_id[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.executed_quantity[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.executed_quantity[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 4 -> assert(order_executed_with_price_size_message_read.display_quantity[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.display_quantity[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.trade_match_id[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.trade_match_id[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_size_message_read.printable == order_executed_with_price_size_message_written.printable);
  order_executed_with_price_size_message_at = 0;
  do
  :: order_executed_with_price_size_message_at < 8 -> assert(order_executed_with_price_size_message_read.price[order_executed_with_price_size_message_at] == order_executed_with_price_size_message_written.price[order_executed_with_price_size_message_at]); order_executed_with_price_size_message_at = order_executed_with_price_size_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Info Message: 28 bytes ------------------------------------------ */

/* 9 Used to disseminate the indicative auction price and the tradable quantity and imbalance at this price. */
typedef AuctionInfoMessage {
  byte nanosecond[4];
  byte paired_quantity[4];
  byte reserved_4[4];
  byte reserved_1;
  byte instrument_id[4];
  byte reserved_a;
  byte reserved_b;
  byte price[8];
  byte auction_type
};

int auction_info_message_at;

/* every byte of Auction Info Message set to one value */
inline fill_auction_info_message(auction_info_message_record, auction_info_message_value) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.nanosecond[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.paired_quantity[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.reserved_4[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_1 = auction_info_message_value;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.instrument_id[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_a = auction_info_message_value;
  auction_info_message_record.reserved_b = auction_info_message_value;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> auction_info_message_record.price[auction_info_message_at] = auction_info_message_value; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.auction_type = auction_info_message_value;
  skip
}

/* each byte of Auction Info Message set to where it lies, so a field read out of place says so */
inline ramp_auction_info_message(auction_info_message_record, auction_info_message_base) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.nanosecond[auction_info_message_at] = (auction_info_message_base + 0 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.paired_quantity[auction_info_message_at] = (auction_info_message_base + 4 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.reserved_4[auction_info_message_at] = (auction_info_message_base + 8 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_1 = (auction_info_message_base + 12 + 1) % 256;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.instrument_id[auction_info_message_at] = (auction_info_message_base + 13 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_a = (auction_info_message_base + 17 + 1) % 256;
  auction_info_message_record.reserved_b = (auction_info_message_base + 18 + 1) % 256;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> auction_info_message_record.price[auction_info_message_at] = (auction_info_message_base + 19 + auction_info_message_at + 1) % 256; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.auction_type = (auction_info_message_base + 27 + 1) % 256;
  skip
}

/* Auction Info Message to the wire, 28 bytes from where the cursor stands */
inline encode_auction_info_message(auction_info_message_record) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.nanosecond[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.paired_quantity[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.reserved_4[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.reserved_1; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> wire[at] = auction_info_message_record.instrument_id[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.reserved_a; at = at + 1;
  wire[at] = auction_info_message_record.reserved_b; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> wire[at] = auction_info_message_record.price[auction_info_message_at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_info_message_record.auction_type; at = at + 1;
  skip
}

/* Auction Info Message off the wire, 28 bytes from where the cursor stands */
inline decode_auction_info_message(auction_info_message_record) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.nanosecond[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.paired_quantity[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.reserved_4[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_1 = wire[at]; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> auction_info_message_record.instrument_id[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.reserved_a = wire[at]; at = at + 1;
  auction_info_message_record.reserved_b = wire[at]; at = at + 1;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> auction_info_message_record.price[auction_info_message_at] = wire[at]; at = at + 1; auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_record.auction_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Info Message is what was written, byte for byte */
inline equal_auction_info_message(auction_info_message_read, auction_info_message_written) {
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.nanosecond[auction_info_message_at] == auction_info_message_written.nanosecond[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.paired_quantity[auction_info_message_at] == auction_info_message_written.paired_quantity[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.reserved_4[auction_info_message_at] == auction_info_message_written.reserved_4[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.reserved_1 == auction_info_message_written.reserved_1);
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 4 -> assert(auction_info_message_read.instrument_id[auction_info_message_at] == auction_info_message_written.instrument_id[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.reserved_a == auction_info_message_written.reserved_a);
  assert(auction_info_message_read.reserved_b == auction_info_message_written.reserved_b);
  auction_info_message_at = 0;
  do
  :: auction_info_message_at < 8 -> assert(auction_info_message_read.price[auction_info_message_at] == auction_info_message_written.price[auction_info_message_at]); auction_info_message_at = auction_info_message_at + 1
  :: else -> break
  od;
  assert(auction_info_message_read.auction_type == auction_info_message_written.auction_type);
  skip
}

/* ---- Top Of Book Message: 32 bytes ------------------------------------------- */

/* Used to disseminate top of book changes when the instrument is in a scheduled level 1 only auction. */
typedef TopOfBookMessage {
  byte nanosecond[4];
  byte instrument_id[4];
  byte buy_limit_price[8];
  byte buy_limit_size[4];
  byte sell_limit_price[8];
  byte sell_limit_size[4]
};

int top_of_book_message_at;

/* every byte of Top Of Book Message set to one value */
inline fill_top_of_book_message(top_of_book_message_record, top_of_book_message_value) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.nanosecond[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.instrument_id[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.buy_limit_price[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.buy_limit_size[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.sell_limit_price[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.sell_limit_size[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Top Of Book Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_book_message(top_of_book_message_record, top_of_book_message_base) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.nanosecond[top_of_book_message_at] = (top_of_book_message_base + 0 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.instrument_id[top_of_book_message_at] = (top_of_book_message_base + 4 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.buy_limit_price[top_of_book_message_at] = (top_of_book_message_base + 8 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.buy_limit_size[top_of_book_message_at] = (top_of_book_message_base + 16 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.sell_limit_price[top_of_book_message_at] = (top_of_book_message_base + 20 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.sell_limit_size[top_of_book_message_at] = (top_of_book_message_base + 28 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message to the wire, 32 bytes from where the cursor stands */
inline encode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.nanosecond[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.instrument_id[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.buy_limit_price[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.buy_limit_size[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.sell_limit_price[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.sell_limit_size[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message off the wire, 32 bytes from where the cursor stands */
inline decode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.nanosecond[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.instrument_id[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.buy_limit_price[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.buy_limit_size[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.sell_limit_price[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.sell_limit_size[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Top Of Book Message is what was written, byte for byte */
inline equal_top_of_book_message(top_of_book_message_read, top_of_book_message_written) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.nanosecond[top_of_book_message_at] == top_of_book_message_written.nanosecond[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.instrument_id[top_of_book_message_at] == top_of_book_message_written.instrument_id[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.buy_limit_price[top_of_book_message_at] == top_of_book_message_written.buy_limit_price[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.buy_limit_size[top_of_book_message_at] == top_of_book_message_written.buy_limit_size[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.sell_limit_price[top_of_book_message_at] == top_of_book_message_written.sell_limit_price[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.sell_limit_size[top_of_book_message_at] == top_of_book_message_written.sell_limit_size[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Time Message: encoded, read back, and compared */
proctype check_time_message() {
  TimeMessage time_message_sent;
  TimeMessage time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_message(time_message_sent, 0)
  :: pattern == 1 -> fill_time_message(time_message_sent, 32)
  :: pattern == 2 -> fill_time_message(time_message_sent, 255)
  :: else -> ramp_time_message(time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_message(time_message_sent);
    assert(at == 4);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 4);
    equal_time_message(time_message_got, time_message_sent)
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
    assert(at == 5);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 5);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Symbol Directory Message: encoded, read back, and compared */
proctype check_symbol_directory_message() {
  SymbolDirectoryMessage symbol_directory_message_sent;
  SymbolDirectoryMessage symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_directory_message(symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_symbol_directory_message(symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_symbol_directory_message(symbol_directory_message_sent, 255)
  :: else -> ramp_symbol_directory_message(symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_directory_message(symbol_directory_message_sent);
    assert(at == 63);
    at = 0;
    decode_symbol_directory_message(symbol_directory_message_got);
    assert(at == 63);
    equal_symbol_directory_message(symbol_directory_message_got, symbol_directory_message_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 24);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 24);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Size Message: encoded, read back, and compared */
proctype check_order_executed_with_price_size_message() {
  OrderExecutedWithPriceSizeMessage order_executed_with_price_size_message_sent;
  OrderExecutedWithPriceSizeMessage order_executed_with_price_size_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 255)
  :: else -> ramp_order_executed_with_price_size_message(order_executed_with_price_size_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_size_message(order_executed_with_price_size_message_sent);
    assert(at == 37);
    at = 0;
    decode_order_executed_with_price_size_message(order_executed_with_price_size_message_got);
    assert(at == 37);
    equal_order_executed_with_price_size_message(order_executed_with_price_size_message_got, order_executed_with_price_size_message_sent)
  }
}

/* Auction Info Message: encoded, read back, and compared */
proctype check_auction_info_message() {
  AuctionInfoMessage auction_info_message_sent;
  AuctionInfoMessage auction_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_info_message(auction_info_message_sent, 0)
  :: pattern == 1 -> fill_auction_info_message(auction_info_message_sent, 32)
  :: pattern == 2 -> fill_auction_info_message(auction_info_message_sent, 255)
  :: else -> ramp_auction_info_message(auction_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_info_message(auction_info_message_sent);
    assert(at == 28);
    at = 0;
    decode_auction_info_message(auction_info_message_got);
    assert(at == 28);
    equal_auction_info_message(auction_info_message_got, auction_info_message_sent)
  }
}

/* Top Of Book Message: encoded, read back, and compared */
proctype check_top_of_book_message() {
  TopOfBookMessage top_of_book_message_sent;
  TopOfBookMessage top_of_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_book_message(top_of_book_message_sent, 0)
  :: pattern == 1 -> fill_top_of_book_message(top_of_book_message_sent, 32)
  :: pattern == 2 -> fill_top_of_book_message(top_of_book_message_sent, 255)
  :: else -> ramp_top_of_book_message(top_of_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_book_message(top_of_book_message_sent);
    assert(at == 32);
    at = 0;
    decode_top_of_book_message(top_of_book_message_got);
    assert(at == 32);
    equal_top_of_book_message(top_of_book_message_got, top_of_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_unit_header()
  :: run check_message_header()
  :: run check_time_message()
  :: run check_system_event_message()
  :: run check_symbol_directory_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_size_message()
  :: run check_auction_info_message()
  :: run check_top_of_book_message()
  fi
}
