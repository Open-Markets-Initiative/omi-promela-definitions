/*
 * Miami International Holdings Top of Market
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

/* This is the message format that will be used to disseminate all Option series traded on MIAX for the current session. The product ID sent in this message is what will be disseminated in Top of Market BBO and Last Sale messages. */
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
  byte active_on_miax;
  byte miax_bbo_posting_increment_indicator;
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
  simple_series_update_message_record.active_on_miax = simple_series_update_message_value;
  simple_series_update_message_record.miax_bbo_posting_increment_indicator = simple_series_update_message_value;
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
  simple_series_update_message_record.active_on_miax = (simple_series_update_message_base + 56 + 1) % 256;
  simple_series_update_message_record.miax_bbo_posting_increment_indicator = (simple_series_update_message_base + 57 + 1) % 256;
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
  wire[at] = simple_series_update_message_record.active_on_miax; at = at + 1;
  wire[at] = simple_series_update_message_record.miax_bbo_posting_increment_indicator; at = at + 1;
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
  simple_series_update_message_record.active_on_miax = wire[at]; at = at + 1;
  simple_series_update_message_record.miax_bbo_posting_increment_indicator = wire[at]; at = at + 1;
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
  assert(simple_series_update_message_read.active_on_miax == simple_series_update_message_written.active_on_miax);
  assert(simple_series_update_message_read.miax_bbo_posting_increment_indicator == simple_series_update_message_written.miax_bbo_posting_increment_indicator);
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

/* ---- Simple Top Of Market Best Bid Or Offer Compact Bid Message: 15 bytes ---- */

/* This is the message format that will be used to disseminate each side of the MIAX Simple Top of Market for options with low premiums and small aggregate MIAX Best Bid or Offer (MBBO) size. "B" = Simple Top of Market on Bid side. */
typedef SimpleTopOfMarketBestBidOrOfferCompactBidMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte m_b_b_o_price_short[2];
  byte m_b_b_o_size_short[2];
  byte m_b_b_o_priority_customer_size_short[2];
  byte mbbo_condition
};

int simple_top_of_market_best_bid_or_offer_compact_bid_message_at;

/* every byte of Simple Top Of Market Best Bid Or Offer Compact Bid Message set to one value */
inline fill_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_record, simple_top_of_market_best_bid_or_offer_compact_bid_message_value) {
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_value; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_value; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_value; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_value; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_value; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_record.mbbo_condition = simple_top_of_market_best_bid_or_offer_compact_bid_message_value;
  skip
}

/* each byte of Simple Top Of Market Best Bid Or Offer Compact Bid Message set to where it lies, so a field read out of place says so */
inline ramp_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_record, simple_top_of_market_best_bid_or_offer_compact_bid_message_base) {
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = (simple_top_of_market_best_bid_or_offer_compact_bid_message_base + 0 + simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = (simple_top_of_market_best_bid_or_offer_compact_bid_message_base + 4 + simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = (simple_top_of_market_best_bid_or_offer_compact_bid_message_base + 8 + simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = (simple_top_of_market_best_bid_or_offer_compact_bid_message_base + 10 + simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = (simple_top_of_market_best_bid_or_offer_compact_bid_message_base + 12 + simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_record.mbbo_condition = (simple_top_of_market_best_bid_or_offer_compact_bid_message_base + 14 + 1) % 256;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Compact Bid Message to the wire, 15 bytes from where the cursor stands */
inline encode_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_record) {
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_top_of_market_best_bid_or_offer_compact_bid_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Compact Bid Message off the wire, 15 bytes from where the cursor stands */
inline decode_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_record) {
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_bid_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Top Of Market Best Bid Or Offer Compact Bid Message is what was written, byte for byte */
inline equal_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_read, simple_top_of_market_best_bid_or_offer_compact_bid_message_written) {
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_compact_bid_message_read.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] == simple_top_of_market_best_bid_or_offer_compact_bid_message_written.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]); simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_compact_bid_message_read.product_id[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] == simple_top_of_market_best_bid_or_offer_compact_bid_message_written.product_id[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]); simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> assert(simple_top_of_market_best_bid_or_offer_compact_bid_message_read.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] == simple_top_of_market_best_bid_or_offer_compact_bid_message_written.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]); simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> assert(simple_top_of_market_best_bid_or_offer_compact_bid_message_read.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] == simple_top_of_market_best_bid_or_offer_compact_bid_message_written.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]); simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_bid_message_at < 2 -> assert(simple_top_of_market_best_bid_or_offer_compact_bid_message_read.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at] == simple_top_of_market_best_bid_or_offer_compact_bid_message_written.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_bid_message_at]); simple_top_of_market_best_bid_or_offer_compact_bid_message_at = simple_top_of_market_best_bid_or_offer_compact_bid_message_at + 1
  :: else -> break
  od;
  assert(simple_top_of_market_best_bid_or_offer_compact_bid_message_read.mbbo_condition == simple_top_of_market_best_bid_or_offer_compact_bid_message_written.mbbo_condition);
  skip
}

