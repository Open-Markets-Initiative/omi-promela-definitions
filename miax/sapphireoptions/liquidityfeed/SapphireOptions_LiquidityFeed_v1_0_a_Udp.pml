/*
 * Miami International Holdings Liquidity Feed
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 72

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

/* ---- Series Update Message: 72 bytes ----------------------------------------- */

/* This is the message format that will be used to disseminate all Option series traded on Sapphire for the current session. */
typedef SeriesUpdateMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte underlying_symbol[11];
  byte security_symbol[6];
  byte expiration_date[8];
  byte strike_price[4];
  byte call_or_put;
  byte opening_time[8];
  byte closing_time[8];
  byte restricted_option;
  byte long_term_option;
  byte active_on_sapphire;
  byte sapphire_bbo_posting_increment_indicator;
  byte liquidity_acceptance_increment_indicator;
  byte opening_underlying_market_code;
  byte reserved_12[12]
};

int series_update_message_at;

/* every byte of Series Update Message set to one value */
inline fill_series_update_message(series_update_message_record, series_update_message_value) {
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.nanoseconds[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.product_id[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 11 -> series_update_message_record.underlying_symbol[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 6 -> series_update_message_record.security_symbol[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.expiration_date[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.strike_price[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_record.call_or_put = series_update_message_value;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.opening_time[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.closing_time[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_record.restricted_option = series_update_message_value;
  series_update_message_record.long_term_option = series_update_message_value;
  series_update_message_record.active_on_sapphire = series_update_message_value;
  series_update_message_record.sapphire_bbo_posting_increment_indicator = series_update_message_value;
  series_update_message_record.liquidity_acceptance_increment_indicator = series_update_message_value;
  series_update_message_record.opening_underlying_market_code = series_update_message_value;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 12 -> series_update_message_record.reserved_12[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Series Update Message set to where it lies, so a field read out of place says so */
inline ramp_series_update_message(series_update_message_record, series_update_message_base) {
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.nanoseconds[series_update_message_at] = (series_update_message_base + 0 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.product_id[series_update_message_at] = (series_update_message_base + 4 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 11 -> series_update_message_record.underlying_symbol[series_update_message_at] = (series_update_message_base + 8 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 6 -> series_update_message_record.security_symbol[series_update_message_at] = (series_update_message_base + 19 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.expiration_date[series_update_message_at] = (series_update_message_base + 25 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.strike_price[series_update_message_at] = (series_update_message_base + 33 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_record.call_or_put = (series_update_message_base + 37 + 1) % 256;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.opening_time[series_update_message_at] = (series_update_message_base + 38 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.closing_time[series_update_message_at] = (series_update_message_base + 46 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_record.restricted_option = (series_update_message_base + 54 + 1) % 256;
  series_update_message_record.long_term_option = (series_update_message_base + 55 + 1) % 256;
  series_update_message_record.active_on_sapphire = (series_update_message_base + 56 + 1) % 256;
  series_update_message_record.sapphire_bbo_posting_increment_indicator = (series_update_message_base + 57 + 1) % 256;
  series_update_message_record.liquidity_acceptance_increment_indicator = (series_update_message_base + 58 + 1) % 256;
  series_update_message_record.opening_underlying_market_code = (series_update_message_base + 59 + 1) % 256;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 12 -> series_update_message_record.reserved_12[series_update_message_at] = (series_update_message_base + 60 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Update Message to the wire, 72 bytes from where the cursor stands */
inline encode_series_update_message(series_update_message_record) {
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> wire[at] = series_update_message_record.nanoseconds[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> wire[at] = series_update_message_record.product_id[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 11 -> wire[at] = series_update_message_record.underlying_symbol[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 6 -> wire[at] = series_update_message_record.security_symbol[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> wire[at] = series_update_message_record.expiration_date[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> wire[at] = series_update_message_record.strike_price[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  wire[at] = series_update_message_record.call_or_put; at = at + 1;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> wire[at] = series_update_message_record.opening_time[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> wire[at] = series_update_message_record.closing_time[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  wire[at] = series_update_message_record.restricted_option; at = at + 1;
  wire[at] = series_update_message_record.long_term_option; at = at + 1;
  wire[at] = series_update_message_record.active_on_sapphire; at = at + 1;
  wire[at] = series_update_message_record.sapphire_bbo_posting_increment_indicator; at = at + 1;
  wire[at] = series_update_message_record.liquidity_acceptance_increment_indicator; at = at + 1;
  wire[at] = series_update_message_record.opening_underlying_market_code; at = at + 1;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 12 -> wire[at] = series_update_message_record.reserved_12[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Series Update Message off the wire, 72 bytes from where the cursor stands */
inline decode_series_update_message(series_update_message_record) {
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.nanoseconds[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.product_id[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 11 -> series_update_message_record.underlying_symbol[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 6 -> series_update_message_record.security_symbol[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.expiration_date[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.strike_price[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_record.call_or_put = wire[at]; at = at + 1;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.opening_time[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.closing_time[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_record.restricted_option = wire[at]; at = at + 1;
  series_update_message_record.long_term_option = wire[at]; at = at + 1;
  series_update_message_record.active_on_sapphire = wire[at]; at = at + 1;
  series_update_message_record.sapphire_bbo_posting_increment_indicator = wire[at]; at = at + 1;
  series_update_message_record.liquidity_acceptance_increment_indicator = wire[at]; at = at + 1;
  series_update_message_record.opening_underlying_market_code = wire[at]; at = at + 1;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 12 -> series_update_message_record.reserved_12[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Series Update Message is what was written, byte for byte */
inline equal_series_update_message(series_update_message_read, series_update_message_written) {
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> assert(series_update_message_read.nanoseconds[series_update_message_at] == series_update_message_written.nanoseconds[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> assert(series_update_message_read.product_id[series_update_message_at] == series_update_message_written.product_id[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 11 -> assert(series_update_message_read.underlying_symbol[series_update_message_at] == series_update_message_written.underlying_symbol[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 6 -> assert(series_update_message_read.security_symbol[series_update_message_at] == series_update_message_written.security_symbol[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> assert(series_update_message_read.expiration_date[series_update_message_at] == series_update_message_written.expiration_date[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> assert(series_update_message_read.strike_price[series_update_message_at] == series_update_message_written.strike_price[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  assert(series_update_message_read.call_or_put == series_update_message_written.call_or_put);
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> assert(series_update_message_read.opening_time[series_update_message_at] == series_update_message_written.opening_time[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> assert(series_update_message_read.closing_time[series_update_message_at] == series_update_message_written.closing_time[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  assert(series_update_message_read.restricted_option == series_update_message_written.restricted_option);
  assert(series_update_message_read.long_term_option == series_update_message_written.long_term_option);
  assert(series_update_message_read.active_on_sapphire == series_update_message_written.active_on_sapphire);
  assert(series_update_message_read.sapphire_bbo_posting_increment_indicator == series_update_message_written.sapphire_bbo_posting_increment_indicator);
  assert(series_update_message_read.liquidity_acceptance_increment_indicator == series_update_message_written.liquidity_acceptance_increment_indicator);
  assert(series_update_message_read.opening_underlying_market_code == series_update_message_written.opening_underlying_market_code);
  series_update_message_at = 0;
  do
  :: series_update_message_at < 12 -> assert(series_update_message_read.reserved_12[series_update_message_at] == series_update_message_written.reserved_12[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Message: 17 bytes ------------------------------------------ */

/* This message format is used to notify the firms of the state changes of the system. This is a notification that applies to each Underlying group. Firms can use notifications as triggers in their system to ensure electronic synchronization of systems. */
typedef SystemStateMessage {
  byte nanoseconds[4];
  byte slf_version[8];
  byte session_id[4];
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
  :: system_state_message_at < 8 -> system_state_message_record.slf_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> system_state_message_record.session_id[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
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
  :: system_state_message_at < 8 -> system_state_message_record.slf_version[system_state_message_at] = (system_state_message_base + 4 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> system_state_message_record.session_id[system_state_message_at] = (system_state_message_base + 12 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_record.system_status = (system_state_message_base + 16 + 1) % 256;
  skip
}

/* System State Message to the wire, 17 bytes from where the cursor stands */
inline encode_system_state_message(system_state_message_record) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> wire[at] = system_state_message_record.nanoseconds[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.slf_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> wire[at] = system_state_message_record.session_id[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  wire[at] = system_state_message_record.system_status; at = at + 1;
  skip
}

/* System State Message off the wire, 17 bytes from where the cursor stands */
inline decode_system_state_message(system_state_message_record) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> system_state_message_record.nanoseconds[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.slf_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> system_state_message_record.session_id[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
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
  :: system_state_message_at < 8 -> assert(system_state_message_read.slf_version[system_state_message_at] == system_state_message_written.slf_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 4 -> assert(system_state_message_read.session_id[system_state_message_at] == system_state_message_written.session_id[system_state_message_at]); system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  assert(system_state_message_read.system_status == system_state_message_written.system_status);
  skip
}

/* ---- Underlying Trading Status Notification Message: 25 bytes ---------------- */

/* This message format will be used to notify firms of changes to the trading status of all the options of an underlying. */
typedef UnderlyingTradingStatusNotificationMessage {
  byte nanoseconds[4];
  byte underlying_symbol[11];
  byte trading_status;
  byte event_reason;
  byte expected_event_time_seconds_part[4];
  byte expected_event_time_nano_seconds_part[4]
};

int underlying_trading_status_notification_message_at;

/* every byte of Underlying Trading Status Notification Message set to one value */
inline fill_underlying_trading_status_notification_message(underlying_trading_status_notification_message_record, underlying_trading_status_notification_message_value) {
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.nanoseconds[underlying_trading_status_notification_message_at] = underlying_trading_status_notification_message_value; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 11 -> underlying_trading_status_notification_message_record.underlying_symbol[underlying_trading_status_notification_message_at] = underlying_trading_status_notification_message_value; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_record.trading_status = underlying_trading_status_notification_message_value;
  underlying_trading_status_notification_message_record.event_reason = underlying_trading_status_notification_message_value;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.expected_event_time_seconds_part[underlying_trading_status_notification_message_at] = underlying_trading_status_notification_message_value; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_message_at] = underlying_trading_status_notification_message_value; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Trading Status Notification Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_trading_status_notification_message(underlying_trading_status_notification_message_record, underlying_trading_status_notification_message_base) {
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.nanoseconds[underlying_trading_status_notification_message_at] = (underlying_trading_status_notification_message_base + 0 + underlying_trading_status_notification_message_at + 1) % 256; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 11 -> underlying_trading_status_notification_message_record.underlying_symbol[underlying_trading_status_notification_message_at] = (underlying_trading_status_notification_message_base + 4 + underlying_trading_status_notification_message_at + 1) % 256; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_record.trading_status = (underlying_trading_status_notification_message_base + 15 + 1) % 256;
  underlying_trading_status_notification_message_record.event_reason = (underlying_trading_status_notification_message_base + 16 + 1) % 256;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.expected_event_time_seconds_part[underlying_trading_status_notification_message_at] = (underlying_trading_status_notification_message_base + 17 + underlying_trading_status_notification_message_at + 1) % 256; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_message_at] = (underlying_trading_status_notification_message_base + 21 + underlying_trading_status_notification_message_at + 1) % 256; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Notification Message to the wire, 25 bytes from where the cursor stands */
inline encode_underlying_trading_status_notification_message(underlying_trading_status_notification_message_record) {
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> wire[at] = underlying_trading_status_notification_message_record.nanoseconds[underlying_trading_status_notification_message_at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 11 -> wire[at] = underlying_trading_status_notification_message_record.underlying_symbol[underlying_trading_status_notification_message_at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_trading_status_notification_message_record.trading_status; at = at + 1;
  wire[at] = underlying_trading_status_notification_message_record.event_reason; at = at + 1;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> wire[at] = underlying_trading_status_notification_message_record.expected_event_time_seconds_part[underlying_trading_status_notification_message_at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> wire[at] = underlying_trading_status_notification_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_message_at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Notification Message off the wire, 25 bytes from where the cursor stands */
inline decode_underlying_trading_status_notification_message(underlying_trading_status_notification_message_record) {
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.nanoseconds[underlying_trading_status_notification_message_at] = wire[at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 11 -> underlying_trading_status_notification_message_record.underlying_symbol[underlying_trading_status_notification_message_at] = wire[at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_record.trading_status = wire[at]; at = at + 1;
  underlying_trading_status_notification_message_record.event_reason = wire[at]; at = at + 1;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.expected_event_time_seconds_part[underlying_trading_status_notification_message_at] = wire[at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> underlying_trading_status_notification_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_message_at] = wire[at]; at = at + 1; underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Trading Status Notification Message is what was written, byte for byte */
inline equal_underlying_trading_status_notification_message(underlying_trading_status_notification_message_read, underlying_trading_status_notification_message_written) {
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> assert(underlying_trading_status_notification_message_read.nanoseconds[underlying_trading_status_notification_message_at] == underlying_trading_status_notification_message_written.nanoseconds[underlying_trading_status_notification_message_at]); underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 11 -> assert(underlying_trading_status_notification_message_read.underlying_symbol[underlying_trading_status_notification_message_at] == underlying_trading_status_notification_message_written.underlying_symbol[underlying_trading_status_notification_message_at]); underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  assert(underlying_trading_status_notification_message_read.trading_status == underlying_trading_status_notification_message_written.trading_status);
  assert(underlying_trading_status_notification_message_read.event_reason == underlying_trading_status_notification_message_written.event_reason);
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> assert(underlying_trading_status_notification_message_read.expected_event_time_seconds_part[underlying_trading_status_notification_message_at] == underlying_trading_status_notification_message_written.expected_event_time_seconds_part[underlying_trading_status_notification_message_at]); underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_message_at = 0;
  do
  :: underlying_trading_status_notification_message_at < 4 -> assert(underlying_trading_status_notification_message_read.expected_event_time_nano_seconds_part[underlying_trading_status_notification_message_at] == underlying_trading_status_notification_message_written.expected_event_time_nano_seconds_part[underlying_trading_status_notification_message_at]); underlying_trading_status_notification_message_at = underlying_trading_status_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Order Message: 43 bytes ------------------------------------------ */

/* This is the message format that will be used to disseminate Sapphire Options Simple Orders. */
typedef SimpleOrderMessage {
  byte nanoseconds[4];
  byte action;
  byte product_id[4];
  byte order_id[8];
  byte order_side;
  byte order_type;
  byte order_price_short[4];
  byte order_original_volume[4];
  byte remaining_volume_open[4];
  byte time_in_force_tif;
  byte origin;
  byte openclose_indicator;
  byte order_instruction;
  byte reserved_8[8]
};

int simple_order_message_at;

/* every byte of Simple Order Message set to one value */
inline fill_simple_order_message(simple_order_message_record, simple_order_message_value) {
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.nanoseconds[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.action = simple_order_message_value;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.product_id[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> simple_order_message_record.order_id[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.order_side = simple_order_message_value;
  simple_order_message_record.order_type = simple_order_message_value;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.order_price_short[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.order_original_volume[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.remaining_volume_open[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.time_in_force_tif = simple_order_message_value;
  simple_order_message_record.origin = simple_order_message_value;
  simple_order_message_record.openclose_indicator = simple_order_message_value;
  simple_order_message_record.order_instruction = simple_order_message_value;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> simple_order_message_record.reserved_8[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Order Message set to where it lies, so a field read out of place says so */
inline ramp_simple_order_message(simple_order_message_record, simple_order_message_base) {
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.nanoseconds[simple_order_message_at] = (simple_order_message_base + 0 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.action = (simple_order_message_base + 4 + 1) % 256;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.product_id[simple_order_message_at] = (simple_order_message_base + 5 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> simple_order_message_record.order_id[simple_order_message_at] = (simple_order_message_base + 9 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.order_side = (simple_order_message_base + 17 + 1) % 256;
  simple_order_message_record.order_type = (simple_order_message_base + 18 + 1) % 256;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.order_price_short[simple_order_message_at] = (simple_order_message_base + 19 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.order_original_volume[simple_order_message_at] = (simple_order_message_base + 23 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.remaining_volume_open[simple_order_message_at] = (simple_order_message_base + 27 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.time_in_force_tif = (simple_order_message_base + 31 + 1) % 256;
  simple_order_message_record.origin = (simple_order_message_base + 32 + 1) % 256;
  simple_order_message_record.openclose_indicator = (simple_order_message_base + 33 + 1) % 256;
  simple_order_message_record.order_instruction = (simple_order_message_base + 34 + 1) % 256;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> simple_order_message_record.reserved_8[simple_order_message_at] = (simple_order_message_base + 35 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Order Message to the wire, 43 bytes from where the cursor stands */
inline encode_simple_order_message(simple_order_message_record) {
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> wire[at] = simple_order_message_record.nanoseconds[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_order_message_record.action; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> wire[at] = simple_order_message_record.product_id[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> wire[at] = simple_order_message_record.order_id[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_order_message_record.order_side; at = at + 1;
  wire[at] = simple_order_message_record.order_type; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> wire[at] = simple_order_message_record.order_price_short[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> wire[at] = simple_order_message_record.order_original_volume[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> wire[at] = simple_order_message_record.remaining_volume_open[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_order_message_record.time_in_force_tif; at = at + 1;
  wire[at] = simple_order_message_record.origin; at = at + 1;
  wire[at] = simple_order_message_record.openclose_indicator; at = at + 1;
  wire[at] = simple_order_message_record.order_instruction; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> wire[at] = simple_order_message_record.reserved_8[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Order Message off the wire, 43 bytes from where the cursor stands */
inline decode_simple_order_message(simple_order_message_record) {
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.nanoseconds[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.action = wire[at]; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.product_id[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> simple_order_message_record.order_id[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.order_side = wire[at]; at = at + 1;
  simple_order_message_record.order_type = wire[at]; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.order_price_short[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.order_original_volume[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.remaining_volume_open[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_record.time_in_force_tif = wire[at]; at = at + 1;
  simple_order_message_record.origin = wire[at]; at = at + 1;
  simple_order_message_record.openclose_indicator = wire[at]; at = at + 1;
  simple_order_message_record.order_instruction = wire[at]; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> simple_order_message_record.reserved_8[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Order Message is what was written, byte for byte */
inline equal_simple_order_message(simple_order_message_read, simple_order_message_written) {
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> assert(simple_order_message_read.nanoseconds[simple_order_message_at] == simple_order_message_written.nanoseconds[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  assert(simple_order_message_read.action == simple_order_message_written.action);
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> assert(simple_order_message_read.product_id[simple_order_message_at] == simple_order_message_written.product_id[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> assert(simple_order_message_read.order_id[simple_order_message_at] == simple_order_message_written.order_id[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  assert(simple_order_message_read.order_side == simple_order_message_written.order_side);
  assert(simple_order_message_read.order_type == simple_order_message_written.order_type);
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> assert(simple_order_message_read.order_price_short[simple_order_message_at] == simple_order_message_written.order_price_short[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> assert(simple_order_message_read.order_original_volume[simple_order_message_at] == simple_order_message_written.order_original_volume[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> assert(simple_order_message_read.remaining_volume_open[simple_order_message_at] == simple_order_message_written.remaining_volume_open[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  assert(simple_order_message_read.time_in_force_tif == simple_order_message_written.time_in_force_tif);
  assert(simple_order_message_read.origin == simple_order_message_written.origin);
  assert(simple_order_message_read.openclose_indicator == simple_order_message_written.openclose_indicator);
  assert(simple_order_message_read.order_instruction == simple_order_message_written.order_instruction);
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 8 -> assert(simple_order_message_read.reserved_8[simple_order_message_at] == simple_order_message_written.reserved_8[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Order Message: 65 bytes ----------------------------------------- */

/* This is the message format that will be used to disseminate Sapphire Options Complex Orders. */
typedef ComplexOrderMessage {
  byte nanoseconds[4];
  byte action;
  byte strategy_id[4];
  byte order_id[8];
  byte order_side;
  byte order_type;
  byte order_price_long[8];
  byte order_original_volume[4];
  byte remaining_volume_open[4];
  byte time_in_force_tif;
  byte origin;
  byte reserved_28[28]
};

int complex_order_message_at;

/* every byte of Complex Order Message set to one value */
inline fill_complex_order_message(complex_order_message_record, complex_order_message_value) {
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.nanoseconds[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.action = complex_order_message_value;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.strategy_id[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> complex_order_message_record.order_id[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.order_side = complex_order_message_value;
  complex_order_message_record.order_type = complex_order_message_value;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> complex_order_message_record.order_price_long[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.order_original_volume[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.remaining_volume_open[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.time_in_force_tif = complex_order_message_value;
  complex_order_message_record.origin = complex_order_message_value;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> complex_order_message_record.reserved_28[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Order Message set to where it lies, so a field read out of place says so */
inline ramp_complex_order_message(complex_order_message_record, complex_order_message_base) {
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.nanoseconds[complex_order_message_at] = (complex_order_message_base + 0 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.action = (complex_order_message_base + 4 + 1) % 256;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.strategy_id[complex_order_message_at] = (complex_order_message_base + 5 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> complex_order_message_record.order_id[complex_order_message_at] = (complex_order_message_base + 9 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.order_side = (complex_order_message_base + 17 + 1) % 256;
  complex_order_message_record.order_type = (complex_order_message_base + 18 + 1) % 256;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> complex_order_message_record.order_price_long[complex_order_message_at] = (complex_order_message_base + 19 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.order_original_volume[complex_order_message_at] = (complex_order_message_base + 27 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.remaining_volume_open[complex_order_message_at] = (complex_order_message_base + 31 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.time_in_force_tif = (complex_order_message_base + 35 + 1) % 256;
  complex_order_message_record.origin = (complex_order_message_base + 36 + 1) % 256;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> complex_order_message_record.reserved_28[complex_order_message_at] = (complex_order_message_base + 37 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Order Message to the wire, 65 bytes from where the cursor stands */
inline encode_complex_order_message(complex_order_message_record) {
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> wire[at] = complex_order_message_record.nanoseconds[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_order_message_record.action; at = at + 1;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> wire[at] = complex_order_message_record.strategy_id[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> wire[at] = complex_order_message_record.order_id[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_order_message_record.order_side; at = at + 1;
  wire[at] = complex_order_message_record.order_type; at = at + 1;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> wire[at] = complex_order_message_record.order_price_long[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> wire[at] = complex_order_message_record.order_original_volume[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> wire[at] = complex_order_message_record.remaining_volume_open[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_order_message_record.time_in_force_tif; at = at + 1;
  wire[at] = complex_order_message_record.origin; at = at + 1;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> wire[at] = complex_order_message_record.reserved_28[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Order Message off the wire, 65 bytes from where the cursor stands */
inline decode_complex_order_message(complex_order_message_record) {
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.nanoseconds[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.action = wire[at]; at = at + 1;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.strategy_id[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> complex_order_message_record.order_id[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.order_side = wire[at]; at = at + 1;
  complex_order_message_record.order_type = wire[at]; at = at + 1;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> complex_order_message_record.order_price_long[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.order_original_volume[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> complex_order_message_record.remaining_volume_open[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_record.time_in_force_tif = wire[at]; at = at + 1;
  complex_order_message_record.origin = wire[at]; at = at + 1;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> complex_order_message_record.reserved_28[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Order Message is what was written, byte for byte */
inline equal_complex_order_message(complex_order_message_read, complex_order_message_written) {
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> assert(complex_order_message_read.nanoseconds[complex_order_message_at] == complex_order_message_written.nanoseconds[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  assert(complex_order_message_read.action == complex_order_message_written.action);
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> assert(complex_order_message_read.strategy_id[complex_order_message_at] == complex_order_message_written.strategy_id[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> assert(complex_order_message_read.order_id[complex_order_message_at] == complex_order_message_written.order_id[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  assert(complex_order_message_read.order_side == complex_order_message_written.order_side);
  assert(complex_order_message_read.order_type == complex_order_message_written.order_type);
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 8 -> assert(complex_order_message_read.order_price_long[complex_order_message_at] == complex_order_message_written.order_price_long[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> assert(complex_order_message_read.order_original_volume[complex_order_message_at] == complex_order_message_written.order_original_volume[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 4 -> assert(complex_order_message_read.remaining_volume_open[complex_order_message_at] == complex_order_message_written.remaining_volume_open[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  assert(complex_order_message_read.time_in_force_tif == complex_order_message_written.time_in_force_tif);
  assert(complex_order_message_read.origin == complex_order_message_written.origin);
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> assert(complex_order_message_read.reserved_28[complex_order_message_at] == complex_order_message_written.reserved_28[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Close Message: 13 bytes ------------------------------------------- */

/* This is the message format that will be used to disseminate Order Close for Sapphire Options Simple and Complex Orders. */
typedef OrderCloseMessage {
  byte nanoseconds[4];
  byte simple_or_complex_order;
  byte order_id[8]
};

int order_close_message_at;

/* every byte of Order Close Message set to one value */
inline fill_order_close_message(order_close_message_record, order_close_message_value) {
  order_close_message_at = 0;
  do
  :: order_close_message_at < 4 -> order_close_message_record.nanoseconds[order_close_message_at] = order_close_message_value; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  order_close_message_record.simple_or_complex_order = order_close_message_value;
  order_close_message_at = 0;
  do
  :: order_close_message_at < 8 -> order_close_message_record.order_id[order_close_message_at] = order_close_message_value; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Close Message set to where it lies, so a field read out of place says so */
inline ramp_order_close_message(order_close_message_record, order_close_message_base) {
  order_close_message_at = 0;
  do
  :: order_close_message_at < 4 -> order_close_message_record.nanoseconds[order_close_message_at] = (order_close_message_base + 0 + order_close_message_at + 1) % 256; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  order_close_message_record.simple_or_complex_order = (order_close_message_base + 4 + 1) % 256;
  order_close_message_at = 0;
  do
  :: order_close_message_at < 8 -> order_close_message_record.order_id[order_close_message_at] = (order_close_message_base + 5 + order_close_message_at + 1) % 256; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Close Message to the wire, 13 bytes from where the cursor stands */
inline encode_order_close_message(order_close_message_record) {
  order_close_message_at = 0;
  do
  :: order_close_message_at < 4 -> wire[at] = order_close_message_record.nanoseconds[order_close_message_at]; at = at + 1; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  wire[at] = order_close_message_record.simple_or_complex_order; at = at + 1;
  order_close_message_at = 0;
  do
  :: order_close_message_at < 8 -> wire[at] = order_close_message_record.order_id[order_close_message_at]; at = at + 1; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Close Message off the wire, 13 bytes from where the cursor stands */
inline decode_order_close_message(order_close_message_record) {
  order_close_message_at = 0;
  do
  :: order_close_message_at < 4 -> order_close_message_record.nanoseconds[order_close_message_at] = wire[at]; at = at + 1; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  order_close_message_record.simple_or_complex_order = wire[at]; at = at + 1;
  order_close_message_at = 0;
  do
  :: order_close_message_at < 8 -> order_close_message_record.order_id[order_close_message_at] = wire[at]; at = at + 1; order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Close Message is what was written, byte for byte */
inline equal_order_close_message(order_close_message_read, order_close_message_written) {
  order_close_message_at = 0;
  do
  :: order_close_message_at < 4 -> assert(order_close_message_read.nanoseconds[order_close_message_at] == order_close_message_written.nanoseconds[order_close_message_at]); order_close_message_at = order_close_message_at + 1
  :: else -> break
  od;
  assert(order_close_message_read.simple_or_complex_order == order_close_message_written.simple_or_complex_order);
  order_close_message_at = 0;
  do
  :: order_close_message_at < 8 -> assert(order_close_message_read.order_id[order_close_message_at] == order_close_message_written.order_id[order_close_message_at]); order_close_message_at = order_close_message_at + 1
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

/* Series Update Message: encoded, read back, and compared */
proctype check_series_update_message() {
  SeriesUpdateMessage series_update_message_sent;
  SeriesUpdateMessage series_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_update_message(series_update_message_sent, 0)
  :: pattern == 1 -> fill_series_update_message(series_update_message_sent, 32)
  :: pattern == 2 -> fill_series_update_message(series_update_message_sent, 255)
  :: else -> ramp_series_update_message(series_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_update_message(series_update_message_sent);
    assert(at == 72);
    at = 0;
    decode_series_update_message(series_update_message_got);
    assert(at == 72);
    equal_series_update_message(series_update_message_got, series_update_message_sent)
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
    assert(at == 17);
    at = 0;
    decode_system_state_message(system_state_message_got);
    assert(at == 17);
    equal_system_state_message(system_state_message_got, system_state_message_sent)
  }
}

/* Underlying Trading Status Notification Message: encoded, read back, and compared */
proctype check_underlying_trading_status_notification_message() {
  UnderlyingTradingStatusNotificationMessage underlying_trading_status_notification_message_sent;
  UnderlyingTradingStatusNotificationMessage underlying_trading_status_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_trading_status_notification_message(underlying_trading_status_notification_message_sent, 0)
  :: pattern == 1 -> fill_underlying_trading_status_notification_message(underlying_trading_status_notification_message_sent, 32)
  :: pattern == 2 -> fill_underlying_trading_status_notification_message(underlying_trading_status_notification_message_sent, 255)
  :: else -> ramp_underlying_trading_status_notification_message(underlying_trading_status_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_trading_status_notification_message(underlying_trading_status_notification_message_sent);
    assert(at == 25);
    at = 0;
    decode_underlying_trading_status_notification_message(underlying_trading_status_notification_message_got);
    assert(at == 25);
    equal_underlying_trading_status_notification_message(underlying_trading_status_notification_message_got, underlying_trading_status_notification_message_sent)
  }
}

/* Simple Order Message: encoded, read back, and compared */
proctype check_simple_order_message() {
  SimpleOrderMessage simple_order_message_sent;
  SimpleOrderMessage simple_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_order_message(simple_order_message_sent, 0)
  :: pattern == 1 -> fill_simple_order_message(simple_order_message_sent, 32)
  :: pattern == 2 -> fill_simple_order_message(simple_order_message_sent, 255)
  :: else -> ramp_simple_order_message(simple_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_order_message(simple_order_message_sent);
    assert(at == 43);
    at = 0;
    decode_simple_order_message(simple_order_message_got);
    assert(at == 43);
    equal_simple_order_message(simple_order_message_got, simple_order_message_sent)
  }
}

/* Complex Order Message: encoded, read back, and compared */
proctype check_complex_order_message() {
  ComplexOrderMessage complex_order_message_sent;
  ComplexOrderMessage complex_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_order_message(complex_order_message_sent, 0)
  :: pattern == 1 -> fill_complex_order_message(complex_order_message_sent, 32)
  :: pattern == 2 -> fill_complex_order_message(complex_order_message_sent, 255)
  :: else -> ramp_complex_order_message(complex_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_order_message(complex_order_message_sent);
    assert(at == 65);
    at = 0;
    decode_complex_order_message(complex_order_message_got);
    assert(at == 65);
    equal_complex_order_message(complex_order_message_got, complex_order_message_sent)
  }
}

/* Order Close Message: encoded, read back, and compared */
proctype check_order_close_message() {
  OrderCloseMessage order_close_message_sent;
  OrderCloseMessage order_close_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_close_message(order_close_message_sent, 0)
  :: pattern == 1 -> fill_order_close_message(order_close_message_sent, 32)
  :: pattern == 2 -> fill_order_close_message(order_close_message_sent, 255)
  :: else -> ramp_order_close_message(order_close_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_close_message(order_close_message_sent);
    assert(at == 13);
    at = 0;
    decode_order_close_message(order_close_message_got);
    assert(at == 13);
    equal_order_close_message(order_close_message_got, order_close_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_system_time_message()
  :: run check_series_update_message()
  :: run check_system_state_message()
  :: run check_underlying_trading_status_notification_message()
  :: run check_simple_order_message()
  :: run check_complex_order_message()
  :: run check_order_close_message()
  fi
}
