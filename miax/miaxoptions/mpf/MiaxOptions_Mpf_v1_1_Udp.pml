/*
 * Miami International Holdings MIAX Product Feed
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
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 37

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Mach Packet Header: 12 bytes -------------------------------------------- */

/* Mach packet header (12 bytes) */
typedef MachPacketHeader {
  byte sequence_number[8];
  byte packet_length[2];
  byte packet_type;
  byte session_number
};

int mach_packet_header_at;

/* every byte of Mach Packet Header set to one value */
inline fill_mach_packet_header(mach_packet_header_record, mach_packet_header_value) {
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 8 -> mach_packet_header_record.sequence_number[mach_packet_header_at] = mach_packet_header_value; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 2 -> mach_packet_header_record.packet_length[mach_packet_header_at] = mach_packet_header_value; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_record.packet_type = mach_packet_header_value;
  mach_packet_header_record.session_number = mach_packet_header_value;
  skip
}

/* each byte of Mach Packet Header set to where it lies, so a field read out of place says so */
inline ramp_mach_packet_header(mach_packet_header_record, mach_packet_header_base) {
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 8 -> mach_packet_header_record.sequence_number[mach_packet_header_at] = (mach_packet_header_base + 0 + mach_packet_header_at + 1) % 256; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 2 -> mach_packet_header_record.packet_length[mach_packet_header_at] = (mach_packet_header_base + 8 + mach_packet_header_at + 1) % 256; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_record.packet_type = (mach_packet_header_base + 10 + 1) % 256;
  mach_packet_header_record.session_number = (mach_packet_header_base + 11 + 1) % 256;
  skip
}

/* Mach Packet Header to the wire, 12 bytes from where the cursor stands */
inline encode_mach_packet_header(mach_packet_header_record) {
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 8 -> wire[at] = mach_packet_header_record.sequence_number[mach_packet_header_at]; at = at + 1; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 2 -> wire[at] = mach_packet_header_record.packet_length[mach_packet_header_at]; at = at + 1; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = mach_packet_header_record.packet_type; at = at + 1;
  wire[at] = mach_packet_header_record.session_number; at = at + 1;
  skip
}

/* Mach Packet Header off the wire, 12 bytes from where the cursor stands */
inline decode_mach_packet_header(mach_packet_header_record) {
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 8 -> mach_packet_header_record.sequence_number[mach_packet_header_at] = wire[at]; at = at + 1; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 2 -> mach_packet_header_record.packet_length[mach_packet_header_at] = wire[at]; at = at + 1; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_record.packet_type = wire[at]; at = at + 1;
  mach_packet_header_record.session_number = wire[at]; at = at + 1;
  skip
}

/* what was read of Mach Packet Header is what was written, byte for byte */
inline equal_mach_packet_header(mach_packet_header_read, mach_packet_header_written) {
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 8 -> assert(mach_packet_header_read.sequence_number[mach_packet_header_at] == mach_packet_header_written.sequence_number[mach_packet_header_at]); mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_at = 0;
  do
  :: mach_packet_header_at < 2 -> assert(mach_packet_header_read.packet_length[mach_packet_header_at] == mach_packet_header_written.packet_length[mach_packet_header_at]); mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  assert(mach_packet_header_read.packet_type == mach_packet_header_written.packet_type);
  assert(mach_packet_header_read.session_number == mach_packet_header_written.session_number);
  skip
}

/* ---- System Time Message: 4 bytes -------------------------------------------- */

/* This is the message format that will be used to disseminate the “seconds” part of the timestamp that is applicable to all messages that are sent in the current second. */
typedef SystemTimeMessage {
  byte seconds[4]
};

int system_time_message_at;

/* every byte of System Time Message set to one value */
inline fill_system_time_message(system_time_message_record, system_time_message_value) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> system_time_message_record.seconds[system_time_message_at] = system_time_message_value; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Time Message set to where it lies, so a field read out of place says so */
inline ramp_system_time_message(system_time_message_record, system_time_message_base) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> system_time_message_record.seconds[system_time_message_at] = (system_time_message_base + 0 + system_time_message_at + 1) % 256; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_system_time_message(system_time_message_record) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> wire[at] = system_time_message_record.seconds[system_time_message_at]; at = at + 1; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_system_time_message(system_time_message_record) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> system_time_message_record.seconds[system_time_message_at] = wire[at]; at = at + 1; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Time Message is what was written, byte for byte */
inline equal_system_time_message(system_time_message_read, system_time_message_written) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> assert(system_time_message_read.seconds[system_time_message_at] == system_time_message_written.seconds[system_time_message_at]); system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Definition Message: 37 bytes ------------------------------------- */

/* This is the message format that will be used to disseminate all Synthetic Future symbol definitions for the current session. */
typedef SymbolDefinitionMessage {
  byte nanoseconds[4];
  byte synthetic_future_symbol[8];
  byte settlement_date[8];
  byte symbol_status;
  byte reserved_16[16]
};

