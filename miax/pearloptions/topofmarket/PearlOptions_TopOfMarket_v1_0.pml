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

/* This is the message format that will be used to disseminate all Option series traded on PEARL for the current session. The product ID sent in this message is what will be disseminated in Top of Market BBO and Last Sale messages. */
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
  byte active_on_pearl;
  byte pearl_bbo_posting_increment_indicator;
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
  series_update_message_record.active_on_pearl = series_update_message_value;
  series_update_message_record.pearl_bbo_posting_increment_indicator = series_update_message_value;
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
  series_update_message_record.active_on_pearl = (series_update_message_base + 56 + 1) % 256;
  series_update_message_record.pearl_bbo_posting_increment_indicator = (series_update_message_base + 57 + 1) % 256;
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
  wire[at] = series_update_message_record.active_on_pearl; at = at + 1;
  wire[at] = series_update_message_record.pearl_bbo_posting_increment_indicator; at = at + 1;
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
  series_update_message_record.active_on_pearl = wire[at]; at = at + 1;
  series_update_message_record.pearl_bbo_posting_increment_indicator = wire[at]; at = at + 1;
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
  assert(series_update_message_read.active_on_pearl == series_update_message_written.active_on_pearl);
  assert(series_update_message_read.pearl_bbo_posting_increment_indicator == series_update_message_written.pearl_bbo_posting_increment_indicator);
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

/* ---- Compact Top Of Market Bid Message: 15 bytes ----------------------------- */

/* This is the message format that will be used to disseminate each side of the PEARL Top of Market for options with low premiums and small aggregate PEARL Best Bid or Offer (PBBO) size. */
typedef CompactTopOfMarketBidMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte pbbo_price[2];
  byte pbbo_size[2];
  byte pbbo_priority_customer_size[2];
  byte pbbo_condition
};

int compact_top_of_market_bid_message_at;

/* every byte of Compact Top Of Market Bid Message set to one value */
inline fill_compact_top_of_market_bid_message(compact_top_of_market_bid_message_record, compact_top_of_market_bid_message_value) {
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> compact_top_of_market_bid_message_record.nanoseconds[compact_top_of_market_bid_message_at] = compact_top_of_market_bid_message_value; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> compact_top_of_market_bid_message_record.product_id[compact_top_of_market_bid_message_at] = compact_top_of_market_bid_message_value; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_price[compact_top_of_market_bid_message_at] = compact_top_of_market_bid_message_value; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_size[compact_top_of_market_bid_message_at] = compact_top_of_market_bid_message_value; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_priority_customer_size[compact_top_of_market_bid_message_at] = compact_top_of_market_bid_message_value; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_record.pbbo_condition = compact_top_of_market_bid_message_value;
  skip
}

/* each byte of Compact Top Of Market Bid Message set to where it lies, so a field read out of place says so */
inline ramp_compact_top_of_market_bid_message(compact_top_of_market_bid_message_record, compact_top_of_market_bid_message_base) {
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> compact_top_of_market_bid_message_record.nanoseconds[compact_top_of_market_bid_message_at] = (compact_top_of_market_bid_message_base + 0 + compact_top_of_market_bid_message_at + 1) % 256; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> compact_top_of_market_bid_message_record.product_id[compact_top_of_market_bid_message_at] = (compact_top_of_market_bid_message_base + 4 + compact_top_of_market_bid_message_at + 1) % 256; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_price[compact_top_of_market_bid_message_at] = (compact_top_of_market_bid_message_base + 8 + compact_top_of_market_bid_message_at + 1) % 256; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_size[compact_top_of_market_bid_message_at] = (compact_top_of_market_bid_message_base + 10 + compact_top_of_market_bid_message_at + 1) % 256; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_priority_customer_size[compact_top_of_market_bid_message_at] = (compact_top_of_market_bid_message_base + 12 + compact_top_of_market_bid_message_at + 1) % 256; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_record.pbbo_condition = (compact_top_of_market_bid_message_base + 14 + 1) % 256;
  skip
}