/* ---- Simple Top Of Market Best Bid Or Offer Compact Offer Message: 15 bytes ---- */

/* This is the message format that will be used to disseminate each side of the MIAX Simple Top of Market for options with low premiums and small aggregate MIAX Best Bid or Offer (MBBO) size. "O" = Simple Top of Market on Offer side. */
typedef SimpleTopOfMarketBestBidOrOfferCompactOfferMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte m_b_b_o_price_short[2];
  byte m_b_b_o_size_short[2];
  byte m_b_b_o_priority_customer_size_short[2];
  byte mbbo_condition
};

int simple_top_of_market_best_bid_or_offer_compact_offer_message_at;

/* every byte of Simple Top Of Market Best Bid Or Offer Compact Offer Message set to one value */
inline fill_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_record, simple_top_of_market_best_bid_or_offer_compact_offer_message_value) {
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_value; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_value; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_value; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_value; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_value; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_record.mbbo_condition = simple_top_of_market_best_bid_or_offer_compact_offer_message_value;
  skip
}

/* each byte of Simple Top Of Market Best Bid Or Offer Compact Offer Message set to where it lies, so a field read out of place says so */
inline ramp_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_record, simple_top_of_market_best_bid_or_offer_compact_offer_message_base) {
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = (simple_top_of_market_best_bid_or_offer_compact_offer_message_base + 0 + simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = (simple_top_of_market_best_bid_or_offer_compact_offer_message_base + 4 + simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = (simple_top_of_market_best_bid_or_offer_compact_offer_message_base + 8 + simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = (simple_top_of_market_best_bid_or_offer_compact_offer_message_base + 10 + simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = (simple_top_of_market_best_bid_or_offer_compact_offer_message_base + 12 + simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_record.mbbo_condition = (simple_top_of_market_best_bid_or_offer_compact_offer_message_base + 14 + 1) % 256;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Compact Offer Message to the wire, 15 bytes from where the cursor stands */
inline encode_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_record) {
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> wire[at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_top_of_market_best_bid_or_offer_compact_offer_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Compact Offer Message off the wire, 15 bytes from where the cursor stands */
inline decode_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_record) {
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> simple_top_of_market_best_bid_or_offer_compact_offer_message_record.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Top Of Market Best Bid Or Offer Compact Offer Message is what was written, byte for byte */
inline equal_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_read, simple_top_of_market_best_bid_or_offer_compact_offer_message_written) {
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_compact_offer_message_read.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] == simple_top_of_market_best_bid_or_offer_compact_offer_message_written.nanoseconds[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]); simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_compact_offer_message_read.product_id[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] == simple_top_of_market_best_bid_or_offer_compact_offer_message_written.product_id[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]); simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> assert(simple_top_of_market_best_bid_or_offer_compact_offer_message_read.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] == simple_top_of_market_best_bid_or_offer_compact_offer_message_written.m_b_b_o_price_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]); simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> assert(simple_top_of_market_best_bid_or_offer_compact_offer_message_read.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] == simple_top_of_market_best_bid_or_offer_compact_offer_message_written.m_b_b_o_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]); simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_compact_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_compact_offer_message_at < 2 -> assert(simple_top_of_market_best_bid_or_offer_compact_offer_message_read.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at] == simple_top_of_market_best_bid_or_offer_compact_offer_message_written.m_b_b_o_priority_customer_size_short[simple_top_of_market_best_bid_or_offer_compact_offer_message_at]); simple_top_of_market_best_bid_or_offer_compact_offer_message_at = simple_top_of_market_best_bid_or_offer_compact_offer_message_at + 1
  :: else -> break
  od;
  assert(simple_top_of_market_best_bid_or_offer_compact_offer_message_read.mbbo_condition == simple_top_of_market_best_bid_or_offer_compact_offer_message_written.mbbo_condition);
  skip
}

