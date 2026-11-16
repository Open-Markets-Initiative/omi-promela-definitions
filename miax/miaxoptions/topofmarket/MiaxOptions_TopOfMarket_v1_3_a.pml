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

/* ---- Series Update Message: 72 bytes ----------------------------------------- */

/* This is the message format that will be used to disseminate all Option series traded on MIAX for the current session. The product ID sent in this message is what will be disseminated in Top of Market BBO and Last Sale messages. */
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
  byte active_on_miax;
  byte miax_bbo_posting_increment_indicator;
  byte liquidity_acceptance_increment_indicator;
  byte opening_underlying_market_code;
  byte priority_quote_width[4];
  byte reserved_8[8]
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
  series_update_message_record.active_on_miax = series_update_message_value;
  series_update_message_record.miax_bbo_posting_increment_indicator = series_update_message_value;
  series_update_message_record.liquidity_acceptance_increment_indicator = series_update_message_value;
  series_update_message_record.opening_underlying_market_code = series_update_message_value;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.priority_quote_width[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.reserved_8[series_update_message_at] = series_update_message_value; series_update_message_at = series_update_message_at + 1
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
  series_update_message_record.active_on_miax = (series_update_message_base + 56 + 1) % 256;
  series_update_message_record.miax_bbo_posting_increment_indicator = (series_update_message_base + 57 + 1) % 256;
  series_update_message_record.liquidity_acceptance_increment_indicator = (series_update_message_base + 58 + 1) % 256;
  series_update_message_record.opening_underlying_market_code = (series_update_message_base + 59 + 1) % 256;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.priority_quote_width[series_update_message_at] = (series_update_message_base + 60 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.reserved_8[series_update_message_at] = (series_update_message_base + 64 + series_update_message_at + 1) % 256; series_update_message_at = series_update_message_at + 1
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
  wire[at] = series_update_message_record.active_on_miax; at = at + 1;
  wire[at] = series_update_message_record.miax_bbo_posting_increment_indicator; at = at + 1;
  wire[at] = series_update_message_record.liquidity_acceptance_increment_indicator; at = at + 1;
  wire[at] = series_update_message_record.opening_underlying_market_code; at = at + 1;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> wire[at] = series_update_message_record.priority_quote_width[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> wire[at] = series_update_message_record.reserved_8[series_update_message_at]; at = at + 1; series_update_message_at = series_update_message_at + 1
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
  series_update_message_record.active_on_miax = wire[at]; at = at + 1;
  series_update_message_record.miax_bbo_posting_increment_indicator = wire[at]; at = at + 1;
  series_update_message_record.liquidity_acceptance_increment_indicator = wire[at]; at = at + 1;
  series_update_message_record.opening_underlying_market_code = wire[at]; at = at + 1;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> series_update_message_record.priority_quote_width[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> series_update_message_record.reserved_8[series_update_message_at] = wire[at]; at = at + 1; series_update_message_at = series_update_message_at + 1
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
  assert(series_update_message_read.active_on_miax == series_update_message_written.active_on_miax);
  assert(series_update_message_read.miax_bbo_posting_increment_indicator == series_update_message_written.miax_bbo_posting_increment_indicator);
  assert(series_update_message_read.liquidity_acceptance_increment_indicator == series_update_message_written.liquidity_acceptance_increment_indicator);
  assert(series_update_message_read.opening_underlying_market_code == series_update_message_written.opening_underlying_market_code);
  series_update_message_at = 0;
  do
  :: series_update_message_at < 4 -> assert(series_update_message_read.priority_quote_width[series_update_message_at] == series_update_message_written.priority_quote_width[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  series_update_message_at = 0;
  do
  :: series_update_message_at < 8 -> assert(series_update_message_read.reserved_8[series_update_message_at] == series_update_message_written.reserved_8[series_update_message_at]); series_update_message_at = series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Message: 17 bytes ------------------------------------------ */

/* This message format is used to notify the firms of the state changes of the system. This is a notification that applies to each Underlying group. Firms can use notifications as triggers in their system to ensure electronic synchronization of systems. */
typedef SystemStateMessage {
  byte nanoseconds[4];
  byte to_m_version[8];
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
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = (system_state_message_base + 4 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.to_m_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> assert(system_state_message_read.to_m_version[system_state_message_at] == system_state_message_written.to_m_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
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

/* ---- Top Of Market Bid Compact Message: 15 bytes ----------------------------- */

/* This is the message format that will be used to disseminate each side of the MIAX Top of Market for options with low premiums and small aggregate MIAX Best Bid or Offer (MBBO) size. */
typedef TopOfMarketBidCompactMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte mbbo_price_2[2];
  byte mbbo_size_2[2];
  byte reserved_2[2];
  byte mbbo_condition
};

int top_of_market_bid_compact_message_at;

/* every byte of Top Of Market Bid Compact Message set to one value */
inline fill_top_of_market_bid_compact_message(top_of_market_bid_compact_message_record, top_of_market_bid_compact_message_value) {
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> top_of_market_bid_compact_message_record.nanoseconds[top_of_market_bid_compact_message_at] = top_of_market_bid_compact_message_value; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> top_of_market_bid_compact_message_record.product_id[top_of_market_bid_compact_message_at] = top_of_market_bid_compact_message_value; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.mbbo_price_2[top_of_market_bid_compact_message_at] = top_of_market_bid_compact_message_value; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.mbbo_size_2[top_of_market_bid_compact_message_at] = top_of_market_bid_compact_message_value; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.reserved_2[top_of_market_bid_compact_message_at] = top_of_market_bid_compact_message_value; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_record.mbbo_condition = top_of_market_bid_compact_message_value;
  skip
}

/* each byte of Top Of Market Bid Compact Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_market_bid_compact_message(top_of_market_bid_compact_message_record, top_of_market_bid_compact_message_base) {
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> top_of_market_bid_compact_message_record.nanoseconds[top_of_market_bid_compact_message_at] = (top_of_market_bid_compact_message_base + 0 + top_of_market_bid_compact_message_at + 1) % 256; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> top_of_market_bid_compact_message_record.product_id[top_of_market_bid_compact_message_at] = (top_of_market_bid_compact_message_base + 4 + top_of_market_bid_compact_message_at + 1) % 256; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.mbbo_price_2[top_of_market_bid_compact_message_at] = (top_of_market_bid_compact_message_base + 8 + top_of_market_bid_compact_message_at + 1) % 256; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.mbbo_size_2[top_of_market_bid_compact_message_at] = (top_of_market_bid_compact_message_base + 10 + top_of_market_bid_compact_message_at + 1) % 256; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.reserved_2[top_of_market_bid_compact_message_at] = (top_of_market_bid_compact_message_base + 12 + top_of_market_bid_compact_message_at + 1) % 256; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_record.mbbo_condition = (top_of_market_bid_compact_message_base + 14 + 1) % 256;
  skip
}

/* Top Of Market Bid Compact Message to the wire, 15 bytes from where the cursor stands */
inline encode_top_of_market_bid_compact_message(top_of_market_bid_compact_message_record) {
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> wire[at] = top_of_market_bid_compact_message_record.nanoseconds[top_of_market_bid_compact_message_at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> wire[at] = top_of_market_bid_compact_message_record.product_id[top_of_market_bid_compact_message_at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> wire[at] = top_of_market_bid_compact_message_record.mbbo_price_2[top_of_market_bid_compact_message_at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> wire[at] = top_of_market_bid_compact_message_record.mbbo_size_2[top_of_market_bid_compact_message_at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> wire[at] = top_of_market_bid_compact_message_record.reserved_2[top_of_market_bid_compact_message_at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  wire[at] = top_of_market_bid_compact_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Top Of Market Bid Compact Message off the wire, 15 bytes from where the cursor stands */
inline decode_top_of_market_bid_compact_message(top_of_market_bid_compact_message_record) {
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> top_of_market_bid_compact_message_record.nanoseconds[top_of_market_bid_compact_message_at] = wire[at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> top_of_market_bid_compact_message_record.product_id[top_of_market_bid_compact_message_at] = wire[at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.mbbo_price_2[top_of_market_bid_compact_message_at] = wire[at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.mbbo_size_2[top_of_market_bid_compact_message_at] = wire[at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> top_of_market_bid_compact_message_record.reserved_2[top_of_market_bid_compact_message_at] = wire[at]; at = at + 1; top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Top Of Market Bid Compact Message is what was written, byte for byte */
inline equal_top_of_market_bid_compact_message(top_of_market_bid_compact_message_read, top_of_market_bid_compact_message_written) {
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> assert(top_of_market_bid_compact_message_read.nanoseconds[top_of_market_bid_compact_message_at] == top_of_market_bid_compact_message_written.nanoseconds[top_of_market_bid_compact_message_at]); top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 4 -> assert(top_of_market_bid_compact_message_read.product_id[top_of_market_bid_compact_message_at] == top_of_market_bid_compact_message_written.product_id[top_of_market_bid_compact_message_at]); top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> assert(top_of_market_bid_compact_message_read.mbbo_price_2[top_of_market_bid_compact_message_at] == top_of_market_bid_compact_message_written.mbbo_price_2[top_of_market_bid_compact_message_at]); top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> assert(top_of_market_bid_compact_message_read.mbbo_size_2[top_of_market_bid_compact_message_at] == top_of_market_bid_compact_message_written.mbbo_size_2[top_of_market_bid_compact_message_at]); top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_compact_message_at = 0;
  do
  :: top_of_market_bid_compact_message_at < 2 -> assert(top_of_market_bid_compact_message_read.reserved_2[top_of_market_bid_compact_message_at] == top_of_market_bid_compact_message_written.reserved_2[top_of_market_bid_compact_message_at]); top_of_market_bid_compact_message_at = top_of_market_bid_compact_message_at + 1
  :: else -> break
  od;
  assert(top_of_market_bid_compact_message_read.mbbo_condition == top_of_market_bid_compact_message_written.mbbo_condition);
  skip
}

/* ---- Top Of Market Offer Compact Message: 15 bytes --------------------------- */

/* This is the message format that will be used to disseminate each side of the MIAX Top of Market for options with low premiums and small aggregate MIAX Best Bid or Offer (MBBO) size. */
typedef TopOfMarketOfferCompactMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte mbbo_price_2[2];
  byte mbbo_size_2[2];
  byte reserved_2[2];
  byte mbbo_condition
};

int top_of_market_offer_compact_message_at;

/* every byte of Top Of Market Offer Compact Message set to one value */
inline fill_top_of_market_offer_compact_message(top_of_market_offer_compact_message_record, top_of_market_offer_compact_message_value) {
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> top_of_market_offer_compact_message_record.nanoseconds[top_of_market_offer_compact_message_at] = top_of_market_offer_compact_message_value; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> top_of_market_offer_compact_message_record.product_id[top_of_market_offer_compact_message_at] = top_of_market_offer_compact_message_value; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.mbbo_price_2[top_of_market_offer_compact_message_at] = top_of_market_offer_compact_message_value; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.mbbo_size_2[top_of_market_offer_compact_message_at] = top_of_market_offer_compact_message_value; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.reserved_2[top_of_market_offer_compact_message_at] = top_of_market_offer_compact_message_value; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_record.mbbo_condition = top_of_market_offer_compact_message_value;
  skip
}

/* each byte of Top Of Market Offer Compact Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_market_offer_compact_message(top_of_market_offer_compact_message_record, top_of_market_offer_compact_message_base) {
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> top_of_market_offer_compact_message_record.nanoseconds[top_of_market_offer_compact_message_at] = (top_of_market_offer_compact_message_base + 0 + top_of_market_offer_compact_message_at + 1) % 256; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> top_of_market_offer_compact_message_record.product_id[top_of_market_offer_compact_message_at] = (top_of_market_offer_compact_message_base + 4 + top_of_market_offer_compact_message_at + 1) % 256; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.mbbo_price_2[top_of_market_offer_compact_message_at] = (top_of_market_offer_compact_message_base + 8 + top_of_market_offer_compact_message_at + 1) % 256; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.mbbo_size_2[top_of_market_offer_compact_message_at] = (top_of_market_offer_compact_message_base + 10 + top_of_market_offer_compact_message_at + 1) % 256; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.reserved_2[top_of_market_offer_compact_message_at] = (top_of_market_offer_compact_message_base + 12 + top_of_market_offer_compact_message_at + 1) % 256; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_record.mbbo_condition = (top_of_market_offer_compact_message_base + 14 + 1) % 256;
  skip
}

/* Top Of Market Offer Compact Message to the wire, 15 bytes from where the cursor stands */
inline encode_top_of_market_offer_compact_message(top_of_market_offer_compact_message_record) {
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> wire[at] = top_of_market_offer_compact_message_record.nanoseconds[top_of_market_offer_compact_message_at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> wire[at] = top_of_market_offer_compact_message_record.product_id[top_of_market_offer_compact_message_at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> wire[at] = top_of_market_offer_compact_message_record.mbbo_price_2[top_of_market_offer_compact_message_at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> wire[at] = top_of_market_offer_compact_message_record.mbbo_size_2[top_of_market_offer_compact_message_at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> wire[at] = top_of_market_offer_compact_message_record.reserved_2[top_of_market_offer_compact_message_at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  wire[at] = top_of_market_offer_compact_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Top Of Market Offer Compact Message off the wire, 15 bytes from where the cursor stands */
inline decode_top_of_market_offer_compact_message(top_of_market_offer_compact_message_record) {
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> top_of_market_offer_compact_message_record.nanoseconds[top_of_market_offer_compact_message_at] = wire[at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> top_of_market_offer_compact_message_record.product_id[top_of_market_offer_compact_message_at] = wire[at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.mbbo_price_2[top_of_market_offer_compact_message_at] = wire[at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.mbbo_size_2[top_of_market_offer_compact_message_at] = wire[at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> top_of_market_offer_compact_message_record.reserved_2[top_of_market_offer_compact_message_at] = wire[at]; at = at + 1; top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Top Of Market Offer Compact Message is what was written, byte for byte */
inline equal_top_of_market_offer_compact_message(top_of_market_offer_compact_message_read, top_of_market_offer_compact_message_written) {
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> assert(top_of_market_offer_compact_message_read.nanoseconds[top_of_market_offer_compact_message_at] == top_of_market_offer_compact_message_written.nanoseconds[top_of_market_offer_compact_message_at]); top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 4 -> assert(top_of_market_offer_compact_message_read.product_id[top_of_market_offer_compact_message_at] == top_of_market_offer_compact_message_written.product_id[top_of_market_offer_compact_message_at]); top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> assert(top_of_market_offer_compact_message_read.mbbo_price_2[top_of_market_offer_compact_message_at] == top_of_market_offer_compact_message_written.mbbo_price_2[top_of_market_offer_compact_message_at]); top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> assert(top_of_market_offer_compact_message_read.mbbo_size_2[top_of_market_offer_compact_message_at] == top_of_market_offer_compact_message_written.mbbo_size_2[top_of_market_offer_compact_message_at]); top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_compact_message_at = 0;
  do
  :: top_of_market_offer_compact_message_at < 2 -> assert(top_of_market_offer_compact_message_read.reserved_2[top_of_market_offer_compact_message_at] == top_of_market_offer_compact_message_written.reserved_2[top_of_market_offer_compact_message_at]); top_of_market_offer_compact_message_at = top_of_market_offer_compact_message_at + 1
  :: else -> break
  od;
  assert(top_of_market_offer_compact_message_read.mbbo_condition == top_of_market_offer_compact_message_written.mbbo_condition);
  skip
}

/* ---- Top Of Market Bid Wide Message: 21 bytes -------------------------------- */

/* This is the message format that will be used to disseminate MIAX Top of Market for options with high premiums or large aggregate MIAX Best Bid or Offer (MBBO) size. */
typedef TopOfMarketBidWideMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte mbbo_price_4[4];
  byte mbbo_size_4[4];
  byte reserved_4[4];
  byte mbbo_condition
};

int top_of_market_bid_wide_message_at;

/* every byte of Top Of Market Bid Wide Message set to one value */
inline fill_top_of_market_bid_wide_message(top_of_market_bid_wide_message_record, top_of_market_bid_wide_message_value) {
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.nanoseconds[top_of_market_bid_wide_message_at] = top_of_market_bid_wide_message_value; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.product_id[top_of_market_bid_wide_message_at] = top_of_market_bid_wide_message_value; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.mbbo_price_4[top_of_market_bid_wide_message_at] = top_of_market_bid_wide_message_value; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.mbbo_size_4[top_of_market_bid_wide_message_at] = top_of_market_bid_wide_message_value; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.reserved_4[top_of_market_bid_wide_message_at] = top_of_market_bid_wide_message_value; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_record.mbbo_condition = top_of_market_bid_wide_message_value;
  skip
}

/* each byte of Top Of Market Bid Wide Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_market_bid_wide_message(top_of_market_bid_wide_message_record, top_of_market_bid_wide_message_base) {
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.nanoseconds[top_of_market_bid_wide_message_at] = (top_of_market_bid_wide_message_base + 0 + top_of_market_bid_wide_message_at + 1) % 256; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.product_id[top_of_market_bid_wide_message_at] = (top_of_market_bid_wide_message_base + 4 + top_of_market_bid_wide_message_at + 1) % 256; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.mbbo_price_4[top_of_market_bid_wide_message_at] = (top_of_market_bid_wide_message_base + 8 + top_of_market_bid_wide_message_at + 1) % 256; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.mbbo_size_4[top_of_market_bid_wide_message_at] = (top_of_market_bid_wide_message_base + 12 + top_of_market_bid_wide_message_at + 1) % 256; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.reserved_4[top_of_market_bid_wide_message_at] = (top_of_market_bid_wide_message_base + 16 + top_of_market_bid_wide_message_at + 1) % 256; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_record.mbbo_condition = (top_of_market_bid_wide_message_base + 20 + 1) % 256;
  skip
}

/* Top Of Market Bid Wide Message to the wire, 21 bytes from where the cursor stands */
inline encode_top_of_market_bid_wide_message(top_of_market_bid_wide_message_record) {
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> wire[at] = top_of_market_bid_wide_message_record.nanoseconds[top_of_market_bid_wide_message_at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> wire[at] = top_of_market_bid_wide_message_record.product_id[top_of_market_bid_wide_message_at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> wire[at] = top_of_market_bid_wide_message_record.mbbo_price_4[top_of_market_bid_wide_message_at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> wire[at] = top_of_market_bid_wide_message_record.mbbo_size_4[top_of_market_bid_wide_message_at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> wire[at] = top_of_market_bid_wide_message_record.reserved_4[top_of_market_bid_wide_message_at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  wire[at] = top_of_market_bid_wide_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Top Of Market Bid Wide Message off the wire, 21 bytes from where the cursor stands */
inline decode_top_of_market_bid_wide_message(top_of_market_bid_wide_message_record) {
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.nanoseconds[top_of_market_bid_wide_message_at] = wire[at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.product_id[top_of_market_bid_wide_message_at] = wire[at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.mbbo_price_4[top_of_market_bid_wide_message_at] = wire[at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.mbbo_size_4[top_of_market_bid_wide_message_at] = wire[at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> top_of_market_bid_wide_message_record.reserved_4[top_of_market_bid_wide_message_at] = wire[at]; at = at + 1; top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Top Of Market Bid Wide Message is what was written, byte for byte */
inline equal_top_of_market_bid_wide_message(top_of_market_bid_wide_message_read, top_of_market_bid_wide_message_written) {
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> assert(top_of_market_bid_wide_message_read.nanoseconds[top_of_market_bid_wide_message_at] == top_of_market_bid_wide_message_written.nanoseconds[top_of_market_bid_wide_message_at]); top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> assert(top_of_market_bid_wide_message_read.product_id[top_of_market_bid_wide_message_at] == top_of_market_bid_wide_message_written.product_id[top_of_market_bid_wide_message_at]); top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> assert(top_of_market_bid_wide_message_read.mbbo_price_4[top_of_market_bid_wide_message_at] == top_of_market_bid_wide_message_written.mbbo_price_4[top_of_market_bid_wide_message_at]); top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> assert(top_of_market_bid_wide_message_read.mbbo_size_4[top_of_market_bid_wide_message_at] == top_of_market_bid_wide_message_written.mbbo_size_4[top_of_market_bid_wide_message_at]); top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_bid_wide_message_at = 0;
  do
  :: top_of_market_bid_wide_message_at < 4 -> assert(top_of_market_bid_wide_message_read.reserved_4[top_of_market_bid_wide_message_at] == top_of_market_bid_wide_message_written.reserved_4[top_of_market_bid_wide_message_at]); top_of_market_bid_wide_message_at = top_of_market_bid_wide_message_at + 1
  :: else -> break
  od;
  assert(top_of_market_bid_wide_message_read.mbbo_condition == top_of_market_bid_wide_message_written.mbbo_condition);
  skip
}

/* ---- Top Of Market Offer Wide Message: 21 bytes ------------------------------ */

/* This is the message format that will be used to disseminate MIAX Top of Market for options with high premiums or large aggregate MIAX Best Bid or Offer (MBBO) size. */
typedef TopOfMarketOfferWideMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte mbbo_price_4[4];
  byte mbbo_size_4[4];
  byte reserved_4[4];
  byte mbbo_condition
};

int top_of_market_offer_wide_message_at;

/* every byte of Top Of Market Offer Wide Message set to one value */
inline fill_top_of_market_offer_wide_message(top_of_market_offer_wide_message_record, top_of_market_offer_wide_message_value) {
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.nanoseconds[top_of_market_offer_wide_message_at] = top_of_market_offer_wide_message_value; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.product_id[top_of_market_offer_wide_message_at] = top_of_market_offer_wide_message_value; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.mbbo_price_4[top_of_market_offer_wide_message_at] = top_of_market_offer_wide_message_value; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.mbbo_size_4[top_of_market_offer_wide_message_at] = top_of_market_offer_wide_message_value; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.reserved_4[top_of_market_offer_wide_message_at] = top_of_market_offer_wide_message_value; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_record.mbbo_condition = top_of_market_offer_wide_message_value;
  skip
}

/* each byte of Top Of Market Offer Wide Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_market_offer_wide_message(top_of_market_offer_wide_message_record, top_of_market_offer_wide_message_base) {
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.nanoseconds[top_of_market_offer_wide_message_at] = (top_of_market_offer_wide_message_base + 0 + top_of_market_offer_wide_message_at + 1) % 256; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.product_id[top_of_market_offer_wide_message_at] = (top_of_market_offer_wide_message_base + 4 + top_of_market_offer_wide_message_at + 1) % 256; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.mbbo_price_4[top_of_market_offer_wide_message_at] = (top_of_market_offer_wide_message_base + 8 + top_of_market_offer_wide_message_at + 1) % 256; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.mbbo_size_4[top_of_market_offer_wide_message_at] = (top_of_market_offer_wide_message_base + 12 + top_of_market_offer_wide_message_at + 1) % 256; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.reserved_4[top_of_market_offer_wide_message_at] = (top_of_market_offer_wide_message_base + 16 + top_of_market_offer_wide_message_at + 1) % 256; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_record.mbbo_condition = (top_of_market_offer_wide_message_base + 20 + 1) % 256;
  skip
}

/* Top Of Market Offer Wide Message to the wire, 21 bytes from where the cursor stands */
inline encode_top_of_market_offer_wide_message(top_of_market_offer_wide_message_record) {
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> wire[at] = top_of_market_offer_wide_message_record.nanoseconds[top_of_market_offer_wide_message_at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> wire[at] = top_of_market_offer_wide_message_record.product_id[top_of_market_offer_wide_message_at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> wire[at] = top_of_market_offer_wide_message_record.mbbo_price_4[top_of_market_offer_wide_message_at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> wire[at] = top_of_market_offer_wide_message_record.mbbo_size_4[top_of_market_offer_wide_message_at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> wire[at] = top_of_market_offer_wide_message_record.reserved_4[top_of_market_offer_wide_message_at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  wire[at] = top_of_market_offer_wide_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Top Of Market Offer Wide Message off the wire, 21 bytes from where the cursor stands */
inline decode_top_of_market_offer_wide_message(top_of_market_offer_wide_message_record) {
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.nanoseconds[top_of_market_offer_wide_message_at] = wire[at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.product_id[top_of_market_offer_wide_message_at] = wire[at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.mbbo_price_4[top_of_market_offer_wide_message_at] = wire[at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.mbbo_size_4[top_of_market_offer_wide_message_at] = wire[at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> top_of_market_offer_wide_message_record.reserved_4[top_of_market_offer_wide_message_at] = wire[at]; at = at + 1; top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Top Of Market Offer Wide Message is what was written, byte for byte */
inline equal_top_of_market_offer_wide_message(top_of_market_offer_wide_message_read, top_of_market_offer_wide_message_written) {
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> assert(top_of_market_offer_wide_message_read.nanoseconds[top_of_market_offer_wide_message_at] == top_of_market_offer_wide_message_written.nanoseconds[top_of_market_offer_wide_message_at]); top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> assert(top_of_market_offer_wide_message_read.product_id[top_of_market_offer_wide_message_at] == top_of_market_offer_wide_message_written.product_id[top_of_market_offer_wide_message_at]); top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> assert(top_of_market_offer_wide_message_read.mbbo_price_4[top_of_market_offer_wide_message_at] == top_of_market_offer_wide_message_written.mbbo_price_4[top_of_market_offer_wide_message_at]); top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> assert(top_of_market_offer_wide_message_read.mbbo_size_4[top_of_market_offer_wide_message_at] == top_of_market_offer_wide_message_written.mbbo_size_4[top_of_market_offer_wide_message_at]); top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  top_of_market_offer_wide_message_at = 0;
  do
  :: top_of_market_offer_wide_message_at < 4 -> assert(top_of_market_offer_wide_message_read.reserved_4[top_of_market_offer_wide_message_at] == top_of_market_offer_wide_message_written.reserved_4[top_of_market_offer_wide_message_at]); top_of_market_offer_wide_message_at = top_of_market_offer_wide_message_at + 1
  :: else -> break
  od;
  assert(top_of_market_offer_wide_message_read.mbbo_condition == top_of_market_offer_wide_message_written.mbbo_condition);
  skip
}

/* ---- Last Sale Message: 27 bytes --------------------------------------------- */

/* This is the message format that will be used to disseminate Trades that are resulting from executions on MIAX during the current trading session. */
typedef LastSaleMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte trade_id[4];
  byte correction_number;
  byte reference_trade_id[4];
  byte reference_correction_number;
  byte trade_price[4];
  byte trade_size[4];
  byte trade_condition
};

int last_sale_message_at;

/* every byte of Last Sale Message set to one value */
inline fill_last_sale_message(last_sale_message_record, last_sale_message_value) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.nanoseconds[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.product_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.correction_number = last_sale_message_value;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.reference_trade_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.reference_correction_number = last_sale_message_value;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_price[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_size[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.trade_condition = last_sale_message_value;
  skip
}

/* each byte of Last Sale Message set to where it lies, so a field read out of place says so */
inline ramp_last_sale_message(last_sale_message_record, last_sale_message_base) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.nanoseconds[last_sale_message_at] = (last_sale_message_base + 0 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.product_id[last_sale_message_at] = (last_sale_message_base + 4 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_id[last_sale_message_at] = (last_sale_message_base + 8 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.correction_number = (last_sale_message_base + 12 + 1) % 256;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.reference_trade_id[last_sale_message_at] = (last_sale_message_base + 13 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.reference_correction_number = (last_sale_message_base + 17 + 1) % 256;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_price[last_sale_message_at] = (last_sale_message_base + 18 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_size[last_sale_message_at] = (last_sale_message_base + 22 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.trade_condition = (last_sale_message_base + 26 + 1) % 256;
  skip
}

/* Last Sale Message to the wire, 27 bytes from where the cursor stands */
inline encode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.nanoseconds[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.product_id[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.trade_id[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = last_sale_message_record.correction_number; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.reference_trade_id[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = last_sale_message_record.reference_correction_number; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.trade_price[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.trade_size[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = last_sale_message_record.trade_condition; at = at + 1;
  skip
}

/* Last Sale Message off the wire, 27 bytes from where the cursor stands */
inline decode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.nanoseconds[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.product_id[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_id[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.correction_number = wire[at]; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.reference_trade_id[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.reference_correction_number = wire[at]; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_price[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_size[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Last Sale Message is what was written, byte for byte */
inline equal_last_sale_message(last_sale_message_read, last_sale_message_written) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.nanoseconds[last_sale_message_at] == last_sale_message_written.nanoseconds[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.product_id[last_sale_message_at] == last_sale_message_written.product_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.trade_id[last_sale_message_at] == last_sale_message_written.trade_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  assert(last_sale_message_read.correction_number == last_sale_message_written.correction_number);
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.reference_trade_id[last_sale_message_at] == last_sale_message_written.reference_trade_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  assert(last_sale_message_read.reference_correction_number == last_sale_message_written.reference_correction_number);
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.trade_price[last_sale_message_at] == last_sale_message_written.trade_price[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.trade_size[last_sale_message_at] == last_sale_message_written.trade_size[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  assert(last_sale_message_read.trade_condition == last_sale_message_written.trade_condition);
  skip
}

/* ---- Trade Cancel Message: 22 bytes ------------------------------------------ */

/* This is the message format that will be used to disseminate canceled Trades that are resulting from Trade cancellations or corrections on MIAX during the current trading session */
typedef TradeCancelMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte trade_id[4];
  byte correction_number;
  byte trade_price[4];
  byte trade_size[4];
  byte trade_condition
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
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.product_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = trade_cancel_message_value;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_price[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_size[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.trade_condition = trade_cancel_message_value;
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
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.product_id[trade_cancel_message_at] = (trade_cancel_message_base + 4 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = (trade_cancel_message_base + 8 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = (trade_cancel_message_base + 12 + 1) % 256;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_price[trade_cancel_message_at] = (trade_cancel_message_base + 13 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_size[trade_cancel_message_at] = (trade_cancel_message_base + 17 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.trade_condition = (trade_cancel_message_base + 21 + 1) % 256;
  skip
}

/* Trade Cancel Message to the wire, 22 bytes from where the cursor stands */
inline encode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.nanoseconds[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.product_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.trade_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_message_record.correction_number; at = at + 1;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.trade_price[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.trade_size[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_message_record.trade_condition; at = at + 1;
  skip
}

/* Trade Cancel Message off the wire, 22 bytes from where the cursor stands */
inline decode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.nanoseconds[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.product_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = wire[at]; at = at + 1;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_price[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.trade_size[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.trade_condition = wire[at]; at = at + 1;
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
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.product_id[trade_cancel_message_at] == trade_cancel_message_written.product_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.trade_id[trade_cancel_message_at] == trade_cancel_message_written.trade_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_message_read.correction_number == trade_cancel_message_written.correction_number);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.trade_price[trade_cancel_message_at] == trade_cancel_message_written.trade_price[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.trade_size[trade_cancel_message_at] == trade_cancel_message_written.trade_size[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_message_read.trade_condition == trade_cancel_message_written.trade_condition);
  skip
}

/* ---- Liquidity Seeking Event Notification Message: 46 bytes ------------------ */

/* This is the message format that will be used to disseminate information each time a Liquidity seeking event (defined in Event Type field below) starts at MIAX. */
typedef LiquiditySeekingEventNotificationMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte event_type;
  byte event_id[4];
  byte price[4];
  byte imbalance_side;
  byte quantity_1[4];
  byte quantity_2[4];
  byte quantity_3[4];
  byte quantity_4[4];
  byte reserved_12[12]
};

int liquidity_seeking_event_notification_message_at;

/* every byte of Liquidity Seeking Event Notification Message set to one value */
inline fill_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_record, liquidity_seeking_event_notification_message_value) {
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.nanoseconds[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.product_id[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_record.event_type = liquidity_seeking_event_notification_message_value;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.event_id[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.price[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_record.imbalance_side = liquidity_seeking_event_notification_message_value;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_1[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_2[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_3[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_4[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 12 -> liquidity_seeking_event_notification_message_record.reserved_12[liquidity_seeking_event_notification_message_at] = liquidity_seeking_event_notification_message_value; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Liquidity Seeking Event Notification Message set to where it lies, so a field read out of place says so */
inline ramp_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_record, liquidity_seeking_event_notification_message_base) {
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.nanoseconds[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 0 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.product_id[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 4 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_record.event_type = (liquidity_seeking_event_notification_message_base + 8 + 1) % 256;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.event_id[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 9 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.price[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 13 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_record.imbalance_side = (liquidity_seeking_event_notification_message_base + 17 + 1) % 256;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_1[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 18 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_2[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 22 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_3[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 26 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_4[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 30 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 12 -> liquidity_seeking_event_notification_message_record.reserved_12[liquidity_seeking_event_notification_message_at] = (liquidity_seeking_event_notification_message_base + 34 + liquidity_seeking_event_notification_message_at + 1) % 256; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Seeking Event Notification Message to the wire, 46 bytes from where the cursor stands */
inline encode_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_record) {
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.nanoseconds[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.product_id[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_seeking_event_notification_message_record.event_type; at = at + 1;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.event_id[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.price[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_seeking_event_notification_message_record.imbalance_side; at = at + 1;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.quantity_1[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.quantity_2[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.quantity_3[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> wire[at] = liquidity_seeking_event_notification_message_record.quantity_4[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 12 -> wire[at] = liquidity_seeking_event_notification_message_record.reserved_12[liquidity_seeking_event_notification_message_at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Seeking Event Notification Message off the wire, 46 bytes from where the cursor stands */
inline decode_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_record) {
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.nanoseconds[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.product_id[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_record.event_type = wire[at]; at = at + 1;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.event_id[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.price[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_record.imbalance_side = wire[at]; at = at + 1;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_1[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_2[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_3[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> liquidity_seeking_event_notification_message_record.quantity_4[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 12 -> liquidity_seeking_event_notification_message_record.reserved_12[liquidity_seeking_event_notification_message_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Liquidity Seeking Event Notification Message is what was written, byte for byte */
inline equal_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_read, liquidity_seeking_event_notification_message_written) {
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.nanoseconds[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.nanoseconds[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.product_id[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.product_id[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  assert(liquidity_seeking_event_notification_message_read.event_type == liquidity_seeking_event_notification_message_written.event_type);
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.event_id[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.event_id[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.price[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.price[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  assert(liquidity_seeking_event_notification_message_read.imbalance_side == liquidity_seeking_event_notification_message_written.imbalance_side);
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.quantity_1[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.quantity_1[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.quantity_2[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.quantity_2[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.quantity_3[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.quantity_3[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 4 -> assert(liquidity_seeking_event_notification_message_read.quantity_4[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.quantity_4[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_message_at = 0;
  do
  :: liquidity_seeking_event_notification_message_at < 12 -> assert(liquidity_seeking_event_notification_message_read.reserved_12[liquidity_seeking_event_notification_message_at] == liquidity_seeking_event_notification_message_written.reserved_12[liquidity_seeking_event_notification_message_at]); liquidity_seeking_event_notification_message_at = liquidity_seeking_event_notification_message_at + 1
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

/* Top Of Market Bid Compact Message: encoded, read back, and compared */
proctype check_top_of_market_bid_compact_message() {
  TopOfMarketBidCompactMessage top_of_market_bid_compact_message_sent;
  TopOfMarketBidCompactMessage top_of_market_bid_compact_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_market_bid_compact_message(top_of_market_bid_compact_message_sent, 0)
  :: pattern == 1 -> fill_top_of_market_bid_compact_message(top_of_market_bid_compact_message_sent, 32)
  :: pattern == 2 -> fill_top_of_market_bid_compact_message(top_of_market_bid_compact_message_sent, 255)
  :: else -> ramp_top_of_market_bid_compact_message(top_of_market_bid_compact_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_market_bid_compact_message(top_of_market_bid_compact_message_sent);
    assert(at == 15);
    at = 0;
    decode_top_of_market_bid_compact_message(top_of_market_bid_compact_message_got);
    assert(at == 15);
    equal_top_of_market_bid_compact_message(top_of_market_bid_compact_message_got, top_of_market_bid_compact_message_sent)
  }
}

/* Top Of Market Offer Compact Message: encoded, read back, and compared */
proctype check_top_of_market_offer_compact_message() {
  TopOfMarketOfferCompactMessage top_of_market_offer_compact_message_sent;
  TopOfMarketOfferCompactMessage top_of_market_offer_compact_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_market_offer_compact_message(top_of_market_offer_compact_message_sent, 0)
  :: pattern == 1 -> fill_top_of_market_offer_compact_message(top_of_market_offer_compact_message_sent, 32)
  :: pattern == 2 -> fill_top_of_market_offer_compact_message(top_of_market_offer_compact_message_sent, 255)
  :: else -> ramp_top_of_market_offer_compact_message(top_of_market_offer_compact_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_market_offer_compact_message(top_of_market_offer_compact_message_sent);
    assert(at == 15);
    at = 0;
    decode_top_of_market_offer_compact_message(top_of_market_offer_compact_message_got);
    assert(at == 15);
    equal_top_of_market_offer_compact_message(top_of_market_offer_compact_message_got, top_of_market_offer_compact_message_sent)
  }
}

/* Top Of Market Bid Wide Message: encoded, read back, and compared */
proctype check_top_of_market_bid_wide_message() {
  TopOfMarketBidWideMessage top_of_market_bid_wide_message_sent;
  TopOfMarketBidWideMessage top_of_market_bid_wide_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_market_bid_wide_message(top_of_market_bid_wide_message_sent, 0)
  :: pattern == 1 -> fill_top_of_market_bid_wide_message(top_of_market_bid_wide_message_sent, 32)
  :: pattern == 2 -> fill_top_of_market_bid_wide_message(top_of_market_bid_wide_message_sent, 255)
  :: else -> ramp_top_of_market_bid_wide_message(top_of_market_bid_wide_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_market_bid_wide_message(top_of_market_bid_wide_message_sent);
    assert(at == 21);
    at = 0;
    decode_top_of_market_bid_wide_message(top_of_market_bid_wide_message_got);
    assert(at == 21);
    equal_top_of_market_bid_wide_message(top_of_market_bid_wide_message_got, top_of_market_bid_wide_message_sent)
  }
}

/* Top Of Market Offer Wide Message: encoded, read back, and compared */
proctype check_top_of_market_offer_wide_message() {
  TopOfMarketOfferWideMessage top_of_market_offer_wide_message_sent;
  TopOfMarketOfferWideMessage top_of_market_offer_wide_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_market_offer_wide_message(top_of_market_offer_wide_message_sent, 0)
  :: pattern == 1 -> fill_top_of_market_offer_wide_message(top_of_market_offer_wide_message_sent, 32)
  :: pattern == 2 -> fill_top_of_market_offer_wide_message(top_of_market_offer_wide_message_sent, 255)
  :: else -> ramp_top_of_market_offer_wide_message(top_of_market_offer_wide_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_market_offer_wide_message(top_of_market_offer_wide_message_sent);
    assert(at == 21);
    at = 0;
    decode_top_of_market_offer_wide_message(top_of_market_offer_wide_message_got);
    assert(at == 21);
    equal_top_of_market_offer_wide_message(top_of_market_offer_wide_message_got, top_of_market_offer_wide_message_sent)
  }
}

/* Last Sale Message: encoded, read back, and compared */
proctype check_last_sale_message() {
  LastSaleMessage last_sale_message_sent;
  LastSaleMessage last_sale_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_sale_message(last_sale_message_sent, 0)
  :: pattern == 1 -> fill_last_sale_message(last_sale_message_sent, 32)
  :: pattern == 2 -> fill_last_sale_message(last_sale_message_sent, 255)
  :: else -> ramp_last_sale_message(last_sale_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_sale_message(last_sale_message_sent);
    assert(at == 27);
    at = 0;
    decode_last_sale_message(last_sale_message_got);
    assert(at == 27);
    equal_last_sale_message(last_sale_message_got, last_sale_message_sent)
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
    assert(at == 22);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 22);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* Liquidity Seeking Event Notification Message: encoded, read back, and compared */
proctype check_liquidity_seeking_event_notification_message() {
  LiquiditySeekingEventNotificationMessage liquidity_seeking_event_notification_message_sent;
  LiquiditySeekingEventNotificationMessage liquidity_seeking_event_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_sent, 0)
  :: pattern == 1 -> fill_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_sent, 32)
  :: pattern == 2 -> fill_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_sent, 255)
  :: else -> ramp_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_sent);
    assert(at == 46);
    at = 0;
    decode_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_got);
    assert(at == 46);
    equal_liquidity_seeking_event_notification_message(liquidity_seeking_event_notification_message_got, liquidity_seeking_event_notification_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_system_time_message()
  :: run check_series_update_message()
  :: run check_system_state_message()
  :: run check_top_of_market_bid_compact_message()
  :: run check_top_of_market_offer_compact_message()
  :: run check_top_of_market_bid_wide_message()
  :: run check_top_of_market_offer_wide_message()
  :: run check_last_sale_message()
  :: run check_trade_cancel_message()
  :: run check_liquidity_seeking_event_notification_message()
  fi
}