/* Compact Top Of Market Bid Message to the wire, 15 bytes from where the cursor stands */
inline encode_compact_top_of_market_bid_message(compact_top_of_market_bid_message_record) {
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> wire[at] = compact_top_of_market_bid_message_record.nanoseconds[compact_top_of_market_bid_message_at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> wire[at] = compact_top_of_market_bid_message_record.product_id[compact_top_of_market_bid_message_at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> wire[at] = compact_top_of_market_bid_message_record.pbbo_price[compact_top_of_market_bid_message_at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> wire[at] = compact_top_of_market_bid_message_record.pbbo_size[compact_top_of_market_bid_message_at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> wire[at] = compact_top_of_market_bid_message_record.pbbo_priority_customer_size[compact_top_of_market_bid_message_at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = compact_top_of_market_bid_message_record.pbbo_condition; at = at + 1;
  skip
}

/* Compact Top Of Market Bid Message off the wire, 15 bytes from where the cursor stands */
inline decode_compact_top_of_market_bid_message(compact_top_of_market_bid_message_record) {
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> compact_top_of_market_bid_message_record.nanoseconds[compact_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> compact_top_of_market_bid_message_record.product_id[compact_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_price[compact_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_size[compact_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> compact_top_of_market_bid_message_record.pbbo_priority_customer_size[compact_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_record.pbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Compact Top Of Market Bid Message is what was written, byte for byte */
inline equal_compact_top_of_market_bid_message(compact_top_of_market_bid_message_read, compact_top_of_market_bid_message_written) {
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> assert(compact_top_of_market_bid_message_read.nanoseconds[compact_top_of_market_bid_message_at] == compact_top_of_market_bid_message_written.nanoseconds[compact_top_of_market_bid_message_at]); compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 4 -> assert(compact_top_of_market_bid_message_read.product_id[compact_top_of_market_bid_message_at] == compact_top_of_market_bid_message_written.product_id[compact_top_of_market_bid_message_at]); compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> assert(compact_top_of_market_bid_message_read.pbbo_price[compact_top_of_market_bid_message_at] == compact_top_of_market_bid_message_written.pbbo_price[compact_top_of_market_bid_message_at]); compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> assert(compact_top_of_market_bid_message_read.pbbo_size[compact_top_of_market_bid_message_at] == compact_top_of_market_bid_message_written.pbbo_size[compact_top_of_market_bid_message_at]); compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_bid_message_at = 0;
  do
  :: compact_top_of_market_bid_message_at < 2 -> assert(compact_top_of_market_bid_message_read.pbbo_priority_customer_size[compact_top_of_market_bid_message_at] == compact_top_of_market_bid_message_written.pbbo_priority_customer_size[compact_top_of_market_bid_message_at]); compact_top_of_market_bid_message_at = compact_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  assert(compact_top_of_market_bid_message_read.pbbo_condition == compact_top_of_market_bid_message_written.pbbo_condition);
  skip
}

/* ---- Compact Top Of Market Best Offer Message: 15 bytes ---------------------- */

/* This is the message format that will be used to disseminate each side of the PEARL Top of Market for options with low premiums and small aggregate PEARL Best Bid or Offer (PBBO) size. */
typedef CompactTopOfMarketBestOfferMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte pbbo_price[2];
  byte pbbo_size[2];
  byte pbbo_priority_customer_size[2];
  byte pbbo_condition
};

int compact_top_of_market_best_offer_message_at;

/* every byte of Compact Top Of Market Best Offer Message set to one value */
inline fill_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_record, compact_top_of_market_best_offer_message_value) {
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> compact_top_of_market_best_offer_message_record.nanoseconds[compact_top_of_market_best_offer_message_at] = compact_top_of_market_best_offer_message_value; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> compact_top_of_market_best_offer_message_record.product_id[compact_top_of_market_best_offer_message_at] = compact_top_of_market_best_offer_message_value; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_price[compact_top_of_market_best_offer_message_at] = compact_top_of_market_best_offer_message_value; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_size[compact_top_of_market_best_offer_message_at] = compact_top_of_market_best_offer_message_value; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_priority_customer_size[compact_top_of_market_best_offer_message_at] = compact_top_of_market_best_offer_message_value; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_record.pbbo_condition = compact_top_of_market_best_offer_message_value;
  skip
}

/* each byte of Compact Top Of Market Best Offer Message set to where it lies, so a field read out of place says so */
inline ramp_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_record, compact_top_of_market_best_offer_message_base) {
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> compact_top_of_market_best_offer_message_record.nanoseconds[compact_top_of_market_best_offer_message_at] = (compact_top_of_market_best_offer_message_base + 0 + compact_top_of_market_best_offer_message_at + 1) % 256; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> compact_top_of_market_best_offer_message_record.product_id[compact_top_of_market_best_offer_message_at] = (compact_top_of_market_best_offer_message_base + 4 + compact_top_of_market_best_offer_message_at + 1) % 256; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_price[compact_top_of_market_best_offer_message_at] = (compact_top_of_market_best_offer_message_base + 8 + compact_top_of_market_best_offer_message_at + 1) % 256; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_size[compact_top_of_market_best_offer_message_at] = (compact_top_of_market_best_offer_message_base + 10 + compact_top_of_market_best_offer_message_at + 1) % 256; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_priority_customer_size[compact_top_of_market_best_offer_message_at] = (compact_top_of_market_best_offer_message_base + 12 + compact_top_of_market_best_offer_message_at + 1) % 256; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_record.pbbo_condition = (compact_top_of_market_best_offer_message_base + 14 + 1) % 256;
  skip
}

/* Compact Top Of Market Best Offer Message to the wire, 15 bytes from where the cursor stands */
inline encode_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_record) {
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> wire[at] = compact_top_of_market_best_offer_message_record.nanoseconds[compact_top_of_market_best_offer_message_at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> wire[at] = compact_top_of_market_best_offer_message_record.product_id[compact_top_of_market_best_offer_message_at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> wire[at] = compact_top_of_market_best_offer_message_record.pbbo_price[compact_top_of_market_best_offer_message_at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> wire[at] = compact_top_of_market_best_offer_message_record.pbbo_size[compact_top_of_market_best_offer_message_at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> wire[at] = compact_top_of_market_best_offer_message_record.pbbo_priority_customer_size[compact_top_of_market_best_offer_message_at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = compact_top_of_market_best_offer_message_record.pbbo_condition; at = at + 1;
  skip
}

/* Compact Top Of Market Best Offer Message off the wire, 15 bytes from where the cursor stands */
inline decode_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_record) {
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> compact_top_of_market_best_offer_message_record.nanoseconds[compact_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> compact_top_of_market_best_offer_message_record.product_id[compact_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_price[compact_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_size[compact_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> compact_top_of_market_best_offer_message_record.pbbo_priority_customer_size[compact_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_record.pbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Compact Top Of Market Best Offer Message is what was written, byte for byte */
inline equal_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_read, compact_top_of_market_best_offer_message_written) {
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> assert(compact_top_of_market_best_offer_message_read.nanoseconds[compact_top_of_market_best_offer_message_at] == compact_top_of_market_best_offer_message_written.nanoseconds[compact_top_of_market_best_offer_message_at]); compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 4 -> assert(compact_top_of_market_best_offer_message_read.product_id[compact_top_of_market_best_offer_message_at] == compact_top_of_market_best_offer_message_written.product_id[compact_top_of_market_best_offer_message_at]); compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> assert(compact_top_of_market_best_offer_message_read.pbbo_price[compact_top_of_market_best_offer_message_at] == compact_top_of_market_best_offer_message_written.pbbo_price[compact_top_of_market_best_offer_message_at]); compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> assert(compact_top_of_market_best_offer_message_read.pbbo_size[compact_top_of_market_best_offer_message_at] == compact_top_of_market_best_offer_message_written.pbbo_size[compact_top_of_market_best_offer_message_at]); compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  compact_top_of_market_best_offer_message_at = 0;
  do
  :: compact_top_of_market_best_offer_message_at < 2 -> assert(compact_top_of_market_best_offer_message_read.pbbo_priority_customer_size[compact_top_of_market_best_offer_message_at] == compact_top_of_market_best_offer_message_written.pbbo_priority_customer_size[compact_top_of_market_best_offer_message_at]); compact_top_of_market_best_offer_message_at = compact_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  assert(compact_top_of_market_best_offer_message_read.pbbo_condition == compact_top_of_market_best_offer_message_written.pbbo_condition);
  skip
}

/* ---- Wide Top Of Market Best Bid Message: 21 bytes --------------------------- */

/* This is the message format that will be used, in the refresh service and during trading hours, to disseminate both sides of the PEARL Top of Market for options with low premiums and small aggregate PEARL Best Bid or Offer (PBBO) size. */
typedef WideTopOfMarketBestBidMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte wide_pbbo_price[4];
  byte wide_pbbo_size[4];
  byte wide_pbbo_priority_customer_size[4];
  byte pbbo_condition
};

int wide_top_of_market_best_bid_message_at;

/* every byte of Wide Top Of Market Best Bid Message set to one value */
inline fill_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_record, wide_top_of_market_best_bid_message_value) {
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.nanoseconds[wide_top_of_market_best_bid_message_at] = wide_top_of_market_best_bid_message_value; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.product_id[wide_top_of_market_best_bid_message_at] = wide_top_of_market_best_bid_message_value; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_price[wide_top_of_market_best_bid_message_at] = wide_top_of_market_best_bid_message_value; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_size[wide_top_of_market_best_bid_message_at] = wide_top_of_market_best_bid_message_value; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_bid_message_at] = wide_top_of_market_best_bid_message_value; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_record.pbbo_condition = wide_top_of_market_best_bid_message_value;
  skip
}

/* each byte of Wide Top Of Market Best Bid Message set to where it lies, so a field read out of place says so */
inline ramp_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_record, wide_top_of_market_best_bid_message_base) {
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.nanoseconds[wide_top_of_market_best_bid_message_at] = (wide_top_of_market_best_bid_message_base + 0 + wide_top_of_market_best_bid_message_at + 1) % 256; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.product_id[wide_top_of_market_best_bid_message_at] = (wide_top_of_market_best_bid_message_base + 4 + wide_top_of_market_best_bid_message_at + 1) % 256; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_price[wide_top_of_market_best_bid_message_at] = (wide_top_of_market_best_bid_message_base + 8 + wide_top_of_market_best_bid_message_at + 1) % 256; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_size[wide_top_of_market_best_bid_message_at] = (wide_top_of_market_best_bid_message_base + 12 + wide_top_of_market_best_bid_message_at + 1) % 256; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_bid_message_at] = (wide_top_of_market_best_bid_message_base + 16 + wide_top_of_market_best_bid_message_at + 1) % 256; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_record.pbbo_condition = (wide_top_of_market_best_bid_message_base + 20 + 1) % 256;
  skip
}

/* Wide Top Of Market Best Bid Message to the wire, 21 bytes from where the cursor stands */
inline encode_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_record) {
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_message_record.nanoseconds[wide_top_of_market_best_bid_message_at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_message_record.product_id[wide_top_of_market_best_bid_message_at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_message_record.wide_pbbo_price[wide_top_of_market_best_bid_message_at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_message_record.wide_pbbo_size[wide_top_of_market_best_bid_message_at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wire[at] = wide_top_of_market_best_bid_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_bid_message_at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = wide_top_of_market_best_bid_message_record.pbbo_condition; at = at + 1;
  skip
}

/* Wide Top Of Market Best Bid Message off the wire, 21 bytes from where the cursor stands */
inline decode_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_record) {
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.nanoseconds[wide_top_of_market_best_bid_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.product_id[wide_top_of_market_best_bid_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_price[wide_top_of_market_best_bid_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_size[wide_top_of_market_best_bid_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> wide_top_of_market_best_bid_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_bid_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_record.pbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Wide Top Of Market Best Bid Message is what was written, byte for byte */
inline equal_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_read, wide_top_of_market_best_bid_message_written) {
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> assert(wide_top_of_market_best_bid_message_read.nanoseconds[wide_top_of_market_best_bid_message_at] == wide_top_of_market_best_bid_message_written.nanoseconds[wide_top_of_market_best_bid_message_at]); wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> assert(wide_top_of_market_best_bid_message_read.product_id[wide_top_of_market_best_bid_message_at] == wide_top_of_market_best_bid_message_written.product_id[wide_top_of_market_best_bid_message_at]); wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> assert(wide_top_of_market_best_bid_message_read.wide_pbbo_price[wide_top_of_market_best_bid_message_at] == wide_top_of_market_best_bid_message_written.wide_pbbo_price[wide_top_of_market_best_bid_message_at]); wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> assert(wide_top_of_market_best_bid_message_read.wide_pbbo_size[wide_top_of_market_best_bid_message_at] == wide_top_of_market_best_bid_message_written.wide_pbbo_size[wide_top_of_market_best_bid_message_at]); wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_bid_message_at = 0;
  do
  :: wide_top_of_market_best_bid_message_at < 4 -> assert(wide_top_of_market_best_bid_message_read.wide_pbbo_priority_customer_size[wide_top_of_market_best_bid_message_at] == wide_top_of_market_best_bid_message_written.wide_pbbo_priority_customer_size[wide_top_of_market_best_bid_message_at]); wide_top_of_market_best_bid_message_at = wide_top_of_market_best_bid_message_at + 1
  :: else -> break
  od;
  assert(wide_top_of_market_best_bid_message_read.pbbo_condition == wide_top_of_market_best_bid_message_written.pbbo_condition);
  skip
}

/* ---- Wide Top Of Market Best Offer Message: 21 bytes ------------------------- */

/* This is the message format that will be used, in the refresh service and during trading hours, to disseminate both sides of the PEARL Top of Market for options with low premiums and small aggregate PEARL Best Bid or Offer (PBBO) size. */
typedef WideTopOfMarketBestOfferMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte wide_pbbo_price[4];
  byte wide_pbbo_size[4];
  byte wide_pbbo_priority_customer_size[4];
  byte pbbo_condition
};

int wide_top_of_market_best_offer_message_at;

/* every byte of Wide Top Of Market Best Offer Message set to one value */
inline fill_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_record, wide_top_of_market_best_offer_message_value) {
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.nanoseconds[wide_top_of_market_best_offer_message_at] = wide_top_of_market_best_offer_message_value; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.product_id[wide_top_of_market_best_offer_message_at] = wide_top_of_market_best_offer_message_value; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_price[wide_top_of_market_best_offer_message_at] = wide_top_of_market_best_offer_message_value; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_size[wide_top_of_market_best_offer_message_at] = wide_top_of_market_best_offer_message_value; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_offer_message_at] = wide_top_of_market_best_offer_message_value; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_record.pbbo_condition = wide_top_of_market_best_offer_message_value;
  skip
}

/* each byte of Wide Top Of Market Best Offer Message set to where it lies, so a field read out of place says so */
inline ramp_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_record, wide_top_of_market_best_offer_message_base) {
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.nanoseconds[wide_top_of_market_best_offer_message_at] = (wide_top_of_market_best_offer_message_base + 0 + wide_top_of_market_best_offer_message_at + 1) % 256; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.product_id[wide_top_of_market_best_offer_message_at] = (wide_top_of_market_best_offer_message_base + 4 + wide_top_of_market_best_offer_message_at + 1) % 256; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_price[wide_top_of_market_best_offer_message_at] = (wide_top_of_market_best_offer_message_base + 8 + wide_top_of_market_best_offer_message_at + 1) % 256; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_size[wide_top_of_market_best_offer_message_at] = (wide_top_of_market_best_offer_message_base + 12 + wide_top_of_market_best_offer_message_at + 1) % 256; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_offer_message_at] = (wide_top_of_market_best_offer_message_base + 16 + wide_top_of_market_best_offer_message_at + 1) % 256; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_record.pbbo_condition = (wide_top_of_market_best_offer_message_base + 20 + 1) % 256;
  skip
}

/* Wide Top Of Market Best Offer Message to the wire, 21 bytes from where the cursor stands */
inline encode_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_record) {
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_offer_message_record.nanoseconds[wide_top_of_market_best_offer_message_at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_offer_message_record.product_id[wide_top_of_market_best_offer_message_at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_offer_message_record.wide_pbbo_price[wide_top_of_market_best_offer_message_at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_offer_message_record.wide_pbbo_size[wide_top_of_market_best_offer_message_at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wire[at] = wide_top_of_market_best_offer_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_offer_message_at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = wide_top_of_market_best_offer_message_record.pbbo_condition; at = at + 1;
  skip
}

/* Wide Top Of Market Best Offer Message off the wire, 21 bytes from where the cursor stands */
inline decode_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_record) {
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.nanoseconds[wide_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.product_id[wide_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_price[wide_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_size[wide_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> wide_top_of_market_best_offer_message_record.wide_pbbo_priority_customer_size[wide_top_of_market_best_offer_message_at] = wire[at]; at = at + 1; wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_record.pbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Wide Top Of Market Best Offer Message is what was written, byte for byte */
inline equal_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_read, wide_top_of_market_best_offer_message_written) {
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> assert(wide_top_of_market_best_offer_message_read.nanoseconds[wide_top_of_market_best_offer_message_at] == wide_top_of_market_best_offer_message_written.nanoseconds[wide_top_of_market_best_offer_message_at]); wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> assert(wide_top_of_market_best_offer_message_read.product_id[wide_top_of_market_best_offer_message_at] == wide_top_of_market_best_offer_message_written.product_id[wide_top_of_market_best_offer_message_at]); wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> assert(wide_top_of_market_best_offer_message_read.wide_pbbo_price[wide_top_of_market_best_offer_message_at] == wide_top_of_market_best_offer_message_written.wide_pbbo_price[wide_top_of_market_best_offer_message_at]); wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> assert(wide_top_of_market_best_offer_message_read.wide_pbbo_size[wide_top_of_market_best_offer_message_at] == wide_top_of_market_best_offer_message_written.wide_pbbo_size[wide_top_of_market_best_offer_message_at]); wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  wide_top_of_market_best_offer_message_at = 0;
  do
  :: wide_top_of_market_best_offer_message_at < 4 -> assert(wide_top_of_market_best_offer_message_read.wide_pbbo_priority_customer_size[wide_top_of_market_best_offer_message_at] == wide_top_of_market_best_offer_message_written.wide_pbbo_priority_customer_size[wide_top_of_market_best_offer_message_at]); wide_top_of_market_best_offer_message_at = wide_top_of_market_best_offer_message_at + 1
  :: else -> break
  od;
  assert(wide_top_of_market_best_offer_message_read.pbbo_condition == wide_top_of_market_best_offer_message_written.pbbo_condition);
  skip
}

/* ---- Compact Double Sided Top Of Market Message: 22 bytes -------------------- */

/* This is the message format that will be used, in the refresh service and during trading hours, to disseminate both sides of the PEARL Top of Market for options with low premiums and small aggregate PEARL Best Bid or Offer (PBBO) size. */
typedef CompactDoubleSidedTopOfMarketMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte bid_price[2];
  byte bid_size[2];
  byte bid_priority_customer_size[2];
  byte bid_condition;
  byte offer_price[2];
  byte offer_size[2];
  byte offer_priority_customer_size[2];
  byte offer_condition
};

int compact_double_sided_top_of_market_message_at;

/* every byte of Compact Double Sided Top Of Market Message set to one value */
inline fill_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_record, compact_double_sided_top_of_market_message_value) {
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> compact_double_sided_top_of_market_message_record.nanoseconds[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> compact_double_sided_top_of_market_message_record.product_id[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_price[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_size[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_priority_customer_size[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_record.bid_condition = compact_double_sided_top_of_market_message_value;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_price[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_size[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_priority_customer_size[compact_double_sided_top_of_market_message_at] = compact_double_sided_top_of_market_message_value; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_record.offer_condition = compact_double_sided_top_of_market_message_value;
  skip
}

/* each byte of Compact Double Sided Top Of Market Message set to where it lies, so a field read out of place says so */
inline ramp_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_record, compact_double_sided_top_of_market_message_base) {
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> compact_double_sided_top_of_market_message_record.nanoseconds[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 0 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> compact_double_sided_top_of_market_message_record.product_id[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 4 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_price[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 8 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_size[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 10 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_priority_customer_size[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 12 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_record.bid_condition = (compact_double_sided_top_of_market_message_base + 14 + 1) % 256;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_price[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 15 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_size[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 17 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_priority_customer_size[compact_double_sided_top_of_market_message_at] = (compact_double_sided_top_of_market_message_base + 19 + compact_double_sided_top_of_market_message_at + 1) % 256; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_record.offer_condition = (compact_double_sided_top_of_market_message_base + 21 + 1) % 256;
  skip
}

/* Compact Double Sided Top Of Market Message to the wire, 22 bytes from where the cursor stands */
inline encode_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_record) {
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> wire[at] = compact_double_sided_top_of_market_message_record.nanoseconds[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> wire[at] = compact_double_sided_top_of_market_message_record.product_id[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> wire[at] = compact_double_sided_top_of_market_message_record.bid_price[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> wire[at] = compact_double_sided_top_of_market_message_record.bid_size[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> wire[at] = compact_double_sided_top_of_market_message_record.bid_priority_customer_size[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wire[at] = compact_double_sided_top_of_market_message_record.bid_condition; at = at + 1;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> wire[at] = compact_double_sided_top_of_market_message_record.offer_price[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> wire[at] = compact_double_sided_top_of_market_message_record.offer_size[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> wire[at] = compact_double_sided_top_of_market_message_record.offer_priority_customer_size[compact_double_sided_top_of_market_message_at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wire[at] = compact_double_sided_top_of_market_message_record.offer_condition; at = at + 1;
  skip
}

/* Compact Double Sided Top Of Market Message off the wire, 22 bytes from where the cursor stands */
inline decode_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_record) {
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> compact_double_sided_top_of_market_message_record.nanoseconds[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> compact_double_sided_top_of_market_message_record.product_id[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_price[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_size[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.bid_priority_customer_size[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_record.bid_condition = wire[at]; at = at + 1;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_price[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_size[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> compact_double_sided_top_of_market_message_record.offer_priority_customer_size[compact_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Compact Double Sided Top Of Market Message is what was written, byte for byte */
inline equal_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_read, compact_double_sided_top_of_market_message_written) {
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> assert(compact_double_sided_top_of_market_message_read.nanoseconds[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.nanoseconds[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 4 -> assert(compact_double_sided_top_of_market_message_read.product_id[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.product_id[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> assert(compact_double_sided_top_of_market_message_read.bid_price[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.bid_price[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> assert(compact_double_sided_top_of_market_message_read.bid_size[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.bid_size[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> assert(compact_double_sided_top_of_market_message_read.bid_priority_customer_size[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.bid_priority_customer_size[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  assert(compact_double_sided_top_of_market_message_read.bid_condition == compact_double_sided_top_of_market_message_written.bid_condition);
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> assert(compact_double_sided_top_of_market_message_read.offer_price[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.offer_price[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> assert(compact_double_sided_top_of_market_message_read.offer_size[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.offer_size[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_double_sided_top_of_market_message_at = 0;
  do
  :: compact_double_sided_top_of_market_message_at < 2 -> assert(compact_double_sided_top_of_market_message_read.offer_priority_customer_size[compact_double_sided_top_of_market_message_at] == compact_double_sided_top_of_market_message_written.offer_priority_customer_size[compact_double_sided_top_of_market_message_at]); compact_double_sided_top_of_market_message_at = compact_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  assert(compact_double_sided_top_of_market_message_read.offer_condition == compact_double_sided_top_of_market_message_written.offer_condition);
  skip
}

/* ---- Wide Double Sided Top Of Market Message: 34 bytes ----------------------- */

/* This is the message format that will be used, in the refresh service and during trading hours, to disseminate both sides of the PEARL Top of Market for options with high premiums or large aggregate PEARL Best Bid or Offer (PBBO) sizes. */
typedef WideDoubleSidedTopOfMarketMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte wide_bid_price[4];
  byte wide_bid_size[4];
  byte wide_bid_priority_customer_size[4];
  byte bid_condition;
  byte wide_offer_price[4];
  byte wide_offer_size[4];
  byte wide_offer_priority_customer_size[4];
  byte offer_condition
};

int wide_double_sided_top_of_market_message_at;

/* every byte of Wide Double Sided Top Of Market Message set to one value */
inline fill_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_record, wide_double_sided_top_of_market_message_value) {
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.nanoseconds[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.product_id[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_price[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_size[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_priority_customer_size[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_record.bid_condition = wide_double_sided_top_of_market_message_value;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_price[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_size[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_priority_customer_size[wide_double_sided_top_of_market_message_at] = wide_double_sided_top_of_market_message_value; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_record.offer_condition = wide_double_sided_top_of_market_message_value;
  skip
}

/* each byte of Wide Double Sided Top Of Market Message set to where it lies, so a field read out of place says so */
inline ramp_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_record, wide_double_sided_top_of_market_message_base) {
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.nanoseconds[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 0 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.product_id[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 4 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_price[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 8 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_size[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 12 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_priority_customer_size[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 16 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_record.bid_condition = (wide_double_sided_top_of_market_message_base + 20 + 1) % 256;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_price[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 21 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_size[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 25 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_priority_customer_size[wide_double_sided_top_of_market_message_at] = (wide_double_sided_top_of_market_message_base + 29 + wide_double_sided_top_of_market_message_at + 1) % 256; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_record.offer_condition = (wide_double_sided_top_of_market_message_base + 33 + 1) % 256;
  skip
}

/* Wide Double Sided Top Of Market Message to the wire, 34 bytes from where the cursor stands */
inline encode_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_record) {
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.nanoseconds[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.product_id[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.wide_bid_price[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.wide_bid_size[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.wide_bid_priority_customer_size[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wire[at] = wide_double_sided_top_of_market_message_record.bid_condition; at = at + 1;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.wide_offer_price[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.wide_offer_size[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_double_sided_top_of_market_message_record.wide_offer_priority_customer_size[wide_double_sided_top_of_market_message_at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wire[at] = wide_double_sided_top_of_market_message_record.offer_condition; at = at + 1;
  skip
}

/* Wide Double Sided Top Of Market Message off the wire, 34 bytes from where the cursor stands */
inline decode_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_record) {
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.nanoseconds[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.product_id[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_price[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_size[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_bid_priority_customer_size[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_record.bid_condition = wire[at]; at = at + 1;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_price[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_size[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> wide_double_sided_top_of_market_message_record.wide_offer_priority_customer_size[wide_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Wide Double Sided Top Of Market Message is what was written, byte for byte */
inline equal_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_read, wide_double_sided_top_of_market_message_written) {
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.nanoseconds[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.nanoseconds[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.product_id[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.product_id[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.wide_bid_price[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.wide_bid_price[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.wide_bid_size[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.wide_bid_size[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.wide_bid_priority_customer_size[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.wide_bid_priority_customer_size[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  assert(wide_double_sided_top_of_market_message_read.bid_condition == wide_double_sided_top_of_market_message_written.bid_condition);
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.wide_offer_price[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.wide_offer_price[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.wide_offer_size[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.wide_offer_size[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_double_sided_top_of_market_message_at = 0;
  do
  :: wide_double_sided_top_of_market_message_at < 4 -> assert(wide_double_sided_top_of_market_message_read.wide_offer_priority_customer_size[wide_double_sided_top_of_market_message_at] == wide_double_sided_top_of_market_message_written.wide_offer_priority_customer_size[wide_double_sided_top_of_market_message_at]); wide_double_sided_top_of_market_message_at = wide_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  assert(wide_double_sided_top_of_market_message_read.offer_condition == wide_double_sided_top_of_market_message_written.offer_condition);
  skip
}

/* ---- Last Sale Message: 27 bytes --------------------------------------------- */

/* This is the message format that will be used to disseminate Trades that are resulting from executions on PEARL during the current trading session. */
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

/* This is the message format that will be used to disseminate canceled Trades that are resulting from Trade cancellations or corrections on PEARL during the current trading session. */
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

/* ---- Underlying Trading Status Notification: 25 bytes ------------------------ */

/* This message format will be used to notify firms of changes to the trading status of all the options of an underlying. */
typedef UnderlyingTradingStatusNotification {
  byte nanoseconds[4];
  byte underlying_symbol[11];
  byte trading_status;
  byte event_reason;
  byte expected_event_time_seconds_part[4];
  byte expected_event_time_nano_seconds_part[4]
};

int underlying_trading_status_notification_at;

/* every byte of Underlying Trading Status Notification set to one value */
inline fill_underlying_trading_status_notification(underlying_trading_status_notification_record, underlying_trading_status_notification_value) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.nanoseconds[underlying_trading_status_notification_at] = underlying_trading_status_notification_value; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 11 -> underlying_trading_status_notification_record.underlying_symbol[underlying_trading_status_notification_at] = underlying_trading_status_notification_value; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_record.trading_status = underlying_trading_status_notification_value;
  underlying_trading_status_notification_record.event_reason = underlying_trading_status_notification_value;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.expected_event_time_seconds_part[underlying_trading_status_notification_at] = underlying_trading_status_notification_value; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_at] = underlying_trading_status_notification_value; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Trading Status Notification set to where it lies, so a field read out of place says so */
inline ramp_underlying_trading_status_notification(underlying_trading_status_notification_record, underlying_trading_status_notification_base) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.nanoseconds[underlying_trading_status_notification_at] = (underlying_trading_status_notification_base + 0 + underlying_trading_status_notification_at + 1) % 256; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 11 -> underlying_trading_status_notification_record.underlying_symbol[underlying_trading_status_notification_at] = (underlying_trading_status_notification_base + 4 + underlying_trading_status_notification_at + 1) % 256; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_record.trading_status = (underlying_trading_status_notification_base + 15 + 1) % 256;
  underlying_trading_status_notification_record.event_reason = (underlying_trading_status_notification_base + 16 + 1) % 256;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.expected_event_time_seconds_part[underlying_trading_status_notification_at] = (underlying_trading_status_notification_base + 17 + underlying_trading_status_notification_at + 1) % 256; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_at] = (underlying_trading_status_notification_base + 21 + underlying_trading_status_notification_at + 1) % 256; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Notification to the wire, 25 bytes from where the cursor stands */
inline encode_underlying_trading_status_notification(underlying_trading_status_notification_record) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> wire[at] = underlying_trading_status_notification_record.nanoseconds[underlying_trading_status_notification_at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 11 -> wire[at] = underlying_trading_status_notification_record.underlying_symbol[underlying_trading_status_notification_at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  wire[at] = underlying_trading_status_notification_record.trading_status; at = at + 1;
  wire[at] = underlying_trading_status_notification_record.event_reason; at = at + 1;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> wire[at] = underlying_trading_status_notification_record.expected_event_time_seconds_part[underlying_trading_status_notification_at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> wire[at] = underlying_trading_status_notification_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Notification off the wire, 25 bytes from where the cursor stands */
inline decode_underlying_trading_status_notification(underlying_trading_status_notification_record) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.nanoseconds[underlying_trading_status_notification_at] = wire[at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 11 -> underlying_trading_status_notification_record.underlying_symbol[underlying_trading_status_notification_at] = wire[at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_record.trading_status = wire[at]; at = at + 1;
  underlying_trading_status_notification_record.event_reason = wire[at]; at = at + 1;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.expected_event_time_seconds_part[underlying_trading_status_notification_at] = wire[at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> underlying_trading_status_notification_record.expected_event_time_nano_seconds_part[underlying_trading_status_notification_at] = wire[at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Trading Status Notification is what was written, byte for byte */
inline equal_underlying_trading_status_notification(underlying_trading_status_notification_read, underlying_trading_status_notification_written) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> assert(underlying_trading_status_notification_read.nanoseconds[underlying_trading_status_notification_at] == underlying_trading_status_notification_written.nanoseconds[underlying_trading_status_notification_at]); underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 11 -> assert(underlying_trading_status_notification_read.underlying_symbol[underlying_trading_status_notification_at] == underlying_trading_status_notification_written.underlying_symbol[underlying_trading_status_notification_at]); underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  assert(underlying_trading_status_notification_read.trading_status == underlying_trading_status_notification_written.trading_status);
  assert(underlying_trading_status_notification_read.event_reason == underlying_trading_status_notification_written.event_reason);
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> assert(underlying_trading_status_notification_read.expected_event_time_seconds_part[underlying_trading_status_notification_at] == underlying_trading_status_notification_written.expected_event_time_seconds_part[underlying_trading_status_notification_at]); underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 4 -> assert(underlying_trading_status_notification_read.expected_event_time_nano_seconds_part[underlying_trading_status_notification_at] == underlying_trading_status_notification_written.expected_event_time_nano_seconds_part[underlying_trading_status_notification_at]); underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
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

/* Compact Top Of Market Bid Message: encoded, read back, and compared */
proctype check_compact_top_of_market_bid_message() {
  CompactTopOfMarketBidMessage compact_top_of_market_bid_message_sent;
  CompactTopOfMarketBidMessage compact_top_of_market_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_top_of_market_bid_message(compact_top_of_market_bid_message_sent, 0)
  :: pattern == 1 -> fill_compact_top_of_market_bid_message(compact_top_of_market_bid_message_sent, 32)
  :: pattern == 2 -> fill_compact_top_of_market_bid_message(compact_top_of_market_bid_message_sent, 255)
  :: else -> ramp_compact_top_of_market_bid_message(compact_top_of_market_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_top_of_market_bid_message(compact_top_of_market_bid_message_sent);
    assert(at == 15);
    at = 0;
    decode_compact_top_of_market_bid_message(compact_top_of_market_bid_message_got);
    assert(at == 15);
    equal_compact_top_of_market_bid_message(compact_top_of_market_bid_message_got, compact_top_of_market_bid_message_sent)
  }
}

/* Compact Top Of Market Best Offer Message: encoded, read back, and compared */
proctype check_compact_top_of_market_best_offer_message() {
  CompactTopOfMarketBestOfferMessage compact_top_of_market_best_offer_message_sent;
  CompactTopOfMarketBestOfferMessage compact_top_of_market_best_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_sent, 0)
  :: pattern == 1 -> fill_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_sent, 32)
  :: pattern == 2 -> fill_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_sent, 255)
  :: else -> ramp_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_sent);
    assert(at == 15);
    at = 0;
    decode_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_got);
    assert(at == 15);
    equal_compact_top_of_market_best_offer_message(compact_top_of_market_best_offer_message_got, compact_top_of_market_best_offer_message_sent)
  }
}

/* Wide Top Of Market Best Bid Message: encoded, read back, and compared */
proctype check_wide_top_of_market_best_bid_message() {
  WideTopOfMarketBestBidMessage wide_top_of_market_best_bid_message_sent;
  WideTopOfMarketBestBidMessage wide_top_of_market_best_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_sent, 0)
  :: pattern == 1 -> fill_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_sent, 32)
  :: pattern == 2 -> fill_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_sent, 255)
  :: else -> ramp_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_sent);
    assert(at == 21);
    at = 0;
    decode_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_got);
    assert(at == 21);
    equal_wide_top_of_market_best_bid_message(wide_top_of_market_best_bid_message_got, wide_top_of_market_best_bid_message_sent)
  }
}

/* Wide Top Of Market Best Offer Message: encoded, read back, and compared */
proctype check_wide_top_of_market_best_offer_message() {
  WideTopOfMarketBestOfferMessage wide_top_of_market_best_offer_message_sent;
  WideTopOfMarketBestOfferMessage wide_top_of_market_best_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_sent, 0)
  :: pattern == 1 -> fill_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_sent, 32)
  :: pattern == 2 -> fill_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_sent, 255)
  :: else -> ramp_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_sent);
    assert(at == 21);
    at = 0;
    decode_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_got);
    assert(at == 21);
    equal_wide_top_of_market_best_offer_message(wide_top_of_market_best_offer_message_got, wide_top_of_market_best_offer_message_sent)
  }
}

/* Compact Double Sided Top Of Market Message: encoded, read back, and compared */
proctype check_compact_double_sided_top_of_market_message() {
  CompactDoubleSidedTopOfMarketMessage compact_double_sided_top_of_market_message_sent;
  CompactDoubleSidedTopOfMarketMessage compact_double_sided_top_of_market_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_sent, 0)
  :: pattern == 1 -> fill_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_sent, 32)
  :: pattern == 2 -> fill_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_sent, 255)
  :: else -> ramp_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_sent);
    assert(at == 22);
    at = 0;
    decode_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_got);
    assert(at == 22);
    equal_compact_double_sided_top_of_market_message(compact_double_sided_top_of_market_message_got, compact_double_sided_top_of_market_message_sent)
  }
}

/* Wide Double Sided Top Of Market Message: encoded, read back, and compared */
proctype check_wide_double_sided_top_of_market_message() {
  WideDoubleSidedTopOfMarketMessage wide_double_sided_top_of_market_message_sent;
  WideDoubleSidedTopOfMarketMessage wide_double_sided_top_of_market_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_sent, 0)
  :: pattern == 1 -> fill_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_sent, 32)
  :: pattern == 2 -> fill_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_sent, 255)
  :: else -> ramp_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_sent);
    assert(at == 34);
    at = 0;
    decode_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_got);
    assert(at == 34);
    equal_wide_double_sided_top_of_market_message(wide_double_sided_top_of_market_message_got, wide_double_sided_top_of_market_message_sent)
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

/* Underlying Trading Status Notification: encoded, read back, and compared */
proctype check_underlying_trading_status_notification() {
  UnderlyingTradingStatusNotification underlying_trading_status_notification_sent;
  UnderlyingTradingStatusNotification underlying_trading_status_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_trading_status_notification(underlying_trading_status_notification_sent, 0)
  :: pattern == 1 -> fill_underlying_trading_status_notification(underlying_trading_status_notification_sent, 32)
  :: pattern == 2 -> fill_underlying_trading_status_notification(underlying_trading_status_notification_sent, 255)
  :: else -> ramp_underlying_trading_status_notification(underlying_trading_status_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_trading_status_notification(underlying_trading_status_notification_sent);
    assert(at == 25);
    at = 0;
    decode_underlying_trading_status_notification(underlying_trading_status_notification_got);
    assert(at == 25);
    equal_underlying_trading_status_notification(underlying_trading_status_notification_got, underlying_trading_status_notification_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_system_time_message()
  :: run check_series_update_message()
  :: run check_system_state_message()
  :: run check_compact_top_of_market_bid_message()
  :: run check_compact_top_of_market_best_offer_message()
  :: run check_wide_top_of_market_best_bid_message()
  :: run check_wide_top_of_market_best_offer_message()
  :: run check_compact_double_sided_top_of_market_message()
  :: run check_wide_double_sided_top_of_market_message()
  :: run check_last_sale_message()
  :: run check_trade_cancel_message()
  :: run check_underlying_trading_status_notification()
  fi
}