/* ---- Simple Top Of Market Best Bid Or Offer Wide Bid Message: 21 bytes ------- */

/* This is the message format that will be used to disseminate MIAX Simple Top of Market for options with high premiums or large aggregate MIAX Best Bid or Offer (MBBO) size. "b" = Simple Top of Market on Bid side (wide). */
typedef SimpleTopOfMarketBestBidOrOfferWideBidMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte m_b_b_o_price_long[4];
  byte m_b_b_o_size_long[4];
  byte m_b_b_o_priority_customer_size_long[4];
  byte mbbo_condition
};

int simple_top_of_market_best_bid_or_offer_wide_bid_message_at;

/* every byte of Simple Top Of Market Best Bid Or Offer Wide Bid Message set to one value */
inline fill_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_record, simple_top_of_market_best_bid_or_offer_wide_bid_message_value) {
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_value; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_value; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_value; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_value; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_value; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_record.mbbo_condition = simple_top_of_market_best_bid_or_offer_wide_bid_message_value;
  skip
}

/* each byte of Simple Top Of Market Best Bid Or Offer Wide Bid Message set to where it lies, so a field read out of place says so */
inline ramp_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_record, simple_top_of_market_best_bid_or_offer_wide_bid_message_base) {
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = (simple_top_of_market_best_bid_or_offer_wide_bid_message_base + 0 + simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = (simple_top_of_market_best_bid_or_offer_wide_bid_message_base + 4 + simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = (simple_top_of_market_best_bid_or_offer_wide_bid_message_base + 8 + simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = (simple_top_of_market_best_bid_or_offer_wide_bid_message_base + 12 + simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = (simple_top_of_market_best_bid_or_offer_wide_bid_message_base + 16 + simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_record.mbbo_condition = (simple_top_of_market_best_bid_or_offer_wide_bid_message_base + 20 + 1) % 256;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Wide Bid Message to the wire, 21 bytes from where the cursor stands */
inline encode_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_record) {
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_top_of_market_best_bid_or_offer_wide_bid_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Wide Bid Message off the wire, 21 bytes from where the cursor stands */
inline decode_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_record) {
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_bid_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Top Of Market Best Bid Or Offer Wide Bid Message is what was written, byte for byte */
inline equal_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_read, simple_top_of_market_best_bid_or_offer_wide_bid_message_written) {
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_bid_message_read.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] == simple_top_of_market_best_bid_or_offer_wide_bid_message_written.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]); simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_bid_message_read.product_id[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] == simple_top_of_market_best_bid_or_offer_wide_bid_message_written.product_id[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]); simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_bid_message_read.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] == simple_top_of_market_best_bid_or_offer_wide_bid_message_written.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]); simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_bid_message_read.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] == simple_top_of_market_best_bid_or_offer_wide_bid_message_written.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]); simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_bid_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_bid_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_bid_message_read.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at] == simple_top_of_market_best_bid_or_offer_wide_bid_message_written.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_bid_message_at]); simple_top_of_market_best_bid_or_offer_wide_bid_message_at = simple_top_of_market_best_bid_or_offer_wide_bid_message_at + 1
  :: else -> break
  od;
  assert(simple_top_of_market_best_bid_or_offer_wide_bid_message_read.mbbo_condition == simple_top_of_market_best_bid_or_offer_wide_bid_message_written.mbbo_condition);
  skip
}

