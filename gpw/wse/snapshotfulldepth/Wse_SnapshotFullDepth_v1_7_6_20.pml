/*
 * Giełda Papierów Wartościowych w Warszawie Warsaw Stock Exchange Full Depth Snapshot
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
 *   - a run of a stated number of entries
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 890

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 42 bytes ------------------------------------------------ */

/* Every market data message opens with the same 42 byte header */
typedef MessageHeader {
  byte message_length[2];
  byte message_type[2];
  byte message_version[2];
  byte sequence_number[4];
  byte timestamp[8];
  byte source_timestamp[8];
  byte is_encrypted;
  byte encryption_offset[8];
  byte encryption_key_id[4];
  byte session_id[2];
  byte stream_id
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_version[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.source_timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.is_encrypted = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.encryption_offset[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.encryption_key_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.session_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.stream_id = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_version[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = (message_header_base + 10 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.source_timestamp[message_header_at] = (message_header_base + 18 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.is_encrypted = (message_header_base + 26 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.encryption_offset[message_header_at] = (message_header_base + 27 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.encryption_key_id[message_header_at] = (message_header_base + 35 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.session_id[message_header_at] = (message_header_base + 39 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.stream_id = (message_header_base + 41 + 1) % 256;
  skip
}

/* Message Header to the wire, 42 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_version[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.source_timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.is_encrypted; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.encryption_offset[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.encryption_key_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.session_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.stream_id; at = at + 1;
  skip
}

/* Message Header off the wire, 42 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_version[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.source_timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.is_encrypted = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.encryption_offset[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.encryption_key_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.session_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.stream_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_version[message_header_at] == message_header_written.message_version[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.source_timestamp[message_header_at] == message_header_written.source_timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.is_encrypted == message_header_written.is_encrypted);
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.encryption_offset[message_header_at] == message_header_written.encryption_offset[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.encryption_key_id[message_header_at] == message_header_written.encryption_key_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.session_id[message_header_at] == message_header_written.session_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.stream_id == message_header_written.stream_id);
  skip
}

/* ---- Calendar Exception: 9 bytes --------------------------------------------- */

/* Upcoming calendar day exception */
typedef CalendarException {
  byte calendar_id[4];
  byte calendar_exception_date[4];
  byte calendar_exception_type
};

int calendar_exception_at;

/* every byte of Calendar Exception set to one value */
inline fill_calendar_exception(calendar_exception_record, calendar_exception_value) {
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> calendar_exception_record.calendar_id[calendar_exception_at] = calendar_exception_value; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> calendar_exception_record.calendar_exception_date[calendar_exception_at] = calendar_exception_value; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_record.calendar_exception_type = calendar_exception_value;
  skip
}

/* each byte of Calendar Exception set to where it lies, so a field read out of place says so */
inline ramp_calendar_exception(calendar_exception_record, calendar_exception_base) {
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> calendar_exception_record.calendar_id[calendar_exception_at] = (calendar_exception_base + 0 + calendar_exception_at + 1) % 256; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> calendar_exception_record.calendar_exception_date[calendar_exception_at] = (calendar_exception_base + 4 + calendar_exception_at + 1) % 256; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_record.calendar_exception_type = (calendar_exception_base + 8 + 1) % 256;
  skip
}

/* Calendar Exception to the wire, 9 bytes from where the cursor stands */
inline encode_calendar_exception(calendar_exception_record) {
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> wire[at] = calendar_exception_record.calendar_id[calendar_exception_at]; at = at + 1; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> wire[at] = calendar_exception_record.calendar_exception_date[calendar_exception_at]; at = at + 1; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  wire[at] = calendar_exception_record.calendar_exception_type; at = at + 1;
  skip
}

/* Calendar Exception off the wire, 9 bytes from where the cursor stands */
inline decode_calendar_exception(calendar_exception_record) {
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> calendar_exception_record.calendar_id[calendar_exception_at] = wire[at]; at = at + 1; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> calendar_exception_record.calendar_exception_date[calendar_exception_at] = wire[at]; at = at + 1; calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_record.calendar_exception_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Calendar Exception is what was written, byte for byte */
inline equal_calendar_exception(calendar_exception_read, calendar_exception_written) {
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> assert(calendar_exception_read.calendar_id[calendar_exception_at] == calendar_exception_written.calendar_id[calendar_exception_at]); calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  calendar_exception_at = 0;
  do
  :: calendar_exception_at < 4 -> assert(calendar_exception_read.calendar_exception_date[calendar_exception_at] == calendar_exception_written.calendar_exception_date[calendar_exception_at]); calendar_exception_at = calendar_exception_at + 1
  :: else -> break
  od;
  assert(calendar_exception_read.calendar_exception_type == calendar_exception_written.calendar_exception_type);
  skip
}

/* ---- Tick Table Entry: 20 bytes ---------------------------------------------- */

/* Tick size definition */
typedef TickTableEntry {
  byte tick_size[8];
  byte lower_bound[8];
  byte tick_table_id[4]
};

int tick_table_entry_at;

/* every byte of Tick Table Entry set to one value */
inline fill_tick_table_entry(tick_table_entry_record, tick_table_entry_value) {
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> tick_table_entry_record.tick_size[tick_table_entry_at] = tick_table_entry_value; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> tick_table_entry_record.lower_bound[tick_table_entry_at] = tick_table_entry_value; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 4 -> tick_table_entry_record.tick_table_id[tick_table_entry_at] = tick_table_entry_value; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick Table Entry set to where it lies, so a field read out of place says so */
inline ramp_tick_table_entry(tick_table_entry_record, tick_table_entry_base) {
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> tick_table_entry_record.tick_size[tick_table_entry_at] = (tick_table_entry_base + 0 + tick_table_entry_at + 1) % 256; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> tick_table_entry_record.lower_bound[tick_table_entry_at] = (tick_table_entry_base + 8 + tick_table_entry_at + 1) % 256; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 4 -> tick_table_entry_record.tick_table_id[tick_table_entry_at] = (tick_table_entry_base + 16 + tick_table_entry_at + 1) % 256; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Table Entry to the wire, 20 bytes from where the cursor stands */
inline encode_tick_table_entry(tick_table_entry_record) {
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> wire[at] = tick_table_entry_record.tick_size[tick_table_entry_at]; at = at + 1; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> wire[at] = tick_table_entry_record.lower_bound[tick_table_entry_at]; at = at + 1; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 4 -> wire[at] = tick_table_entry_record.tick_table_id[tick_table_entry_at]; at = at + 1; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Table Entry off the wire, 20 bytes from where the cursor stands */
inline decode_tick_table_entry(tick_table_entry_record) {
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> tick_table_entry_record.tick_size[tick_table_entry_at] = wire[at]; at = at + 1; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> tick_table_entry_record.lower_bound[tick_table_entry_at] = wire[at]; at = at + 1; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 4 -> tick_table_entry_record.tick_table_id[tick_table_entry_at] = wire[at]; at = at + 1; tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick Table Entry is what was written, byte for byte */
inline equal_tick_table_entry(tick_table_entry_read, tick_table_entry_written) {
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> assert(tick_table_entry_read.tick_size[tick_table_entry_at] == tick_table_entry_written.tick_size[tick_table_entry_at]); tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 8 -> assert(tick_table_entry_read.lower_bound[tick_table_entry_at] == tick_table_entry_written.lower_bound[tick_table_entry_at]); tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  tick_table_entry_at = 0;
  do
  :: tick_table_entry_at < 4 -> assert(tick_table_entry_read.tick_table_id[tick_table_entry_at] == tick_table_entry_written.tick_table_id[tick_table_entry_at]); tick_table_entry_at = tick_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Collar Table Entry: 54 bytes -------------------------------------------- */

/* Collar table definition */
typedef CollarTableEntry {
  byte collar_table_id[4];
  byte collar_mode;
  byte collar_expression;
  byte collar_lower_bound[8];
  byte collar_value[8];
  byte collar_lower_bid[8];
  byte collar_upper_bid[8];
  byte collar_upper_ask[8];
  byte collar_lower_ask[8]
};

int collar_table_entry_at;

/* every byte of Collar Table Entry set to one value */
inline fill_collar_table_entry(collar_table_entry_record, collar_table_entry_value) {
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 4 -> collar_table_entry_record.collar_table_id[collar_table_entry_at] = collar_table_entry_value; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_record.collar_mode = collar_table_entry_value;
  collar_table_entry_record.collar_expression = collar_table_entry_value;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_bound[collar_table_entry_at] = collar_table_entry_value; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_value[collar_table_entry_at] = collar_table_entry_value; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_bid[collar_table_entry_at] = collar_table_entry_value; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_upper_bid[collar_table_entry_at] = collar_table_entry_value; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_upper_ask[collar_table_entry_at] = collar_table_entry_value; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_ask[collar_table_entry_at] = collar_table_entry_value; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Collar Table Entry set to where it lies, so a field read out of place says so */
inline ramp_collar_table_entry(collar_table_entry_record, collar_table_entry_base) {
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 4 -> collar_table_entry_record.collar_table_id[collar_table_entry_at] = (collar_table_entry_base + 0 + collar_table_entry_at + 1) % 256; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_record.collar_mode = (collar_table_entry_base + 4 + 1) % 256;
  collar_table_entry_record.collar_expression = (collar_table_entry_base + 5 + 1) % 256;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_bound[collar_table_entry_at] = (collar_table_entry_base + 6 + collar_table_entry_at + 1) % 256; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_value[collar_table_entry_at] = (collar_table_entry_base + 14 + collar_table_entry_at + 1) % 256; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_bid[collar_table_entry_at] = (collar_table_entry_base + 22 + collar_table_entry_at + 1) % 256; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_upper_bid[collar_table_entry_at] = (collar_table_entry_base + 30 + collar_table_entry_at + 1) % 256; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_upper_ask[collar_table_entry_at] = (collar_table_entry_base + 38 + collar_table_entry_at + 1) % 256; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_ask[collar_table_entry_at] = (collar_table_entry_base + 46 + collar_table_entry_at + 1) % 256; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Collar Table Entry to the wire, 54 bytes from where the cursor stands */
inline encode_collar_table_entry(collar_table_entry_record) {
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 4 -> wire[at] = collar_table_entry_record.collar_table_id[collar_table_entry_at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  wire[at] = collar_table_entry_record.collar_mode; at = at + 1;
  wire[at] = collar_table_entry_record.collar_expression; at = at + 1;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> wire[at] = collar_table_entry_record.collar_lower_bound[collar_table_entry_at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> wire[at] = collar_table_entry_record.collar_value[collar_table_entry_at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> wire[at] = collar_table_entry_record.collar_lower_bid[collar_table_entry_at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> wire[at] = collar_table_entry_record.collar_upper_bid[collar_table_entry_at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> wire[at] = collar_table_entry_record.collar_upper_ask[collar_table_entry_at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> wire[at] = collar_table_entry_record.collar_lower_ask[collar_table_entry_at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Collar Table Entry off the wire, 54 bytes from where the cursor stands */
inline decode_collar_table_entry(collar_table_entry_record) {
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 4 -> collar_table_entry_record.collar_table_id[collar_table_entry_at] = wire[at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_record.collar_mode = wire[at]; at = at + 1;
  collar_table_entry_record.collar_expression = wire[at]; at = at + 1;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_bound[collar_table_entry_at] = wire[at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_value[collar_table_entry_at] = wire[at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_bid[collar_table_entry_at] = wire[at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_upper_bid[collar_table_entry_at] = wire[at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_upper_ask[collar_table_entry_at] = wire[at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> collar_table_entry_record.collar_lower_ask[collar_table_entry_at] = wire[at]; at = at + 1; collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Collar Table Entry is what was written, byte for byte */
inline equal_collar_table_entry(collar_table_entry_read, collar_table_entry_written) {
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 4 -> assert(collar_table_entry_read.collar_table_id[collar_table_entry_at] == collar_table_entry_written.collar_table_id[collar_table_entry_at]); collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  assert(collar_table_entry_read.collar_mode == collar_table_entry_written.collar_mode);
  assert(collar_table_entry_read.collar_expression == collar_table_entry_written.collar_expression);
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> assert(collar_table_entry_read.collar_lower_bound[collar_table_entry_at] == collar_table_entry_written.collar_lower_bound[collar_table_entry_at]); collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> assert(collar_table_entry_read.collar_value[collar_table_entry_at] == collar_table_entry_written.collar_value[collar_table_entry_at]); collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> assert(collar_table_entry_read.collar_lower_bid[collar_table_entry_at] == collar_table_entry_written.collar_lower_bid[collar_table_entry_at]); collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> assert(collar_table_entry_read.collar_upper_bid[collar_table_entry_at] == collar_table_entry_written.collar_upper_bid[collar_table_entry_at]); collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> assert(collar_table_entry_read.collar_upper_ask[collar_table_entry_at] == collar_table_entry_written.collar_upper_ask[collar_table_entry_at]); collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  collar_table_entry_at = 0;
  do
  :: collar_table_entry_at < 8 -> assert(collar_table_entry_read.collar_lower_ask[collar_table_entry_at] == collar_table_entry_written.collar_lower_ask[collar_table_entry_at]); collar_table_entry_at = collar_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Phase Schedule Entry: 40 bytes ---------------------------------- */

/* Trading phase definition */
typedef TradingPhaseScheduleEntry {
  byte trading_schedule_id[4];
  byte trading_phase_id[4];
  byte trading_phase_settlement_cycle;
  byte trading_phase_max_block_settlement_cycle;
  byte static_collar_volatility_auction_id[4];
  byte dynamic_collar_volatility_auction_id[4];
  byte trading_phase_start_time[8];
  byte trading_phase_type;
  byte uncrossing;
  byte ext_static_collar_volatility_auction_id[4];
  byte ext_dynamic_collar_volatility_auction_id[4];
  byte clat_id[4]
};

int trading_phase_schedule_entry_at;

/* every byte of Trading Phase Schedule Entry set to one value */
inline fill_trading_phase_schedule_entry(trading_phase_schedule_entry_record, trading_phase_schedule_entry_value) {
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.trading_schedule_id[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.trading_phase_id[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_record.trading_phase_settlement_cycle = trading_phase_schedule_entry_value;
  trading_phase_schedule_entry_record.trading_phase_max_block_settlement_cycle = trading_phase_schedule_entry_value;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.static_collar_volatility_auction_id[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 8 -> trading_phase_schedule_entry_record.trading_phase_start_time[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_record.trading_phase_type = trading_phase_schedule_entry_value;
  trading_phase_schedule_entry_record.uncrossing = trading_phase_schedule_entry_value;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.ext_static_collar_volatility_auction_id[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.ext_dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.clat_id[trading_phase_schedule_entry_at] = trading_phase_schedule_entry_value; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Phase Schedule Entry set to where it lies, so a field read out of place says so */
inline ramp_trading_phase_schedule_entry(trading_phase_schedule_entry_record, trading_phase_schedule_entry_base) {
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.trading_schedule_id[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 0 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.trading_phase_id[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 4 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_record.trading_phase_settlement_cycle = (trading_phase_schedule_entry_base + 8 + 1) % 256;
  trading_phase_schedule_entry_record.trading_phase_max_block_settlement_cycle = (trading_phase_schedule_entry_base + 9 + 1) % 256;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.static_collar_volatility_auction_id[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 10 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 14 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 8 -> trading_phase_schedule_entry_record.trading_phase_start_time[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 18 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_record.trading_phase_type = (trading_phase_schedule_entry_base + 26 + 1) % 256;
  trading_phase_schedule_entry_record.uncrossing = (trading_phase_schedule_entry_base + 27 + 1) % 256;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.ext_static_collar_volatility_auction_id[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 28 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.ext_dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 32 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.clat_id[trading_phase_schedule_entry_at] = (trading_phase_schedule_entry_base + 36 + trading_phase_schedule_entry_at + 1) % 256; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Phase Schedule Entry to the wire, 40 bytes from where the cursor stands */
inline encode_trading_phase_schedule_entry(trading_phase_schedule_entry_record) {
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> wire[at] = trading_phase_schedule_entry_record.trading_schedule_id[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> wire[at] = trading_phase_schedule_entry_record.trading_phase_id[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  wire[at] = trading_phase_schedule_entry_record.trading_phase_settlement_cycle; at = at + 1;
  wire[at] = trading_phase_schedule_entry_record.trading_phase_max_block_settlement_cycle; at = at + 1;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> wire[at] = trading_phase_schedule_entry_record.static_collar_volatility_auction_id[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> wire[at] = trading_phase_schedule_entry_record.dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 8 -> wire[at] = trading_phase_schedule_entry_record.trading_phase_start_time[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  wire[at] = trading_phase_schedule_entry_record.trading_phase_type; at = at + 1;
  wire[at] = trading_phase_schedule_entry_record.uncrossing; at = at + 1;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> wire[at] = trading_phase_schedule_entry_record.ext_static_collar_volatility_auction_id[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> wire[at] = trading_phase_schedule_entry_record.ext_dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> wire[at] = trading_phase_schedule_entry_record.clat_id[trading_phase_schedule_entry_at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Phase Schedule Entry off the wire, 40 bytes from where the cursor stands */
inline decode_trading_phase_schedule_entry(trading_phase_schedule_entry_record) {
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.trading_schedule_id[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.trading_phase_id[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_record.trading_phase_settlement_cycle = wire[at]; at = at + 1;
  trading_phase_schedule_entry_record.trading_phase_max_block_settlement_cycle = wire[at]; at = at + 1;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.static_collar_volatility_auction_id[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 8 -> trading_phase_schedule_entry_record.trading_phase_start_time[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_record.trading_phase_type = wire[at]; at = at + 1;
  trading_phase_schedule_entry_record.uncrossing = wire[at]; at = at + 1;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.ext_static_collar_volatility_auction_id[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.ext_dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> trading_phase_schedule_entry_record.clat_id[trading_phase_schedule_entry_at] = wire[at]; at = at + 1; trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Phase Schedule Entry is what was written, byte for byte */
inline equal_trading_phase_schedule_entry(trading_phase_schedule_entry_read, trading_phase_schedule_entry_written) {
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> assert(trading_phase_schedule_entry_read.trading_schedule_id[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.trading_schedule_id[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> assert(trading_phase_schedule_entry_read.trading_phase_id[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.trading_phase_id[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  assert(trading_phase_schedule_entry_read.trading_phase_settlement_cycle == trading_phase_schedule_entry_written.trading_phase_settlement_cycle);
  assert(trading_phase_schedule_entry_read.trading_phase_max_block_settlement_cycle == trading_phase_schedule_entry_written.trading_phase_max_block_settlement_cycle);
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> assert(trading_phase_schedule_entry_read.static_collar_volatility_auction_id[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.static_collar_volatility_auction_id[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> assert(trading_phase_schedule_entry_read.dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 8 -> assert(trading_phase_schedule_entry_read.trading_phase_start_time[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.trading_phase_start_time[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  assert(trading_phase_schedule_entry_read.trading_phase_type == trading_phase_schedule_entry_written.trading_phase_type);
  assert(trading_phase_schedule_entry_read.uncrossing == trading_phase_schedule_entry_written.uncrossing);
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> assert(trading_phase_schedule_entry_read.ext_static_collar_volatility_auction_id[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.ext_static_collar_volatility_auction_id[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> assert(trading_phase_schedule_entry_read.ext_dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.ext_dynamic_collar_volatility_auction_id[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  trading_phase_schedule_entry_at = 0;
  do
  :: trading_phase_schedule_entry_at < 4 -> assert(trading_phase_schedule_entry_read.clat_id[trading_phase_schedule_entry_at] == trading_phase_schedule_entry_written.clat_id[trading_phase_schedule_entry_at]); trading_phase_schedule_entry_at = trading_phase_schedule_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Structure: 63 bytes ---------------------------------------------- */

/* Messages defining the Trading Venue’s market structure */
typedef MarketStructure {
  byte id[4];
  byte parent_id[4];
  byte mic[4];
  byte name[50];
  byte market_model_type
};

int market_structure_at;

/* every byte of Market Structure set to one value */
inline fill_market_structure(market_structure_record, market_structure_value) {
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.id[market_structure_at] = market_structure_value; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.parent_id[market_structure_at] = market_structure_value; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.mic[market_structure_at] = market_structure_value; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 50 -> market_structure_record.name[market_structure_at] = market_structure_value; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_record.market_model_type = market_structure_value;
  skip
}

/* each byte of Market Structure set to where it lies, so a field read out of place says so */
inline ramp_market_structure(market_structure_record, market_structure_base) {
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.id[market_structure_at] = (market_structure_base + 0 + market_structure_at + 1) % 256; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.parent_id[market_structure_at] = (market_structure_base + 4 + market_structure_at + 1) % 256; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.mic[market_structure_at] = (market_structure_base + 8 + market_structure_at + 1) % 256; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 50 -> market_structure_record.name[market_structure_at] = (market_structure_base + 12 + market_structure_at + 1) % 256; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_record.market_model_type = (market_structure_base + 62 + 1) % 256;
  skip
}

/* Market Structure to the wire, 63 bytes from where the cursor stands */
inline encode_market_structure(market_structure_record) {
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> wire[at] = market_structure_record.id[market_structure_at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> wire[at] = market_structure_record.parent_id[market_structure_at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> wire[at] = market_structure_record.mic[market_structure_at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 50 -> wire[at] = market_structure_record.name[market_structure_at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  wire[at] = market_structure_record.market_model_type; at = at + 1;
  skip
}

/* Market Structure off the wire, 63 bytes from where the cursor stands */
inline decode_market_structure(market_structure_record) {
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.id[market_structure_at] = wire[at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.parent_id[market_structure_at] = wire[at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> market_structure_record.mic[market_structure_at] = wire[at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 50 -> market_structure_record.name[market_structure_at] = wire[at]; at = at + 1; market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_record.market_model_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Structure is what was written, byte for byte */
inline equal_market_structure(market_structure_read, market_structure_written) {
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> assert(market_structure_read.id[market_structure_at] == market_structure_written.id[market_structure_at]); market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> assert(market_structure_read.parent_id[market_structure_at] == market_structure_written.parent_id[market_structure_at]); market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 4 -> assert(market_structure_read.mic[market_structure_at] == market_structure_written.mic[market_structure_at]); market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  market_structure_at = 0;
  do
  :: market_structure_at < 50 -> assert(market_structure_read.name[market_structure_at] == market_structure_written.name[market_structure_at]); market_structure_at = market_structure_at + 1
  :: else -> break
  od;
  assert(market_structure_read.market_model_type == market_structure_written.market_model_type);
  skip
}

/* ---- Collar Group: 20 bytes -------------------------------------------------- */

/* Message defining a collar group */
typedef CollarGroup {
  byte id[4];
  byte order_static_collar_table_id[4];
  byte order_dynamic_collar_table_id[4];
  byte trade_static_collar_table_id[4];
  byte trade_dynamic_collar_table_id[4]
};

int collar_group_at;

/* every byte of Collar Group set to one value */
inline fill_collar_group(collar_group_record, collar_group_value) {
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.id[collar_group_at] = collar_group_value; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.order_static_collar_table_id[collar_group_at] = collar_group_value; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.order_dynamic_collar_table_id[collar_group_at] = collar_group_value; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.trade_static_collar_table_id[collar_group_at] = collar_group_value; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.trade_dynamic_collar_table_id[collar_group_at] = collar_group_value; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Collar Group set to where it lies, so a field read out of place says so */
inline ramp_collar_group(collar_group_record, collar_group_base) {
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.id[collar_group_at] = (collar_group_base + 0 + collar_group_at + 1) % 256; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.order_static_collar_table_id[collar_group_at] = (collar_group_base + 4 + collar_group_at + 1) % 256; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.order_dynamic_collar_table_id[collar_group_at] = (collar_group_base + 8 + collar_group_at + 1) % 256; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.trade_static_collar_table_id[collar_group_at] = (collar_group_base + 12 + collar_group_at + 1) % 256; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.trade_dynamic_collar_table_id[collar_group_at] = (collar_group_base + 16 + collar_group_at + 1) % 256; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  skip
}

/* Collar Group to the wire, 20 bytes from where the cursor stands */
inline encode_collar_group(collar_group_record) {
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> wire[at] = collar_group_record.id[collar_group_at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> wire[at] = collar_group_record.order_static_collar_table_id[collar_group_at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> wire[at] = collar_group_record.order_dynamic_collar_table_id[collar_group_at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> wire[at] = collar_group_record.trade_static_collar_table_id[collar_group_at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> wire[at] = collar_group_record.trade_dynamic_collar_table_id[collar_group_at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  skip
}

/* Collar Group off the wire, 20 bytes from where the cursor stands */
inline decode_collar_group(collar_group_record) {
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.id[collar_group_at] = wire[at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.order_static_collar_table_id[collar_group_at] = wire[at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.order_dynamic_collar_table_id[collar_group_at] = wire[at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.trade_static_collar_table_id[collar_group_at] = wire[at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> collar_group_record.trade_dynamic_collar_table_id[collar_group_at] = wire[at]; at = at + 1; collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Collar Group is what was written, byte for byte */
inline equal_collar_group(collar_group_read, collar_group_written) {
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> assert(collar_group_read.id[collar_group_at] == collar_group_written.id[collar_group_at]); collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> assert(collar_group_read.order_static_collar_table_id[collar_group_at] == collar_group_written.order_static_collar_table_id[collar_group_at]); collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> assert(collar_group_read.order_dynamic_collar_table_id[collar_group_at] == collar_group_written.order_dynamic_collar_table_id[collar_group_at]); collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> assert(collar_group_read.trade_static_collar_table_id[collar_group_at] == collar_group_written.trade_static_collar_table_id[collar_group_at]); collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  collar_group_at = 0;
  do
  :: collar_group_at < 4 -> assert(collar_group_read.trade_dynamic_collar_table_id[collar_group_at] == collar_group_written.trade_dynamic_collar_table_id[collar_group_at]); collar_group_at = collar_group_at + 1
  :: else -> break
  od;
  skip
}

/* ---- External Underlying: 113 bytes ------------------------------------------ */

/* The message contains a list of underlyings not traded in WATS. It concerns underlyings for derivatives and structured products */
typedef ExternalUnderlying {
  byte external_underlying_id[4];
  byte product_identification_product_identification[30];
  byte product_identification_type;
  byte product_code[20];
  byte product_name[50];
  byte mic[4];
  byte nominal_currency[2];
  byte trading_currency[2]
};

int external_underlying_at;

/* every byte of External Underlying set to one value */
inline fill_external_underlying(external_underlying_record, external_underlying_value) {
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> external_underlying_record.external_underlying_id[external_underlying_at] = external_underlying_value; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 30 -> external_underlying_record.product_identification_product_identification[external_underlying_at] = external_underlying_value; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_record.product_identification_type = external_underlying_value;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 20 -> external_underlying_record.product_code[external_underlying_at] = external_underlying_value; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 50 -> external_underlying_record.product_name[external_underlying_at] = external_underlying_value; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> external_underlying_record.mic[external_underlying_at] = external_underlying_value; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> external_underlying_record.nominal_currency[external_underlying_at] = external_underlying_value; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> external_underlying_record.trading_currency[external_underlying_at] = external_underlying_value; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of External Underlying set to where it lies, so a field read out of place says so */
inline ramp_external_underlying(external_underlying_record, external_underlying_base) {
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> external_underlying_record.external_underlying_id[external_underlying_at] = (external_underlying_base + 0 + external_underlying_at + 1) % 256; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 30 -> external_underlying_record.product_identification_product_identification[external_underlying_at] = (external_underlying_base + 4 + external_underlying_at + 1) % 256; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_record.product_identification_type = (external_underlying_base + 34 + 1) % 256;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 20 -> external_underlying_record.product_code[external_underlying_at] = (external_underlying_base + 35 + external_underlying_at + 1) % 256; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 50 -> external_underlying_record.product_name[external_underlying_at] = (external_underlying_base + 55 + external_underlying_at + 1) % 256; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> external_underlying_record.mic[external_underlying_at] = (external_underlying_base + 105 + external_underlying_at + 1) % 256; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> external_underlying_record.nominal_currency[external_underlying_at] = (external_underlying_base + 109 + external_underlying_at + 1) % 256; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> external_underlying_record.trading_currency[external_underlying_at] = (external_underlying_base + 111 + external_underlying_at + 1) % 256; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  skip
}

/* External Underlying to the wire, 113 bytes from where the cursor stands */
inline encode_external_underlying(external_underlying_record) {
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> wire[at] = external_underlying_record.external_underlying_id[external_underlying_at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 30 -> wire[at] = external_underlying_record.product_identification_product_identification[external_underlying_at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  wire[at] = external_underlying_record.product_identification_type; at = at + 1;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 20 -> wire[at] = external_underlying_record.product_code[external_underlying_at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 50 -> wire[at] = external_underlying_record.product_name[external_underlying_at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> wire[at] = external_underlying_record.mic[external_underlying_at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> wire[at] = external_underlying_record.nominal_currency[external_underlying_at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> wire[at] = external_underlying_record.trading_currency[external_underlying_at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  skip
}

/* External Underlying off the wire, 113 bytes from where the cursor stands */
inline decode_external_underlying(external_underlying_record) {
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> external_underlying_record.external_underlying_id[external_underlying_at] = wire[at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 30 -> external_underlying_record.product_identification_product_identification[external_underlying_at] = wire[at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_record.product_identification_type = wire[at]; at = at + 1;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 20 -> external_underlying_record.product_code[external_underlying_at] = wire[at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 50 -> external_underlying_record.product_name[external_underlying_at] = wire[at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> external_underlying_record.mic[external_underlying_at] = wire[at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> external_underlying_record.nominal_currency[external_underlying_at] = wire[at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> external_underlying_record.trading_currency[external_underlying_at] = wire[at]; at = at + 1; external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of External Underlying is what was written, byte for byte */
inline equal_external_underlying(external_underlying_read, external_underlying_written) {
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> assert(external_underlying_read.external_underlying_id[external_underlying_at] == external_underlying_written.external_underlying_id[external_underlying_at]); external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 30 -> assert(external_underlying_read.product_identification_product_identification[external_underlying_at] == external_underlying_written.product_identification_product_identification[external_underlying_at]); external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  assert(external_underlying_read.product_identification_type == external_underlying_written.product_identification_type);
  external_underlying_at = 0;
  do
  :: external_underlying_at < 20 -> assert(external_underlying_read.product_code[external_underlying_at] == external_underlying_written.product_code[external_underlying_at]); external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 50 -> assert(external_underlying_read.product_name[external_underlying_at] == external_underlying_written.product_name[external_underlying_at]); external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 4 -> assert(external_underlying_read.mic[external_underlying_at] == external_underlying_written.mic[external_underlying_at]); external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> assert(external_underlying_read.nominal_currency[external_underlying_at] == external_underlying_written.nominal_currency[external_underlying_at]); external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  external_underlying_at = 0;
  do
  :: external_underlying_at < 2 -> assert(external_underlying_read.trading_currency[external_underlying_at] == external_underlying_written.trading_currency[external_underlying_at]); external_underlying_at = external_underlying_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument: 699 bytes --------------------------------------------------- */

/* Definition of a financial instrument */
typedef Instrument {
  byte instrument_id[4];
  byte product_type;
  byte product_subtype;
  byte first_trading_date[4];
  byte last_trading_date[4];
  byte product_id[4];
  byte currency[2];
  byte iceberg_min_value[8];
  byte lot_size[4];
  byte price_expression_type;
  byte calendar_id[4];
  byte market_structure_id[4];
  byte tick_table_id[4];
  byte reference_instrument_id[4];
  byte collar_group_id[4];
  byte trading_schedule_id[4];
  byte description[64];
  byte mic[4];
  byte nominal_value_price[8];
  byte nominal_value_type;
  byte multiplier_multiplier[8];
  byte strike_price[8];
  byte strike_price_currency[2];
  byte product_identification_product_identification[30];
  byte product_identification_type;
  byte settlement_calendar_id[4];
  byte bond_coupon_type;
  byte pre_trade_check_min_price[8];
  byte pre_trade_check_max_price[8];
  byte pre_trade_check_min_quantity[8];
  byte pre_trade_check_max_quantity[8];
  byte pre_trade_check_max_value[8];
  byte pre_trade_check_min_value[8];
  byte liquidity;
  byte market_model_type;
  byte issuer[150];
  byte issuer_reg_country[2];
  byte underlying_instrument_id[4];
  byte product_code[20];
  byte cfi[6];
  byte fisn[35];
  byte issue_size[8];
  byte nominal_currency[2];
  byte us_indicator;
  byte expiry_date[4];
  byte version_number;
  byte settlement_type;
  byte option_type;
  byte exercise_type;
  byte product_name[50];
  byte reference_price[8];
  byte status;
  byte initial_phase_id[4];
  byte threshold_max[8];
  byte threshold_min[8];
  byte is_leverage;
  byte accrued_interest_value[8];
  byte kid[128];
  byte kid_issue_date[4];
  byte value_at_risk;
  byte external_underlying_id[4]
};

int instrument_at;

/* every byte of Instrument set to one value */
inline fill_instrument(instrument_record, instrument_value) {
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.instrument_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.product_type = instrument_value;
  instrument_record.product_subtype = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.first_trading_date[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.last_trading_date[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.product_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.currency[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.iceberg_min_value[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.lot_size[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.price_expression_type = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.calendar_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.market_structure_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.tick_table_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.reference_instrument_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.collar_group_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.trading_schedule_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 64 -> instrument_record.description[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.mic[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.nominal_value_price[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.nominal_value_type = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.multiplier_multiplier[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.strike_price[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.strike_price_currency[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 30 -> instrument_record.product_identification_product_identification[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.product_identification_type = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.settlement_calendar_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.bond_coupon_type = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_price[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_price[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_quantity[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_quantity[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_value[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_value[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.liquidity = instrument_value;
  instrument_record.market_model_type = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 150 -> instrument_record.issuer[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.issuer_reg_country[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.underlying_instrument_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 20 -> instrument_record.product_code[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 6 -> instrument_record.cfi[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 35 -> instrument_record.fisn[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.issue_size[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.nominal_currency[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.us_indicator = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.expiry_date[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.version_number = instrument_value;
  instrument_record.settlement_type = instrument_value;
  instrument_record.option_type = instrument_value;
  instrument_record.exercise_type = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 50 -> instrument_record.product_name[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.reference_price[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.status = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.initial_phase_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.threshold_max[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.threshold_min[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.is_leverage = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.accrued_interest_value[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 128 -> instrument_record.kid[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.kid_issue_date[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.value_at_risk = instrument_value;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.external_underlying_id[instrument_at] = instrument_value; instrument_at = instrument_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument set to where it lies, so a field read out of place says so */
inline ramp_instrument(instrument_record, instrument_base) {
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.instrument_id[instrument_at] = (instrument_base + 0 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.product_type = (instrument_base + 4 + 1) % 256;
  instrument_record.product_subtype = (instrument_base + 5 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.first_trading_date[instrument_at] = (instrument_base + 6 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.last_trading_date[instrument_at] = (instrument_base + 10 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.product_id[instrument_at] = (instrument_base + 14 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.currency[instrument_at] = (instrument_base + 18 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.iceberg_min_value[instrument_at] = (instrument_base + 20 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.lot_size[instrument_at] = (instrument_base + 28 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.price_expression_type = (instrument_base + 32 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.calendar_id[instrument_at] = (instrument_base + 33 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.market_structure_id[instrument_at] = (instrument_base + 37 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.tick_table_id[instrument_at] = (instrument_base + 41 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.reference_instrument_id[instrument_at] = (instrument_base + 45 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.collar_group_id[instrument_at] = (instrument_base + 49 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.trading_schedule_id[instrument_at] = (instrument_base + 53 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 64 -> instrument_record.description[instrument_at] = (instrument_base + 57 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.mic[instrument_at] = (instrument_base + 121 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.nominal_value_price[instrument_at] = (instrument_base + 125 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.nominal_value_type = (instrument_base + 133 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.multiplier_multiplier[instrument_at] = (instrument_base + 134 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.strike_price[instrument_at] = (instrument_base + 142 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.strike_price_currency[instrument_at] = (instrument_base + 150 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 30 -> instrument_record.product_identification_product_identification[instrument_at] = (instrument_base + 152 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.product_identification_type = (instrument_base + 182 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.settlement_calendar_id[instrument_at] = (instrument_base + 183 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.bond_coupon_type = (instrument_base + 187 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_price[instrument_at] = (instrument_base + 188 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_price[instrument_at] = (instrument_base + 196 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_quantity[instrument_at] = (instrument_base + 204 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_quantity[instrument_at] = (instrument_base + 212 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_value[instrument_at] = (instrument_base + 220 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_value[instrument_at] = (instrument_base + 228 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.liquidity = (instrument_base + 236 + 1) % 256;
  instrument_record.market_model_type = (instrument_base + 237 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 150 -> instrument_record.issuer[instrument_at] = (instrument_base + 238 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.issuer_reg_country[instrument_at] = (instrument_base + 388 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.underlying_instrument_id[instrument_at] = (instrument_base + 390 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 20 -> instrument_record.product_code[instrument_at] = (instrument_base + 394 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 6 -> instrument_record.cfi[instrument_at] = (instrument_base + 414 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 35 -> instrument_record.fisn[instrument_at] = (instrument_base + 420 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.issue_size[instrument_at] = (instrument_base + 455 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.nominal_currency[instrument_at] = (instrument_base + 463 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.us_indicator = (instrument_base + 465 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.expiry_date[instrument_at] = (instrument_base + 466 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.version_number = (instrument_base + 470 + 1) % 256;
  instrument_record.settlement_type = (instrument_base + 471 + 1) % 256;
  instrument_record.option_type = (instrument_base + 472 + 1) % 256;
  instrument_record.exercise_type = (instrument_base + 473 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 50 -> instrument_record.product_name[instrument_at] = (instrument_base + 474 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.reference_price[instrument_at] = (instrument_base + 524 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.status = (instrument_base + 532 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.initial_phase_id[instrument_at] = (instrument_base + 533 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.threshold_max[instrument_at] = (instrument_base + 537 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.threshold_min[instrument_at] = (instrument_base + 545 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.is_leverage = (instrument_base + 553 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.accrued_interest_value[instrument_at] = (instrument_base + 554 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 128 -> instrument_record.kid[instrument_at] = (instrument_base + 562 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.kid_issue_date[instrument_at] = (instrument_base + 690 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.value_at_risk = (instrument_base + 694 + 1) % 256;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.external_underlying_id[instrument_at] = (instrument_base + 695 + instrument_at + 1) % 256; instrument_at = instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument to the wire, 699 bytes from where the cursor stands */
inline encode_instrument(instrument_record) {
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.instrument_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.product_type; at = at + 1;
  wire[at] = instrument_record.product_subtype; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.first_trading_date[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.last_trading_date[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.product_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> wire[at] = instrument_record.currency[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.iceberg_min_value[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.lot_size[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.price_expression_type; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.calendar_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.market_structure_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.tick_table_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.reference_instrument_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.collar_group_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.trading_schedule_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 64 -> wire[at] = instrument_record.description[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.mic[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.nominal_value_price[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.nominal_value_type; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.multiplier_multiplier[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.strike_price[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> wire[at] = instrument_record.strike_price_currency[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 30 -> wire[at] = instrument_record.product_identification_product_identification[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.product_identification_type; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.settlement_calendar_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.bond_coupon_type; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.pre_trade_check_min_price[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.pre_trade_check_max_price[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.pre_trade_check_min_quantity[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.pre_trade_check_max_quantity[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.pre_trade_check_max_value[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.pre_trade_check_min_value[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.liquidity; at = at + 1;
  wire[at] = instrument_record.market_model_type; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 150 -> wire[at] = instrument_record.issuer[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> wire[at] = instrument_record.issuer_reg_country[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.underlying_instrument_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 20 -> wire[at] = instrument_record.product_code[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 6 -> wire[at] = instrument_record.cfi[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 35 -> wire[at] = instrument_record.fisn[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.issue_size[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> wire[at] = instrument_record.nominal_currency[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.us_indicator; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.expiry_date[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.version_number; at = at + 1;
  wire[at] = instrument_record.settlement_type; at = at + 1;
  wire[at] = instrument_record.option_type; at = at + 1;
  wire[at] = instrument_record.exercise_type; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 50 -> wire[at] = instrument_record.product_name[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.reference_price[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.status; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.initial_phase_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.threshold_max[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.threshold_min[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.is_leverage; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> wire[at] = instrument_record.accrued_interest_value[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 128 -> wire[at] = instrument_record.kid[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.kid_issue_date[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  wire[at] = instrument_record.value_at_risk; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> wire[at] = instrument_record.external_underlying_id[instrument_at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument off the wire, 699 bytes from where the cursor stands */
inline decode_instrument(instrument_record) {
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.instrument_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.product_type = wire[at]; at = at + 1;
  instrument_record.product_subtype = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.first_trading_date[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.last_trading_date[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.product_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.currency[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.iceberg_min_value[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.lot_size[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.price_expression_type = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.calendar_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.market_structure_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.tick_table_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.reference_instrument_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.collar_group_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.trading_schedule_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 64 -> instrument_record.description[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.mic[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.nominal_value_price[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.nominal_value_type = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.multiplier_multiplier[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.strike_price[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.strike_price_currency[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 30 -> instrument_record.product_identification_product_identification[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.product_identification_type = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.settlement_calendar_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.bond_coupon_type = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_price[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_price[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_quantity[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_quantity[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_max_value[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.pre_trade_check_min_value[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.liquidity = wire[at]; at = at + 1;
  instrument_record.market_model_type = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 150 -> instrument_record.issuer[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.issuer_reg_country[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.underlying_instrument_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 20 -> instrument_record.product_code[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 6 -> instrument_record.cfi[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 35 -> instrument_record.fisn[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.issue_size[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> instrument_record.nominal_currency[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.us_indicator = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.expiry_date[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.version_number = wire[at]; at = at + 1;
  instrument_record.settlement_type = wire[at]; at = at + 1;
  instrument_record.option_type = wire[at]; at = at + 1;
  instrument_record.exercise_type = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 50 -> instrument_record.product_name[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.reference_price[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.status = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.initial_phase_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.threshold_max[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.threshold_min[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.is_leverage = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> instrument_record.accrued_interest_value[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 128 -> instrument_record.kid[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.kid_issue_date[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_record.value_at_risk = wire[at]; at = at + 1;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> instrument_record.external_underlying_id[instrument_at] = wire[at]; at = at + 1; instrument_at = instrument_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument is what was written, byte for byte */
inline equal_instrument(instrument_read, instrument_written) {
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.instrument_id[instrument_at] == instrument_written.instrument_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.product_type == instrument_written.product_type);
  assert(instrument_read.product_subtype == instrument_written.product_subtype);
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.first_trading_date[instrument_at] == instrument_written.first_trading_date[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.last_trading_date[instrument_at] == instrument_written.last_trading_date[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.product_id[instrument_at] == instrument_written.product_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> assert(instrument_read.currency[instrument_at] == instrument_written.currency[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.iceberg_min_value[instrument_at] == instrument_written.iceberg_min_value[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.lot_size[instrument_at] == instrument_written.lot_size[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.price_expression_type == instrument_written.price_expression_type);
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.calendar_id[instrument_at] == instrument_written.calendar_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.market_structure_id[instrument_at] == instrument_written.market_structure_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.tick_table_id[instrument_at] == instrument_written.tick_table_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.reference_instrument_id[instrument_at] == instrument_written.reference_instrument_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.collar_group_id[instrument_at] == instrument_written.collar_group_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.trading_schedule_id[instrument_at] == instrument_written.trading_schedule_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 64 -> assert(instrument_read.description[instrument_at] == instrument_written.description[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.mic[instrument_at] == instrument_written.mic[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.nominal_value_price[instrument_at] == instrument_written.nominal_value_price[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.nominal_value_type == instrument_written.nominal_value_type);
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.multiplier_multiplier[instrument_at] == instrument_written.multiplier_multiplier[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.strike_price[instrument_at] == instrument_written.strike_price[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> assert(instrument_read.strike_price_currency[instrument_at] == instrument_written.strike_price_currency[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 30 -> assert(instrument_read.product_identification_product_identification[instrument_at] == instrument_written.product_identification_product_identification[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.product_identification_type == instrument_written.product_identification_type);
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.settlement_calendar_id[instrument_at] == instrument_written.settlement_calendar_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.bond_coupon_type == instrument_written.bond_coupon_type);
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.pre_trade_check_min_price[instrument_at] == instrument_written.pre_trade_check_min_price[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.pre_trade_check_max_price[instrument_at] == instrument_written.pre_trade_check_max_price[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.pre_trade_check_min_quantity[instrument_at] == instrument_written.pre_trade_check_min_quantity[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.pre_trade_check_max_quantity[instrument_at] == instrument_written.pre_trade_check_max_quantity[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.pre_trade_check_max_value[instrument_at] == instrument_written.pre_trade_check_max_value[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.pre_trade_check_min_value[instrument_at] == instrument_written.pre_trade_check_min_value[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.liquidity == instrument_written.liquidity);
  assert(instrument_read.market_model_type == instrument_written.market_model_type);
  instrument_at = 0;
  do
  :: instrument_at < 150 -> assert(instrument_read.issuer[instrument_at] == instrument_written.issuer[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> assert(instrument_read.issuer_reg_country[instrument_at] == instrument_written.issuer_reg_country[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.underlying_instrument_id[instrument_at] == instrument_written.underlying_instrument_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 20 -> assert(instrument_read.product_code[instrument_at] == instrument_written.product_code[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 6 -> assert(instrument_read.cfi[instrument_at] == instrument_written.cfi[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 35 -> assert(instrument_read.fisn[instrument_at] == instrument_written.fisn[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.issue_size[instrument_at] == instrument_written.issue_size[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 2 -> assert(instrument_read.nominal_currency[instrument_at] == instrument_written.nominal_currency[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.us_indicator == instrument_written.us_indicator);
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.expiry_date[instrument_at] == instrument_written.expiry_date[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.version_number == instrument_written.version_number);
  assert(instrument_read.settlement_type == instrument_written.settlement_type);
  assert(instrument_read.option_type == instrument_written.option_type);
  assert(instrument_read.exercise_type == instrument_written.exercise_type);
  instrument_at = 0;
  do
  :: instrument_at < 50 -> assert(instrument_read.product_name[instrument_at] == instrument_written.product_name[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.reference_price[instrument_at] == instrument_written.reference_price[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.status == instrument_written.status);
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.initial_phase_id[instrument_at] == instrument_written.initial_phase_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.threshold_max[instrument_at] == instrument_written.threshold_max[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.threshold_min[instrument_at] == instrument_written.threshold_min[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.is_leverage == instrument_written.is_leverage);
  instrument_at = 0;
  do
  :: instrument_at < 8 -> assert(instrument_read.accrued_interest_value[instrument_at] == instrument_written.accrued_interest_value[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 128 -> assert(instrument_read.kid[instrument_at] == instrument_written.kid[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.kid_issue_date[instrument_at] == instrument_written.kid_issue_date[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  assert(instrument_read.value_at_risk == instrument_written.value_at_risk);
  instrument_at = 0;
  do
  :: instrument_at < 4 -> assert(instrument_read.external_underlying_id[instrument_at] == instrument_written.external_underlying_id[instrument_at]); instrument_at = instrument_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Accrued Interest Table Entry: 16 bytes ---------------------------------- */

/* Message describing an accrued interest table entry */
typedef AccruedInterestTableEntry {
  byte product_id[4];
  byte accrued_interest_table_entry_date[4];
  byte accrued_interest_table_entry_value[8]
};

int accrued_interest_table_entry_at;

/* every byte of Accrued Interest Table Entry set to one value */
inline fill_accrued_interest_table_entry(accrued_interest_table_entry_record, accrued_interest_table_entry_value_) {
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> accrued_interest_table_entry_record.product_id[accrued_interest_table_entry_at] = accrued_interest_table_entry_value_; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> accrued_interest_table_entry_record.accrued_interest_table_entry_date[accrued_interest_table_entry_at] = accrued_interest_table_entry_value_; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 8 -> accrued_interest_table_entry_record.accrued_interest_table_entry_value[accrued_interest_table_entry_at] = accrued_interest_table_entry_value_; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Accrued Interest Table Entry set to where it lies, so a field read out of place says so */
inline ramp_accrued_interest_table_entry(accrued_interest_table_entry_record, accrued_interest_table_entry_base) {
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> accrued_interest_table_entry_record.product_id[accrued_interest_table_entry_at] = (accrued_interest_table_entry_base + 0 + accrued_interest_table_entry_at + 1) % 256; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> accrued_interest_table_entry_record.accrued_interest_table_entry_date[accrued_interest_table_entry_at] = (accrued_interest_table_entry_base + 4 + accrued_interest_table_entry_at + 1) % 256; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 8 -> accrued_interest_table_entry_record.accrued_interest_table_entry_value[accrued_interest_table_entry_at] = (accrued_interest_table_entry_base + 8 + accrued_interest_table_entry_at + 1) % 256; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Accrued Interest Table Entry to the wire, 16 bytes from where the cursor stands */
inline encode_accrued_interest_table_entry(accrued_interest_table_entry_record) {
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> wire[at] = accrued_interest_table_entry_record.product_id[accrued_interest_table_entry_at]; at = at + 1; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> wire[at] = accrued_interest_table_entry_record.accrued_interest_table_entry_date[accrued_interest_table_entry_at]; at = at + 1; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 8 -> wire[at] = accrued_interest_table_entry_record.accrued_interest_table_entry_value[accrued_interest_table_entry_at]; at = at + 1; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Accrued Interest Table Entry off the wire, 16 bytes from where the cursor stands */
inline decode_accrued_interest_table_entry(accrued_interest_table_entry_record) {
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> accrued_interest_table_entry_record.product_id[accrued_interest_table_entry_at] = wire[at]; at = at + 1; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> accrued_interest_table_entry_record.accrued_interest_table_entry_date[accrued_interest_table_entry_at] = wire[at]; at = at + 1; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 8 -> accrued_interest_table_entry_record.accrued_interest_table_entry_value[accrued_interest_table_entry_at] = wire[at]; at = at + 1; accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Accrued Interest Table Entry is what was written, byte for byte */
inline equal_accrued_interest_table_entry(accrued_interest_table_entry_read, accrued_interest_table_entry_written) {
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> assert(accrued_interest_table_entry_read.product_id[accrued_interest_table_entry_at] == accrued_interest_table_entry_written.product_id[accrued_interest_table_entry_at]); accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 4 -> assert(accrued_interest_table_entry_read.accrued_interest_table_entry_date[accrued_interest_table_entry_at] == accrued_interest_table_entry_written.accrued_interest_table_entry_date[accrued_interest_table_entry_at]); accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  accrued_interest_table_entry_at = 0;
  do
  :: accrued_interest_table_entry_at < 8 -> assert(accrued_interest_table_entry_read.accrued_interest_table_entry_value[accrued_interest_table_entry_at] == accrued_interest_table_entry_written.accrued_interest_table_entry_value[accrued_interest_table_entry_at]); accrued_interest_table_entry_at = accrued_interest_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indexation Table Entry: 16 bytes ---------------------------------------- */

/* Message describing an indexation table entry */
typedef IndexationTableEntry {
  byte product_id[4];
  byte indexation_table_entry_date[4];
  byte indexation_table_entry_value[8]
};

int indexation_table_entry_at;

/* every byte of Indexation Table Entry set to one value */
inline fill_indexation_table_entry(indexation_table_entry_record, indexation_table_entry_value_) {
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> indexation_table_entry_record.product_id[indexation_table_entry_at] = indexation_table_entry_value_; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> indexation_table_entry_record.indexation_table_entry_date[indexation_table_entry_at] = indexation_table_entry_value_; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 8 -> indexation_table_entry_record.indexation_table_entry_value[indexation_table_entry_at] = indexation_table_entry_value_; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Indexation Table Entry set to where it lies, so a field read out of place says so */
inline ramp_indexation_table_entry(indexation_table_entry_record, indexation_table_entry_base) {
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> indexation_table_entry_record.product_id[indexation_table_entry_at] = (indexation_table_entry_base + 0 + indexation_table_entry_at + 1) % 256; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> indexation_table_entry_record.indexation_table_entry_date[indexation_table_entry_at] = (indexation_table_entry_base + 4 + indexation_table_entry_at + 1) % 256; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 8 -> indexation_table_entry_record.indexation_table_entry_value[indexation_table_entry_at] = (indexation_table_entry_base + 8 + indexation_table_entry_at + 1) % 256; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Indexation Table Entry to the wire, 16 bytes from where the cursor stands */
inline encode_indexation_table_entry(indexation_table_entry_record) {
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> wire[at] = indexation_table_entry_record.product_id[indexation_table_entry_at]; at = at + 1; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> wire[at] = indexation_table_entry_record.indexation_table_entry_date[indexation_table_entry_at]; at = at + 1; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 8 -> wire[at] = indexation_table_entry_record.indexation_table_entry_value[indexation_table_entry_at]; at = at + 1; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Indexation Table Entry off the wire, 16 bytes from where the cursor stands */
inline decode_indexation_table_entry(indexation_table_entry_record) {
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> indexation_table_entry_record.product_id[indexation_table_entry_at] = wire[at]; at = at + 1; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> indexation_table_entry_record.indexation_table_entry_date[indexation_table_entry_at] = wire[at]; at = at + 1; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 8 -> indexation_table_entry_record.indexation_table_entry_value[indexation_table_entry_at] = wire[at]; at = at + 1; indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Indexation Table Entry is what was written, byte for byte */
inline equal_indexation_table_entry(indexation_table_entry_read, indexation_table_entry_written) {
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> assert(indexation_table_entry_read.product_id[indexation_table_entry_at] == indexation_table_entry_written.product_id[indexation_table_entry_at]); indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 4 -> assert(indexation_table_entry_read.indexation_table_entry_date[indexation_table_entry_at] == indexation_table_entry_written.indexation_table_entry_date[indexation_table_entry_at]); indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  indexation_table_entry_at = 0;
  do
  :: indexation_table_entry_at < 8 -> assert(indexation_table_entry_read.indexation_table_entry_value[indexation_table_entry_at] == indexation_table_entry_written.indexation_table_entry_value[indexation_table_entry_at]); indexation_table_entry_at = indexation_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Product Identification Public Product Identification: 31 bytes ---------- */

/* PublicProductIdentification */
typedef ProductIdentificationPublicProductIdentification {
  byte product_identification_product_identification[30];
  byte product_identification_type
};

int product_identification_public_product_identification_at;

/* every byte of Product Identification Public Product Identification set to one value */
inline fill_product_identification_public_product_identification(product_identification_public_product_identification_record, product_identification_public_product_identification_value) {
  product_identification_public_product_identification_at = 0;
  do
  :: product_identification_public_product_identification_at < 30 -> product_identification_public_product_identification_record.product_identification_product_identification[product_identification_public_product_identification_at] = product_identification_public_product_identification_value; product_identification_public_product_identification_at = product_identification_public_product_identification_at + 1
  :: else -> break
  od;
  product_identification_public_product_identification_record.product_identification_type = product_identification_public_product_identification_value;
  skip
}

/* each byte of Product Identification Public Product Identification set to where it lies, so a field read out of place says so */
inline ramp_product_identification_public_product_identification(product_identification_public_product_identification_record, product_identification_public_product_identification_base) {
  product_identification_public_product_identification_at = 0;
  do
  :: product_identification_public_product_identification_at < 30 -> product_identification_public_product_identification_record.product_identification_product_identification[product_identification_public_product_identification_at] = (product_identification_public_product_identification_base + 0 + product_identification_public_product_identification_at + 1) % 256; product_identification_public_product_identification_at = product_identification_public_product_identification_at + 1
  :: else -> break
  od;
  product_identification_public_product_identification_record.product_identification_type = (product_identification_public_product_identification_base + 30 + 1) % 256;
  skip
}

/* Product Identification Public Product Identification to the wire, 31 bytes from where the cursor stands */
inline encode_product_identification_public_product_identification(product_identification_public_product_identification_record) {
  product_identification_public_product_identification_at = 0;
  do
  :: product_identification_public_product_identification_at < 30 -> wire[at] = product_identification_public_product_identification_record.product_identification_product_identification[product_identification_public_product_identification_at]; at = at + 1; product_identification_public_product_identification_at = product_identification_public_product_identification_at + 1
  :: else -> break
  od;
  wire[at] = product_identification_public_product_identification_record.product_identification_type; at = at + 1;
  skip
}

/* Product Identification Public Product Identification off the wire, 31 bytes from where the cursor stands */
inline decode_product_identification_public_product_identification(product_identification_public_product_identification_record) {
  product_identification_public_product_identification_at = 0;
  do
  :: product_identification_public_product_identification_at < 30 -> product_identification_public_product_identification_record.product_identification_product_identification[product_identification_public_product_identification_at] = wire[at]; at = at + 1; product_identification_public_product_identification_at = product_identification_public_product_identification_at + 1
  :: else -> break
  od;
  product_identification_public_product_identification_record.product_identification_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Product Identification Public Product Identification is what was written, byte for byte */
inline equal_product_identification_public_product_identification(product_identification_public_product_identification_read, product_identification_public_product_identification_written) {
  product_identification_public_product_identification_at = 0;
  do
  :: product_identification_public_product_identification_at < 30 -> assert(product_identification_public_product_identification_read.product_identification_product_identification[product_identification_public_product_identification_at] == product_identification_public_product_identification_written.product_identification_product_identification[product_identification_public_product_identification_at]); product_identification_public_product_identification_at = product_identification_public_product_identification_at + 1
  :: else -> break
  od;
  assert(product_identification_public_product_identification_read.product_identification_type == product_identification_public_product_identification_written.product_identification_type);
  skip
}

/* ---- Index Underlying: 32 bytes ---------------------------------------------- */

/* IndexUnderlying */
typedef IndexUnderlying {
  ProductIdentificationPublicProductIdentification product_identification_public_product_identification;
  byte index_underlying_type
};

/* every byte of Index Underlying set to one value */
inline fill_index_underlying(index_underlying_record, index_underlying_value) {
  fill_product_identification_public_product_identification(index_underlying_record.product_identification_public_product_identification, index_underlying_value);
  index_underlying_record.index_underlying_type = index_underlying_value;
  skip
}

/* each byte of Index Underlying set to where it lies, so a field read out of place says so */
inline ramp_index_underlying(index_underlying_record, index_underlying_base) {
  ramp_product_identification_public_product_identification(index_underlying_record.product_identification_public_product_identification, index_underlying_base + 0);
  index_underlying_record.index_underlying_type = (index_underlying_base + 31 + 1) % 256;
  skip
}

/* Index Underlying to the wire, 32 bytes from where the cursor stands */
inline encode_index_underlying(index_underlying_record) {
  encode_product_identification_public_product_identification(index_underlying_record.product_identification_public_product_identification);
  wire[at] = index_underlying_record.index_underlying_type; at = at + 1;
  skip
}

/* Index Underlying off the wire, 32 bytes from where the cursor stands */
inline decode_index_underlying(index_underlying_record) {
  decode_product_identification_public_product_identification(index_underlying_record.product_identification_public_product_identification);
  index_underlying_record.index_underlying_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Underlying is what was written, byte for byte */
inline equal_index_underlying(index_underlying_read, index_underlying_written) {
  equal_product_identification_public_product_identification(index_underlying_read.product_identification_public_product_identification, index_underlying_written.product_identification_public_product_identification);
  assert(index_underlying_read.index_underlying_type == index_underlying_written.index_underlying_type);
  skip
}

/* ---- Public Product Identification: 31 bytes --------------------------------- */

/* PublicProductIdentification */
typedef PublicProductIdentification {
  byte product_identification_product_identification[30];
  byte product_identification_type
};

int public_product_identification_at;

/* every byte of Public Product Identification set to one value */
inline fill_public_product_identification(public_product_identification_record, public_product_identification_value) {
  public_product_identification_at = 0;
  do
  :: public_product_identification_at < 30 -> public_product_identification_record.product_identification_product_identification[public_product_identification_at] = public_product_identification_value; public_product_identification_at = public_product_identification_at + 1
  :: else -> break
  od;
  public_product_identification_record.product_identification_type = public_product_identification_value;
  skip
}

/* each byte of Public Product Identification set to where it lies, so a field read out of place says so */
inline ramp_public_product_identification(public_product_identification_record, public_product_identification_base) {
  public_product_identification_at = 0;
  do
  :: public_product_identification_at < 30 -> public_product_identification_record.product_identification_product_identification[public_product_identification_at] = (public_product_identification_base + 0 + public_product_identification_at + 1) % 256; public_product_identification_at = public_product_identification_at + 1
  :: else -> break
  od;
  public_product_identification_record.product_identification_type = (public_product_identification_base + 30 + 1) % 256;
  skip
}

/* Public Product Identification to the wire, 31 bytes from where the cursor stands */
inline encode_public_product_identification(public_product_identification_record) {
  public_product_identification_at = 0;
  do
  :: public_product_identification_at < 30 -> wire[at] = public_product_identification_record.product_identification_product_identification[public_product_identification_at]; at = at + 1; public_product_identification_at = public_product_identification_at + 1
  :: else -> break
  od;
  wire[at] = public_product_identification_record.product_identification_type; at = at + 1;
  skip
}

/* Public Product Identification off the wire, 31 bytes from where the cursor stands */
inline decode_public_product_identification(public_product_identification_record) {
  public_product_identification_at = 0;
  do
  :: public_product_identification_at < 30 -> public_product_identification_record.product_identification_product_identification[public_product_identification_at] = wire[at]; at = at + 1; public_product_identification_at = public_product_identification_at + 1
  :: else -> break
  od;
  public_product_identification_record.product_identification_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Public Product Identification is what was written, byte for byte */
inline equal_public_product_identification(public_product_identification_read, public_product_identification_written) {
  public_product_identification_at = 0;
  do
  :: public_product_identification_at < 30 -> assert(public_product_identification_read.product_identification_product_identification[public_product_identification_at] == public_product_identification_written.product_identification_product_identification[public_product_identification_at]); public_product_identification_at = public_product_identification_at + 1
  :: else -> break
  od;
  assert(public_product_identification_read.product_identification_type == public_product_identification_written.product_identification_type);
  skip
}

/* ---- Auction Summary: 21 bytes ----------------------------------------------- */

/* Auction summary, including auction price and quantity */
typedef AuctionSummary {
  byte instrument_id[4];
  byte price[8];
  byte quantity[8];
  byte auction_type
};

int auction_summary_at;

/* every byte of Auction Summary set to one value */
inline fill_auction_summary(auction_summary_record, auction_summary_value) {
  auction_summary_at = 0;
  do
  :: auction_summary_at < 4 -> auction_summary_record.instrument_id[auction_summary_at] = auction_summary_value; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> auction_summary_record.price[auction_summary_at] = auction_summary_value; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> auction_summary_record.quantity[auction_summary_at] = auction_summary_value; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_record.auction_type = auction_summary_value;
  skip
}

/* each byte of Auction Summary set to where it lies, so a field read out of place says so */
inline ramp_auction_summary(auction_summary_record, auction_summary_base) {
  auction_summary_at = 0;
  do
  :: auction_summary_at < 4 -> auction_summary_record.instrument_id[auction_summary_at] = (auction_summary_base + 0 + auction_summary_at + 1) % 256; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> auction_summary_record.price[auction_summary_at] = (auction_summary_base + 4 + auction_summary_at + 1) % 256; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> auction_summary_record.quantity[auction_summary_at] = (auction_summary_base + 12 + auction_summary_at + 1) % 256; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_record.auction_type = (auction_summary_base + 20 + 1) % 256;
  skip
}

/* Auction Summary to the wire, 21 bytes from where the cursor stands */
inline encode_auction_summary(auction_summary_record) {
  auction_summary_at = 0;
  do
  :: auction_summary_at < 4 -> wire[at] = auction_summary_record.instrument_id[auction_summary_at]; at = at + 1; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> wire[at] = auction_summary_record.price[auction_summary_at]; at = at + 1; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> wire[at] = auction_summary_record.quantity[auction_summary_at]; at = at + 1; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_record.auction_type; at = at + 1;
  skip
}

/* Auction Summary off the wire, 21 bytes from where the cursor stands */
inline decode_auction_summary(auction_summary_record) {
  auction_summary_at = 0;
  do
  :: auction_summary_at < 4 -> auction_summary_record.instrument_id[auction_summary_at] = wire[at]; at = at + 1; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> auction_summary_record.price[auction_summary_at] = wire[at]; at = at + 1; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> auction_summary_record.quantity[auction_summary_at] = wire[at]; at = at + 1; auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_record.auction_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Summary is what was written, byte for byte */
inline equal_auction_summary(auction_summary_read, auction_summary_written) {
  auction_summary_at = 0;
  do
  :: auction_summary_at < 4 -> assert(auction_summary_read.instrument_id[auction_summary_at] == auction_summary_written.instrument_id[auction_summary_at]); auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> assert(auction_summary_read.price[auction_summary_at] == auction_summary_written.price[auction_summary_at]); auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  auction_summary_at = 0;
  do
  :: auction_summary_at < 8 -> assert(auction_summary_read.quantity[auction_summary_at] == auction_summary_written.quantity[auction_summary_at]); auction_summary_at = auction_summary_at + 1
  :: else -> break
  od;
  assert(auction_summary_read.auction_type == auction_summary_written.auction_type);
  skip
}

/* ---- Auction Update: 68 bytes ------------------------------------------------ */

/* Updates IMP/IMV and BBO during an auction */
typedef AuctionUpdate {
  byte instrument_id[4];
  byte indicative_matching_price[8];
  byte indicative_matching_volume[8];
  byte total_sell_quantity_at_imp[8];
  byte total_buy_quantity_at_imp[8];
  byte best_sell_level[8];
  byte best_sell_level_quantity[8];
  byte best_buy_level[8];
  byte best_buy_level_quantity[8]
};

int auction_update_at;

/* every byte of Auction Update set to one value */
inline fill_auction_update(auction_update_record, auction_update_value) {
  auction_update_at = 0;
  do
  :: auction_update_at < 4 -> auction_update_record.instrument_id[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.indicative_matching_price[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.indicative_matching_volume[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.total_sell_quantity_at_imp[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.total_buy_quantity_at_imp[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_sell_level[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_sell_level_quantity[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_buy_level[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_buy_level_quantity[auction_update_at] = auction_update_value; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Update set to where it lies, so a field read out of place says so */
inline ramp_auction_update(auction_update_record, auction_update_base) {
  auction_update_at = 0;
  do
  :: auction_update_at < 4 -> auction_update_record.instrument_id[auction_update_at] = (auction_update_base + 0 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.indicative_matching_price[auction_update_at] = (auction_update_base + 4 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.indicative_matching_volume[auction_update_at] = (auction_update_base + 12 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.total_sell_quantity_at_imp[auction_update_at] = (auction_update_base + 20 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.total_buy_quantity_at_imp[auction_update_at] = (auction_update_base + 28 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_sell_level[auction_update_at] = (auction_update_base + 36 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_sell_level_quantity[auction_update_at] = (auction_update_base + 44 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_buy_level[auction_update_at] = (auction_update_base + 52 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_buy_level_quantity[auction_update_at] = (auction_update_base + 60 + auction_update_at + 1) % 256; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Update to the wire, 68 bytes from where the cursor stands */
inline encode_auction_update(auction_update_record) {
  auction_update_at = 0;
  do
  :: auction_update_at < 4 -> wire[at] = auction_update_record.instrument_id[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.indicative_matching_price[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.indicative_matching_volume[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.total_sell_quantity_at_imp[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.total_buy_quantity_at_imp[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.best_sell_level[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.best_sell_level_quantity[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.best_buy_level[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> wire[at] = auction_update_record.best_buy_level_quantity[auction_update_at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Update off the wire, 68 bytes from where the cursor stands */
inline decode_auction_update(auction_update_record) {
  auction_update_at = 0;
  do
  :: auction_update_at < 4 -> auction_update_record.instrument_id[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.indicative_matching_price[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.indicative_matching_volume[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.total_sell_quantity_at_imp[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.total_buy_quantity_at_imp[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_sell_level[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_sell_level_quantity[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_buy_level[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> auction_update_record.best_buy_level_quantity[auction_update_at] = wire[at]; at = at + 1; auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Update is what was written, byte for byte */
inline equal_auction_update(auction_update_read, auction_update_written) {
  auction_update_at = 0;
  do
  :: auction_update_at < 4 -> assert(auction_update_read.instrument_id[auction_update_at] == auction_update_written.instrument_id[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.indicative_matching_price[auction_update_at] == auction_update_written.indicative_matching_price[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.indicative_matching_volume[auction_update_at] == auction_update_written.indicative_matching_volume[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.total_sell_quantity_at_imp[auction_update_at] == auction_update_written.total_sell_quantity_at_imp[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.total_buy_quantity_at_imp[auction_update_at] == auction_update_written.total_buy_quantity_at_imp[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.best_sell_level[auction_update_at] == auction_update_written.best_sell_level[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.best_sell_level_quantity[auction_update_at] == auction_update_written.best_sell_level_quantity[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.best_buy_level[auction_update_at] == auction_update_written.best_buy_level[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  auction_update_at = 0;
  do
  :: auction_update_at < 8 -> assert(auction_update_read.best_buy_level_quantity[auction_update_at] == auction_update_written.best_buy_level_quantity[auction_update_at]); auction_update_at = auction_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Level: 31 bytes --------------------------------------------------- */

/* PriceLevel */
typedef PriceLevel {
  byte is_encrypted;
  byte encryption_offset[8];
  byte encryption_key_id[4];
  byte price[8];
  byte quantity[8];
  byte order_count[2]
};

int price_level_at;

/* every byte of Price Level set to one value */
inline fill_price_level(price_level_record, price_level_value) {
  price_level_record.is_encrypted = price_level_value;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.encryption_offset[price_level_at] = price_level_value; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 4 -> price_level_record.encryption_key_id[price_level_at] = price_level_value; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.price[price_level_at] = price_level_value; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.quantity[price_level_at] = price_level_value; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 2 -> price_level_record.order_count[price_level_at] = price_level_value; price_level_at = price_level_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Level set to where it lies, so a field read out of place says so */
inline ramp_price_level(price_level_record, price_level_base) {
  price_level_record.is_encrypted = (price_level_base + 0 + 1) % 256;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.encryption_offset[price_level_at] = (price_level_base + 1 + price_level_at + 1) % 256; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 4 -> price_level_record.encryption_key_id[price_level_at] = (price_level_base + 9 + price_level_at + 1) % 256; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.price[price_level_at] = (price_level_base + 13 + price_level_at + 1) % 256; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.quantity[price_level_at] = (price_level_base + 21 + price_level_at + 1) % 256; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 2 -> price_level_record.order_count[price_level_at] = (price_level_base + 29 + price_level_at + 1) % 256; price_level_at = price_level_at + 1
  :: else -> break
  od;
  skip
}

/* Price Level to the wire, 31 bytes from where the cursor stands */
inline encode_price_level(price_level_record) {
  wire[at] = price_level_record.is_encrypted; at = at + 1;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> wire[at] = price_level_record.encryption_offset[price_level_at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 4 -> wire[at] = price_level_record.encryption_key_id[price_level_at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> wire[at] = price_level_record.price[price_level_at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> wire[at] = price_level_record.quantity[price_level_at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 2 -> wire[at] = price_level_record.order_count[price_level_at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  skip
}

/* Price Level off the wire, 31 bytes from where the cursor stands */
inline decode_price_level(price_level_record) {
  price_level_record.is_encrypted = wire[at]; at = at + 1;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.encryption_offset[price_level_at] = wire[at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 4 -> price_level_record.encryption_key_id[price_level_at] = wire[at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.price[price_level_at] = wire[at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> price_level_record.quantity[price_level_at] = wire[at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 2 -> price_level_record.order_count[price_level_at] = wire[at]; at = at + 1; price_level_at = price_level_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Level is what was written, byte for byte */
inline equal_price_level(price_level_read, price_level_written) {
  assert(price_level_read.is_encrypted == price_level_written.is_encrypted);
  price_level_at = 0;
  do
  :: price_level_at < 8 -> assert(price_level_read.encryption_offset[price_level_at] == price_level_written.encryption_offset[price_level_at]); price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 4 -> assert(price_level_read.encryption_key_id[price_level_at] == price_level_written.encryption_key_id[price_level_at]); price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> assert(price_level_read.price[price_level_at] == price_level_written.price[price_level_at]); price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 8 -> assert(price_level_read.quantity[price_level_at] == price_level_written.quantity[price_level_at]); price_level_at = price_level_at + 1
  :: else -> break
  od;
  price_level_at = 0;
  do
  :: price_level_at < 2 -> assert(price_level_read.order_count[price_level_at] == price_level_written.order_count[price_level_at]); price_level_at = price_level_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Price Level Update: 23 bytes ---------------------------------------- */

/* BBO Level 1 */
typedef TopPriceLevelUpdate {
  byte instrument_id[4];
  byte price[8];
  byte quantity[8];
  byte side;
  byte order_count[2]
};

int top_price_level_update_at;

/* every byte of Top Price Level Update set to one value */
inline fill_top_price_level_update(top_price_level_update_record, top_price_level_update_value) {
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 4 -> top_price_level_update_record.instrument_id[top_price_level_update_at] = top_price_level_update_value; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> top_price_level_update_record.price[top_price_level_update_at] = top_price_level_update_value; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> top_price_level_update_record.quantity[top_price_level_update_at] = top_price_level_update_value; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_record.side = top_price_level_update_value;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 2 -> top_price_level_update_record.order_count[top_price_level_update_at] = top_price_level_update_value; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Top Price Level Update set to where it lies, so a field read out of place says so */
inline ramp_top_price_level_update(top_price_level_update_record, top_price_level_update_base) {
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 4 -> top_price_level_update_record.instrument_id[top_price_level_update_at] = (top_price_level_update_base + 0 + top_price_level_update_at + 1) % 256; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> top_price_level_update_record.price[top_price_level_update_at] = (top_price_level_update_base + 4 + top_price_level_update_at + 1) % 256; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> top_price_level_update_record.quantity[top_price_level_update_at] = (top_price_level_update_base + 12 + top_price_level_update_at + 1) % 256; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_record.side = (top_price_level_update_base + 20 + 1) % 256;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 2 -> top_price_level_update_record.order_count[top_price_level_update_at] = (top_price_level_update_base + 21 + top_price_level_update_at + 1) % 256; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  skip
}

/* Top Price Level Update to the wire, 23 bytes from where the cursor stands */
inline encode_top_price_level_update(top_price_level_update_record) {
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 4 -> wire[at] = top_price_level_update_record.instrument_id[top_price_level_update_at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> wire[at] = top_price_level_update_record.price[top_price_level_update_at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> wire[at] = top_price_level_update_record.quantity[top_price_level_update_at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  wire[at] = top_price_level_update_record.side; at = at + 1;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 2 -> wire[at] = top_price_level_update_record.order_count[top_price_level_update_at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  skip
}

/* Top Price Level Update off the wire, 23 bytes from where the cursor stands */
inline decode_top_price_level_update(top_price_level_update_record) {
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 4 -> top_price_level_update_record.instrument_id[top_price_level_update_at] = wire[at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> top_price_level_update_record.price[top_price_level_update_at] = wire[at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> top_price_level_update_record.quantity[top_price_level_update_at] = wire[at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_record.side = wire[at]; at = at + 1;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 2 -> top_price_level_update_record.order_count[top_price_level_update_at] = wire[at]; at = at + 1; top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Top Price Level Update is what was written, byte for byte */
inline equal_top_price_level_update(top_price_level_update_read, top_price_level_update_written) {
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 4 -> assert(top_price_level_update_read.instrument_id[top_price_level_update_at] == top_price_level_update_written.instrument_id[top_price_level_update_at]); top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> assert(top_price_level_update_read.price[top_price_level_update_at] == top_price_level_update_written.price[top_price_level_update_at]); top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 8 -> assert(top_price_level_update_read.quantity[top_price_level_update_at] == top_price_level_update_written.quantity[top_price_level_update_at]); top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  assert(top_price_level_update_read.side == top_price_level_update_written.side);
  top_price_level_update_at = 0;
  do
  :: top_price_level_update_at < 2 -> assert(top_price_level_update_read.order_count[top_price_level_update_at] == top_price_level_update_written.order_count[top_price_level_update_at]); top_price_level_update_at = top_price_level_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade: 178 bytes -------------------------------------------------------- */

/* Enriched trade report */
typedef Trade {
  byte instrument_id[4];
  byte settlement_value_value[8];
  byte settlement_date[4];
  byte trading_timestamp[8];
  PublicProductIdentification public_product_identification;
  byte price[8];
  byte price_currency[2];
  byte price_notation;
  byte quantity[8];
  byte nominal_value_value[8];
  byte nominal_currency[2];
  byte mic[4];
  byte publication_timestamp[8];
  byte trade_id[4];
  byte trade_to_be_cleared;
  byte pct_change[8];
  byte vwap[8];
  byte no_trades[8];
  byte total_volume[8];
  byte total_value[8];
  byte opening_price[8];
  byte max_price[8];
  byte min_price[8];
  byte mmt_market_mechanism;
  byte mmt_trading_mode;
  byte mmt_transaction_category;
  byte mmt_negotiation_indicator;
  byte mmt_agency_cross_trade_indicator;
  byte mmt_modification_indicator;
  byte mmt_benchmark_reference_price_indicator;
  byte mmt_special_dividend_indicator;
  byte mmt_off_book_automated_indicator;
  byte mmt_ordinary_trade_indicator;
  byte mmt_algorithmic_indicator;
  byte mmt_post_trade_deferral_reason;
  byte mmt_post_trade_deferral_type
};

int trade_at;

/* every byte of Trade set to one value */
inline fill_trade(trade_record, trade_value) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.instrument_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.settlement_value_value[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.settlement_date[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trading_timestamp[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  fill_public_product_identification(trade_record.public_product_identification, trade_value);
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.price_currency[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.price_notation = trade_value;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.quantity[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.nominal_value_value[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.nominal_currency[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.mic[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.publication_timestamp[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.trade_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.trade_to_be_cleared = trade_value;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.pct_change[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.vwap[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.no_trades[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.total_volume[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.total_value[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.opening_price[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.max_price[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.min_price[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.mmt_market_mechanism = trade_value;
  trade_record.mmt_trading_mode = trade_value;
  trade_record.mmt_transaction_category = trade_value;
  trade_record.mmt_negotiation_indicator = trade_value;
  trade_record.mmt_agency_cross_trade_indicator = trade_value;
  trade_record.mmt_modification_indicator = trade_value;
  trade_record.mmt_benchmark_reference_price_indicator = trade_value;
  trade_record.mmt_special_dividend_indicator = trade_value;
  trade_record.mmt_off_book_automated_indicator = trade_value;
  trade_record.mmt_ordinary_trade_indicator = trade_value;
  trade_record.mmt_algorithmic_indicator = trade_value;
  trade_record.mmt_post_trade_deferral_reason = trade_value;
  trade_record.mmt_post_trade_deferral_type = trade_value;
  skip
}

/* each byte of Trade set to where it lies, so a field read out of place says so */
inline ramp_trade(trade_record, trade_base) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.instrument_id[trade_at] = (trade_base + 0 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.settlement_value_value[trade_at] = (trade_base + 4 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.settlement_date[trade_at] = (trade_base + 12 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trading_timestamp[trade_at] = (trade_base + 16 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  ramp_public_product_identification(trade_record.public_product_identification, trade_base + 24);
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = (trade_base + 55 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.price_currency[trade_at] = (trade_base + 63 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.price_notation = (trade_base + 65 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.quantity[trade_at] = (trade_base + 66 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.nominal_value_value[trade_at] = (trade_base + 74 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.nominal_currency[trade_at] = (trade_base + 82 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.mic[trade_at] = (trade_base + 84 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.publication_timestamp[trade_at] = (trade_base + 88 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.trade_id[trade_at] = (trade_base + 96 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.trade_to_be_cleared = (trade_base + 100 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.pct_change[trade_at] = (trade_base + 101 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.vwap[trade_at] = (trade_base + 109 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.no_trades[trade_at] = (trade_base + 117 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.total_volume[trade_at] = (trade_base + 125 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.total_value[trade_at] = (trade_base + 133 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.opening_price[trade_at] = (trade_base + 141 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.max_price[trade_at] = (trade_base + 149 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.min_price[trade_at] = (trade_base + 157 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.mmt_market_mechanism = (trade_base + 165 + 1) % 256;
  trade_record.mmt_trading_mode = (trade_base + 166 + 1) % 256;
  trade_record.mmt_transaction_category = (trade_base + 167 + 1) % 256;
  trade_record.mmt_negotiation_indicator = (trade_base + 168 + 1) % 256;
  trade_record.mmt_agency_cross_trade_indicator = (trade_base + 169 + 1) % 256;
  trade_record.mmt_modification_indicator = (trade_base + 170 + 1) % 256;
  trade_record.mmt_benchmark_reference_price_indicator = (trade_base + 171 + 1) % 256;
  trade_record.mmt_special_dividend_indicator = (trade_base + 172 + 1) % 256;
  trade_record.mmt_off_book_automated_indicator = (trade_base + 173 + 1) % 256;
  trade_record.mmt_ordinary_trade_indicator = (trade_base + 174 + 1) % 256;
  trade_record.mmt_algorithmic_indicator = (trade_base + 175 + 1) % 256;
  trade_record.mmt_post_trade_deferral_reason = (trade_base + 176 + 1) % 256;
  trade_record.mmt_post_trade_deferral_type = (trade_base + 177 + 1) % 256;
  skip
}

/* Trade to the wire, 178 bytes from where the cursor stands */
inline encode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.instrument_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.settlement_value_value[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.settlement_date[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.trading_timestamp[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  encode_public_product_identification(trade_record.public_product_identification);
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.price[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> wire[at] = trade_record.price_currency[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.price_notation; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.quantity[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.nominal_value_value[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> wire[at] = trade_record.nominal_currency[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.mic[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.publication_timestamp[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.trade_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.trade_to_be_cleared; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.pct_change[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.vwap[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.no_trades[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.total_volume[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.total_value[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.opening_price[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.max_price[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.min_price[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.mmt_market_mechanism; at = at + 1;
  wire[at] = trade_record.mmt_trading_mode; at = at + 1;
  wire[at] = trade_record.mmt_transaction_category; at = at + 1;
  wire[at] = trade_record.mmt_negotiation_indicator; at = at + 1;
  wire[at] = trade_record.mmt_agency_cross_trade_indicator; at = at + 1;
  wire[at] = trade_record.mmt_modification_indicator; at = at + 1;
  wire[at] = trade_record.mmt_benchmark_reference_price_indicator; at = at + 1;
  wire[at] = trade_record.mmt_special_dividend_indicator; at = at + 1;
  wire[at] = trade_record.mmt_off_book_automated_indicator; at = at + 1;
  wire[at] = trade_record.mmt_ordinary_trade_indicator; at = at + 1;
  wire[at] = trade_record.mmt_algorithmic_indicator; at = at + 1;
  wire[at] = trade_record.mmt_post_trade_deferral_reason; at = at + 1;
  wire[at] = trade_record.mmt_post_trade_deferral_type; at = at + 1;
  skip
}

/* Trade off the wire, 178 bytes from where the cursor stands */
inline decode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.instrument_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.settlement_value_value[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.settlement_date[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trading_timestamp[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  decode_public_product_identification(trade_record.public_product_identification);
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.price[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.price_currency[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.price_notation = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.quantity[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.nominal_value_value[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.nominal_currency[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.mic[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.publication_timestamp[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.trade_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.trade_to_be_cleared = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.pct_change[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.vwap[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.no_trades[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.total_volume[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.total_value[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.opening_price[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.max_price[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.min_price[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.mmt_market_mechanism = wire[at]; at = at + 1;
  trade_record.mmt_trading_mode = wire[at]; at = at + 1;
  trade_record.mmt_transaction_category = wire[at]; at = at + 1;
  trade_record.mmt_negotiation_indicator = wire[at]; at = at + 1;
  trade_record.mmt_agency_cross_trade_indicator = wire[at]; at = at + 1;
  trade_record.mmt_modification_indicator = wire[at]; at = at + 1;
  trade_record.mmt_benchmark_reference_price_indicator = wire[at]; at = at + 1;
  trade_record.mmt_special_dividend_indicator = wire[at]; at = at + 1;
  trade_record.mmt_off_book_automated_indicator = wire[at]; at = at + 1;
  trade_record.mmt_ordinary_trade_indicator = wire[at]; at = at + 1;
  trade_record.mmt_algorithmic_indicator = wire[at]; at = at + 1;
  trade_record.mmt_post_trade_deferral_reason = wire[at]; at = at + 1;
  trade_record.mmt_post_trade_deferral_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade is what was written, byte for byte */
inline equal_trade(trade_read, trade_written) {
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.instrument_id[trade_at] == trade_written.instrument_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.settlement_value_value[trade_at] == trade_written.settlement_value_value[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.settlement_date[trade_at] == trade_written.settlement_date[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.trading_timestamp[trade_at] == trade_written.trading_timestamp[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  equal_public_product_identification(trade_read.public_product_identification, trade_written.public_product_identification);
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.price[trade_at] == trade_written.price[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> assert(trade_read.price_currency[trade_at] == trade_written.price_currency[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.price_notation == trade_written.price_notation);
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.quantity[trade_at] == trade_written.quantity[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.nominal_value_value[trade_at] == trade_written.nominal_value_value[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> assert(trade_read.nominal_currency[trade_at] == trade_written.nominal_currency[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.mic[trade_at] == trade_written.mic[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.publication_timestamp[trade_at] == trade_written.publication_timestamp[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.trade_id[trade_at] == trade_written.trade_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.trade_to_be_cleared == trade_written.trade_to_be_cleared);
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.pct_change[trade_at] == trade_written.pct_change[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.vwap[trade_at] == trade_written.vwap[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.no_trades[trade_at] == trade_written.no_trades[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.total_volume[trade_at] == trade_written.total_volume[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.total_value[trade_at] == trade_written.total_value[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.opening_price[trade_at] == trade_written.opening_price[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.max_price[trade_at] == trade_written.max_price[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.min_price[trade_at] == trade_written.min_price[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.mmt_market_mechanism == trade_written.mmt_market_mechanism);
  assert(trade_read.mmt_trading_mode == trade_written.mmt_trading_mode);
  assert(trade_read.mmt_transaction_category == trade_written.mmt_transaction_category);
  assert(trade_read.mmt_negotiation_indicator == trade_written.mmt_negotiation_indicator);
  assert(trade_read.mmt_agency_cross_trade_indicator == trade_written.mmt_agency_cross_trade_indicator);
  assert(trade_read.mmt_modification_indicator == trade_written.mmt_modification_indicator);
  assert(trade_read.mmt_benchmark_reference_price_indicator == trade_written.mmt_benchmark_reference_price_indicator);
  assert(trade_read.mmt_special_dividend_indicator == trade_written.mmt_special_dividend_indicator);
  assert(trade_read.mmt_off_book_automated_indicator == trade_written.mmt_off_book_automated_indicator);
  assert(trade_read.mmt_ordinary_trade_indicator == trade_written.mmt_ordinary_trade_indicator);
  assert(trade_read.mmt_algorithmic_indicator == trade_written.mmt_algorithmic_indicator);
  assert(trade_read.mmt_post_trade_deferral_reason == trade_written.mmt_post_trade_deferral_reason);
  assert(trade_read.mmt_post_trade_deferral_type == trade_written.mmt_post_trade_deferral_type);
  skip
}

/* ---- Position Report: 40 bytes ----------------------------------------------- */

/* Report of open positions */
typedef PositionReport {
  PublicProductIdentification public_product_identification;
  byte pos_type;
  byte open_positions[4];
  byte trade_id[4]
};

int position_report_at;

/* every byte of Position Report set to one value */
inline fill_position_report(position_report_record, position_report_value) {
  fill_public_product_identification(position_report_record.public_product_identification, position_report_value);
  position_report_record.pos_type = position_report_value;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> position_report_record.open_positions[position_report_at] = position_report_value; position_report_at = position_report_at + 1
  :: else -> break
  od;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> position_report_record.trade_id[position_report_at] = position_report_value; position_report_at = position_report_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Position Report set to where it lies, so a field read out of place says so */
inline ramp_position_report(position_report_record, position_report_base) {
  ramp_public_product_identification(position_report_record.public_product_identification, position_report_base + 0);
  position_report_record.pos_type = (position_report_base + 31 + 1) % 256;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> position_report_record.open_positions[position_report_at] = (position_report_base + 32 + position_report_at + 1) % 256; position_report_at = position_report_at + 1
  :: else -> break
  od;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> position_report_record.trade_id[position_report_at] = (position_report_base + 36 + position_report_at + 1) % 256; position_report_at = position_report_at + 1
  :: else -> break
  od;
  skip
}

/* Position Report to the wire, 40 bytes from where the cursor stands */
inline encode_position_report(position_report_record) {
  encode_public_product_identification(position_report_record.public_product_identification);
  wire[at] = position_report_record.pos_type; at = at + 1;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> wire[at] = position_report_record.open_positions[position_report_at]; at = at + 1; position_report_at = position_report_at + 1
  :: else -> break
  od;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> wire[at] = position_report_record.trade_id[position_report_at]; at = at + 1; position_report_at = position_report_at + 1
  :: else -> break
  od;
  skip
}

/* Position Report off the wire, 40 bytes from where the cursor stands */
inline decode_position_report(position_report_record) {
  decode_public_product_identification(position_report_record.public_product_identification);
  position_report_record.pos_type = wire[at]; at = at + 1;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> position_report_record.open_positions[position_report_at] = wire[at]; at = at + 1; position_report_at = position_report_at + 1
  :: else -> break
  od;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> position_report_record.trade_id[position_report_at] = wire[at]; at = at + 1; position_report_at = position_report_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Position Report is what was written, byte for byte */
inline equal_position_report(position_report_read, position_report_written) {
  equal_public_product_identification(position_report_read.public_product_identification, position_report_written.public_product_identification);
  assert(position_report_read.pos_type == position_report_written.pos_type);
  position_report_at = 0;
  do
  :: position_report_at < 4 -> assert(position_report_read.open_positions[position_report_at] == position_report_written.open_positions[position_report_at]); position_report_at = position_report_at + 1
  :: else -> break
  od;
  position_report_at = 0;
  do
  :: position_report_at < 4 -> assert(position_report_read.trade_id[position_report_at] == position_report_written.trade_id[position_report_at]); position_report_at = position_report_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Status Change: 11 bytes -------------------------------------- */

/* Start of a new trading phase */
typedef InstrumentStatusChange {
  byte instrument_id[4];
  byte trading_phase_id[4];
  byte trading_phase_type;
  byte status;
  byte stressed_market
};

int instrument_status_change_at;

/* every byte of Instrument Status Change set to one value */
inline fill_instrument_status_change(instrument_status_change_record, instrument_status_change_value) {
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> instrument_status_change_record.instrument_id[instrument_status_change_at] = instrument_status_change_value; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> instrument_status_change_record.trading_phase_id[instrument_status_change_at] = instrument_status_change_value; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_record.trading_phase_type = instrument_status_change_value;
  instrument_status_change_record.status = instrument_status_change_value;
  instrument_status_change_record.stressed_market = instrument_status_change_value;
  skip
}

/* each byte of Instrument Status Change set to where it lies, so a field read out of place says so */
inline ramp_instrument_status_change(instrument_status_change_record, instrument_status_change_base) {
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> instrument_status_change_record.instrument_id[instrument_status_change_at] = (instrument_status_change_base + 0 + instrument_status_change_at + 1) % 256; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> instrument_status_change_record.trading_phase_id[instrument_status_change_at] = (instrument_status_change_base + 4 + instrument_status_change_at + 1) % 256; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_record.trading_phase_type = (instrument_status_change_base + 8 + 1) % 256;
  instrument_status_change_record.status = (instrument_status_change_base + 9 + 1) % 256;
  instrument_status_change_record.stressed_market = (instrument_status_change_base + 10 + 1) % 256;
  skip
}

/* Instrument Status Change to the wire, 11 bytes from where the cursor stands */
inline encode_instrument_status_change(instrument_status_change_record) {
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> wire[at] = instrument_status_change_record.instrument_id[instrument_status_change_at]; at = at + 1; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> wire[at] = instrument_status_change_record.trading_phase_id[instrument_status_change_at]; at = at + 1; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  wire[at] = instrument_status_change_record.trading_phase_type; at = at + 1;
  wire[at] = instrument_status_change_record.status; at = at + 1;
  wire[at] = instrument_status_change_record.stressed_market; at = at + 1;
  skip
}

/* Instrument Status Change off the wire, 11 bytes from where the cursor stands */
inline decode_instrument_status_change(instrument_status_change_record) {
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> instrument_status_change_record.instrument_id[instrument_status_change_at] = wire[at]; at = at + 1; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> instrument_status_change_record.trading_phase_id[instrument_status_change_at] = wire[at]; at = at + 1; instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_record.trading_phase_type = wire[at]; at = at + 1;
  instrument_status_change_record.status = wire[at]; at = at + 1;
  instrument_status_change_record.stressed_market = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Status Change is what was written, byte for byte */
inline equal_instrument_status_change(instrument_status_change_read, instrument_status_change_written) {
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> assert(instrument_status_change_read.instrument_id[instrument_status_change_at] == instrument_status_change_written.instrument_id[instrument_status_change_at]); instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  instrument_status_change_at = 0;
  do
  :: instrument_status_change_at < 4 -> assert(instrument_status_change_read.trading_phase_id[instrument_status_change_at] == instrument_status_change_written.trading_phase_id[instrument_status_change_at]); instrument_status_change_at = instrument_status_change_at + 1
  :: else -> break
  od;
  assert(instrument_status_change_read.trading_phase_type == instrument_status_change_written.trading_phase_type);
  assert(instrument_status_change_read.status == instrument_status_change_written.status);
  assert(instrument_status_change_read.stressed_market == instrument_status_change_written.stressed_market);
  skip
}

/* ---- Order Collars: 45 bytes ------------------------------------------------- */

/* New order price collars */
typedef OrderCollars {
  byte instrument_id[4];
  byte collar_type;
  byte price[8];
  byte lower_bid[8];
  byte upper_bid[8];
  byte lower_ask[8];
  byte upper_ask[8]
};

int order_collars_at;

/* every byte of Order Collars set to one value */
inline fill_order_collars(order_collars_record, order_collars_value) {
  order_collars_at = 0;
  do
  :: order_collars_at < 4 -> order_collars_record.instrument_id[order_collars_at] = order_collars_value; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_record.collar_type = order_collars_value;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.price[order_collars_at] = order_collars_value; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.lower_bid[order_collars_at] = order_collars_value; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.upper_bid[order_collars_at] = order_collars_value; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.lower_ask[order_collars_at] = order_collars_value; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.upper_ask[order_collars_at] = order_collars_value; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Collars set to where it lies, so a field read out of place says so */
inline ramp_order_collars(order_collars_record, order_collars_base) {
  order_collars_at = 0;
  do
  :: order_collars_at < 4 -> order_collars_record.instrument_id[order_collars_at] = (order_collars_base + 0 + order_collars_at + 1) % 256; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_record.collar_type = (order_collars_base + 4 + 1) % 256;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.price[order_collars_at] = (order_collars_base + 5 + order_collars_at + 1) % 256; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.lower_bid[order_collars_at] = (order_collars_base + 13 + order_collars_at + 1) % 256; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.upper_bid[order_collars_at] = (order_collars_base + 21 + order_collars_at + 1) % 256; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.lower_ask[order_collars_at] = (order_collars_base + 29 + order_collars_at + 1) % 256; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.upper_ask[order_collars_at] = (order_collars_base + 37 + order_collars_at + 1) % 256; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  skip
}

/* Order Collars to the wire, 45 bytes from where the cursor stands */
inline encode_order_collars(order_collars_record) {
  order_collars_at = 0;
  do
  :: order_collars_at < 4 -> wire[at] = order_collars_record.instrument_id[order_collars_at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  wire[at] = order_collars_record.collar_type; at = at + 1;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> wire[at] = order_collars_record.price[order_collars_at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> wire[at] = order_collars_record.lower_bid[order_collars_at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> wire[at] = order_collars_record.upper_bid[order_collars_at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> wire[at] = order_collars_record.lower_ask[order_collars_at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> wire[at] = order_collars_record.upper_ask[order_collars_at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  skip
}

/* Order Collars off the wire, 45 bytes from where the cursor stands */
inline decode_order_collars(order_collars_record) {
  order_collars_at = 0;
  do
  :: order_collars_at < 4 -> order_collars_record.instrument_id[order_collars_at] = wire[at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_record.collar_type = wire[at]; at = at + 1;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.price[order_collars_at] = wire[at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.lower_bid[order_collars_at] = wire[at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.upper_bid[order_collars_at] = wire[at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.lower_ask[order_collars_at] = wire[at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> order_collars_record.upper_ask[order_collars_at] = wire[at]; at = at + 1; order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Collars is what was written, byte for byte */
inline equal_order_collars(order_collars_read, order_collars_written) {
  order_collars_at = 0;
  do
  :: order_collars_at < 4 -> assert(order_collars_read.instrument_id[order_collars_at] == order_collars_written.instrument_id[order_collars_at]); order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  assert(order_collars_read.collar_type == order_collars_written.collar_type);
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> assert(order_collars_read.price[order_collars_at] == order_collars_written.price[order_collars_at]); order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> assert(order_collars_read.lower_bid[order_collars_at] == order_collars_written.lower_bid[order_collars_at]); order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> assert(order_collars_read.upper_bid[order_collars_at] == order_collars_written.upper_bid[order_collars_at]); order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> assert(order_collars_read.lower_ask[order_collars_at] == order_collars_written.lower_ask[order_collars_at]); order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  order_collars_at = 0;
  do
  :: order_collars_at < 8 -> assert(order_collars_read.upper_ask[order_collars_at] == order_collars_written.upper_ask[order_collars_at]); order_collars_at = order_collars_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Collars: 29 bytes ------------------------------------------------- */

/* New trade price collars */
typedef TradeCollars {
  byte instrument_id[4];
  byte collar_type;
  byte price[8];
  byte lower[8];
  byte upper[8]
};

int trade_collars_at;

/* every byte of Trade Collars set to one value */
inline fill_trade_collars(trade_collars_record, trade_collars_value) {
  trade_collars_at = 0;
  do
  :: trade_collars_at < 4 -> trade_collars_record.instrument_id[trade_collars_at] = trade_collars_value; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_record.collar_type = trade_collars_value;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.price[trade_collars_at] = trade_collars_value; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.lower[trade_collars_at] = trade_collars_value; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.upper[trade_collars_at] = trade_collars_value; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Collars set to where it lies, so a field read out of place says so */
inline ramp_trade_collars(trade_collars_record, trade_collars_base) {
  trade_collars_at = 0;
  do
  :: trade_collars_at < 4 -> trade_collars_record.instrument_id[trade_collars_at] = (trade_collars_base + 0 + trade_collars_at + 1) % 256; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_record.collar_type = (trade_collars_base + 4 + 1) % 256;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.price[trade_collars_at] = (trade_collars_base + 5 + trade_collars_at + 1) % 256; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.lower[trade_collars_at] = (trade_collars_base + 13 + trade_collars_at + 1) % 256; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.upper[trade_collars_at] = (trade_collars_base + 21 + trade_collars_at + 1) % 256; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Collars to the wire, 29 bytes from where the cursor stands */
inline encode_trade_collars(trade_collars_record) {
  trade_collars_at = 0;
  do
  :: trade_collars_at < 4 -> wire[at] = trade_collars_record.instrument_id[trade_collars_at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  wire[at] = trade_collars_record.collar_type; at = at + 1;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> wire[at] = trade_collars_record.price[trade_collars_at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> wire[at] = trade_collars_record.lower[trade_collars_at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> wire[at] = trade_collars_record.upper[trade_collars_at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Collars off the wire, 29 bytes from where the cursor stands */
inline decode_trade_collars(trade_collars_record) {
  trade_collars_at = 0;
  do
  :: trade_collars_at < 4 -> trade_collars_record.instrument_id[trade_collars_at] = wire[at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_record.collar_type = wire[at]; at = at + 1;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.price[trade_collars_at] = wire[at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.lower[trade_collars_at] = wire[at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> trade_collars_record.upper[trade_collars_at] = wire[at]; at = at + 1; trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Collars is what was written, byte for byte */
inline equal_trade_collars(trade_collars_read, trade_collars_written) {
  trade_collars_at = 0;
  do
  :: trade_collars_at < 4 -> assert(trade_collars_read.instrument_id[trade_collars_at] == trade_collars_written.instrument_id[trade_collars_at]); trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  assert(trade_collars_read.collar_type == trade_collars_written.collar_type);
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> assert(trade_collars_read.price[trade_collars_at] == trade_collars_written.price[trade_collars_at]); trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> assert(trade_collars_read.lower[trade_collars_at] == trade_collars_written.lower[trade_collars_at]); trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  trade_collars_at = 0;
  do
  :: trade_collars_at < 8 -> assert(trade_collars_read.upper[trade_collars_at] == trade_collars_written.upper[trade_collars_at]); trade_collars_at = trade_collars_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Summary: 95 bytes -------------------------------------------- */

/* Provides brief instrument summary */
typedef InstrumentSummary {
  byte instrument_id[4];
  byte last_traded_price[8];
  byte closing_price[8];
  byte closing_price_type;
  byte adjusted_closing_price[8];
  byte adjusted_closing_price_reason;
  byte pct_change[8];
  byte vwap[8];
  byte no_trades[8];
  byte total_volume[8];
  byte total_value[8];
  byte opening_price[8];
  byte max_price[8];
  byte min_price[8];
  byte is_correction
};

int instrument_summary_at;

/* every byte of Instrument Summary set to one value */
inline fill_instrument_summary(instrument_summary_record, instrument_summary_value) {
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 4 -> instrument_summary_record.instrument_id[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.last_traded_price[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.closing_price[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.closing_price_type = instrument_summary_value;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.adjusted_closing_price[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.adjusted_closing_price_reason = instrument_summary_value;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.pct_change[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.vwap[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.no_trades[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.total_volume[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.total_value[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.opening_price[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.max_price[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.min_price[instrument_summary_at] = instrument_summary_value; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.is_correction = instrument_summary_value;
  skip
}

/* each byte of Instrument Summary set to where it lies, so a field read out of place says so */
inline ramp_instrument_summary(instrument_summary_record, instrument_summary_base) {
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 4 -> instrument_summary_record.instrument_id[instrument_summary_at] = (instrument_summary_base + 0 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.last_traded_price[instrument_summary_at] = (instrument_summary_base + 4 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.closing_price[instrument_summary_at] = (instrument_summary_base + 12 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.closing_price_type = (instrument_summary_base + 20 + 1) % 256;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.adjusted_closing_price[instrument_summary_at] = (instrument_summary_base + 21 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.adjusted_closing_price_reason = (instrument_summary_base + 29 + 1) % 256;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.pct_change[instrument_summary_at] = (instrument_summary_base + 30 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.vwap[instrument_summary_at] = (instrument_summary_base + 38 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.no_trades[instrument_summary_at] = (instrument_summary_base + 46 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.total_volume[instrument_summary_at] = (instrument_summary_base + 54 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.total_value[instrument_summary_at] = (instrument_summary_base + 62 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.opening_price[instrument_summary_at] = (instrument_summary_base + 70 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.max_price[instrument_summary_at] = (instrument_summary_base + 78 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.min_price[instrument_summary_at] = (instrument_summary_base + 86 + instrument_summary_at + 1) % 256; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.is_correction = (instrument_summary_base + 94 + 1) % 256;
  skip
}

/* Instrument Summary to the wire, 95 bytes from where the cursor stands */
inline encode_instrument_summary(instrument_summary_record) {
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 4 -> wire[at] = instrument_summary_record.instrument_id[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.last_traded_price[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.closing_price[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  wire[at] = instrument_summary_record.closing_price_type; at = at + 1;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.adjusted_closing_price[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  wire[at] = instrument_summary_record.adjusted_closing_price_reason; at = at + 1;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.pct_change[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.vwap[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.no_trades[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.total_volume[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.total_value[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.opening_price[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.max_price[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> wire[at] = instrument_summary_record.min_price[instrument_summary_at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  wire[at] = instrument_summary_record.is_correction; at = at + 1;
  skip
}

/* Instrument Summary off the wire, 95 bytes from where the cursor stands */
inline decode_instrument_summary(instrument_summary_record) {
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 4 -> instrument_summary_record.instrument_id[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.last_traded_price[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.closing_price[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.closing_price_type = wire[at]; at = at + 1;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.adjusted_closing_price[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.adjusted_closing_price_reason = wire[at]; at = at + 1;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.pct_change[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.vwap[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.no_trades[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.total_volume[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.total_value[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.opening_price[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.max_price[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> instrument_summary_record.min_price[instrument_summary_at] = wire[at]; at = at + 1; instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_record.is_correction = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Summary is what was written, byte for byte */
inline equal_instrument_summary(instrument_summary_read, instrument_summary_written) {
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 4 -> assert(instrument_summary_read.instrument_id[instrument_summary_at] == instrument_summary_written.instrument_id[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.last_traded_price[instrument_summary_at] == instrument_summary_written.last_traded_price[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.closing_price[instrument_summary_at] == instrument_summary_written.closing_price[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  assert(instrument_summary_read.closing_price_type == instrument_summary_written.closing_price_type);
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.adjusted_closing_price[instrument_summary_at] == instrument_summary_written.adjusted_closing_price[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  assert(instrument_summary_read.adjusted_closing_price_reason == instrument_summary_written.adjusted_closing_price_reason);
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.pct_change[instrument_summary_at] == instrument_summary_written.pct_change[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.vwap[instrument_summary_at] == instrument_summary_written.vwap[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.no_trades[instrument_summary_at] == instrument_summary_written.no_trades[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.total_volume[instrument_summary_at] == instrument_summary_written.total_volume[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.total_value[instrument_summary_at] == instrument_summary_written.total_value[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.opening_price[instrument_summary_at] == instrument_summary_written.opening_price[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.max_price[instrument_summary_at] == instrument_summary_written.max_price[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  instrument_summary_at = 0;
  do
  :: instrument_summary_at < 8 -> assert(instrument_summary_read.min_price[instrument_summary_at] == instrument_summary_written.min_price[instrument_summary_at]); instrument_summary_at = instrument_summary_at + 1
  :: else -> break
  od;
  assert(instrument_summary_read.is_correction == instrument_summary_written.is_correction);
  skip
}

/* ---- Clob Instrument: 119 bytes ---------------------------------------------- */

/* SingleInstrumentSummary */
typedef ClobInstrument {
  byte instrument_id[4];
  byte market_model_type;
  byte last_traded_price[8];
  byte closing_price[8];
  byte closing_price_type;
  byte adjusted_closing_price[8];
  byte adjusted_closing_price_reason;
  byte pct_change[8];
  byte vwap[8];
  byte no_trades[8];
  byte total_volume[8];
  byte total_value[8];
  byte opening_price[8];
  byte max_price[8];
  byte min_price[8];
  byte settlement_price[8];
  byte settlement_value_price[8];
  byte end_trading_date[4];
  byte last_trade_date[4]
};

int clob_instrument_at;

/* every byte of Clob Instrument set to one value */
inline fill_clob_instrument(clob_instrument_record, clob_instrument_value) {
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.instrument_id[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.market_model_type = clob_instrument_value;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.last_traded_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.closing_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.closing_price_type = clob_instrument_value;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.adjusted_closing_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.adjusted_closing_price_reason = clob_instrument_value;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.pct_change[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.vwap[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.no_trades[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.total_volume[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.total_value[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.opening_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.max_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.min_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.settlement_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.settlement_value_price[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.end_trading_date[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.last_trade_date[clob_instrument_at] = clob_instrument_value; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clob Instrument set to where it lies, so a field read out of place says so */
inline ramp_clob_instrument(clob_instrument_record, clob_instrument_base) {
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.instrument_id[clob_instrument_at] = (clob_instrument_base + 0 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.market_model_type = (clob_instrument_base + 4 + 1) % 256;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.last_traded_price[clob_instrument_at] = (clob_instrument_base + 5 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.closing_price[clob_instrument_at] = (clob_instrument_base + 13 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.closing_price_type = (clob_instrument_base + 21 + 1) % 256;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.adjusted_closing_price[clob_instrument_at] = (clob_instrument_base + 22 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.adjusted_closing_price_reason = (clob_instrument_base + 30 + 1) % 256;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.pct_change[clob_instrument_at] = (clob_instrument_base + 31 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.vwap[clob_instrument_at] = (clob_instrument_base + 39 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.no_trades[clob_instrument_at] = (clob_instrument_base + 47 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.total_volume[clob_instrument_at] = (clob_instrument_base + 55 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.total_value[clob_instrument_at] = (clob_instrument_base + 63 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.opening_price[clob_instrument_at] = (clob_instrument_base + 71 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.max_price[clob_instrument_at] = (clob_instrument_base + 79 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.min_price[clob_instrument_at] = (clob_instrument_base + 87 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.settlement_price[clob_instrument_at] = (clob_instrument_base + 95 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.settlement_value_price[clob_instrument_at] = (clob_instrument_base + 103 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.end_trading_date[clob_instrument_at] = (clob_instrument_base + 111 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.last_trade_date[clob_instrument_at] = (clob_instrument_base + 115 + clob_instrument_at + 1) % 256; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Clob Instrument to the wire, 119 bytes from where the cursor stands */
inline encode_clob_instrument(clob_instrument_record) {
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> wire[at] = clob_instrument_record.instrument_id[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  wire[at] = clob_instrument_record.market_model_type; at = at + 1;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.last_traded_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.closing_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  wire[at] = clob_instrument_record.closing_price_type; at = at + 1;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.adjusted_closing_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  wire[at] = clob_instrument_record.adjusted_closing_price_reason; at = at + 1;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.pct_change[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.vwap[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.no_trades[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.total_volume[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.total_value[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.opening_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.max_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.min_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.settlement_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> wire[at] = clob_instrument_record.settlement_value_price[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> wire[at] = clob_instrument_record.end_trading_date[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> wire[at] = clob_instrument_record.last_trade_date[clob_instrument_at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Clob Instrument off the wire, 119 bytes from where the cursor stands */
inline decode_clob_instrument(clob_instrument_record) {
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.instrument_id[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.market_model_type = wire[at]; at = at + 1;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.last_traded_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.closing_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.closing_price_type = wire[at]; at = at + 1;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.adjusted_closing_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_record.adjusted_closing_price_reason = wire[at]; at = at + 1;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.pct_change[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.vwap[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.no_trades[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.total_volume[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.total_value[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.opening_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.max_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.min_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.settlement_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> clob_instrument_record.settlement_value_price[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.end_trading_date[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> clob_instrument_record.last_trade_date[clob_instrument_at] = wire[at]; at = at + 1; clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clob Instrument is what was written, byte for byte */
inline equal_clob_instrument(clob_instrument_read, clob_instrument_written) {
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> assert(clob_instrument_read.instrument_id[clob_instrument_at] == clob_instrument_written.instrument_id[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  assert(clob_instrument_read.market_model_type == clob_instrument_written.market_model_type);
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.last_traded_price[clob_instrument_at] == clob_instrument_written.last_traded_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.closing_price[clob_instrument_at] == clob_instrument_written.closing_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  assert(clob_instrument_read.closing_price_type == clob_instrument_written.closing_price_type);
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.adjusted_closing_price[clob_instrument_at] == clob_instrument_written.adjusted_closing_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  assert(clob_instrument_read.adjusted_closing_price_reason == clob_instrument_written.adjusted_closing_price_reason);
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.pct_change[clob_instrument_at] == clob_instrument_written.pct_change[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.vwap[clob_instrument_at] == clob_instrument_written.vwap[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.no_trades[clob_instrument_at] == clob_instrument_written.no_trades[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.total_volume[clob_instrument_at] == clob_instrument_written.total_volume[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.total_value[clob_instrument_at] == clob_instrument_written.total_value[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.opening_price[clob_instrument_at] == clob_instrument_written.opening_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.max_price[clob_instrument_at] == clob_instrument_written.max_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.min_price[clob_instrument_at] == clob_instrument_written.min_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.settlement_price[clob_instrument_at] == clob_instrument_written.settlement_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 8 -> assert(clob_instrument_read.settlement_value_price[clob_instrument_at] == clob_instrument_written.settlement_value_price[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> assert(clob_instrument_read.end_trading_date[clob_instrument_at] == clob_instrument_written.end_trading_date[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  clob_instrument_at = 0;
  do
  :: clob_instrument_at < 4 -> assert(clob_instrument_read.last_trade_date[clob_instrument_at] == clob_instrument_written.last_trade_date[clob_instrument_at]); clob_instrument_at = clob_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Instrument: 119 bytes --------------------------------------------- */

/* SingleInstrumentSummary */
typedef CrossInstrument {
  byte instrument_id[4];
  byte market_model_type;
  byte last_traded_price[8];
  byte closing_price[8];
  byte closing_price_type;
  byte adjusted_closing_price[8];
  byte adjusted_closing_price_reason;
  byte pct_change[8];
  byte vwap[8];
  byte no_trades[8];
  byte total_volume[8];
  byte total_value[8];
  byte opening_price[8];
  byte max_price[8];
  byte min_price[8];
  byte settlement_price[8];
  byte settlement_value_price[8];
  byte end_trading_date[4];
  byte last_trade_date[4]
};

int cross_instrument_at;

/* every byte of Cross Instrument set to one value */
inline fill_cross_instrument(cross_instrument_record, cross_instrument_value) {
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.instrument_id[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.market_model_type = cross_instrument_value;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.last_traded_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.closing_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.closing_price_type = cross_instrument_value;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.adjusted_closing_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.adjusted_closing_price_reason = cross_instrument_value;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.pct_change[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.vwap[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.no_trades[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.total_volume[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.total_value[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.opening_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.max_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.min_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.settlement_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.settlement_value_price[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.end_trading_date[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.last_trade_date[cross_instrument_at] = cross_instrument_value; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Instrument set to where it lies, so a field read out of place says so */
inline ramp_cross_instrument(cross_instrument_record, cross_instrument_base) {
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.instrument_id[cross_instrument_at] = (cross_instrument_base + 0 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.market_model_type = (cross_instrument_base + 4 + 1) % 256;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.last_traded_price[cross_instrument_at] = (cross_instrument_base + 5 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.closing_price[cross_instrument_at] = (cross_instrument_base + 13 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.closing_price_type = (cross_instrument_base + 21 + 1) % 256;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.adjusted_closing_price[cross_instrument_at] = (cross_instrument_base + 22 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.adjusted_closing_price_reason = (cross_instrument_base + 30 + 1) % 256;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.pct_change[cross_instrument_at] = (cross_instrument_base + 31 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.vwap[cross_instrument_at] = (cross_instrument_base + 39 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.no_trades[cross_instrument_at] = (cross_instrument_base + 47 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.total_volume[cross_instrument_at] = (cross_instrument_base + 55 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.total_value[cross_instrument_at] = (cross_instrument_base + 63 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.opening_price[cross_instrument_at] = (cross_instrument_base + 71 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.max_price[cross_instrument_at] = (cross_instrument_base + 79 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.min_price[cross_instrument_at] = (cross_instrument_base + 87 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.settlement_price[cross_instrument_at] = (cross_instrument_base + 95 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.settlement_value_price[cross_instrument_at] = (cross_instrument_base + 103 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.end_trading_date[cross_instrument_at] = (cross_instrument_base + 111 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.last_trade_date[cross_instrument_at] = (cross_instrument_base + 115 + cross_instrument_at + 1) % 256; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Instrument to the wire, 119 bytes from where the cursor stands */
inline encode_cross_instrument(cross_instrument_record) {
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> wire[at] = cross_instrument_record.instrument_id[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  wire[at] = cross_instrument_record.market_model_type; at = at + 1;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.last_traded_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.closing_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  wire[at] = cross_instrument_record.closing_price_type; at = at + 1;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.adjusted_closing_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  wire[at] = cross_instrument_record.adjusted_closing_price_reason; at = at + 1;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.pct_change[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.vwap[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.no_trades[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.total_volume[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.total_value[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.opening_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.max_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.min_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.settlement_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> wire[at] = cross_instrument_record.settlement_value_price[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> wire[at] = cross_instrument_record.end_trading_date[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> wire[at] = cross_instrument_record.last_trade_date[cross_instrument_at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Instrument off the wire, 119 bytes from where the cursor stands */
inline decode_cross_instrument(cross_instrument_record) {
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.instrument_id[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.market_model_type = wire[at]; at = at + 1;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.last_traded_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.closing_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.closing_price_type = wire[at]; at = at + 1;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.adjusted_closing_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_record.adjusted_closing_price_reason = wire[at]; at = at + 1;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.pct_change[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.vwap[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.no_trades[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.total_volume[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.total_value[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.opening_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.max_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.min_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.settlement_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> cross_instrument_record.settlement_value_price[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.end_trading_date[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> cross_instrument_record.last_trade_date[cross_instrument_at] = wire[at]; at = at + 1; cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Instrument is what was written, byte for byte */
inline equal_cross_instrument(cross_instrument_read, cross_instrument_written) {
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> assert(cross_instrument_read.instrument_id[cross_instrument_at] == cross_instrument_written.instrument_id[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  assert(cross_instrument_read.market_model_type == cross_instrument_written.market_model_type);
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.last_traded_price[cross_instrument_at] == cross_instrument_written.last_traded_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.closing_price[cross_instrument_at] == cross_instrument_written.closing_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  assert(cross_instrument_read.closing_price_type == cross_instrument_written.closing_price_type);
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.adjusted_closing_price[cross_instrument_at] == cross_instrument_written.adjusted_closing_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  assert(cross_instrument_read.adjusted_closing_price_reason == cross_instrument_written.adjusted_closing_price_reason);
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.pct_change[cross_instrument_at] == cross_instrument_written.pct_change[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.vwap[cross_instrument_at] == cross_instrument_written.vwap[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.no_trades[cross_instrument_at] == cross_instrument_written.no_trades[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.total_volume[cross_instrument_at] == cross_instrument_written.total_volume[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.total_value[cross_instrument_at] == cross_instrument_written.total_value[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.opening_price[cross_instrument_at] == cross_instrument_written.opening_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.max_price[cross_instrument_at] == cross_instrument_written.max_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.min_price[cross_instrument_at] == cross_instrument_written.min_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.settlement_price[cross_instrument_at] == cross_instrument_written.settlement_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 8 -> assert(cross_instrument_read.settlement_value_price[cross_instrument_at] == cross_instrument_written.settlement_value_price[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> assert(cross_instrument_read.end_trading_date[cross_instrument_at] == cross_instrument_written.end_trading_date[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  cross_instrument_at = 0;
  do
  :: cross_instrument_at < 4 -> assert(cross_instrument_read.last_trade_date[cross_instrument_at] == cross_instrument_written.last_trade_date[cross_instrument_at]); cross_instrument_at = cross_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Instrument: 119 bytes --------------------------------------------- */

/* SingleInstrumentSummary */
typedef BlockInstrument {
  byte instrument_id[4];
  byte market_model_type;
  byte last_traded_price[8];
  byte closing_price[8];
  byte closing_price_type;
  byte adjusted_closing_price[8];
  byte adjusted_closing_price_reason;
  byte pct_change[8];
  byte vwap[8];
  byte no_trades[8];
  byte total_volume[8];
  byte total_value[8];
  byte opening_price[8];
  byte max_price[8];
  byte min_price[8];
  byte settlement_price[8];
  byte settlement_value_price[8];
  byte end_trading_date[4];
  byte last_trade_date[4]
};

int block_instrument_at;

/* every byte of Block Instrument set to one value */
inline fill_block_instrument(block_instrument_record, block_instrument_value) {
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.instrument_id[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.market_model_type = block_instrument_value;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.last_traded_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.closing_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.closing_price_type = block_instrument_value;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.adjusted_closing_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.adjusted_closing_price_reason = block_instrument_value;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.pct_change[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.vwap[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.no_trades[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.total_volume[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.total_value[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.opening_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.max_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.min_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.settlement_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.settlement_value_price[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.end_trading_date[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.last_trade_date[block_instrument_at] = block_instrument_value; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Instrument set to where it lies, so a field read out of place says so */
inline ramp_block_instrument(block_instrument_record, block_instrument_base) {
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.instrument_id[block_instrument_at] = (block_instrument_base + 0 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.market_model_type = (block_instrument_base + 4 + 1) % 256;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.last_traded_price[block_instrument_at] = (block_instrument_base + 5 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.closing_price[block_instrument_at] = (block_instrument_base + 13 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.closing_price_type = (block_instrument_base + 21 + 1) % 256;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.adjusted_closing_price[block_instrument_at] = (block_instrument_base + 22 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.adjusted_closing_price_reason = (block_instrument_base + 30 + 1) % 256;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.pct_change[block_instrument_at] = (block_instrument_base + 31 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.vwap[block_instrument_at] = (block_instrument_base + 39 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.no_trades[block_instrument_at] = (block_instrument_base + 47 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.total_volume[block_instrument_at] = (block_instrument_base + 55 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.total_value[block_instrument_at] = (block_instrument_base + 63 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.opening_price[block_instrument_at] = (block_instrument_base + 71 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.max_price[block_instrument_at] = (block_instrument_base + 79 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.min_price[block_instrument_at] = (block_instrument_base + 87 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.settlement_price[block_instrument_at] = (block_instrument_base + 95 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.settlement_value_price[block_instrument_at] = (block_instrument_base + 103 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.end_trading_date[block_instrument_at] = (block_instrument_base + 111 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.last_trade_date[block_instrument_at] = (block_instrument_base + 115 + block_instrument_at + 1) % 256; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Block Instrument to the wire, 119 bytes from where the cursor stands */
inline encode_block_instrument(block_instrument_record) {
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> wire[at] = block_instrument_record.instrument_id[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  wire[at] = block_instrument_record.market_model_type; at = at + 1;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.last_traded_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.closing_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  wire[at] = block_instrument_record.closing_price_type; at = at + 1;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.adjusted_closing_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  wire[at] = block_instrument_record.adjusted_closing_price_reason; at = at + 1;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.pct_change[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.vwap[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.no_trades[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.total_volume[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.total_value[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.opening_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.max_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.min_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.settlement_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> wire[at] = block_instrument_record.settlement_value_price[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> wire[at] = block_instrument_record.end_trading_date[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> wire[at] = block_instrument_record.last_trade_date[block_instrument_at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Block Instrument off the wire, 119 bytes from where the cursor stands */
inline decode_block_instrument(block_instrument_record) {
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.instrument_id[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.market_model_type = wire[at]; at = at + 1;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.last_traded_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.closing_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.closing_price_type = wire[at]; at = at + 1;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.adjusted_closing_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_record.adjusted_closing_price_reason = wire[at]; at = at + 1;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.pct_change[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.vwap[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.no_trades[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.total_volume[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.total_value[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.opening_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.max_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.min_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.settlement_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> block_instrument_record.settlement_value_price[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.end_trading_date[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> block_instrument_record.last_trade_date[block_instrument_at] = wire[at]; at = at + 1; block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Instrument is what was written, byte for byte */
inline equal_block_instrument(block_instrument_read, block_instrument_written) {
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> assert(block_instrument_read.instrument_id[block_instrument_at] == block_instrument_written.instrument_id[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  assert(block_instrument_read.market_model_type == block_instrument_written.market_model_type);
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.last_traded_price[block_instrument_at] == block_instrument_written.last_traded_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.closing_price[block_instrument_at] == block_instrument_written.closing_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  assert(block_instrument_read.closing_price_type == block_instrument_written.closing_price_type);
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.adjusted_closing_price[block_instrument_at] == block_instrument_written.adjusted_closing_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  assert(block_instrument_read.adjusted_closing_price_reason == block_instrument_written.adjusted_closing_price_reason);
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.pct_change[block_instrument_at] == block_instrument_written.pct_change[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.vwap[block_instrument_at] == block_instrument_written.vwap[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.no_trades[block_instrument_at] == block_instrument_written.no_trades[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.total_volume[block_instrument_at] == block_instrument_written.total_volume[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.total_value[block_instrument_at] == block_instrument_written.total_value[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.opening_price[block_instrument_at] == block_instrument_written.opening_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.max_price[block_instrument_at] == block_instrument_written.max_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.min_price[block_instrument_at] == block_instrument_written.min_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.settlement_price[block_instrument_at] == block_instrument_written.settlement_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 8 -> assert(block_instrument_read.settlement_value_price[block_instrument_at] == block_instrument_written.settlement_value_price[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> assert(block_instrument_read.end_trading_date[block_instrument_at] == block_instrument_written.end_trading_date[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  block_instrument_at = 0;
  do
  :: block_instrument_at < 4 -> assert(block_instrument_read.last_trade_date[block_instrument_at] == block_instrument_written.last_trade_date[block_instrument_at]); block_instrument_at = block_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Hybrid Instrument: 119 bytes -------------------------------------------- */

/* SingleInstrumentSummary */
typedef HybridInstrument {
  byte instrument_id[4];
  byte market_model_type;
  byte last_traded_price[8];
  byte closing_price[8];
  byte closing_price_type;
  byte adjusted_closing_price[8];
  byte adjusted_closing_price_reason;
  byte pct_change[8];
  byte vwap[8];
  byte no_trades[8];
  byte total_volume[8];
  byte total_value[8];
  byte opening_price[8];
  byte max_price[8];
  byte min_price[8];
  byte settlement_price[8];
  byte settlement_value_price[8];
  byte end_trading_date[4];
  byte last_trade_date[4]
};

int hybrid_instrument_at;

/* every byte of Hybrid Instrument set to one value */
inline fill_hybrid_instrument(hybrid_instrument_record, hybrid_instrument_value) {
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.instrument_id[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.market_model_type = hybrid_instrument_value;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.last_traded_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.closing_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.closing_price_type = hybrid_instrument_value;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.adjusted_closing_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.adjusted_closing_price_reason = hybrid_instrument_value;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.pct_change[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.vwap[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.no_trades[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.total_volume[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.total_value[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.opening_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.max_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.min_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.settlement_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.settlement_value_price[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.end_trading_date[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.last_trade_date[hybrid_instrument_at] = hybrid_instrument_value; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Hybrid Instrument set to where it lies, so a field read out of place says so */
inline ramp_hybrid_instrument(hybrid_instrument_record, hybrid_instrument_base) {
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.instrument_id[hybrid_instrument_at] = (hybrid_instrument_base + 0 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.market_model_type = (hybrid_instrument_base + 4 + 1) % 256;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.last_traded_price[hybrid_instrument_at] = (hybrid_instrument_base + 5 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.closing_price[hybrid_instrument_at] = (hybrid_instrument_base + 13 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.closing_price_type = (hybrid_instrument_base + 21 + 1) % 256;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.adjusted_closing_price[hybrid_instrument_at] = (hybrid_instrument_base + 22 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.adjusted_closing_price_reason = (hybrid_instrument_base + 30 + 1) % 256;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.pct_change[hybrid_instrument_at] = (hybrid_instrument_base + 31 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.vwap[hybrid_instrument_at] = (hybrid_instrument_base + 39 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.no_trades[hybrid_instrument_at] = (hybrid_instrument_base + 47 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.total_volume[hybrid_instrument_at] = (hybrid_instrument_base + 55 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.total_value[hybrid_instrument_at] = (hybrid_instrument_base + 63 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.opening_price[hybrid_instrument_at] = (hybrid_instrument_base + 71 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.max_price[hybrid_instrument_at] = (hybrid_instrument_base + 79 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.min_price[hybrid_instrument_at] = (hybrid_instrument_base + 87 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.settlement_price[hybrid_instrument_at] = (hybrid_instrument_base + 95 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.settlement_value_price[hybrid_instrument_at] = (hybrid_instrument_base + 103 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.end_trading_date[hybrid_instrument_at] = (hybrid_instrument_base + 111 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.last_trade_date[hybrid_instrument_at] = (hybrid_instrument_base + 115 + hybrid_instrument_at + 1) % 256; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Hybrid Instrument to the wire, 119 bytes from where the cursor stands */
inline encode_hybrid_instrument(hybrid_instrument_record) {
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> wire[at] = hybrid_instrument_record.instrument_id[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  wire[at] = hybrid_instrument_record.market_model_type; at = at + 1;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.last_traded_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.closing_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  wire[at] = hybrid_instrument_record.closing_price_type; at = at + 1;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.adjusted_closing_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  wire[at] = hybrid_instrument_record.adjusted_closing_price_reason; at = at + 1;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.pct_change[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.vwap[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.no_trades[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.total_volume[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.total_value[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.opening_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.max_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.min_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.settlement_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> wire[at] = hybrid_instrument_record.settlement_value_price[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> wire[at] = hybrid_instrument_record.end_trading_date[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> wire[at] = hybrid_instrument_record.last_trade_date[hybrid_instrument_at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* Hybrid Instrument off the wire, 119 bytes from where the cursor stands */
inline decode_hybrid_instrument(hybrid_instrument_record) {
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.instrument_id[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.market_model_type = wire[at]; at = at + 1;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.last_traded_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.closing_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.closing_price_type = wire[at]; at = at + 1;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.adjusted_closing_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_record.adjusted_closing_price_reason = wire[at]; at = at + 1;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.pct_change[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.vwap[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.no_trades[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.total_volume[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.total_value[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.opening_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.max_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.min_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.settlement_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> hybrid_instrument_record.settlement_value_price[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.end_trading_date[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> hybrid_instrument_record.last_trade_date[hybrid_instrument_at] = wire[at]; at = at + 1; hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Hybrid Instrument is what was written, byte for byte */
inline equal_hybrid_instrument(hybrid_instrument_read, hybrid_instrument_written) {
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> assert(hybrid_instrument_read.instrument_id[hybrid_instrument_at] == hybrid_instrument_written.instrument_id[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  assert(hybrid_instrument_read.market_model_type == hybrid_instrument_written.market_model_type);
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.last_traded_price[hybrid_instrument_at] == hybrid_instrument_written.last_traded_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.closing_price[hybrid_instrument_at] == hybrid_instrument_written.closing_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  assert(hybrid_instrument_read.closing_price_type == hybrid_instrument_written.closing_price_type);
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.adjusted_closing_price[hybrid_instrument_at] == hybrid_instrument_written.adjusted_closing_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  assert(hybrid_instrument_read.adjusted_closing_price_reason == hybrid_instrument_written.adjusted_closing_price_reason);
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.pct_change[hybrid_instrument_at] == hybrid_instrument_written.pct_change[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.vwap[hybrid_instrument_at] == hybrid_instrument_written.vwap[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.no_trades[hybrid_instrument_at] == hybrid_instrument_written.no_trades[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.total_volume[hybrid_instrument_at] == hybrid_instrument_written.total_volume[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.total_value[hybrid_instrument_at] == hybrid_instrument_written.total_value[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.opening_price[hybrid_instrument_at] == hybrid_instrument_written.opening_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.max_price[hybrid_instrument_at] == hybrid_instrument_written.max_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.min_price[hybrid_instrument_at] == hybrid_instrument_written.min_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.settlement_price[hybrid_instrument_at] == hybrid_instrument_written.settlement_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 8 -> assert(hybrid_instrument_read.settlement_value_price[hybrid_instrument_at] == hybrid_instrument_written.settlement_value_price[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> assert(hybrid_instrument_read.end_trading_date[hybrid_instrument_at] == hybrid_instrument_written.end_trading_date[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  hybrid_instrument_at = 0;
  do
  :: hybrid_instrument_at < 4 -> assert(hybrid_instrument_read.last_trade_date[hybrid_instrument_at] == hybrid_instrument_written.last_trade_date[hybrid_instrument_at]); hybrid_instrument_at = hybrid_instrument_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Product Summary: 629 bytes ---------------------------------------------- */

/* Session day product summary */
typedef ProductSummary {
  ClobInstrument clob_instrument;
  CrossInstrument cross_instrument;
  BlockInstrument block_instrument;
  HybridInstrument hybrid_instrument;
  byte product_identification_type;
  byte product_identification_product_identification[30];
  byte product_id[4];
  byte mic[4];
  byte accumulated_interest[8];
  byte interest_rate[8];
  byte currency[2];
  byte session_date[4];
  byte trading_value_currency[8];
  byte status;
  byte sector[2];
  byte market;
  byte marker_price_change;
  byte lower_liquidity;
  byte multiplier_number[8];
  byte dividend_rate[8];
  byte delta[8];
  byte gamma[8];
  byte rho[8];
  byte theta[8];
  byte vega[8];
  byte volatility[8];
  byte options_strike_price[8];
  byte dividend;
  byte subscription_right;
  byte interim_dividend_right;
  byte split;
  byte quotation_system;
  byte liquidity_support_pge
};

int product_summary_at;

/* every byte of Product Summary set to one value */
inline fill_product_summary(product_summary_record, product_summary_value) {
  fill_clob_instrument(product_summary_record.clob_instrument, product_summary_value);
  fill_cross_instrument(product_summary_record.cross_instrument, product_summary_value);
  fill_block_instrument(product_summary_record.block_instrument, product_summary_value);
  fill_hybrid_instrument(product_summary_record.hybrid_instrument, product_summary_value);
  product_summary_record.product_identification_type = product_summary_value;
  product_summary_at = 0;
  do
  :: product_summary_at < 30 -> product_summary_record.product_identification_product_identification[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.product_id[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.mic[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.accumulated_interest[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.interest_rate[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> product_summary_record.currency[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.session_date[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.trading_value_currency[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.status = product_summary_value;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> product_summary_record.sector[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.market = product_summary_value;
  product_summary_record.marker_price_change = product_summary_value;
  product_summary_record.lower_liquidity = product_summary_value;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.multiplier_number[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.dividend_rate[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.delta[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.gamma[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.rho[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.theta[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.vega[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.volatility[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.options_strike_price[product_summary_at] = product_summary_value; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.dividend = product_summary_value;
  product_summary_record.subscription_right = product_summary_value;
  product_summary_record.interim_dividend_right = product_summary_value;
  product_summary_record.split = product_summary_value;
  product_summary_record.quotation_system = product_summary_value;
  product_summary_record.liquidity_support_pge = product_summary_value;
  skip
}

/* each byte of Product Summary set to where it lies, so a field read out of place says so */
inline ramp_product_summary(product_summary_record, product_summary_base) {
  ramp_clob_instrument(product_summary_record.clob_instrument, product_summary_base + 0);
  ramp_cross_instrument(product_summary_record.cross_instrument, product_summary_base + 119);
  ramp_block_instrument(product_summary_record.block_instrument, product_summary_base + 238);
  ramp_hybrid_instrument(product_summary_record.hybrid_instrument, product_summary_base + 357);
  product_summary_record.product_identification_type = (product_summary_base + 476 + 1) % 256;
  product_summary_at = 0;
  do
  :: product_summary_at < 30 -> product_summary_record.product_identification_product_identification[product_summary_at] = (product_summary_base + 477 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.product_id[product_summary_at] = (product_summary_base + 507 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.mic[product_summary_at] = (product_summary_base + 511 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.accumulated_interest[product_summary_at] = (product_summary_base + 515 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.interest_rate[product_summary_at] = (product_summary_base + 523 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> product_summary_record.currency[product_summary_at] = (product_summary_base + 531 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.session_date[product_summary_at] = (product_summary_base + 533 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.trading_value_currency[product_summary_at] = (product_summary_base + 537 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.status = (product_summary_base + 545 + 1) % 256;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> product_summary_record.sector[product_summary_at] = (product_summary_base + 546 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.market = (product_summary_base + 548 + 1) % 256;
  product_summary_record.marker_price_change = (product_summary_base + 549 + 1) % 256;
  product_summary_record.lower_liquidity = (product_summary_base + 550 + 1) % 256;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.multiplier_number[product_summary_at] = (product_summary_base + 551 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.dividend_rate[product_summary_at] = (product_summary_base + 559 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.delta[product_summary_at] = (product_summary_base + 567 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.gamma[product_summary_at] = (product_summary_base + 575 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.rho[product_summary_at] = (product_summary_base + 583 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.theta[product_summary_at] = (product_summary_base + 591 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.vega[product_summary_at] = (product_summary_base + 599 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.volatility[product_summary_at] = (product_summary_base + 607 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.options_strike_price[product_summary_at] = (product_summary_base + 615 + product_summary_at + 1) % 256; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.dividend = (product_summary_base + 623 + 1) % 256;
  product_summary_record.subscription_right = (product_summary_base + 624 + 1) % 256;
  product_summary_record.interim_dividend_right = (product_summary_base + 625 + 1) % 256;
  product_summary_record.split = (product_summary_base + 626 + 1) % 256;
  product_summary_record.quotation_system = (product_summary_base + 627 + 1) % 256;
  product_summary_record.liquidity_support_pge = (product_summary_base + 628 + 1) % 256;
  skip
}

/* Product Summary to the wire, 629 bytes from where the cursor stands */
inline encode_product_summary(product_summary_record) {
  encode_clob_instrument(product_summary_record.clob_instrument);
  encode_cross_instrument(product_summary_record.cross_instrument);
  encode_block_instrument(product_summary_record.block_instrument);
  encode_hybrid_instrument(product_summary_record.hybrid_instrument);
  wire[at] = product_summary_record.product_identification_type; at = at + 1;
  product_summary_at = 0;
  do
  :: product_summary_at < 30 -> wire[at] = product_summary_record.product_identification_product_identification[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> wire[at] = product_summary_record.product_id[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> wire[at] = product_summary_record.mic[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.accumulated_interest[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.interest_rate[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> wire[at] = product_summary_record.currency[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> wire[at] = product_summary_record.session_date[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.trading_value_currency[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  wire[at] = product_summary_record.status; at = at + 1;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> wire[at] = product_summary_record.sector[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  wire[at] = product_summary_record.market; at = at + 1;
  wire[at] = product_summary_record.marker_price_change; at = at + 1;
  wire[at] = product_summary_record.lower_liquidity; at = at + 1;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.multiplier_number[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.dividend_rate[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.delta[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.gamma[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.rho[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.theta[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.vega[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.volatility[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> wire[at] = product_summary_record.options_strike_price[product_summary_at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  wire[at] = product_summary_record.dividend; at = at + 1;
  wire[at] = product_summary_record.subscription_right; at = at + 1;
  wire[at] = product_summary_record.interim_dividend_right; at = at + 1;
  wire[at] = product_summary_record.split; at = at + 1;
  wire[at] = product_summary_record.quotation_system; at = at + 1;
  wire[at] = product_summary_record.liquidity_support_pge; at = at + 1;
  skip
}

/* Product Summary off the wire, 629 bytes from where the cursor stands */
inline decode_product_summary(product_summary_record) {
  decode_clob_instrument(product_summary_record.clob_instrument);
  decode_cross_instrument(product_summary_record.cross_instrument);
  decode_block_instrument(product_summary_record.block_instrument);
  decode_hybrid_instrument(product_summary_record.hybrid_instrument);
  product_summary_record.product_identification_type = wire[at]; at = at + 1;
  product_summary_at = 0;
  do
  :: product_summary_at < 30 -> product_summary_record.product_identification_product_identification[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.product_id[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.mic[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.accumulated_interest[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.interest_rate[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> product_summary_record.currency[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> product_summary_record.session_date[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.trading_value_currency[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.status = wire[at]; at = at + 1;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> product_summary_record.sector[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.market = wire[at]; at = at + 1;
  product_summary_record.marker_price_change = wire[at]; at = at + 1;
  product_summary_record.lower_liquidity = wire[at]; at = at + 1;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.multiplier_number[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.dividend_rate[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.delta[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.gamma[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.rho[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.theta[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.vega[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.volatility[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> product_summary_record.options_strike_price[product_summary_at] = wire[at]; at = at + 1; product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_record.dividend = wire[at]; at = at + 1;
  product_summary_record.subscription_right = wire[at]; at = at + 1;
  product_summary_record.interim_dividend_right = wire[at]; at = at + 1;
  product_summary_record.split = wire[at]; at = at + 1;
  product_summary_record.quotation_system = wire[at]; at = at + 1;
  product_summary_record.liquidity_support_pge = wire[at]; at = at + 1;
  skip
}

/* what was read of Product Summary is what was written, byte for byte */
inline equal_product_summary(product_summary_read, product_summary_written) {
  equal_clob_instrument(product_summary_read.clob_instrument, product_summary_written.clob_instrument);
  equal_cross_instrument(product_summary_read.cross_instrument, product_summary_written.cross_instrument);
  equal_block_instrument(product_summary_read.block_instrument, product_summary_written.block_instrument);
  equal_hybrid_instrument(product_summary_read.hybrid_instrument, product_summary_written.hybrid_instrument);
  assert(product_summary_read.product_identification_type == product_summary_written.product_identification_type);
  product_summary_at = 0;
  do
  :: product_summary_at < 30 -> assert(product_summary_read.product_identification_product_identification[product_summary_at] == product_summary_written.product_identification_product_identification[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> assert(product_summary_read.product_id[product_summary_at] == product_summary_written.product_id[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> assert(product_summary_read.mic[product_summary_at] == product_summary_written.mic[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.accumulated_interest[product_summary_at] == product_summary_written.accumulated_interest[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.interest_rate[product_summary_at] == product_summary_written.interest_rate[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> assert(product_summary_read.currency[product_summary_at] == product_summary_written.currency[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 4 -> assert(product_summary_read.session_date[product_summary_at] == product_summary_written.session_date[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.trading_value_currency[product_summary_at] == product_summary_written.trading_value_currency[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  assert(product_summary_read.status == product_summary_written.status);
  product_summary_at = 0;
  do
  :: product_summary_at < 2 -> assert(product_summary_read.sector[product_summary_at] == product_summary_written.sector[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  assert(product_summary_read.market == product_summary_written.market);
  assert(product_summary_read.marker_price_change == product_summary_written.marker_price_change);
  assert(product_summary_read.lower_liquidity == product_summary_written.lower_liquidity);
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.multiplier_number[product_summary_at] == product_summary_written.multiplier_number[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.dividend_rate[product_summary_at] == product_summary_written.dividend_rate[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.delta[product_summary_at] == product_summary_written.delta[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.gamma[product_summary_at] == product_summary_written.gamma[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.rho[product_summary_at] == product_summary_written.rho[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.theta[product_summary_at] == product_summary_written.theta[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.vega[product_summary_at] == product_summary_written.vega[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.volatility[product_summary_at] == product_summary_written.volatility[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  product_summary_at = 0;
  do
  :: product_summary_at < 8 -> assert(product_summary_read.options_strike_price[product_summary_at] == product_summary_written.options_strike_price[product_summary_at]); product_summary_at = product_summary_at + 1
  :: else -> break
  od;
  assert(product_summary_read.dividend == product_summary_written.dividend);
  assert(product_summary_read.subscription_right == product_summary_written.subscription_right);
  assert(product_summary_read.interim_dividend_right == product_summary_written.interim_dividend_right);
  assert(product_summary_read.split == product_summary_written.split);
  assert(product_summary_read.quotation_system == product_summary_written.quotation_system);
  assert(product_summary_read.liquidity_support_pge == product_summary_written.liquidity_support_pge);
  skip
}

/* ---- News: 890 bytes --------------------------------------------------------- */

/* News message */
typedef News {
  byte market_structure_id[4];
  byte news_id[4];
  byte title[80];
  byte entry_number;
  byte total;
  byte text[800]
};

int news_at;

/* every byte of News set to one value */
inline fill_news(news_record, news_value) {
  news_at = 0;
  do
  :: news_at < 4 -> news_record.market_structure_id[news_at] = news_value; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 4 -> news_record.news_id[news_at] = news_value; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 80 -> news_record.title[news_at] = news_value; news_at = news_at + 1
  :: else -> break
  od;
  news_record.entry_number = news_value;
  news_record.total = news_value;
  news_at = 0;
  do
  :: news_at < 800 -> news_record.text[news_at] = news_value; news_at = news_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of News set to where it lies, so a field read out of place says so */
inline ramp_news(news_record, news_base) {
  news_at = 0;
  do
  :: news_at < 4 -> news_record.market_structure_id[news_at] = (news_base + 0 + news_at + 1) % 256; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 4 -> news_record.news_id[news_at] = (news_base + 4 + news_at + 1) % 256; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 80 -> news_record.title[news_at] = (news_base + 8 + news_at + 1) % 256; news_at = news_at + 1
  :: else -> break
  od;
  news_record.entry_number = (news_base + 88 + 1) % 256;
  news_record.total = (news_base + 89 + 1) % 256;
  news_at = 0;
  do
  :: news_at < 800 -> news_record.text[news_at] = (news_base + 90 + news_at + 1) % 256; news_at = news_at + 1
  :: else -> break
  od;
  skip
}

/* News to the wire, 890 bytes from where the cursor stands */
inline encode_news(news_record) {
  news_at = 0;
  do
  :: news_at < 4 -> wire[at] = news_record.market_structure_id[news_at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 4 -> wire[at] = news_record.news_id[news_at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 80 -> wire[at] = news_record.title[news_at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  wire[at] = news_record.entry_number; at = at + 1;
  wire[at] = news_record.total; at = at + 1;
  news_at = 0;
  do
  :: news_at < 800 -> wire[at] = news_record.text[news_at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  skip
}

/* News off the wire, 890 bytes from where the cursor stands */
inline decode_news(news_record) {
  news_at = 0;
  do
  :: news_at < 4 -> news_record.market_structure_id[news_at] = wire[at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 4 -> news_record.news_id[news_at] = wire[at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 80 -> news_record.title[news_at] = wire[at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  news_record.entry_number = wire[at]; at = at + 1;
  news_record.total = wire[at]; at = at + 1;
  news_at = 0;
  do
  :: news_at < 800 -> news_record.text[news_at] = wire[at]; at = at + 1; news_at = news_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of News is what was written, byte for byte */
inline equal_news(news_read, news_written) {
  news_at = 0;
  do
  :: news_at < 4 -> assert(news_read.market_structure_id[news_at] == news_written.market_structure_id[news_at]); news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 4 -> assert(news_read.news_id[news_at] == news_written.news_id[news_at]); news_at = news_at + 1
  :: else -> break
  od;
  news_at = 0;
  do
  :: news_at < 80 -> assert(news_read.title[news_at] == news_written.title[news_at]); news_at = news_at + 1
  :: else -> break
  od;
  assert(news_read.entry_number == news_written.entry_number);
  assert(news_read.total == news_written.total);
  news_at = 0;
  do
  :: news_at < 800 -> assert(news_read.text[news_at] == news_written.text[news_at]); news_at = news_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Session Status: 13 bytes ---------------------------------------- */

/* The Trading Session Status provides information on the status of a market and on a trading day events */
typedef TradingSessionStatus {
  byte market_id[4];
  byte market_structure_id[4];
  byte trading_session_event;
  byte date[4]
};

int trading_session_status_at;

/* every byte of Trading Session Status set to one value */
inline fill_trading_session_status(trading_session_status_record, trading_session_status_value) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_id[trading_session_status_at] = trading_session_status_value; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_structure_id[trading_session_status_at] = trading_session_status_value; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_record.trading_session_event = trading_session_status_value;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.date[trading_session_status_at] = trading_session_status_value; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Session Status set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status(trading_session_status_record, trading_session_status_base) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_id[trading_session_status_at] = (trading_session_status_base + 0 + trading_session_status_at + 1) % 256; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_structure_id[trading_session_status_at] = (trading_session_status_base + 4 + trading_session_status_at + 1) % 256; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_record.trading_session_event = (trading_session_status_base + 8 + 1) % 256;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.date[trading_session_status_at] = (trading_session_status_base + 9 + trading_session_status_at + 1) % 256; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status to the wire, 13 bytes from where the cursor stands */
inline encode_trading_session_status(trading_session_status_record) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> wire[at] = trading_session_status_record.market_id[trading_session_status_at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> wire[at] = trading_session_status_record.market_structure_id[trading_session_status_at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_record.trading_session_event; at = at + 1;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> wire[at] = trading_session_status_record.date[trading_session_status_at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status off the wire, 13 bytes from where the cursor stands */
inline decode_trading_session_status(trading_session_status_record) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_id[trading_session_status_at] = wire[at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.market_structure_id[trading_session_status_at] = wire[at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_record.trading_session_event = wire[at]; at = at + 1;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> trading_session_status_record.date[trading_session_status_at] = wire[at]; at = at + 1; trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Session Status is what was written, byte for byte */
inline equal_trading_session_status(trading_session_status_read, trading_session_status_written) {
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> assert(trading_session_status_read.market_id[trading_session_status_at] == trading_session_status_written.market_id[trading_session_status_at]); trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> assert(trading_session_status_read.market_structure_id[trading_session_status_at] == trading_session_status_written.market_structure_id[trading_session_status_at]); trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  assert(trading_session_status_read.trading_session_event == trading_session_status_written.trading_session_event);
  trading_session_status_at = 0;
  do
  :: trading_session_status_at < 4 -> assert(trading_session_status_read.date[trading_session_status_at] == trading_session_status_written.date[trading_session_status_at]); trading_session_status_at = trading_session_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Test Event: 201 bytes --------------------------------------------------- */

/* Test event */
typedef TestEvent {
  byte scenario_name[200];
  byte event_type
};

int test_event_at;

/* every byte of Test Event set to one value */
inline fill_test_event(test_event_record, test_event_value) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> test_event_record.scenario_name[test_event_at] = test_event_value; test_event_at = test_event_at + 1
  :: else -> break
  od;
  test_event_record.event_type = test_event_value;
  skip
}

/* each byte of Test Event set to where it lies, so a field read out of place says so */
inline ramp_test_event(test_event_record, test_event_base) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> test_event_record.scenario_name[test_event_at] = (test_event_base + 0 + test_event_at + 1) % 256; test_event_at = test_event_at + 1
  :: else -> break
  od;
  test_event_record.event_type = (test_event_base + 200 + 1) % 256;
  skip
}

/* Test Event to the wire, 201 bytes from where the cursor stands */
inline encode_test_event(test_event_record) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> wire[at] = test_event_record.scenario_name[test_event_at]; at = at + 1; test_event_at = test_event_at + 1
  :: else -> break
  od;
  wire[at] = test_event_record.event_type; at = at + 1;
  skip
}

/* Test Event off the wire, 201 bytes from where the cursor stands */
inline decode_test_event(test_event_record) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> test_event_record.scenario_name[test_event_at] = wire[at]; at = at + 1; test_event_at = test_event_at + 1
  :: else -> break
  od;
  test_event_record.event_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Test Event is what was written, byte for byte */
inline equal_test_event(test_event_read, test_event_written) {
  test_event_at = 0;
  do
  :: test_event_at < 200 -> assert(test_event_read.scenario_name[test_event_at] == test_event_written.scenario_name[test_event_at]); test_event_at = test_event_at + 1
  :: else -> break
  od;
  assert(test_event_read.event_type == test_event_written.event_type);
  skip
}

/* ---- Order Add: 30 bytes ----------------------------------------------------- */

/* New (limit) order added to order book */
typedef OrderAdd {
  byte public_order_id[8];
  byte instrument_id[4];
  byte side;
  byte price[8];
  byte quantity[8];
  byte mm_quote
};

int order_add_at;

/* every byte of Order Add set to one value */
inline fill_order_add(order_add_record, order_add_value) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.public_order_id[order_add_at] = order_add_value; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 4 -> order_add_record.instrument_id[order_add_at] = order_add_value; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_record.side = order_add_value;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.price[order_add_at] = order_add_value; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.quantity[order_add_at] = order_add_value; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_record.mm_quote = order_add_value;
  skip
}

/* each byte of Order Add set to where it lies, so a field read out of place says so */
inline ramp_order_add(order_add_record, order_add_base) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.public_order_id[order_add_at] = (order_add_base + 0 + order_add_at + 1) % 256; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 4 -> order_add_record.instrument_id[order_add_at] = (order_add_base + 8 + order_add_at + 1) % 256; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_record.side = (order_add_base + 12 + 1) % 256;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.price[order_add_at] = (order_add_base + 13 + order_add_at + 1) % 256; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.quantity[order_add_at] = (order_add_base + 21 + order_add_at + 1) % 256; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_record.mm_quote = (order_add_base + 29 + 1) % 256;
  skip
}

/* Order Add to the wire, 30 bytes from where the cursor stands */
inline encode_order_add(order_add_record) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> wire[at] = order_add_record.public_order_id[order_add_at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 4 -> wire[at] = order_add_record.instrument_id[order_add_at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  wire[at] = order_add_record.side; at = at + 1;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> wire[at] = order_add_record.price[order_add_at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> wire[at] = order_add_record.quantity[order_add_at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  wire[at] = order_add_record.mm_quote; at = at + 1;
  skip
}

/* Order Add off the wire, 30 bytes from where the cursor stands */
inline decode_order_add(order_add_record) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.public_order_id[order_add_at] = wire[at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 4 -> order_add_record.instrument_id[order_add_at] = wire[at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_record.side = wire[at]; at = at + 1;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.price[order_add_at] = wire[at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> order_add_record.quantity[order_add_at] = wire[at]; at = at + 1; order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_record.mm_quote = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Add is what was written, byte for byte */
inline equal_order_add(order_add_read, order_add_written) {
  order_add_at = 0;
  do
  :: order_add_at < 8 -> assert(order_add_read.public_order_id[order_add_at] == order_add_written.public_order_id[order_add_at]); order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 4 -> assert(order_add_read.instrument_id[order_add_at] == order_add_written.instrument_id[order_add_at]); order_add_at = order_add_at + 1
  :: else -> break
  od;
  assert(order_add_read.side == order_add_written.side);
  order_add_at = 0;
  do
  :: order_add_at < 8 -> assert(order_add_read.price[order_add_at] == order_add_written.price[order_add_at]); order_add_at = order_add_at + 1
  :: else -> break
  od;
  order_add_at = 0;
  do
  :: order_add_at < 8 -> assert(order_add_read.quantity[order_add_at] == order_add_written.quantity[order_add_at]); order_add_at = order_add_at + 1
  :: else -> break
  od;
  assert(order_add_read.mm_quote == order_add_written.mm_quote);
  skip
}

/* ---- Login Response: 1 bytes ------------------------------------------------- */

/* Response to a Login message */
typedef LoginResponse {
  byte result
};

/* every byte of Login Response set to one value */
inline fill_login_response(login_response_record, login_response_value) {
  login_response_record.result = login_response_value;
  skip
}

/* each byte of Login Response set to where it lies, so a field read out of place says so */
inline ramp_login_response(login_response_record, login_response_base) {
  login_response_record.result = (login_response_base + 0 + 1) % 256;
  skip
}

/* Login Response to the wire, 1 bytes from where the cursor stands */
inline encode_login_response(login_response_record) {
  wire[at] = login_response_record.result; at = at + 1;
  skip
}

/* Login Response off the wire, 1 bytes from where the cursor stands */
inline decode_login_response(login_response_record) {
  login_response_record.result = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response is what was written, byte for byte */
inline equal_login_response(login_response_read, login_response_written) {
  assert(login_response_read.result == login_response_written.result);
  skip
}

/* ---- End Of Snapshot: 4 bytes ------------------------------------------------ */

/* Marks the end of a snapshot */
typedef EndOfSnapshot {
  byte last_seq_num[4]
};

int end_of_snapshot_at;

/* every byte of End Of Snapshot set to one value */
inline fill_end_of_snapshot(end_of_snapshot_record, end_of_snapshot_value) {
  end_of_snapshot_at = 0;
  do
  :: end_of_snapshot_at < 4 -> end_of_snapshot_record.last_seq_num[end_of_snapshot_at] = end_of_snapshot_value; end_of_snapshot_at = end_of_snapshot_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Snapshot set to where it lies, so a field read out of place says so */
inline ramp_end_of_snapshot(end_of_snapshot_record, end_of_snapshot_base) {
  end_of_snapshot_at = 0;
  do
  :: end_of_snapshot_at < 4 -> end_of_snapshot_record.last_seq_num[end_of_snapshot_at] = (end_of_snapshot_base + 0 + end_of_snapshot_at + 1) % 256; end_of_snapshot_at = end_of_snapshot_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_snapshot(end_of_snapshot_record) {
  end_of_snapshot_at = 0;
  do
  :: end_of_snapshot_at < 4 -> wire[at] = end_of_snapshot_record.last_seq_num[end_of_snapshot_at]; at = at + 1; end_of_snapshot_at = end_of_snapshot_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_snapshot(end_of_snapshot_record) {
  end_of_snapshot_at = 0;
  do
  :: end_of_snapshot_at < 4 -> end_of_snapshot_record.last_seq_num[end_of_snapshot_at] = wire[at]; at = at + 1; end_of_snapshot_at = end_of_snapshot_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Snapshot is what was written, byte for byte */
inline equal_end_of_snapshot(end_of_snapshot_read, end_of_snapshot_written) {
  end_of_snapshot_at = 0;
  do
  :: end_of_snapshot_at < 4 -> assert(end_of_snapshot_read.last_seq_num[end_of_snapshot_at] == end_of_snapshot_written.last_seq_num[end_of_snapshot_at]); end_of_snapshot_at = end_of_snapshot_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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
    assert(at == 42);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 42);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Calendar Exception: encoded, read back, and compared */
proctype check_calendar_exception() {
  CalendarException calendar_exception_sent;
  CalendarException calendar_exception_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_calendar_exception(calendar_exception_sent, 0)
  :: pattern == 1 -> fill_calendar_exception(calendar_exception_sent, 32)
  :: pattern == 2 -> fill_calendar_exception(calendar_exception_sent, 255)
  :: else -> ramp_calendar_exception(calendar_exception_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_calendar_exception(calendar_exception_sent);
    assert(at == 9);
    at = 0;
    decode_calendar_exception(calendar_exception_got);
    assert(at == 9);
    equal_calendar_exception(calendar_exception_got, calendar_exception_sent)
  }
}

/* Tick Table Entry: encoded, read back, and compared */
proctype check_tick_table_entry() {
  TickTableEntry tick_table_entry_sent;
  TickTableEntry tick_table_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_table_entry(tick_table_entry_sent, 0)
  :: pattern == 1 -> fill_tick_table_entry(tick_table_entry_sent, 32)
  :: pattern == 2 -> fill_tick_table_entry(tick_table_entry_sent, 255)
  :: else -> ramp_tick_table_entry(tick_table_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_table_entry(tick_table_entry_sent);
    assert(at == 20);
    at = 0;
    decode_tick_table_entry(tick_table_entry_got);
    assert(at == 20);
    equal_tick_table_entry(tick_table_entry_got, tick_table_entry_sent)
  }
}

/* Collar Table Entry: encoded, read back, and compared */
proctype check_collar_table_entry() {
  CollarTableEntry collar_table_entry_sent;
  CollarTableEntry collar_table_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collar_table_entry(collar_table_entry_sent, 0)
  :: pattern == 1 -> fill_collar_table_entry(collar_table_entry_sent, 32)
  :: pattern == 2 -> fill_collar_table_entry(collar_table_entry_sent, 255)
  :: else -> ramp_collar_table_entry(collar_table_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collar_table_entry(collar_table_entry_sent);
    assert(at == 54);
    at = 0;
    decode_collar_table_entry(collar_table_entry_got);
    assert(at == 54);
    equal_collar_table_entry(collar_table_entry_got, collar_table_entry_sent)
  }
}

/* Trading Phase Schedule Entry: encoded, read back, and compared */
proctype check_trading_phase_schedule_entry() {
  TradingPhaseScheduleEntry trading_phase_schedule_entry_sent;
  TradingPhaseScheduleEntry trading_phase_schedule_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_phase_schedule_entry(trading_phase_schedule_entry_sent, 0)
  :: pattern == 1 -> fill_trading_phase_schedule_entry(trading_phase_schedule_entry_sent, 32)
  :: pattern == 2 -> fill_trading_phase_schedule_entry(trading_phase_schedule_entry_sent, 255)
  :: else -> ramp_trading_phase_schedule_entry(trading_phase_schedule_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_phase_schedule_entry(trading_phase_schedule_entry_sent);
    assert(at == 40);
    at = 0;
    decode_trading_phase_schedule_entry(trading_phase_schedule_entry_got);
    assert(at == 40);
    equal_trading_phase_schedule_entry(trading_phase_schedule_entry_got, trading_phase_schedule_entry_sent)
  }
}

/* Market Structure: encoded, read back, and compared */
proctype check_market_structure() {
  MarketStructure market_structure_sent;
  MarketStructure market_structure_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_structure(market_structure_sent, 0)
  :: pattern == 1 -> fill_market_structure(market_structure_sent, 32)
  :: pattern == 2 -> fill_market_structure(market_structure_sent, 255)
  :: else -> ramp_market_structure(market_structure_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_structure(market_structure_sent);
    assert(at == 63);
    at = 0;
    decode_market_structure(market_structure_got);
    assert(at == 63);
    equal_market_structure(market_structure_got, market_structure_sent)
  }
}

/* Collar Group: encoded, read back, and compared */
proctype check_collar_group() {
  CollarGroup collar_group_sent;
  CollarGroup collar_group_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collar_group(collar_group_sent, 0)
  :: pattern == 1 -> fill_collar_group(collar_group_sent, 32)
  :: pattern == 2 -> fill_collar_group(collar_group_sent, 255)
  :: else -> ramp_collar_group(collar_group_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collar_group(collar_group_sent);
    assert(at == 20);
    at = 0;
    decode_collar_group(collar_group_got);
    assert(at == 20);
    equal_collar_group(collar_group_got, collar_group_sent)
  }
}

/* External Underlying: encoded, read back, and compared */
proctype check_external_underlying() {
  ExternalUnderlying external_underlying_sent;
  ExternalUnderlying external_underlying_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_external_underlying(external_underlying_sent, 0)
  :: pattern == 1 -> fill_external_underlying(external_underlying_sent, 32)
  :: pattern == 2 -> fill_external_underlying(external_underlying_sent, 255)
  :: else -> ramp_external_underlying(external_underlying_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_external_underlying(external_underlying_sent);
    assert(at == 113);
    at = 0;
    decode_external_underlying(external_underlying_got);
    assert(at == 113);
    equal_external_underlying(external_underlying_got, external_underlying_sent)
  }
}

/* Instrument: encoded, read back, and compared */
proctype check_instrument() {
  Instrument instrument_sent;
  Instrument instrument_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument(instrument_sent, 0)
  :: pattern == 1 -> fill_instrument(instrument_sent, 32)
  :: pattern == 2 -> fill_instrument(instrument_sent, 255)
  :: else -> ramp_instrument(instrument_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument(instrument_sent);
    assert(at == 699);
    at = 0;
    decode_instrument(instrument_got);
    assert(at == 699);
    equal_instrument(instrument_got, instrument_sent)
  }
}

/* Accrued Interest Table Entry: encoded, read back, and compared */
proctype check_accrued_interest_table_entry() {
  AccruedInterestTableEntry accrued_interest_table_entry_sent;
  AccruedInterestTableEntry accrued_interest_table_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_accrued_interest_table_entry(accrued_interest_table_entry_sent, 0)
  :: pattern == 1 -> fill_accrued_interest_table_entry(accrued_interest_table_entry_sent, 32)
  :: pattern == 2 -> fill_accrued_interest_table_entry(accrued_interest_table_entry_sent, 255)
  :: else -> ramp_accrued_interest_table_entry(accrued_interest_table_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_accrued_interest_table_entry(accrued_interest_table_entry_sent);
    assert(at == 16);
    at = 0;
    decode_accrued_interest_table_entry(accrued_interest_table_entry_got);
    assert(at == 16);
    equal_accrued_interest_table_entry(accrued_interest_table_entry_got, accrued_interest_table_entry_sent)
  }
}

/* Indexation Table Entry: encoded, read back, and compared */
proctype check_indexation_table_entry() {
  IndexationTableEntry indexation_table_entry_sent;
  IndexationTableEntry indexation_table_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indexation_table_entry(indexation_table_entry_sent, 0)
  :: pattern == 1 -> fill_indexation_table_entry(indexation_table_entry_sent, 32)
  :: pattern == 2 -> fill_indexation_table_entry(indexation_table_entry_sent, 255)
  :: else -> ramp_indexation_table_entry(indexation_table_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indexation_table_entry(indexation_table_entry_sent);
    assert(at == 16);
    at = 0;
    decode_indexation_table_entry(indexation_table_entry_got);
    assert(at == 16);
    equal_indexation_table_entry(indexation_table_entry_got, indexation_table_entry_sent)
  }
}

/* Product Identification Public Product Identification: encoded, read back, and compared */
proctype check_product_identification_public_product_identification() {
  ProductIdentificationPublicProductIdentification product_identification_public_product_identification_sent;
  ProductIdentificationPublicProductIdentification product_identification_public_product_identification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_product_identification_public_product_identification(product_identification_public_product_identification_sent, 0)
  :: pattern == 1 -> fill_product_identification_public_product_identification(product_identification_public_product_identification_sent, 32)
  :: pattern == 2 -> fill_product_identification_public_product_identification(product_identification_public_product_identification_sent, 255)
  :: else -> ramp_product_identification_public_product_identification(product_identification_public_product_identification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_product_identification_public_product_identification(product_identification_public_product_identification_sent);
    assert(at == 31);
    at = 0;
    decode_product_identification_public_product_identification(product_identification_public_product_identification_got);
    assert(at == 31);
    equal_product_identification_public_product_identification(product_identification_public_product_identification_got, product_identification_public_product_identification_sent)
  }
}

/* Index Underlying: encoded, read back, and compared */
proctype check_index_underlying() {
  IndexUnderlying index_underlying_sent;
  IndexUnderlying index_underlying_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_underlying(index_underlying_sent, 0)
  :: pattern == 1 -> fill_index_underlying(index_underlying_sent, 32)
  :: pattern == 2 -> fill_index_underlying(index_underlying_sent, 255)
  :: else -> ramp_index_underlying(index_underlying_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_underlying(index_underlying_sent);
    assert(at == 32);
    at = 0;
    decode_index_underlying(index_underlying_got);
    assert(at == 32);
    equal_index_underlying(index_underlying_got, index_underlying_sent)
  }
}

/* Public Product Identification: encoded, read back, and compared */
proctype check_public_product_identification() {
  PublicProductIdentification public_product_identification_sent;
  PublicProductIdentification public_product_identification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_public_product_identification(public_product_identification_sent, 0)
  :: pattern == 1 -> fill_public_product_identification(public_product_identification_sent, 32)
  :: pattern == 2 -> fill_public_product_identification(public_product_identification_sent, 255)
  :: else -> ramp_public_product_identification(public_product_identification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_public_product_identification(public_product_identification_sent);
    assert(at == 31);
    at = 0;
    decode_public_product_identification(public_product_identification_got);
    assert(at == 31);
    equal_public_product_identification(public_product_identification_got, public_product_identification_sent)
  }
}

/* Auction Summary: encoded, read back, and compared */
proctype check_auction_summary() {
  AuctionSummary auction_summary_sent;
  AuctionSummary auction_summary_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_summary(auction_summary_sent, 0)
  :: pattern == 1 -> fill_auction_summary(auction_summary_sent, 32)
  :: pattern == 2 -> fill_auction_summary(auction_summary_sent, 255)
  :: else -> ramp_auction_summary(auction_summary_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_summary(auction_summary_sent);
    assert(at == 21);
    at = 0;
    decode_auction_summary(auction_summary_got);
    assert(at == 21);
    equal_auction_summary(auction_summary_got, auction_summary_sent)
  }
}

/* Auction Update: encoded, read back, and compared */
proctype check_auction_update() {
  AuctionUpdate auction_update_sent;
  AuctionUpdate auction_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_update(auction_update_sent, 0)
  :: pattern == 1 -> fill_auction_update(auction_update_sent, 32)
  :: pattern == 2 -> fill_auction_update(auction_update_sent, 255)
  :: else -> ramp_auction_update(auction_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_update(auction_update_sent);
    assert(at == 68);
    at = 0;
    decode_auction_update(auction_update_got);
    assert(at == 68);
    equal_auction_update(auction_update_got, auction_update_sent)
  }
}

/* Price Level: encoded, read back, and compared */
proctype check_price_level() {
  PriceLevel price_level_sent;
  PriceLevel price_level_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_level(price_level_sent, 0)
  :: pattern == 1 -> fill_price_level(price_level_sent, 32)
  :: pattern == 2 -> fill_price_level(price_level_sent, 255)
  :: else -> ramp_price_level(price_level_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_level(price_level_sent);
    assert(at == 31);
    at = 0;
    decode_price_level(price_level_got);
    assert(at == 31);
    equal_price_level(price_level_got, price_level_sent)
  }
}

/* Top Price Level Update: encoded, read back, and compared */
proctype check_top_price_level_update() {
  TopPriceLevelUpdate top_price_level_update_sent;
  TopPriceLevelUpdate top_price_level_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_price_level_update(top_price_level_update_sent, 0)
  :: pattern == 1 -> fill_top_price_level_update(top_price_level_update_sent, 32)
  :: pattern == 2 -> fill_top_price_level_update(top_price_level_update_sent, 255)
  :: else -> ramp_top_price_level_update(top_price_level_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_price_level_update(top_price_level_update_sent);
    assert(at == 23);
    at = 0;
    decode_top_price_level_update(top_price_level_update_got);
    assert(at == 23);
    equal_top_price_level_update(top_price_level_update_got, top_price_level_update_sent)
  }
}

/* Trade: encoded, read back, and compared */
proctype check_trade() {
  Trade trade_sent;
  Trade trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade(trade_sent, 0)
  :: pattern == 1 -> fill_trade(trade_sent, 32)
  :: pattern == 2 -> fill_trade(trade_sent, 255)
  :: else -> ramp_trade(trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade(trade_sent);
    assert(at == 178);
    at = 0;
    decode_trade(trade_got);
    assert(at == 178);
    equal_trade(trade_got, trade_sent)
  }
}

/* Position Report: encoded, read back, and compared */
proctype check_position_report() {
  PositionReport position_report_sent;
  PositionReport position_report_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_position_report(position_report_sent, 0)
  :: pattern == 1 -> fill_position_report(position_report_sent, 32)
  :: pattern == 2 -> fill_position_report(position_report_sent, 255)
  :: else -> ramp_position_report(position_report_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_position_report(position_report_sent);
    assert(at == 40);
    at = 0;
    decode_position_report(position_report_got);
    assert(at == 40);
    equal_position_report(position_report_got, position_report_sent)
  }
}

/* Instrument Status Change: encoded, read back, and compared */
proctype check_instrument_status_change() {
  InstrumentStatusChange instrument_status_change_sent;
  InstrumentStatusChange instrument_status_change_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_status_change(instrument_status_change_sent, 0)
  :: pattern == 1 -> fill_instrument_status_change(instrument_status_change_sent, 32)
  :: pattern == 2 -> fill_instrument_status_change(instrument_status_change_sent, 255)
  :: else -> ramp_instrument_status_change(instrument_status_change_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_status_change(instrument_status_change_sent);
    assert(at == 11);
    at = 0;
    decode_instrument_status_change(instrument_status_change_got);
    assert(at == 11);
    equal_instrument_status_change(instrument_status_change_got, instrument_status_change_sent)
  }
}

/* Order Collars: encoded, read back, and compared */
proctype check_order_collars() {
  OrderCollars order_collars_sent;
  OrderCollars order_collars_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_collars(order_collars_sent, 0)
  :: pattern == 1 -> fill_order_collars(order_collars_sent, 32)
  :: pattern == 2 -> fill_order_collars(order_collars_sent, 255)
  :: else -> ramp_order_collars(order_collars_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_collars(order_collars_sent);
    assert(at == 45);
    at = 0;
    decode_order_collars(order_collars_got);
    assert(at == 45);
    equal_order_collars(order_collars_got, order_collars_sent)
  }
}

/* Trade Collars: encoded, read back, and compared */
proctype check_trade_collars() {
  TradeCollars trade_collars_sent;
  TradeCollars trade_collars_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_collars(trade_collars_sent, 0)
  :: pattern == 1 -> fill_trade_collars(trade_collars_sent, 32)
  :: pattern == 2 -> fill_trade_collars(trade_collars_sent, 255)
  :: else -> ramp_trade_collars(trade_collars_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_collars(trade_collars_sent);
    assert(at == 29);
    at = 0;
    decode_trade_collars(trade_collars_got);
    assert(at == 29);
    equal_trade_collars(trade_collars_got, trade_collars_sent)
  }
}

/* Instrument Summary: encoded, read back, and compared */
proctype check_instrument_summary() {
  InstrumentSummary instrument_summary_sent;
  InstrumentSummary instrument_summary_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_summary(instrument_summary_sent, 0)
  :: pattern == 1 -> fill_instrument_summary(instrument_summary_sent, 32)
  :: pattern == 2 -> fill_instrument_summary(instrument_summary_sent, 255)
  :: else -> ramp_instrument_summary(instrument_summary_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_summary(instrument_summary_sent);
    assert(at == 95);
    at = 0;
    decode_instrument_summary(instrument_summary_got);
    assert(at == 95);
    equal_instrument_summary(instrument_summary_got, instrument_summary_sent)
  }
}

/* Clob Instrument: encoded, read back, and compared */
proctype check_clob_instrument() {
  ClobInstrument clob_instrument_sent;
  ClobInstrument clob_instrument_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clob_instrument(clob_instrument_sent, 0)
  :: pattern == 1 -> fill_clob_instrument(clob_instrument_sent, 32)
  :: pattern == 2 -> fill_clob_instrument(clob_instrument_sent, 255)
  :: else -> ramp_clob_instrument(clob_instrument_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clob_instrument(clob_instrument_sent);
    assert(at == 119);
    at = 0;
    decode_clob_instrument(clob_instrument_got);
    assert(at == 119);
    equal_clob_instrument(clob_instrument_got, clob_instrument_sent)
  }
}

/* Cross Instrument: encoded, read back, and compared */
proctype check_cross_instrument() {
  CrossInstrument cross_instrument_sent;
  CrossInstrument cross_instrument_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_instrument(cross_instrument_sent, 0)
  :: pattern == 1 -> fill_cross_instrument(cross_instrument_sent, 32)
  :: pattern == 2 -> fill_cross_instrument(cross_instrument_sent, 255)
  :: else -> ramp_cross_instrument(cross_instrument_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_instrument(cross_instrument_sent);
    assert(at == 119);
    at = 0;
    decode_cross_instrument(cross_instrument_got);
    assert(at == 119);
    equal_cross_instrument(cross_instrument_got, cross_instrument_sent)
  }
}

/* Block Instrument: encoded, read back, and compared */
proctype check_block_instrument() {
  BlockInstrument block_instrument_sent;
  BlockInstrument block_instrument_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_instrument(block_instrument_sent, 0)
  :: pattern == 1 -> fill_block_instrument(block_instrument_sent, 32)
  :: pattern == 2 -> fill_block_instrument(block_instrument_sent, 255)
  :: else -> ramp_block_instrument(block_instrument_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_instrument(block_instrument_sent);
    assert(at == 119);
    at = 0;
    decode_block_instrument(block_instrument_got);
    assert(at == 119);
    equal_block_instrument(block_instrument_got, block_instrument_sent)
  }
}

/* Hybrid Instrument: encoded, read back, and compared */
proctype check_hybrid_instrument() {
  HybridInstrument hybrid_instrument_sent;
  HybridInstrument hybrid_instrument_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_hybrid_instrument(hybrid_instrument_sent, 0)
  :: pattern == 1 -> fill_hybrid_instrument(hybrid_instrument_sent, 32)
  :: pattern == 2 -> fill_hybrid_instrument(hybrid_instrument_sent, 255)
  :: else -> ramp_hybrid_instrument(hybrid_instrument_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_hybrid_instrument(hybrid_instrument_sent);
    assert(at == 119);
    at = 0;
    decode_hybrid_instrument(hybrid_instrument_got);
    assert(at == 119);
    equal_hybrid_instrument(hybrid_instrument_got, hybrid_instrument_sent)
  }
}

/* Product Summary: encoded, read back, and compared */
proctype check_product_summary() {
  ProductSummary product_summary_sent;
  ProductSummary product_summary_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_product_summary(product_summary_sent, 0)
  :: pattern == 1 -> fill_product_summary(product_summary_sent, 32)
  :: pattern == 2 -> fill_product_summary(product_summary_sent, 255)
  :: else -> ramp_product_summary(product_summary_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_product_summary(product_summary_sent);
    assert(at == 629);
    at = 0;
    decode_product_summary(product_summary_got);
    assert(at == 629);
    equal_product_summary(product_summary_got, product_summary_sent)
  }
}

/* News: encoded, read back, and compared */
proctype check_news() {
  News news_sent;
  News news_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_news(news_sent, 0)
  :: pattern == 1 -> fill_news(news_sent, 32)
  :: pattern == 2 -> fill_news(news_sent, 255)
  :: else -> ramp_news(news_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_news(news_sent);
    assert(at == 890);
    at = 0;
    decode_news(news_got);
    assert(at == 890);
    equal_news(news_got, news_sent)
  }
}

/* Trading Session Status: encoded, read back, and compared */
proctype check_trading_session_status() {
  TradingSessionStatus trading_session_status_sent;
  TradingSessionStatus trading_session_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_status(trading_session_status_sent, 0)
  :: pattern == 1 -> fill_trading_session_status(trading_session_status_sent, 32)
  :: pattern == 2 -> fill_trading_session_status(trading_session_status_sent, 255)
  :: else -> ramp_trading_session_status(trading_session_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_status(trading_session_status_sent);
    assert(at == 13);
    at = 0;
    decode_trading_session_status(trading_session_status_got);
    assert(at == 13);
    equal_trading_session_status(trading_session_status_got, trading_session_status_sent)
  }
}

/* Test Event: encoded, read back, and compared */
proctype check_test_event() {
  TestEvent test_event_sent;
  TestEvent test_event_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_test_event(test_event_sent, 0)
  :: pattern == 1 -> fill_test_event(test_event_sent, 32)
  :: pattern == 2 -> fill_test_event(test_event_sent, 255)
  :: else -> ramp_test_event(test_event_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_test_event(test_event_sent);
    assert(at == 201);
    at = 0;
    decode_test_event(test_event_got);
    assert(at == 201);
    equal_test_event(test_event_got, test_event_sent)
  }
}

/* Order Add: encoded, read back, and compared */
proctype check_order_add() {
  OrderAdd order_add_sent;
  OrderAdd order_add_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add(order_add_sent, 0)
  :: pattern == 1 -> fill_order_add(order_add_sent, 32)
  :: pattern == 2 -> fill_order_add(order_add_sent, 255)
  :: else -> ramp_order_add(order_add_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add(order_add_sent);
    assert(at == 30);
    at = 0;
    decode_order_add(order_add_got);
    assert(at == 30);
    equal_order_add(order_add_got, order_add_sent)
  }
}

/* Login Response: encoded, read back, and compared */
proctype check_login_response() {
  LoginResponse login_response_sent;
  LoginResponse login_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response(login_response_sent, 0)
  :: pattern == 1 -> fill_login_response(login_response_sent, 32)
  :: pattern == 2 -> fill_login_response(login_response_sent, 255)
  :: else -> ramp_login_response(login_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response(login_response_sent);
    assert(at == 1);
    at = 0;
    decode_login_response(login_response_got);
    assert(at == 1);
    equal_login_response(login_response_got, login_response_sent)
  }
}

/* End Of Snapshot: encoded, read back, and compared */
proctype check_end_of_snapshot() {
  EndOfSnapshot end_of_snapshot_sent;
  EndOfSnapshot end_of_snapshot_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_snapshot(end_of_snapshot_sent, 0)
  :: pattern == 1 -> fill_end_of_snapshot(end_of_snapshot_sent, 32)
  :: pattern == 2 -> fill_end_of_snapshot(end_of_snapshot_sent, 255)
  :: else -> ramp_end_of_snapshot(end_of_snapshot_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_snapshot(end_of_snapshot_sent);
    assert(at == 4);
    at = 0;
    decode_end_of_snapshot(end_of_snapshot_got);
    assert(at == 4);
    equal_end_of_snapshot(end_of_snapshot_got, end_of_snapshot_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_calendar_exception()
  :: run check_tick_table_entry()
  :: run check_collar_table_entry()
  :: run check_trading_phase_schedule_entry()
  :: run check_market_structure()
  :: run check_collar_group()
  :: run check_external_underlying()
  :: run check_instrument()
  :: run check_accrued_interest_table_entry()
  :: run check_indexation_table_entry()
  :: run check_product_identification_public_product_identification()
  :: run check_index_underlying()
  :: run check_public_product_identification()
  :: run check_auction_summary()
  :: run check_auction_update()
  :: run check_price_level()
  :: run check_top_price_level_update()
  :: run check_trade()
  :: run check_position_report()
  :: run check_instrument_status_change()
  :: run check_order_collars()
  :: run check_trade_collars()
  :: run check_instrument_summary()
  :: run check_clob_instrument()
  :: run check_cross_instrument()
  :: run check_block_instrument()
  :: run check_hybrid_instrument()
  :: run check_product_summary()
  :: run check_news()
  :: run check_trading_session_status()
  :: run check_test_event()
  :: run check_order_add()
  :: run check_login_response()
  :: run check_end_of_snapshot()
  fi
}
