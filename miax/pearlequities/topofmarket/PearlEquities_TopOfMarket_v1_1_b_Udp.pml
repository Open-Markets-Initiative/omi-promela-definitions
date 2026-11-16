/*
 * Miami International Holdings Top Of Market
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 41

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Mach Packet Header: 12 bytes -------------------------------------------- */

/* Mach packet header (12 bytes) */
typedef MachPacketHeader {
  byte sequence_number[8];
  byte mach_packet_length[2];
  byte mach_packet_type;
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
  :: mach_packet_header_at < 2 -> mach_packet_header_record.mach_packet_length[mach_packet_header_at] = mach_packet_header_value; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_record.mach_packet_type = mach_packet_header_value;
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
  :: mach_packet_header_at < 2 -> mach_packet_header_record.mach_packet_length[mach_packet_header_at] = (mach_packet_header_base + 8 + mach_packet_header_at + 1) % 256; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_record.mach_packet_type = (mach_packet_header_base + 10 + 1) % 256;
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
  :: mach_packet_header_at < 2 -> wire[at] = mach_packet_header_record.mach_packet_length[mach_packet_header_at]; at = at + 1; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = mach_packet_header_record.mach_packet_type; at = at + 1;
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
  :: mach_packet_header_at < 2 -> mach_packet_header_record.mach_packet_length[mach_packet_header_at] = wire[at]; at = at + 1; mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  mach_packet_header_record.mach_packet_type = wire[at]; at = at + 1;
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
  :: mach_packet_header_at < 2 -> assert(mach_packet_header_read.mach_packet_length[mach_packet_header_at] == mach_packet_header_written.mach_packet_length[mach_packet_header_at]); mach_packet_header_at = mach_packet_header_at + 1
  :: else -> break
  od;
  assert(mach_packet_header_read.mach_packet_type == mach_packet_header_written.mach_packet_type);
  assert(mach_packet_header_read.session_number == mach_packet_header_written.session_number);
  skip
}

/* ---- System Time Message: 4 bytes -------------------------------------------- */

/* This is the message format that will be used to disseminate the "seconds" part of the timestamp that is applicable to all messages that are sent in the current second. */
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

/* ---- Symbol Update Message: 41 bytes ----------------------------------------- */

/* This is the message format that will be used to disseminate all security symbols traded on MIAX Pearl Equities for the current trading session. The Symbol ID sent in this message will be disseminated in Top of Market and Last Sale messages. */
typedef SymbolUpdateMessage {
  byte nanoseconds[4];
  byte symbol_id[4];
  byte ticker_symbol[11];
  byte reserved_1;
  byte test_security_indicator;
  byte second_reserved_1;
  byte lot_size[2];
  byte opening_time[8];
  byte closing_time[8];
  byte primary_market_code
};

int symbol_update_message_at;