/* ---- Simple Top Of Market Best Bid Or Offer Wide Offer Message: 21 bytes ----- */

/* This is the message format that will be used to disseminate MIAX Simple Top of Market for options with high premiums or large aggregate MIAX Best Bid or Offer (MBBO) size. "o" = Simple Top of Market on Offer side (wide). */
typedef SimpleTopOfMarketBestBidOrOfferWideOfferMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte m_b_b_o_price_long[4];
  byte m_b_b_o_size_long[4];
  byte m_b_b_o_priority_customer_size_long[4];
  byte mbbo_condition
};

int simple_top_of_market_best_bid_or_offer_wide_offer_message_at;

/* every byte of Simple Top Of Market Best Bid Or Offer Wide Offer Message set to one value */
inline fill_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_record, simple_top_of_market_best_bid_or_offer_wide_offer_message_value) {
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_value; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_value; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_value; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_value; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_value; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_record.mbbo_condition = simple_top_of_market_best_bid_or_offer_wide_offer_message_value;
  skip
}

/* each byte of Simple Top Of Market Best Bid Or Offer Wide Offer Message set to where it lies, so a field read out of place says so */
inline ramp_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_record, simple_top_of_market_best_bid_or_offer_wide_offer_message_base) {
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = (simple_top_of_market_best_bid_or_offer_wide_offer_message_base + 0 + simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = (simple_top_of_market_best_bid_or_offer_wide_offer_message_base + 4 + simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = (simple_top_of_market_best_bid_or_offer_wide_offer_message_base + 8 + simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = (simple_top_of_market_best_bid_or_offer_wide_offer_message_base + 12 + simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = (simple_top_of_market_best_bid_or_offer_wide_offer_message_base + 16 + simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1) % 256; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_record.mbbo_condition = (simple_top_of_market_best_bid_or_offer_wide_offer_message_base + 20 + 1) % 256;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Wide Offer Message to the wire, 21 bytes from where the cursor stands */
inline encode_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_record) {
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> wire[at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_top_of_market_best_bid_or_offer_wide_offer_message_record.mbbo_condition; at = at + 1;
  skip
}

/* Simple Top Of Market Best Bid Or Offer Wide Offer Message off the wire, 21 bytes from where the cursor stands */
inline decode_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_record) {
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.product_id[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> simple_top_of_market_best_bid_or_offer_wide_offer_message_record.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] = wire[at]; at = at + 1; simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_record.mbbo_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Top Of Market Best Bid Or Offer Wide Offer Message is what was written, byte for byte */
inline equal_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_read, simple_top_of_market_best_bid_or_offer_wide_offer_message_written) {
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_offer_message_read.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] == simple_top_of_market_best_bid_or_offer_wide_offer_message_written.nanoseconds[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]); simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_offer_message_read.product_id[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] == simple_top_of_market_best_bid_or_offer_wide_offer_message_written.product_id[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]); simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_offer_message_read.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] == simple_top_of_market_best_bid_or_offer_wide_offer_message_written.m_b_b_o_price_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]); simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_offer_message_read.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] == simple_top_of_market_best_bid_or_offer_wide_offer_message_written.m_b_b_o_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]); simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  simple_top_of_market_best_bid_or_offer_wide_offer_message_at = 0;
  do
  :: simple_top_of_market_best_bid_or_offer_wide_offer_message_at < 4 -> assert(simple_top_of_market_best_bid_or_offer_wide_offer_message_read.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at] == simple_top_of_market_best_bid_or_offer_wide_offer_message_written.m_b_b_o_priority_customer_size_long[simple_top_of_market_best_bid_or_offer_wide_offer_message_at]); simple_top_of_market_best_bid_or_offer_wide_offer_message_at = simple_top_of_market_best_bid_or_offer_wide_offer_message_at + 1
  :: else -> break
  od;
  assert(simple_top_of_market_best_bid_or_offer_wide_offer_message_read.mbbo_condition == simple_top_of_market_best_bid_or_offer_wide_offer_message_written.mbbo_condition);
  skip
}