int symbol_definition_message_at;

/* every byte of Symbol Definition Message set to one value */
inline fill_symbol_definition_message(symbol_definition_message_record, symbol_definition_message_value) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> symbol_definition_message_record.nanoseconds[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.settlement_date[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_record.symbol_status = symbol_definition_message_value;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> symbol_definition_message_record.reserved_16[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Definition Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_definition_message(symbol_definition_message_record, symbol_definition_message_base) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> symbol_definition_message_record.nanoseconds[symbol_definition_message_at] = (symbol_definition_message_base + 0 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at] = (symbol_definition_message_base + 4 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.settlement_date[symbol_definition_message_at] = (symbol_definition_message_base + 12 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_record.symbol_status = (symbol_definition_message_base + 20 + 1) % 256;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> symbol_definition_message_record.reserved_16[symbol_definition_message_at] = (symbol_definition_message_base + 21 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Definition Message to the wire, 37 bytes from where the cursor stands */
inline encode_symbol_definition_message(symbol_definition_message_record) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> wire[at] = symbol_definition_message_record.nanoseconds[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> wire[at] = symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> wire[at] = symbol_definition_message_record.settlement_date[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_definition_message_record.symbol_status; at = at + 1;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> wire[at] = symbol_definition_message_record.reserved_16[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Definition Message off the wire, 37 bytes from where the cursor stands */
inline decode_symbol_definition_message(symbol_definition_message_record) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> symbol_definition_message_record.nanoseconds[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.settlement_date[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_record.symbol_status = wire[at]; at = at + 1;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> symbol_definition_message_record.reserved_16[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Definition Message is what was written, byte for byte */
inline equal_symbol_definition_message(symbol_definition_message_read, symbol_definition_message_written) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> assert(symbol_definition_message_read.nanoseconds[symbol_definition_message_at] == symbol_definition_message_written.nanoseconds[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> assert(symbol_definition_message_read.synthetic_future_symbol[symbol_definition_message_at] == symbol_definition_message_written.synthetic_future_symbol[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> assert(symbol_definition_message_read.settlement_date[symbol_definition_message_at] == symbol_definition_message_written.settlement_date[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  assert(symbol_definition_message_read.symbol_status == symbol_definition_message_written.symbol_status);
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> assert(symbol_definition_message_read.reserved_16[symbol_definition_message_at] == symbol_definition_message_written.reserved_16[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Value Message: 13 bytes ------------------------------------------- */

/* This is the message format that will be used to disseminate current index value. The index value may be the index cash value or the index settlement value, as identified by the Index Symbol. */
typedef IndexValueMessage {
  byte nanoseconds[4];
  byte symbol[5];
  byte value[4]
};

int index_value_message_at;

/* every byte of Index Value Message set to one value */
inline fill_index_value_message(index_value_message_record, index_value_message_value) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.nanoseconds[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> index_value_message_record.symbol[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.value[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Value Message set to where it lies, so a field read out of place says so */
inline ramp_index_value_message(index_value_message_record, index_value_message_base) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.nanoseconds[index_value_message_at] = (index_value_message_base + 0 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> index_value_message_record.symbol[index_value_message_at] = (index_value_message_base + 4 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.value[index_value_message_at] = (index_value_message_base + 9 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message to the wire, 13 bytes from where the cursor stands */
inline encode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.nanoseconds[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> wire[at] = index_value_message_record.symbol[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.value[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message off the wire, 13 bytes from where the cursor stands */
inline decode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.nanoseconds[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> index_value_message_record.symbol[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.value[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Value Message is what was written, byte for byte */
inline equal_index_value_message(index_value_message_read, index_value_message_written) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.nanoseconds[index_value_message_at] == index_value_message_written.nanoseconds[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> assert(index_value_message_read.symbol[index_value_message_at] == index_value_message_written.symbol[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.value[index_value_message_at] == index_value_message_written.value[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Synthetic Future Value Message: 24 bytes -------------------------------- */

/* This is the message format that will be used to disseminate current Synthetic Future values. The specific Synthetic Future value is identified by the Synthetic Future Symbol. */
typedef SyntheticFutureValueMessage {
  byte nanoseconds[4];
  byte synthetic_future_symbol[8];
  byte value[4];
  byte reserved_8[8]
};

int synthetic_future_value_message_at;

/* every byte of Synthetic Future Value Message set to one value */
inline fill_synthetic_future_value_message(synthetic_future_value_message_record, synthetic_future_value_message_value) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.value[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Synthetic Future Value Message set to where it lies, so a field read out of place says so */
inline ramp_synthetic_future_value_message(synthetic_future_value_message_record, synthetic_future_value_message_base) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 0 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 4 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.value[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 12 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 16 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Synthetic Future Value Message to the wire, 24 bytes from where the cursor stands */
inline encode_synthetic_future_value_message(synthetic_future_value_message_record) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> wire[at] = synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> wire[at] = synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> wire[at] = synthetic_future_value_message_record.value[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> wire[at] = synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Synthetic Future Value Message off the wire, 24 bytes from where the cursor stands */
inline decode_synthetic_future_value_message(synthetic_future_value_message_record) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.value[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Synthetic Future Value Message is what was written, byte for byte */
inline equal_synthetic_future_value_message(synthetic_future_value_message_read, synthetic_future_value_message_written) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> assert(synthetic_future_value_message_read.nanoseconds[synthetic_future_value_message_at] == synthetic_future_value_message_written.nanoseconds[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> assert(synthetic_future_value_message_read.synthetic_future_symbol[synthetic_future_value_message_at] == synthetic_future_value_message_written.synthetic_future_symbol[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> assert(synthetic_future_value_message_read.value[synthetic_future_value_message_at] == synthetic_future_value_message_written.value[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> assert(synthetic_future_value_message_read.reserved_8[synthetic_future_value_message_at] == synthetic_future_value_message_written.reserved_8[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Mach Packet Header: encoded, read back, and compared */
proctype check_mach_packet_header() {
  MachPacketHeader mach_packet_header_sent;
  MachPacketHeader mach_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mach_packet_header(mach_packet_header_sent, 0)
  :: pattern == 1 -> fill_mach_packet_header(mach_packet_header_sent, 32)
  :: pattern == 2 -> fill_mach_packet_header(mach_packet_header_sent, 255)
  :: else -> ramp_mach_packet_header(mach_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mach_packet_header(mach_packet_header_sent);
    assert(at == 12);
    at = 0;
    decode_mach_packet_header(mach_packet_header_got);
    assert(at == 12);
    equal_mach_packet_header(mach_packet_header_got, mach_packet_header_sent)
  }
}

/* System Time Message: encoded, read back, and compared */
proctype check_system_time_message() {
  SystemTimeMessage system_time_message_sent;
  SystemTimeMessage system_time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_time_message(system_time_message_sent, 0)
  :: pattern == 1 -> fill_system_time_message(system_time_message_sent, 32)
  :: pattern == 2 -> fill_system_time_message(system_time_message_sent, 255)
  :: else -> ramp_system_time_message(system_time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_time_message(system_time_message_sent);
    assert(at == 4);
    at = 0;
    decode_system_time_message(system_time_message_got);
    assert(at == 4);
    equal_system_time_message(system_time_message_got, system_time_message_sent)
  }
}

/* Symbol Definition Message: encoded, read back, and compared */
proctype check_symbol_definition_message() {
  SymbolDefinitionMessage symbol_definition_message_sent;
  SymbolDefinitionMessage symbol_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_definition_message(symbol_definition_message_sent, 0)
  :: pattern == 1 -> fill_symbol_definition_message(symbol_definition_message_sent, 32)
  :: pattern == 2 -> fill_symbol_definition_message(symbol_definition_message_sent, 255)
  :: else -> ramp_symbol_definition_message(symbol_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_definition_message(symbol_definition_message_sent);
    assert(at == 37);
    at = 0;
    decode_symbol_definition_message(symbol_definition_message_got);
    assert(at == 37);
    equal_symbol_definition_message(symbol_definition_message_got, symbol_definition_message_sent)
  }
}

/* Index Value Message: encoded, read back, and compared */
proctype check_index_value_message() {
  IndexValueMessage index_value_message_sent;
  IndexValueMessage index_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_value_message(index_value_message_sent, 0)
  :: pattern == 1 -> fill_index_value_message(index_value_message_sent, 32)
  :: pattern == 2 -> fill_index_value_message(index_value_message_sent, 255)
  :: else -> ramp_index_value_message(index_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_value_message(index_value_message_sent);
    assert(at == 13);
    at = 0;
    decode_index_value_message(index_value_message_got);
    assert(at == 13);
    equal_index_value_message(index_value_message_got, index_value_message_sent)
  }
}

/* Synthetic Future Value Message: encoded, read back, and compared */
proctype check_synthetic_future_value_message() {
  SyntheticFutureValueMessage synthetic_future_value_message_sent;
  SyntheticFutureValueMessage synthetic_future_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_synthetic_future_value_message(synthetic_future_value_message_sent, 0)
  :: pattern == 1 -> fill_synthetic_future_value_message(synthetic_future_value_message_sent, 32)
  :: pattern == 2 -> fill_synthetic_future_value_message(synthetic_future_value_message_sent, 255)
  :: else -> ramp_synthetic_future_value_message(synthetic_future_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_synthetic_future_value_message(synthetic_future_value_message_sent);
    assert(at == 24);
    at = 0;
    decode_synthetic_future_value_message(synthetic_future_value_message_got);
    assert(at == 24);
    equal_synthetic_future_value_message(synthetic_future_value_message_got, synthetic_future_value_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_system_time_message()
  :: run check_symbol_definition_message()
  :: run check_index_value_message()
  :: run check_synthetic_future_value_message()
  fi
}