/* every byte of Symbol Update Message set to one value */
inline fill_symbol_update_message(symbol_update_message_record, symbol_update_message_value) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.nanoseconds[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.symbol_id[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> symbol_update_message_record.ticker_symbol[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.reserved_1 = symbol_update_message_value;
  symbol_update_message_record.test_security_indicator = symbol_update_message_value;
  symbol_update_message_record.second_reserved_1 = symbol_update_message_value;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 2 -> symbol_update_message_record.lot_size[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.opening_time[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.closing_time[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.primary_market_code = symbol_update_message_value;
  skip
}

/* each byte of Symbol Update Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_update_message(symbol_update_message_record, symbol_update_message_base) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.nanoseconds[symbol_update_message_at] = (symbol_update_message_base + 0 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.symbol_id[symbol_update_message_at] = (symbol_update_message_base + 4 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> symbol_update_message_record.ticker_symbol[symbol_update_message_at] = (symbol_update_message_base + 8 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.reserved_1 = (symbol_update_message_base + 19 + 1) % 256;
  symbol_update_message_record.test_security_indicator = (symbol_update_message_base + 20 + 1) % 256;
  symbol_update_message_record.second_reserved_1 = (symbol_update_message_base + 21 + 1) % 256;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 2 -> symbol_update_message_record.lot_size[symbol_update_message_at] = (symbol_update_message_base + 22 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.opening_time[symbol_update_message_at] = (symbol_update_message_base + 24 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.closing_time[symbol_update_message_at] = (symbol_update_message_base + 32 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.primary_market_code = (symbol_update_message_base + 40 + 1) % 256;
  skip
}

/* Symbol Update Message to the wire, 41 bytes from where the cursor stands */
inline encode_symbol_update_message(symbol_update_message_record) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> wire[at] = symbol_update_message_record.nanoseconds[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> wire[at] = symbol_update_message_record.symbol_id[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> wire[at] = symbol_update_message_record.ticker_symbol[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_update_message_record.reserved_1; at = at + 1;
  wire[at] = symbol_update_message_record.test_security_indicator; at = at + 1;
  wire[at] = symbol_update_message_record.second_reserved_1; at = at + 1;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 2 -> wire[at] = symbol_update_message_record.lot_size[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> wire[at] = symbol_update_message_record.opening_time[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> wire[at] = symbol_update_message_record.closing_time[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_update_message_record.primary_market_code; at = at + 1;
  skip
}

/* Symbol Update Message off the wire, 41 bytes from where the cursor stands */
inline decode_symbol_update_message(symbol_update_message_record) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.nanoseconds[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.symbol_id[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> symbol_update_message_record.ticker_symbol[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.reserved_1 = wire[at]; at = at + 1;
  symbol_update_message_record.test_security_indicator = wire[at]; at = at + 1;
  symbol_update_message_record.second_reserved_1 = wire[at]; at = at + 1;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 2 -> symbol_update_message_record.lot_size[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.opening_time[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.closing_time[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.primary_market_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Symbol Update Message is what was written, byte for byte */
inline equal_symbol_update_message(symbol_update_message_read, symbol_update_message_written) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> assert(symbol_update_message_read.nanoseconds[symbol_update_message_at] == symbol_update_message_written.nanoseconds[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> assert(symbol_update_message_read.symbol_id[symbol_update_message_at] == symbol_update_message_written.symbol_id[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> assert(symbol_update_message_read.ticker_symbol[symbol_update_message_at] == symbol_update_message_written.ticker_symbol[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  assert(symbol_update_message_read.reserved_1 == symbol_update_message_written.reserved_1);
  assert(symbol_update_message_read.test_security_indicator == symbol_update_message_written.test_security_indicator);
  assert(symbol_update_message_read.second_reserved_1 == symbol_update_message_written.second_reserved_1);
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 2 -> assert(symbol_update_message_read.lot_size[symbol_update_message_at] == symbol_update_message_written.lot_size[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> assert(symbol_update_message_read.opening_time[symbol_update_message_at] == symbol_update_message_written.opening_time[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> assert(symbol_update_message_read.closing_time[symbol_update_message_at] == symbol_update_message_written.closing_time[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  assert(symbol_update_message_read.primary_market_code == symbol_update_message_written.primary_market_code);
  skip
}

/* ---- System State Message: 14 bytes ------------------------------------------ */

/* This is the message format that will be used to notify firms of the state changes of the system. This is a notification that applies to all symbols on the feed. */
typedef SystemStateMessage {
  byte nanoseconds[4];
  byte to_m_version[8];
  byte session_id;
  byte system_status
};

int system_state_message_at;

/* every byte of System State Message set to one value */
inline fill_system_state_message(system_state_message_record, system_state_message_value) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> system_state_message_record.nanoseconds[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_record.session_id = system_state_message_value;
  system_state_message_record.system_status = system_state_message_value;
  skip
}

/* each byte of System State Message set to where it lies, so a field read out of place says so */
inline ramp_system_state_message(system_state_message_record, system_state_message_base) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> system_state_message_record.nanoseconds[system_state_message_at] = (system_state_message_base + 0 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = (system_state_message_base + 4 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_record.session_id = (system_state_message_base + 12 + 1) % 256;
  system_state_message_record.system_status = (system_state_message_base + 13 + 1) % 256;
  skip
}

/* System State Message to the wire, 14 bytes from where the cursor stands */
inline encode_system_state_message(system_state_message_record) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> wire[at] = system_state_message_record.nanoseconds[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.to_m_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  wire[at] = system_state_message_record.session_id; at = at + 1;
  wire[at] = system_state_message_record.system_status; at = at + 1;
  skip
}

/* System State Message off the wire, 14 bytes from where the cursor stands */
inline decode_system_state_message(system_state_message_record) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> system_state_message_record.nanoseconds[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_record.session_id = wire[at]; at = at + 1;
  system_state_message_record.system_status = wire[at]; at = at + 1;
  skip
}

/* what was read of System State Message is what was written, byte for byte */
inline equal_system_state_message(system_state_message_read, system_state_message_written) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> assert(system_state_message_read.nanoseconds[system_state_message_at] == system_state_message_written.nanoseconds[system_state_message_at]); system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> assert(system_state_message_read.to_m_version[system_state_message_at] == system_state_message_written.to_m_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  assert(system_state_message_read.session_id == system_state_message_written.session_id);
  assert(system_state_message_read.system_status == system_state_message_written.system_status);
  skip
}

/* ---- Security Trading Status Notification Message: 11 bytes ------------------ */

/* This is the message format that will be used to notify firms of changes to the trading status of a particular security. */
typedef SecurityTradingStatusNotificationMessage {
  byte nanoseconds[4];
  byte symbol_id[4];
  byte trading_status;
  byte market_state;
  byte short_sale_restriction
};

int security_trading_status_notification_message_at;

/* every byte of Security Trading Status Notification Message set to one value */
inline fill_security_trading_status_notification_message(security_trading_status_notification_message_record, security_trading_status_notification_message_value) {
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> security_trading_status_notification_message_record.nanoseconds[security_trading_status_notification_message_at] = security_trading_status_notification_message_value; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> security_trading_status_notification_message_record.symbol_id[security_trading_status_notification_message_at] = security_trading_status_notification_message_value; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_record.trading_status = security_trading_status_notification_message_value;
  security_trading_status_notification_message_record.market_state = security_trading_status_notification_message_value;
  security_trading_status_notification_message_record.short_sale_restriction = security_trading_status_notification_message_value;
  skip
}

/* each byte of Security Trading Status Notification Message set to where it lies, so a field read out of place says so */
inline ramp_security_trading_status_notification_message(security_trading_status_notification_message_record, security_trading_status_notification_message_base) {
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> security_trading_status_notification_message_record.nanoseconds[security_trading_status_notification_message_at] = (security_trading_status_notification_message_base + 0 + security_trading_status_notification_message_at + 1) % 256; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> security_trading_status_notification_message_record.symbol_id[security_trading_status_notification_message_at] = (security_trading_status_notification_message_base + 4 + security_trading_status_notification_message_at + 1) % 256; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_record.trading_status = (security_trading_status_notification_message_base + 8 + 1) % 256;
  security_trading_status_notification_message_record.market_state = (security_trading_status_notification_message_base + 9 + 1) % 256;
  security_trading_status_notification_message_record.short_sale_restriction = (security_trading_status_notification_message_base + 10 + 1) % 256;
  skip
}

/* Security Trading Status Notification Message to the wire, 11 bytes from where the cursor stands */
inline encode_security_trading_status_notification_message(security_trading_status_notification_message_record) {
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> wire[at] = security_trading_status_notification_message_record.nanoseconds[security_trading_status_notification_message_at]; at = at + 1; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> wire[at] = security_trading_status_notification_message_record.symbol_id[security_trading_status_notification_message_at]; at = at + 1; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = security_trading_status_notification_message_record.trading_status; at = at + 1;
  wire[at] = security_trading_status_notification_message_record.market_state; at = at + 1;
  wire[at] = security_trading_status_notification_message_record.short_sale_restriction; at = at + 1;
  skip
}

/* Security Trading Status Notification Message off the wire, 11 bytes from where the cursor stands */
inline decode_security_trading_status_notification_message(security_trading_status_notification_message_record) {
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> security_trading_status_notification_message_record.nanoseconds[security_trading_status_notification_message_at] = wire[at]; at = at + 1; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> security_trading_status_notification_message_record.symbol_id[security_trading_status_notification_message_at] = wire[at]; at = at + 1; security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_record.trading_status = wire[at]; at = at + 1;
  security_trading_status_notification_message_record.market_state = wire[at]; at = at + 1;
  security_trading_status_notification_message_record.short_sale_restriction = wire[at]; at = at + 1;
  skip
}

/* what was read of Security Trading Status Notification Message is what was written, byte for byte */
inline equal_security_trading_status_notification_message(security_trading_status_notification_message_read, security_trading_status_notification_message_written) {
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> assert(security_trading_status_notification_message_read.nanoseconds[security_trading_status_notification_message_at] == security_trading_status_notification_message_written.nanoseconds[security_trading_status_notification_message_at]); security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  security_trading_status_notification_message_at = 0;
  do
  :: security_trading_status_notification_message_at < 4 -> assert(security_trading_status_notification_message_read.symbol_id[security_trading_status_notification_message_at] == security_trading_status_notification_message_written.symbol_id[security_trading_status_notification_message_at]); security_trading_status_notification_message_at = security_trading_status_notification_message_at + 1
  :: else -> break
  od;
  assert(security_trading_status_notification_message_read.trading_status == security_trading_status_notification_message_written.trading_status);
  assert(security_trading_status_notification_message_read.market_state == security_trading_status_notification_message_written.market_state);
  assert(security_trading_status_notification_message_read.short_sale_restriction == security_trading_status_notification_message_written.short_sale_restriction);
  skip
}

/* ---- Compact Top Of Market Best Bid And Offer Message: 16 bytes -------------- */

/* This is the message format that will be used to publish MIAX Pearl Best Bid and Offer (MPBBO) of a security with MPBBO values that can fit in this compact format. In the compact format both bid and offer prices have 2 decimal places and are limited to a maximum value of $655.35. Bid and Offer sizes are limited to 65,535 shares. */
typedef CompactTopOfMarketBestBidAndOfferMessage {
  byte nanoseconds[4];
  byte symbol_id[4];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte offer_price_short[2];
  byte offer_size_short[2]
};

int compact_top_of_market_best_bid_and_offer_message_at;

/* every byte of Compact Top Of Market Best Bid And Offer Message set to one value */
inline fill_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_record, compact_top_of_market_best_bid_and_offer_message_value) {
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> compact_top_of_market_best_bid_and_offer_message_record.nanoseconds[compact_top_of_market_best_bid_and_offer_message_at] = compact_top_of_market_best_bid_and_offer_message_value; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> compact_top_of_market_best_bid_and_offer_message_record.symbol_id[compact_top_of_market_best_bid_and_offer_message_at] = compact_top_of_market_best_bid_and_offer_message_value; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.bid_price_short[compact_top_of_market_best_bid_and_offer_message_at] = compact_top_of_market_best_bid_and_offer_message_value; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.bid_size_short[compact_top_of_market_best_bid_and_offer_message_at] = compact_top_of_market_best_bid_and_offer_message_value; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.offer_price_short[compact_top_of_market_best_bid_and_offer_message_at] = compact_top_of_market_best_bid_and_offer_message_value; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.offer_size_short[compact_top_of_market_best_bid_and_offer_message_at] = compact_top_of_market_best_bid_and_offer_message_value; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Compact Top Of Market Best Bid And Offer Message set to where it lies, so a field read out of place says so */
inline ramp_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_record, compact_top_of_market_best_bid_and_offer_message_base) {
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> compact_top_of_market_best_bid_and_offer_message_record.nanoseconds[compact_top_of_market_best_bid_and_offer_message_at] = (compact_top_of_market_best_bid_and_offer_message_base + 0 + compact_top_of_market_best_bid_and_offer_message_at + 1) % 256; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> compact_top_of_market_best_bid_and_offer_message_record.symbol_id[compact_top_of_market_best_bid_and_offer_message_at] = (compact_top_of_market_best_bid_and_offer_message_base + 4 + compact_top_of_market_best_bid_and_offer_message_at + 1) % 256; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.bid_price_short[compact_top_of_market_best_bid_and_offer_message_at] = (compact_top_of_market_best_bid_and_offer_message_base + 8 + compact_top_of_market_best_bid_and_offer_message_at + 1) % 256; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.bid_size_short[compact_top_of_market_best_bid_and_offer_message_at] = (compact_top_of_market_best_bid_and_offer_message_base + 10 + compact_top_of_market_best_bid_and_offer_message_at + 1) % 256; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.offer_price_short[compact_top_of_market_best_bid_and_offer_message_at] = (compact_top_of_market_best_bid_and_offer_message_base + 12 + compact_top_of_market_best_bid_and_offer_message_at + 1) % 256; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.offer_size_short[compact_top_of_market_best_bid_and_offer_message_at] = (compact_top_of_market_best_bid_and_offer_message_base + 14 + compact_top_of_market_best_bid_and_offer_message_at + 1) % 256; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Compact Top Of Market Best Bid And Offer Message to the wire, 16 bytes from where the cursor stands */
inline encode_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_record) {
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> wire[at] = compact_top_of_market_best_bid_and_offer_message_record.nanoseconds[compact_top_of_market_best_bid_and_offer_message_at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> wire[at] = compact_top_of_market_best_bid_and_offer_message_record.symbol_id[compact_top_of_market_best_bid_and_offer_message_at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> wire[at] = compact_top_of_market_best_bid_and_offer_message_record.bid_price_short[compact_top_of_market_best_bid_and_offer_message_at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> wire[at] = compact_top_of_market_best_bid_and_offer_message_record.bid_size_short[compact_top_of_market_best_bid_and_offer_message_at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> wire[at] = compact_top_of_market_best_bid_and_offer_message_record.offer_price_short[compact_top_of_market_best_bid_and_offer_message_at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> wire[at] = compact_top_of_market_best_bid_and_offer_message_record.offer_size_short[compact_top_of_market_best_bid_and_offer_message_at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Compact Top Of Market Best Bid And Offer Message off the wire, 16 bytes from where the cursor stands */
inline decode_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_record) {
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> compact_top_of_market_best_bid_and_offer_message_record.nanoseconds[compact_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> compact_top_of_market_best_bid_and_offer_message_record.symbol_id[compact_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.bid_price_short[compact_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.bid_size_short[compact_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.offer_price_short[compact_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> compact_top_of_market_best_bid_and_offer_message_record.offer_size_short[compact_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Compact Top Of Market Best Bid And Offer Message is what was written, byte for byte */
inline equal_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_read, compact_top_of_market_best_bid_and_offer_message_written) {
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> assert(compact_top_of_market_best_bid_and_offer_message_read.nanoseconds[compact_top_of_market_best_bid_and_offer_message_at] == compact_top_of_market_best_bid_and_offer_message_written.nanoseconds[compact_top_of_market_best_bid_and_offer_message_at]); compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 4 -> assert(compact_top_of_market_best_bid_and_offer_message_read.symbol_id[compact_top_of_market_best_bid_and_offer_message_at] == compact_top_of_market_best_bid_and_offer_message_written.symbol_id[compact_top_of_market_best_bid_and_offer_message_at]); compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> assert(compact_top_of_market_best_bid_and_offer_message_read.bid_price_short[compact_top_of_market_best_bid_and_offer_message_at] == compact_top_of_market_best_bid_and_offer_message_written.bid_price_short[compact_top_of_market_best_bid_and_offer_message_at]); compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> assert(compact_top_of_market_best_bid_and_offer_message_read.bid_size_short[compact_top_of_market_best_bid_and_offer_message_at] == compact_top_of_market_best_bid_and_offer_message_written.bid_size_short[compact_top_of_market_best_bid_and_offer_message_at]); compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> assert(compact_top_of_market_best_bid_and_offer_message_read.offer_price_short[compact_top_of_market_best_bid_and_offer_message_at] == compact_top_of_market_best_bid_and_offer_message_written.offer_price_short[compact_top_of_market_best_bid_and_offer_message_at]); compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: compact_top_of_market_best_bid_and_offer_message_at < 2 -> assert(compact_top_of_market_best_bid_and_offer_message_read.offer_size_short[compact_top_of_market_best_bid_and_offer_message_at] == compact_top_of_market_best_bid_and_offer_message_written.offer_size_short[compact_top_of_market_best_bid_and_offer_message_at]); compact_top_of_market_best_bid_and_offer_message_at = compact_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Wide Top Of Market Best Bid And Offer Message: 32 bytes ----------------- */

/* This is the message format that will be used to publish MIAX Pearl Best Bid and Offer (MPBBO) of a security with MPBBO values that will not fit in the compact format. */
typedef WideTopOfMarketBestBidAndOfferMessage {
  byte nanoseconds[4];
  byte symbol_id[4];
  byte bid_price_long[8];
  byte bid_size_long[4];
  byte offer_price_long[8];
  byte offer_size_long[4]
};

int wide_top_of_market_best_bid_and_offer_message_at;

/* every byte of Wide Top Of Market Best Bid And Offer Message set to one value */
inline fill_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_record, wide_top_of_market_best_bid_and_offer_message_value) {
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.nanoseconds[wide_top_of_market_best_bid_and_offer_message_at] = wide_top_of_market_best_bid_and_offer_message_value; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.symbol_id[wide_top_of_market_best_bid_and_offer_message_at] = wide_top_of_market_best_bid_and_offer_message_value; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wide_top_of_market_best_bid_and_offer_message_record.bid_price_long[wide_top_of_market_best_bid_and_offer_message_at] = wide_top_of_market_best_bid_and_offer_message_value; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.bid_size_long[wide_top_of_market_best_bid_and_offer_message_at] = wide_top_of_market_best_bid_and_offer_message_value; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wide_top_of_market_best_bid_and_offer_message_record.offer_price_long[wide_top_of_market_best_bid_and_offer_message_at] = wide_top_of_market_best_bid_and_offer_message_value; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.offer_size_long[wide_top_of_market_best_bid_and_offer_message_at] = wide_top_of_market_best_bid_and_offer_message_value; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Wide Top Of Market Best Bid And Offer Message set to where it lies, so a field read out of place says so */
inline ramp_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_record, wide_top_of_market_best_bid_and_offer_message_base) {
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.nanoseconds[wide_top_of_market_best_bid_and_offer_message_at] = (wide_top_of_market_best_bid_and_offer_message_base + 0 + wide_top_of_market_best_bid_and_offer_message_at + 1) % 256; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.symbol_id[wide_top_of_market_best_bid_and_offer_message_at] = (wide_top_of_market_best_bid_and_offer_message_base + 4 + wide_top_of_market_best_bid_and_offer_message_at + 1) % 256; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wide_top_of_market_best_bid_and_offer_message_record.bid_price_long[wide_top_of_market_best_bid_and_offer_message_at] = (wide_top_of_market_best_bid_and_offer_message_base + 8 + wide_top_of_market_best_bid_and_offer_message_at + 1) % 256; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.bid_size_long[wide_top_of_market_best_bid_and_offer_message_at] = (wide_top_of_market_best_bid_and_offer_message_base + 16 + wide_top_of_market_best_bid_and_offer_message_at + 1) % 256; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wide_top_of_market_best_bid_and_offer_message_record.offer_price_long[wide_top_of_market_best_bid_and_offer_message_at] = (wide_top_of_market_best_bid_and_offer_message_base + 20 + wide_top_of_market_best_bid_and_offer_message_at + 1) % 256; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.offer_size_long[wide_top_of_market_best_bid_and_offer_message_at] = (wide_top_of_market_best_bid_and_offer_message_base + 28 + wide_top_of_market_best_bid_and_offer_message_at + 1) % 256; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Wide Top Of Market Best Bid And Offer Message to the wire, 32 bytes from where the cursor stands */
inline encode_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_record) {
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_and_offer_message_record.nanoseconds[wide_top_of_market_best_bid_and_offer_message_at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_and_offer_message_record.symbol_id[wide_top_of_market_best_bid_and_offer_message_at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wire[at] = wide_top_of_market_best_bid_and_offer_message_record.bid_price_long[wide_top_of_market_best_bid_and_offer_message_at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_and_offer_message_record.bid_size_long[wide_top_of_market_best_bid_and_offer_message_at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wire[at] = wide_top_of_market_best_bid_and_offer_message_record.offer_price_long[wide_top_of_market_best_bid_and_offer_message_at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_and_offer_message_record.offer_size_long[wide_top_of_market_best_bid_and_offer_message_at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Wide Top Of Market Best Bid And Offer Message off the wire, 32 bytes from where the cursor stands */
inline decode_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_record) {
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.nanoseconds[wide_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.symbol_id[wide_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wide_top_of_market_best_bid_and_offer_message_record.bid_price_long[wide_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.bid_size_long[wide_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> wide_top_of_market_best_bid_and_offer_message_record.offer_price_long[wide_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> wide_top_of_market_best_bid_and_offer_message_record.offer_size_long[wide_top_of_market_best_bid_and_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Wide Top Of Market Best Bid And Offer Message is what was written, byte for byte */
inline equal_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_read, wide_top_of_market_best_bid_and_offer_message_written) {
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> assert(wide_top_of_market_best_bid_and_offer_message_read.nanoseconds[wide_top_of_market_best_bid_and_offer_message_at] == wide_top_of_market_best_bid_and_offer_message_written.nanoseconds[wide_top_of_market_best_bid_and_offer_message_at]); wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> assert(wide_top_of_market_best_bid_and_offer_message_read.symbol_id[wide_top_of_market_best_bid_and_offer_message_at] == wide_top_of_market_best_bid_and_offer_message_written.symbol_id[wide_top_of_market_best_bid_and_offer_message_at]); wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> assert(wide_top_of_market_best_bid_and_offer_message_read.bid_price_long[wide_top_of_market_best_bid_and_offer_message_at] == wide_top_of_market_best_bid_and_offer_message_written.bid_price_long[wide_top_of_market_best_bid_and_offer_message_at]); wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> assert(wide_top_of_market_best_bid_and_offer_message_read.bid_size_long[wide_top_of_market_best_bid_and_offer_message_at] == wide_top_of_market_best_bid_and_offer_message_written.bid_size_long[wide_top_of_market_best_bid_and_offer_message_at]); wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 8 -> assert(wide_top_of_market_best_bid_and_offer_message_read.offer_price_long[wide_top_of_market_best_bid_and_offer_message_at] == wide_top_of_market_best_bid_and_offer_message_written.offer_price_long[wide_top_of_market_best_bid_and_offer_message_at]); wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_and_offer_message_at = 0;
  do
  :: wide_top_of_market_best_bid_and_offer_message_at < 4 -> assert(wide_top_of_market_best_bid_and_offer_message_read.offer_size_long[wide_top_of_market_best_bid_and_offer_message_at] == wide_top_of_market_best_bid_and_offer_message_written.offer_size_long[wide_top_of_market_best_bid_and_offer_message_at]); wide_top_of_market_best_bid_and_offer_message_at = wide_top_of_market_best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Message: 29 bytes ------------------------------------------ */

/* This is the message format that will be used to disseminate cancelled trades that are resulting from Trade Cancellations on MIAX Pearl Equities during the current trading session. */
typedef TradeCancelMessage {
  byte nanoseconds[4];
  byte symbol_id[4];
  byte trade_id[8];
  byte correction_number;
  byte price[8];
  byte size[4]
};

int trade_cancel_message_at;

/* every byte of Trade Cancel Message set to one value */
inline fill_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_value) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.nanoseconds[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = trade_cancel_message_value;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.price[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.size[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_base) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.nanoseconds[trade_cancel_message_at] = (trade_cancel_message_base + 0 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_id[trade_cancel_message_at] = (trade_cancel_message_base + 4 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = (trade_cancel_message_base + 8 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = (trade_cancel_message_base + 16 + 1) % 256;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.price[trade_cancel_message_at] = (trade_cancel_message_base + 17 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.size[trade_cancel_message_at] = (trade_cancel_message_base + 25 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Message to the wire, 29 bytes from where the cursor stands */
inline encode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.nanoseconds[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.symbol_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.trade_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_message_record.correction_number; at = at + 1;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.price[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.size[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Message off the wire, 29 bytes from where the cursor stands */
inline decode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.nanoseconds[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.symbol_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = wire[at]; at = at + 1;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.price[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.size[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Message is what was written, byte for byte */
inline equal_trade_cancel_message(trade_cancel_message_read, trade_cancel_message_written) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.nanoseconds[trade_cancel_message_at] == trade_cancel_message_written.nanoseconds[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.symbol_id[trade_cancel_message_at] == trade_cancel_message_written.symbol_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.trade_id[trade_cancel_message_at] == trade_cancel_message_written.trade_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_message_read.correction_number == trade_cancel_message_written.correction_number);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.price[trade_cancel_message_at] == trade_cancel_message_written.price[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.size[trade_cancel_message_at] == trade_cancel_message_written.size[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
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

/* Symbol Update Message: encoded, read back, and compared */
proctype check_symbol_update_message() {
  SymbolUpdateMessage symbol_update_message_sent;
  SymbolUpdateMessage symbol_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_update_message(symbol_update_message_sent, 0)
  :: pattern == 1 -> fill_symbol_update_message(symbol_update_message_sent, 32)
  :: pattern == 2 -> fill_symbol_update_message(symbol_update_message_sent, 255)
  :: else -> ramp_symbol_update_message(symbol_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_update_message(symbol_update_message_sent);
    assert(at == 41);
    at = 0;
    decode_symbol_update_message(symbol_update_message_got);
    assert(at == 41);
    equal_symbol_update_message(symbol_update_message_got, symbol_update_message_sent)
  }
}

/* System State Message: encoded, read back, and compared */
proctype check_system_state_message() {
  SystemStateMessage system_state_message_sent;
  SystemStateMessage system_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_state_message(system_state_message_sent, 0)
  :: pattern == 1 -> fill_system_state_message(system_state_message_sent, 32)
  :: pattern == 2 -> fill_system_state_message(system_state_message_sent, 255)
  :: else -> ramp_system_state_message(system_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_state_message(system_state_message_sent);
    assert(at == 14);
    at = 0;
    decode_system_state_message(system_state_message_got);
    assert(at == 14);
    equal_system_state_message(system_state_message_got, system_state_message_sent)
  }
}

/* Security Trading Status Notification Message: encoded, read back, and compared */
proctype check_security_trading_status_notification_message() {
  SecurityTradingStatusNotificationMessage security_trading_status_notification_message_sent;
  SecurityTradingStatusNotificationMessage security_trading_status_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_trading_status_notification_message(security_trading_status_notification_message_sent, 0)
  :: pattern == 1 -> fill_security_trading_status_notification_message(security_trading_status_notification_message_sent, 32)
  :: pattern == 2 -> fill_security_trading_status_notification_message(security_trading_status_notification_message_sent, 255)
  :: else -> ramp_security_trading_status_notification_message(security_trading_status_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_trading_status_notification_message(security_trading_status_notification_message_sent);
    assert(at == 11);
    at = 0;
    decode_security_trading_status_notification_message(security_trading_status_notification_message_got);
    assert(at == 11);
    equal_security_trading_status_notification_message(security_trading_status_notification_message_got, security_trading_status_notification_message_sent)
  }
}

/* Compact Top Of Market Best Bid And Offer Message: encoded, read back, and compared */
proctype check_compact_top_of_market_best_bid_and_offer_message() {
  CompactTopOfMarketBestBidAndOfferMessage compact_top_of_market_best_bid_and_offer_message_sent;
  CompactTopOfMarketBestBidAndOfferMessage compact_top_of_market_best_bid_and_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_sent, 0)
  :: pattern == 1 -> fill_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_sent, 32)
  :: pattern == 2 -> fill_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_sent, 255)
  :: else -> ramp_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_sent);
    assert(at == 16);
    at = 0;
    decode_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_got);
    assert(at == 16);
    equal_compact_top_of_market_best_bid_and_offer_message(compact_top_of_market_best_bid_and_offer_message_got, compact_top_of_market_best_bid_and_offer_message_sent)
  }
}

/* Wide Top Of Market Best Bid And Offer Message: encoded, read back, and compared */
proctype check_wide_top_of_market_best_bid_and_offer_message() {
  WideTopOfMarketBestBidAndOfferMessage wide_top_of_market_best_bid_and_offer_message_sent;
  WideTopOfMarketBestBidAndOfferMessage wide_top_of_market_best_bid_and_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_sent, 0)
  :: pattern == 1 -> fill_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_sent, 32)
  :: pattern == 2 -> fill_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_sent, 255)
  :: else -> ramp_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_sent);
    assert(at == 32);
    at = 0;
    decode_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_got);
    assert(at == 32);
    equal_wide_top_of_market_best_bid_and_offer_message(wide_top_of_market_best_bid_and_offer_message_got, wide_top_of_market_best_bid_and_offer_message_sent)
  }
}

/* Trade Cancel Message: encoded, read back, and compared */
proctype check_trade_cancel_message() {
  TradeCancelMessage trade_cancel_message_sent;
  TradeCancelMessage trade_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_message(trade_cancel_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_message(trade_cancel_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_message(trade_cancel_message_sent, 255)
  :: else -> ramp_trade_cancel_message(trade_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_message(trade_cancel_message_sent);
    assert(at == 29);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 29);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_system_time_message()
  :: run check_symbol_update_message()
  :: run check_system_state_message()
  :: run check_security_trading_status_notification_message()
  :: run check_compact_top_of_market_best_bid_and_offer_message()
  :: run check_wide_top_of_market_best_bid_and_offer_message()
  :: run check_trade_cancel_message()
  fi
}
