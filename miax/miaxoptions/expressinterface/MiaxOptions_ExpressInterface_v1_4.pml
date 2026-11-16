/*
 * Miami International Holdings Express Interface
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
#define WIRE 76

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

/* ---- Series Update: 76 bytes ------------------------------------------------- */

/* This is the message format that will be used to disseminate all Option series traded on MIAX for the current session on the cloud associated for this connection. */
typedef SeriesUpdate {
  byte product_add_update_time[8];
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
  byte quote_acceptance_increment_indicator;
  byte opening_underlying_market_code;
  byte priority_quote_width[4];
  byte reserved_8[8]
};

int series_update_at;

/* every byte of Series Update set to one value */
inline fill_series_update(series_update_record, series_update_value) {
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.product_add_update_time[series_update_at] = series_update_value; series_update_at = series_update_at + 1
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
  series_update_record.quote_acceptance_increment_indicator = series_update_value;
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
  :: series_update_at < 8 -> series_update_record.product_add_update_time[series_update_at] = (series_update_base + 0 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.product_id[series_update_at] = (series_update_base + 8 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 11 -> series_update_record.underlying_symbol[series_update_at] = (series_update_base + 12 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 6 -> series_update_record.security_symbol[series_update_at] = (series_update_base + 23 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.expiration_date[series_update_at] = (series_update_base + 29 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.strike_price[series_update_at] = (series_update_base + 37 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.call_or_put = (series_update_base + 41 + 1) % 256;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.opening_time[series_update_at] = (series_update_base + 42 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.closing_time[series_update_at] = (series_update_base + 50 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_record.restricted_option = (series_update_base + 58 + 1) % 256;
  series_update_record.long_term_option = (series_update_base + 59 + 1) % 256;
  series_update_record.active_on_miax = (series_update_base + 60 + 1) % 256;
  series_update_record.miax_bbo_posting_increment_indicator = (series_update_base + 61 + 1) % 256;
  series_update_record.quote_acceptance_increment_indicator = (series_update_base + 62 + 1) % 256;
  series_update_record.opening_underlying_market_code = (series_update_base + 63 + 1) % 256;
  series_update_at = 0;
  do
  :: series_update_at < 4 -> series_update_record.priority_quote_width[series_update_at] = (series_update_base + 64 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.reserved_8[series_update_at] = (series_update_base + 68 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
  :: else -> break
  od;
  skip
}

/* Series Update to the wire, 76 bytes from where the cursor stands */
inline encode_series_update(series_update_record) {
  series_update_at = 0;
  do
  :: series_update_at < 8 -> wire[at] = series_update_record.product_add_update_time[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
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
  wire[at] = series_update_record.quote_acceptance_increment_indicator; at = at + 1;
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

/* Series Update off the wire, 76 bytes from where the cursor stands */
inline decode_series_update(series_update_record) {
  series_update_at = 0;
  do
  :: series_update_at < 8 -> series_update_record.product_add_update_time[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
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
  series_update_record.quote_acceptance_increment_indicator = wire[at]; at = at + 1;
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
  :: series_update_at < 8 -> assert(series_update_read.product_add_update_time[series_update_at] == series_update_written.product_add_update_time[series_update_at]); series_update_at = series_update_at + 1
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
  assert(series_update_read.quote_acceptance_increment_indicator == series_update_written.quote_acceptance_increment_indicator);
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

/* ---- Valid Quote Width For Opening: 21 bytes --------------------------------- */

/* This message format will be used to convey to the firms the Valid Quote Width settings applicable to the Opening process of MIAX Options market. Each message describes a row of the Valid Quote Width table with a low end of the applicable price range and corresponding maximum quote width. The high end of the applicable price range is up to, but not including the next row's low end applicable price range if provided or infinity for the last row. If the table has to be reloaded, all rows will be resent. Refer to Appendix C for an example. */
typedef ValidQuoteWidthForOpening {
  byte notification_time[8];
  byte mpv_class;
  byte low_end_of_applicable_range[4];
  byte maximum_quote_width[4];
  byte long_term_option_multiplier[4]
};

int valid_quote_width_for_opening_at;

/* every byte of Valid Quote Width For Opening set to one value */
inline fill_valid_quote_width_for_opening(valid_quote_width_for_opening_record, valid_quote_width_for_opening_value) {
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 8 -> valid_quote_width_for_opening_record.notification_time[valid_quote_width_for_opening_at] = valid_quote_width_for_opening_value; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_record.mpv_class = valid_quote_width_for_opening_value;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.low_end_of_applicable_range[valid_quote_width_for_opening_at] = valid_quote_width_for_opening_value; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.maximum_quote_width[valid_quote_width_for_opening_at] = valid_quote_width_for_opening_value; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.long_term_option_multiplier[valid_quote_width_for_opening_at] = valid_quote_width_for_opening_value; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Valid Quote Width For Opening set to where it lies, so a field read out of place says so */
inline ramp_valid_quote_width_for_opening(valid_quote_width_for_opening_record, valid_quote_width_for_opening_base) {
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 8 -> valid_quote_width_for_opening_record.notification_time[valid_quote_width_for_opening_at] = (valid_quote_width_for_opening_base + 0 + valid_quote_width_for_opening_at + 1) % 256; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_record.mpv_class = (valid_quote_width_for_opening_base + 8 + 1) % 256;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.low_end_of_applicable_range[valid_quote_width_for_opening_at] = (valid_quote_width_for_opening_base + 9 + valid_quote_width_for_opening_at + 1) % 256; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.maximum_quote_width[valid_quote_width_for_opening_at] = (valid_quote_width_for_opening_base + 13 + valid_quote_width_for_opening_at + 1) % 256; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.long_term_option_multiplier[valid_quote_width_for_opening_at] = (valid_quote_width_for_opening_base + 17 + valid_quote_width_for_opening_at + 1) % 256; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  skip
}

/* Valid Quote Width For Opening to the wire, 21 bytes from where the cursor stands */
inline encode_valid_quote_width_for_opening(valid_quote_width_for_opening_record) {
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 8 -> wire[at] = valid_quote_width_for_opening_record.notification_time[valid_quote_width_for_opening_at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  wire[at] = valid_quote_width_for_opening_record.mpv_class; at = at + 1;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> wire[at] = valid_quote_width_for_opening_record.low_end_of_applicable_range[valid_quote_width_for_opening_at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> wire[at] = valid_quote_width_for_opening_record.maximum_quote_width[valid_quote_width_for_opening_at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> wire[at] = valid_quote_width_for_opening_record.long_term_option_multiplier[valid_quote_width_for_opening_at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  skip
}

/* Valid Quote Width For Opening off the wire, 21 bytes from where the cursor stands */
inline decode_valid_quote_width_for_opening(valid_quote_width_for_opening_record) {
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 8 -> valid_quote_width_for_opening_record.notification_time[valid_quote_width_for_opening_at] = wire[at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_record.mpv_class = wire[at]; at = at + 1;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.low_end_of_applicable_range[valid_quote_width_for_opening_at] = wire[at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.maximum_quote_width[valid_quote_width_for_opening_at] = wire[at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> valid_quote_width_for_opening_record.long_term_option_multiplier[valid_quote_width_for_opening_at] = wire[at]; at = at + 1; valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Valid Quote Width For Opening is what was written, byte for byte */
inline equal_valid_quote_width_for_opening(valid_quote_width_for_opening_read, valid_quote_width_for_opening_written) {
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 8 -> assert(valid_quote_width_for_opening_read.notification_time[valid_quote_width_for_opening_at] == valid_quote_width_for_opening_written.notification_time[valid_quote_width_for_opening_at]); valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  assert(valid_quote_width_for_opening_read.mpv_class == valid_quote_width_for_opening_written.mpv_class);
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> assert(valid_quote_width_for_opening_read.low_end_of_applicable_range[valid_quote_width_for_opening_at] == valid_quote_width_for_opening_written.low_end_of_applicable_range[valid_quote_width_for_opening_at]); valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> assert(valid_quote_width_for_opening_read.maximum_quote_width[valid_quote_width_for_opening_at] == valid_quote_width_for_opening_written.maximum_quote_width[valid_quote_width_for_opening_at]); valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  valid_quote_width_for_opening_at = 0;
  do
  :: valid_quote_width_for_opening_at < 4 -> assert(valid_quote_width_for_opening_read.long_term_option_multiplier[valid_quote_width_for_opening_at] == valid_quote_width_for_opening_written.long_term_option_multiplier[valid_quote_width_for_opening_at]); valid_quote_width_for_opening_at = valid_quote_width_for_opening_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Enhanced Quote E Quote Response: 17 bytes ------------------------------- */

/* This message indicates if the eQuote was accepted or rejected. Note that this message does not report executions. For executions, please refer to the Execution notification. For the unexecuted part that gets canceled, please refer to the Cancel notification. */
typedef EnhancedQuoteEQuoteResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte e_quote_id[8];
  byte e_quote_request_status
};

int enhanced_quote_e_quote_response_at;

/* every byte of Enhanced Quote E Quote Response set to one value */
inline fill_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_record, enhanced_quote_e_quote_response_value) {
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> enhanced_quote_e_quote_response_record.client_message_id[enhanced_quote_e_quote_response_at] = enhanced_quote_e_quote_response_value; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> enhanced_quote_e_quote_response_record.mpid[enhanced_quote_e_quote_response_at] = enhanced_quote_e_quote_response_value; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 8 -> enhanced_quote_e_quote_response_record.e_quote_id[enhanced_quote_e_quote_response_at] = enhanced_quote_e_quote_response_value; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_record.e_quote_request_status = enhanced_quote_e_quote_response_value;
  skip
}

/* each byte of Enhanced Quote E Quote Response set to where it lies, so a field read out of place says so */
inline ramp_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_record, enhanced_quote_e_quote_response_base) {
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> enhanced_quote_e_quote_response_record.client_message_id[enhanced_quote_e_quote_response_at] = (enhanced_quote_e_quote_response_base + 0 + enhanced_quote_e_quote_response_at + 1) % 256; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> enhanced_quote_e_quote_response_record.mpid[enhanced_quote_e_quote_response_at] = (enhanced_quote_e_quote_response_base + 4 + enhanced_quote_e_quote_response_at + 1) % 256; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 8 -> enhanced_quote_e_quote_response_record.e_quote_id[enhanced_quote_e_quote_response_at] = (enhanced_quote_e_quote_response_base + 8 + enhanced_quote_e_quote_response_at + 1) % 256; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_record.e_quote_request_status = (enhanced_quote_e_quote_response_base + 16 + 1) % 256;
  skip
}

/* Enhanced Quote E Quote Response to the wire, 17 bytes from where the cursor stands */
inline encode_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_record) {
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> wire[at] = enhanced_quote_e_quote_response_record.client_message_id[enhanced_quote_e_quote_response_at]; at = at + 1; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> wire[at] = enhanced_quote_e_quote_response_record.mpid[enhanced_quote_e_quote_response_at]; at = at + 1; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 8 -> wire[at] = enhanced_quote_e_quote_response_record.e_quote_id[enhanced_quote_e_quote_response_at]; at = at + 1; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_quote_e_quote_response_record.e_quote_request_status; at = at + 1;
  skip
}

/* Enhanced Quote E Quote Response off the wire, 17 bytes from where the cursor stands */
inline decode_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_record) {
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> enhanced_quote_e_quote_response_record.client_message_id[enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> enhanced_quote_e_quote_response_record.mpid[enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 8 -> enhanced_quote_e_quote_response_record.e_quote_id[enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_record.e_quote_request_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Enhanced Quote E Quote Response is what was written, byte for byte */
inline equal_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_read, enhanced_quote_e_quote_response_written) {
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> assert(enhanced_quote_e_quote_response_read.client_message_id[enhanced_quote_e_quote_response_at] == enhanced_quote_e_quote_response_written.client_message_id[enhanced_quote_e_quote_response_at]); enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 4 -> assert(enhanced_quote_e_quote_response_read.mpid[enhanced_quote_e_quote_response_at] == enhanced_quote_e_quote_response_written.mpid[enhanced_quote_e_quote_response_at]); enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_response_at = 0;
  do
  :: enhanced_quote_e_quote_response_at < 8 -> assert(enhanced_quote_e_quote_response_read.e_quote_id[enhanced_quote_e_quote_response_at] == enhanced_quote_e_quote_response_written.e_quote_id[enhanced_quote_e_quote_response_at]); enhanced_quote_e_quote_response_at = enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  assert(enhanced_quote_e_quote_response_read.e_quote_request_status == enhanced_quote_e_quote_response_written.e_quote_request_status);
  skip
}

/* ---- System State Notification: 18 bytes ------------------------------------- */

/* This message format is used to notify the firms of the state changes of the system. This is an exchange-wide notification and not a symbol or member based notification. */
typedef SystemStateNotification {
  byte notification_time[8];
  byte mei_version[8];
  byte session_id;
  byte system_status
};

int system_state_notification_at;

/* every byte of System State Notification set to one value */
inline fill_system_state_notification(system_state_notification_record, system_state_notification_value) {
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> system_state_notification_record.notification_time[system_state_notification_at] = system_state_notification_value; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> system_state_notification_record.mei_version[system_state_notification_at] = system_state_notification_value; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_record.session_id = system_state_notification_value;
  system_state_notification_record.system_status = system_state_notification_value;
  skip
}

/* each byte of System State Notification set to where it lies, so a field read out of place says so */
inline ramp_system_state_notification(system_state_notification_record, system_state_notification_base) {
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> system_state_notification_record.notification_time[system_state_notification_at] = (system_state_notification_base + 0 + system_state_notification_at + 1) % 256; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> system_state_notification_record.mei_version[system_state_notification_at] = (system_state_notification_base + 8 + system_state_notification_at + 1) % 256; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_record.session_id = (system_state_notification_base + 16 + 1) % 256;
  system_state_notification_record.system_status = (system_state_notification_base + 17 + 1) % 256;
  skip
}

/* System State Notification to the wire, 18 bytes from where the cursor stands */
inline encode_system_state_notification(system_state_notification_record) {
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> wire[at] = system_state_notification_record.notification_time[system_state_notification_at]; at = at + 1; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> wire[at] = system_state_notification_record.mei_version[system_state_notification_at]; at = at + 1; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  wire[at] = system_state_notification_record.session_id; at = at + 1;
  wire[at] = system_state_notification_record.system_status; at = at + 1;
  skip
}

/* System State Notification off the wire, 18 bytes from where the cursor stands */
inline decode_system_state_notification(system_state_notification_record) {
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> system_state_notification_record.notification_time[system_state_notification_at] = wire[at]; at = at + 1; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> system_state_notification_record.mei_version[system_state_notification_at] = wire[at]; at = at + 1; system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_record.session_id = wire[at]; at = at + 1;
  system_state_notification_record.system_status = wire[at]; at = at + 1;
  skip
}

/* what was read of System State Notification is what was written, byte for byte */
inline equal_system_state_notification(system_state_notification_read, system_state_notification_written) {
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> assert(system_state_notification_read.notification_time[system_state_notification_at] == system_state_notification_written.notification_time[system_state_notification_at]); system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  system_state_notification_at = 0;
  do
  :: system_state_notification_at < 8 -> assert(system_state_notification_read.mei_version[system_state_notification_at] == system_state_notification_written.mei_version[system_state_notification_at]); system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  assert(system_state_notification_read.session_id == system_state_notification_written.session_id);
  assert(system_state_notification_read.system_status == system_state_notification_written.system_status);
  skip
}

/* ---- Trading Status Notification: 21 bytes ----------------------------------- */

/* This message format will be used to notify the firms of changes to the trading status of an option or trigger of market-wide circuit breakers on the MIAX Options market. */
typedef TradingStatusNotification {
  byte notification_time[8];
  byte product_id[4];
  byte trading_status;
  byte expected_event_time[8]
};

int trading_status_notification_at;

/* every byte of Trading Status Notification set to one value */
inline fill_trading_status_notification(trading_status_notification_record, trading_status_notification_value) {
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> trading_status_notification_record.notification_time[trading_status_notification_at] = trading_status_notification_value; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 4 -> trading_status_notification_record.product_id[trading_status_notification_at] = trading_status_notification_value; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_record.trading_status = trading_status_notification_value;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> trading_status_notification_record.expected_event_time[trading_status_notification_at] = trading_status_notification_value; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Notification set to where it lies, so a field read out of place says so */
inline ramp_trading_status_notification(trading_status_notification_record, trading_status_notification_base) {
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> trading_status_notification_record.notification_time[trading_status_notification_at] = (trading_status_notification_base + 0 + trading_status_notification_at + 1) % 256; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 4 -> trading_status_notification_record.product_id[trading_status_notification_at] = (trading_status_notification_base + 8 + trading_status_notification_at + 1) % 256; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_record.trading_status = (trading_status_notification_base + 12 + 1) % 256;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> trading_status_notification_record.expected_event_time[trading_status_notification_at] = (trading_status_notification_base + 13 + trading_status_notification_at + 1) % 256; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Notification to the wire, 21 bytes from where the cursor stands */
inline encode_trading_status_notification(trading_status_notification_record) {
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> wire[at] = trading_status_notification_record.notification_time[trading_status_notification_at]; at = at + 1; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 4 -> wire[at] = trading_status_notification_record.product_id[trading_status_notification_at]; at = at + 1; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_notification_record.trading_status; at = at + 1;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> wire[at] = trading_status_notification_record.expected_event_time[trading_status_notification_at]; at = at + 1; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Notification off the wire, 21 bytes from where the cursor stands */
inline decode_trading_status_notification(trading_status_notification_record) {
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> trading_status_notification_record.notification_time[trading_status_notification_at] = wire[at]; at = at + 1; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 4 -> trading_status_notification_record.product_id[trading_status_notification_at] = wire[at]; at = at + 1; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_record.trading_status = wire[at]; at = at + 1;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> trading_status_notification_record.expected_event_time[trading_status_notification_at] = wire[at]; at = at + 1; trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Notification is what was written, byte for byte */
inline equal_trading_status_notification(trading_status_notification_read, trading_status_notification_written) {
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> assert(trading_status_notification_read.notification_time[trading_status_notification_at] == trading_status_notification_written.notification_time[trading_status_notification_at]); trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 4 -> assert(trading_status_notification_read.product_id[trading_status_notification_at] == trading_status_notification_written.product_id[trading_status_notification_at]); trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  assert(trading_status_notification_read.trading_status == trading_status_notification_written.trading_status);
  trading_status_notification_at = 0;
  do
  :: trading_status_notification_at < 8 -> assert(trading_status_notification_read.expected_event_time[trading_status_notification_at] == trading_status_notification_written.expected_event_time[trading_status_notification_at]); trading_status_notification_at = trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Width Relief Notification: 23 bytes ------------------------------- */

/* This message format will be used to notify the firms if and when MIAX grants relief to the valid quote width parameters for Opening as specified in the rules and regulatory circulars of MIAX Options market. */
typedef QuoteWidthReliefNotification {
  byte notification_time[8];
  byte underlying_symbol[11];
  byte relief_multiplier[4]
};

int quote_width_relief_notification_at;

/* every byte of Quote Width Relief Notification set to one value */
inline fill_quote_width_relief_notification(quote_width_relief_notification_record, quote_width_relief_notification_value) {
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 8 -> quote_width_relief_notification_record.notification_time[quote_width_relief_notification_at] = quote_width_relief_notification_value; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 11 -> quote_width_relief_notification_record.underlying_symbol[quote_width_relief_notification_at] = quote_width_relief_notification_value; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 4 -> quote_width_relief_notification_record.relief_multiplier[quote_width_relief_notification_at] = quote_width_relief_notification_value; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Width Relief Notification set to where it lies, so a field read out of place says so */
inline ramp_quote_width_relief_notification(quote_width_relief_notification_record, quote_width_relief_notification_base) {
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 8 -> quote_width_relief_notification_record.notification_time[quote_width_relief_notification_at] = (quote_width_relief_notification_base + 0 + quote_width_relief_notification_at + 1) % 256; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 11 -> quote_width_relief_notification_record.underlying_symbol[quote_width_relief_notification_at] = (quote_width_relief_notification_base + 8 + quote_width_relief_notification_at + 1) % 256; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 4 -> quote_width_relief_notification_record.relief_multiplier[quote_width_relief_notification_at] = (quote_width_relief_notification_base + 19 + quote_width_relief_notification_at + 1) % 256; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Width Relief Notification to the wire, 23 bytes from where the cursor stands */
inline encode_quote_width_relief_notification(quote_width_relief_notification_record) {
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 8 -> wire[at] = quote_width_relief_notification_record.notification_time[quote_width_relief_notification_at]; at = at + 1; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 11 -> wire[at] = quote_width_relief_notification_record.underlying_symbol[quote_width_relief_notification_at]; at = at + 1; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 4 -> wire[at] = quote_width_relief_notification_record.relief_multiplier[quote_width_relief_notification_at]; at = at + 1; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Width Relief Notification off the wire, 23 bytes from where the cursor stands */
inline decode_quote_width_relief_notification(quote_width_relief_notification_record) {
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 8 -> quote_width_relief_notification_record.notification_time[quote_width_relief_notification_at] = wire[at]; at = at + 1; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 11 -> quote_width_relief_notification_record.underlying_symbol[quote_width_relief_notification_at] = wire[at]; at = at + 1; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 4 -> quote_width_relief_notification_record.relief_multiplier[quote_width_relief_notification_at] = wire[at]; at = at + 1; quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Width Relief Notification is what was written, byte for byte */
inline equal_quote_width_relief_notification(quote_width_relief_notification_read, quote_width_relief_notification_written) {
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 8 -> assert(quote_width_relief_notification_read.notification_time[quote_width_relief_notification_at] == quote_width_relief_notification_written.notification_time[quote_width_relief_notification_at]); quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 11 -> assert(quote_width_relief_notification_read.underlying_symbol[quote_width_relief_notification_at] == quote_width_relief_notification_written.underlying_symbol[quote_width_relief_notification_at]); quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  quote_width_relief_notification_at = 0;
  do
  :: quote_width_relief_notification_at < 4 -> assert(quote_width_relief_notification_read.relief_multiplier[quote_width_relief_notification_at] == quote_width_relief_notification_written.relief_multiplier[quote_width_relief_notification_at]); quote_width_relief_notification_at = quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm Protection Settings Notification: 31 bytes -------------------------- */

/* This message format will be used to notify firms of their ARM settings. All the ARM settings will be published upon system initialization and each subsequent change will also be published. */
typedef ArmProtectionSettingsNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte allowable_engagement_percentage[4];
  byte counting_period[2];
  byte action;
  byte source
};

int arm_protection_settings_notification_at;

/* every byte of Arm Protection Settings Notification set to one value */
inline fill_arm_protection_settings_notification(arm_protection_settings_notification_record, arm_protection_settings_notification_value) {
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 8 -> arm_protection_settings_notification_record.notification_time[arm_protection_settings_notification_at] = arm_protection_settings_notification_value; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> arm_protection_settings_notification_record.mpid[arm_protection_settings_notification_at] = arm_protection_settings_notification_value; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 11 -> arm_protection_settings_notification_record.underlying_symbol[arm_protection_settings_notification_at] = arm_protection_settings_notification_value; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> arm_protection_settings_notification_record.allowable_engagement_percentage[arm_protection_settings_notification_at] = arm_protection_settings_notification_value; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 2 -> arm_protection_settings_notification_record.counting_period[arm_protection_settings_notification_at] = arm_protection_settings_notification_value; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_record.action = arm_protection_settings_notification_value;
  arm_protection_settings_notification_record.source = arm_protection_settings_notification_value;
  skip
}

/* each byte of Arm Protection Settings Notification set to where it lies, so a field read out of place says so */
inline ramp_arm_protection_settings_notification(arm_protection_settings_notification_record, arm_protection_settings_notification_base) {
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 8 -> arm_protection_settings_notification_record.notification_time[arm_protection_settings_notification_at] = (arm_protection_settings_notification_base + 0 + arm_protection_settings_notification_at + 1) % 256; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> arm_protection_settings_notification_record.mpid[arm_protection_settings_notification_at] = (arm_protection_settings_notification_base + 8 + arm_protection_settings_notification_at + 1) % 256; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 11 -> arm_protection_settings_notification_record.underlying_symbol[arm_protection_settings_notification_at] = (arm_protection_settings_notification_base + 12 + arm_protection_settings_notification_at + 1) % 256; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> arm_protection_settings_notification_record.allowable_engagement_percentage[arm_protection_settings_notification_at] = (arm_protection_settings_notification_base + 23 + arm_protection_settings_notification_at + 1) % 256; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 2 -> arm_protection_settings_notification_record.counting_period[arm_protection_settings_notification_at] = (arm_protection_settings_notification_base + 27 + arm_protection_settings_notification_at + 1) % 256; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_record.action = (arm_protection_settings_notification_base + 29 + 1) % 256;
  arm_protection_settings_notification_record.source = (arm_protection_settings_notification_base + 30 + 1) % 256;
  skip
}

/* Arm Protection Settings Notification to the wire, 31 bytes from where the cursor stands */
inline encode_arm_protection_settings_notification(arm_protection_settings_notification_record) {
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 8 -> wire[at] = arm_protection_settings_notification_record.notification_time[arm_protection_settings_notification_at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> wire[at] = arm_protection_settings_notification_record.mpid[arm_protection_settings_notification_at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 11 -> wire[at] = arm_protection_settings_notification_record.underlying_symbol[arm_protection_settings_notification_at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> wire[at] = arm_protection_settings_notification_record.allowable_engagement_percentage[arm_protection_settings_notification_at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 2 -> wire[at] = arm_protection_settings_notification_record.counting_period[arm_protection_settings_notification_at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  wire[at] = arm_protection_settings_notification_record.action; at = at + 1;
  wire[at] = arm_protection_settings_notification_record.source; at = at + 1;
  skip
}

/* Arm Protection Settings Notification off the wire, 31 bytes from where the cursor stands */
inline decode_arm_protection_settings_notification(arm_protection_settings_notification_record) {
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 8 -> arm_protection_settings_notification_record.notification_time[arm_protection_settings_notification_at] = wire[at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> arm_protection_settings_notification_record.mpid[arm_protection_settings_notification_at] = wire[at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 11 -> arm_protection_settings_notification_record.underlying_symbol[arm_protection_settings_notification_at] = wire[at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> arm_protection_settings_notification_record.allowable_engagement_percentage[arm_protection_settings_notification_at] = wire[at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 2 -> arm_protection_settings_notification_record.counting_period[arm_protection_settings_notification_at] = wire[at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_record.action = wire[at]; at = at + 1;
  arm_protection_settings_notification_record.source = wire[at]; at = at + 1;
  skip
}

/* what was read of Arm Protection Settings Notification is what was written, byte for byte */
inline equal_arm_protection_settings_notification(arm_protection_settings_notification_read, arm_protection_settings_notification_written) {
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 8 -> assert(arm_protection_settings_notification_read.notification_time[arm_protection_settings_notification_at] == arm_protection_settings_notification_written.notification_time[arm_protection_settings_notification_at]); arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> assert(arm_protection_settings_notification_read.mpid[arm_protection_settings_notification_at] == arm_protection_settings_notification_written.mpid[arm_protection_settings_notification_at]); arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 11 -> assert(arm_protection_settings_notification_read.underlying_symbol[arm_protection_settings_notification_at] == arm_protection_settings_notification_written.underlying_symbol[arm_protection_settings_notification_at]); arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 4 -> assert(arm_protection_settings_notification_read.allowable_engagement_percentage[arm_protection_settings_notification_at] == arm_protection_settings_notification_written.allowable_engagement_percentage[arm_protection_settings_notification_at]); arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm_protection_settings_notification_at = 0;
  do
  :: arm_protection_settings_notification_at < 2 -> assert(arm_protection_settings_notification_read.counting_period[arm_protection_settings_notification_at] == arm_protection_settings_notification_written.counting_period[arm_protection_settings_notification_at]); arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  assert(arm_protection_settings_notification_read.action == arm_protection_settings_notification_written.action);
  assert(arm_protection_settings_notification_read.source == arm_protection_settings_notification_written.source);
  skip
}

/* ---- Cancel Notification: 36 bytes ------------------------------------------- */

/* This is the message format that will be used to notify firms about system generated or firm requested quote and eQuote cancels. */
typedef CancelNotification {
  byte notification_time[8];
  byte mpid[4];
  byte product_id[4];
  byte liquidity_type;
  byte client_message_id[4];
  byte bulk_quote_index;
  byte quotee_quote_side;
  byte size[4];
  byte engine_sequence_number[8];
  byte cancel_reason
};

int cancel_notification_at;

/* every byte of Cancel Notification set to one value */
inline fill_cancel_notification(cancel_notification_record, cancel_notification_value) {
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.notification_time[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.mpid[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.product_id[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.liquidity_type = cancel_notification_value;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_message_id[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.bulk_quote_index = cancel_notification_value;
  cancel_notification_record.quotee_quote_side = cancel_notification_value;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.size[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.engine_sequence_number[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.cancel_reason = cancel_notification_value;
  skip
}

/* each byte of Cancel Notification set to where it lies, so a field read out of place says so */
inline ramp_cancel_notification(cancel_notification_record, cancel_notification_base) {
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.notification_time[cancel_notification_at] = (cancel_notification_base + 0 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.mpid[cancel_notification_at] = (cancel_notification_base + 8 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.product_id[cancel_notification_at] = (cancel_notification_base + 12 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.liquidity_type = (cancel_notification_base + 16 + 1) % 256;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_message_id[cancel_notification_at] = (cancel_notification_base + 17 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.bulk_quote_index = (cancel_notification_base + 21 + 1) % 256;
  cancel_notification_record.quotee_quote_side = (cancel_notification_base + 22 + 1) % 256;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.size[cancel_notification_at] = (cancel_notification_base + 23 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.engine_sequence_number[cancel_notification_at] = (cancel_notification_base + 27 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.cancel_reason = (cancel_notification_base + 35 + 1) % 256;
  skip
}

/* Cancel Notification to the wire, 36 bytes from where the cursor stands */
inline encode_cancel_notification(cancel_notification_record) {
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> wire[at] = cancel_notification_record.notification_time[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.mpid[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.product_id[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  wire[at] = cancel_notification_record.liquidity_type; at = at + 1;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.client_message_id[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  wire[at] = cancel_notification_record.bulk_quote_index; at = at + 1;
  wire[at] = cancel_notification_record.quotee_quote_side; at = at + 1;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.size[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> wire[at] = cancel_notification_record.engine_sequence_number[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  wire[at] = cancel_notification_record.cancel_reason; at = at + 1;
  skip
}

/* Cancel Notification off the wire, 36 bytes from where the cursor stands */
inline decode_cancel_notification(cancel_notification_record) {
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.notification_time[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.mpid[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.product_id[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.liquidity_type = wire[at]; at = at + 1;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_message_id[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.bulk_quote_index = wire[at]; at = at + 1;
  cancel_notification_record.quotee_quote_side = wire[at]; at = at + 1;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.size[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.engine_sequence_number[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancel Notification is what was written, byte for byte */
inline equal_cancel_notification(cancel_notification_read, cancel_notification_written) {
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> assert(cancel_notification_read.notification_time[cancel_notification_at] == cancel_notification_written.notification_time[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.mpid[cancel_notification_at] == cancel_notification_written.mpid[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.product_id[cancel_notification_at] == cancel_notification_written.product_id[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  assert(cancel_notification_read.liquidity_type == cancel_notification_written.liquidity_type);
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.client_message_id[cancel_notification_at] == cancel_notification_written.client_message_id[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  assert(cancel_notification_read.bulk_quote_index == cancel_notification_written.bulk_quote_index);
  assert(cancel_notification_read.quotee_quote_side == cancel_notification_written.quotee_quote_side);
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.size[cancel_notification_at] == cancel_notification_written.size[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> assert(cancel_notification_read.engine_sequence_number[cancel_notification_at] == cancel_notification_written.engine_sequence_number[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  assert(cancel_notification_read.cancel_reason == cancel_notification_written.cancel_reason);
  skip
}

/* ---- Execution Notification: 49 bytes ---------------------------------------- */

/* This message format will be used to notify the firms of executions of their quotes and eQuotes. */
typedef ExecutionNotification {
  byte notification_time[8];
  byte mpid[4];
  byte product_id[4];
  byte liquidity_type;
  byte client_message_id[4];
  byte bulk_quote_index;
  byte event_id[4];
  byte trade_id[4];
  byte execution_id[8];
  byte reserved_1;
  byte trade_status;
  byte last_price[4];
  byte side;
  byte last_size[4]
};

int execution_notification_at;

/* every byte of Execution Notification set to one value */
inline fill_execution_notification(execution_notification_record, execution_notification_value) {
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> execution_notification_record.notification_time[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.mpid[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.product_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.liquidity_type = execution_notification_value;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_message_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.bulk_quote_index = execution_notification_value;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.event_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.trade_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> execution_notification_record.execution_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.reserved_1 = execution_notification_value;
  execution_notification_record.trade_status = execution_notification_value;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_price[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.side = execution_notification_value;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_size[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Notification set to where it lies, so a field read out of place says so */
inline ramp_execution_notification(execution_notification_record, execution_notification_base) {
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> execution_notification_record.notification_time[execution_notification_at] = (execution_notification_base + 0 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.mpid[execution_notification_at] = (execution_notification_base + 8 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.product_id[execution_notification_at] = (execution_notification_base + 12 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.liquidity_type = (execution_notification_base + 16 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_message_id[execution_notification_at] = (execution_notification_base + 17 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.bulk_quote_index = (execution_notification_base + 21 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.event_id[execution_notification_at] = (execution_notification_base + 22 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.trade_id[execution_notification_at] = (execution_notification_base + 26 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> execution_notification_record.execution_id[execution_notification_at] = (execution_notification_base + 30 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.reserved_1 = (execution_notification_base + 38 + 1) % 256;
  execution_notification_record.trade_status = (execution_notification_base + 39 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_price[execution_notification_at] = (execution_notification_base + 40 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.side = (execution_notification_base + 44 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_size[execution_notification_at] = (execution_notification_base + 45 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notification to the wire, 49 bytes from where the cursor stands */
inline encode_execution_notification(execution_notification_record) {
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> wire[at] = execution_notification_record.notification_time[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.mpid[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.product_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = execution_notification_record.liquidity_type; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.client_message_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = execution_notification_record.bulk_quote_index; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.event_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.trade_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> wire[at] = execution_notification_record.execution_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = execution_notification_record.reserved_1; at = at + 1;
  wire[at] = execution_notification_record.trade_status; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.last_price[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = execution_notification_record.side; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.last_size[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notification off the wire, 49 bytes from where the cursor stands */
inline decode_execution_notification(execution_notification_record) {
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> execution_notification_record.notification_time[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.mpid[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.product_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.liquidity_type = wire[at]; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_message_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.bulk_quote_index = wire[at]; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.event_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.trade_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> execution_notification_record.execution_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.reserved_1 = wire[at]; at = at + 1;
  execution_notification_record.trade_status = wire[at]; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_price[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.side = wire[at]; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_size[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Notification is what was written, byte for byte */
inline equal_execution_notification(execution_notification_read, execution_notification_written) {
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> assert(execution_notification_read.notification_time[execution_notification_at] == execution_notification_written.notification_time[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.mpid[execution_notification_at] == execution_notification_written.mpid[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.product_id[execution_notification_at] == execution_notification_written.product_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  assert(execution_notification_read.liquidity_type == execution_notification_written.liquidity_type);
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.client_message_id[execution_notification_at] == execution_notification_written.client_message_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  assert(execution_notification_read.bulk_quote_index == execution_notification_written.bulk_quote_index);
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.event_id[execution_notification_at] == execution_notification_written.event_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.trade_id[execution_notification_at] == execution_notification_written.trade_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 8 -> assert(execution_notification_read.execution_id[execution_notification_at] == execution_notification_written.execution_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  assert(execution_notification_read.reserved_1 == execution_notification_written.reserved_1);
  assert(execution_notification_read.trade_status == execution_notification_written.trade_status);
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.last_price[execution_notification_at] == execution_notification_written.last_price[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  assert(execution_notification_read.side == execution_notification_written.side);
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.last_size[execution_notification_at] == execution_notification_written.last_size[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm Settings Update Request: 26 bytes ----------------------------------- */

/* Firms can use this message format to set up their ARM protection settings for each session. Changes to these settings can be made throughout the day. */
typedef ArmSettingsUpdateRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte action;
  byte underlying_symbol[11];
  byte allowable_engagement_percentage[4];
  byte counting_period[2]
};

int arm_settings_update_request_at;

/* every byte of Arm Settings Update Request set to one value */
inline fill_arm_settings_update_request(arm_settings_update_request_record, arm_settings_update_request_value) {
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.client_message_id[arm_settings_update_request_at] = arm_settings_update_request_value; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.mpid[arm_settings_update_request_at] = arm_settings_update_request_value; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_record.action = arm_settings_update_request_value;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 11 -> arm_settings_update_request_record.underlying_symbol[arm_settings_update_request_at] = arm_settings_update_request_value; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.allowable_engagement_percentage[arm_settings_update_request_at] = arm_settings_update_request_value; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 2 -> arm_settings_update_request_record.counting_period[arm_settings_update_request_at] = arm_settings_update_request_value; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Arm Settings Update Request set to where it lies, so a field read out of place says so */
inline ramp_arm_settings_update_request(arm_settings_update_request_record, arm_settings_update_request_base) {
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.client_message_id[arm_settings_update_request_at] = (arm_settings_update_request_base + 0 + arm_settings_update_request_at + 1) % 256; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.mpid[arm_settings_update_request_at] = (arm_settings_update_request_base + 4 + arm_settings_update_request_at + 1) % 256; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_record.action = (arm_settings_update_request_base + 8 + 1) % 256;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 11 -> arm_settings_update_request_record.underlying_symbol[arm_settings_update_request_at] = (arm_settings_update_request_base + 9 + arm_settings_update_request_at + 1) % 256; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.allowable_engagement_percentage[arm_settings_update_request_at] = (arm_settings_update_request_base + 20 + arm_settings_update_request_at + 1) % 256; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 2 -> arm_settings_update_request_record.counting_period[arm_settings_update_request_at] = (arm_settings_update_request_base + 24 + arm_settings_update_request_at + 1) % 256; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* Arm Settings Update Request to the wire, 26 bytes from where the cursor stands */
inline encode_arm_settings_update_request(arm_settings_update_request_record) {
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> wire[at] = arm_settings_update_request_record.client_message_id[arm_settings_update_request_at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> wire[at] = arm_settings_update_request_record.mpid[arm_settings_update_request_at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  wire[at] = arm_settings_update_request_record.action; at = at + 1;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 11 -> wire[at] = arm_settings_update_request_record.underlying_symbol[arm_settings_update_request_at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> wire[at] = arm_settings_update_request_record.allowable_engagement_percentage[arm_settings_update_request_at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 2 -> wire[at] = arm_settings_update_request_record.counting_period[arm_settings_update_request_at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* Arm Settings Update Request off the wire, 26 bytes from where the cursor stands */
inline decode_arm_settings_update_request(arm_settings_update_request_record) {
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.client_message_id[arm_settings_update_request_at] = wire[at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.mpid[arm_settings_update_request_at] = wire[at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_record.action = wire[at]; at = at + 1;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 11 -> arm_settings_update_request_record.underlying_symbol[arm_settings_update_request_at] = wire[at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> arm_settings_update_request_record.allowable_engagement_percentage[arm_settings_update_request_at] = wire[at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 2 -> arm_settings_update_request_record.counting_period[arm_settings_update_request_at] = wire[at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Arm Settings Update Request is what was written, byte for byte */
inline equal_arm_settings_update_request(arm_settings_update_request_read, arm_settings_update_request_written) {
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> assert(arm_settings_update_request_read.client_message_id[arm_settings_update_request_at] == arm_settings_update_request_written.client_message_id[arm_settings_update_request_at]); arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> assert(arm_settings_update_request_read.mpid[arm_settings_update_request_at] == arm_settings_update_request_written.mpid[arm_settings_update_request_at]); arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  assert(arm_settings_update_request_read.action == arm_settings_update_request_written.action);
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 11 -> assert(arm_settings_update_request_read.underlying_symbol[arm_settings_update_request_at] == arm_settings_update_request_written.underlying_symbol[arm_settings_update_request_at]); arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 4 -> assert(arm_settings_update_request_read.allowable_engagement_percentage[arm_settings_update_request_at] == arm_settings_update_request_written.allowable_engagement_percentage[arm_settings_update_request_at]); arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  arm_settings_update_request_at = 0;
  do
  :: arm_settings_update_request_at < 2 -> assert(arm_settings_update_request_read.counting_period[arm_settings_update_request_at] == arm_settings_update_request_written.counting_period[arm_settings_update_request_at]); arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm Settings Update Response: 20 bytes ---------------------------------- */

/* MIAX uses this format to respond to the firm with a status of their ARM protection settings request. */
typedef ArmSettingsUpdateResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11];
  byte arm_settings_update_status
};

int arm_settings_update_response_at;

/* every byte of Arm Settings Update Response set to one value */
inline fill_arm_settings_update_response(arm_settings_update_response_record, arm_settings_update_response_value) {
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> arm_settings_update_response_record.client_message_id[arm_settings_update_response_at] = arm_settings_update_response_value; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> arm_settings_update_response_record.mpid[arm_settings_update_response_at] = arm_settings_update_response_value; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 11 -> arm_settings_update_response_record.underlying_symbol[arm_settings_update_response_at] = arm_settings_update_response_value; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_record.arm_settings_update_status = arm_settings_update_response_value;
  skip
}

/* each byte of Arm Settings Update Response set to where it lies, so a field read out of place says so */
inline ramp_arm_settings_update_response(arm_settings_update_response_record, arm_settings_update_response_base) {
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> arm_settings_update_response_record.client_message_id[arm_settings_update_response_at] = (arm_settings_update_response_base + 0 + arm_settings_update_response_at + 1) % 256; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> arm_settings_update_response_record.mpid[arm_settings_update_response_at] = (arm_settings_update_response_base + 4 + arm_settings_update_response_at + 1) % 256; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 11 -> arm_settings_update_response_record.underlying_symbol[arm_settings_update_response_at] = (arm_settings_update_response_base + 8 + arm_settings_update_response_at + 1) % 256; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_record.arm_settings_update_status = (arm_settings_update_response_base + 19 + 1) % 256;
  skip
}

/* Arm Settings Update Response to the wire, 20 bytes from where the cursor stands */
inline encode_arm_settings_update_response(arm_settings_update_response_record) {
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> wire[at] = arm_settings_update_response_record.client_message_id[arm_settings_update_response_at]; at = at + 1; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> wire[at] = arm_settings_update_response_record.mpid[arm_settings_update_response_at]; at = at + 1; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 11 -> wire[at] = arm_settings_update_response_record.underlying_symbol[arm_settings_update_response_at]; at = at + 1; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  wire[at] = arm_settings_update_response_record.arm_settings_update_status; at = at + 1;
  skip
}

/* Arm Settings Update Response off the wire, 20 bytes from where the cursor stands */
inline decode_arm_settings_update_response(arm_settings_update_response_record) {
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> arm_settings_update_response_record.client_message_id[arm_settings_update_response_at] = wire[at]; at = at + 1; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> arm_settings_update_response_record.mpid[arm_settings_update_response_at] = wire[at]; at = at + 1; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 11 -> arm_settings_update_response_record.underlying_symbol[arm_settings_update_response_at] = wire[at]; at = at + 1; arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_record.arm_settings_update_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Arm Settings Update Response is what was written, byte for byte */
inline equal_arm_settings_update_response(arm_settings_update_response_read, arm_settings_update_response_written) {
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> assert(arm_settings_update_response_read.client_message_id[arm_settings_update_response_at] == arm_settings_update_response_written.client_message_id[arm_settings_update_response_at]); arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 4 -> assert(arm_settings_update_response_read.mpid[arm_settings_update_response_at] == arm_settings_update_response_written.mpid[arm_settings_update_response_at]); arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  arm_settings_update_response_at = 0;
  do
  :: arm_settings_update_response_at < 11 -> assert(arm_settings_update_response_read.underlying_symbol[arm_settings_update_response_at] == arm_settings_update_response_written.underlying_symbol[arm_settings_update_response_at]); arm_settings_update_response_at = arm_settings_update_response_at + 1
  :: else -> break
  od;
  assert(arm_settings_update_response_read.arm_settings_update_status == arm_settings_update_response_written.arm_settings_update_status);
  skip
}

/* ---- Enhanced Quote E Quote Message: 31 bytes -------------------------------- */

/* This is the format for an eQuote message that can be sent either to match with orders and quotes on the MIAX book or when responding to a liquidity seeking event. */
typedef EnhancedQuoteEQuoteMessage {
  byte client_message_id[4];
  byte mpid[4];
  byte product_id[4];
  byte e_quote_action;
  byte e_quote_type;
  byte event_id[4];
  byte target_message_id[4];
  byte price[4];
  byte size[4];
  byte side
};

int enhanced_quote_e_quote_message_at;

/* every byte of Enhanced Quote E Quote Message set to one value */
inline fill_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_record, enhanced_quote_e_quote_message_value) {
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.client_message_id[enhanced_quote_e_quote_message_at] = enhanced_quote_e_quote_message_value; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.mpid[enhanced_quote_e_quote_message_at] = enhanced_quote_e_quote_message_value; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.product_id[enhanced_quote_e_quote_message_at] = enhanced_quote_e_quote_message_value; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_record.e_quote_action = enhanced_quote_e_quote_message_value;
  enhanced_quote_e_quote_message_record.e_quote_type = enhanced_quote_e_quote_message_value;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.event_id[enhanced_quote_e_quote_message_at] = enhanced_quote_e_quote_message_value; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.target_message_id[enhanced_quote_e_quote_message_at] = enhanced_quote_e_quote_message_value; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.price[enhanced_quote_e_quote_message_at] = enhanced_quote_e_quote_message_value; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.size[enhanced_quote_e_quote_message_at] = enhanced_quote_e_quote_message_value; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_record.side = enhanced_quote_e_quote_message_value;
  skip
}

/* each byte of Enhanced Quote E Quote Message set to where it lies, so a field read out of place says so */
inline ramp_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_record, enhanced_quote_e_quote_message_base) {
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.client_message_id[enhanced_quote_e_quote_message_at] = (enhanced_quote_e_quote_message_base + 0 + enhanced_quote_e_quote_message_at + 1) % 256; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.mpid[enhanced_quote_e_quote_message_at] = (enhanced_quote_e_quote_message_base + 4 + enhanced_quote_e_quote_message_at + 1) % 256; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.product_id[enhanced_quote_e_quote_message_at] = (enhanced_quote_e_quote_message_base + 8 + enhanced_quote_e_quote_message_at + 1) % 256; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_record.e_quote_action = (enhanced_quote_e_quote_message_base + 12 + 1) % 256;
  enhanced_quote_e_quote_message_record.e_quote_type = (enhanced_quote_e_quote_message_base + 13 + 1) % 256;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.event_id[enhanced_quote_e_quote_message_at] = (enhanced_quote_e_quote_message_base + 14 + enhanced_quote_e_quote_message_at + 1) % 256; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.target_message_id[enhanced_quote_e_quote_message_at] = (enhanced_quote_e_quote_message_base + 18 + enhanced_quote_e_quote_message_at + 1) % 256; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.price[enhanced_quote_e_quote_message_at] = (enhanced_quote_e_quote_message_base + 22 + enhanced_quote_e_quote_message_at + 1) % 256; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.size[enhanced_quote_e_quote_message_at] = (enhanced_quote_e_quote_message_base + 26 + enhanced_quote_e_quote_message_at + 1) % 256; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_record.side = (enhanced_quote_e_quote_message_base + 30 + 1) % 256;
  skip
}

/* Enhanced Quote E Quote Message to the wire, 31 bytes from where the cursor stands */
inline encode_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_record) {
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> wire[at] = enhanced_quote_e_quote_message_record.client_message_id[enhanced_quote_e_quote_message_at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> wire[at] = enhanced_quote_e_quote_message_record.mpid[enhanced_quote_e_quote_message_at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> wire[at] = enhanced_quote_e_quote_message_record.product_id[enhanced_quote_e_quote_message_at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_quote_e_quote_message_record.e_quote_action; at = at + 1;
  wire[at] = enhanced_quote_e_quote_message_record.e_quote_type; at = at + 1;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> wire[at] = enhanced_quote_e_quote_message_record.event_id[enhanced_quote_e_quote_message_at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> wire[at] = enhanced_quote_e_quote_message_record.target_message_id[enhanced_quote_e_quote_message_at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> wire[at] = enhanced_quote_e_quote_message_record.price[enhanced_quote_e_quote_message_at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> wire[at] = enhanced_quote_e_quote_message_record.size[enhanced_quote_e_quote_message_at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_quote_e_quote_message_record.side; at = at + 1;
  skip
}

/* Enhanced Quote E Quote Message off the wire, 31 bytes from where the cursor stands */
inline decode_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_record) {
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.client_message_id[enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.mpid[enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.product_id[enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_record.e_quote_action = wire[at]; at = at + 1;
  enhanced_quote_e_quote_message_record.e_quote_type = wire[at]; at = at + 1;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.event_id[enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.target_message_id[enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.price[enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> enhanced_quote_e_quote_message_record.size[enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Enhanced Quote E Quote Message is what was written, byte for byte */
inline equal_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_read, enhanced_quote_e_quote_message_written) {
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> assert(enhanced_quote_e_quote_message_read.client_message_id[enhanced_quote_e_quote_message_at] == enhanced_quote_e_quote_message_written.client_message_id[enhanced_quote_e_quote_message_at]); enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> assert(enhanced_quote_e_quote_message_read.mpid[enhanced_quote_e_quote_message_at] == enhanced_quote_e_quote_message_written.mpid[enhanced_quote_e_quote_message_at]); enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> assert(enhanced_quote_e_quote_message_read.product_id[enhanced_quote_e_quote_message_at] == enhanced_quote_e_quote_message_written.product_id[enhanced_quote_e_quote_message_at]); enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  assert(enhanced_quote_e_quote_message_read.e_quote_action == enhanced_quote_e_quote_message_written.e_quote_action);
  assert(enhanced_quote_e_quote_message_read.e_quote_type == enhanced_quote_e_quote_message_written.e_quote_type);
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> assert(enhanced_quote_e_quote_message_read.event_id[enhanced_quote_e_quote_message_at] == enhanced_quote_e_quote_message_written.event_id[enhanced_quote_e_quote_message_at]); enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> assert(enhanced_quote_e_quote_message_read.target_message_id[enhanced_quote_e_quote_message_at] == enhanced_quote_e_quote_message_written.target_message_id[enhanced_quote_e_quote_message_at]); enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> assert(enhanced_quote_e_quote_message_read.price[enhanced_quote_e_quote_message_at] == enhanced_quote_e_quote_message_written.price[enhanced_quote_e_quote_message_at]); enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  enhanced_quote_e_quote_message_at = 0;
  do
  :: enhanced_quote_e_quote_message_at < 4 -> assert(enhanced_quote_e_quote_message_read.size[enhanced_quote_e_quote_message_at] == enhanced_quote_e_quote_message_written.size[enhanced_quote_e_quote_message_at]); enhanced_quote_e_quote_message_at = enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  assert(enhanced_quote_e_quote_message_read.side == enhanced_quote_e_quote_message_written.side);
  skip
}

/* ---- Mass Quote Cancel Request: 19 bytes ------------------------------------- */

/* Firms can use this message format to request the cancelation of all quotes and eQuotes for an MPID, or all quotes and eQuotes for an MPID for all series for an underlying */
typedef MassQuoteCancelRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11]
};

int mass_quote_cancel_request_at;

/* every byte of Mass Quote Cancel Request set to one value */
inline fill_mass_quote_cancel_request(mass_quote_cancel_request_record, mass_quote_cancel_request_value) {
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> mass_quote_cancel_request_record.client_message_id[mass_quote_cancel_request_at] = mass_quote_cancel_request_value; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> mass_quote_cancel_request_record.mpid[mass_quote_cancel_request_at] = mass_quote_cancel_request_value; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 11 -> mass_quote_cancel_request_record.underlying_symbol[mass_quote_cancel_request_at] = mass_quote_cancel_request_value; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Quote Cancel Request set to where it lies, so a field read out of place says so */
inline ramp_mass_quote_cancel_request(mass_quote_cancel_request_record, mass_quote_cancel_request_base) {
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> mass_quote_cancel_request_record.client_message_id[mass_quote_cancel_request_at] = (mass_quote_cancel_request_base + 0 + mass_quote_cancel_request_at + 1) % 256; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> mass_quote_cancel_request_record.mpid[mass_quote_cancel_request_at] = (mass_quote_cancel_request_base + 4 + mass_quote_cancel_request_at + 1) % 256; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 11 -> mass_quote_cancel_request_record.underlying_symbol[mass_quote_cancel_request_at] = (mass_quote_cancel_request_base + 8 + mass_quote_cancel_request_at + 1) % 256; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Quote Cancel Request to the wire, 19 bytes from where the cursor stands */
inline encode_mass_quote_cancel_request(mass_quote_cancel_request_record) {
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> wire[at] = mass_quote_cancel_request_record.client_message_id[mass_quote_cancel_request_at]; at = at + 1; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> wire[at] = mass_quote_cancel_request_record.mpid[mass_quote_cancel_request_at]; at = at + 1; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 11 -> wire[at] = mass_quote_cancel_request_record.underlying_symbol[mass_quote_cancel_request_at]; at = at + 1; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Quote Cancel Request off the wire, 19 bytes from where the cursor stands */
inline decode_mass_quote_cancel_request(mass_quote_cancel_request_record) {
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> mass_quote_cancel_request_record.client_message_id[mass_quote_cancel_request_at] = wire[at]; at = at + 1; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> mass_quote_cancel_request_record.mpid[mass_quote_cancel_request_at] = wire[at]; at = at + 1; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 11 -> mass_quote_cancel_request_record.underlying_symbol[mass_quote_cancel_request_at] = wire[at]; at = at + 1; mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Quote Cancel Request is what was written, byte for byte */
inline equal_mass_quote_cancel_request(mass_quote_cancel_request_read, mass_quote_cancel_request_written) {
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> assert(mass_quote_cancel_request_read.client_message_id[mass_quote_cancel_request_at] == mass_quote_cancel_request_written.client_message_id[mass_quote_cancel_request_at]); mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 4 -> assert(mass_quote_cancel_request_read.mpid[mass_quote_cancel_request_at] == mass_quote_cancel_request_written.mpid[mass_quote_cancel_request_at]); mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_at = 0;
  do
  :: mass_quote_cancel_request_at < 11 -> assert(mass_quote_cancel_request_read.underlying_symbol[mass_quote_cancel_request_at] == mass_quote_cancel_request_written.underlying_symbol[mass_quote_cancel_request_at]); mass_quote_cancel_request_at = mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Quote Cancel Response: 9 bytes ------------------------------------- */

/* This message format will be used to inform the firm about the status of their previous mass quote cancel request. */
typedef MassQuoteCancelResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte mass_quote_cancel_status
};

int mass_quote_cancel_response_at;

/* every byte of Mass Quote Cancel Response set to one value */
inline fill_mass_quote_cancel_response(mass_quote_cancel_response_record, mass_quote_cancel_response_value) {
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> mass_quote_cancel_response_record.client_message_id[mass_quote_cancel_response_at] = mass_quote_cancel_response_value; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> mass_quote_cancel_response_record.mpid[mass_quote_cancel_response_at] = mass_quote_cancel_response_value; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_record.mass_quote_cancel_status = mass_quote_cancel_response_value;
  skip
}

/* each byte of Mass Quote Cancel Response set to where it lies, so a field read out of place says so */
inline ramp_mass_quote_cancel_response(mass_quote_cancel_response_record, mass_quote_cancel_response_base) {
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> mass_quote_cancel_response_record.client_message_id[mass_quote_cancel_response_at] = (mass_quote_cancel_response_base + 0 + mass_quote_cancel_response_at + 1) % 256; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> mass_quote_cancel_response_record.mpid[mass_quote_cancel_response_at] = (mass_quote_cancel_response_base + 4 + mass_quote_cancel_response_at + 1) % 256; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_record.mass_quote_cancel_status = (mass_quote_cancel_response_base + 8 + 1) % 256;
  skip
}

/* Mass Quote Cancel Response to the wire, 9 bytes from where the cursor stands */
inline encode_mass_quote_cancel_response(mass_quote_cancel_response_record) {
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> wire[at] = mass_quote_cancel_response_record.client_message_id[mass_quote_cancel_response_at]; at = at + 1; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> wire[at] = mass_quote_cancel_response_record.mpid[mass_quote_cancel_response_at]; at = at + 1; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  wire[at] = mass_quote_cancel_response_record.mass_quote_cancel_status; at = at + 1;
  skip
}

/* Mass Quote Cancel Response off the wire, 9 bytes from where the cursor stands */
inline decode_mass_quote_cancel_response(mass_quote_cancel_response_record) {
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> mass_quote_cancel_response_record.client_message_id[mass_quote_cancel_response_at] = wire[at]; at = at + 1; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> mass_quote_cancel_response_record.mpid[mass_quote_cancel_response_at] = wire[at]; at = at + 1; mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_record.mass_quote_cancel_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Quote Cancel Response is what was written, byte for byte */
inline equal_mass_quote_cancel_response(mass_quote_cancel_response_read, mass_quote_cancel_response_written) {
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> assert(mass_quote_cancel_response_read.client_message_id[mass_quote_cancel_response_at] == mass_quote_cancel_response_written.client_message_id[mass_quote_cancel_response_at]); mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  mass_quote_cancel_response_at = 0;
  do
  :: mass_quote_cancel_response_at < 4 -> assert(mass_quote_cancel_response_read.mpid[mass_quote_cancel_response_at] == mass_quote_cancel_response_written.mpid[mass_quote_cancel_response_at]); mass_quote_cancel_response_at = mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  assert(mass_quote_cancel_response_read.mass_quote_cancel_status == mass_quote_cancel_response_written.mass_quote_cancel_status);
  skip
}

/* ---- Quote Protection Reset Request: 19 bytes -------------------------------- */

/* Following a quote protection being engaged for a given MPID and underlying, firms must use this message format to reset their Quote Protection in order to start quoting for any option of the specified underlying. */
typedef QuoteProtectionResetRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11]
};

int quote_protection_reset_request_at;

/* every byte of Quote Protection Reset Request set to one value */
inline fill_quote_protection_reset_request(quote_protection_reset_request_record, quote_protection_reset_request_value) {
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> quote_protection_reset_request_record.client_message_id[quote_protection_reset_request_at] = quote_protection_reset_request_value; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> quote_protection_reset_request_record.mpid[quote_protection_reset_request_at] = quote_protection_reset_request_value; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 11 -> quote_protection_reset_request_record.underlying_symbol[quote_protection_reset_request_at] = quote_protection_reset_request_value; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Protection Reset Request set to where it lies, so a field read out of place says so */
inline ramp_quote_protection_reset_request(quote_protection_reset_request_record, quote_protection_reset_request_base) {
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> quote_protection_reset_request_record.client_message_id[quote_protection_reset_request_at] = (quote_protection_reset_request_base + 0 + quote_protection_reset_request_at + 1) % 256; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> quote_protection_reset_request_record.mpid[quote_protection_reset_request_at] = (quote_protection_reset_request_base + 4 + quote_protection_reset_request_at + 1) % 256; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 11 -> quote_protection_reset_request_record.underlying_symbol[quote_protection_reset_request_at] = (quote_protection_reset_request_base + 8 + quote_protection_reset_request_at + 1) % 256; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Protection Reset Request to the wire, 19 bytes from where the cursor stands */
inline encode_quote_protection_reset_request(quote_protection_reset_request_record) {
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> wire[at] = quote_protection_reset_request_record.client_message_id[quote_protection_reset_request_at]; at = at + 1; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> wire[at] = quote_protection_reset_request_record.mpid[quote_protection_reset_request_at]; at = at + 1; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 11 -> wire[at] = quote_protection_reset_request_record.underlying_symbol[quote_protection_reset_request_at]; at = at + 1; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Protection Reset Request off the wire, 19 bytes from where the cursor stands */
inline decode_quote_protection_reset_request(quote_protection_reset_request_record) {
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> quote_protection_reset_request_record.client_message_id[quote_protection_reset_request_at] = wire[at]; at = at + 1; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> quote_protection_reset_request_record.mpid[quote_protection_reset_request_at] = wire[at]; at = at + 1; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 11 -> quote_protection_reset_request_record.underlying_symbol[quote_protection_reset_request_at] = wire[at]; at = at + 1; quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Protection Reset Request is what was written, byte for byte */
inline equal_quote_protection_reset_request(quote_protection_reset_request_read, quote_protection_reset_request_written) {
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> assert(quote_protection_reset_request_read.client_message_id[quote_protection_reset_request_at] == quote_protection_reset_request_written.client_message_id[quote_protection_reset_request_at]); quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 4 -> assert(quote_protection_reset_request_read.mpid[quote_protection_reset_request_at] == quote_protection_reset_request_written.mpid[quote_protection_reset_request_at]); quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  quote_protection_reset_request_at = 0;
  do
  :: quote_protection_reset_request_at < 11 -> assert(quote_protection_reset_request_read.underlying_symbol[quote_protection_reset_request_at] == quote_protection_reset_request_written.underlying_symbol[quote_protection_reset_request_at]); quote_protection_reset_request_at = quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Protection Reset Response: 9 bytes -------------------------------- */

/* This message format is used to inform the firms of the status of their Quote Protection Reset request. */
typedef QuoteProtectionResetResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte quote_protection_reset_status
};

int quote_protection_reset_response_at;

/* every byte of Quote Protection Reset Response set to one value */
inline fill_quote_protection_reset_response(quote_protection_reset_response_record, quote_protection_reset_response_value) {
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> quote_protection_reset_response_record.client_message_id[quote_protection_reset_response_at] = quote_protection_reset_response_value; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> quote_protection_reset_response_record.mpid[quote_protection_reset_response_at] = quote_protection_reset_response_value; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_record.quote_protection_reset_status = quote_protection_reset_response_value;
  skip
}

/* each byte of Quote Protection Reset Response set to where it lies, so a field read out of place says so */
inline ramp_quote_protection_reset_response(quote_protection_reset_response_record, quote_protection_reset_response_base) {
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> quote_protection_reset_response_record.client_message_id[quote_protection_reset_response_at] = (quote_protection_reset_response_base + 0 + quote_protection_reset_response_at + 1) % 256; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> quote_protection_reset_response_record.mpid[quote_protection_reset_response_at] = (quote_protection_reset_response_base + 4 + quote_protection_reset_response_at + 1) % 256; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_record.quote_protection_reset_status = (quote_protection_reset_response_base + 8 + 1) % 256;
  skip
}

/* Quote Protection Reset Response to the wire, 9 bytes from where the cursor stands */
inline encode_quote_protection_reset_response(quote_protection_reset_response_record) {
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> wire[at] = quote_protection_reset_response_record.client_message_id[quote_protection_reset_response_at]; at = at + 1; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> wire[at] = quote_protection_reset_response_record.mpid[quote_protection_reset_response_at]; at = at + 1; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  wire[at] = quote_protection_reset_response_record.quote_protection_reset_status; at = at + 1;
  skip
}

/* Quote Protection Reset Response off the wire, 9 bytes from where the cursor stands */
inline decode_quote_protection_reset_response(quote_protection_reset_response_record) {
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> quote_protection_reset_response_record.client_message_id[quote_protection_reset_response_at] = wire[at]; at = at + 1; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> quote_protection_reset_response_record.mpid[quote_protection_reset_response_at] = wire[at]; at = at + 1; quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_record.quote_protection_reset_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Protection Reset Response is what was written, byte for byte */
inline equal_quote_protection_reset_response(quote_protection_reset_response_read, quote_protection_reset_response_written) {
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> assert(quote_protection_reset_response_read.client_message_id[quote_protection_reset_response_at] == quote_protection_reset_response_written.client_message_id[quote_protection_reset_response_at]); quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  quote_protection_reset_response_at = 0;
  do
  :: quote_protection_reset_response_at < 4 -> assert(quote_protection_reset_response_read.mpid[quote_protection_reset_response_at] == quote_protection_reset_response_written.mpid[quote_protection_reset_response_at]); quote_protection_reset_response_at = quote_protection_reset_response_at + 1
  :: else -> break
  od;
  assert(quote_protection_reset_response_read.quote_protection_reset_status == quote_protection_reset_response_written.quote_protection_reset_status);
  skip
}

/* ---- Quote Protection Trigger Notification: 24 bytes ------------------------- */

/* This message format will be used to notify firms when an MPID is placed under quote protection. Quote protection can be triggered due to any one of the reasons listed in the message below. */
typedef QuoteProtectionTriggerNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte trigger_reason
};

int quote_protection_trigger_notification_at;

/* every byte of Quote Protection Trigger Notification set to one value */
inline fill_quote_protection_trigger_notification(quote_protection_trigger_notification_record, quote_protection_trigger_notification_value) {
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 8 -> quote_protection_trigger_notification_record.notification_time[quote_protection_trigger_notification_at] = quote_protection_trigger_notification_value; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 4 -> quote_protection_trigger_notification_record.mpid[quote_protection_trigger_notification_at] = quote_protection_trigger_notification_value; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 11 -> quote_protection_trigger_notification_record.underlying_symbol[quote_protection_trigger_notification_at] = quote_protection_trigger_notification_value; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_record.trigger_reason = quote_protection_trigger_notification_value;
  skip
}

/* each byte of Quote Protection Trigger Notification set to where it lies, so a field read out of place says so */
inline ramp_quote_protection_trigger_notification(quote_protection_trigger_notification_record, quote_protection_trigger_notification_base) {
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 8 -> quote_protection_trigger_notification_record.notification_time[quote_protection_trigger_notification_at] = (quote_protection_trigger_notification_base + 0 + quote_protection_trigger_notification_at + 1) % 256; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 4 -> quote_protection_trigger_notification_record.mpid[quote_protection_trigger_notification_at] = (quote_protection_trigger_notification_base + 8 + quote_protection_trigger_notification_at + 1) % 256; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 11 -> quote_protection_trigger_notification_record.underlying_symbol[quote_protection_trigger_notification_at] = (quote_protection_trigger_notification_base + 12 + quote_protection_trigger_notification_at + 1) % 256; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_record.trigger_reason = (quote_protection_trigger_notification_base + 23 + 1) % 256;
  skip
}

/* Quote Protection Trigger Notification to the wire, 24 bytes from where the cursor stands */
inline encode_quote_protection_trigger_notification(quote_protection_trigger_notification_record) {
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 8 -> wire[at] = quote_protection_trigger_notification_record.notification_time[quote_protection_trigger_notification_at]; at = at + 1; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 4 -> wire[at] = quote_protection_trigger_notification_record.mpid[quote_protection_trigger_notification_at]; at = at + 1; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 11 -> wire[at] = quote_protection_trigger_notification_record.underlying_symbol[quote_protection_trigger_notification_at]; at = at + 1; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = quote_protection_trigger_notification_record.trigger_reason; at = at + 1;
  skip
}

/* Quote Protection Trigger Notification off the wire, 24 bytes from where the cursor stands */
inline decode_quote_protection_trigger_notification(quote_protection_trigger_notification_record) {
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 8 -> quote_protection_trigger_notification_record.notification_time[quote_protection_trigger_notification_at] = wire[at]; at = at + 1; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 4 -> quote_protection_trigger_notification_record.mpid[quote_protection_trigger_notification_at] = wire[at]; at = at + 1; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 11 -> quote_protection_trigger_notification_record.underlying_symbol[quote_protection_trigger_notification_at] = wire[at]; at = at + 1; quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_record.trigger_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Protection Trigger Notification is what was written, byte for byte */
inline equal_quote_protection_trigger_notification(quote_protection_trigger_notification_read, quote_protection_trigger_notification_written) {
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 8 -> assert(quote_protection_trigger_notification_read.notification_time[quote_protection_trigger_notification_at] == quote_protection_trigger_notification_written.notification_time[quote_protection_trigger_notification_at]); quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 4 -> assert(quote_protection_trigger_notification_read.mpid[quote_protection_trigger_notification_at] == quote_protection_trigger_notification_written.mpid[quote_protection_trigger_notification_at]); quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  quote_protection_trigger_notification_at = 0;
  do
  :: quote_protection_trigger_notification_at < 11 -> assert(quote_protection_trigger_notification_read.underlying_symbol[quote_protection_trigger_notification_at] == quote_protection_trigger_notification_written.underlying_symbol[quote_protection_trigger_notification_at]); quote_protection_trigger_notification_at = quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(quote_protection_trigger_notification_read.trigger_reason == quote_protection_trigger_notification_written.trigger_reason);
  skip
}

/* ---- Liquidity Seeking Event Notification: 50 bytes -------------------------- */

/* This message format will be used to notify firms of opening imbalances and auction initiation. */
typedef LiquiditySeekingEventNotification {
  byte notification_time[8];
  byte product_id[4];
  byte event_type;
  byte event_id[4];
  byte price[4];
  byte imbalance_side;
  byte quantity_1[4];
  byte quantity_2[4];
  byte quantity_3[4];
  byte quantity_4[4];
  byte attributable_id[4];
  byte reserved_8[8]
};

int liquidity_seeking_event_notification_at;

/* every byte of Liquidity Seeking Event Notification set to one value */
inline fill_liquidity_seeking_event_notification(liquidity_seeking_event_notification_record, liquidity_seeking_event_notification_value) {
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> liquidity_seeking_event_notification_record.notification_time[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.product_id[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_record.event_type = liquidity_seeking_event_notification_value;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.event_id[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.price[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_record.imbalance_side = liquidity_seeking_event_notification_value;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_1[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_2[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_3[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_4[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.attributable_id[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> liquidity_seeking_event_notification_record.reserved_8[liquidity_seeking_event_notification_at] = liquidity_seeking_event_notification_value; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Liquidity Seeking Event Notification set to where it lies, so a field read out of place says so */
inline ramp_liquidity_seeking_event_notification(liquidity_seeking_event_notification_record, liquidity_seeking_event_notification_base) {
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> liquidity_seeking_event_notification_record.notification_time[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 0 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.product_id[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 8 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_record.event_type = (liquidity_seeking_event_notification_base + 12 + 1) % 256;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.event_id[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 13 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.price[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 17 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_record.imbalance_side = (liquidity_seeking_event_notification_base + 21 + 1) % 256;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_1[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 22 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_2[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 26 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_3[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 30 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_4[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 34 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.attributable_id[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 38 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> liquidity_seeking_event_notification_record.reserved_8[liquidity_seeking_event_notification_at] = (liquidity_seeking_event_notification_base + 42 + liquidity_seeking_event_notification_at + 1) % 256; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Seeking Event Notification to the wire, 50 bytes from where the cursor stands */
inline encode_liquidity_seeking_event_notification(liquidity_seeking_event_notification_record) {
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> wire[at] = liquidity_seeking_event_notification_record.notification_time[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.product_id[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_seeking_event_notification_record.event_type; at = at + 1;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.event_id[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.price[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_seeking_event_notification_record.imbalance_side; at = at + 1;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.quantity_1[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.quantity_2[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.quantity_3[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.quantity_4[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> wire[at] = liquidity_seeking_event_notification_record.attributable_id[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> wire[at] = liquidity_seeking_event_notification_record.reserved_8[liquidity_seeking_event_notification_at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Seeking Event Notification off the wire, 50 bytes from where the cursor stands */
inline decode_liquidity_seeking_event_notification(liquidity_seeking_event_notification_record) {
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> liquidity_seeking_event_notification_record.notification_time[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.product_id[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_record.event_type = wire[at]; at = at + 1;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.event_id[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.price[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_record.imbalance_side = wire[at]; at = at + 1;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_1[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_2[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_3[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.quantity_4[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> liquidity_seeking_event_notification_record.attributable_id[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> liquidity_seeking_event_notification_record.reserved_8[liquidity_seeking_event_notification_at] = wire[at]; at = at + 1; liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Liquidity Seeking Event Notification is what was written, byte for byte */
inline equal_liquidity_seeking_event_notification(liquidity_seeking_event_notification_read, liquidity_seeking_event_notification_written) {
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> assert(liquidity_seeking_event_notification_read.notification_time[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.notification_time[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.product_id[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.product_id[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  assert(liquidity_seeking_event_notification_read.event_type == liquidity_seeking_event_notification_written.event_type);
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.event_id[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.event_id[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.price[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.price[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  assert(liquidity_seeking_event_notification_read.imbalance_side == liquidity_seeking_event_notification_written.imbalance_side);
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.quantity_1[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.quantity_1[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.quantity_2[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.quantity_2[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.quantity_3[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.quantity_3[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.quantity_4[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.quantity_4[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 4 -> assert(liquidity_seeking_event_notification_read.attributable_id[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.attributable_id[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  liquidity_seeking_event_notification_at = 0;
  do
  :: liquidity_seeking_event_notification_at < 8 -> assert(liquidity_seeking_event_notification_read.reserved_8[liquidity_seeking_event_notification_at] == liquidity_seeking_event_notification_written.reserved_8[liquidity_seeking_event_notification_at]); liquidity_seeking_event_notification_at = liquidity_seeking_event_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request: 35 bytes ------------------------------------------------- */

/* The SesM client uses this packet to allow the server to authenticate the client and to convey to the server the last sequenced packet that the client received */
typedef LoginRequest {
  byte sesm_version[5];
  byte username[5];
  byte computer_id[8];
  byte application_protocol[8];
  byte requested_session;
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
  login_request_record.requested_session = login_request_value;
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
  login_request_record.requested_session = (login_request_base + 26 + 1) % 256;
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
  wire[at] = login_request_record.requested_session; at = at + 1;
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
  login_request_record.requested_session = wire[at]; at = at + 1;
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
  assert(login_request_read.requested_session == login_request_written.requested_session);
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.requested_sequence_number[login_request_at] == login_request_written.requested_sequence_number[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response: 10 bytes ------------------------------------------------ */

/* The SesM server sends a Login response packet in response to a Login request packet from the client */
typedef LoginResponse {
  byte login_status;
  byte session_id;
  byte highest_sequence_number[8]
};

int login_response_at;

/* every byte of Login Response set to one value */
inline fill_login_response(login_response_record, login_response_value) {
  login_response_record.login_status = login_response_value;
  login_response_record.session_id = login_response_value;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response set to where it lies, so a field read out of place says so */
inline ramp_login_response(login_response_record, login_response_base) {
  login_response_record.login_status = (login_response_base + 0 + 1) % 256;
  login_response_record.session_id = (login_response_base + 1 + 1) % 256;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = (login_response_base + 2 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response to the wire, 10 bytes from where the cursor stands */
inline encode_login_response(login_response_record) {
  wire[at] = login_response_record.login_status; at = at + 1;
  wire[at] = login_response_record.session_id; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> wire[at] = login_response_record.highest_sequence_number[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response off the wire, 10 bytes from where the cursor stands */
inline decode_login_response(login_response_record) {
  login_response_record.login_status = wire[at]; at = at + 1;
  login_response_record.session_id = wire[at]; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response is what was written, byte for byte */
inline equal_login_response(login_response_read, login_response_written) {
  assert(login_response_read.login_status == login_response_written.login_status);
  assert(login_response_read.session_id == login_response_written.session_id);
  login_response_at = 0;
  do
  :: login_response_at < 8 -> assert(login_response_read.highest_sequence_number[login_response_at] == login_response_written.highest_sequence_number[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmission Request: 16 bytes ---------------------------------------- */

/* The SesM client uses this packet to request the server to retransmit a range of packets */
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
    assert(at == 76);
    at = 0;
    decode_series_update(series_update_got);
    assert(at == 76);
    equal_series_update(series_update_got, series_update_sent)
  }
}

/* Valid Quote Width For Opening: encoded, read back, and compared */
proctype check_valid_quote_width_for_opening() {
  ValidQuoteWidthForOpening valid_quote_width_for_opening_sent;
  ValidQuoteWidthForOpening valid_quote_width_for_opening_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_valid_quote_width_for_opening(valid_quote_width_for_opening_sent, 0)
  :: pattern == 1 -> fill_valid_quote_width_for_opening(valid_quote_width_for_opening_sent, 32)
  :: pattern == 2 -> fill_valid_quote_width_for_opening(valid_quote_width_for_opening_sent, 255)
  :: else -> ramp_valid_quote_width_for_opening(valid_quote_width_for_opening_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_valid_quote_width_for_opening(valid_quote_width_for_opening_sent);
    assert(at == 21);
    at = 0;
    decode_valid_quote_width_for_opening(valid_quote_width_for_opening_got);
    assert(at == 21);
    equal_valid_quote_width_for_opening(valid_quote_width_for_opening_got, valid_quote_width_for_opening_sent)
  }
}

/* Enhanced Quote E Quote Response: encoded, read back, and compared */
proctype check_enhanced_quote_e_quote_response() {
  EnhancedQuoteEQuoteResponse enhanced_quote_e_quote_response_sent;
  EnhancedQuoteEQuoteResponse enhanced_quote_e_quote_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_sent, 0)
  :: pattern == 1 -> fill_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_sent, 32)
  :: pattern == 2 -> fill_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_sent, 255)
  :: else -> ramp_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_sent);
    assert(at == 17);
    at = 0;
    decode_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_got);
    assert(at == 17);
    equal_enhanced_quote_e_quote_response(enhanced_quote_e_quote_response_got, enhanced_quote_e_quote_response_sent)
  }
}

/* System State Notification: encoded, read back, and compared */
proctype check_system_state_notification() {
  SystemStateNotification system_state_notification_sent;
  SystemStateNotification system_state_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_state_notification(system_state_notification_sent, 0)
  :: pattern == 1 -> fill_system_state_notification(system_state_notification_sent, 32)
  :: pattern == 2 -> fill_system_state_notification(system_state_notification_sent, 255)
  :: else -> ramp_system_state_notification(system_state_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_state_notification(system_state_notification_sent);
    assert(at == 18);
    at = 0;
    decode_system_state_notification(system_state_notification_got);
    assert(at == 18);
    equal_system_state_notification(system_state_notification_got, system_state_notification_sent)
  }
}

/* Trading Status Notification: encoded, read back, and compared */
proctype check_trading_status_notification() {
  TradingStatusNotification trading_status_notification_sent;
  TradingStatusNotification trading_status_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_notification(trading_status_notification_sent, 0)
  :: pattern == 1 -> fill_trading_status_notification(trading_status_notification_sent, 32)
  :: pattern == 2 -> fill_trading_status_notification(trading_status_notification_sent, 255)
  :: else -> ramp_trading_status_notification(trading_status_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_notification(trading_status_notification_sent);
    assert(at == 21);
    at = 0;
    decode_trading_status_notification(trading_status_notification_got);
    assert(at == 21);
    equal_trading_status_notification(trading_status_notification_got, trading_status_notification_sent)
  }
}

/* Quote Width Relief Notification: encoded, read back, and compared */
proctype check_quote_width_relief_notification() {
  QuoteWidthReliefNotification quote_width_relief_notification_sent;
  QuoteWidthReliefNotification quote_width_relief_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_width_relief_notification(quote_width_relief_notification_sent, 0)
  :: pattern == 1 -> fill_quote_width_relief_notification(quote_width_relief_notification_sent, 32)
  :: pattern == 2 -> fill_quote_width_relief_notification(quote_width_relief_notification_sent, 255)
  :: else -> ramp_quote_width_relief_notification(quote_width_relief_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_width_relief_notification(quote_width_relief_notification_sent);
    assert(at == 23);
    at = 0;
    decode_quote_width_relief_notification(quote_width_relief_notification_got);
    assert(at == 23);
    equal_quote_width_relief_notification(quote_width_relief_notification_got, quote_width_relief_notification_sent)
  }
}

/* Arm Protection Settings Notification: encoded, read back, and compared */
proctype check_arm_protection_settings_notification() {
  ArmProtectionSettingsNotification arm_protection_settings_notification_sent;
  ArmProtectionSettingsNotification arm_protection_settings_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm_protection_settings_notification(arm_protection_settings_notification_sent, 0)
  :: pattern == 1 -> fill_arm_protection_settings_notification(arm_protection_settings_notification_sent, 32)
  :: pattern == 2 -> fill_arm_protection_settings_notification(arm_protection_settings_notification_sent, 255)
  :: else -> ramp_arm_protection_settings_notification(arm_protection_settings_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm_protection_settings_notification(arm_protection_settings_notification_sent);
    assert(at == 31);
    at = 0;
    decode_arm_protection_settings_notification(arm_protection_settings_notification_got);
    assert(at == 31);
    equal_arm_protection_settings_notification(arm_protection_settings_notification_got, arm_protection_settings_notification_sent)
  }
}

/* Cancel Notification: encoded, read back, and compared */
proctype check_cancel_notification() {
  CancelNotification cancel_notification_sent;
  CancelNotification cancel_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_notification(cancel_notification_sent, 0)
  :: pattern == 1 -> fill_cancel_notification(cancel_notification_sent, 32)
  :: pattern == 2 -> fill_cancel_notification(cancel_notification_sent, 255)
  :: else -> ramp_cancel_notification(cancel_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_notification(cancel_notification_sent);
    assert(at == 36);
    at = 0;
    decode_cancel_notification(cancel_notification_got);
    assert(at == 36);
    equal_cancel_notification(cancel_notification_got, cancel_notification_sent)
  }
}

/* Execution Notification: encoded, read back, and compared */
proctype check_execution_notification() {
  ExecutionNotification execution_notification_sent;
  ExecutionNotification execution_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_notification(execution_notification_sent, 0)
  :: pattern == 1 -> fill_execution_notification(execution_notification_sent, 32)
  :: pattern == 2 -> fill_execution_notification(execution_notification_sent, 255)
  :: else -> ramp_execution_notification(execution_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_notification(execution_notification_sent);
    assert(at == 49);
    at = 0;
    decode_execution_notification(execution_notification_got);
    assert(at == 49);
    equal_execution_notification(execution_notification_got, execution_notification_sent)
  }
}

/* Arm Settings Update Request: encoded, read back, and compared */
proctype check_arm_settings_update_request() {
  ArmSettingsUpdateRequest arm_settings_update_request_sent;
  ArmSettingsUpdateRequest arm_settings_update_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm_settings_update_request(arm_settings_update_request_sent, 0)
  :: pattern == 1 -> fill_arm_settings_update_request(arm_settings_update_request_sent, 32)
  :: pattern == 2 -> fill_arm_settings_update_request(arm_settings_update_request_sent, 255)
  :: else -> ramp_arm_settings_update_request(arm_settings_update_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm_settings_update_request(arm_settings_update_request_sent);
    assert(at == 26);
    at = 0;
    decode_arm_settings_update_request(arm_settings_update_request_got);
    assert(at == 26);
    equal_arm_settings_update_request(arm_settings_update_request_got, arm_settings_update_request_sent)
  }
}

/* Arm Settings Update Response: encoded, read back, and compared */
proctype check_arm_settings_update_response() {
  ArmSettingsUpdateResponse arm_settings_update_response_sent;
  ArmSettingsUpdateResponse arm_settings_update_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm_settings_update_response(arm_settings_update_response_sent, 0)
  :: pattern == 1 -> fill_arm_settings_update_response(arm_settings_update_response_sent, 32)
  :: pattern == 2 -> fill_arm_settings_update_response(arm_settings_update_response_sent, 255)
  :: else -> ramp_arm_settings_update_response(arm_settings_update_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm_settings_update_response(arm_settings_update_response_sent);
    assert(at == 20);
    at = 0;
    decode_arm_settings_update_response(arm_settings_update_response_got);
    assert(at == 20);
    equal_arm_settings_update_response(arm_settings_update_response_got, arm_settings_update_response_sent)
  }
}

/* Enhanced Quote E Quote Message: encoded, read back, and compared */
proctype check_enhanced_quote_e_quote_message() {
  EnhancedQuoteEQuoteMessage enhanced_quote_e_quote_message_sent;
  EnhancedQuoteEQuoteMessage enhanced_quote_e_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_sent, 0)
  :: pattern == 1 -> fill_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_sent, 32)
  :: pattern == 2 -> fill_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_sent, 255)
  :: else -> ramp_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_sent);
    assert(at == 31);
    at = 0;
    decode_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_got);
    assert(at == 31);
    equal_enhanced_quote_e_quote_message(enhanced_quote_e_quote_message_got, enhanced_quote_e_quote_message_sent)
  }
}

/* Mass Quote Cancel Request: encoded, read back, and compared */
proctype check_mass_quote_cancel_request() {
  MassQuoteCancelRequest mass_quote_cancel_request_sent;
  MassQuoteCancelRequest mass_quote_cancel_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_quote_cancel_request(mass_quote_cancel_request_sent, 0)
  :: pattern == 1 -> fill_mass_quote_cancel_request(mass_quote_cancel_request_sent, 32)
  :: pattern == 2 -> fill_mass_quote_cancel_request(mass_quote_cancel_request_sent, 255)
  :: else -> ramp_mass_quote_cancel_request(mass_quote_cancel_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_quote_cancel_request(mass_quote_cancel_request_sent);
    assert(at == 19);
    at = 0;
    decode_mass_quote_cancel_request(mass_quote_cancel_request_got);
    assert(at == 19);
    equal_mass_quote_cancel_request(mass_quote_cancel_request_got, mass_quote_cancel_request_sent)
  }
}

/* Mass Quote Cancel Response: encoded, read back, and compared */
proctype check_mass_quote_cancel_response() {
  MassQuoteCancelResponse mass_quote_cancel_response_sent;
  MassQuoteCancelResponse mass_quote_cancel_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_quote_cancel_response(mass_quote_cancel_response_sent, 0)
  :: pattern == 1 -> fill_mass_quote_cancel_response(mass_quote_cancel_response_sent, 32)
  :: pattern == 2 -> fill_mass_quote_cancel_response(mass_quote_cancel_response_sent, 255)
  :: else -> ramp_mass_quote_cancel_response(mass_quote_cancel_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_quote_cancel_response(mass_quote_cancel_response_sent);
    assert(at == 9);
    at = 0;
    decode_mass_quote_cancel_response(mass_quote_cancel_response_got);
    assert(at == 9);
    equal_mass_quote_cancel_response(mass_quote_cancel_response_got, mass_quote_cancel_response_sent)
  }
}

/* Quote Protection Reset Request: encoded, read back, and compared */
proctype check_quote_protection_reset_request() {
  QuoteProtectionResetRequest quote_protection_reset_request_sent;
  QuoteProtectionResetRequest quote_protection_reset_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_protection_reset_request(quote_protection_reset_request_sent, 0)
  :: pattern == 1 -> fill_quote_protection_reset_request(quote_protection_reset_request_sent, 32)
  :: pattern == 2 -> fill_quote_protection_reset_request(quote_protection_reset_request_sent, 255)
  :: else -> ramp_quote_protection_reset_request(quote_protection_reset_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_protection_reset_request(quote_protection_reset_request_sent);
    assert(at == 19);
    at = 0;
    decode_quote_protection_reset_request(quote_protection_reset_request_got);
    assert(at == 19);
    equal_quote_protection_reset_request(quote_protection_reset_request_got, quote_protection_reset_request_sent)
  }
}

/* Quote Protection Reset Response: encoded, read back, and compared */
proctype check_quote_protection_reset_response() {
  QuoteProtectionResetResponse quote_protection_reset_response_sent;
  QuoteProtectionResetResponse quote_protection_reset_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_protection_reset_response(quote_protection_reset_response_sent, 0)
  :: pattern == 1 -> fill_quote_protection_reset_response(quote_protection_reset_response_sent, 32)
  :: pattern == 2 -> fill_quote_protection_reset_response(quote_protection_reset_response_sent, 255)
  :: else -> ramp_quote_protection_reset_response(quote_protection_reset_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_protection_reset_response(quote_protection_reset_response_sent);
    assert(at == 9);
    at = 0;
    decode_quote_protection_reset_response(quote_protection_reset_response_got);
    assert(at == 9);
    equal_quote_protection_reset_response(quote_protection_reset_response_got, quote_protection_reset_response_sent)
  }
}

/* Quote Protection Trigger Notification: encoded, read back, and compared */
proctype check_quote_protection_trigger_notification() {
  QuoteProtectionTriggerNotification quote_protection_trigger_notification_sent;
  QuoteProtectionTriggerNotification quote_protection_trigger_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_protection_trigger_notification(quote_protection_trigger_notification_sent, 0)
  :: pattern == 1 -> fill_quote_protection_trigger_notification(quote_protection_trigger_notification_sent, 32)
  :: pattern == 2 -> fill_quote_protection_trigger_notification(quote_protection_trigger_notification_sent, 255)
  :: else -> ramp_quote_protection_trigger_notification(quote_protection_trigger_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_protection_trigger_notification(quote_protection_trigger_notification_sent);
    assert(at == 24);
    at = 0;
    decode_quote_protection_trigger_notification(quote_protection_trigger_notification_got);
    assert(at == 24);
    equal_quote_protection_trigger_notification(quote_protection_trigger_notification_got, quote_protection_trigger_notification_sent)
  }
}

/* Liquidity Seeking Event Notification: encoded, read back, and compared */
proctype check_liquidity_seeking_event_notification() {
  LiquiditySeekingEventNotification liquidity_seeking_event_notification_sent;
  LiquiditySeekingEventNotification liquidity_seeking_event_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_seeking_event_notification(liquidity_seeking_event_notification_sent, 0)
  :: pattern == 1 -> fill_liquidity_seeking_event_notification(liquidity_seeking_event_notification_sent, 32)
  :: pattern == 2 -> fill_liquidity_seeking_event_notification(liquidity_seeking_event_notification_sent, 255)
  :: else -> ramp_liquidity_seeking_event_notification(liquidity_seeking_event_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_seeking_event_notification(liquidity_seeking_event_notification_sent);
    assert(at == 50);
    at = 0;
    decode_liquidity_seeking_event_notification(liquidity_seeking_event_notification_got);
    assert(at == 50);
    equal_liquidity_seeking_event_notification(liquidity_seeking_event_notification_got, liquidity_seeking_event_notification_sent)
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
    assert(at == 10);
    at = 0;
    decode_login_response(login_response_got);
    assert(at == 10);
    equal_login_response(login_response_got, login_response_sent)
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
  :: run check_series_update()
  :: run check_valid_quote_width_for_opening()
  :: run check_enhanced_quote_e_quote_response()
  :: run check_system_state_notification()
  :: run check_trading_status_notification()
  :: run check_quote_width_relief_notification()
  :: run check_arm_protection_settings_notification()
  :: run check_cancel_notification()
  :: run check_execution_notification()
  :: run check_arm_settings_update_request()
  :: run check_arm_settings_update_response()
  :: run check_enhanced_quote_e_quote_message()
  :: run check_mass_quote_cancel_request()
  :: run check_mass_quote_cancel_response()
  :: run check_quote_protection_reset_request()
  :: run check_quote_protection_reset_response()
  :: run check_quote_protection_trigger_notification()
  :: run check_liquidity_seeking_event_notification()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_retransmission_request()
  fi
}