/* ---- Simple Double Sided Top Of Market Best Bid Or Offer Compact Message: 22 bytes ---- */

/* This is the message format that will be used in the real-time feed and refresh service to disseminate both sides of the MIAX Simple Top of Market for options with low premiums and small aggregate MIAX Best Bid or Offer (MBBO) size. */
typedef SimpleDoubleSidedTopOfMarketBestBidOrOfferCompactMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte bid_price_short[2];
  byte bid_size_short[2];
  byte bid_priority_customer_size_short[2];
  byte bid_condition;
  byte offer_price_short[2];
  byte offer_size_short[2];
  byte offer_priority_customer_size_short[2];
  byte offer_condition
};

int simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at;

/* every byte of Simple Double Sided Top Of Market Best Bid Or Offer Compact Message set to one value */
inline fill_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record, simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value) {
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_condition = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_condition = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_value;
  skip
}

/* each byte of Simple Double Sided Top Of Market Best Bid Or Offer Compact Message set to where it lies, so a field read out of place says so */
inline ramp_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record, simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base) {
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 0 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 4 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 8 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 10 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 12 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_condition = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 14 + 1) % 256;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 15 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 17 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 19 + simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_condition = (simple_double_sided_top_of_market_best_bid_or_offer_compact_message_base + 21 + 1) % 256;
  skip
}

/* Simple Double Sided Top Of Market Best Bid Or Offer Compact Message to the wire, 22 bytes from where the cursor stands */
inline encode_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record) {
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_condition; at = at + 1;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_condition; at = at + 1;
  skip
}

/* Simple Double Sided Top Of Market Best Bid Or Offer Compact Message off the wire, 22 bytes from where the cursor stands */
inline decode_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record) {
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.bid_condition = wire[at]; at = at + 1;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Double Sided Top Of Market Best Bid Or Offer Compact Message is what was written, byte for byte */
inline equal_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read, simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written) {
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.product_id[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.product_id[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.bid_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.bid_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.bid_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.bid_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.bid_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.bid_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.bid_condition == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.bid_condition);
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.offer_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.offer_price_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.offer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.offer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at < 2 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.offer_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.offer_priority_customer_size_short[simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at = simple_double_sided_top_of_market_best_bid_or_offer_compact_message_at + 1
  :: else -> break
  od;
  assert(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_read.offer_condition == simple_double_sided_top_of_market_best_bid_or_offer_compact_message_written.offer_condition);
  skip
}

/* ---- Simple Double Sided Top Of Market Best Bid Or Offer Wide Message: 34 bytes ---- */

/* This is the message format that will be used in the real-time feed and refresh service to disseminate both sides of the MIAX Simple Top of Market for options with high premiums or large aggregate MIAX Best Bid or Offer (MBBO) sizes. */
typedef SimpleDoubleSidedTopOfMarketBestBidOrOfferWideMessage {
  byte nanoseconds[4];
  byte product_id[4];
  byte bid_price_long[4];
  byte bid_size_long[4];
  byte bid_priority_customer_size_long[4];
  byte bid_condition;
  byte offer_price_long[4];
  byte offer_size_long[4];
  byte offer_priority_customer_size_long[4];
  byte offer_condition
};

int simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at;

/* every byte of Simple Double Sided Top Of Market Best Bid Or Offer Wide Message set to one value */
inline fill_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record, simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value) {
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_condition = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_condition = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_value;
  skip
}

/* each byte of Simple Double Sided Top Of Market Best Bid Or Offer Wide Message set to where it lies, so a field read out of place says so */
inline ramp_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record, simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base) {
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 0 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 4 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 8 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 12 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 16 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_condition = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 20 + 1) % 256;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 21 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 25 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 29 + simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1) % 256; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_condition = (simple_double_sided_top_of_market_best_bid_or_offer_wide_message_base + 33 + 1) % 256;
  skip
}

