/*
 * Miami International Holdings Complex Top of Market
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

/* ---- Simple Series Update Message: 72 bytes ---------------------------------- */

/* This is the message format that will be used to disseminate all Option series traded on Emerald for the current session. */
typedef SimpleSeriesUpdateMessage {
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
  byte active_on_emerald;
  byte emerald_bbo_posting_increment_indicator;
  byte liquidity_acceptance_increment_indicator;
  byte opening_underlying_market_code;
  byte priority_quote_width[4];
  byte reserved_8[8]
};

int simple_series_update_message_at;

/* every byte of Simple Series Update Message set to one value */
inline fill_simple_series_update_message(simple_series_update_message_record, simple_series_update_message_value) {
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.nanoseconds[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.product_id[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 11 -> simple_series_update_message_record.underlying_symbol[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 6 -> simple_series_update_message_record.security_symbol[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.expiration_date[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.strike_price[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_record.call_or_put = simple_series_update_message_value;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.opening_time[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.closing_time[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_record.restricted_option = simple_series_update_message_value;
  simple_series_update_message_record.long_term_option = simple_series_update_message_value;
  simple_series_update_message_record.active_on_emerald = simple_series_update_message_value;
  simple_series_update_message_record.emerald_bbo_posting_increment_indicator = simple_series_update_message_value;
  simple_series_update_message_record.liquidity_acceptance_increment_indicator = simple_series_update_message_value;
  simple_series_update_message_record.opening_underlying_market_code = simple_series_update_message_value;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.priority_quote_width[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.reserved_8[simple_series_update_message_at] = simple_series_update_message_value; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Series Update Message set to where it lies, so a field read out of place says so */
inline ramp_simple_series_update_message(simple_series_update_message_record, simple_series_update_message_base) {
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.nanoseconds[simple_series_update_message_at] = (simple_series_update_message_base + 0 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.product_id[simple_series_update_message_at] = (simple_series_update_message_base + 4 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 11 -> simple_series_update_message_record.underlying_symbol[simple_series_update_message_at] = (simple_series_update_message_base + 8 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 6 -> simple_series_update_message_record.security_symbol[simple_series_update_message_at] = (simple_series_update_message_base + 19 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.expiration_date[simple_series_update_message_at] = (simple_series_update_message_base + 25 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.strike_price[simple_series_update_message_at] = (simple_series_update_message_base + 33 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_record.call_or_put = (simple_series_update_message_base + 37 + 1) % 256;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.opening_time[simple_series_update_message_at] = (simple_series_update_message_base + 38 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.closing_time[simple_series_update_message_at] = (simple_series_update_message_base + 46 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_record.restricted_option = (simple_series_update_message_base + 54 + 1) % 256;
  simple_series_update_message_record.long_term_option = (simple_series_update_message_base + 55 + 1) % 256;
  simple_series_update_message_record.active_on_emerald = (simple_series_update_message_base + 56 + 1) % 256;
  simple_series_update_message_record.emerald_bbo_posting_increment_indicator = (simple_series_update_message_base + 57 + 1) % 256;
  simple_series_update_message_record.liquidity_acceptance_increment_indicator = (simple_series_update_message_base + 58 + 1) % 256;
  simple_series_update_message_record.opening_underlying_market_code = (simple_series_update_message_base + 59 + 1) % 256;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.priority_quote_width[simple_series_update_message_at] = (simple_series_update_message_base + 60 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.reserved_8[simple_series_update_message_at] = (simple_series_update_message_base + 64 + simple_series_update_message_at + 1) % 256; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Series Update Message to the wire, 72 bytes from where the cursor stands */
inline encode_simple_series_update_message(simple_series_update_message_record) {
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> wire[at] = simple_series_update_message_record.nanoseconds[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> wire[at] = simple_series_update_message_record.product_id[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 11 -> wire[at] = simple_series_update_message_record.underlying_symbol[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 6 -> wire[at] = simple_series_update_message_record.security_symbol[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> wire[at] = simple_series_update_message_record.expiration_date[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> wire[at] = simple_series_update_message_record.strike_price[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_series_update_message_record.call_or_put; at = at + 1;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> wire[at] = simple_series_update_message_record.opening_time[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> wire[at] = simple_series_update_message_record.closing_time[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_series_update_message_record.restricted_option; at = at + 1;
  wire[at] = simple_series_update_message_record.long_term_option; at = at + 1;
  wire[at] = simple_series_update_message_record.active_on_emerald; at = at + 1;
  wire[at] = simple_series_update_message_record.emerald_bbo_posting_increment_indicator; at = at + 1;
  wire[at] = simple_series_update_message_record.liquidity_acceptance_increment_indicator; at = at + 1;
  wire[at] = simple_series_update_message_record.opening_underlying_market_code; at = at + 1;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> wire[at] = simple_series_update_message_record.priority_quote_width[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> wire[at] = simple_series_update_message_record.reserved_8[simple_series_update_message_at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Series Update Message off the wire, 72 bytes from where the cursor stands */
inline decode_simple_series_update_message(simple_series_update_message_record) {
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.nanoseconds[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.product_id[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 11 -> simple_series_update_message_record.underlying_symbol[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 6 -> simple_series_update_message_record.security_symbol[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.expiration_date[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.strike_price[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_record.call_or_put = wire[at]; at = at + 1;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.opening_time[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.closing_time[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_record.restricted_option = wire[at]; at = at + 1;
  simple_series_update_message_record.long_term_option = wire[at]; at = at + 1;
  simple_series_update_message_record.active_on_emerald = wire[at]; at = at + 1;
  simple_series_update_message_record.emerald_bbo_posting_increment_indicator = wire[at]; at = at + 1;
  simple_series_update_message_record.liquidity_acceptance_increment_indicator = wire[at]; at = at + 1;
  simple_series_update_message_record.opening_underlying_market_code = wire[at]; at = at + 1;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> simple_series_update_message_record.priority_quote_width[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> simple_series_update_message_record.reserved_8[simple_series_update_message_at] = wire[at]; at = at + 1; simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Series Update Message is what was written, byte for byte */
inline equal_simple_series_update_message(simple_series_update_message_read, simple_series_update_message_written) {
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> assert(simple_series_update_message_read.nanoseconds[simple_series_update_message_at] == simple_series_update_message_written.nanoseconds[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> assert(simple_series_update_message_read.product_id[simple_series_update_message_at] == simple_series_update_message_written.product_id[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 11 -> assert(simple_series_update_message_read.underlying_symbol[simple_series_update_message_at] == simple_series_update_message_written.underlying_symbol[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 6 -> assert(simple_series_update_message_read.security_symbol[simple_series_update_message_at] == simple_series_update_message_written.security_symbol[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> assert(simple_series_update_message_read.expiration_date[simple_series_update_message_at] == simple_series_update_message_written.expiration_date[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> assert(simple_series_update_message_read.strike_price[simple_series_update_message_at] == simple_series_update_message_written.strike_price[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  assert(simple_series_update_message_read.call_or_put == simple_series_update_message_written.call_or_put);
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> assert(simple_series_update_message_read.opening_time[simple_series_update_message_at] == simple_series_update_message_written.opening_time[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> assert(simple_series_update_message_read.closing_time[simple_series_update_message_at] == simple_series_update_message_written.closing_time[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  assert(simple_series_update_message_read.restricted_option == simple_series_update_message_written.restricted_option);
  assert(simple_series_update_message_read.long_term_option == simple_series_update_message_written.long_term_option);
  assert(simple_series_update_message_read.active_on_emerald == simple_series_update_message_written.active_on_emerald);
  assert(simple_series_update_message_read.emerald_bbo_posting_increment_indicator == simple_series_update_message_written.emerald_bbo_posting_increment_indicator);
  assert(simple_series_update_message_read.liquidity_acceptance_increment_indicator == simple_series_update_message_written.liquidity_acceptance_increment_indicator);
  assert(simple_series_update_message_read.opening_underlying_market_code == simple_series_update_message_written.opening_underlying_market_code);
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 4 -> assert(simple_series_update_message_read.priority_quote_width[simple_series_update_message_at] == simple_series_update_message_written.priority_quote_width[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
  :: else -> break
  od;
  simple_series_update_message_at = 0;
  do
  :: simple_series_update_message_at < 8 -> assert(simple_series_update_message_read.reserved_8[simple_series_update_message_at] == simple_series_update_message_written.reserved_8[simple_series_update_message_at]); simple_series_update_message_at = simple_series_update_message_at + 1
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

/* ---- Complex Top Of Market Best Bid Or Offer Compact Format Bid Message: 15 bytes ---- */

/* This is the message format that will be used to disseminate each side of the Emerald Complex Top of Market for strategies with low Net Price and small aggregate Emerald Best Bid or Offer (MBBO) size. Emerald Complex Top of Market on Bid side. */
typedef ComplexTopOfMarketBestBidOrOfferCompactFormatBidMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte price_short[2];
  byte size_short[2];
  byte priority_customer_size_short[2];
  byte condition
};

int complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at;

/* every byte of Complex Top Of Market Best Bid Or Offer Compact Format Bid Message set to one value */
inline fill_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record, complex_top_of_market_best_bid_or_offer_compact_format_bid_message_value) {
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_value; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_value; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_value; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_value; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_value; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.condition = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_value;
  skip
}

/* each byte of Complex Top Of Market Best Bid Or Offer Compact Format Bid Message set to where it lies, so a field read out of place says so */
inline ramp_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record, complex_top_of_market_best_bid_or_offer_compact_format_bid_message_base) {
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_bid_message_base + 0 + complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_bid_message_base + 4 + complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_bid_message_base + 8 + complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_bid_message_base + 10 + complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_bid_message_base + 12 + complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.condition = (complex_top_of_market_best_bid_or_offer_compact_format_bid_message_base + 14 + 1) % 256;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Compact Format Bid Message to the wire, 15 bytes from where the cursor stands */
inline encode_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record) {
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.condition; at = at + 1;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Compact Format Bid Message off the wire, 15 bytes from where the cursor stands */
inline decode_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record) {
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_record.condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Top Of Market Best Bid Or Offer Compact Format Bid Message is what was written, byte for byte */
inline equal_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_read, complex_top_of_market_best_bid_or_offer_compact_format_bid_message_written) {
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_read.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_bid_message_written.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_read.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_bid_message_written.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_read.price_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_bid_message_written.price_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_read.size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_bid_message_written.size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at < 2 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_read.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_bid_message_written.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at = complex_top_of_market_best_bid_or_offer_compact_format_bid_message_at + 1
  :: else -> break
  od;
  assert(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_read.condition == complex_top_of_market_best_bid_or_offer_compact_format_bid_message_written.condition);
  skip
}

/* ---- Complex Top Of Market Best Bid Or Offer Compact Format Offer Message: 15 bytes ---- */

/* This is the message format that will be used to disseminate each side of the Emerald Complex Top of Market for strategies with low Net Price and small aggregate Emerald Best Bid or Offer (MBBO) size. Emerald Complex Top of Market on Offer side. */
typedef ComplexTopOfMarketBestBidOrOfferCompactFormatOfferMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte price_short[2];
  byte size_short[2];
  byte priority_customer_size_short[2];
  byte condition
};

int complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at;

/* every byte of Complex Top Of Market Best Bid Or Offer Compact Format Offer Message set to one value */
inline fill_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record, complex_top_of_market_best_bid_or_offer_compact_format_offer_message_value) {
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_value; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_value; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_value; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_value; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_value; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.condition = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_value;
  skip
}

/* each byte of Complex Top Of Market Best Bid Or Offer Compact Format Offer Message set to where it lies, so a field read out of place says so */
inline ramp_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record, complex_top_of_market_best_bid_or_offer_compact_format_offer_message_base) {
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_offer_message_base + 0 + complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_offer_message_base + 4 + complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_offer_message_base + 8 + complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_offer_message_base + 10 + complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_compact_format_offer_message_base + 12 + complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.condition = (complex_top_of_market_best_bid_or_offer_compact_format_offer_message_base + 14 + 1) % 256;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Compact Format Offer Message to the wire, 15 bytes from where the cursor stands */
inline encode_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record) {
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.condition; at = at + 1;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Compact Format Offer Message off the wire, 15 bytes from where the cursor stands */
inline decode_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record) {
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.price_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_record.condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Top Of Market Best Bid Or Offer Compact Format Offer Message is what was written, byte for byte */
inline equal_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_read, complex_top_of_market_best_bid_or_offer_compact_format_offer_message_written) {
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_read.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_offer_message_written.nanoseconds[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_read.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_offer_message_written.strategy_id[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_read.price_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_offer_message_written.price_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_read.size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_offer_message_written.size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at < 2 -> assert(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_read.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_compact_format_offer_message_written.priority_customer_size_short[complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at = complex_top_of_market_best_bid_or_offer_compact_format_offer_message_at + 1
  :: else -> break
  od;
  assert(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_read.condition == complex_top_of_market_best_bid_or_offer_compact_format_offer_message_written.condition);
  skip
}

/* ---- Complex Top Of Market Best Bid Or Offer Wide Format Bid Message: 25 bytes ---- */

/* This is the message format that will be used to disseminate Emerald Complex Top of Market for strategies with high net price or large aggregate Emerald Best Bid or Offer (EBBO) size. Emerald Complex Top of Market on Bid side. */
typedef ComplexTopOfMarketBestBidOrOfferWideFormatBidMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte price_long[8];
  byte size_long[4];
  byte priority_customer_size_long[4];
  byte condition
};

int complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at;

/* every byte of Complex Top Of Market Best Bid Or Offer Wide Format Bid Message set to one value */
inline fill_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record, complex_top_of_market_best_bid_or_offer_wide_format_bid_message_value) {
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_value; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_value; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 8 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_value; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_value; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_value; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.condition = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_value;
  skip
}

/* each byte of Complex Top Of Market Best Bid Or Offer Wide Format Bid Message set to where it lies, so a field read out of place says so */
inline ramp_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record, complex_top_of_market_best_bid_or_offer_wide_format_bid_message_base) {
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_bid_message_base + 0 + complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_bid_message_base + 4 + complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 8 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_bid_message_base + 8 + complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_bid_message_base + 16 + complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_bid_message_base + 20 + complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.condition = (complex_top_of_market_best_bid_or_offer_wide_format_bid_message_base + 24 + 1) % 256;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Wide Format Bid Message to the wire, 25 bytes from where the cursor stands */
inline encode_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record) {
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 8 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.condition; at = at + 1;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Wide Format Bid Message off the wire, 25 bytes from where the cursor stands */
inline decode_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record) {
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 8 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_record.condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Top Of Market Best Bid Or Offer Wide Format Bid Message is what was written, byte for byte */
inline equal_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_read, complex_top_of_market_best_bid_or_offer_wide_format_bid_message_written) {
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_read.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_bid_message_written.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_read.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_bid_message_written.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 8 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_read.price_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_bid_message_written.price_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_read.size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_bid_message_written.size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_read.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_bid_message_written.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at = complex_top_of_market_best_bid_or_offer_wide_format_bid_message_at + 1
  :: else -> break
  od;
  assert(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_read.condition == complex_top_of_market_best_bid_or_offer_wide_format_bid_message_written.condition);
  skip
}

/* ---- Complex Top Of Market Best Bid Or Offer Wide Format Offer Message: 25 bytes ---- */

/* This is the message format that will be used to disseminate Emerald Complex Top of Market for strategies with high net price or large aggregate Emerald Best Bid or Offer (EBBO) size. Emerald Complex Top of Market on Offer side. */
typedef ComplexTopOfMarketBestBidOrOfferWideFormatOfferMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte price_long[8];
  byte size_long[4];
  byte priority_customer_size_long[4];
  byte condition
};

int complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at;

/* every byte of Complex Top Of Market Best Bid Or Offer Wide Format Offer Message set to one value */
inline fill_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record, complex_top_of_market_best_bid_or_offer_wide_format_offer_message_value) {
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_value; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_value; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 8 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_value; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_value; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_value; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.condition = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_value;
  skip
}

/* each byte of Complex Top Of Market Best Bid Or Offer Wide Format Offer Message set to where it lies, so a field read out of place says so */
inline ramp_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record, complex_top_of_market_best_bid_or_offer_wide_format_offer_message_base) {
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_offer_message_base + 0 + complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_offer_message_base + 4 + complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 8 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_offer_message_base + 8 + complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_offer_message_base + 16 + complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = (complex_top_of_market_best_bid_or_offer_wide_format_offer_message_base + 20 + complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1) % 256; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.condition = (complex_top_of_market_best_bid_or_offer_wide_format_offer_message_base + 24 + 1) % 256;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Wide Format Offer Message to the wire, 25 bytes from where the cursor stands */
inline encode_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record) {
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 8 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.condition; at = at + 1;
  skip
}

/* Complex Top Of Market Best Bid Or Offer Wide Format Offer Message off the wire, 25 bytes from where the cursor stands */
inline decode_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record) {
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 8 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.price_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] = wire[at]; at = at + 1; complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_record.condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Top Of Market Best Bid Or Offer Wide Format Offer Message is what was written, byte for byte */
inline equal_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_read, complex_top_of_market_best_bid_or_offer_wide_format_offer_message_written) {
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_read.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_offer_message_written.nanoseconds[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_read.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_offer_message_written.strategy_id[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 8 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_read.price_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_offer_message_written.price_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_read.size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_offer_message_written.size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = 0;
  do
  :: complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at < 4 -> assert(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_read.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at] == complex_top_of_market_best_bid_or_offer_wide_format_offer_message_written.priority_customer_size_long[complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at]); complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at = complex_top_of_market_best_bid_or_offer_wide_format_offer_message_at + 1
  :: else -> break
  od;
  assert(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_read.condition == complex_top_of_market_best_bid_or_offer_wide_format_offer_message_written.condition);
  skip
}

/* ---- Complex Double Sided Top Of Market Best Bid And Offer Compact Format Message: 22 bytes ---- */

/* This is the message format that will be used to disseminate both sides of the Emerald top of market for strategies (cEBBO) with low net price and small aggregate size. */
typedef ComplexDoubleSidedTopOfMarketBestBidAndOfferCompactFormatMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte bid_priority_customer_size_short[2];
  byte bid_condition;
  byte offer_price_short[2];
  byte offer_size_short[2];
  byte offer_priority_customer_size_short[2];
  byte offer_condition
};

int complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at;

/* every byte of Complex Double Sided Top Of Market Best Bid And Offer Compact Format Message set to one value */
inline fill_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record, complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value) {
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_condition = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_condition = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_value;
  skip
}

/* each byte of Complex Double Sided Top Of Market Best Bid And Offer Compact Format Message set to where it lies, so a field read out of place says so */
inline ramp_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record, complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base) {
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 0 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 4 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 8 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 10 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 12 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_condition = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 14 + 1) % 256;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 15 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 17 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 19 + complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_condition = (complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_base + 21 + 1) % 256;
  skip
}

/* Complex Double Sided Top Of Market Best Bid And Offer Compact Format Message to the wire, 22 bytes from where the cursor stands */
inline encode_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record) {
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_condition; at = at + 1;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_condition; at = at + 1;
  skip
}

/* Complex Double Sided Top Of Market Best Bid And Offer Compact Format Message off the wire, 22 bytes from where the cursor stands */
inline decode_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record) {
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.bid_condition = wire[at]; at = at + 1;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Double Sided Top Of Market Best Bid And Offer Compact Format Message is what was written, byte for byte */
inline equal_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read, complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written) {
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.bid_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.bid_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.bid_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.bid_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.bid_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.bid_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.bid_condition == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.bid_condition);
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.offer_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.offer_price_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.offer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.offer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at < 2 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.offer_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.offer_priority_customer_size_short[complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_at + 1
  :: else -> break
  od;
  assert(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_read.offer_condition == complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_written.offer_condition);
  skip
}

/* ---- Complex Double Sided Top Of Market Best Bid And Offer Wide Format Message: 42 bytes ---- */

/* This is the message format that will be used to disseminate both sides of the Emerald top of market for strategies (cEBBO) with net prices or aggregate sizes which cannot be specified in the compact format. */
typedef ComplexDoubleSidedTopOfMarketBestBidAndOfferWideFormatMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte bid_price_long[8];
  byte bid_size_long[4];
  byte bid_priority_customer_size_long[4];
  byte bid_condition;
  byte offer_price_long[8];
  byte offer_size_long[4];
  byte offer_priority_customer_size_long[4];
  byte offer_condition
};

int complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at;

/* every byte of Complex Double Sided Top Of Market Best Bid And Offer Wide Format Message set to one value */
inline fill_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record, complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value) {
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_condition = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_condition = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_value;
  skip
}

/* each byte of Complex Double Sided Top Of Market Best Bid And Offer Wide Format Message set to where it lies, so a field read out of place says so */
inline ramp_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record, complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base) {
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 0 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 4 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 8 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 16 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 20 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_condition = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 24 + 1) % 256;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 25 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 33 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 37 + complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1) % 256; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_condition = (complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_base + 41 + 1) % 256;
  skip
}

/* Complex Double Sided Top Of Market Best Bid And Offer Wide Format Message to the wire, 42 bytes from where the cursor stands */
inline encode_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record) {
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_condition; at = at + 1;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_condition; at = at + 1;
  skip
}

/* Complex Double Sided Top Of Market Best Bid And Offer Wide Format Message off the wire, 42 bytes from where the cursor stands */
inline decode_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record) {
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.bid_condition = wire[at]; at = at + 1;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] = wire[at]; at = at + 1; complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Double Sided Top Of Market Best Bid And Offer Wide Format Message is what was written, byte for byte */
inline equal_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read, complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written) {
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.nanoseconds[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.strategy_id[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.bid_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.bid_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.bid_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.bid_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.bid_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.bid_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.bid_condition == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.bid_condition);
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 8 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.offer_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.offer_price_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.offer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.offer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = 0;
  do
  :: complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at < 4 -> assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.offer_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at] == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.offer_priority_customer_size_long[complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at]); complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at = complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_at + 1
  :: else -> break
  od;
  assert(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_read.offer_condition == complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_written.offer_condition);
  skip
}

/* ---- Strategy Last Sale Message: 41 bytes ------------------------------------ */

/* This is the message format that will be used to disseminate Trades that are resulting from executions on Emerald during the current trading session. */
typedef StrategyLastSaleMessage {
  byte nanoseconds[4];
  byte strategy_id[4];
  byte trade_id[4];
  byte net_price[8];
  byte size_long[4];
  byte condition;
  byte reserved_16[16]
};

int strategy_last_sale_message_at;

/* every byte of Strategy Last Sale Message set to one value */
inline fill_strategy_last_sale_message(strategy_last_sale_message_record, strategy_last_sale_message_value) {
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.nanoseconds[strategy_last_sale_message_at] = strategy_last_sale_message_value; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.strategy_id[strategy_last_sale_message_at] = strategy_last_sale_message_value; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.trade_id[strategy_last_sale_message_at] = strategy_last_sale_message_value; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 8 -> strategy_last_sale_message_record.net_price[strategy_last_sale_message_at] = strategy_last_sale_message_value; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.size_long[strategy_last_sale_message_at] = strategy_last_sale_message_value; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_record.condition = strategy_last_sale_message_value;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 16 -> strategy_last_sale_message_record.reserved_16[strategy_last_sale_message_at] = strategy_last_sale_message_value; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Strategy Last Sale Message set to where it lies, so a field read out of place says so */
inline ramp_strategy_last_sale_message(strategy_last_sale_message_record, strategy_last_sale_message_base) {
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.nanoseconds[strategy_last_sale_message_at] = (strategy_last_sale_message_base + 0 + strategy_last_sale_message_at + 1) % 256; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.strategy_id[strategy_last_sale_message_at] = (strategy_last_sale_message_base + 4 + strategy_last_sale_message_at + 1) % 256; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.trade_id[strategy_last_sale_message_at] = (strategy_last_sale_message_base + 8 + strategy_last_sale_message_at + 1) % 256; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 8 -> strategy_last_sale_message_record.net_price[strategy_last_sale_message_at] = (strategy_last_sale_message_base + 12 + strategy_last_sale_message_at + 1) % 256; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.size_long[strategy_last_sale_message_at] = (strategy_last_sale_message_base + 20 + strategy_last_sale_message_at + 1) % 256; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_record.condition = (strategy_last_sale_message_base + 24 + 1) % 256;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 16 -> strategy_last_sale_message_record.reserved_16[strategy_last_sale_message_at] = (strategy_last_sale_message_base + 25 + strategy_last_sale_message_at + 1) % 256; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strategy Last Sale Message to the wire, 41 bytes from where the cursor stands */
inline encode_strategy_last_sale_message(strategy_last_sale_message_record) {
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> wire[at] = strategy_last_sale_message_record.nanoseconds[strategy_last_sale_message_at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> wire[at] = strategy_last_sale_message_record.strategy_id[strategy_last_sale_message_at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> wire[at] = strategy_last_sale_message_record.trade_id[strategy_last_sale_message_at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 8 -> wire[at] = strategy_last_sale_message_record.net_price[strategy_last_sale_message_at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> wire[at] = strategy_last_sale_message_record.size_long[strategy_last_sale_message_at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = strategy_last_sale_message_record.condition; at = at + 1;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 16 -> wire[at] = strategy_last_sale_message_record.reserved_16[strategy_last_sale_message_at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strategy Last Sale Message off the wire, 41 bytes from where the cursor stands */
inline decode_strategy_last_sale_message(strategy_last_sale_message_record) {
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.nanoseconds[strategy_last_sale_message_at] = wire[at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.strategy_id[strategy_last_sale_message_at] = wire[at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.trade_id[strategy_last_sale_message_at] = wire[at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 8 -> strategy_last_sale_message_record.net_price[strategy_last_sale_message_at] = wire[at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> strategy_last_sale_message_record.size_long[strategy_last_sale_message_at] = wire[at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_record.condition = wire[at]; at = at + 1;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 16 -> strategy_last_sale_message_record.reserved_16[strategy_last_sale_message_at] = wire[at]; at = at + 1; strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Strategy Last Sale Message is what was written, byte for byte */
inline equal_strategy_last_sale_message(strategy_last_sale_message_read, strategy_last_sale_message_written) {
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> assert(strategy_last_sale_message_read.nanoseconds[strategy_last_sale_message_at] == strategy_last_sale_message_written.nanoseconds[strategy_last_sale_message_at]); strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> assert(strategy_last_sale_message_read.strategy_id[strategy_last_sale_message_at] == strategy_last_sale_message_written.strategy_id[strategy_last_sale_message_at]); strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> assert(strategy_last_sale_message_read.trade_id[strategy_last_sale_message_at] == strategy_last_sale_message_written.trade_id[strategy_last_sale_message_at]); strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 8 -> assert(strategy_last_sale_message_read.net_price[strategy_last_sale_message_at] == strategy_last_sale_message_written.net_price[strategy_last_sale_message_at]); strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 4 -> assert(strategy_last_sale_message_read.size_long[strategy_last_sale_message_at] == strategy_last_sale_message_written.size_long[strategy_last_sale_message_at]); strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
  assert(strategy_last_sale_message_read.condition == strategy_last_sale_message_written.condition);
  strategy_last_sale_message_at = 0;
  do
  :: strategy_last_sale_message_at < 16 -> assert(strategy_last_sale_message_read.reserved_16[strategy_last_sale_message_at] == strategy_last_sale_message_written.reserved_16[strategy_last_sale_message_at]); strategy_last_sale_message_at = strategy_last_sale_message_at + 1
  :: else -> break
  od;
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

/* Simple Series Update Message: encoded, read back, and compared */
proctype check_simple_series_update_message() {
  SimpleSeriesUpdateMessage simple_series_update_message_sent;
  SimpleSeriesUpdateMessage simple_series_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_series_update_message(simple_series_update_message_sent, 0)
  :: pattern == 1 -> fill_simple_series_update_message(simple_series_update_message_sent, 32)
  :: pattern == 2 -> fill_simple_series_update_message(simple_series_update_message_sent, 255)
  :: else -> ramp_simple_series_update_message(simple_series_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_series_update_message(simple_series_update_message_sent);
    assert(at == 72);
    at = 0;
    decode_simple_series_update_message(simple_series_update_message_got);
    assert(at == 72);
    equal_simple_series_update_message(simple_series_update_message_got, simple_series_update_message_sent)
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

/* Complex Top Of Market Best Bid Or Offer Compact Format Bid Message: encoded, read back, and compared */
proctype check_complex_top_of_market_best_bid_or_offer_compact_format_bid_message() {
  ComplexTopOfMarketBestBidOrOfferCompactFormatBidMessage complex_top_of_market_best_bid_or_offer_compact_format_bid_message_sent;
  ComplexTopOfMarketBestBidOrOfferCompactFormatBidMessage complex_top_of_market_best_bid_or_offer_compact_format_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_sent, 0)
  :: pattern == 1 -> fill_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_sent, 32)
  :: pattern == 2 -> fill_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_sent, 255)
  :: else -> ramp_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_sent);
    assert(at == 15);
    at = 0;
    decode_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_got);
    assert(at == 15);
    equal_complex_top_of_market_best_bid_or_offer_compact_format_bid_message(complex_top_of_market_best_bid_or_offer_compact_format_bid_message_got, complex_top_of_market_best_bid_or_offer_compact_format_bid_message_sent)
  }
}

/* Complex Top Of Market Best Bid Or Offer Compact Format Offer Message: encoded, read back, and compared */
proctype check_complex_top_of_market_best_bid_or_offer_compact_format_offer_message() {
  ComplexTopOfMarketBestBidOrOfferCompactFormatOfferMessage complex_top_of_market_best_bid_or_offer_compact_format_offer_message_sent;
  ComplexTopOfMarketBestBidOrOfferCompactFormatOfferMessage complex_top_of_market_best_bid_or_offer_compact_format_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_sent, 0)
  :: pattern == 1 -> fill_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_sent, 32)
  :: pattern == 2 -> fill_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_sent, 255)
  :: else -> ramp_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_sent);
    assert(at == 15);
    at = 0;
    decode_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_got);
    assert(at == 15);
    equal_complex_top_of_market_best_bid_or_offer_compact_format_offer_message(complex_top_of_market_best_bid_or_offer_compact_format_offer_message_got, complex_top_of_market_best_bid_or_offer_compact_format_offer_message_sent)
  }
}

/* Complex Top Of Market Best Bid Or Offer Wide Format Bid Message: encoded, read back, and compared */
proctype check_complex_top_of_market_best_bid_or_offer_wide_format_bid_message() {
  ComplexTopOfMarketBestBidOrOfferWideFormatBidMessage complex_top_of_market_best_bid_or_offer_wide_format_bid_message_sent;
  ComplexTopOfMarketBestBidOrOfferWideFormatBidMessage complex_top_of_market_best_bid_or_offer_wide_format_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_sent, 0)
  :: pattern == 1 -> fill_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_sent, 32)
  :: pattern == 2 -> fill_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_sent, 255)
  :: else -> ramp_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_sent);
    assert(at == 25);
    at = 0;
    decode_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_got);
    assert(at == 25);
    equal_complex_top_of_market_best_bid_or_offer_wide_format_bid_message(complex_top_of_market_best_bid_or_offer_wide_format_bid_message_got, complex_top_of_market_best_bid_or_offer_wide_format_bid_message_sent)
  }
}

/* Complex Top Of Market Best Bid Or Offer Wide Format Offer Message: encoded, read back, and compared */
proctype check_complex_top_of_market_best_bid_or_offer_wide_format_offer_message() {
  ComplexTopOfMarketBestBidOrOfferWideFormatOfferMessage complex_top_of_market_best_bid_or_offer_wide_format_offer_message_sent;
  ComplexTopOfMarketBestBidOrOfferWideFormatOfferMessage complex_top_of_market_best_bid_or_offer_wide_format_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_sent, 0)
  :: pattern == 1 -> fill_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_sent, 32)
  :: pattern == 2 -> fill_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_sent, 255)
  :: else -> ramp_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_sent);
    assert(at == 25);
    at = 0;
    decode_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_got);
    assert(at == 25);
    equal_complex_top_of_market_best_bid_or_offer_wide_format_offer_message(complex_top_of_market_best_bid_or_offer_wide_format_offer_message_got, complex_top_of_market_best_bid_or_offer_wide_format_offer_message_sent)
  }
}

/* Complex Double Sided Top Of Market Best Bid And Offer Compact Format Message: encoded, read back, and compared */
proctype check_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message() {
  ComplexDoubleSidedTopOfMarketBestBidAndOfferCompactFormatMessage complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_sent;
  ComplexDoubleSidedTopOfMarketBestBidAndOfferCompactFormatMessage complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_sent, 0)
  :: pattern == 1 -> fill_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_sent, 32)
  :: pattern == 2 -> fill_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_sent, 255)
  :: else -> ramp_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_sent);
    assert(at == 22);
    at = 0;
    decode_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_got);
    assert(at == 22);
    equal_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message(complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_got, complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message_sent)
  }
}

/* Complex Double Sided Top Of Market Best Bid And Offer Wide Format Message: encoded, read back, and compared */
proctype check_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message() {
  ComplexDoubleSidedTopOfMarketBestBidAndOfferWideFormatMessage complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_sent;
  ComplexDoubleSidedTopOfMarketBestBidAndOfferWideFormatMessage complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_sent, 0)
  :: pattern == 1 -> fill_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_sent, 32)
  :: pattern == 2 -> fill_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_sent, 255)
  :: else -> ramp_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_sent);
    assert(at == 42);
    at = 0;
    decode_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_got);
    assert(at == 42);
    equal_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message(complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_got, complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message_sent)
  }
}

/* Strategy Last Sale Message: encoded, read back, and compared */
proctype check_strategy_last_sale_message() {
  StrategyLastSaleMessage strategy_last_sale_message_sent;
  StrategyLastSaleMessage strategy_last_sale_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strategy_last_sale_message(strategy_last_sale_message_sent, 0)
  :: pattern == 1 -> fill_strategy_last_sale_message(strategy_last_sale_message_sent, 32)
  :: pattern == 2 -> fill_strategy_last_sale_message(strategy_last_sale_message_sent, 255)
  :: else -> ramp_strategy_last_sale_message(strategy_last_sale_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strategy_last_sale_message(strategy_last_sale_message_sent);
    assert(at == 41);
    at = 0;
    decode_strategy_last_sale_message(strategy_last_sale_message_got);
    assert(at == 41);
    equal_strategy_last_sale_message(strategy_last_sale_message_got, strategy_last_sale_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_system_time_message()
  :: run check_simple_series_update_message()
  :: run check_system_state_message()
  :: run check_complex_top_of_market_best_bid_or_offer_compact_format_bid_message()
  :: run check_complex_top_of_market_best_bid_or_offer_compact_format_offer_message()
  :: run check_complex_top_of_market_best_bid_or_offer_wide_format_bid_message()
  :: run check_complex_top_of_market_best_bid_or_offer_wide_format_offer_message()
  :: run check_complex_double_sided_top_of_market_best_bid_and_offer_compact_format_message()
  :: run check_complex_double_sided_top_of_market_best_bid_and_offer_wide_format_message()
  :: run check_strategy_last_sale_message()
  :: run check_underlying_trading_status_notification_message()
  fi
}
