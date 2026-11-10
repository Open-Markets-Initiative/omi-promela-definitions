/*
 * Miami International Holdings Order Feed
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

/* ---- Sesm Packet Header: 3 bytes --------------------------------------------- */

/* SesM packet header */
typedef SesmPacketHeader {
  byte sesm_packet_length[2];
  byte sesm_packet_type
};

int sesm_packet_header_at;

/* every byte of Sesm Packet Header set to one value */
inline fill_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_value) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = sesm_packet_header_value; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = sesm_packet_header_value;
  skip
}

/* each byte of Sesm Packet Header set to where it lies, so a field read out of place says so */
inline ramp_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_base) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = (sesm_packet_header_base + 0 + sesm_packet_header_at + 1) % 256; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = (sesm_packet_header_base + 2 + 1) % 256;
  skip
}

/* Sesm Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> wire[at] = sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = sesm_packet_header_record.sesm_packet_type; at = at + 1;
  skip
}

/* Sesm Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = wire[at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sesm Packet Header is what was written, byte for byte */
inline equal_sesm_packet_header(sesm_packet_header_read, sesm_packet_header_written) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> assert(sesm_packet_header_read.sesm_packet_length[sesm_packet_header_at] == sesm_packet_header_written.sesm_packet_length[sesm_packet_header_at]); sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  assert(sesm_packet_header_read.sesm_packet_type == sesm_packet_header_written.sesm_packet_type);
  skip
}

/* ---- Refresh Request Message: 1 bytes ---------------------------------------- */

/* Sent by the firm over the MOR Retransmission Interface (SesM Unsequenced Data Packet) to request a Last Value Refresh of a particular data set identified by Refresh Message Type. */
typedef RefreshRequestMessage {
  byte refresh_message_type
};

/* every byte of Refresh Request Message set to one value */
inline fill_refresh_request_message(refresh_request_message_record, refresh_request_message_value) {
  refresh_request_message_record.refresh_message_type = refresh_request_message_value;
  skip
}

/* each byte of Refresh Request Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_request_message(refresh_request_message_record, refresh_request_message_base) {
  refresh_request_message_record.refresh_message_type = (refresh_request_message_base + 0 + 1) % 256;
  skip
}

/* Refresh Request Message to the wire, 1 bytes from where the cursor stands */
inline encode_refresh_request_message(refresh_request_message_record) {
  wire[at] = refresh_request_message_record.refresh_message_type; at = at + 1;
  skip
}