/* Simple Double Sided Top Of Market Best Bid Or Offer Wide Message to the wire, 34 bytes from where the cursor stands */
inline encode_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record) {
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_condition; at = at + 1;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_condition; at = at + 1;
  skip
}

/* Simple Double Sided Top Of Market Best Bid Or Offer Wide Message off the wire, 34 bytes from where the cursor stands */
inline decode_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record) {
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.product_id[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.bid_condition = wire[at]; at = at + 1;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] = wire[at]; at = at + 1; simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_record.offer_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Double Sided Top Of Market Best Bid Or Offer Wide Message is what was written, byte for byte */
inline equal_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read, simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written) {
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.nanoseconds[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.product_id[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.product_id[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.bid_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.bid_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.bid_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.bid_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.bid_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.bid_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.bid_condition == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.bid_condition);
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.offer_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.offer_price_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.offer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.offer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = 0;
  do
  :: simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at < 4 -> assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.offer_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at] == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.offer_priority_customer_size_long[simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at]); simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at = simple_double_sided_top_of_market_best_bid_or_offer_wide_message_at + 1
  :: else -> break
  od;
  assert(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_read.offer_condition == simple_double_sided_top_of_market_best_bid_or_offer_wide_message_written.offer_condition);
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

/* This is the message format that will be used to disseminate canceled Trades that are resulting from Trade cancellations or corrections on MIAX during the current trading session. */
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

/* Simple Top Of Market Best Bid Or Offer Compact Bid Message: encoded, read back, and compared */
proctype check_simple_top_of_market_best_bid_or_offer_compact_bid_message() {
  SimpleTopOfMarketBestBidOrOfferCompactBidMessage simple_top_of_market_best_bid_or_offer_compact_bid_message_sent;
  SimpleTopOfMarketBestBidOrOfferCompactBidMessage simple_top_of_market_best_bid_or_offer_compact_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_sent, 0)
  :: pattern == 1 -> fill_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_sent, 32)
  :: pattern == 2 -> fill_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_sent, 255)
  :: else -> ramp_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_sent);
    assert(at == 15);
    at = 0;
    decode_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_got);
    assert(at == 15);
    equal_simple_top_of_market_best_bid_or_offer_compact_bid_message(simple_top_of_market_best_bid_or_offer_compact_bid_message_got, simple_top_of_market_best_bid_or_offer_compact_bid_message_sent)
  }
}

/* Simple Top Of Market Best Bid Or Offer Compact Offer Message: encoded, read back, and compared */
proctype check_simple_top_of_market_best_bid_or_offer_compact_offer_message() {
  SimpleTopOfMarketBestBidOrOfferCompactOfferMessage simple_top_of_market_best_bid_or_offer_compact_offer_message_sent;
  SimpleTopOfMarketBestBidOrOfferCompactOfferMessage simple_top_of_market_best_bid_or_offer_compact_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_sent, 0)
  :: pattern == 1 -> fill_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_sent, 32)
  :: pattern == 2 -> fill_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_sent, 255)
  :: else -> ramp_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_sent);
    assert(at == 15);
    at = 0;
    decode_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_got);
    assert(at == 15);
    equal_simple_top_of_market_best_bid_or_offer_compact_offer_message(simple_top_of_market_best_bid_or_offer_compact_offer_message_got, simple_top_of_market_best_bid_or_offer_compact_offer_message_sent)
  }
}

/* Simple Top Of Market Best Bid Or Offer Wide Bid Message: encoded, read back, and compared */
proctype check_simple_top_of_market_best_bid_or_offer_wide_bid_message() {
  SimpleTopOfMarketBestBidOrOfferWideBidMessage simple_top_of_market_best_bid_or_offer_wide_bid_message_sent;
  SimpleTopOfMarketBestBidOrOfferWideBidMessage simple_top_of_market_best_bid_or_offer_wide_bid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_sent, 0)
  :: pattern == 1 -> fill_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_sent, 32)
  :: pattern == 2 -> fill_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_sent, 255)
  :: else -> ramp_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_sent);
    assert(at == 21);
    at = 0;
    decode_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_got);
    assert(at == 21);
    equal_simple_top_of_market_best_bid_or_offer_wide_bid_message(simple_top_of_market_best_bid_or_offer_wide_bid_message_got, simple_top_of_market_best_bid_or_offer_wide_bid_message_sent)
  }
}

