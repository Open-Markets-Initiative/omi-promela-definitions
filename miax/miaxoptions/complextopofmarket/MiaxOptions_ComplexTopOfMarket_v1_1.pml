/*
 * Miami International Holdings Complex Top Of Market
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

/* ---- Series Update: 72 bytes ------------------------------------------------- */

/* This is the message format that will be used to disseminate all Option series traded on MIAX for the current session. The product ID sent in this message is what will be disseminated in Top of Market BBO and Last Sale messages. */
typedef SeriesUpdate {
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

int series_update_at;

/* every byte of Series Update set to one value */
inline fill_series_update(series_update_record, series_update_value) {
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.nanoseconds[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.product_id[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 11 -> series_update_record.underlying_symbol[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 6 -> series_update_record.security_symbol[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.expiration_date[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.strike_price[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.call_or_put = series_update_value;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.opening_time[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.closing_time[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.restricted_option = series_update_value;
  series_update_record.long_term_option = series_update_value;
  series_update_record.active_on_miax = series_update_value;
  series_update_record.miax_bbo_posting_increment_indicator = series_update_value;
  series_update_record.liquidity_acceptance_increment_indicator = series_update_value;
  series_update_record.opening_underlying_market_code = series_update_value;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.priority_quote_width[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.reserved_8[series_update_at] = series_update_value; series_update_at = series_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Series Update set to where it lies, so a field read out of place says so */
inline ramp_series_update(series_update_record, series_update_base) {
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.nanoseconds[series_update_at] = (series_update_base + 0 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.product_id[series_update_at] = (series_update_base + 4 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 11 -> series_update_record.underlying_symbol[series_update_at] = (series_update_base + 8 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 6 -> series_update_record.security_symbol[series_update_at] = (series_update_base + 19 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.expiration_date[series_update_at] = (series_update_base + 25 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.strike_price[series_update_at] = (series_update_base + 33 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.call_or_put = (series_update_base + 37 + 1) % 256;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.opening_time[series_update_at] = (series_update_base + 38 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.closing_time[series_update_at] = (series_update_base + 46 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.restricted_option = (series_update_base + 54 + 1) % 256;
  series_update_record.long_term_option = (series_update_base + 55 + 1) % 256;
  series_update_record.active_on_miax = (series_update_base + 56 + 1) % 256;
  series_update_record.miax_bbo_posting_increment_indicator = (series_update_base + 57 + 1) % 256;
  series_update_record.liquidity_acceptance_increment_indicator = (series_update_base + 58 + 1) % 256;
  series_update_record.opening_underlying_market_code = (series_update_base + 59 + 1) % 256;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.priority_quote_width[series_update_at] = (series_update_base + 60 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.reserved_8[series_update_at] = (series_update_base + 64 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  skip
}

/* Series Update to the wire, 72 bytes from where the cursor stands */
inline encode_series_update(series_update_record) {
  series_update_at = 0;
  do
  :: series_update_at < 4 -> wire[at] = series_update_record.nanoseconds[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> wire[at] = series_update_record.product_id[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 11 -> wire[at] = series_update_record.underlying_symbol[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 6 -> wire[at] = series_update_record.security_symbol[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> wire[at] = series_update_record.expiration_date[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> wire[at] = series_update_record.strike_price[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  wire[at] = series_update_record.call_or_put; at = at + 1;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> wire[at] = series_update_record.opening_time[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> wire[at] = series_update_record.closing_time[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  wire[at] = series_update_record.restricted_option; at = at + 1;
  wire[at] = series_update_record.long_term_option; at = at + 1;
  wire[at] = series_update_record.active_on_miax; at = at + 1;
  wire[at] = series_update_record.miax_bbo_posting_increment_indicator; at = at + 1;
  wire[at] = series_update_record.liquidity_acceptance_increment_indicator; at = at + 1;
  wire[at] = series_update_record.opening_underlying_market_code; at = at + 1;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> wire[at] = series_update_record.priority_quote_width[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> wire[at] = series_update_record.reserved_8[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  skip
}

/* Series Update off the wire, 72 bytes from where the cursor stands */
inline decode_series_update(series_update_record) {
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.nanoseconds[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.product_id[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 11 -> series_update_record.underlying_symbol[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 6 -> series_update_record.security_symbol[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.expiration_date[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.strike_price[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.call_or_put = wire[at]; at = at + 1;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.opening_time[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.closing_time[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.restricted_option = wire[at]; at = at + 1;
  series_update_record.long_term_option = wire[at]; at = at + 1;
  series_update_record.active_on_miax = wire[at]; at = at + 1;
  series_update_record.miax_bbo_posting_increment_indicator = wire[at]; at = at + 1;
  series_update_record.liquidity_acceptance_increment_indicator = wire[at]; at = at + 1;
  series_update_record.opening_underlying_market_code = wire[at]; at = at + 1;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.priority_quote_width[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.reserved_8[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Series Update is what was written, byte for byte */
inline equal_series_update(series_update_read, series_update_written) {
  series_update_at = 0;
  do
  :: series_update_at < 4 -> assert(series_update_read.nanoseconds[series_update_at] == series_update_written.nanoseconds[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> assert(series_update_read.product_id[series_update_at] == series_update_written.product_id[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 11 -> assert(series_update_read.underlying_symbol[series_update_at] == series_update_written.underlying_symbol[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 6 -> assert(series_update_read.security_symbol[series_update_at] == series_update_written.security_symbol[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> assert(series_update_read.expiration_date[series_update_at] == series_update_written.expiration_date[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> assert(series_update_read.strike_price[series_update_at] == series_update_written.strike_price[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  assert(series_update_read.call_or_put == series_update_written.call_or_put);
  series_update_at = 0;
  do
  :: series_update_at < 8 -> assert(series_update_read.opening_time[series_update_at] == series_update_written.opening_time[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> assert(series_update_read.closing_time[series_update_at] == series_update_written.closing_time[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  assert(series_update_read.restricted_option == series_update_written.restricted_option);
  assert(series_update_read.long_term_option == series_update_written.long_term_option);
  assert(series_update_read.active_on_miax == series_update_written.active_on_miax);
  assert(series_update_read.miax_bbo_posting_increment_indicator == series_update_written.miax_bbo_posting_increment_indicator);
  assert(series_update_read.liquidity_acceptance_increment_indicator == series_update_written.liquidity_acceptance_increment_indicator);
  assert(series_update_read.opening_underlying_market_code == series_update_written.opening_underlying_market_code);
  series_update_at = 0;
  do
  :: series_update_at < 4 -> assert(series_update_read.priority_quote_width[series_update_at] == series_update_written.priority_quote_width[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> assert(series_update_read.reserved_8[series_update_at] == series_update_written.reserved_8[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Message: 17 bytes ------------------------------------------ */

/* This message format is used to notify the firms of the state changes of the system. This is a notification that applies to each Underlying group. Firms can use notifications as triggers in their system to ensure electronic synchronization of systems. */
typedef SystemStateMessage {
  byte nanoseconds[4];
  byte c_to_m_version[8];
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
  :: system_state_message_at < 8 -> system_state_message_record.c_to_m_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.c_to_m_version[system_state_message_at] = (system_state_message_base + 4 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.c_to_m_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.c_to_m_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> assert(system_state_message_read.c_to_m_version[system_state_message_at] == system_state_message_written.c_to_m_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
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

/* ---- Compact Complex Top Of Market Bid Message: 13 bytes --------------------- */

/* This is the message format that will be used to disseminate each side of the MIAX Complex Top of Market for options with low Net Price and small aggregate MIAX Best Bid or Offer (MBBO) size */
typedef CompactComplexTopOfMarketBidMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte compact_price[2];
  byte compact_size[2];
  byte top_of_market_quote_condition
};

int compact_complex_top_of_market_bid_message_at;

/* every byte of Compact Complex Top Of Market Bid Message set to one value */
inline fill_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_record, compact_complex_top_of_market_bid_message_value) {
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> compact_complex_top_of_market_bid_message_record.nanoseconds[compact_complex_top_of_market_bid_message_at] = compact_complex_top_of_market_bid_message_value; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> compact_complex_top_of_market_bid_message_record.strategy_id[compact_complex_top_of_market_bid_message_at] = compact_complex_top_of_market_bid_message_value; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> compact_complex_top_of_market_bid_message_record.compact_price[compact_complex_top_of_market_bid_message_at] = compact_complex_top_of_market_bid_message_value; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> compact_complex_top_of_market_bid_message_record.compact_size[compact_complex_top_of_market_bid_message_at] = compact_complex_top_of_market_bid_message_value; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_record.top_of_market_quote_condition = compact_complex_top_of_market_bid_message_value;
  skip
}

/* each byte of Compact Complex Top Of Market Bid Message set to where it lies, so a field read out of place says so */
inline ramp_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_record, compact_complex_top_of_market_bid_message_base) {
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> compact_complex_top_of_market_bid_message_record.nanoseconds[compact_complex_top_of_market_bid_message_at] = (compact_complex_top_of_market_bid_message_base + 0 + compact_complex_top_of_market_bid_message_at + 1) % 256; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> compact_complex_top_of_market_bid_message_record.strategy_id[compact_complex_top_of_market_bid_message_at] = (compact_complex_top_of_market_bid_message_base + 4 + compact_complex_top_of_market_bid_message_at + 1) % 256; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> compact_complex_top_of_market_bid_message_record.compact_price[compact_complex_top_of_market_bid_message_at] = (compact_complex_top_of_market_bid_message_base + 8 + compact_complex_top_of_market_bid_message_at + 1) % 256; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> compact_complex_top_of_market_bid_message_record.compact_size[compact_complex_top_of_market_bid_message_at] = (compact_complex_top_of_market_bid_message_base + 10 + compact_complex_top_of_market_bid_message_at + 1) % 256; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_record.top_of_market_quote_condition = (compact_complex_top_of_market_bid_message_base + 12 + 1) % 256;
  skip
}

/* Compact Complex Top Of Market Bid Message to the wire, 13 bytes from where the cursor stands */
inline encode_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_record) {
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> wire[at] = compact_complex_top_of_market_bid_message_record.nanoseconds[compact_complex_top_of_market_bid_message_at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> wire[at] = compact_complex_top_of_market_bid_message_record.strategy_id[compact_complex_top_of_market_bid_message_at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> wire[at] = compact_complex_top_of_market_bid_message_record.compact_price[compact_complex_top_of_market_bid_message_at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> wire[at] = compact_complex_top_of_market_bid_message_record.compact_size[compact_complex_top_of_market_bid_message_at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = compact_complex_top_of_market_bid_message_record.top_of_market_quote_condition; at = at + 1;
  skip
}

/* Compact Complex Top Of Market Bid Message off the wire, 13 bytes from where the cursor stands */
inline decode_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_record) {
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> compact_complex_top_of_market_bid_message_record.nanoseconds[compact_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> compact_complex_top_of_market_bid_message_record.strategy_id[compact_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> compact_complex_top_of_market_bid_message_record.compact_price[compact_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> compact_complex_top_of_market_bid_message_record.compact_size[compact_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_record.top_of_market_quote_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Compact Complex Top Of Market Bid Message is what was written, byte for byte */
inline equal_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_read, compact_complex_top_of_market_bid_message_written) {
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> assert(compact_complex_top_of_market_bid_message_read.nanoseconds[compact_complex_top_of_market_bid_message_at] == compact_complex_top_of_market_bid_message_written.nanoseconds[compact_complex_top_of_market_bid_message_at]); compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 4 -> assert(compact_complex_top_of_market_bid_message_read.strategy_id[compact_complex_top_of_market_bid_message_at] == compact_complex_top_of_market_bid_message_written.strategy_id[compact_complex_top_of_market_bid_message_at]); compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> assert(compact_complex_top_of_market_bid_message_read.compact_price[compact_complex_top_of_market_bid_message_at] == compact_complex_top_of_market_bid_message_written.compact_price[compact_complex_top_of_market_bid_message_at]); compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_bid_message_at = 0;
  do
  :: compact_complex_top_of_market_bid_message_at < 2 -> assert(compact_complex_top_of_market_bid_message_read.compact_size[compact_complex_top_of_market_bid_message_at] == compact_complex_top_of_market_bid_message_written.compact_size[compact_complex_top_of_market_bid_message_at]); compact_complex_top_of_market_bid_message_at = compact_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  assert(compact_complex_top_of_market_bid_message_read.top_of_market_quote_condition == compact_complex_top_of_market_bid_message_written.top_of_market_quote_condition);
  skip
}

/* ---- Compact Complex Top Of Market Offer Message: 15 bytes ------------------- */

/* This is the message format that will be used to disseminate each side of the MIAX Top of Market for options with low premiums and small aggregate MIAX Best Bid or Offer (MBBO) size */
typedef CompactComplexTopOfMarketOfferMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte compact_price[2];
  byte compact_size[2];
  byte reserved_2[2];
  byte top_of_market_quote_condition
};

int compact_complex_top_of_market_offer_message_at;

/* every byte of Compact Complex Top Of Market Offer Message set to one value */
inline fill_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_record, compact_complex_top_of_market_offer_message_value) {
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> compact_complex_top_of_market_offer_message_record.nanoseconds[compact_complex_top_of_market_offer_message_at] = compact_complex_top_of_market_offer_message_value; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> compact_complex_top_of_market_offer_message_record.strategy_id[compact_complex_top_of_market_offer_message_at] = compact_complex_top_of_market_offer_message_value; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.compact_price[compact_complex_top_of_market_offer_message_at] = compact_complex_top_of_market_offer_message_value; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.compact_size[compact_complex_top_of_market_offer_message_at] = compact_complex_top_of_market_offer_message_value; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.reserved_2[compact_complex_top_of_market_offer_message_at] = compact_complex_top_of_market_offer_message_value; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_record.top_of_market_quote_condition = compact_complex_top_of_market_offer_message_value;
  skip
}

/* each byte of Compact Complex Top Of Market Offer Message set to where it lies, so a field read out of place says so */
inline ramp_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_record, compact_complex_top_of_market_offer_message_base) {
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> compact_complex_top_of_market_offer_message_record.nanoseconds[compact_complex_top_of_market_offer_message_at] = (compact_complex_top_of_market_offer_message_base + 0 + compact_complex_top_of_market_offer_message_at + 1) % 256; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> compact_complex_top_of_market_offer_message_record.strategy_id[compact_complex_top_of_market_offer_message_at] = (compact_complex_top_of_market_offer_message_base + 4 + compact_complex_top_of_market_offer_message_at + 1) % 256; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.compact_price[compact_complex_top_of_market_offer_message_at] = (compact_complex_top_of_market_offer_message_base + 8 + compact_complex_top_of_market_offer_message_at + 1) % 256; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.compact_size[compact_complex_top_of_market_offer_message_at] = (compact_complex_top_of_market_offer_message_base + 10 + compact_complex_top_of_market_offer_message_at + 1) % 256; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.reserved_2[compact_complex_top_of_market_offer_message_at] = (compact_complex_top_of_market_offer_message_base + 12 + compact_complex_top_of_market_offer_message_at + 1) % 256; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_record.top_of_market_quote_condition = (compact_complex_top_of_market_offer_message_base + 14 + 1) % 256;
  skip
}

/* Compact Complex Top Of Market Offer Message to the wire, 15 bytes from where the cursor stands */
inline encode_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_record) {
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> wire[at] = compact_complex_top_of_market_offer_message_record.nanoseconds[compact_complex_top_of_market_offer_message_at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> wire[at] = compact_complex_top_of_market_offer_message_record.strategy_id[compact_complex_top_of_market_offer_message_at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> wire[at] = compact_complex_top_of_market_offer_message_record.compact_price[compact_complex_top_of_market_offer_message_at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> wire[at] = compact_complex_top_of_market_offer_message_record.compact_size[compact_complex_top_of_market_offer_message_at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> wire[at] = compact_complex_top_of_market_offer_message_record.reserved_2[compact_complex_top_of_market_offer_message_at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = compact_complex_top_of_market_offer_message_record.top_of_market_quote_condition; at = at + 1;
  skip
}

/* Compact Complex Top Of Market Offer Message off the wire, 15 bytes from where the cursor stands */
inline decode_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_record) {
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> compact_complex_top_of_market_offer_message_record.nanoseconds[compact_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> compact_complex_top_of_market_offer_message_record.strategy_id[compact_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.compact_price[compact_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.compact_size[compact_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> compact_complex_top_of_market_offer_message_record.reserved_2[compact_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_record.top_of_market_quote_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Compact Complex Top Of Market Offer Message is what was written, byte for byte */
inline equal_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_read, compact_complex_top_of_market_offer_message_written) {
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> assert(compact_complex_top_of_market_offer_message_read.nanoseconds[compact_complex_top_of_market_offer_message_at] == compact_complex_top_of_market_offer_message_written.nanoseconds[compact_complex_top_of_market_offer_message_at]); compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 4 -> assert(compact_complex_top_of_market_offer_message_read.strategy_id[compact_complex_top_of_market_offer_message_at] == compact_complex_top_of_market_offer_message_written.strategy_id[compact_complex_top_of_market_offer_message_at]); compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> assert(compact_complex_top_of_market_offer_message_read.compact_price[compact_complex_top_of_market_offer_message_at] == compact_complex_top_of_market_offer_message_written.compact_price[compact_complex_top_of_market_offer_message_at]); compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> assert(compact_complex_top_of_market_offer_message_read.compact_size[compact_complex_top_of_market_offer_message_at] == compact_complex_top_of_market_offer_message_written.compact_size[compact_complex_top_of_market_offer_message_at]); compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  compact_complex_top_of_market_offer_message_at = 0;
  do
  :: compact_complex_top_of_market_offer_message_at < 2 -> assert(compact_complex_top_of_market_offer_message_read.reserved_2[compact_complex_top_of_market_offer_message_at] == compact_complex_top_of_market_offer_message_written.reserved_2[compact_complex_top_of_market_offer_message_at]); compact_complex_top_of_market_offer_message_at = compact_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  assert(compact_complex_top_of_market_offer_message_read.top_of_market_quote_condition == compact_complex_top_of_market_offer_message_written.top_of_market_quote_condition);
  skip
}

/* ---- Wide Complex Top Of Market Bid Message: 25 bytes ------------------------ */

/* This is the message format that will be used to disseminate MIAX Complex Top of Market for strategies with high net price or large aggregate MIAX Best Bid or Offer (MBBO) size. */
typedef WideComplexTopOfMarketBidMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte wide_price[8];
  byte wide_size[4];
  byte reserved_4[4];
  byte top_of_market_quote_condition
};

int wide_complex_top_of_market_bid_message_at;

/* every byte of Wide Complex Top Of Market Bid Message set to one value */
inline fill_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_record, wide_complex_top_of_market_bid_message_value) {
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.nanoseconds[wide_complex_top_of_market_bid_message_at] = wide_complex_top_of_market_bid_message_value; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.strategy_id[wide_complex_top_of_market_bid_message_at] = wide_complex_top_of_market_bid_message_value; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 8 -> wide_complex_top_of_market_bid_message_record.wide_price[wide_complex_top_of_market_bid_message_at] = wide_complex_top_of_market_bid_message_value; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.wide_size[wide_complex_top_of_market_bid_message_at] = wide_complex_top_of_market_bid_message_value; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.reserved_4[wide_complex_top_of_market_bid_message_at] = wide_complex_top_of_market_bid_message_value; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_record.top_of_market_quote_condition = wide_complex_top_of_market_bid_message_value;
  skip
}

/* each byte of Wide Complex Top Of Market Bid Message set to where it lies, so a field read out of place says so */
inline ramp_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_record, wide_complex_top_of_market_bid_message_base) {
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.nanoseconds[wide_complex_top_of_market_bid_message_at] = (wide_complex_top_of_market_bid_message_base + 0 + wide_complex_top_of_market_bid_message_at + 1) % 256; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.strategy_id[wide_complex_top_of_market_bid_message_at] = (wide_complex_top_of_market_bid_message_base + 4 + wide_complex_top_of_market_bid_message_at + 1) % 256; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 8 -> wide_complex_top_of_market_bid_message_record.wide_price[wide_complex_top_of_market_bid_message_at] = (wide_complex_top_of_market_bid_message_base + 8 + wide_complex_top_of_market_bid_message_at + 1) % 256; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.wide_size[wide_complex_top_of_market_bid_message_at] = (wide_complex_top_of_market_bid_message_base + 16 + wide_complex_top_of_market_bid_message_at + 1) % 256; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.reserved_4[wide_complex_top_of_market_bid_message_at] = (wide_complex_top_of_market_bid_message_base + 20 + wide_complex_top_of_market_bid_message_at + 1) % 256; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_record.top_of_market_quote_condition = (wide_complex_top_of_market_bid_message_base + 24 + 1) % 256;
  skip
}

/* Wide Complex Top Of Market Bid Message to the wire, 25 bytes from where the cursor stands */
inline encode_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_record) {
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wire[at] = wide_complex_top_of_market_bid_message_record.nanoseconds[wide_complex_top_of_market_bid_message_at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wire[at] = wide_complex_top_of_market_bid_message_record.strategy_id[wide_complex_top_of_market_bid_message_at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 8 -> wire[at] = wide_complex_top_of_market_bid_message_record.wide_price[wide_complex_top_of_market_bid_message_at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wire[at] = wide_complex_top_of_market_bid_message_record.wide_size[wide_complex_top_of_market_bid_message_at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wire[at] = wide_complex_top_of_market_bid_message_record.reserved_4[wide_complex_top_of_market_bid_message_at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = wide_complex_top_of_market_bid_message_record.top_of_market_quote_condition; at = at + 1;
  skip
}

/* Wide Complex Top Of Market Bid Message off the wire, 25 bytes from where the cursor stands */
inline decode_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_record) {
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.nanoseconds[wide_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.strategy_id[wide_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 8 -> wide_complex_top_of_market_bid_message_record.wide_price[wide_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.wide_size[wide_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> wide_complex_top_of_market_bid_message_record.reserved_4[wide_complex_top_of_market_bid_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_record.top_of_market_quote_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Wide Complex Top Of Market Bid Message is what was written, byte for byte */
inline equal_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_read, wide_complex_top_of_market_bid_message_written) {
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> assert(wide_complex_top_of_market_bid_message_read.nanoseconds[wide_complex_top_of_market_bid_message_at] == wide_complex_top_of_market_bid_message_written.nanoseconds[wide_complex_top_of_market_bid_message_at]); wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> assert(wide_complex_top_of_market_bid_message_read.strategy_id[wide_complex_top_of_market_bid_message_at] == wide_complex_top_of_market_bid_message_written.strategy_id[wide_complex_top_of_market_bid_message_at]); wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 8 -> assert(wide_complex_top_of_market_bid_message_read.wide_price[wide_complex_top_of_market_bid_message_at] == wide_complex_top_of_market_bid_message_written.wide_price[wide_complex_top_of_market_bid_message_at]); wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> assert(wide_complex_top_of_market_bid_message_read.wide_size[wide_complex_top_of_market_bid_message_at] == wide_complex_top_of_market_bid_message_written.wide_size[wide_complex_top_of_market_bid_message_at]); wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_bid_message_at = 0;
  do
  :: wide_complex_top_of_market_bid_message_at < 4 -> assert(wide_complex_top_of_market_bid_message_read.reserved_4[wide_complex_top_of_market_bid_message_at] == wide_complex_top_of_market_bid_message_written.reserved_4[wide_complex_top_of_market_bid_message_at]); wide_complex_top_of_market_bid_message_at = wide_complex_top_of_market_bid_message_at + 1
  :: else -> break
  od;
  assert(wide_complex_top_of_market_bid_message_read.top_of_market_quote_condition == wide_complex_top_of_market_bid_message_written.top_of_market_quote_condition);
  skip
}

/* ---- Wide Complex Top Of Market Offer Message: 25 bytes ---------------------- */

/* This is the message format that will be used to disseminate MIAX Complex Top of Market for strategies with high net price or large aggregate MIAX Best Offer (MBBO) size. */
typedef WideComplexTopOfMarketOfferMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte wide_price[8];
  byte wide_size[4];
  byte reserved_4[4];
  byte top_of_market_quote_condition
};

int wide_complex_top_of_market_offer_message_at;

/* every byte of Wide Complex Top Of Market Offer Message set to one value */
inline fill_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_record, wide_complex_top_of_market_offer_message_value) {
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.nanoseconds[wide_complex_top_of_market_offer_message_at] = wide_complex_top_of_market_offer_message_value; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.strategy_id[wide_complex_top_of_market_offer_message_at] = wide_complex_top_of_market_offer_message_value; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 8 -> wide_complex_top_of_market_offer_message_record.wide_price[wide_complex_top_of_market_offer_message_at] = wide_complex_top_of_market_offer_message_value; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.wide_size[wide_complex_top_of_market_offer_message_at] = wide_complex_top_of_market_offer_message_value; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.reserved_4[wide_complex_top_of_market_offer_message_at] = wide_complex_top_of_market_offer_message_value; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_record.top_of_market_quote_condition = wide_complex_top_of_market_offer_message_value;
  skip
}

/* each byte of Wide Complex Top Of Market Offer Message set to where it lies, so a field read out of place says so */
inline ramp_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_record, wide_complex_top_of_market_offer_message_base) {
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.nanoseconds[wide_complex_top_of_market_offer_message_at] = (wide_complex_top_of_market_offer_message_base + 0 + wide_complex_top_of_market_offer_message_at + 1) % 256; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.strategy_id[wide_complex_top_of_market_offer_message_at] = (wide_complex_top_of_market_offer_message_base + 4 + wide_complex_top_of_market_offer_message_at + 1) % 256; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 8 -> wide_complex_top_of_market_offer_message_record.wide_price[wide_complex_top_of_market_offer_message_at] = (wide_complex_top_of_market_offer_message_base + 8 + wide_complex_top_of_market_offer_message_at + 1) % 256; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.wide_size[wide_complex_top_of_market_offer_message_at] = (wide_complex_top_of_market_offer_message_base + 16 + wide_complex_top_of_market_offer_message_at + 1) % 256; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.reserved_4[wide_complex_top_of_market_offer_message_at] = (wide_complex_top_of_market_offer_message_base + 20 + wide_complex_top_of_market_offer_message_at + 1) % 256; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_record.top_of_market_quote_condition = (wide_complex_top_of_market_offer_message_base + 24 + 1) % 256;
  skip
}

/* Wide Complex Top Of Market Offer Message to the wire, 25 bytes from where the cursor stands */
inline encode_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_record) {
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wire[at] = wide_complex_top_of_market_offer_message_record.nanoseconds[wide_complex_top_of_market_offer_message_at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wire[at] = wide_complex_top_of_market_offer_message_record.strategy_id[wide_complex_top_of_market_offer_message_at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 8 -> wire[at] = wide_complex_top_of_market_offer_message_record.wide_price[wide_complex_top_of_market_offer_message_at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wire[at] = wide_complex_top_of_market_offer_message_record.wide_size[wide_complex_top_of_market_offer_message_at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wire[at] = wide_complex_top_of_market_offer_message_record.reserved_4[wide_complex_top_of_market_offer_message_at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = wide_complex_top_of_market_offer_message_record.top_of_market_quote_condition; at = at + 1;
  skip
}

/* Wide Complex Top Of Market Offer Message off the wire, 25 bytes from where the cursor stands */
inline decode_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_record) {
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.nanoseconds[wide_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.strategy_id[wide_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 8 -> wide_complex_top_of_market_offer_message_record.wide_price[wide_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.wide_size[wide_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> wide_complex_top_of_market_offer_message_record.reserved_4[wide_complex_top_of_market_offer_message_at] = wire[at]; at = at + 1; wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_record.top_of_market_quote_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Wide Complex Top Of Market Offer Message is what was written, byte for byte */
inline equal_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_read, wide_complex_top_of_market_offer_message_written) {
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> assert(wide_complex_top_of_market_offer_message_read.nanoseconds[wide_complex_top_of_market_offer_message_at] == wide_complex_top_of_market_offer_message_written.nanoseconds[wide_complex_top_of_market_offer_message_at]); wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> assert(wide_complex_top_of_market_offer_message_read.strategy_id[wide_complex_top_of_market_offer_message_at] == wide_complex_top_of_market_offer_message_written.strategy_id[wide_complex_top_of_market_offer_message_at]); wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 8 -> assert(wide_complex_top_of_market_offer_message_read.wide_price[wide_complex_top_of_market_offer_message_at] == wide_complex_top_of_market_offer_message_written.wide_price[wide_complex_top_of_market_offer_message_at]); wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> assert(wide_complex_top_of_market_offer_message_read.wide_size[wide_complex_top_of_market_offer_message_at] == wide_complex_top_of_market_offer_message_written.wide_size[wide_complex_top_of_market_offer_message_at]); wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  wide_complex_top_of_market_offer_message_at = 0;
  do
  :: wide_complex_top_of_market_offer_message_at < 4 -> assert(wide_complex_top_of_market_offer_message_read.reserved_4[wide_complex_top_of_market_offer_message_at] == wide_complex_top_of_market_offer_message_written.reserved_4[wide_complex_top_of_market_offer_message_at]); wide_complex_top_of_market_offer_message_at = wide_complex_top_of_market_offer_message_at + 1
  :: else -> break
  od;
  assert(wide_complex_top_of_market_offer_message_read.top_of_market_quote_condition == wide_complex_top_of_market_offer_message_written.top_of_market_quote_condition);
  skip
}

/* ---- Compact Bid: 7 bytes ---------------------------------------------------- */

/* Compact Bid */
typedef CompactBid {
  byte compact_bid_price[2];
  byte compact_bid_size[2];
  byte reserved_2[2];
  byte bid_condition
};

int compact_bid_at;

/* every byte of Compact Bid set to one value */
inline fill_compact_bid(compact_bid_record, compact_bid_value) {
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.compact_bid_price[compact_bid_at] = compact_bid_value; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.compact_bid_size[compact_bid_at] = compact_bid_value; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.reserved_2[compact_bid_at] = compact_bid_value; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_record.bid_condition = compact_bid_value;
  skip
}

/* each byte of Compact Bid set to where it lies, so a field read out of place says so */
inline ramp_compact_bid(compact_bid_record, compact_bid_base) {
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.compact_bid_price[compact_bid_at] = (compact_bid_base + 0 + compact_bid_at + 1) % 256; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.compact_bid_size[compact_bid_at] = (compact_bid_base + 2 + compact_bid_at + 1) % 256; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.reserved_2[compact_bid_at] = (compact_bid_base + 4 + compact_bid_at + 1) % 256; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_record.bid_condition = (compact_bid_base + 6 + 1) % 256;
  skip
}

/* Compact Bid to the wire, 7 bytes from where the cursor stands */
inline encode_compact_bid(compact_bid_record) {
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> wire[at] = compact_bid_record.compact_bid_price[compact_bid_at]; at = at + 1; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> wire[at] = compact_bid_record.compact_bid_size[compact_bid_at]; at = at + 1; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> wire[at] = compact_bid_record.reserved_2[compact_bid_at]; at = at + 1; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  wire[at] = compact_bid_record.bid_condition; at = at + 1;
  skip
}

/* Compact Bid off the wire, 7 bytes from where the cursor stands */
inline decode_compact_bid(compact_bid_record) {
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.compact_bid_price[compact_bid_at] = wire[at]; at = at + 1; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.compact_bid_size[compact_bid_at] = wire[at]; at = at + 1; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> compact_bid_record.reserved_2[compact_bid_at] = wire[at]; at = at + 1; compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_record.bid_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Compact Bid is what was written, byte for byte */
inline equal_compact_bid(compact_bid_read, compact_bid_written) {
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> assert(compact_bid_read.compact_bid_price[compact_bid_at] == compact_bid_written.compact_bid_price[compact_bid_at]); compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> assert(compact_bid_read.compact_bid_size[compact_bid_at] == compact_bid_written.compact_bid_size[compact_bid_at]); compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  compact_bid_at = 0;
  do
  :: compact_bid_at < 2 -> assert(compact_bid_read.reserved_2[compact_bid_at] == compact_bid_written.reserved_2[compact_bid_at]); compact_bid_at = compact_bid_at + 1
  :: else -> break
  od;
  assert(compact_bid_read.bid_condition == compact_bid_written.bid_condition);
  skip
}

/* ---- Compact Offer: 7 bytes -------------------------------------------------- */

/* Compact Offer */
typedef CompactOffer {
  byte compact_offer_price[2];
  byte compact_offer_size[2];
  byte reserved_2[2];
  byte offer_condition
};

int compact_offer_at;

/* every byte of Compact Offer set to one value */
inline fill_compact_offer(compact_offer_record, compact_offer_value) {
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.compact_offer_price[compact_offer_at] = compact_offer_value; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.compact_offer_size[compact_offer_at] = compact_offer_value; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.reserved_2[compact_offer_at] = compact_offer_value; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_record.offer_condition = compact_offer_value;
  skip
}

/* each byte of Compact Offer set to where it lies, so a field read out of place says so */
inline ramp_compact_offer(compact_offer_record, compact_offer_base) {
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.compact_offer_price[compact_offer_at] = (compact_offer_base + 0 + compact_offer_at + 1) % 256; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.compact_offer_size[compact_offer_at] = (compact_offer_base + 2 + compact_offer_at + 1) % 256; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.reserved_2[compact_offer_at] = (compact_offer_base + 4 + compact_offer_at + 1) % 256; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_record.offer_condition = (compact_offer_base + 6 + 1) % 256;
  skip
}

/* Compact Offer to the wire, 7 bytes from where the cursor stands */
inline encode_compact_offer(compact_offer_record) {
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> wire[at] = compact_offer_record.compact_offer_price[compact_offer_at]; at = at + 1; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> wire[at] = compact_offer_record.compact_offer_size[compact_offer_at]; at = at + 1; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> wire[at] = compact_offer_record.reserved_2[compact_offer_at]; at = at + 1; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  wire[at] = compact_offer_record.offer_condition; at = at + 1;
  skip
}

/* Compact Offer off the wire, 7 bytes from where the cursor stands */
inline decode_compact_offer(compact_offer_record) {
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.compact_offer_price[compact_offer_at] = wire[at]; at = at + 1; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.compact_offer_size[compact_offer_at] = wire[at]; at = at + 1; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> compact_offer_record.reserved_2[compact_offer_at] = wire[at]; at = at + 1; compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Compact Offer is what was written, byte for byte */
inline equal_compact_offer(compact_offer_read, compact_offer_written) {
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> assert(compact_offer_read.compact_offer_price[compact_offer_at] == compact_offer_written.compact_offer_price[compact_offer_at]); compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> assert(compact_offer_read.compact_offer_size[compact_offer_at] == compact_offer_written.compact_offer_size[compact_offer_at]); compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  compact_offer_at = 0;
  do
  :: compact_offer_at < 2 -> assert(compact_offer_read.reserved_2[compact_offer_at] == compact_offer_written.reserved_2[compact_offer_at]); compact_offer_at = compact_offer_at + 1
  :: else -> break
  od;
  assert(compact_offer_read.offer_condition == compact_offer_written.offer_condition);
  skip
}

/* ---- Compact Complex Double Sided Top Of Market Message: 22 bytes ------------ */

/* This is the message format that will be used to disseminate both sides of the MIAX top of market for strategies (cMBBO) with low net price and small aggregate size. */
typedef CompactComplexDoubleSidedTopOfMarketMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  CompactBid compact_bid;
  CompactOffer compact_offer
};

int compact_complex_double_sided_top_of_market_message_at;

/* every byte of Compact Complex Double Sided Top Of Market Message set to one value */
inline fill_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_record, compact_complex_double_sided_top_of_market_message_value) {
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> compact_complex_double_sided_top_of_market_message_record.nanoseconds[compact_complex_double_sided_top_of_market_message_at] = compact_complex_double_sided_top_of_market_message_value; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> compact_complex_double_sided_top_of_market_message_record.strategy_id[compact_complex_double_sided_top_of_market_message_at] = compact_complex_double_sided_top_of_market_message_value; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  fill_compact_bid(compact_complex_double_sided_top_of_market_message_record.compact_bid, compact_complex_double_sided_top_of_market_message_value);
  fill_compact_offer(compact_complex_double_sided_top_of_market_message_record.compact_offer, compact_complex_double_sided_top_of_market_message_value);
  skip
}

/* each byte of Compact Complex Double Sided Top Of Market Message set to where it lies, so a field read out of place says so */
inline ramp_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_record, compact_complex_double_sided_top_of_market_message_base) {
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> compact_complex_double_sided_top_of_market_message_record.nanoseconds[compact_complex_double_sided_top_of_market_message_at] = (compact_complex_double_sided_top_of_market_message_base + 0 + compact_complex_double_sided_top_of_market_message_at + 1) % 256; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> compact_complex_double_sided_top_of_market_message_record.strategy_id[compact_complex_double_sided_top_of_market_message_at] = (compact_complex_double_sided_top_of_market_message_base + 4 + compact_complex_double_sided_top_of_market_message_at + 1) % 256; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  ramp_compact_bid(compact_complex_double_sided_top_of_market_message_record.compact_bid, compact_complex_double_sided_top_of_market_message_base + 8);
  ramp_compact_offer(compact_complex_double_sided_top_of_market_message_record.compact_offer, compact_complex_double_sided_top_of_market_message_base + 15);
  skip
}

/* Compact Complex Double Sided Top Of Market Message to the wire, 22 bytes from where the cursor stands */
inline encode_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_record) {
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> wire[at] = compact_complex_double_sided_top_of_market_message_record.nanoseconds[compact_complex_double_sided_top_of_market_message_at]; at = at + 1; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> wire[at] = compact_complex_double_sided_top_of_market_message_record.strategy_id[compact_complex_double_sided_top_of_market_message_at]; at = at + 1; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  encode_compact_bid(compact_complex_double_sided_top_of_market_message_record.compact_bid);
  encode_compact_offer(compact_complex_double_sided_top_of_market_message_record.compact_offer);
  skip
}

/* Compact Complex Double Sided Top Of Market Message off the wire, 22 bytes from where the cursor stands */
inline decode_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_record) {
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> compact_complex_double_sided_top_of_market_message_record.nanoseconds[compact_complex_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> compact_complex_double_sided_top_of_market_message_record.strategy_id[compact_complex_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  decode_compact_bid(compact_complex_double_sided_top_of_market_message_record.compact_bid);
  decode_compact_offer(compact_complex_double_sided_top_of_market_message_record.compact_offer);
  skip
}

/* what was read of Compact Complex Double Sided Top Of Market Message is what was written, byte for byte */
inline equal_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_read, compact_complex_double_sided_top_of_market_message_written) {
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> assert(compact_complex_double_sided_top_of_market_message_read.nanoseconds[compact_complex_double_sided_top_of_market_message_at] == compact_complex_double_sided_top_of_market_message_written.nanoseconds[compact_complex_double_sided_top_of_market_message_at]); compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  compact_complex_double_sided_top_of_market_message_at = 0;
  do
  :: compact_complex_double_sided_top_of_market_message_at < 4 -> assert(compact_complex_double_sided_top_of_market_message_read.strategy_id[compact_complex_double_sided_top_of_market_message_at] == compact_complex_double_sided_top_of_market_message_written.strategy_id[compact_complex_double_sided_top_of_market_message_at]); compact_complex_double_sided_top_of_market_message_at = compact_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  equal_compact_bid(compact_complex_double_sided_top_of_market_message_read.compact_bid, compact_complex_double_sided_top_of_market_message_written.compact_bid);
  equal_compact_offer(compact_complex_double_sided_top_of_market_message_read.compact_offer, compact_complex_double_sided_top_of_market_message_written.compact_offer);
  skip
}

/* ---- Wide Bid: 17 bytes ------------------------------------------------------ */

/* Wide Bid */
typedef WideBid {
  byte wide_bid_price[8];
  byte wide_bid_size[4];
  byte reserved_4[4];
  byte bid_condition
};

int wide_bid_at;

/* every byte of Wide Bid set to one value */
inline fill_wide_bid(wide_bid_record, wide_bid_value) {
  wide_bid_at = 0;
  do
  :: wide_bid_at < 8 -> wide_bid_record.wide_bid_price[wide_bid_at] = wide_bid_value; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wide_bid_record.wide_bid_size[wide_bid_at] = wide_bid_value; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wide_bid_record.reserved_4[wide_bid_at] = wide_bid_value; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_record.bid_condition = wide_bid_value;
  skip
}

/* each byte of Wide Bid set to where it lies, so a field read out of place says so */
inline ramp_wide_bid(wide_bid_record, wide_bid_base) {
  wide_bid_at = 0;
  do
  :: wide_bid_at < 8 -> wide_bid_record.wide_bid_price[wide_bid_at] = (wide_bid_base + 0 + wide_bid_at + 1) % 256; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wide_bid_record.wide_bid_size[wide_bid_at] = (wide_bid_base + 8 + wide_bid_at + 1) % 256; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wide_bid_record.reserved_4[wide_bid_at] = (wide_bid_base + 12 + wide_bid_at + 1) % 256; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_record.bid_condition = (wide_bid_base + 16 + 1) % 256;
  skip
}

/* Wide Bid to the wire, 17 bytes from where the cursor stands */
inline encode_wide_bid(wide_bid_record) {
  wide_bid_at = 0;
  do
  :: wide_bid_at < 8 -> wire[at] = wide_bid_record.wide_bid_price[wide_bid_at]; at = at + 1; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wire[at] = wide_bid_record.wide_bid_size[wide_bid_at]; at = at + 1; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wire[at] = wide_bid_record.reserved_4[wide_bid_at]; at = at + 1; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wire[at] = wide_bid_record.bid_condition; at = at + 1;
  skip
}

/* Wide Bid off the wire, 17 bytes from where the cursor stands */
inline decode_wide_bid(wide_bid_record) {
  wide_bid_at = 0;
  do
  :: wide_bid_at < 8 -> wide_bid_record.wide_bid_price[wide_bid_at] = wire[at]; at = at + 1; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wide_bid_record.wide_bid_size[wide_bid_at] = wire[at]; at = at + 1; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> wide_bid_record.reserved_4[wide_bid_at] = wire[at]; at = at + 1; wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_record.bid_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Wide Bid is what was written, byte for byte */
inline equal_wide_bid(wide_bid_read, wide_bid_written) {
  wide_bid_at = 0;
  do
  :: wide_bid_at < 8 -> assert(wide_bid_read.wide_bid_price[wide_bid_at] == wide_bid_written.wide_bid_price[wide_bid_at]); wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> assert(wide_bid_read.wide_bid_size[wide_bid_at] == wide_bid_written.wide_bid_size[wide_bid_at]); wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  wide_bid_at = 0;
  do
  :: wide_bid_at < 4 -> assert(wide_bid_read.reserved_4[wide_bid_at] == wide_bid_written.reserved_4[wide_bid_at]); wide_bid_at = wide_bid_at + 1
  :: else -> break
  od;
  assert(wide_bid_read.bid_condition == wide_bid_written.bid_condition);
  skip
}

/* ---- Wide Offer: 17 bytes ---------------------------------------------------- */

/* Wide Offer */
typedef WideOffer {
  byte wide_offer_price[8];
  byte wide_offer_size[4];
  byte reserved_4[4];
  byte offer_condition
};

int wide_offer_at;

/* every byte of Wide Offer set to one value */
inline fill_wide_offer(wide_offer_record, wide_offer_value) {
  wide_offer_at = 0;
  do
  :: wide_offer_at < 8 -> wide_offer_record.wide_offer_price[wide_offer_at] = wide_offer_value; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wide_offer_record.wide_offer_size[wide_offer_at] = wide_offer_value; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wide_offer_record.reserved_4[wide_offer_at] = wide_offer_value; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_record.offer_condition = wide_offer_value;
  skip
}

/* each byte of Wide Offer set to where it lies, so a field read out of place says so */
inline ramp_wide_offer(wide_offer_record, wide_offer_base) {
  wide_offer_at = 0;
  do
  :: wide_offer_at < 8 -> wide_offer_record.wide_offer_price[wide_offer_at] = (wide_offer_base + 0 + wide_offer_at + 1) % 256; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wide_offer_record.wide_offer_size[wide_offer_at] = (wide_offer_base + 8 + wide_offer_at + 1) % 256; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wide_offer_record.reserved_4[wide_offer_at] = (wide_offer_base + 12 + wide_offer_at + 1) % 256; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_record.offer_condition = (wide_offer_base + 16 + 1) % 256;
  skip
}

/* Wide Offer to the wire, 17 bytes from where the cursor stands */
inline encode_wide_offer(wide_offer_record) {
  wide_offer_at = 0;
  do
  :: wide_offer_at < 8 -> wire[at] = wide_offer_record.wide_offer_price[wide_offer_at]; at = at + 1; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wire[at] = wide_offer_record.wide_offer_size[wide_offer_at]; at = at + 1; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wire[at] = wide_offer_record.reserved_4[wide_offer_at]; at = at + 1; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wire[at] = wide_offer_record.offer_condition; at = at + 1;
  skip
}

/* Wide Offer off the wire, 17 bytes from where the cursor stands */
inline decode_wide_offer(wide_offer_record) {
  wide_offer_at = 0;
  do
  :: wide_offer_at < 8 -> wide_offer_record.wide_offer_price[wide_offer_at] = wire[at]; at = at + 1; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wide_offer_record.wide_offer_size[wide_offer_at] = wire[at]; at = at + 1; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> wide_offer_record.reserved_4[wide_offer_at] = wire[at]; at = at + 1; wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Wide Offer is what was written, byte for byte */
inline equal_wide_offer(wide_offer_read, wide_offer_written) {
  wide_offer_at = 0;
  do
  :: wide_offer_at < 8 -> assert(wide_offer_read.wide_offer_price[wide_offer_at] == wide_offer_written.wide_offer_price[wide_offer_at]); wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> assert(wide_offer_read.wide_offer_size[wide_offer_at] == wide_offer_written.wide_offer_size[wide_offer_at]); wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  wide_offer_at = 0;
  do
  :: wide_offer_at < 4 -> assert(wide_offer_read.reserved_4[wide_offer_at] == wide_offer_written.reserved_4[wide_offer_at]); wide_offer_at = wide_offer_at + 1
  :: else -> break
  od;
  assert(wide_offer_read.offer_condition == wide_offer_written.offer_condition);
  skip
}

/* ---- Wide Complex Double Sided Top Of Market Message: 42 bytes --------------- */

/* This is the message format that will be used to disseminate both sides of the MIAX top of market for strategies (cMBBO) with net prices or aggregate sizes which cannot be specified in the compact format. */
typedef WideComplexDoubleSidedTopOfMarketMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  WideBid wide_bid;
  WideOffer wide_offer
};

int wide_complex_double_sided_top_of_market_message_at;

/* every byte of Wide Complex Double Sided Top Of Market Message set to one value */
inline fill_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_record, wide_complex_double_sided_top_of_market_message_value) {
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wide_complex_double_sided_top_of_market_message_record.nanoseconds[wide_complex_double_sided_top_of_market_message_at] = wide_complex_double_sided_top_of_market_message_value; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wide_complex_double_sided_top_of_market_message_record.strategy_id[wide_complex_double_sided_top_of_market_message_at] = wide_complex_double_sided_top_of_market_message_value; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  fill_wide_bid(wide_complex_double_sided_top_of_market_message_record.wide_bid, wide_complex_double_sided_top_of_market_message_value);
  fill_wide_offer(wide_complex_double_sided_top_of_market_message_record.wide_offer, wide_complex_double_sided_top_of_market_message_value);
  skip
}

/* each byte of Wide Complex Double Sided Top Of Market Message set to where it lies, so a field read out of place says so */
inline ramp_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_record, wide_complex_double_sided_top_of_market_message_base) {
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wide_complex_double_sided_top_of_market_message_record.nanoseconds[wide_complex_double_sided_top_of_market_message_at] = (wide_complex_double_sided_top_of_market_message_base + 0 + wide_complex_double_sided_top_of_market_message_at + 1) % 256; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wide_complex_double_sided_top_of_market_message_record.strategy_id[wide_complex_double_sided_top_of_market_message_at] = (wide_complex_double_sided_top_of_market_message_base + 4 + wide_complex_double_sided_top_of_market_message_at + 1) % 256; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  ramp_wide_bid(wide_complex_double_sided_top_of_market_message_record.wide_bid, wide_complex_double_sided_top_of_market_message_base + 8);
  ramp_wide_offer(wide_complex_double_sided_top_of_market_message_record.wide_offer, wide_complex_double_sided_top_of_market_message_base + 25);
  skip
}

/* Wide Complex Double Sided Top Of Market Message to the wire, 42 bytes from where the cursor stands */
inline encode_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_record) {
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_complex_double_sided_top_of_market_message_record.nanoseconds[wide_complex_double_sided_top_of_market_message_at]; at = at + 1; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wire[at] = wide_complex_double_sided_top_of_market_message_record.strategy_id[wide_complex_double_sided_top_of_market_message_at]; at = at + 1; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  encode_wide_bid(wide_complex_double_sided_top_of_market_message_record.wide_bid);
  encode_wide_offer(wide_complex_double_sided_top_of_market_message_record.wide_offer);
  skip
}

/* Wide Complex Double Sided Top Of Market Message off the wire, 42 bytes from where the cursor stands */
inline decode_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_record) {
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wide_complex_double_sided_top_of_market_message_record.nanoseconds[wide_complex_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> wide_complex_double_sided_top_of_market_message_record.strategy_id[wide_complex_double_sided_top_of_market_message_at] = wire[at]; at = at + 1; wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  decode_wide_bid(wide_complex_double_sided_top_of_market_message_record.wide_bid);
  decode_wide_offer(wide_complex_double_sided_top_of_market_message_record.wide_offer);
  skip
}

/* what was read of Wide Complex Double Sided Top Of Market Message is what was written, byte for byte */
inline equal_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_read, wide_complex_double_sided_top_of_market_message_written) {
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> assert(wide_complex_double_sided_top_of_market_message_read.nanoseconds[wide_complex_double_sided_top_of_market_message_at] == wide_complex_double_sided_top_of_market_message_written.nanoseconds[wide_complex_double_sided_top_of_market_message_at]); wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  wide_complex_double_sided_top_of_market_message_at = 0;
  do
  :: wide_complex_double_sided_top_of_market_message_at < 4 -> assert(wide_complex_double_sided_top_of_market_message_read.strategy_id[wide_complex_double_sided_top_of_market_message_at] == wide_complex_double_sided_top_of_market_message_written.strategy_id[wide_complex_double_sided_top_of_market_message_at]); wide_complex_double_sided_top_of_market_message_at = wide_complex_double_sided_top_of_market_message_at + 1
  :: else -> break
  od;
  equal_wide_bid(wide_complex_double_sided_top_of_market_message_read.wide_bid, wide_complex_double_sided_top_of_market_message_written.wide_bid);
  equal_wide_offer(wide_complex_double_sided_top_of_market_message_read.wide_offer, wide_complex_double_sided_top_of_market_message_written.wide_offer);
  skip
}

/* ---- Strategy Trade Message: 41 bytes ---------------------------------------- */

/* This is the message format that will be used to disseminate Trades that are resulting from executions on MIAX during the current trading session */
typedef StrategyTradeMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte trade_id[4];
  byte net_price[8];
  byte trade_size[4];
  byte trade_condition;
  byte reserved_16[16]
};

int strategy_trade_message_at;

/* every byte of Strategy Trade Message set to one value */
inline fill_strategy_trade_message(strategy_trade_message_record, strategy_trade_message_value) {
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.nanoseconds[strategy_trade_message_at] = strategy_trade_message_value; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.strategy_id[strategy_trade_message_at] = strategy_trade_message_value; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.trade_id[strategy_trade_message_at] = strategy_trade_message_value; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 8 -> strategy_trade_message_record.net_price[strategy_trade_message_at] = strategy_trade_message_value; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.trade_size[strategy_trade_message_at] = strategy_trade_message_value; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_record.trade_condition = strategy_trade_message_value;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 16 -> strategy_trade_message_record.reserved_16[strategy_trade_message_at] = strategy_trade_message_value; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Strategy Trade Message set to where it lies, so a field read out of place says so */
inline ramp_strategy_trade_message(strategy_trade_message_record, strategy_trade_message_base) {
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.nanoseconds[strategy_trade_message_at] = (strategy_trade_message_base + 0 + strategy_trade_message_at + 1) % 256; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.strategy_id[strategy_trade_message_at] = (strategy_trade_message_base + 4 + strategy_trade_message_at + 1) % 256; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.trade_id[strategy_trade_message_at] = (strategy_trade_message_base + 8 + strategy_trade_message_at + 1) % 256; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 8 -> strategy_trade_message_record.net_price[strategy_trade_message_at] = (strategy_trade_message_base + 12 + strategy_trade_message_at + 1) % 256; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.trade_size[strategy_trade_message_at] = (strategy_trade_message_base + 20 + strategy_trade_message_at + 1) % 256; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_record.trade_condition = (strategy_trade_message_base + 24 + 1) % 256;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 16 -> strategy_trade_message_record.reserved_16[strategy_trade_message_at] = (strategy_trade_message_base + 25 + strategy_trade_message_at + 1) % 256; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strategy Trade Message to the wire, 41 bytes from where the cursor stands */
inline encode_strategy_trade_message(strategy_trade_message_record) {
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> wire[at] = strategy_trade_message_record.nanoseconds[strategy_trade_message_at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> wire[at] = strategy_trade_message_record.strategy_id[strategy_trade_message_at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> wire[at] = strategy_trade_message_record.trade_id[strategy_trade_message_at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 8 -> wire[at] = strategy_trade_message_record.net_price[strategy_trade_message_at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> wire[at] = strategy_trade_message_record.trade_size[strategy_trade_message_at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = strategy_trade_message_record.trade_condition; at = at + 1;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 16 -> wire[at] = strategy_trade_message_record.reserved_16[strategy_trade_message_at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strategy Trade Message off the wire, 41 bytes from where the cursor stands */
inline decode_strategy_trade_message(strategy_trade_message_record) {
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.nanoseconds[strategy_trade_message_at] = wire[at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.strategy_id[strategy_trade_message_at] = wire[at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.trade_id[strategy_trade_message_at] = wire[at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 8 -> strategy_trade_message_record.net_price[strategy_trade_message_at] = wire[at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> strategy_trade_message_record.trade_size[strategy_trade_message_at] = wire[at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_record.trade_condition = wire[at]; at = at + 1;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 16 -> strategy_trade_message_record.reserved_16[strategy_trade_message_at] = wire[at]; at = at + 1; strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Strategy Trade Message is what was written, byte for byte */
inline equal_strategy_trade_message(strategy_trade_message_read, strategy_trade_message_written) {
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> assert(strategy_trade_message_read.nanoseconds[strategy_trade_message_at] == strategy_trade_message_written.nanoseconds[strategy_trade_message_at]); strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> assert(strategy_trade_message_read.strategy_id[strategy_trade_message_at] == strategy_trade_message_written.strategy_id[strategy_trade_message_at]); strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> assert(strategy_trade_message_read.trade_id[strategy_trade_message_at] == strategy_trade_message_written.trade_id[strategy_trade_message_at]); strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 8 -> assert(strategy_trade_message_read.net_price[strategy_trade_message_at] == strategy_trade_message_written.net_price[strategy_trade_message_at]); strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 4 -> assert(strategy_trade_message_read.trade_size[strategy_trade_message_at] == strategy_trade_message_written.trade_size[strategy_trade_message_at]); strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  assert(strategy_trade_message_read.trade_condition == strategy_trade_message_written.trade_condition);
  strategy_trade_message_at = 0;
  do
  :: strategy_trade_message_at < 16 -> assert(strategy_trade_message_read.reserved_16[strategy_trade_message_at] == strategy_trade_message_written.reserved_16[strategy_trade_message_at]); strategy_trade_message_at = strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Trading Status Message: 25 bytes ----------------------------- */

/* This message format will be used to notify firms of changes to the trading status of all the options of an underlying */
typedef UnderlyingTradingStatusMessage {
  byte nanoseconds[4];
  byte underlying_symbol[11];
  byte trading_status;
  byte event_reason;
  byte seconds_part[4];
  byte expected_event_time_nano_seconds_part[4]
};

int underlying_trading_status_message_at;

/* every byte of Underlying Trading Status Message set to one value */
inline fill_underlying_trading_status_message(underlying_trading_status_message_record, underlying_trading_status_message_value) {
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.nanoseconds[underlying_trading_status_message_at] = underlying_trading_status_message_value; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 11 -> underlying_trading_status_message_record.underlying_symbol[underlying_trading_status_message_at] = underlying_trading_status_message_value; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_record.trading_status = underlying_trading_status_message_value;
  underlying_trading_status_message_record.event_reason = underlying_trading_status_message_value;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.seconds_part[underlying_trading_status_message_at] = underlying_trading_status_message_value; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_message_at] = underlying_trading_status_message_value; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_trading_status_message(underlying_trading_status_message_record, underlying_trading_status_message_base) {
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.nanoseconds[underlying_trading_status_message_at] = (underlying_trading_status_message_base + 0 + underlying_trading_status_message_at + 1) % 256; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 11 -> underlying_trading_status_message_record.underlying_symbol[underlying_trading_status_message_at] = (underlying_trading_status_message_base + 4 + underlying_trading_status_message_at + 1) % 256; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_record.trading_status = (underlying_trading_status_message_base + 15 + 1) % 256;
  underlying_trading_status_message_record.event_reason = (underlying_trading_status_message_base + 16 + 1) % 256;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.seconds_part[underlying_trading_status_message_at] = (underlying_trading_status_message_base + 17 + underlying_trading_status_message_at + 1) % 256; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_message_at] = (underlying_trading_status_message_base + 21 + underlying_trading_status_message_at + 1) % 256; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Message to the wire, 25 bytes from where the cursor stands */
inline encode_underlying_trading_status_message(underlying_trading_status_message_record) {
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> wire[at] = underlying_trading_status_message_record.nanoseconds[underlying_trading_status_message_at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 11 -> wire[at] = underlying_trading_status_message_record.underlying_symbol[underlying_trading_status_message_at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_trading_status_message_record.trading_status; at = at + 1;
  wire[at] = underlying_trading_status_message_record.event_reason; at = at + 1;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> wire[at] = underlying_trading_status_message_record.seconds_part[underlying_trading_status_message_at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> wire[at] = underlying_trading_status_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_message_at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Message off the wire, 25 bytes from where the cursor stands */
inline decode_underlying_trading_status_message(underlying_trading_status_message_record) {
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.nanoseconds[underlying_trading_status_message_at] = wire[at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 11 -> underlying_trading_status_message_record.underlying_symbol[underlying_trading_status_message_at] = wire[at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_record.trading_status = wire[at]; at = at + 1;
  underlying_trading_status_message_record.event_reason = wire[at]; at = at + 1;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.seconds_part[underlying_trading_status_message_at] = wire[at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> underlying_trading_status_message_record.expected_event_time_nano_seconds_part[underlying_trading_status_message_at] = wire[at]; at = at + 1; underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Trading Status Message is what was written, byte for byte */
inline equal_underlying_trading_status_message(underlying_trading_status_message_read, underlying_trading_status_message_written) {
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> assert(underlying_trading_status_message_read.nanoseconds[underlying_trading_status_message_at] == underlying_trading_status_message_written.nanoseconds[underlying_trading_status_message_at]); underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 11 -> assert(underlying_trading_status_message_read.underlying_symbol[underlying_trading_status_message_at] == underlying_trading_status_message_written.underlying_symbol[underlying_trading_status_message_at]); underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  assert(underlying_trading_status_message_read.trading_status == underlying_trading_status_message_written.trading_status);
  assert(underlying_trading_status_message_read.event_reason == underlying_trading_status_message_written.event_reason);
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> assert(underlying_trading_status_message_read.seconds_part[underlying_trading_status_message_at] == underlying_trading_status_message_written.seconds_part[underlying_trading_status_message_at]); underlying_trading_status_message_at = underlying_trading_status_message_at + 1
  :: else -> break
  od;
  underlying_trading_status_message_at = 0;
  do
  :: underlying_trading_status_message_at < 4 -> assert(underlying_trading_status_message_read.expected_event_time_nano_seconds_part[underlying_trading_status_message_at] == underlying_trading_status_message_written.expected_event_time_nano_seconds_part[underlying_trading_status_message_at]); underlying_trading_status_message_at = underlying_trading_status_message_at + 1
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

/* Series Update: encoded, read back, and compared */
proctype check_series_update() {
  SeriesUpdate series_update_sent;
  SeriesUpdate series_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_update(series_update_sent, 0)
  :: pattern == 1 -> fill_series_update(series_update_sent, 32)
  :: pattern == 2 -> fill_series_update(series_update_sent, 255)
  :: else -> ramp_series_update(series_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_update(series_update_sent);
    assert(at == 72);
    at = 0;
    decode_series_update(series_update_got);
    assert(at == 72);
    equal_series_update(series_update_got, series_update_sent)
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

/* Compact Complex Top Of Market Bid Message: encoded, read back, and compared */
proctype check_compact_complex_top_of_market_bid_message() {
  CompactComplexTopOfMarketBidMessage compact_complex_top_of_market_bid_message_sent;
  CompactComplexTopOfMarketBidMessage compact_complex_top_of_market_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_sent, 0)
  :: pattern == 1 -> fill_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_sent, 32)
  :: pattern == 2 -> fill_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_sent, 255)
  :: else -> ramp_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_sent);
    assert(at == 13);
    at = 0;
    decode_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_got);
    assert(at == 13);
    equal_compact_complex_top_of_market_bid_message(compact_complex_top_of_market_bid_message_got, compact_complex_top_of_market_bid_message_sent)
  }
}

/* Compact Complex Top Of Market Offer Message: encoded, read back, and compared */
proctype check_compact_complex_top_of_market_offer_message() {
  CompactComplexTopOfMarketOfferMessage compact_complex_top_of_market_offer_message_sent;
  CompactComplexTopOfMarketOfferMessage compact_complex_top_of_market_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_sent, 0)
  :: pattern == 1 -> fill_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_sent, 32)
  :: pattern == 2 -> fill_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_sent, 255)
  :: else -> ramp_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_sent);
    assert(at == 15);
    at = 0;
    decode_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_got);
    assert(at == 15);
    equal_compact_complex_top_of_market_offer_message(compact_complex_top_of_market_offer_message_got, compact_complex_top_of_market_offer_message_sent)
  }
}

/* Wide Complex Top Of Market Bid Message: encoded, read back, and compared */
proctype check_wide_complex_top_of_market_bid_message() {
  WideComplexTopOfMarketBidMessage wide_complex_top_of_market_bid_message_sent;
  WideComplexTopOfMarketBidMessage wide_complex_top_of_market_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_sent, 0)
  :: pattern == 1 -> fill_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_sent, 32)
  :: pattern == 2 -> fill_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_sent, 255)
  :: else -> ramp_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_sent);
    assert(at == 25);
    at = 0;
    decode_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_got);
    assert(at == 25);
    equal_wide_complex_top_of_market_bid_message(wide_complex_top_of_market_bid_message_got, wide_complex_top_of_market_bid_message_sent)
  }
}

/* Wide Complex Top Of Market Offer Message: encoded, read back, and compared */
proctype check_wide_complex_top_of_market_offer_message() {
  WideComplexTopOfMarketOfferMessage wide_complex_top_of_market_offer_message_sent;
  WideComplexTopOfMarketOfferMessage wide_complex_top_of_market_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_sent, 0)
  :: pattern == 1 -> fill_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_sent, 32)
  :: pattern == 2 -> fill_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_sent, 255)
  :: else -> ramp_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_sent);
    assert(at == 25);
    at = 0;
    decode_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_got);
    assert(at == 25);
    equal_wide_complex_top_of_market_offer_message(wide_complex_top_of_market_offer_message_got, wide_complex_top_of_market_offer_message_sent)
  }
}

/* Compact Bid: encoded, read back, and compared */
proctype check_compact_bid() {
  CompactBid compact_bid_sent;
  CompactBid compact_bid_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_bid(compact_bid_sent, 0)
  :: pattern == 1 -> fill_compact_bid(compact_bid_sent, 32)
  :: pattern == 2 -> fill_compact_bid(compact_bid_sent, 255)
  :: else -> ramp_compact_bid(compact_bid_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_bid(compact_bid_sent);
    assert(at == 7);
    at = 0;
    decode_compact_bid(compact_bid_got);
    assert(at == 7);
    equal_compact_bid(compact_bid_got, compact_bid_sent)
  }
}

/* Compact Offer: encoded, read back, and compared */
proctype check_compact_offer() {
  CompactOffer compact_offer_sent;
  CompactOffer compact_offer_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_offer(compact_offer_sent, 0)
  :: pattern == 1 -> fill_compact_offer(compact_offer_sent, 32)
  :: pattern == 2 -> fill_compact_offer(compact_offer_sent, 255)
  :: else -> ramp_compact_offer(compact_offer_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_offer(compact_offer_sent);
    assert(at == 7);
    at = 0;
    decode_compact_offer(compact_offer_got);
    assert(at == 7);
    equal_compact_offer(compact_offer_got, compact_offer_sent)
  }
}

/* Compact Complex Double Sided Top Of Market Message: encoded, read back, and compared */
proctype check_compact_complex_double_sided_top_of_market_message() {
  CompactComplexDoubleSidedTopOfMarketMessage compact_complex_double_sided_top_of_market_message_sent;
  CompactComplexDoubleSidedTopOfMarketMessage compact_complex_double_sided_top_of_market_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_sent, 0)
  :: pattern == 1 -> fill_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_sent, 32)
  :: pattern == 2 -> fill_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_sent, 255)
  :: else -> ramp_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_sent);
    assert(at == 22);
    at = 0;
    decode_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_got);
    assert(at == 22);
    equal_compact_complex_double_sided_top_of_market_message(compact_complex_double_sided_top_of_market_message_got, compact_complex_double_sided_top_of_market_message_sent)
  }
}

/* Wide Bid: encoded, read back, and compared */
proctype check_wide_bid() {
  WideBid wide_bid_sent;
  WideBid wide_bid_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_bid(wide_bid_sent, 0)
  :: pattern == 1 -> fill_wide_bid(wide_bid_sent, 32)
  :: pattern == 2 -> fill_wide_bid(wide_bid_sent, 255)
  :: else -> ramp_wide_bid(wide_bid_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_bid(wide_bid_sent);
    assert(at == 17);
    at = 0;
    decode_wide_bid(wide_bid_got);
    assert(at == 17);
    equal_wide_bid(wide_bid_got, wide_bid_sent)
  }
}

/* Wide Offer: encoded, read back, and compared */
proctype check_wide_offer() {
  WideOffer wide_offer_sent;
  WideOffer wide_offer_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_offer(wide_offer_sent, 0)
  :: pattern == 1 -> fill_wide_offer(wide_offer_sent, 32)
  :: pattern == 2 -> fill_wide_offer(wide_offer_sent, 255)
  :: else -> ramp_wide_offer(wide_offer_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_offer(wide_offer_sent);
    assert(at == 17);
    at = 0;
    decode_wide_offer(wide_offer_got);
    assert(at == 17);
    equal_wide_offer(wide_offer_got, wide_offer_sent)
  }
}

/* Wide Complex Double Sided Top Of Market Message: encoded, read back, and compared */
proctype check_wide_complex_double_sided_top_of_market_message() {
  WideComplexDoubleSidedTopOfMarketMessage wide_complex_double_sided_top_of_market_message_sent;
  WideComplexDoubleSidedTopOfMarketMessage wide_complex_double_sided_top_of_market_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_sent, 0)
  :: pattern == 1 -> fill_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_sent, 32)
  :: pattern == 2 -> fill_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_sent, 255)
  :: else -> ramp_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_sent);
    assert(at == 42);
    at = 0;
    decode_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_got);
    assert(at == 42);
    equal_wide_complex_double_sided_top_of_market_message(wide_complex_double_sided_top_of_market_message_got, wide_complex_double_sided_top_of_market_message_sent)
  }
}

/* Strategy Trade Message: encoded, read back, and compared */
proctype check_strategy_trade_message() {
  StrategyTradeMessage strategy_trade_message_sent;
  StrategyTradeMessage strategy_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strategy_trade_message(strategy_trade_message_sent, 0)
  :: pattern == 1 -> fill_strategy_trade_message(strategy_trade_message_sent, 32)
  :: pattern == 2 -> fill_strategy_trade_message(strategy_trade_message_sent, 255)
  :: else -> ramp_strategy_trade_message(strategy_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strategy_trade_message(strategy_trade_message_sent);
    assert(at == 41);
    at = 0;
    decode_strategy_trade_message(strategy_trade_message_got);
    assert(at == 41);
    equal_strategy_trade_message(strategy_trade_message_got, strategy_trade_message_sent)
  }
}

/* Underlying Trading Status Message: encoded, read back, and compared */
proctype check_underlying_trading_status_message() {
  UnderlyingTradingStatusMessage underlying_trading_status_message_sent;
  UnderlyingTradingStatusMessage underlying_trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_trading_status_message(underlying_trading_status_message_sent, 0)
  :: pattern == 1 -> fill_underlying_trading_status_message(underlying_trading_status_message_sent, 32)
  :: pattern == 2 -> fill_underlying_trading_status_message(underlying_trading_status_message_sent, 255)
  :: else -> ramp_underlying_trading_status_message(underlying_trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_trading_status_message(underlying_trading_status_message_sent);
    assert(at == 25);
    at = 0;
    decode_underlying_trading_status_message(underlying_trading_status_message_got);
    assert(at == 25);
    equal_underlying_trading_status_message(underlying_trading_status_message_got, underlying_trading_status_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_system_time_message()
  :: run check_series_update()
  :: run check_system_state_message()
  :: run check_compact_complex_top_of_market_bid_message()
  :: run check_compact_complex_top_of_market_offer_message()
  :: run check_wide_complex_top_of_market_bid_message()
  :: run check_wide_complex_top_of_market_offer_message()
  :: run check_compact_bid()
  :: run check_compact_offer()
  :: run check_compact_complex_double_sided_top_of_market_message()
  :: run check_wide_bid()
  :: run check_wide_offer()
  :: run check_wide_complex_double_sided_top_of_market_message()
  :: run check_strategy_trade_message()
  :: run check_underlying_trading_status_message()
  fi
}