/* Refresh Request Message off the wire, 1 bytes from where the cursor stands */
inline decode_refresh_request_message(refresh_request_message_record) {
  refresh_request_message_record.refresh_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Refresh Request Message is what was written, byte for byte */
inline equal_refresh_request_message(refresh_request_message_read, refresh_request_message_written) {
  assert(refresh_request_message_read.refresh_message_type == refresh_request_message_written.refresh_message_type);
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

/* ---- Simple Series Update Message: 72 bytes ---------------------------------- */

/* This is the message format that will be used to disseminate all Option series traded on MIAX for the current session. */
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
  byte mor_version[8];
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
  :: system_state_message_at < 8 -> system_state_message_record.mor_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.mor_version[system_state_message_at] = (system_state_message_base + 4 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.mor_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.mor_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> assert(system_state_message_read.mor_version[system_state_message_at] == system_state_message_written.mor_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
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

/* ---- Simple Order Message: 71 bytes ------------------------------------------ */

/* This is the message format that will be used to disseminate MIAX Options Simple Orders. */
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
  byte route_instruction;
  byte attributed_id[4];
  byte priority_customer_volume[4];
  byte reserved_28[28]
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
  simple_order_message_record.route_instruction = simple_order_message_value;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.attributed_id[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.priority_customer_volume[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 28 -> simple_order_message_record.reserved_28[simple_order_message_at] = simple_order_message_value; simple_order_message_at = simple_order_message_at + 1
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
  simple_order_message_record.route_instruction = (simple_order_message_base + 34 + 1) % 256;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.attributed_id[simple_order_message_at] = (simple_order_message_base + 35 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.priority_customer_volume[simple_order_message_at] = (simple_order_message_base + 39 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 28 -> simple_order_message_record.reserved_28[simple_order_message_at] = (simple_order_message_base + 43 + simple_order_message_at + 1) % 256; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Order Message to the wire, 71 bytes from where the cursor stands */
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
  wire[at] = simple_order_message_record.route_instruction; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> wire[at] = simple_order_message_record.attributed_id[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> wire[at] = simple_order_message_record.priority_customer_volume[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 28 -> wire[at] = simple_order_message_record.reserved_28[simple_order_message_at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Order Message off the wire, 71 bytes from where the cursor stands */
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
  simple_order_message_record.route_instruction = wire[at]; at = at + 1;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.attributed_id[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> simple_order_message_record.priority_customer_volume[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 28 -> simple_order_message_record.reserved_28[simple_order_message_at] = wire[at]; at = at + 1; simple_order_message_at = simple_order_message_at + 1
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
  assert(simple_order_message_read.route_instruction == simple_order_message_written.route_instruction);
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> assert(simple_order_message_read.attributed_id[simple_order_message_at] == simple_order_message_written.attributed_id[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 4 -> assert(simple_order_message_read.priority_customer_volume[simple_order_message_at] == simple_order_message_written.priority_customer_volume[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  simple_order_message_at = 0;
  do
  :: simple_order_message_at < 28 -> assert(simple_order_message_read.reserved_28[simple_order_message_at] == simple_order_message_written.reserved_28[simple_order_message_at]); simple_order_message_at = simple_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Order Message: 69 bytes ----------------------------------------- */

/* This is the message format that will be used to disseminate MIAX Options Complex Orders. */
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
  byte attributed_id[4];
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
  :: complex_order_message_at < 4 -> complex_order_message_record.attributed_id[complex_order_message_at] = complex_order_message_value; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
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
  :: complex_order_message_at < 4 -> complex_order_message_record.attributed_id[complex_order_message_at] = (complex_order_message_base + 37 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> complex_order_message_record.reserved_28[complex_order_message_at] = (complex_order_message_base + 41 + complex_order_message_at + 1) % 256; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Order Message to the wire, 69 bytes from where the cursor stands */
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
  :: complex_order_message_at < 4 -> wire[at] = complex_order_message_record.attributed_id[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> wire[at] = complex_order_message_record.reserved_28[complex_order_message_at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Order Message off the wire, 69 bytes from where the cursor stands */
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
  :: complex_order_message_at < 4 -> complex_order_message_record.attributed_id[complex_order_message_at] = wire[at]; at = at + 1; complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
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
  :: complex_order_message_at < 4 -> assert(complex_order_message_read.attributed_id[complex_order_message_at] == complex_order_message_written.attributed_id[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  complex_order_message_at = 0;
  do
  :: complex_order_message_at < 28 -> assert(complex_order_message_read.reserved_28[complex_order_message_at] == complex_order_message_written.reserved_28[complex_order_message_at]); complex_order_message_at = complex_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Close Message: 13 bytes ------------------------------------------- */

/* This is the message format that will be used to disseminate Order Close for MIAX Options Simple and Complex Orders. */
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

/* ---- End Of Refresh Notification Message: 1 bytes ---------------------------- */

/* Sent by MIAX Options over the MOR Retransmission Interface (SesM Unsequenced Data Packet) when the refresh response is complete. */
typedef EndOfRefreshNotificationMessage {
  byte refresh_message_type
};

/* every byte of End Of Refresh Notification Message set to one value */
inline fill_end_of_refresh_notification_message(end_of_refresh_notification_message_record, end_of_refresh_notification_message_value) {
  end_of_refresh_notification_message_record.refresh_message_type = end_of_refresh_notification_message_value;
  skip
}

/* each byte of End Of Refresh Notification Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_refresh_notification_message(end_of_refresh_notification_message_record, end_of_refresh_notification_message_base) {
  end_of_refresh_notification_message_record.refresh_message_type = (end_of_refresh_notification_message_base + 0 + 1) % 256;
  skip
}

/* End Of Refresh Notification Message to the wire, 1 bytes from where the cursor stands */
inline encode_end_of_refresh_notification_message(end_of_refresh_notification_message_record) {
  wire[at] = end_of_refresh_notification_message_record.refresh_message_type; at = at + 1;
  skip
}

/* End Of Refresh Notification Message off the wire, 1 bytes from where the cursor stands */
inline decode_end_of_refresh_notification_message(end_of_refresh_notification_message_record) {
  end_of_refresh_notification_message_record.refresh_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of End Of Refresh Notification Message is what was written, byte for byte */
inline equal_end_of_refresh_notification_message(end_of_refresh_notification_message_read, end_of_refresh_notification_message_written) {
  assert(end_of_refresh_notification_message_read.refresh_message_type == end_of_refresh_notification_message_written.refresh_message_type);
  skip
}

/* ---- Login Request: 35 bytes ------------------------------------------------- */

/* The SesM client must send a Login request packet immediately upon establishing a new TCP/IP socket connection to the server */
typedef LoginRequest {
  byte sesm_version[5];
  byte username[5];
  byte computer_id[8];
  byte application_protocol[8];
  byte requested_trading_session_id;
  byte requested_sequence_number[8]
};

int login_request_at;

/* every byte of Login Request set to one value */
inline fill_login_request(login_request_record, login_request_value) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_trading_session_id = login_request_value;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request set to where it lies, so a field read out of place says so */
inline ramp_login_request(login_request_record, login_request_base) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = (login_request_base + 0 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = (login_request_base + 5 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = (login_request_base + 10 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = (login_request_base + 18 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_trading_session_id = (login_request_base + 26 + 1) % 256;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = (login_request_base + 27 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request to the wire, 35 bytes from where the cursor stands */
inline encode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.sesm_version[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.username[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.computer_id[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.application_protocol[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  wire[at] = login_request_record.requested_trading_session_id; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.requested_sequence_number[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request off the wire, 35 bytes from where the cursor stands */
inline decode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_trading_session_id = wire[at]; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request is what was written, byte for byte */
inline equal_login_request(login_request_read, login_request_written) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.sesm_version[login_request_at] == login_request_written.sesm_version[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.username[login_request_at] == login_request_written.username[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.computer_id[login_request_at] == login_request_written.computer_id[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.application_protocol[login_request_at] == login_request_written.application_protocol[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  assert(login_request_read.requested_trading_session_id == login_request_written.requested_trading_session_id);
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.requested_sequence_number[login_request_at] == login_request_written.requested_sequence_number[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response: 11 bytes ------------------------------------------------ */

/* The SesM server sends a Login response packet in response a Login request packet from the client */
typedef LoginResponse {
  byte number_of_matching_engines;
  byte login_status;
  byte trading_session_id;
  byte highest_sequence_number[8]
};

int login_response_at;

/* every byte of Login Response set to one value */
inline fill_login_response(login_response_record, login_response_value) {
  login_response_record.number_of_matching_engines = login_response_value;
  login_response_record.login_status = login_response_value;
  login_response_record.trading_session_id = login_response_value;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response set to where it lies, so a field read out of place says so */
inline ramp_login_response(login_response_record, login_response_base) {
  login_response_record.number_of_matching_engines = (login_response_base + 0 + 1) % 256;
  login_response_record.login_status = (login_response_base + 1 + 1) % 256;
  login_response_record.trading_session_id = (login_response_base + 2 + 1) % 256;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = (login_response_base + 3 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response to the wire, 11 bytes from where the cursor stands */
inline encode_login_response(login_response_record) {
  wire[at] = login_response_record.number_of_matching_engines; at = at + 1;
  wire[at] = login_response_record.login_status; at = at + 1;
  wire[at] = login_response_record.trading_session_id; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> wire[at] = login_response_record.highest_sequence_number[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response off the wire, 11 bytes from where the cursor stands */
inline decode_login_response(login_response_record) {
  login_response_record.number_of_matching_engines = wire[at]; at = at + 1;
  login_response_record.login_status = wire[at]; at = at + 1;
  login_response_record.trading_session_id = wire[at]; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response is what was written, byte for byte */
inline equal_login_response(login_response_read, login_response_written) {
  assert(login_response_read.number_of_matching_engines == login_response_written.number_of_matching_engines);
  assert(login_response_read.login_status == login_response_written.login_status);
  assert(login_response_read.trading_session_id == login_response_written.trading_session_id);
  login_response_at = 0;
  do
  :: login_response_at < 8 -> assert(login_response_read.highest_sequence_number[login_response_at] == login_response_written.highest_sequence_number[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Synchronization Complete: 1 bytes --------------------------------------- */

/* The SesM server sends a Login response packet in response a Login request packet from the client */
typedef SynchronizationComplete {
  byte number_of_matching_engines
};

/* every byte of Synchronization Complete set to one value */
inline fill_synchronization_complete(synchronization_complete_record, synchronization_complete_value) {
  synchronization_complete_record.number_of_matching_engines = synchronization_complete_value;
  skip
}

/* each byte of Synchronization Complete set to where it lies, so a field read out of place says so */
inline ramp_synchronization_complete(synchronization_complete_record, synchronization_complete_base) {
  synchronization_complete_record.number_of_matching_engines = (synchronization_complete_base + 0 + 1) % 256;
  skip
}

/* Synchronization Complete to the wire, 1 bytes from where the cursor stands */
inline encode_synchronization_complete(synchronization_complete_record) {
  wire[at] = synchronization_complete_record.number_of_matching_engines; at = at + 1;
  skip
}

/* Synchronization Complete off the wire, 1 bytes from where the cursor stands */
inline decode_synchronization_complete(synchronization_complete_record) {
  synchronization_complete_record.number_of_matching_engines = wire[at]; at = at + 1;
  skip
}

/* what was read of Synchronization Complete is what was written, byte for byte */
inline equal_synchronization_complete(synchronization_complete_read, synchronization_complete_written) {
  assert(synchronization_complete_read.number_of_matching_engines == synchronization_complete_written.number_of_matching_engines);
  skip
}

/* ---- Retransmission Request: 16 bytes ---------------------------------------- */

/* The SesM client uses this packet to request a retransmission server to retransmit a range of packets */
typedef RetransmissionRequest {
  byte start_sequence_number[8];
  byte end_sequence_number[8]
};

int retransmission_request_at;

/* every byte of Retransmission Request set to one value */
inline fill_retransmission_request(retransmission_request_record, retransmission_request_value) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request(retransmission_request_record, retransmission_request_base) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = (retransmission_request_base + 0 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = (retransmission_request_base + 8 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request to the wire, 16 bytes from where the cursor stands */
inline encode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.start_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.end_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request off the wire, 16 bytes from where the cursor stands */
inline decode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request is what was written, byte for byte */
inline equal_retransmission_request(retransmission_request_read, retransmission_request_written) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.start_sequence_number[retransmission_request_at] == retransmission_request_written.start_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.end_sequence_number[retransmission_request_at] == retransmission_request_written.end_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sesm Packet Header: encoded, read back, and compared */
proctype check_sesm_packet_header() {
  SesmPacketHeader sesm_packet_header_sent;
  SesmPacketHeader sesm_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sesm_packet_header(sesm_packet_header_sent, 0)
  :: pattern == 1 -> fill_sesm_packet_header(sesm_packet_header_sent, 32)
  :: pattern == 2 -> fill_sesm_packet_header(sesm_packet_header_sent, 255)
  :: else -> ramp_sesm_packet_header(sesm_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sesm_packet_header(sesm_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_sesm_packet_header(sesm_packet_header_got);
    assert(at == 3);
    equal_sesm_packet_header(sesm_packet_header_got, sesm_packet_header_sent)
  }
}

/* Refresh Request Message: encoded, read back, and compared */
proctype check_refresh_request_message() {
  RefreshRequestMessage refresh_request_message_sent;
  RefreshRequestMessage refresh_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_request_message(refresh_request_message_sent, 0)
  :: pattern == 1 -> fill_refresh_request_message(refresh_request_message_sent, 32)
  :: pattern == 2 -> fill_refresh_request_message(refresh_request_message_sent, 255)
  :: else -> ramp_refresh_request_message(refresh_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_request_message(refresh_request_message_sent);
    assert(at == 1);
    at = 0;
    decode_refresh_request_message(refresh_request_message_got);
    assert(at == 1);
    equal_refresh_request_message(refresh_request_message_got, refresh_request_message_sent)
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
    assert(at == 71);
    at = 0;
    decode_simple_order_message(simple_order_message_got);
    assert(at == 71);
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
    assert(at == 69);
    at = 0;
    decode_complex_order_message(complex_order_message_got);
    assert(at == 69);
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

/* End Of Refresh Notification Message: encoded, read back, and compared */
proctype check_end_of_refresh_notification_message() {
  EndOfRefreshNotificationMessage end_of_refresh_notification_message_sent;
  EndOfRefreshNotificationMessage end_of_refresh_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 0)
  :: pattern == 1 -> fill_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 32)
  :: pattern == 2 -> fill_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 255)
  :: else -> ramp_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_refresh_notification_message(end_of_refresh_notification_message_sent);
    assert(at == 1);
    at = 0;
    decode_end_of_refresh_notification_message(end_of_refresh_notification_message_got);
    assert(at == 1);
    equal_end_of_refresh_notification_message(end_of_refresh_notification_message_got, end_of_refresh_notification_message_sent)
  }
}

/* Login Request: encoded, read back, and compared */
proctype check_login_request() {
  LoginRequest login_request_sent;
  LoginRequest login_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request(login_request_sent, 0)
  :: pattern == 1 -> fill_login_request(login_request_sent, 32)
  :: pattern == 2 -> fill_login_request(login_request_sent, 255)
  :: else -> ramp_login_request(login_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request(login_request_sent);
    assert(at == 35);
    at = 0;
    decode_login_request(login_request_got);
    assert(at == 35);
    equal_login_request(login_request_got, login_request_sent)
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
    assert(at == 11);
    at = 0;
    decode_login_response(login_response_got);
    assert(at == 11);
    equal_login_response(login_response_got, login_response_sent)
  }
}

/* Synchronization Complete: encoded, read back, and compared */
proctype check_synchronization_complete() {
  SynchronizationComplete synchronization_complete_sent;
  SynchronizationComplete synchronization_complete_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_synchronization_complete(synchronization_complete_sent, 0)
  :: pattern == 1 -> fill_synchronization_complete(synchronization_complete_sent, 32)
  :: pattern == 2 -> fill_synchronization_complete(synchronization_complete_sent, 255)
  :: else -> ramp_synchronization_complete(synchronization_complete_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_synchronization_complete(synchronization_complete_sent);
    assert(at == 1);
    at = 0;
    decode_synchronization_complete(synchronization_complete_got);
    assert(at == 1);
    equal_synchronization_complete(synchronization_complete_got, synchronization_complete_sent)
  }
}

/* Retransmission Request: encoded, read back, and compared */
proctype check_retransmission_request() {
  RetransmissionRequest retransmission_request_sent;
  RetransmissionRequest retransmission_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request(retransmission_request_sent, 0)
  :: pattern == 1 -> fill_retransmission_request(retransmission_request_sent, 32)
  :: pattern == 2 -> fill_retransmission_request(retransmission_request_sent, 255)
  :: else -> ramp_retransmission_request(retransmission_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request(retransmission_request_sent);
    assert(at == 16);
    at = 0;
    decode_retransmission_request(retransmission_request_got);
    assert(at == 16);
    equal_retransmission_request(retransmission_request_got, retransmission_request_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sesm_packet_header()
  :: run check_refresh_request_message()
  :: run check_system_time_message()
  :: run check_simple_series_update_message()
  :: run check_system_state_message()
  :: run check_underlying_trading_status_notification_message()
  :: run check_simple_order_message()
  :: run check_complex_order_message()
  :: run check_order_close_message()
  :: run check_end_of_refresh_notification_message()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_synchronization_complete()
  :: run check_retransmission_request()
  fi
}