/* Simple Top Of Market Best Bid Or Offer Wide Offer Message: encoded, read back, and compared */
proctype check_simple_top_of_market_best_bid_or_offer_wide_offer_message() {
  SimpleTopOfMarketBestBidOrOfferWideOfferMessage simple_top_of_market_best_bid_or_offer_wide_offer_message_sent;
  SimpleTopOfMarketBestBidOrOfferWideOfferMessage simple_top_of_market_best_bid_or_offer_wide_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_sent, 0)
  :: pattern == 1 -> fill_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_sent, 32)
  :: pattern == 2 -> fill_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_sent, 255)
  :: else -> ramp_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_sent);
    assert(at == 21);
    at = 0;
    decode_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_got);
    assert(at == 21);
    equal_simple_top_of_market_best_bid_or_offer_wide_offer_message(simple_top_of_market_best_bid_or_offer_wide_offer_message_got, simple_top_of_market_best_bid_or_offer_wide_offer_message_sent)
  }
}

/* Simple Double Sided Top Of Market Best Bid Or Offer Compact Message: encoded, read back, and compared */
proctype check_simple_double_sided_top_of_market_best_bid_or_offer_compact_message() {
  SimpleDoubleSidedTopOfMarketBestBidOrOfferCompactMessage simple_double_sided_top_of_market_best_bid_or_offer_compact_message_sent;
  SimpleDoubleSidedTopOfMarketBestBidOrOfferCompactMessage simple_double_sided_top_of_market_best_bid_or_offer_compact_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_sent, 0)
  :: pattern == 1 -> fill_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_sent, 32)
  :: pattern == 2 -> fill_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_sent, 255)
  :: else -> ramp_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_sent);
    assert(at == 22);
    at = 0;
    decode_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_got);
    assert(at == 22);
    equal_simple_double_sided_top_of_market_best_bid_or_offer_compact_message(simple_double_sided_top_of_market_best_bid_or_offer_compact_message_got, simple_double_sided_top_of_market_best_bid_or_offer_compact_message_sent)
  }
}

/* Simple Double Sided Top Of Market Best Bid Or Offer Wide Message: encoded, read back, and compared */
proctype check_simple_double_sided_top_of_market_best_bid_or_offer_wide_message() {
  SimpleDoubleSidedTopOfMarketBestBidOrOfferWideMessage simple_double_sided_top_of_market_best_bid_or_offer_wide_message_sent;
  SimpleDoubleSidedTopOfMarketBestBidOrOfferWideMessage simple_double_sided_top_of_market_best_bid_or_offer_wide_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_sent, 0)
  :: pattern == 1 -> fill_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_sent, 32)
  :: pattern == 2 -> fill_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_sent, 255)
  :: else -> ramp_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_sent);
    assert(at == 34);
    at = 0;
    decode_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_got);
    assert(at == 34);
    equal_simple_double_sided_top_of_market_best_bid_or_offer_wide_message(simple_double_sided_top_of_market_best_bid_or_offer_wide_message_got, simple_double_sided_top_of_market_best_bid_or_offer_wide_message_sent)
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
  :: run check_simple_top_of_market_best_bid_or_offer_compact_bid_message()
  :: run check_simple_top_of_market_best_bid_or_offer_compact_offer_message()
  :: run check_simple_top_of_market_best_bid_or_offer_wide_bid_message()
  :: run check_simple_top_of_market_best_bid_or_offer_wide_offer_message()
  :: run check_simple_double_sided_top_of_market_best_bid_or_offer_compact_message()
  :: run check_simple_double_sided_top_of_market_best_bid_or_offer_wide_message()
  :: run check_last_sale_message()
  :: run check_trade_cancel_message()
  :: run check_underlying_trading_status_notification_message()
  fi
}
