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

/* ---- Simple Series Update: 76 bytes ------------------------------------------ */

/* This is the message format that will be used to disseminate all Option series traded on MIAX for the current session on the cloud associated for this connection. */
typedef SimpleSeriesUpdate {
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

int simple_series_update_at;

/* every byte of Simple Series Update set to one value */
inline fill_simple_series_update(simple_series_update_record, simple_series_update_value) {
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.product_add_update_time[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.product_id[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 11 -> simple_series_update_record.underlying_symbol[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 6 -> simple_series_update_record.security_symbol[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.expiration_date[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.strike_price[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_record.call_or_put = simple_series_update_value;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.opening_time[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.closing_time[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_record.restricted_option = simple_series_update_value;
  simple_series_update_record.long_term_option = simple_series_update_value;
  simple_series_update_record.active_on_miax = simple_series_update_value;
  simple_series_update_record.miax_bbo_posting_increment_indicator = simple_series_update_value;
  simple_series_update_record.quote_acceptance_increment_indicator = simple_series_update_value;
  simple_series_update_record.opening_underlying_market_code = simple_series_update_value;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.priority_quote_width[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.reserved_8[simple_series_update_at] = simple_series_update_value; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Series Update set to where it lies, so a field read out of place says so */
inline ramp_simple_series_update(simple_series_update_record, simple_series_update_base) {
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.product_add_update_time[simple_series_update_at] = (simple_series_update_base + 0 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.product_id[simple_series_update_at] = (simple_series_update_base + 8 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 11 -> simple_series_update_record.underlying_symbol[simple_series_update_at] = (simple_series_update_base + 12 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 6 -> simple_series_update_record.security_symbol[simple_series_update_at] = (simple_series_update_base + 23 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.expiration_date[simple_series_update_at] = (simple_series_update_base + 29 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.strike_price[simple_series_update_at] = (simple_series_update_base + 37 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_record.call_or_put = (simple_series_update_base + 41 + 1) % 256;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.opening_time[simple_series_update_at] = (simple_series_update_base + 42 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.closing_time[simple_series_update_at] = (simple_series_update_base + 50 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_record.restricted_option = (simple_series_update_base + 58 + 1) % 256;
  simple_series_update_record.long_term_option = (simple_series_update_base + 59 + 1) % 256;
  simple_series_update_record.active_on_miax = (simple_series_update_base + 60 + 1) % 256;
  simple_series_update_record.miax_bbo_posting_increment_indicator = (simple_series_update_base + 61 + 1) % 256;
  simple_series_update_record.quote_acceptance_increment_indicator = (simple_series_update_base + 62 + 1) % 256;
  simple_series_update_record.opening_underlying_market_code = (simple_series_update_base + 63 + 1) % 256;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.priority_quote_width[simple_series_update_at] = (simple_series_update_base + 64 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.reserved_8[simple_series_update_at] = (simple_series_update_base + 68 + simple_series_update_at + 1) % 256; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Series Update to the wire, 76 bytes from where the cursor stands */
inline encode_simple_series_update(simple_series_update_record) {
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> wire[at] = simple_series_update_record.product_add_update_time[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> wire[at] = simple_series_update_record.product_id[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 11 -> wire[at] = simple_series_update_record.underlying_symbol[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 6 -> wire[at] = simple_series_update_record.security_symbol[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> wire[at] = simple_series_update_record.expiration_date[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> wire[at] = simple_series_update_record.strike_price[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  wire[at] = simple_series_update_record.call_or_put; at = at + 1;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> wire[at] = simple_series_update_record.opening_time[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> wire[at] = simple_series_update_record.closing_time[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  wire[at] = simple_series_update_record.restricted_option; at = at + 1;
  wire[at] = simple_series_update_record.long_term_option; at = at + 1;
  wire[at] = simple_series_update_record.active_on_miax; at = at + 1;
  wire[at] = simple_series_update_record.miax_bbo_posting_increment_indicator; at = at + 1;
  wire[at] = simple_series_update_record.quote_acceptance_increment_indicator; at = at + 1;
  wire[at] = simple_series_update_record.opening_underlying_market_code; at = at + 1;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> wire[at] = simple_series_update_record.priority_quote_width[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> wire[at] = simple_series_update_record.reserved_8[simple_series_update_at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Series Update off the wire, 76 bytes from where the cursor stands */
inline decode_simple_series_update(simple_series_update_record) {
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.product_add_update_time[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.product_id[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 11 -> simple_series_update_record.underlying_symbol[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 6 -> simple_series_update_record.security_symbol[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.expiration_date[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.strike_price[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_record.call_or_put = wire[at]; at = at + 1;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.opening_time[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.closing_time[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_record.restricted_option = wire[at]; at = at + 1;
  simple_series_update_record.long_term_option = wire[at]; at = at + 1;
  simple_series_update_record.active_on_miax = wire[at]; at = at + 1;
  simple_series_update_record.miax_bbo_posting_increment_indicator = wire[at]; at = at + 1;
  simple_series_update_record.quote_acceptance_increment_indicator = wire[at]; at = at + 1;
  simple_series_update_record.opening_underlying_market_code = wire[at]; at = at + 1;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> simple_series_update_record.priority_quote_width[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> simple_series_update_record.reserved_8[simple_series_update_at] = wire[at]; at = at + 1; simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Series Update is what was written, byte for byte */
inline equal_simple_series_update(simple_series_update_read, simple_series_update_written) {
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> assert(simple_series_update_read.product_add_update_time[simple_series_update_at] == simple_series_update_written.product_add_update_time[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> assert(simple_series_update_read.product_id[simple_series_update_at] == simple_series_update_written.product_id[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 11 -> assert(simple_series_update_read.underlying_symbol[simple_series_update_at] == simple_series_update_written.underlying_symbol[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 6 -> assert(simple_series_update_read.security_symbol[simple_series_update_at] == simple_series_update_written.security_symbol[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> assert(simple_series_update_read.expiration_date[simple_series_update_at] == simple_series_update_written.expiration_date[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> assert(simple_series_update_read.strike_price[simple_series_update_at] == simple_series_update_written.strike_price[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  assert(simple_series_update_read.call_or_put == simple_series_update_written.call_or_put);
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> assert(simple_series_update_read.opening_time[simple_series_update_at] == simple_series_update_written.opening_time[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> assert(simple_series_update_read.closing_time[simple_series_update_at] == simple_series_update_written.closing_time[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  assert(simple_series_update_read.restricted_option == simple_series_update_written.restricted_option);
  assert(simple_series_update_read.long_term_option == simple_series_update_written.long_term_option);
  assert(simple_series_update_read.active_on_miax == simple_series_update_written.active_on_miax);
  assert(simple_series_update_read.miax_bbo_posting_increment_indicator == simple_series_update_written.miax_bbo_posting_increment_indicator);
  assert(simple_series_update_read.quote_acceptance_increment_indicator == simple_series_update_written.quote_acceptance_increment_indicator);
  assert(simple_series_update_read.opening_underlying_market_code == simple_series_update_written.opening_underlying_market_code);
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 4 -> assert(simple_series_update_read.priority_quote_width[simple_series_update_at] == simple_series_update_written.priority_quote_width[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  simple_series_update_at = 0;
  do
  :: simple_series_update_at < 8 -> assert(simple_series_update_read.reserved_8[simple_series_update_at] == simple_series_update_written.reserved_8[simple_series_update_at]); simple_series_update_at = simple_series_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Valid Quote Width For Opening: 21 bytes --------------------------------- */

/* This message format will be used to convey to the firms the Valid Quote Width settings applicable to the Opening process of MIAX Options market. Each message describes a row of the Valid Quote Width table with a low end of the applicable price range and corresponding maximum quote width. The high end of the applicable price range is up to, but not including the next row’s low end applicable price range if provided or infinity for the last row. If the table has to be reloaded, all rows will be resent. Refer to Appendix B for an example. */
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

/* ---- Valid Quote Width For Free Trading: 37 bytes ---------------------------- */

/* This message format will be used to convey to the firms the Valid Quote Width settings applicable for Free Trading. Each message describes a row of the Free Trading Valid Quote Width table with a low end of the applicable price range and corresponding maximum quote width. The high end of the applicable price range is up to, but not including the next row’s low end applicable price range if provided or infinity for the last row. If the table has to be reloaded, all rows will be resent. Refer to Appendix B for an example. */
typedef ValidQuoteWidthForFreeTrading {
  byte notification_time[8];
  byte mpv_class;
  byte low_end_of_applicable_range[4];
  byte maximum_quote_width[4];
  byte long_term_option_multiplier[4];
  byte reserved_16[16]
};

int valid_quote_width_for_free_trading_at;

/* every byte of Valid Quote Width For Free Trading set to one value */
inline fill_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_record, valid_quote_width_for_free_trading_value) {
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 8 -> valid_quote_width_for_free_trading_record.notification_time[valid_quote_width_for_free_trading_at] = valid_quote_width_for_free_trading_value; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_record.mpv_class = valid_quote_width_for_free_trading_value;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.low_end_of_applicable_range[valid_quote_width_for_free_trading_at] = valid_quote_width_for_free_trading_value; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.maximum_quote_width[valid_quote_width_for_free_trading_at] = valid_quote_width_for_free_trading_value; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.long_term_option_multiplier[valid_quote_width_for_free_trading_at] = valid_quote_width_for_free_trading_value; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 16 -> valid_quote_width_for_free_trading_record.reserved_16[valid_quote_width_for_free_trading_at] = valid_quote_width_for_free_trading_value; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Valid Quote Width For Free Trading set to where it lies, so a field read out of place says so */
inline ramp_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_record, valid_quote_width_for_free_trading_base) {
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 8 -> valid_quote_width_for_free_trading_record.notification_time[valid_quote_width_for_free_trading_at] = (valid_quote_width_for_free_trading_base + 0 + valid_quote_width_for_free_trading_at + 1) % 256; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_record.mpv_class = (valid_quote_width_for_free_trading_base + 8 + 1) % 256;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.low_end_of_applicable_range[valid_quote_width_for_free_trading_at] = (valid_quote_width_for_free_trading_base + 9 + valid_quote_width_for_free_trading_at + 1) % 256; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.maximum_quote_width[valid_quote_width_for_free_trading_at] = (valid_quote_width_for_free_trading_base + 13 + valid_quote_width_for_free_trading_at + 1) % 256; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.long_term_option_multiplier[valid_quote_width_for_free_trading_at] = (valid_quote_width_for_free_trading_base + 17 + valid_quote_width_for_free_trading_at + 1) % 256; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 16 -> valid_quote_width_for_free_trading_record.reserved_16[valid_quote_width_for_free_trading_at] = (valid_quote_width_for_free_trading_base + 21 + valid_quote_width_for_free_trading_at + 1) % 256; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  skip
}

/* Valid Quote Width For Free Trading to the wire, 37 bytes from where the cursor stands */
inline encode_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_record) {
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 8 -> wire[at] = valid_quote_width_for_free_trading_record.notification_time[valid_quote_width_for_free_trading_at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  wire[at] = valid_quote_width_for_free_trading_record.mpv_class; at = at + 1;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> wire[at] = valid_quote_width_for_free_trading_record.low_end_of_applicable_range[valid_quote_width_for_free_trading_at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> wire[at] = valid_quote_width_for_free_trading_record.maximum_quote_width[valid_quote_width_for_free_trading_at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> wire[at] = valid_quote_width_for_free_trading_record.long_term_option_multiplier[valid_quote_width_for_free_trading_at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 16 -> wire[at] = valid_quote_width_for_free_trading_record.reserved_16[valid_quote_width_for_free_trading_at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  skip
}

/* Valid Quote Width For Free Trading off the wire, 37 bytes from where the cursor stands */
inline decode_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_record) {
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 8 -> valid_quote_width_for_free_trading_record.notification_time[valid_quote_width_for_free_trading_at] = wire[at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_record.mpv_class = wire[at]; at = at + 1;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.low_end_of_applicable_range[valid_quote_width_for_free_trading_at] = wire[at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.maximum_quote_width[valid_quote_width_for_free_trading_at] = wire[at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> valid_quote_width_for_free_trading_record.long_term_option_multiplier[valid_quote_width_for_free_trading_at] = wire[at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 16 -> valid_quote_width_for_free_trading_record.reserved_16[valid_quote_width_for_free_trading_at] = wire[at]; at = at + 1; valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Valid Quote Width For Free Trading is what was written, byte for byte */
inline equal_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_read, valid_quote_width_for_free_trading_written) {
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 8 -> assert(valid_quote_width_for_free_trading_read.notification_time[valid_quote_width_for_free_trading_at] == valid_quote_width_for_free_trading_written.notification_time[valid_quote_width_for_free_trading_at]); valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  assert(valid_quote_width_for_free_trading_read.mpv_class == valid_quote_width_for_free_trading_written.mpv_class);
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> assert(valid_quote_width_for_free_trading_read.low_end_of_applicable_range[valid_quote_width_for_free_trading_at] == valid_quote_width_for_free_trading_written.low_end_of_applicable_range[valid_quote_width_for_free_trading_at]); valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> assert(valid_quote_width_for_free_trading_read.maximum_quote_width[valid_quote_width_for_free_trading_at] == valid_quote_width_for_free_trading_written.maximum_quote_width[valid_quote_width_for_free_trading_at]); valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 4 -> assert(valid_quote_width_for_free_trading_read.long_term_option_multiplier[valid_quote_width_for_free_trading_at] == valid_quote_width_for_free_trading_written.long_term_option_multiplier[valid_quote_width_for_free_trading_at]); valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  valid_quote_width_for_free_trading_at = 0;
  do
  :: valid_quote_width_for_free_trading_at < 16 -> assert(valid_quote_width_for_free_trading_read.reserved_16[valid_quote_width_for_free_trading_at] == valid_quote_width_for_free_trading_written.reserved_16[valid_quote_width_for_free_trading_at]); valid_quote_width_for_free_trading_at = valid_quote_width_for_free_trading_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Enhanced Quote E Quote Response: 17 bytes ------------------------ */

/* This message indicates if the eQuote was accepted or rejected. Note that this message does not report executions. For executions, please refer to the Execution notification. For the unexecuted part that gets canceled, please refer to the Cancel notification. */
typedef SimpleEnhancedQuoteEQuoteResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte e_quote_id[8];
  byte e_quote_request_status
};

int simple_enhanced_quote_e_quote_response_at;

/* every byte of Simple Enhanced Quote E Quote Response set to one value */
inline fill_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_record, simple_enhanced_quote_e_quote_response_value) {
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> simple_enhanced_quote_e_quote_response_record.client_message_id[simple_enhanced_quote_e_quote_response_at] = simple_enhanced_quote_e_quote_response_value; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> simple_enhanced_quote_e_quote_response_record.mpid[simple_enhanced_quote_e_quote_response_at] = simple_enhanced_quote_e_quote_response_value; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 8 -> simple_enhanced_quote_e_quote_response_record.e_quote_id[simple_enhanced_quote_e_quote_response_at] = simple_enhanced_quote_e_quote_response_value; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_record.e_quote_request_status = simple_enhanced_quote_e_quote_response_value;
  skip
}

/* each byte of Simple Enhanced Quote E Quote Response set to where it lies, so a field read out of place says so */
inline ramp_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_record, simple_enhanced_quote_e_quote_response_base) {
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> simple_enhanced_quote_e_quote_response_record.client_message_id[simple_enhanced_quote_e_quote_response_at] = (simple_enhanced_quote_e_quote_response_base + 0 + simple_enhanced_quote_e_quote_response_at + 1) % 256; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> simple_enhanced_quote_e_quote_response_record.mpid[simple_enhanced_quote_e_quote_response_at] = (simple_enhanced_quote_e_quote_response_base + 4 + simple_enhanced_quote_e_quote_response_at + 1) % 256; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 8 -> simple_enhanced_quote_e_quote_response_record.e_quote_id[simple_enhanced_quote_e_quote_response_at] = (simple_enhanced_quote_e_quote_response_base + 8 + simple_enhanced_quote_e_quote_response_at + 1) % 256; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_record.e_quote_request_status = (simple_enhanced_quote_e_quote_response_base + 16 + 1) % 256;
  skip
}

/* Simple Enhanced Quote E Quote Response to the wire, 17 bytes from where the cursor stands */
inline encode_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_record) {
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_response_record.client_message_id[simple_enhanced_quote_e_quote_response_at]; at = at + 1; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_response_record.mpid[simple_enhanced_quote_e_quote_response_at]; at = at + 1; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 8 -> wire[at] = simple_enhanced_quote_e_quote_response_record.e_quote_id[simple_enhanced_quote_e_quote_response_at]; at = at + 1; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  wire[at] = simple_enhanced_quote_e_quote_response_record.e_quote_request_status; at = at + 1;
  skip
}

/* Simple Enhanced Quote E Quote Response off the wire, 17 bytes from where the cursor stands */
inline decode_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_record) {
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> simple_enhanced_quote_e_quote_response_record.client_message_id[simple_enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> simple_enhanced_quote_e_quote_response_record.mpid[simple_enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 8 -> simple_enhanced_quote_e_quote_response_record.e_quote_id[simple_enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_record.e_quote_request_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Enhanced Quote E Quote Response is what was written, byte for byte */
inline equal_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_read, simple_enhanced_quote_e_quote_response_written) {
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> assert(simple_enhanced_quote_e_quote_response_read.client_message_id[simple_enhanced_quote_e_quote_response_at] == simple_enhanced_quote_e_quote_response_written.client_message_id[simple_enhanced_quote_e_quote_response_at]); simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 4 -> assert(simple_enhanced_quote_e_quote_response_read.mpid[simple_enhanced_quote_e_quote_response_at] == simple_enhanced_quote_e_quote_response_written.mpid[simple_enhanced_quote_e_quote_response_at]); simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_response_at = 0;
  do
  :: simple_enhanced_quote_e_quote_response_at < 8 -> assert(simple_enhanced_quote_e_quote_response_read.e_quote_id[simple_enhanced_quote_e_quote_response_at] == simple_enhanced_quote_e_quote_response_written.e_quote_id[simple_enhanced_quote_e_quote_response_at]); simple_enhanced_quote_e_quote_response_at = simple_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  assert(simple_enhanced_quote_e_quote_response_read.e_quote_request_status == simple_enhanced_quote_e_quote_response_written.e_quote_request_status);
  skip
}

/* ---- Complex Enhanced Quote E Quote Response: 17 bytes ----------------------- */

/* This message indicates if the complex eQuote was accepted or rejected. Note that this message does not report executions. For executions, please refer to the Execution notification. For the handling of any unexecuted portion that was canceled, please refer to the Cancel notification. */
typedef ComplexEnhancedQuoteEQuoteResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte e_quote_id[8];
  byte e_quote_request_status
};

int complex_enhanced_quote_e_quote_response_at;

/* every byte of Complex Enhanced Quote E Quote Response set to one value */
inline fill_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_record, complex_enhanced_quote_e_quote_response_value) {
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> complex_enhanced_quote_e_quote_response_record.client_message_id[complex_enhanced_quote_e_quote_response_at] = complex_enhanced_quote_e_quote_response_value; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> complex_enhanced_quote_e_quote_response_record.mpid[complex_enhanced_quote_e_quote_response_at] = complex_enhanced_quote_e_quote_response_value; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 8 -> complex_enhanced_quote_e_quote_response_record.e_quote_id[complex_enhanced_quote_e_quote_response_at] = complex_enhanced_quote_e_quote_response_value; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_record.e_quote_request_status = complex_enhanced_quote_e_quote_response_value;
  skip
}

/* each byte of Complex Enhanced Quote E Quote Response set to where it lies, so a field read out of place says so */
inline ramp_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_record, complex_enhanced_quote_e_quote_response_base) {
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> complex_enhanced_quote_e_quote_response_record.client_message_id[complex_enhanced_quote_e_quote_response_at] = (complex_enhanced_quote_e_quote_response_base + 0 + complex_enhanced_quote_e_quote_response_at + 1) % 256; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> complex_enhanced_quote_e_quote_response_record.mpid[complex_enhanced_quote_e_quote_response_at] = (complex_enhanced_quote_e_quote_response_base + 4 + complex_enhanced_quote_e_quote_response_at + 1) % 256; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 8 -> complex_enhanced_quote_e_quote_response_record.e_quote_id[complex_enhanced_quote_e_quote_response_at] = (complex_enhanced_quote_e_quote_response_base + 8 + complex_enhanced_quote_e_quote_response_at + 1) % 256; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_record.e_quote_request_status = (complex_enhanced_quote_e_quote_response_base + 16 + 1) % 256;
  skip
}

/* Complex Enhanced Quote E Quote Response to the wire, 17 bytes from where the cursor stands */
inline encode_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_record) {
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_response_record.client_message_id[complex_enhanced_quote_e_quote_response_at]; at = at + 1; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_response_record.mpid[complex_enhanced_quote_e_quote_response_at]; at = at + 1; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 8 -> wire[at] = complex_enhanced_quote_e_quote_response_record.e_quote_id[complex_enhanced_quote_e_quote_response_at]; at = at + 1; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  wire[at] = complex_enhanced_quote_e_quote_response_record.e_quote_request_status; at = at + 1;
  skip
}

/* Complex Enhanced Quote E Quote Response off the wire, 17 bytes from where the cursor stands */
inline decode_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_record) {
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> complex_enhanced_quote_e_quote_response_record.client_message_id[complex_enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> complex_enhanced_quote_e_quote_response_record.mpid[complex_enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 8 -> complex_enhanced_quote_e_quote_response_record.e_quote_id[complex_enhanced_quote_e_quote_response_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_record.e_quote_request_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Enhanced Quote E Quote Response is what was written, byte for byte */
inline equal_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_read, complex_enhanced_quote_e_quote_response_written) {
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> assert(complex_enhanced_quote_e_quote_response_read.client_message_id[complex_enhanced_quote_e_quote_response_at] == complex_enhanced_quote_e_quote_response_written.client_message_id[complex_enhanced_quote_e_quote_response_at]); complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 4 -> assert(complex_enhanced_quote_e_quote_response_read.mpid[complex_enhanced_quote_e_quote_response_at] == complex_enhanced_quote_e_quote_response_written.mpid[complex_enhanced_quote_e_quote_response_at]); complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_response_at = 0;
  do
  :: complex_enhanced_quote_e_quote_response_at < 8 -> assert(complex_enhanced_quote_e_quote_response_read.e_quote_id[complex_enhanced_quote_e_quote_response_at] == complex_enhanced_quote_e_quote_response_written.e_quote_id[complex_enhanced_quote_e_quote_response_at]); complex_enhanced_quote_e_quote_response_at = complex_enhanced_quote_e_quote_response_at + 1
  :: else -> break
  od;
  assert(complex_enhanced_quote_e_quote_response_read.e_quote_request_status == complex_enhanced_quote_e_quote_response_written.e_quote_request_status);
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

/* ---- Product Trading Status Notification: 21 bytes --------------------------- */

/* This message format will be used to notify the firms of changes to the trading status of an option. */
typedef ProductTradingStatusNotification {
  byte notification_time[8];
  byte product_id[4];
  byte trading_status;
  byte expected_event_time[8]
};

int product_trading_status_notification_at;

/* every byte of Product Trading Status Notification set to one value */
inline fill_product_trading_status_notification(product_trading_status_notification_record, product_trading_status_notification_value) {
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> product_trading_status_notification_record.notification_time[product_trading_status_notification_at] = product_trading_status_notification_value; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 4 -> product_trading_status_notification_record.product_id[product_trading_status_notification_at] = product_trading_status_notification_value; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_record.trading_status = product_trading_status_notification_value;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> product_trading_status_notification_record.expected_event_time[product_trading_status_notification_at] = product_trading_status_notification_value; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Product Trading Status Notification set to where it lies, so a field read out of place says so */
inline ramp_product_trading_status_notification(product_trading_status_notification_record, product_trading_status_notification_base) {
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> product_trading_status_notification_record.notification_time[product_trading_status_notification_at] = (product_trading_status_notification_base + 0 + product_trading_status_notification_at + 1) % 256; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 4 -> product_trading_status_notification_record.product_id[product_trading_status_notification_at] = (product_trading_status_notification_base + 8 + product_trading_status_notification_at + 1) % 256; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_record.trading_status = (product_trading_status_notification_base + 12 + 1) % 256;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> product_trading_status_notification_record.expected_event_time[product_trading_status_notification_at] = (product_trading_status_notification_base + 13 + product_trading_status_notification_at + 1) % 256; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Product Trading Status Notification to the wire, 21 bytes from where the cursor stands */
inline encode_product_trading_status_notification(product_trading_status_notification_record) {
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> wire[at] = product_trading_status_notification_record.notification_time[product_trading_status_notification_at]; at = at + 1; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 4 -> wire[at] = product_trading_status_notification_record.product_id[product_trading_status_notification_at]; at = at + 1; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  wire[at] = product_trading_status_notification_record.trading_status; at = at + 1;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> wire[at] = product_trading_status_notification_record.expected_event_time[product_trading_status_notification_at]; at = at + 1; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Product Trading Status Notification off the wire, 21 bytes from where the cursor stands */
inline decode_product_trading_status_notification(product_trading_status_notification_record) {
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> product_trading_status_notification_record.notification_time[product_trading_status_notification_at] = wire[at]; at = at + 1; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 4 -> product_trading_status_notification_record.product_id[product_trading_status_notification_at] = wire[at]; at = at + 1; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_record.trading_status = wire[at]; at = at + 1;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> product_trading_status_notification_record.expected_event_time[product_trading_status_notification_at] = wire[at]; at = at + 1; product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Product Trading Status Notification is what was written, byte for byte */
inline equal_product_trading_status_notification(product_trading_status_notification_read, product_trading_status_notification_written) {
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> assert(product_trading_status_notification_read.notification_time[product_trading_status_notification_at] == product_trading_status_notification_written.notification_time[product_trading_status_notification_at]); product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 4 -> assert(product_trading_status_notification_read.product_id[product_trading_status_notification_at] == product_trading_status_notification_written.product_id[product_trading_status_notification_at]); product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  assert(product_trading_status_notification_read.trading_status == product_trading_status_notification_written.trading_status);
  product_trading_status_notification_at = 0;
  do
  :: product_trading_status_notification_at < 8 -> assert(product_trading_status_notification_read.expected_event_time[product_trading_status_notification_at] == product_trading_status_notification_written.expected_event_time[product_trading_status_notification_at]); product_trading_status_notification_at = product_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Trading Status Notification: 29 bytes ------------------------ */

/* This message format will be used to notify the firms of changes to the trading status of all the options of an underlying. */
typedef UnderlyingTradingStatusNotification {
  byte notification_time[8];
  byte underlying_symbol[11];
  byte trading_status;
  byte event_reason;
  byte expected_event_time[8]
};

int underlying_trading_status_notification_at;

/* every byte of Underlying Trading Status Notification set to one value */
inline fill_underlying_trading_status_notification(underlying_trading_status_notification_record, underlying_trading_status_notification_value) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 8 -> underlying_trading_status_notification_record.notification_time[underlying_trading_status_notification_at] = underlying_trading_status_notification_value; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
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
  :: underlying_trading_status_notification_at < 8 -> underlying_trading_status_notification_record.expected_event_time[underlying_trading_status_notification_at] = underlying_trading_status_notification_value; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Trading Status Notification set to where it lies, so a field read out of place says so */
inline ramp_underlying_trading_status_notification(underlying_trading_status_notification_record, underlying_trading_status_notification_base) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 8 -> underlying_trading_status_notification_record.notification_time[underlying_trading_status_notification_at] = (underlying_trading_status_notification_base + 0 + underlying_trading_status_notification_at + 1) % 256; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 11 -> underlying_trading_status_notification_record.underlying_symbol[underlying_trading_status_notification_at] = (underlying_trading_status_notification_base + 8 + underlying_trading_status_notification_at + 1) % 256; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  underlying_trading_status_notification_record.trading_status = (underlying_trading_status_notification_base + 19 + 1) % 256;
  underlying_trading_status_notification_record.event_reason = (underlying_trading_status_notification_base + 20 + 1) % 256;
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 8 -> underlying_trading_status_notification_record.expected_event_time[underlying_trading_status_notification_at] = (underlying_trading_status_notification_base + 21 + underlying_trading_status_notification_at + 1) % 256; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Notification to the wire, 29 bytes from where the cursor stands */
inline encode_underlying_trading_status_notification(underlying_trading_status_notification_record) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 8 -> wire[at] = underlying_trading_status_notification_record.notification_time[underlying_trading_status_notification_at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
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
  :: underlying_trading_status_notification_at < 8 -> wire[at] = underlying_trading_status_notification_record.expected_event_time[underlying_trading_status_notification_at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Trading Status Notification off the wire, 29 bytes from where the cursor stands */
inline decode_underlying_trading_status_notification(underlying_trading_status_notification_record) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 8 -> underlying_trading_status_notification_record.notification_time[underlying_trading_status_notification_at] = wire[at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
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
  :: underlying_trading_status_notification_at < 8 -> underlying_trading_status_notification_record.expected_event_time[underlying_trading_status_notification_at] = wire[at]; at = at + 1; underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Trading Status Notification is what was written, byte for byte */
inline equal_underlying_trading_status_notification(underlying_trading_status_notification_read, underlying_trading_status_notification_written) {
  underlying_trading_status_notification_at = 0;
  do
  :: underlying_trading_status_notification_at < 8 -> assert(underlying_trading_status_notification_read.notification_time[underlying_trading_status_notification_at] == underlying_trading_status_notification_written.notification_time[underlying_trading_status_notification_at]); underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
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
  :: underlying_trading_status_notification_at < 8 -> assert(underlying_trading_status_notification_read.expected_event_time[underlying_trading_status_notification_at] == underlying_trading_status_notification_written.expected_event_time[underlying_trading_status_notification_at]); underlying_trading_status_notification_at = underlying_trading_status_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Opening Quote Width Relief Notification: 23 bytes ----------------------- */

/* This message format will be used to notify the firms if and when MIAX grants relief to the valid quote width parameters for Opening as specified in the rules and regulatory circulars of MIAX Options market. */
typedef OpeningQuoteWidthReliefNotification {
  byte notification_time[8];
  byte underlying_symbol[11];
  byte relief_multiplier[4]
};

int opening_quote_width_relief_notification_at;

/* every byte of Opening Quote Width Relief Notification set to one value */
inline fill_opening_quote_width_relief_notification(opening_quote_width_relief_notification_record, opening_quote_width_relief_notification_value) {
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 8 -> opening_quote_width_relief_notification_record.notification_time[opening_quote_width_relief_notification_at] = opening_quote_width_relief_notification_value; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 11 -> opening_quote_width_relief_notification_record.underlying_symbol[opening_quote_width_relief_notification_at] = opening_quote_width_relief_notification_value; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 4 -> opening_quote_width_relief_notification_record.relief_multiplier[opening_quote_width_relief_notification_at] = opening_quote_width_relief_notification_value; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Quote Width Relief Notification set to where it lies, so a field read out of place says so */
inline ramp_opening_quote_width_relief_notification(opening_quote_width_relief_notification_record, opening_quote_width_relief_notification_base) {
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 8 -> opening_quote_width_relief_notification_record.notification_time[opening_quote_width_relief_notification_at] = (opening_quote_width_relief_notification_base + 0 + opening_quote_width_relief_notification_at + 1) % 256; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 11 -> opening_quote_width_relief_notification_record.underlying_symbol[opening_quote_width_relief_notification_at] = (opening_quote_width_relief_notification_base + 8 + opening_quote_width_relief_notification_at + 1) % 256; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 4 -> opening_quote_width_relief_notification_record.relief_multiplier[opening_quote_width_relief_notification_at] = (opening_quote_width_relief_notification_base + 19 + opening_quote_width_relief_notification_at + 1) % 256; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Quote Width Relief Notification to the wire, 23 bytes from where the cursor stands */
inline encode_opening_quote_width_relief_notification(opening_quote_width_relief_notification_record) {
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 8 -> wire[at] = opening_quote_width_relief_notification_record.notification_time[opening_quote_width_relief_notification_at]; at = at + 1; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 11 -> wire[at] = opening_quote_width_relief_notification_record.underlying_symbol[opening_quote_width_relief_notification_at]; at = at + 1; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 4 -> wire[at] = opening_quote_width_relief_notification_record.relief_multiplier[opening_quote_width_relief_notification_at]; at = at + 1; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Quote Width Relief Notification off the wire, 23 bytes from where the cursor stands */
inline decode_opening_quote_width_relief_notification(opening_quote_width_relief_notification_record) {
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 8 -> opening_quote_width_relief_notification_record.notification_time[opening_quote_width_relief_notification_at] = wire[at]; at = at + 1; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 11 -> opening_quote_width_relief_notification_record.underlying_symbol[opening_quote_width_relief_notification_at] = wire[at]; at = at + 1; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 4 -> opening_quote_width_relief_notification_record.relief_multiplier[opening_quote_width_relief_notification_at] = wire[at]; at = at + 1; opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Quote Width Relief Notification is what was written, byte for byte */
inline equal_opening_quote_width_relief_notification(opening_quote_width_relief_notification_read, opening_quote_width_relief_notification_written) {
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 8 -> assert(opening_quote_width_relief_notification_read.notification_time[opening_quote_width_relief_notification_at] == opening_quote_width_relief_notification_written.notification_time[opening_quote_width_relief_notification_at]); opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 11 -> assert(opening_quote_width_relief_notification_read.underlying_symbol[opening_quote_width_relief_notification_at] == opening_quote_width_relief_notification_written.underlying_symbol[opening_quote_width_relief_notification_at]); opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_quote_width_relief_notification_at = 0;
  do
  :: opening_quote_width_relief_notification_at < 4 -> assert(opening_quote_width_relief_notification_read.relief_multiplier[opening_quote_width_relief_notification_at] == opening_quote_width_relief_notification_written.relief_multiplier[opening_quote_width_relief_notification_at]); opening_quote_width_relief_notification_at = opening_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Free Trading Quote Width Relief Notification: 39 bytes ------------------ */

/* This message format will be used to notify the firms if and when MIAX grants relief to the valid quote width parameters for Free Trading as specified in the rules and regulatory circulars of MIAX Options market. */
typedef FreeTradingQuoteWidthReliefNotification {
  byte notification_time[8];
  byte underlying_symbol[11];
  byte relief_multiplier[4];
  byte reserved_16[16]
};

int free_trading_quote_width_relief_notification_at;

/* every byte of Free Trading Quote Width Relief Notification set to one value */
inline fill_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_record, free_trading_quote_width_relief_notification_value) {
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 8 -> free_trading_quote_width_relief_notification_record.notification_time[free_trading_quote_width_relief_notification_at] = free_trading_quote_width_relief_notification_value; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 11 -> free_trading_quote_width_relief_notification_record.underlying_symbol[free_trading_quote_width_relief_notification_at] = free_trading_quote_width_relief_notification_value; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 4 -> free_trading_quote_width_relief_notification_record.relief_multiplier[free_trading_quote_width_relief_notification_at] = free_trading_quote_width_relief_notification_value; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 16 -> free_trading_quote_width_relief_notification_record.reserved_16[free_trading_quote_width_relief_notification_at] = free_trading_quote_width_relief_notification_value; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Free Trading Quote Width Relief Notification set to where it lies, so a field read out of place says so */
inline ramp_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_record, free_trading_quote_width_relief_notification_base) {
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 8 -> free_trading_quote_width_relief_notification_record.notification_time[free_trading_quote_width_relief_notification_at] = (free_trading_quote_width_relief_notification_base + 0 + free_trading_quote_width_relief_notification_at + 1) % 256; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 11 -> free_trading_quote_width_relief_notification_record.underlying_symbol[free_trading_quote_width_relief_notification_at] = (free_trading_quote_width_relief_notification_base + 8 + free_trading_quote_width_relief_notification_at + 1) % 256; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 4 -> free_trading_quote_width_relief_notification_record.relief_multiplier[free_trading_quote_width_relief_notification_at] = (free_trading_quote_width_relief_notification_base + 19 + free_trading_quote_width_relief_notification_at + 1) % 256; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 16 -> free_trading_quote_width_relief_notification_record.reserved_16[free_trading_quote_width_relief_notification_at] = (free_trading_quote_width_relief_notification_base + 23 + free_trading_quote_width_relief_notification_at + 1) % 256; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Free Trading Quote Width Relief Notification to the wire, 39 bytes from where the cursor stands */
inline encode_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_record) {
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 8 -> wire[at] = free_trading_quote_width_relief_notification_record.notification_time[free_trading_quote_width_relief_notification_at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 11 -> wire[at] = free_trading_quote_width_relief_notification_record.underlying_symbol[free_trading_quote_width_relief_notification_at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 4 -> wire[at] = free_trading_quote_width_relief_notification_record.relief_multiplier[free_trading_quote_width_relief_notification_at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 16 -> wire[at] = free_trading_quote_width_relief_notification_record.reserved_16[free_trading_quote_width_relief_notification_at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Free Trading Quote Width Relief Notification off the wire, 39 bytes from where the cursor stands */
inline decode_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_record) {
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 8 -> free_trading_quote_width_relief_notification_record.notification_time[free_trading_quote_width_relief_notification_at] = wire[at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 11 -> free_trading_quote_width_relief_notification_record.underlying_symbol[free_trading_quote_width_relief_notification_at] = wire[at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 4 -> free_trading_quote_width_relief_notification_record.relief_multiplier[free_trading_quote_width_relief_notification_at] = wire[at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 16 -> free_trading_quote_width_relief_notification_record.reserved_16[free_trading_quote_width_relief_notification_at] = wire[at]; at = at + 1; free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Free Trading Quote Width Relief Notification is what was written, byte for byte */
inline equal_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_read, free_trading_quote_width_relief_notification_written) {
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 8 -> assert(free_trading_quote_width_relief_notification_read.notification_time[free_trading_quote_width_relief_notification_at] == free_trading_quote_width_relief_notification_written.notification_time[free_trading_quote_width_relief_notification_at]); free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 11 -> assert(free_trading_quote_width_relief_notification_read.underlying_symbol[free_trading_quote_width_relief_notification_at] == free_trading_quote_width_relief_notification_written.underlying_symbol[free_trading_quote_width_relief_notification_at]); free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 4 -> assert(free_trading_quote_width_relief_notification_read.relief_multiplier[free_trading_quote_width_relief_notification_at] == free_trading_quote_width_relief_notification_written.relief_multiplier[free_trading_quote_width_relief_notification_at]); free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  free_trading_quote_width_relief_notification_at = 0;
  do
  :: free_trading_quote_width_relief_notification_at < 16 -> assert(free_trading_quote_width_relief_notification_read.reserved_16[free_trading_quote_width_relief_notification_at] == free_trading_quote_width_relief_notification_written.reserved_16[free_trading_quote_width_relief_notification_at]); free_trading_quote_width_relief_notification_at = free_trading_quote_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Arm Protection Settings Notification: 59 bytes ------------------- */

/* This message format will be used to notify firms of their ARM settings. All the ARM settings will be published upon system initialization and each subsequent change will also be published. */
typedef SimpleArmProtectionSettingsNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte allowable_engagement_percentage[4];
  byte counting_period_binary_u_2[2];
  byte action;
  byte source;
  byte market_maker_origin_multiplier[2];
  byte away_market_maker_origin_multiplier[2];
  byte broker_dealer_origin_multiplier[2];
  byte firm_origin_multiplier[2];
  byte priority_customer_origin_multiplier[2];
  byte non_priority_customer_origin_multiplier[2];
  byte reserved_16[16]
};

int simple_arm_protection_settings_notification_at;

/* every byte of Simple Arm Protection Settings Notification set to one value */
inline fill_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_record, simple_arm_protection_settings_notification_value) {
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 8 -> simple_arm_protection_settings_notification_record.notification_time[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> simple_arm_protection_settings_notification_record.mpid[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 11 -> simple_arm_protection_settings_notification_record.underlying_symbol[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> simple_arm_protection_settings_notification_record.allowable_engagement_percentage[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.counting_period_binary_u_2[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_record.action = simple_arm_protection_settings_notification_value;
  simple_arm_protection_settings_notification_record.source = simple_arm_protection_settings_notification_value;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.away_market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.broker_dealer_origin_multiplier[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.firm_origin_multiplier[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.non_priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 16 -> simple_arm_protection_settings_notification_record.reserved_16[simple_arm_protection_settings_notification_at] = simple_arm_protection_settings_notification_value; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Arm Protection Settings Notification set to where it lies, so a field read out of place says so */
inline ramp_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_record, simple_arm_protection_settings_notification_base) {
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 8 -> simple_arm_protection_settings_notification_record.notification_time[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 0 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> simple_arm_protection_settings_notification_record.mpid[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 8 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 11 -> simple_arm_protection_settings_notification_record.underlying_symbol[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 12 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> simple_arm_protection_settings_notification_record.allowable_engagement_percentage[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 23 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.counting_period_binary_u_2[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 27 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_record.action = (simple_arm_protection_settings_notification_base + 29 + 1) % 256;
  simple_arm_protection_settings_notification_record.source = (simple_arm_protection_settings_notification_base + 30 + 1) % 256;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 31 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.away_market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 33 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.broker_dealer_origin_multiplier[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 35 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.firm_origin_multiplier[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 37 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 39 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.non_priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 41 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 16 -> simple_arm_protection_settings_notification_record.reserved_16[simple_arm_protection_settings_notification_at] = (simple_arm_protection_settings_notification_base + 43 + simple_arm_protection_settings_notification_at + 1) % 256; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Arm Protection Settings Notification to the wire, 59 bytes from where the cursor stands */
inline encode_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_record) {
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 8 -> wire[at] = simple_arm_protection_settings_notification_record.notification_time[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> wire[at] = simple_arm_protection_settings_notification_record.mpid[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 11 -> wire[at] = simple_arm_protection_settings_notification_record.underlying_symbol[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> wire[at] = simple_arm_protection_settings_notification_record.allowable_engagement_percentage[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> wire[at] = simple_arm_protection_settings_notification_record.counting_period_binary_u_2[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  wire[at] = simple_arm_protection_settings_notification_record.action; at = at + 1;
  wire[at] = simple_arm_protection_settings_notification_record.source; at = at + 1;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> wire[at] = simple_arm_protection_settings_notification_record.market_maker_origin_multiplier[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> wire[at] = simple_arm_protection_settings_notification_record.away_market_maker_origin_multiplier[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> wire[at] = simple_arm_protection_settings_notification_record.broker_dealer_origin_multiplier[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> wire[at] = simple_arm_protection_settings_notification_record.firm_origin_multiplier[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> wire[at] = simple_arm_protection_settings_notification_record.priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> wire[at] = simple_arm_protection_settings_notification_record.non_priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 16 -> wire[at] = simple_arm_protection_settings_notification_record.reserved_16[simple_arm_protection_settings_notification_at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Arm Protection Settings Notification off the wire, 59 bytes from where the cursor stands */
inline decode_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_record) {
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 8 -> simple_arm_protection_settings_notification_record.notification_time[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> simple_arm_protection_settings_notification_record.mpid[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 11 -> simple_arm_protection_settings_notification_record.underlying_symbol[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> simple_arm_protection_settings_notification_record.allowable_engagement_percentage[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.counting_period_binary_u_2[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_record.action = wire[at]; at = at + 1;
  simple_arm_protection_settings_notification_record.source = wire[at]; at = at + 1;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.away_market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.broker_dealer_origin_multiplier[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.firm_origin_multiplier[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> simple_arm_protection_settings_notification_record.non_priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 16 -> simple_arm_protection_settings_notification_record.reserved_16[simple_arm_protection_settings_notification_at] = wire[at]; at = at + 1; simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Arm Protection Settings Notification is what was written, byte for byte */
inline equal_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_read, simple_arm_protection_settings_notification_written) {
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 8 -> assert(simple_arm_protection_settings_notification_read.notification_time[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.notification_time[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> assert(simple_arm_protection_settings_notification_read.mpid[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.mpid[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 11 -> assert(simple_arm_protection_settings_notification_read.underlying_symbol[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.underlying_symbol[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 4 -> assert(simple_arm_protection_settings_notification_read.allowable_engagement_percentage[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.allowable_engagement_percentage[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> assert(simple_arm_protection_settings_notification_read.counting_period_binary_u_2[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.counting_period_binary_u_2[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  assert(simple_arm_protection_settings_notification_read.action == simple_arm_protection_settings_notification_written.action);
  assert(simple_arm_protection_settings_notification_read.source == simple_arm_protection_settings_notification_written.source);
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> assert(simple_arm_protection_settings_notification_read.market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.market_maker_origin_multiplier[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> assert(simple_arm_protection_settings_notification_read.away_market_maker_origin_multiplier[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.away_market_maker_origin_multiplier[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> assert(simple_arm_protection_settings_notification_read.broker_dealer_origin_multiplier[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.broker_dealer_origin_multiplier[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> assert(simple_arm_protection_settings_notification_read.firm_origin_multiplier[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.firm_origin_multiplier[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> assert(simple_arm_protection_settings_notification_read.priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 2 -> assert(simple_arm_protection_settings_notification_read.non_priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.non_priority_customer_origin_multiplier[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  simple_arm_protection_settings_notification_at = 0;
  do
  :: simple_arm_protection_settings_notification_at < 16 -> assert(simple_arm_protection_settings_notification_read.reserved_16[simple_arm_protection_settings_notification_at] == simple_arm_protection_settings_notification_written.reserved_16[simple_arm_protection_settings_notification_at]); simple_arm_protection_settings_notification_at = simple_arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm 2 Underlying Level Protection Settings Notification: 48 bytes ------- */

/* This message format will be used to notify firms of their ARM2 Underlying Level protection settings. */
typedef Arm2UnderlyingLevelProtectionSettingsNotification {
  byte notification_time[8];
  byte mpid[4];
  byte action;
  byte underlying_symbol[11];
  byte arm_threshold_count_binary_u_4[4];
  byte counting_period_binary_u_4[4];
  byte reserved_16[16]
};

int arm2_underlying_level_protection_settings_notification_at;

/* every byte of Arm 2 Underlying Level Protection Settings Notification set to one value */
inline fill_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_record, arm2_underlying_level_protection_settings_notification_value) {
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 8 -> arm2_underlying_level_protection_settings_notification_record.notification_time[arm2_underlying_level_protection_settings_notification_at] = arm2_underlying_level_protection_settings_notification_value; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.mpid[arm2_underlying_level_protection_settings_notification_at] = arm2_underlying_level_protection_settings_notification_value; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_record.action = arm2_underlying_level_protection_settings_notification_value;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 11 -> arm2_underlying_level_protection_settings_notification_record.underlying_symbol[arm2_underlying_level_protection_settings_notification_at] = arm2_underlying_level_protection_settings_notification_value; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_notification_at] = arm2_underlying_level_protection_settings_notification_value; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_notification_at] = arm2_underlying_level_protection_settings_notification_value; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 16 -> arm2_underlying_level_protection_settings_notification_record.reserved_16[arm2_underlying_level_protection_settings_notification_at] = arm2_underlying_level_protection_settings_notification_value; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Arm 2 Underlying Level Protection Settings Notification set to where it lies, so a field read out of place says so */
inline ramp_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_record, arm2_underlying_level_protection_settings_notification_base) {
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 8 -> arm2_underlying_level_protection_settings_notification_record.notification_time[arm2_underlying_level_protection_settings_notification_at] = (arm2_underlying_level_protection_settings_notification_base + 0 + arm2_underlying_level_protection_settings_notification_at + 1) % 256; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.mpid[arm2_underlying_level_protection_settings_notification_at] = (arm2_underlying_level_protection_settings_notification_base + 8 + arm2_underlying_level_protection_settings_notification_at + 1) % 256; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_record.action = (arm2_underlying_level_protection_settings_notification_base + 12 + 1) % 256;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 11 -> arm2_underlying_level_protection_settings_notification_record.underlying_symbol[arm2_underlying_level_protection_settings_notification_at] = (arm2_underlying_level_protection_settings_notification_base + 13 + arm2_underlying_level_protection_settings_notification_at + 1) % 256; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_notification_at] = (arm2_underlying_level_protection_settings_notification_base + 24 + arm2_underlying_level_protection_settings_notification_at + 1) % 256; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_notification_at] = (arm2_underlying_level_protection_settings_notification_base + 28 + arm2_underlying_level_protection_settings_notification_at + 1) % 256; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 16 -> arm2_underlying_level_protection_settings_notification_record.reserved_16[arm2_underlying_level_protection_settings_notification_at] = (arm2_underlying_level_protection_settings_notification_base + 32 + arm2_underlying_level_protection_settings_notification_at + 1) % 256; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Underlying Level Protection Settings Notification to the wire, 48 bytes from where the cursor stands */
inline encode_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_record) {
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 8 -> wire[at] = arm2_underlying_level_protection_settings_notification_record.notification_time[arm2_underlying_level_protection_settings_notification_at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_notification_record.mpid[arm2_underlying_level_protection_settings_notification_at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  wire[at] = arm2_underlying_level_protection_settings_notification_record.action; at = at + 1;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 11 -> wire[at] = arm2_underlying_level_protection_settings_notification_record.underlying_symbol[arm2_underlying_level_protection_settings_notification_at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_notification_at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_notification_at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 16 -> wire[at] = arm2_underlying_level_protection_settings_notification_record.reserved_16[arm2_underlying_level_protection_settings_notification_at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Underlying Level Protection Settings Notification off the wire, 48 bytes from where the cursor stands */
inline decode_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_record) {
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 8 -> arm2_underlying_level_protection_settings_notification_record.notification_time[arm2_underlying_level_protection_settings_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.mpid[arm2_underlying_level_protection_settings_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_record.action = wire[at]; at = at + 1;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 11 -> arm2_underlying_level_protection_settings_notification_record.underlying_symbol[arm2_underlying_level_protection_settings_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> arm2_underlying_level_protection_settings_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 16 -> arm2_underlying_level_protection_settings_notification_record.reserved_16[arm2_underlying_level_protection_settings_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Arm 2 Underlying Level Protection Settings Notification is what was written, byte for byte */
inline equal_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_read, arm2_underlying_level_protection_settings_notification_written) {
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 8 -> assert(arm2_underlying_level_protection_settings_notification_read.notification_time[arm2_underlying_level_protection_settings_notification_at] == arm2_underlying_level_protection_settings_notification_written.notification_time[arm2_underlying_level_protection_settings_notification_at]); arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> assert(arm2_underlying_level_protection_settings_notification_read.mpid[arm2_underlying_level_protection_settings_notification_at] == arm2_underlying_level_protection_settings_notification_written.mpid[arm2_underlying_level_protection_settings_notification_at]); arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  assert(arm2_underlying_level_protection_settings_notification_read.action == arm2_underlying_level_protection_settings_notification_written.action);
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 11 -> assert(arm2_underlying_level_protection_settings_notification_read.underlying_symbol[arm2_underlying_level_protection_settings_notification_at] == arm2_underlying_level_protection_settings_notification_written.underlying_symbol[arm2_underlying_level_protection_settings_notification_at]); arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> assert(arm2_underlying_level_protection_settings_notification_read.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_notification_at] == arm2_underlying_level_protection_settings_notification_written.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_notification_at]); arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 4 -> assert(arm2_underlying_level_protection_settings_notification_read.counting_period_binary_u_4[arm2_underlying_level_protection_settings_notification_at] == arm2_underlying_level_protection_settings_notification_written.counting_period_binary_u_4[arm2_underlying_level_protection_settings_notification_at]); arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_notification_at = 0;
  do
  :: arm2_underlying_level_protection_settings_notification_at < 16 -> assert(arm2_underlying_level_protection_settings_notification_read.reserved_16[arm2_underlying_level_protection_settings_notification_at] == arm2_underlying_level_protection_settings_notification_written.reserved_16[arm2_underlying_level_protection_settings_notification_at]); arm2_underlying_level_protection_settings_notification_at = arm2_underlying_level_protection_settings_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Liquidity Protection Trigger Notification: 27 bytes --------- */

/* This message format will be used to notify firms when a Single Side Liquidity Protection is triggered for a MIAX Option or Complex Strategy. */
typedef SingleSideLiquidityProtectionTriggerNotification {
  byte notification_time[8];
  byte mpid[4];
  byte security_id_scope;
  byte security_id[4];
  byte side;
  byte triggering_client_message_id[4];
  byte triggering_bulk_quote_index;
  byte reserved_4[4]
};

int single_side_liquidity_protection_trigger_notification_at;

/* every byte of Single Side Liquidity Protection Trigger Notification set to one value */
inline fill_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_record, single_side_liquidity_protection_trigger_notification_value) {
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 8 -> single_side_liquidity_protection_trigger_notification_record.notification_time[single_side_liquidity_protection_trigger_notification_at] = single_side_liquidity_protection_trigger_notification_value; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.mpid[single_side_liquidity_protection_trigger_notification_at] = single_side_liquidity_protection_trigger_notification_value; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.security_id_scope = single_side_liquidity_protection_trigger_notification_value;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.security_id[single_side_liquidity_protection_trigger_notification_at] = single_side_liquidity_protection_trigger_notification_value; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.side = single_side_liquidity_protection_trigger_notification_value;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.triggering_client_message_id[single_side_liquidity_protection_trigger_notification_at] = single_side_liquidity_protection_trigger_notification_value; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.triggering_bulk_quote_index = single_side_liquidity_protection_trigger_notification_value;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.reserved_4[single_side_liquidity_protection_trigger_notification_at] = single_side_liquidity_protection_trigger_notification_value; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Liquidity Protection Trigger Notification set to where it lies, so a field read out of place says so */
inline ramp_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_record, single_side_liquidity_protection_trigger_notification_base) {
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 8 -> single_side_liquidity_protection_trigger_notification_record.notification_time[single_side_liquidity_protection_trigger_notification_at] = (single_side_liquidity_protection_trigger_notification_base + 0 + single_side_liquidity_protection_trigger_notification_at + 1) % 256; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.mpid[single_side_liquidity_protection_trigger_notification_at] = (single_side_liquidity_protection_trigger_notification_base + 8 + single_side_liquidity_protection_trigger_notification_at + 1) % 256; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.security_id_scope = (single_side_liquidity_protection_trigger_notification_base + 12 + 1) % 256;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.security_id[single_side_liquidity_protection_trigger_notification_at] = (single_side_liquidity_protection_trigger_notification_base + 13 + single_side_liquidity_protection_trigger_notification_at + 1) % 256; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.side = (single_side_liquidity_protection_trigger_notification_base + 17 + 1) % 256;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.triggering_client_message_id[single_side_liquidity_protection_trigger_notification_at] = (single_side_liquidity_protection_trigger_notification_base + 18 + single_side_liquidity_protection_trigger_notification_at + 1) % 256; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.triggering_bulk_quote_index = (single_side_liquidity_protection_trigger_notification_base + 22 + 1) % 256;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.reserved_4[single_side_liquidity_protection_trigger_notification_at] = (single_side_liquidity_protection_trigger_notification_base + 23 + single_side_liquidity_protection_trigger_notification_at + 1) % 256; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Liquidity Protection Trigger Notification to the wire, 27 bytes from where the cursor stands */
inline encode_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_record) {
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 8 -> wire[at] = single_side_liquidity_protection_trigger_notification_record.notification_time[single_side_liquidity_protection_trigger_notification_at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> wire[at] = single_side_liquidity_protection_trigger_notification_record.mpid[single_side_liquidity_protection_trigger_notification_at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = single_side_liquidity_protection_trigger_notification_record.security_id_scope; at = at + 1;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> wire[at] = single_side_liquidity_protection_trigger_notification_record.security_id[single_side_liquidity_protection_trigger_notification_at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = single_side_liquidity_protection_trigger_notification_record.side; at = at + 1;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> wire[at] = single_side_liquidity_protection_trigger_notification_record.triggering_client_message_id[single_side_liquidity_protection_trigger_notification_at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = single_side_liquidity_protection_trigger_notification_record.triggering_bulk_quote_index; at = at + 1;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> wire[at] = single_side_liquidity_protection_trigger_notification_record.reserved_4[single_side_liquidity_protection_trigger_notification_at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Liquidity Protection Trigger Notification off the wire, 27 bytes from where the cursor stands */
inline decode_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_record) {
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 8 -> single_side_liquidity_protection_trigger_notification_record.notification_time[single_side_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.mpid[single_side_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.security_id_scope = wire[at]; at = at + 1;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.security_id[single_side_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.side = wire[at]; at = at + 1;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.triggering_client_message_id[single_side_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_record.triggering_bulk_quote_index = wire[at]; at = at + 1;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> single_side_liquidity_protection_trigger_notification_record.reserved_4[single_side_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Liquidity Protection Trigger Notification is what was written, byte for byte */
inline equal_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_read, single_side_liquidity_protection_trigger_notification_written) {
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 8 -> assert(single_side_liquidity_protection_trigger_notification_read.notification_time[single_side_liquidity_protection_trigger_notification_at] == single_side_liquidity_protection_trigger_notification_written.notification_time[single_side_liquidity_protection_trigger_notification_at]); single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> assert(single_side_liquidity_protection_trigger_notification_read.mpid[single_side_liquidity_protection_trigger_notification_at] == single_side_liquidity_protection_trigger_notification_written.mpid[single_side_liquidity_protection_trigger_notification_at]); single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(single_side_liquidity_protection_trigger_notification_read.security_id_scope == single_side_liquidity_protection_trigger_notification_written.security_id_scope);
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> assert(single_side_liquidity_protection_trigger_notification_read.security_id[single_side_liquidity_protection_trigger_notification_at] == single_side_liquidity_protection_trigger_notification_written.security_id[single_side_liquidity_protection_trigger_notification_at]); single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(single_side_liquidity_protection_trigger_notification_read.side == single_side_liquidity_protection_trigger_notification_written.side);
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> assert(single_side_liquidity_protection_trigger_notification_read.triggering_client_message_id[single_side_liquidity_protection_trigger_notification_at] == single_side_liquidity_protection_trigger_notification_written.triggering_client_message_id[single_side_liquidity_protection_trigger_notification_at]); single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(single_side_liquidity_protection_trigger_notification_read.triggering_bulk_quote_index == single_side_liquidity_protection_trigger_notification_written.triggering_bulk_quote_index);
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> assert(single_side_liquidity_protection_trigger_notification_read.reserved_4[single_side_liquidity_protection_trigger_notification_at] == single_side_liquidity_protection_trigger_notification_written.reserved_4[single_side_liquidity_protection_trigger_notification_at]); single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm 2 Underlying Level Protection Notification: 48 bytes ---------------- */

/* This message format will be used to notify firms about ARM2 Underlying Level protection events. */
typedef Arm2UnderlyingLevelProtectionNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte notification_type;
  byte arm_threshold_count_binary_u_4[4];
  byte counting_period_binary_u_4[4];
  byte reserved_16[16]
};

int arm2_underlying_level_protection_notification_at;

/* every byte of Arm 2 Underlying Level Protection Notification set to one value */
inline fill_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_record, arm2_underlying_level_protection_notification_value) {
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 8 -> arm2_underlying_level_protection_notification_record.notification_time[arm2_underlying_level_protection_notification_at] = arm2_underlying_level_protection_notification_value; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.mpid[arm2_underlying_level_protection_notification_at] = arm2_underlying_level_protection_notification_value; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 11 -> arm2_underlying_level_protection_notification_record.underlying_symbol[arm2_underlying_level_protection_notification_at] = arm2_underlying_level_protection_notification_value; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_record.notification_type = arm2_underlying_level_protection_notification_value;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_notification_at] = arm2_underlying_level_protection_notification_value; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_notification_at] = arm2_underlying_level_protection_notification_value; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 16 -> arm2_underlying_level_protection_notification_record.reserved_16[arm2_underlying_level_protection_notification_at] = arm2_underlying_level_protection_notification_value; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Arm 2 Underlying Level Protection Notification set to where it lies, so a field read out of place says so */
inline ramp_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_record, arm2_underlying_level_protection_notification_base) {
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 8 -> arm2_underlying_level_protection_notification_record.notification_time[arm2_underlying_level_protection_notification_at] = (arm2_underlying_level_protection_notification_base + 0 + arm2_underlying_level_protection_notification_at + 1) % 256; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.mpid[arm2_underlying_level_protection_notification_at] = (arm2_underlying_level_protection_notification_base + 8 + arm2_underlying_level_protection_notification_at + 1) % 256; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 11 -> arm2_underlying_level_protection_notification_record.underlying_symbol[arm2_underlying_level_protection_notification_at] = (arm2_underlying_level_protection_notification_base + 12 + arm2_underlying_level_protection_notification_at + 1) % 256; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_record.notification_type = (arm2_underlying_level_protection_notification_base + 23 + 1) % 256;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_notification_at] = (arm2_underlying_level_protection_notification_base + 24 + arm2_underlying_level_protection_notification_at + 1) % 256; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_notification_at] = (arm2_underlying_level_protection_notification_base + 28 + arm2_underlying_level_protection_notification_at + 1) % 256; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 16 -> arm2_underlying_level_protection_notification_record.reserved_16[arm2_underlying_level_protection_notification_at] = (arm2_underlying_level_protection_notification_base + 32 + arm2_underlying_level_protection_notification_at + 1) % 256; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Underlying Level Protection Notification to the wire, 48 bytes from where the cursor stands */
inline encode_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_record) {
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 8 -> wire[at] = arm2_underlying_level_protection_notification_record.notification_time[arm2_underlying_level_protection_notification_at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> wire[at] = arm2_underlying_level_protection_notification_record.mpid[arm2_underlying_level_protection_notification_at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 11 -> wire[at] = arm2_underlying_level_protection_notification_record.underlying_symbol[arm2_underlying_level_protection_notification_at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  wire[at] = arm2_underlying_level_protection_notification_record.notification_type; at = at + 1;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> wire[at] = arm2_underlying_level_protection_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_notification_at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> wire[at] = arm2_underlying_level_protection_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_notification_at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 16 -> wire[at] = arm2_underlying_level_protection_notification_record.reserved_16[arm2_underlying_level_protection_notification_at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Underlying Level Protection Notification off the wire, 48 bytes from where the cursor stands */
inline decode_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_record) {
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 8 -> arm2_underlying_level_protection_notification_record.notification_time[arm2_underlying_level_protection_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.mpid[arm2_underlying_level_protection_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 11 -> arm2_underlying_level_protection_notification_record.underlying_symbol[arm2_underlying_level_protection_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_record.notification_type = wire[at]; at = at + 1;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> arm2_underlying_level_protection_notification_record.counting_period_binary_u_4[arm2_underlying_level_protection_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 16 -> arm2_underlying_level_protection_notification_record.reserved_16[arm2_underlying_level_protection_notification_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Arm 2 Underlying Level Protection Notification is what was written, byte for byte */
inline equal_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_read, arm2_underlying_level_protection_notification_written) {
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 8 -> assert(arm2_underlying_level_protection_notification_read.notification_time[arm2_underlying_level_protection_notification_at] == arm2_underlying_level_protection_notification_written.notification_time[arm2_underlying_level_protection_notification_at]); arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> assert(arm2_underlying_level_protection_notification_read.mpid[arm2_underlying_level_protection_notification_at] == arm2_underlying_level_protection_notification_written.mpid[arm2_underlying_level_protection_notification_at]); arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 11 -> assert(arm2_underlying_level_protection_notification_read.underlying_symbol[arm2_underlying_level_protection_notification_at] == arm2_underlying_level_protection_notification_written.underlying_symbol[arm2_underlying_level_protection_notification_at]); arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  assert(arm2_underlying_level_protection_notification_read.notification_type == arm2_underlying_level_protection_notification_written.notification_type);
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> assert(arm2_underlying_level_protection_notification_read.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_notification_at] == arm2_underlying_level_protection_notification_written.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_notification_at]); arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 4 -> assert(arm2_underlying_level_protection_notification_read.counting_period_binary_u_4[arm2_underlying_level_protection_notification_at] == arm2_underlying_level_protection_notification_written.counting_period_binary_u_4[arm2_underlying_level_protection_notification_at]); arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_notification_at = 0;
  do
  :: arm2_underlying_level_protection_notification_at < 16 -> assert(arm2_underlying_level_protection_notification_read.reserved_16[arm2_underlying_level_protection_notification_at] == arm2_underlying_level_protection_notification_written.reserved_16[arm2_underlying_level_protection_notification_at]); arm2_underlying_level_protection_notification_at = arm2_underlying_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm 2 Firm Level Protection Notification: 33 bytes ---------------------- */

/* This message format will be used to notify firms about ARM2 Firm Level protection events. */
typedef Arm2FirmLevelProtectionNotification {
  byte notification_time[8];
  byte arm_threshold_count_binary_4u_4[4];
  byte counting_period_binary_4u_4[4];
  byte notification_type;
  byte reserved_16[16]
};

int arm2_firm_level_protection_notification_at;

/* every byte of Arm 2 Firm Level Protection Notification set to one value */
inline fill_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_record, arm2_firm_level_protection_notification_value) {
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 8 -> arm2_firm_level_protection_notification_record.notification_time[arm2_firm_level_protection_notification_at] = arm2_firm_level_protection_notification_value; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> arm2_firm_level_protection_notification_record.arm_threshold_count_binary_4u_4[arm2_firm_level_protection_notification_at] = arm2_firm_level_protection_notification_value; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> arm2_firm_level_protection_notification_record.counting_period_binary_4u_4[arm2_firm_level_protection_notification_at] = arm2_firm_level_protection_notification_value; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_record.notification_type = arm2_firm_level_protection_notification_value;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 16 -> arm2_firm_level_protection_notification_record.reserved_16[arm2_firm_level_protection_notification_at] = arm2_firm_level_protection_notification_value; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Arm 2 Firm Level Protection Notification set to where it lies, so a field read out of place says so */
inline ramp_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_record, arm2_firm_level_protection_notification_base) {
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 8 -> arm2_firm_level_protection_notification_record.notification_time[arm2_firm_level_protection_notification_at] = (arm2_firm_level_protection_notification_base + 0 + arm2_firm_level_protection_notification_at + 1) % 256; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> arm2_firm_level_protection_notification_record.arm_threshold_count_binary_4u_4[arm2_firm_level_protection_notification_at] = (arm2_firm_level_protection_notification_base + 8 + arm2_firm_level_protection_notification_at + 1) % 256; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> arm2_firm_level_protection_notification_record.counting_period_binary_4u_4[arm2_firm_level_protection_notification_at] = (arm2_firm_level_protection_notification_base + 12 + arm2_firm_level_protection_notification_at + 1) % 256; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_record.notification_type = (arm2_firm_level_protection_notification_base + 16 + 1) % 256;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 16 -> arm2_firm_level_protection_notification_record.reserved_16[arm2_firm_level_protection_notification_at] = (arm2_firm_level_protection_notification_base + 17 + arm2_firm_level_protection_notification_at + 1) % 256; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Firm Level Protection Notification to the wire, 33 bytes from where the cursor stands */
inline encode_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_record) {
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 8 -> wire[at] = arm2_firm_level_protection_notification_record.notification_time[arm2_firm_level_protection_notification_at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> wire[at] = arm2_firm_level_protection_notification_record.arm_threshold_count_binary_4u_4[arm2_firm_level_protection_notification_at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> wire[at] = arm2_firm_level_protection_notification_record.counting_period_binary_4u_4[arm2_firm_level_protection_notification_at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  wire[at] = arm2_firm_level_protection_notification_record.notification_type; at = at + 1;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 16 -> wire[at] = arm2_firm_level_protection_notification_record.reserved_16[arm2_firm_level_protection_notification_at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Firm Level Protection Notification off the wire, 33 bytes from where the cursor stands */
inline decode_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_record) {
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 8 -> arm2_firm_level_protection_notification_record.notification_time[arm2_firm_level_protection_notification_at] = wire[at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> arm2_firm_level_protection_notification_record.arm_threshold_count_binary_4u_4[arm2_firm_level_protection_notification_at] = wire[at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> arm2_firm_level_protection_notification_record.counting_period_binary_4u_4[arm2_firm_level_protection_notification_at] = wire[at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_record.notification_type = wire[at]; at = at + 1;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 16 -> arm2_firm_level_protection_notification_record.reserved_16[arm2_firm_level_protection_notification_at] = wire[at]; at = at + 1; arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Arm 2 Firm Level Protection Notification is what was written, byte for byte */
inline equal_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_read, arm2_firm_level_protection_notification_written) {
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 8 -> assert(arm2_firm_level_protection_notification_read.notification_time[arm2_firm_level_protection_notification_at] == arm2_firm_level_protection_notification_written.notification_time[arm2_firm_level_protection_notification_at]); arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> assert(arm2_firm_level_protection_notification_read.arm_threshold_count_binary_4u_4[arm2_firm_level_protection_notification_at] == arm2_firm_level_protection_notification_written.arm_threshold_count_binary_4u_4[arm2_firm_level_protection_notification_at]); arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 4 -> assert(arm2_firm_level_protection_notification_read.counting_period_binary_4u_4[arm2_firm_level_protection_notification_at] == arm2_firm_level_protection_notification_written.counting_period_binary_4u_4[arm2_firm_level_protection_notification_at]); arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  assert(arm2_firm_level_protection_notification_read.notification_type == arm2_firm_level_protection_notification_written.notification_type);
  arm2_firm_level_protection_notification_at = 0;
  do
  :: arm2_firm_level_protection_notification_at < 16 -> assert(arm2_firm_level_protection_notification_read.reserved_16[arm2_firm_level_protection_notification_at] == arm2_firm_level_protection_notification_written.reserved_16[arm2_firm_level_protection_notification_at]); arm2_firm_level_protection_notification_at = arm2_firm_level_protection_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Notification: 36 bytes ------------------------------------------- */

/* This is the message format that will be used to notify firms about system generated cancels. */
typedef CancelNotification {
  byte notification_time[8];
  byte mpid[4];
  byte product_id_or_strategy_id[4];
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
  :: cancel_notification_at < 4 -> cancel_notification_record.product_id_or_strategy_id[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
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
  :: cancel_notification_at < 4 -> cancel_notification_record.product_id_or_strategy_id[cancel_notification_at] = (cancel_notification_base + 12 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
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
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.product_id_or_strategy_id[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
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
  :: cancel_notification_at < 4 -> cancel_notification_record.product_id_or_strategy_id[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
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
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.product_id_or_strategy_id[cancel_notification_at] == cancel_notification_written.product_id_or_strategy_id[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
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

/* ---- Option Execution Notification: 49 bytes --------------------------------- */

/* This message format will be used to notify the firms of executions of their simple quotes and simple or complex eQuotes. */
typedef OptionExecutionNotification {
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

int option_execution_notification_at;

/* every byte of Option Execution Notification set to one value */
inline fill_option_execution_notification(option_execution_notification_record, option_execution_notification_value) {
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> option_execution_notification_record.notification_time[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.mpid[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.product_id[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.liquidity_type = option_execution_notification_value;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.client_message_id[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.bulk_quote_index = option_execution_notification_value;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.event_id[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.trade_id[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> option_execution_notification_record.execution_id[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.reserved_1 = option_execution_notification_value;
  option_execution_notification_record.trade_status = option_execution_notification_value;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.last_price[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.side = option_execution_notification_value;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.last_size[option_execution_notification_at] = option_execution_notification_value; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Option Execution Notification set to where it lies, so a field read out of place says so */
inline ramp_option_execution_notification(option_execution_notification_record, option_execution_notification_base) {
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> option_execution_notification_record.notification_time[option_execution_notification_at] = (option_execution_notification_base + 0 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.mpid[option_execution_notification_at] = (option_execution_notification_base + 8 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.product_id[option_execution_notification_at] = (option_execution_notification_base + 12 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.liquidity_type = (option_execution_notification_base + 16 + 1) % 256;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.client_message_id[option_execution_notification_at] = (option_execution_notification_base + 17 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.bulk_quote_index = (option_execution_notification_base + 21 + 1) % 256;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.event_id[option_execution_notification_at] = (option_execution_notification_base + 22 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.trade_id[option_execution_notification_at] = (option_execution_notification_base + 26 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> option_execution_notification_record.execution_id[option_execution_notification_at] = (option_execution_notification_base + 30 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.reserved_1 = (option_execution_notification_base + 38 + 1) % 256;
  option_execution_notification_record.trade_status = (option_execution_notification_base + 39 + 1) % 256;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.last_price[option_execution_notification_at] = (option_execution_notification_base + 40 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.side = (option_execution_notification_base + 44 + 1) % 256;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.last_size[option_execution_notification_at] = (option_execution_notification_base + 45 + option_execution_notification_at + 1) % 256; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Option Execution Notification to the wire, 49 bytes from where the cursor stands */
inline encode_option_execution_notification(option_execution_notification_record) {
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> wire[at] = option_execution_notification_record.notification_time[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> wire[at] = option_execution_notification_record.mpid[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> wire[at] = option_execution_notification_record.product_id[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = option_execution_notification_record.liquidity_type; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> wire[at] = option_execution_notification_record.client_message_id[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = option_execution_notification_record.bulk_quote_index; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> wire[at] = option_execution_notification_record.event_id[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> wire[at] = option_execution_notification_record.trade_id[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> wire[at] = option_execution_notification_record.execution_id[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = option_execution_notification_record.reserved_1; at = at + 1;
  wire[at] = option_execution_notification_record.trade_status; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> wire[at] = option_execution_notification_record.last_price[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = option_execution_notification_record.side; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> wire[at] = option_execution_notification_record.last_size[option_execution_notification_at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Option Execution Notification off the wire, 49 bytes from where the cursor stands */
inline decode_option_execution_notification(option_execution_notification_record) {
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> option_execution_notification_record.notification_time[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.mpid[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.product_id[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.liquidity_type = wire[at]; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.client_message_id[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.bulk_quote_index = wire[at]; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.event_id[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.trade_id[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> option_execution_notification_record.execution_id[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.reserved_1 = wire[at]; at = at + 1;
  option_execution_notification_record.trade_status = wire[at]; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.last_price[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_record.side = wire[at]; at = at + 1;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> option_execution_notification_record.last_size[option_execution_notification_at] = wire[at]; at = at + 1; option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Option Execution Notification is what was written, byte for byte */
inline equal_option_execution_notification(option_execution_notification_read, option_execution_notification_written) {
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> assert(option_execution_notification_read.notification_time[option_execution_notification_at] == option_execution_notification_written.notification_time[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> assert(option_execution_notification_read.mpid[option_execution_notification_at] == option_execution_notification_written.mpid[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> assert(option_execution_notification_read.product_id[option_execution_notification_at] == option_execution_notification_written.product_id[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  assert(option_execution_notification_read.liquidity_type == option_execution_notification_written.liquidity_type);
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> assert(option_execution_notification_read.client_message_id[option_execution_notification_at] == option_execution_notification_written.client_message_id[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  assert(option_execution_notification_read.bulk_quote_index == option_execution_notification_written.bulk_quote_index);
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> assert(option_execution_notification_read.event_id[option_execution_notification_at] == option_execution_notification_written.event_id[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> assert(option_execution_notification_read.trade_id[option_execution_notification_at] == option_execution_notification_written.trade_id[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 8 -> assert(option_execution_notification_read.execution_id[option_execution_notification_at] == option_execution_notification_written.execution_id[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  assert(option_execution_notification_read.reserved_1 == option_execution_notification_written.reserved_1);
  assert(option_execution_notification_read.trade_status == option_execution_notification_written.trade_status);
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> assert(option_execution_notification_read.last_price[option_execution_notification_at] == option_execution_notification_written.last_price[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  assert(option_execution_notification_read.side == option_execution_notification_written.side);
  option_execution_notification_at = 0;
  do
  :: option_execution_notification_at < 4 -> assert(option_execution_notification_read.last_size[option_execution_notification_at] == option_execution_notification_written.last_size[option_execution_notification_at]); option_execution_notification_at = option_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Leg Execution Notification: 71 bytes ------------------------------ */

/* This message format will be used to notify the firm of a stock leg execution from a stock-tied complex eQuote. */
typedef StockLegExecutionNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte liquidity_type;
  byte client_message_id[4];
  byte event_id[4];
  byte trade_id[4];
  byte execution_id[8];
  byte trade_status;
  byte last_price[4];
  byte side;
  byte stock_sell_short_indicator;
  byte last_size[4];
  byte reserved_16[16]
};

int stock_leg_execution_notification_at;

/* every byte of Stock Leg Execution Notification set to one value */
inline fill_stock_leg_execution_notification(stock_leg_execution_notification_record, stock_leg_execution_notification_value) {
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> stock_leg_execution_notification_record.notification_time[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.mpid[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 11 -> stock_leg_execution_notification_record.underlying_symbol[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.liquidity_type = stock_leg_execution_notification_value;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.client_message_id[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.event_id[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.trade_id[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> stock_leg_execution_notification_record.execution_id[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.trade_status = stock_leg_execution_notification_value;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_price[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.side = stock_leg_execution_notification_value;
  stock_leg_execution_notification_record.stock_sell_short_indicator = stock_leg_execution_notification_value;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_size[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 16 -> stock_leg_execution_notification_record.reserved_16[stock_leg_execution_notification_at] = stock_leg_execution_notification_value; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Leg Execution Notification set to where it lies, so a field read out of place says so */
inline ramp_stock_leg_execution_notification(stock_leg_execution_notification_record, stock_leg_execution_notification_base) {
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> stock_leg_execution_notification_record.notification_time[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 0 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.mpid[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 8 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 11 -> stock_leg_execution_notification_record.underlying_symbol[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 12 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.liquidity_type = (stock_leg_execution_notification_base + 23 + 1) % 256;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.client_message_id[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 24 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.event_id[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 28 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.trade_id[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 32 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> stock_leg_execution_notification_record.execution_id[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 36 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.trade_status = (stock_leg_execution_notification_base + 44 + 1) % 256;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_price[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 45 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.side = (stock_leg_execution_notification_base + 49 + 1) % 256;
  stock_leg_execution_notification_record.stock_sell_short_indicator = (stock_leg_execution_notification_base + 50 + 1) % 256;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_size[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 51 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 16 -> stock_leg_execution_notification_record.reserved_16[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 55 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Leg Execution Notification to the wire, 71 bytes from where the cursor stands */
inline encode_stock_leg_execution_notification(stock_leg_execution_notification_record) {
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> wire[at] = stock_leg_execution_notification_record.notification_time[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> wire[at] = stock_leg_execution_notification_record.mpid[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 11 -> wire[at] = stock_leg_execution_notification_record.underlying_symbol[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = stock_leg_execution_notification_record.liquidity_type; at = at + 1;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> wire[at] = stock_leg_execution_notification_record.client_message_id[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> wire[at] = stock_leg_execution_notification_record.event_id[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> wire[at] = stock_leg_execution_notification_record.trade_id[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> wire[at] = stock_leg_execution_notification_record.execution_id[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = stock_leg_execution_notification_record.trade_status; at = at + 1;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> wire[at] = stock_leg_execution_notification_record.last_price[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = stock_leg_execution_notification_record.side; at = at + 1;
  wire[at] = stock_leg_execution_notification_record.stock_sell_short_indicator; at = at + 1;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> wire[at] = stock_leg_execution_notification_record.last_size[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 16 -> wire[at] = stock_leg_execution_notification_record.reserved_16[stock_leg_execution_notification_at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Leg Execution Notification off the wire, 71 bytes from where the cursor stands */
inline decode_stock_leg_execution_notification(stock_leg_execution_notification_record) {
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> stock_leg_execution_notification_record.notification_time[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.mpid[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 11 -> stock_leg_execution_notification_record.underlying_symbol[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.liquidity_type = wire[at]; at = at + 1;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.client_message_id[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.event_id[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.trade_id[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> stock_leg_execution_notification_record.execution_id[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.trade_status = wire[at]; at = at + 1;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_price[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.side = wire[at]; at = at + 1;
  stock_leg_execution_notification_record.stock_sell_short_indicator = wire[at]; at = at + 1;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_size[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 16 -> stock_leg_execution_notification_record.reserved_16[stock_leg_execution_notification_at] = wire[at]; at = at + 1; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Leg Execution Notification is what was written, byte for byte */
inline equal_stock_leg_execution_notification(stock_leg_execution_notification_read, stock_leg_execution_notification_written) {
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> assert(stock_leg_execution_notification_read.notification_time[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.notification_time[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> assert(stock_leg_execution_notification_read.mpid[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.mpid[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 11 -> assert(stock_leg_execution_notification_read.underlying_symbol[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.underlying_symbol[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  assert(stock_leg_execution_notification_read.liquidity_type == stock_leg_execution_notification_written.liquidity_type);
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> assert(stock_leg_execution_notification_read.client_message_id[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.client_message_id[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> assert(stock_leg_execution_notification_read.event_id[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.event_id[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> assert(stock_leg_execution_notification_read.trade_id[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.trade_id[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> assert(stock_leg_execution_notification_read.execution_id[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.execution_id[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  assert(stock_leg_execution_notification_read.trade_status == stock_leg_execution_notification_written.trade_status);
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> assert(stock_leg_execution_notification_read.last_price[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.last_price[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  assert(stock_leg_execution_notification_read.side == stock_leg_execution_notification_written.side);
  assert(stock_leg_execution_notification_read.stock_sell_short_indicator == stock_leg_execution_notification_written.stock_sell_short_indicator);
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> assert(stock_leg_execution_notification_read.last_size[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.last_size[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 16 -> assert(stock_leg_execution_notification_read.reserved_16[stock_leg_execution_notification_at] == stock_leg_execution_notification_written.reserved_16[stock_leg_execution_notification_at]); stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Arm Settings Update Request: 54 bytes ---------------------------- */

/* Firms can use this message format to set up their ARM protection settings for each session. Changes to these settings can be made throughout the day. */
typedef SimpleArmSettingsUpdateRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte action;
  byte underlying_symbol[11];
  byte allowable_engagement_percentage[4];
  byte counting_period_binary_u_2[2];
  byte market_maker_origin_multiplier[2];
  byte away_market_maker_origin_multiplier[2];
  byte broker_dealer_origin_multiplier[2];
  byte firm_origin_multiplier[2];
  byte priority_customer_origin_multiplier[2];
  byte non_priority_customer_origin_multiplier[2];
  byte reserved_16[16]
};

int simple_arm_settings_update_request_at;

/* every byte of Simple Arm Settings Update Request set to one value */
inline fill_simple_arm_settings_update_request(simple_arm_settings_update_request_record, simple_arm_settings_update_request_value) {
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.client_message_id[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.mpid[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_record.action = simple_arm_settings_update_request_value;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 11 -> simple_arm_settings_update_request_record.underlying_symbol[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.allowable_engagement_percentage[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.counting_period_binary_u_2[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.market_maker_origin_multiplier[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.away_market_maker_origin_multiplier[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.broker_dealer_origin_multiplier[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.firm_origin_multiplier[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.priority_customer_origin_multiplier[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.non_priority_customer_origin_multiplier[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 16 -> simple_arm_settings_update_request_record.reserved_16[simple_arm_settings_update_request_at] = simple_arm_settings_update_request_value; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Arm Settings Update Request set to where it lies, so a field read out of place says so */
inline ramp_simple_arm_settings_update_request(simple_arm_settings_update_request_record, simple_arm_settings_update_request_base) {
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.client_message_id[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 0 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.mpid[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 4 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_record.action = (simple_arm_settings_update_request_base + 8 + 1) % 256;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 11 -> simple_arm_settings_update_request_record.underlying_symbol[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 9 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.allowable_engagement_percentage[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 20 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.counting_period_binary_u_2[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 24 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.market_maker_origin_multiplier[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 26 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.away_market_maker_origin_multiplier[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 28 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.broker_dealer_origin_multiplier[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 30 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.firm_origin_multiplier[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 32 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.priority_customer_origin_multiplier[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 34 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.non_priority_customer_origin_multiplier[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 36 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 16 -> simple_arm_settings_update_request_record.reserved_16[simple_arm_settings_update_request_at] = (simple_arm_settings_update_request_base + 38 + simple_arm_settings_update_request_at + 1) % 256; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Arm Settings Update Request to the wire, 54 bytes from where the cursor stands */
inline encode_simple_arm_settings_update_request(simple_arm_settings_update_request_record) {
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> wire[at] = simple_arm_settings_update_request_record.client_message_id[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> wire[at] = simple_arm_settings_update_request_record.mpid[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  wire[at] = simple_arm_settings_update_request_record.action; at = at + 1;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 11 -> wire[at] = simple_arm_settings_update_request_record.underlying_symbol[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> wire[at] = simple_arm_settings_update_request_record.allowable_engagement_percentage[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> wire[at] = simple_arm_settings_update_request_record.counting_period_binary_u_2[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> wire[at] = simple_arm_settings_update_request_record.market_maker_origin_multiplier[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> wire[at] = simple_arm_settings_update_request_record.away_market_maker_origin_multiplier[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> wire[at] = simple_arm_settings_update_request_record.broker_dealer_origin_multiplier[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> wire[at] = simple_arm_settings_update_request_record.firm_origin_multiplier[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> wire[at] = simple_arm_settings_update_request_record.priority_customer_origin_multiplier[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> wire[at] = simple_arm_settings_update_request_record.non_priority_customer_origin_multiplier[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 16 -> wire[at] = simple_arm_settings_update_request_record.reserved_16[simple_arm_settings_update_request_at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Arm Settings Update Request off the wire, 54 bytes from where the cursor stands */
inline decode_simple_arm_settings_update_request(simple_arm_settings_update_request_record) {
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.client_message_id[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.mpid[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_record.action = wire[at]; at = at + 1;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 11 -> simple_arm_settings_update_request_record.underlying_symbol[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> simple_arm_settings_update_request_record.allowable_engagement_percentage[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.counting_period_binary_u_2[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.market_maker_origin_multiplier[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.away_market_maker_origin_multiplier[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.broker_dealer_origin_multiplier[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.firm_origin_multiplier[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.priority_customer_origin_multiplier[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> simple_arm_settings_update_request_record.non_priority_customer_origin_multiplier[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 16 -> simple_arm_settings_update_request_record.reserved_16[simple_arm_settings_update_request_at] = wire[at]; at = at + 1; simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Arm Settings Update Request is what was written, byte for byte */
inline equal_simple_arm_settings_update_request(simple_arm_settings_update_request_read, simple_arm_settings_update_request_written) {
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> assert(simple_arm_settings_update_request_read.client_message_id[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.client_message_id[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> assert(simple_arm_settings_update_request_read.mpid[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.mpid[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  assert(simple_arm_settings_update_request_read.action == simple_arm_settings_update_request_written.action);
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 11 -> assert(simple_arm_settings_update_request_read.underlying_symbol[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.underlying_symbol[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 4 -> assert(simple_arm_settings_update_request_read.allowable_engagement_percentage[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.allowable_engagement_percentage[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> assert(simple_arm_settings_update_request_read.counting_period_binary_u_2[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.counting_period_binary_u_2[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> assert(simple_arm_settings_update_request_read.market_maker_origin_multiplier[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.market_maker_origin_multiplier[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> assert(simple_arm_settings_update_request_read.away_market_maker_origin_multiplier[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.away_market_maker_origin_multiplier[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> assert(simple_arm_settings_update_request_read.broker_dealer_origin_multiplier[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.broker_dealer_origin_multiplier[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> assert(simple_arm_settings_update_request_read.firm_origin_multiplier[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.firm_origin_multiplier[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> assert(simple_arm_settings_update_request_read.priority_customer_origin_multiplier[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.priority_customer_origin_multiplier[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 2 -> assert(simple_arm_settings_update_request_read.non_priority_customer_origin_multiplier[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.non_priority_customer_origin_multiplier[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_request_at = 0;
  do
  :: simple_arm_settings_update_request_at < 16 -> assert(simple_arm_settings_update_request_read.reserved_16[simple_arm_settings_update_request_at] == simple_arm_settings_update_request_written.reserved_16[simple_arm_settings_update_request_at]); simple_arm_settings_update_request_at = simple_arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Arm Settings Update Response: 20 bytes --------------------------- */

/* MIAX uses this format to respond to the firm with a status of their ARM protection settings request. */
typedef SimpleArmSettingsUpdateResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11];
  byte arm_settings_update_status
};

int simple_arm_settings_update_response_at;

/* every byte of Simple Arm Settings Update Response set to one value */
inline fill_simple_arm_settings_update_response(simple_arm_settings_update_response_record, simple_arm_settings_update_response_value) {
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> simple_arm_settings_update_response_record.client_message_id[simple_arm_settings_update_response_at] = simple_arm_settings_update_response_value; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> simple_arm_settings_update_response_record.mpid[simple_arm_settings_update_response_at] = simple_arm_settings_update_response_value; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 11 -> simple_arm_settings_update_response_record.underlying_symbol[simple_arm_settings_update_response_at] = simple_arm_settings_update_response_value; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_record.arm_settings_update_status = simple_arm_settings_update_response_value;
  skip
}

/* each byte of Simple Arm Settings Update Response set to where it lies, so a field read out of place says so */
inline ramp_simple_arm_settings_update_response(simple_arm_settings_update_response_record, simple_arm_settings_update_response_base) {
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> simple_arm_settings_update_response_record.client_message_id[simple_arm_settings_update_response_at] = (simple_arm_settings_update_response_base + 0 + simple_arm_settings_update_response_at + 1) % 256; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> simple_arm_settings_update_response_record.mpid[simple_arm_settings_update_response_at] = (simple_arm_settings_update_response_base + 4 + simple_arm_settings_update_response_at + 1) % 256; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 11 -> simple_arm_settings_update_response_record.underlying_symbol[simple_arm_settings_update_response_at] = (simple_arm_settings_update_response_base + 8 + simple_arm_settings_update_response_at + 1) % 256; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_record.arm_settings_update_status = (simple_arm_settings_update_response_base + 19 + 1) % 256;
  skip
}

/* Simple Arm Settings Update Response to the wire, 20 bytes from where the cursor stands */
inline encode_simple_arm_settings_update_response(simple_arm_settings_update_response_record) {
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> wire[at] = simple_arm_settings_update_response_record.client_message_id[simple_arm_settings_update_response_at]; at = at + 1; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> wire[at] = simple_arm_settings_update_response_record.mpid[simple_arm_settings_update_response_at]; at = at + 1; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 11 -> wire[at] = simple_arm_settings_update_response_record.underlying_symbol[simple_arm_settings_update_response_at]; at = at + 1; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  wire[at] = simple_arm_settings_update_response_record.arm_settings_update_status; at = at + 1;
  skip
}

/* Simple Arm Settings Update Response off the wire, 20 bytes from where the cursor stands */
inline decode_simple_arm_settings_update_response(simple_arm_settings_update_response_record) {
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> simple_arm_settings_update_response_record.client_message_id[simple_arm_settings_update_response_at] = wire[at]; at = at + 1; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> simple_arm_settings_update_response_record.mpid[simple_arm_settings_update_response_at] = wire[at]; at = at + 1; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 11 -> simple_arm_settings_update_response_record.underlying_symbol[simple_arm_settings_update_response_at] = wire[at]; at = at + 1; simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_record.arm_settings_update_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Arm Settings Update Response is what was written, byte for byte */
inline equal_simple_arm_settings_update_response(simple_arm_settings_update_response_read, simple_arm_settings_update_response_written) {
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> assert(simple_arm_settings_update_response_read.client_message_id[simple_arm_settings_update_response_at] == simple_arm_settings_update_response_written.client_message_id[simple_arm_settings_update_response_at]); simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 4 -> assert(simple_arm_settings_update_response_read.mpid[simple_arm_settings_update_response_at] == simple_arm_settings_update_response_written.mpid[simple_arm_settings_update_response_at]); simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  simple_arm_settings_update_response_at = 0;
  do
  :: simple_arm_settings_update_response_at < 11 -> assert(simple_arm_settings_update_response_read.underlying_symbol[simple_arm_settings_update_response_at] == simple_arm_settings_update_response_written.underlying_symbol[simple_arm_settings_update_response_at]); simple_arm_settings_update_response_at = simple_arm_settings_update_response_at + 1
  :: else -> break
  od;
  assert(simple_arm_settings_update_response_read.arm_settings_update_status == simple_arm_settings_update_response_written.arm_settings_update_status);
  skip
}

/* ---- Arm 2 Underlying Level Protection Settings Update Request: 28 bytes ----- */

/* Firms can use this message format to set up their ARM2 Underlying Level protection settings for each session. Changes to these settings can be made throughout the day. */
typedef Arm2UnderlyingLevelProtectionSettingsUpdateRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte action;
  byte underlying_symbol[11];
  byte arm_threshold_count_binary_u_4[4];
  byte counting_period_binary_u_4[4]
};

int arm2_underlying_level_protection_settings_update_request_at;

/* every byte of Arm 2 Underlying Level Protection Settings Update Request set to one value */
inline fill_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_record, arm2_underlying_level_protection_settings_update_request_value) {
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.client_message_id[arm2_underlying_level_protection_settings_update_request_at] = arm2_underlying_level_protection_settings_update_request_value; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.mpid[arm2_underlying_level_protection_settings_update_request_at] = arm2_underlying_level_protection_settings_update_request_value; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_record.action = arm2_underlying_level_protection_settings_update_request_value;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 11 -> arm2_underlying_level_protection_settings_update_request_record.underlying_symbol[arm2_underlying_level_protection_settings_update_request_at] = arm2_underlying_level_protection_settings_update_request_value; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] = arm2_underlying_level_protection_settings_update_request_value; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] = arm2_underlying_level_protection_settings_update_request_value; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Arm 2 Underlying Level Protection Settings Update Request set to where it lies, so a field read out of place says so */
inline ramp_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_record, arm2_underlying_level_protection_settings_update_request_base) {
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.client_message_id[arm2_underlying_level_protection_settings_update_request_at] = (arm2_underlying_level_protection_settings_update_request_base + 0 + arm2_underlying_level_protection_settings_update_request_at + 1) % 256; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.mpid[arm2_underlying_level_protection_settings_update_request_at] = (arm2_underlying_level_protection_settings_update_request_base + 4 + arm2_underlying_level_protection_settings_update_request_at + 1) % 256; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_record.action = (arm2_underlying_level_protection_settings_update_request_base + 8 + 1) % 256;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 11 -> arm2_underlying_level_protection_settings_update_request_record.underlying_symbol[arm2_underlying_level_protection_settings_update_request_at] = (arm2_underlying_level_protection_settings_update_request_base + 9 + arm2_underlying_level_protection_settings_update_request_at + 1) % 256; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] = (arm2_underlying_level_protection_settings_update_request_base + 20 + arm2_underlying_level_protection_settings_update_request_at + 1) % 256; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] = (arm2_underlying_level_protection_settings_update_request_base + 24 + arm2_underlying_level_protection_settings_update_request_at + 1) % 256; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Underlying Level Protection Settings Update Request to the wire, 28 bytes from where the cursor stands */
inline encode_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_record) {
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_update_request_record.client_message_id[arm2_underlying_level_protection_settings_update_request_at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_update_request_record.mpid[arm2_underlying_level_protection_settings_update_request_at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  wire[at] = arm2_underlying_level_protection_settings_update_request_record.action; at = at + 1;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 11 -> wire[at] = arm2_underlying_level_protection_settings_update_request_record.underlying_symbol[arm2_underlying_level_protection_settings_update_request_at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_update_request_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_update_request_at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_update_request_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_update_request_at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* Arm 2 Underlying Level Protection Settings Update Request off the wire, 28 bytes from where the cursor stands */
inline decode_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_record) {
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.client_message_id[arm2_underlying_level_protection_settings_update_request_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.mpid[arm2_underlying_level_protection_settings_update_request_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_record.action = wire[at]; at = at + 1;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 11 -> arm2_underlying_level_protection_settings_update_request_record.underlying_symbol[arm2_underlying_level_protection_settings_update_request_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> arm2_underlying_level_protection_settings_update_request_record.counting_period_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Arm 2 Underlying Level Protection Settings Update Request is what was written, byte for byte */
inline equal_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_read, arm2_underlying_level_protection_settings_update_request_written) {
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> assert(arm2_underlying_level_protection_settings_update_request_read.client_message_id[arm2_underlying_level_protection_settings_update_request_at] == arm2_underlying_level_protection_settings_update_request_written.client_message_id[arm2_underlying_level_protection_settings_update_request_at]); arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> assert(arm2_underlying_level_protection_settings_update_request_read.mpid[arm2_underlying_level_protection_settings_update_request_at] == arm2_underlying_level_protection_settings_update_request_written.mpid[arm2_underlying_level_protection_settings_update_request_at]); arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  assert(arm2_underlying_level_protection_settings_update_request_read.action == arm2_underlying_level_protection_settings_update_request_written.action);
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 11 -> assert(arm2_underlying_level_protection_settings_update_request_read.underlying_symbol[arm2_underlying_level_protection_settings_update_request_at] == arm2_underlying_level_protection_settings_update_request_written.underlying_symbol[arm2_underlying_level_protection_settings_update_request_at]); arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> assert(arm2_underlying_level_protection_settings_update_request_read.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] == arm2_underlying_level_protection_settings_update_request_written.arm_threshold_count_binary_u_4[arm2_underlying_level_protection_settings_update_request_at]); arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_request_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_request_at < 4 -> assert(arm2_underlying_level_protection_settings_update_request_read.counting_period_binary_u_4[arm2_underlying_level_protection_settings_update_request_at] == arm2_underlying_level_protection_settings_update_request_written.counting_period_binary_u_4[arm2_underlying_level_protection_settings_update_request_at]); arm2_underlying_level_protection_settings_update_request_at = arm2_underlying_level_protection_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm 2 Underlying Level Protection Settings Update Response: 20 bytes ---- */

/* MIAX uses this format to respond to the firm with a status of their ARM2 Underlying level protection Settings Update Request. */
typedef Arm2UnderlyingLevelProtectionSettingsUpdateResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11];
  byte arm_settings_update_status
};

int arm2_underlying_level_protection_settings_update_response_at;

/* every byte of Arm 2 Underlying Level Protection Settings Update Response set to one value */
inline fill_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_record, arm2_underlying_level_protection_settings_update_response_value) {
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> arm2_underlying_level_protection_settings_update_response_record.client_message_id[arm2_underlying_level_protection_settings_update_response_at] = arm2_underlying_level_protection_settings_update_response_value; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> arm2_underlying_level_protection_settings_update_response_record.mpid[arm2_underlying_level_protection_settings_update_response_at] = arm2_underlying_level_protection_settings_update_response_value; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 11 -> arm2_underlying_level_protection_settings_update_response_record.underlying_symbol[arm2_underlying_level_protection_settings_update_response_at] = arm2_underlying_level_protection_settings_update_response_value; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_record.arm_settings_update_status = arm2_underlying_level_protection_settings_update_response_value;
  skip
}

/* each byte of Arm 2 Underlying Level Protection Settings Update Response set to where it lies, so a field read out of place says so */
inline ramp_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_record, arm2_underlying_level_protection_settings_update_response_base) {
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> arm2_underlying_level_protection_settings_update_response_record.client_message_id[arm2_underlying_level_protection_settings_update_response_at] = (arm2_underlying_level_protection_settings_update_response_base + 0 + arm2_underlying_level_protection_settings_update_response_at + 1) % 256; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> arm2_underlying_level_protection_settings_update_response_record.mpid[arm2_underlying_level_protection_settings_update_response_at] = (arm2_underlying_level_protection_settings_update_response_base + 4 + arm2_underlying_level_protection_settings_update_response_at + 1) % 256; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 11 -> arm2_underlying_level_protection_settings_update_response_record.underlying_symbol[arm2_underlying_level_protection_settings_update_response_at] = (arm2_underlying_level_protection_settings_update_response_base + 8 + arm2_underlying_level_protection_settings_update_response_at + 1) % 256; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_record.arm_settings_update_status = (arm2_underlying_level_protection_settings_update_response_base + 19 + 1) % 256;
  skip
}

/* Arm 2 Underlying Level Protection Settings Update Response to the wire, 20 bytes from where the cursor stands */
inline encode_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_record) {
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_update_response_record.client_message_id[arm2_underlying_level_protection_settings_update_response_at]; at = at + 1; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> wire[at] = arm2_underlying_level_protection_settings_update_response_record.mpid[arm2_underlying_level_protection_settings_update_response_at]; at = at + 1; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 11 -> wire[at] = arm2_underlying_level_protection_settings_update_response_record.underlying_symbol[arm2_underlying_level_protection_settings_update_response_at]; at = at + 1; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  wire[at] = arm2_underlying_level_protection_settings_update_response_record.arm_settings_update_status; at = at + 1;
  skip
}

/* Arm 2 Underlying Level Protection Settings Update Response off the wire, 20 bytes from where the cursor stands */
inline decode_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_record) {
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> arm2_underlying_level_protection_settings_update_response_record.client_message_id[arm2_underlying_level_protection_settings_update_response_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> arm2_underlying_level_protection_settings_update_response_record.mpid[arm2_underlying_level_protection_settings_update_response_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 11 -> arm2_underlying_level_protection_settings_update_response_record.underlying_symbol[arm2_underlying_level_protection_settings_update_response_at] = wire[at]; at = at + 1; arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_record.arm_settings_update_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Arm 2 Underlying Level Protection Settings Update Response is what was written, byte for byte */
inline equal_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_read, arm2_underlying_level_protection_settings_update_response_written) {
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> assert(arm2_underlying_level_protection_settings_update_response_read.client_message_id[arm2_underlying_level_protection_settings_update_response_at] == arm2_underlying_level_protection_settings_update_response_written.client_message_id[arm2_underlying_level_protection_settings_update_response_at]); arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 4 -> assert(arm2_underlying_level_protection_settings_update_response_read.mpid[arm2_underlying_level_protection_settings_update_response_at] == arm2_underlying_level_protection_settings_update_response_written.mpid[arm2_underlying_level_protection_settings_update_response_at]); arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  arm2_underlying_level_protection_settings_update_response_at = 0;
  do
  :: arm2_underlying_level_protection_settings_update_response_at < 11 -> assert(arm2_underlying_level_protection_settings_update_response_read.underlying_symbol[arm2_underlying_level_protection_settings_update_response_at] == arm2_underlying_level_protection_settings_update_response_written.underlying_symbol[arm2_underlying_level_protection_settings_update_response_at]); arm2_underlying_level_protection_settings_update_response_at = arm2_underlying_level_protection_settings_update_response_at + 1
  :: else -> break
  od;
  assert(arm2_underlying_level_protection_settings_update_response_read.arm_settings_update_status == arm2_underlying_level_protection_settings_update_response_written.arm_settings_update_status);
  skip
}

/* ---- Simple Enhanced Quote E Quote Message: 43 bytes ------------------------- */

/* This is the format for an eQuote message that can be sent either to match with orders and quotes on the MIAX book or when responding to a liquidity seeking event. */
typedef SimpleEnhancedQuoteEQuoteMessage {
  byte client_message_id[4];
  byte mpid[4];
  byte client_send_time[8];
  byte product_id[4];
  byte e_quote_action;
  byte e_quote_type;
  byte event_id[4];
  byte target_message_id[4];
  byte price_binary_prc_4u_4[4];
  byte size[4];
  byte side;
  byte reserved_4[4]
};

int simple_enhanced_quote_e_quote_message_at;

/* every byte of Simple Enhanced Quote E Quote Message set to one value */
inline fill_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_record, simple_enhanced_quote_e_quote_message_value) {
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.client_message_id[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.mpid[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 8 -> simple_enhanced_quote_e_quote_message_record.client_send_time[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.product_id[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_record.e_quote_action = simple_enhanced_quote_e_quote_message_value;
  simple_enhanced_quote_e_quote_message_record.e_quote_type = simple_enhanced_quote_e_quote_message_value;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.event_id[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.target_message_id[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.price_binary_prc_4u_4[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.size[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_record.side = simple_enhanced_quote_e_quote_message_value;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.reserved_4[simple_enhanced_quote_e_quote_message_at] = simple_enhanced_quote_e_quote_message_value; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Enhanced Quote E Quote Message set to where it lies, so a field read out of place says so */
inline ramp_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_record, simple_enhanced_quote_e_quote_message_base) {
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.client_message_id[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 0 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.mpid[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 4 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 8 -> simple_enhanced_quote_e_quote_message_record.client_send_time[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 8 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.product_id[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 16 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_record.e_quote_action = (simple_enhanced_quote_e_quote_message_base + 20 + 1) % 256;
  simple_enhanced_quote_e_quote_message_record.e_quote_type = (simple_enhanced_quote_e_quote_message_base + 21 + 1) % 256;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.event_id[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 22 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.target_message_id[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 26 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.price_binary_prc_4u_4[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 30 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.size[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 34 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_record.side = (simple_enhanced_quote_e_quote_message_base + 38 + 1) % 256;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.reserved_4[simple_enhanced_quote_e_quote_message_at] = (simple_enhanced_quote_e_quote_message_base + 39 + simple_enhanced_quote_e_quote_message_at + 1) % 256; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Enhanced Quote E Quote Message to the wire, 43 bytes from where the cursor stands */
inline encode_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_record) {
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.client_message_id[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.mpid[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 8 -> wire[at] = simple_enhanced_quote_e_quote_message_record.client_send_time[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.product_id[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_enhanced_quote_e_quote_message_record.e_quote_action; at = at + 1;
  wire[at] = simple_enhanced_quote_e_quote_message_record.e_quote_type; at = at + 1;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.event_id[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.target_message_id[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.price_binary_prc_4u_4[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.size[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_enhanced_quote_e_quote_message_record.side; at = at + 1;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> wire[at] = simple_enhanced_quote_e_quote_message_record.reserved_4[simple_enhanced_quote_e_quote_message_at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Enhanced Quote E Quote Message off the wire, 43 bytes from where the cursor stands */
inline decode_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_record) {
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.client_message_id[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.mpid[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 8 -> simple_enhanced_quote_e_quote_message_record.client_send_time[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.product_id[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_record.e_quote_action = wire[at]; at = at + 1;
  simple_enhanced_quote_e_quote_message_record.e_quote_type = wire[at]; at = at + 1;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.event_id[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.target_message_id[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.price_binary_prc_4u_4[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.size[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_record.side = wire[at]; at = at + 1;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> simple_enhanced_quote_e_quote_message_record.reserved_4[simple_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Enhanced Quote E Quote Message is what was written, byte for byte */
inline equal_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_read, simple_enhanced_quote_e_quote_message_written) {
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.client_message_id[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.client_message_id[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.mpid[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.mpid[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 8 -> assert(simple_enhanced_quote_e_quote_message_read.client_send_time[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.client_send_time[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.product_id[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.product_id[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  assert(simple_enhanced_quote_e_quote_message_read.e_quote_action == simple_enhanced_quote_e_quote_message_written.e_quote_action);
  assert(simple_enhanced_quote_e_quote_message_read.e_quote_type == simple_enhanced_quote_e_quote_message_written.e_quote_type);
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.event_id[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.event_id[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.target_message_id[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.target_message_id[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.price_binary_prc_4u_4[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.price_binary_prc_4u_4[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.size[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.size[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  assert(simple_enhanced_quote_e_quote_message_read.side == simple_enhanced_quote_e_quote_message_written.side);
  simple_enhanced_quote_e_quote_message_at = 0;
  do
  :: simple_enhanced_quote_e_quote_message_at < 4 -> assert(simple_enhanced_quote_e_quote_message_read.reserved_4[simple_enhanced_quote_e_quote_message_at] == simple_enhanced_quote_e_quote_message_written.reserved_4[simple_enhanced_quote_e_quote_message_at]); simple_enhanced_quote_e_quote_message_at = simple_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Enhanced Quote E Quote Message: 59 bytes ------------------------ */

/* This is the format for a Complex eQuote message that can be sent either to match with complex book or when responding to a complex auction liquidity seeking event. */
typedef ComplexEnhancedQuoteEQuoteMessage {
  byte client_message_id[4];
  byte mpid[4];
  byte client_send_time[8];
  byte strategy_id[4];
  byte e_quote_action;
  byte e_quote_type;
  byte complex_event_id[4];
  byte target_message_id[4];
  byte price_binary_prc_4s_8[8];
  byte size[4];
  byte side;
  byte stock_sell_short_indicator;
  byte reserved_15[15]
};

int complex_enhanced_quote_e_quote_message_at;

/* every byte of Complex Enhanced Quote E Quote Message set to one value */
inline fill_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_record, complex_enhanced_quote_e_quote_message_value) {
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.client_message_id[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.mpid[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> complex_enhanced_quote_e_quote_message_record.client_send_time[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.strategy_id[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_record.e_quote_action = complex_enhanced_quote_e_quote_message_value;
  complex_enhanced_quote_e_quote_message_record.e_quote_type = complex_enhanced_quote_e_quote_message_value;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.complex_event_id[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.target_message_id[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> complex_enhanced_quote_e_quote_message_record.price_binary_prc_4s_8[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.size[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_record.side = complex_enhanced_quote_e_quote_message_value;
  complex_enhanced_quote_e_quote_message_record.stock_sell_short_indicator = complex_enhanced_quote_e_quote_message_value;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 15 -> complex_enhanced_quote_e_quote_message_record.reserved_15[complex_enhanced_quote_e_quote_message_at] = complex_enhanced_quote_e_quote_message_value; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Enhanced Quote E Quote Message set to where it lies, so a field read out of place says so */
inline ramp_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_record, complex_enhanced_quote_e_quote_message_base) {
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.client_message_id[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 0 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.mpid[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 4 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> complex_enhanced_quote_e_quote_message_record.client_send_time[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 8 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.strategy_id[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 16 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_record.e_quote_action = (complex_enhanced_quote_e_quote_message_base + 20 + 1) % 256;
  complex_enhanced_quote_e_quote_message_record.e_quote_type = (complex_enhanced_quote_e_quote_message_base + 21 + 1) % 256;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.complex_event_id[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 22 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.target_message_id[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 26 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> complex_enhanced_quote_e_quote_message_record.price_binary_prc_4s_8[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 30 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.size[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 38 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_record.side = (complex_enhanced_quote_e_quote_message_base + 42 + 1) % 256;
  complex_enhanced_quote_e_quote_message_record.stock_sell_short_indicator = (complex_enhanced_quote_e_quote_message_base + 43 + 1) % 256;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 15 -> complex_enhanced_quote_e_quote_message_record.reserved_15[complex_enhanced_quote_e_quote_message_at] = (complex_enhanced_quote_e_quote_message_base + 44 + complex_enhanced_quote_e_quote_message_at + 1) % 256; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Enhanced Quote E Quote Message to the wire, 59 bytes from where the cursor stands */
inline encode_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_record) {
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_message_record.client_message_id[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_message_record.mpid[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> wire[at] = complex_enhanced_quote_e_quote_message_record.client_send_time[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_message_record.strategy_id[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_enhanced_quote_e_quote_message_record.e_quote_action; at = at + 1;
  wire[at] = complex_enhanced_quote_e_quote_message_record.e_quote_type; at = at + 1;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_message_record.complex_event_id[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_message_record.target_message_id[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> wire[at] = complex_enhanced_quote_e_quote_message_record.price_binary_prc_4s_8[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> wire[at] = complex_enhanced_quote_e_quote_message_record.size[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_enhanced_quote_e_quote_message_record.side; at = at + 1;
  wire[at] = complex_enhanced_quote_e_quote_message_record.stock_sell_short_indicator; at = at + 1;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 15 -> wire[at] = complex_enhanced_quote_e_quote_message_record.reserved_15[complex_enhanced_quote_e_quote_message_at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Enhanced Quote E Quote Message off the wire, 59 bytes from where the cursor stands */
inline decode_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_record) {
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.client_message_id[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.mpid[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> complex_enhanced_quote_e_quote_message_record.client_send_time[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.strategy_id[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_record.e_quote_action = wire[at]; at = at + 1;
  complex_enhanced_quote_e_quote_message_record.e_quote_type = wire[at]; at = at + 1;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.complex_event_id[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.target_message_id[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> complex_enhanced_quote_e_quote_message_record.price_binary_prc_4s_8[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> complex_enhanced_quote_e_quote_message_record.size[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_record.side = wire[at]; at = at + 1;
  complex_enhanced_quote_e_quote_message_record.stock_sell_short_indicator = wire[at]; at = at + 1;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 15 -> complex_enhanced_quote_e_quote_message_record.reserved_15[complex_enhanced_quote_e_quote_message_at] = wire[at]; at = at + 1; complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Enhanced Quote E Quote Message is what was written, byte for byte */
inline equal_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_read, complex_enhanced_quote_e_quote_message_written) {
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> assert(complex_enhanced_quote_e_quote_message_read.client_message_id[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.client_message_id[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> assert(complex_enhanced_quote_e_quote_message_read.mpid[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.mpid[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> assert(complex_enhanced_quote_e_quote_message_read.client_send_time[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.client_send_time[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> assert(complex_enhanced_quote_e_quote_message_read.strategy_id[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.strategy_id[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  assert(complex_enhanced_quote_e_quote_message_read.e_quote_action == complex_enhanced_quote_e_quote_message_written.e_quote_action);
  assert(complex_enhanced_quote_e_quote_message_read.e_quote_type == complex_enhanced_quote_e_quote_message_written.e_quote_type);
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> assert(complex_enhanced_quote_e_quote_message_read.complex_event_id[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.complex_event_id[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> assert(complex_enhanced_quote_e_quote_message_read.target_message_id[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.target_message_id[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 8 -> assert(complex_enhanced_quote_e_quote_message_read.price_binary_prc_4s_8[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.price_binary_prc_4s_8[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 4 -> assert(complex_enhanced_quote_e_quote_message_read.size[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.size[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  assert(complex_enhanced_quote_e_quote_message_read.side == complex_enhanced_quote_e_quote_message_written.side);
  assert(complex_enhanced_quote_e_quote_message_read.stock_sell_short_indicator == complex_enhanced_quote_e_quote_message_written.stock_sell_short_indicator);
  complex_enhanced_quote_e_quote_message_at = 0;
  do
  :: complex_enhanced_quote_e_quote_message_at < 15 -> assert(complex_enhanced_quote_e_quote_message_read.reserved_15[complex_enhanced_quote_e_quote_message_at] == complex_enhanced_quote_e_quote_message_written.reserved_15[complex_enhanced_quote_e_quote_message_at]); complex_enhanced_quote_e_quote_message_at = complex_enhanced_quote_e_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Mass Quote Cancel Request: 31 bytes ------------------------------ */

/* Firms can use this message format to request the cancelation of all simple quotes and eQuotes for an MPID, or all simple quotes and eQuotes for an MPID for all series for an underlying */
typedef SimpleMassQuoteCancelRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte client_send_time[8];
  byte underlying_symbol[11];
  byte reserved_4[4]
};

int simple_mass_quote_cancel_request_at;

/* every byte of Simple Mass Quote Cancel Request set to one value */
inline fill_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_record, simple_mass_quote_cancel_request_value) {
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.client_message_id[simple_mass_quote_cancel_request_at] = simple_mass_quote_cancel_request_value; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.mpid[simple_mass_quote_cancel_request_at] = simple_mass_quote_cancel_request_value; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 8 -> simple_mass_quote_cancel_request_record.client_send_time[simple_mass_quote_cancel_request_at] = simple_mass_quote_cancel_request_value; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 11 -> simple_mass_quote_cancel_request_record.underlying_symbol[simple_mass_quote_cancel_request_at] = simple_mass_quote_cancel_request_value; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.reserved_4[simple_mass_quote_cancel_request_at] = simple_mass_quote_cancel_request_value; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Mass Quote Cancel Request set to where it lies, so a field read out of place says so */
inline ramp_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_record, simple_mass_quote_cancel_request_base) {
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.client_message_id[simple_mass_quote_cancel_request_at] = (simple_mass_quote_cancel_request_base + 0 + simple_mass_quote_cancel_request_at + 1) % 256; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.mpid[simple_mass_quote_cancel_request_at] = (simple_mass_quote_cancel_request_base + 4 + simple_mass_quote_cancel_request_at + 1) % 256; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 8 -> simple_mass_quote_cancel_request_record.client_send_time[simple_mass_quote_cancel_request_at] = (simple_mass_quote_cancel_request_base + 8 + simple_mass_quote_cancel_request_at + 1) % 256; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 11 -> simple_mass_quote_cancel_request_record.underlying_symbol[simple_mass_quote_cancel_request_at] = (simple_mass_quote_cancel_request_base + 16 + simple_mass_quote_cancel_request_at + 1) % 256; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.reserved_4[simple_mass_quote_cancel_request_at] = (simple_mass_quote_cancel_request_base + 27 + simple_mass_quote_cancel_request_at + 1) % 256; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Mass Quote Cancel Request to the wire, 31 bytes from where the cursor stands */
inline encode_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_record) {
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> wire[at] = simple_mass_quote_cancel_request_record.client_message_id[simple_mass_quote_cancel_request_at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> wire[at] = simple_mass_quote_cancel_request_record.mpid[simple_mass_quote_cancel_request_at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 8 -> wire[at] = simple_mass_quote_cancel_request_record.client_send_time[simple_mass_quote_cancel_request_at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 11 -> wire[at] = simple_mass_quote_cancel_request_record.underlying_symbol[simple_mass_quote_cancel_request_at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> wire[at] = simple_mass_quote_cancel_request_record.reserved_4[simple_mass_quote_cancel_request_at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Mass Quote Cancel Request off the wire, 31 bytes from where the cursor stands */
inline decode_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_record) {
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.client_message_id[simple_mass_quote_cancel_request_at] = wire[at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.mpid[simple_mass_quote_cancel_request_at] = wire[at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 8 -> simple_mass_quote_cancel_request_record.client_send_time[simple_mass_quote_cancel_request_at] = wire[at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 11 -> simple_mass_quote_cancel_request_record.underlying_symbol[simple_mass_quote_cancel_request_at] = wire[at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> simple_mass_quote_cancel_request_record.reserved_4[simple_mass_quote_cancel_request_at] = wire[at]; at = at + 1; simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Mass Quote Cancel Request is what was written, byte for byte */
inline equal_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_read, simple_mass_quote_cancel_request_written) {
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> assert(simple_mass_quote_cancel_request_read.client_message_id[simple_mass_quote_cancel_request_at] == simple_mass_quote_cancel_request_written.client_message_id[simple_mass_quote_cancel_request_at]); simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> assert(simple_mass_quote_cancel_request_read.mpid[simple_mass_quote_cancel_request_at] == simple_mass_quote_cancel_request_written.mpid[simple_mass_quote_cancel_request_at]); simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 8 -> assert(simple_mass_quote_cancel_request_read.client_send_time[simple_mass_quote_cancel_request_at] == simple_mass_quote_cancel_request_written.client_send_time[simple_mass_quote_cancel_request_at]); simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 11 -> assert(simple_mass_quote_cancel_request_read.underlying_symbol[simple_mass_quote_cancel_request_at] == simple_mass_quote_cancel_request_written.underlying_symbol[simple_mass_quote_cancel_request_at]); simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_request_at = 0;
  do
  :: simple_mass_quote_cancel_request_at < 4 -> assert(simple_mass_quote_cancel_request_read.reserved_4[simple_mass_quote_cancel_request_at] == simple_mass_quote_cancel_request_written.reserved_4[simple_mass_quote_cancel_request_at]); simple_mass_quote_cancel_request_at = simple_mass_quote_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Mass Quote Cancel Response: 9 bytes ------------------------------ */

/* This message format will be used to inform the firm about the status of their previous simple mass quote cancel request. */
typedef SimpleMassQuoteCancelResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte simple_mass_quote_cancel_status
};

int simple_mass_quote_cancel_response_at;

/* every byte of Simple Mass Quote Cancel Response set to one value */
inline fill_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_record, simple_mass_quote_cancel_response_value) {
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> simple_mass_quote_cancel_response_record.client_message_id[simple_mass_quote_cancel_response_at] = simple_mass_quote_cancel_response_value; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> simple_mass_quote_cancel_response_record.mpid[simple_mass_quote_cancel_response_at] = simple_mass_quote_cancel_response_value; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_record.simple_mass_quote_cancel_status = simple_mass_quote_cancel_response_value;
  skip
}

/* each byte of Simple Mass Quote Cancel Response set to where it lies, so a field read out of place says so */
inline ramp_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_record, simple_mass_quote_cancel_response_base) {
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> simple_mass_quote_cancel_response_record.client_message_id[simple_mass_quote_cancel_response_at] = (simple_mass_quote_cancel_response_base + 0 + simple_mass_quote_cancel_response_at + 1) % 256; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> simple_mass_quote_cancel_response_record.mpid[simple_mass_quote_cancel_response_at] = (simple_mass_quote_cancel_response_base + 4 + simple_mass_quote_cancel_response_at + 1) % 256; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_record.simple_mass_quote_cancel_status = (simple_mass_quote_cancel_response_base + 8 + 1) % 256;
  skip
}

/* Simple Mass Quote Cancel Response to the wire, 9 bytes from where the cursor stands */
inline encode_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_record) {
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> wire[at] = simple_mass_quote_cancel_response_record.client_message_id[simple_mass_quote_cancel_response_at]; at = at + 1; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> wire[at] = simple_mass_quote_cancel_response_record.mpid[simple_mass_quote_cancel_response_at]; at = at + 1; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  wire[at] = simple_mass_quote_cancel_response_record.simple_mass_quote_cancel_status; at = at + 1;
  skip
}

/* Simple Mass Quote Cancel Response off the wire, 9 bytes from where the cursor stands */
inline decode_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_record) {
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> simple_mass_quote_cancel_response_record.client_message_id[simple_mass_quote_cancel_response_at] = wire[at]; at = at + 1; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> simple_mass_quote_cancel_response_record.mpid[simple_mass_quote_cancel_response_at] = wire[at]; at = at + 1; simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_record.simple_mass_quote_cancel_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Mass Quote Cancel Response is what was written, byte for byte */
inline equal_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_read, simple_mass_quote_cancel_response_written) {
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> assert(simple_mass_quote_cancel_response_read.client_message_id[simple_mass_quote_cancel_response_at] == simple_mass_quote_cancel_response_written.client_message_id[simple_mass_quote_cancel_response_at]); simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  simple_mass_quote_cancel_response_at = 0;
  do
  :: simple_mass_quote_cancel_response_at < 4 -> assert(simple_mass_quote_cancel_response_read.mpid[simple_mass_quote_cancel_response_at] == simple_mass_quote_cancel_response_written.mpid[simple_mass_quote_cancel_response_at]); simple_mass_quote_cancel_response_at = simple_mass_quote_cancel_response_at + 1
  :: else -> break
  od;
  assert(simple_mass_quote_cancel_response_read.simple_mass_quote_cancel_status == simple_mass_quote_cancel_response_written.simple_mass_quote_cancel_status);
  skip
}

/* ---- Mass Liquidity Cancel Request Simple And Complex: 37 bytes -------------- */

/* Firms can use this message format to request the cancelation of all simple quotes and simple/complex eQuotes for an MPID, or all simple quotes and simple/complex eQuotes for an MPID for all series and/or strategies for an underlying */
typedef MassLiquidityCancelRequestSimpleAndComplex {
  byte client_message_id[4];
  byte mpid[4];
  byte client_send_time[8];
  byte underlying_symbol[11];
  byte simple_mass_cancel;
  byte complex_mass_cancel;
  byte slap_codes;
  byte reserved_7[7]
};

int mass_liquidity_cancel_request_simple_and_complex_at;

/* every byte of Mass Liquidity Cancel Request Simple And Complex set to one value */
inline fill_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_record, mass_liquidity_cancel_request_simple_and_complex_value) {
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> mass_liquidity_cancel_request_simple_and_complex_record.client_message_id[mass_liquidity_cancel_request_simple_and_complex_at] = mass_liquidity_cancel_request_simple_and_complex_value; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> mass_liquidity_cancel_request_simple_and_complex_record.mpid[mass_liquidity_cancel_request_simple_and_complex_at] = mass_liquidity_cancel_request_simple_and_complex_value; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 8 -> mass_liquidity_cancel_request_simple_and_complex_record.client_send_time[mass_liquidity_cancel_request_simple_and_complex_at] = mass_liquidity_cancel_request_simple_and_complex_value; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 11 -> mass_liquidity_cancel_request_simple_and_complex_record.underlying_symbol[mass_liquidity_cancel_request_simple_and_complex_at] = mass_liquidity_cancel_request_simple_and_complex_value; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_record.simple_mass_cancel = mass_liquidity_cancel_request_simple_and_complex_value;
  mass_liquidity_cancel_request_simple_and_complex_record.complex_mass_cancel = mass_liquidity_cancel_request_simple_and_complex_value;
  mass_liquidity_cancel_request_simple_and_complex_record.slap_codes = mass_liquidity_cancel_request_simple_and_complex_value;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 7 -> mass_liquidity_cancel_request_simple_and_complex_record.reserved_7[mass_liquidity_cancel_request_simple_and_complex_at] = mass_liquidity_cancel_request_simple_and_complex_value; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Liquidity Cancel Request Simple And Complex set to where it lies, so a field read out of place says so */
inline ramp_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_record, mass_liquidity_cancel_request_simple_and_complex_base) {
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> mass_liquidity_cancel_request_simple_and_complex_record.client_message_id[mass_liquidity_cancel_request_simple_and_complex_at] = (mass_liquidity_cancel_request_simple_and_complex_base + 0 + mass_liquidity_cancel_request_simple_and_complex_at + 1) % 256; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> mass_liquidity_cancel_request_simple_and_complex_record.mpid[mass_liquidity_cancel_request_simple_and_complex_at] = (mass_liquidity_cancel_request_simple_and_complex_base + 4 + mass_liquidity_cancel_request_simple_and_complex_at + 1) % 256; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 8 -> mass_liquidity_cancel_request_simple_and_complex_record.client_send_time[mass_liquidity_cancel_request_simple_and_complex_at] = (mass_liquidity_cancel_request_simple_and_complex_base + 8 + mass_liquidity_cancel_request_simple_and_complex_at + 1) % 256; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 11 -> mass_liquidity_cancel_request_simple_and_complex_record.underlying_symbol[mass_liquidity_cancel_request_simple_and_complex_at] = (mass_liquidity_cancel_request_simple_and_complex_base + 16 + mass_liquidity_cancel_request_simple_and_complex_at + 1) % 256; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_record.simple_mass_cancel = (mass_liquidity_cancel_request_simple_and_complex_base + 27 + 1) % 256;
  mass_liquidity_cancel_request_simple_and_complex_record.complex_mass_cancel = (mass_liquidity_cancel_request_simple_and_complex_base + 28 + 1) % 256;
  mass_liquidity_cancel_request_simple_and_complex_record.slap_codes = (mass_liquidity_cancel_request_simple_and_complex_base + 29 + 1) % 256;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 7 -> mass_liquidity_cancel_request_simple_and_complex_record.reserved_7[mass_liquidity_cancel_request_simple_and_complex_at] = (mass_liquidity_cancel_request_simple_and_complex_base + 30 + mass_liquidity_cancel_request_simple_and_complex_at + 1) % 256; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Liquidity Cancel Request Simple And Complex to the wire, 37 bytes from where the cursor stands */
inline encode_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_record) {
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.client_message_id[mass_liquidity_cancel_request_simple_and_complex_at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.mpid[mass_liquidity_cancel_request_simple_and_complex_at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 8 -> wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.client_send_time[mass_liquidity_cancel_request_simple_and_complex_at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 11 -> wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.underlying_symbol[mass_liquidity_cancel_request_simple_and_complex_at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.simple_mass_cancel; at = at + 1;
  wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.complex_mass_cancel; at = at + 1;
  wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.slap_codes; at = at + 1;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 7 -> wire[at] = mass_liquidity_cancel_request_simple_and_complex_record.reserved_7[mass_liquidity_cancel_request_simple_and_complex_at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Liquidity Cancel Request Simple And Complex off the wire, 37 bytes from where the cursor stands */
inline decode_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_record) {
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> mass_liquidity_cancel_request_simple_and_complex_record.client_message_id[mass_liquidity_cancel_request_simple_and_complex_at] = wire[at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> mass_liquidity_cancel_request_simple_and_complex_record.mpid[mass_liquidity_cancel_request_simple_and_complex_at] = wire[at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 8 -> mass_liquidity_cancel_request_simple_and_complex_record.client_send_time[mass_liquidity_cancel_request_simple_and_complex_at] = wire[at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 11 -> mass_liquidity_cancel_request_simple_and_complex_record.underlying_symbol[mass_liquidity_cancel_request_simple_and_complex_at] = wire[at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_record.simple_mass_cancel = wire[at]; at = at + 1;
  mass_liquidity_cancel_request_simple_and_complex_record.complex_mass_cancel = wire[at]; at = at + 1;
  mass_liquidity_cancel_request_simple_and_complex_record.slap_codes = wire[at]; at = at + 1;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 7 -> mass_liquidity_cancel_request_simple_and_complex_record.reserved_7[mass_liquidity_cancel_request_simple_and_complex_at] = wire[at]; at = at + 1; mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Liquidity Cancel Request Simple And Complex is what was written, byte for byte */
inline equal_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_read, mass_liquidity_cancel_request_simple_and_complex_written) {
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> assert(mass_liquidity_cancel_request_simple_and_complex_read.client_message_id[mass_liquidity_cancel_request_simple_and_complex_at] == mass_liquidity_cancel_request_simple_and_complex_written.client_message_id[mass_liquidity_cancel_request_simple_and_complex_at]); mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 4 -> assert(mass_liquidity_cancel_request_simple_and_complex_read.mpid[mass_liquidity_cancel_request_simple_and_complex_at] == mass_liquidity_cancel_request_simple_and_complex_written.mpid[mass_liquidity_cancel_request_simple_and_complex_at]); mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 8 -> assert(mass_liquidity_cancel_request_simple_and_complex_read.client_send_time[mass_liquidity_cancel_request_simple_and_complex_at] == mass_liquidity_cancel_request_simple_and_complex_written.client_send_time[mass_liquidity_cancel_request_simple_and_complex_at]); mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 11 -> assert(mass_liquidity_cancel_request_simple_and_complex_read.underlying_symbol[mass_liquidity_cancel_request_simple_and_complex_at] == mass_liquidity_cancel_request_simple_and_complex_written.underlying_symbol[mass_liquidity_cancel_request_simple_and_complex_at]); mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  assert(mass_liquidity_cancel_request_simple_and_complex_read.simple_mass_cancel == mass_liquidity_cancel_request_simple_and_complex_written.simple_mass_cancel);
  assert(mass_liquidity_cancel_request_simple_and_complex_read.complex_mass_cancel == mass_liquidity_cancel_request_simple_and_complex_written.complex_mass_cancel);
  assert(mass_liquidity_cancel_request_simple_and_complex_read.slap_codes == mass_liquidity_cancel_request_simple_and_complex_written.slap_codes);
  mass_liquidity_cancel_request_simple_and_complex_at = 0;
  do
  :: mass_liquidity_cancel_request_simple_and_complex_at < 7 -> assert(mass_liquidity_cancel_request_simple_and_complex_read.reserved_7[mass_liquidity_cancel_request_simple_and_complex_at] == mass_liquidity_cancel_request_simple_and_complex_written.reserved_7[mass_liquidity_cancel_request_simple_and_complex_at]); mass_liquidity_cancel_request_simple_and_complex_at = mass_liquidity_cancel_request_simple_and_complex_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Liquidity Cancel Response: 10 bytes -------------------------------- */

/* This message format will be used to inform the firm about the status of their previous Mass Liquidity Cancel Request. */
typedef MassLiquidityCancelResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte simple_mass_liquidity_cancel_status;
  byte complex_mass_liquidity_cancel_status
};

int mass_liquidity_cancel_response_at;

/* every byte of Mass Liquidity Cancel Response set to one value */
inline fill_mass_liquidity_cancel_response(mass_liquidity_cancel_response_record, mass_liquidity_cancel_response_value) {
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> mass_liquidity_cancel_response_record.client_message_id[mass_liquidity_cancel_response_at] = mass_liquidity_cancel_response_value; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> mass_liquidity_cancel_response_record.mpid[mass_liquidity_cancel_response_at] = mass_liquidity_cancel_response_value; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_record.simple_mass_liquidity_cancel_status = mass_liquidity_cancel_response_value;
  mass_liquidity_cancel_response_record.complex_mass_liquidity_cancel_status = mass_liquidity_cancel_response_value;
  skip
}

/* each byte of Mass Liquidity Cancel Response set to where it lies, so a field read out of place says so */
inline ramp_mass_liquidity_cancel_response(mass_liquidity_cancel_response_record, mass_liquidity_cancel_response_base) {
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> mass_liquidity_cancel_response_record.client_message_id[mass_liquidity_cancel_response_at] = (mass_liquidity_cancel_response_base + 0 + mass_liquidity_cancel_response_at + 1) % 256; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> mass_liquidity_cancel_response_record.mpid[mass_liquidity_cancel_response_at] = (mass_liquidity_cancel_response_base + 4 + mass_liquidity_cancel_response_at + 1) % 256; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_record.simple_mass_liquidity_cancel_status = (mass_liquidity_cancel_response_base + 8 + 1) % 256;
  mass_liquidity_cancel_response_record.complex_mass_liquidity_cancel_status = (mass_liquidity_cancel_response_base + 9 + 1) % 256;
  skip
}

/* Mass Liquidity Cancel Response to the wire, 10 bytes from where the cursor stands */
inline encode_mass_liquidity_cancel_response(mass_liquidity_cancel_response_record) {
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> wire[at] = mass_liquidity_cancel_response_record.client_message_id[mass_liquidity_cancel_response_at]; at = at + 1; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> wire[at] = mass_liquidity_cancel_response_record.mpid[mass_liquidity_cancel_response_at]; at = at + 1; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  wire[at] = mass_liquidity_cancel_response_record.simple_mass_liquidity_cancel_status; at = at + 1;
  wire[at] = mass_liquidity_cancel_response_record.complex_mass_liquidity_cancel_status; at = at + 1;
  skip
}

/* Mass Liquidity Cancel Response off the wire, 10 bytes from where the cursor stands */
inline decode_mass_liquidity_cancel_response(mass_liquidity_cancel_response_record) {
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> mass_liquidity_cancel_response_record.client_message_id[mass_liquidity_cancel_response_at] = wire[at]; at = at + 1; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> mass_liquidity_cancel_response_record.mpid[mass_liquidity_cancel_response_at] = wire[at]; at = at + 1; mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_record.simple_mass_liquidity_cancel_status = wire[at]; at = at + 1;
  mass_liquidity_cancel_response_record.complex_mass_liquidity_cancel_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Liquidity Cancel Response is what was written, byte for byte */
inline equal_mass_liquidity_cancel_response(mass_liquidity_cancel_response_read, mass_liquidity_cancel_response_written) {
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> assert(mass_liquidity_cancel_response_read.client_message_id[mass_liquidity_cancel_response_at] == mass_liquidity_cancel_response_written.client_message_id[mass_liquidity_cancel_response_at]); mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  mass_liquidity_cancel_response_at = 0;
  do
  :: mass_liquidity_cancel_response_at < 4 -> assert(mass_liquidity_cancel_response_read.mpid[mass_liquidity_cancel_response_at] == mass_liquidity_cancel_response_written.mpid[mass_liquidity_cancel_response_at]); mass_liquidity_cancel_response_at = mass_liquidity_cancel_response_at + 1
  :: else -> break
  od;
  assert(mass_liquidity_cancel_response_read.simple_mass_liquidity_cancel_status == mass_liquidity_cancel_response_written.simple_mass_liquidity_cancel_status);
  assert(mass_liquidity_cancel_response_read.complex_mass_liquidity_cancel_status == mass_liquidity_cancel_response_written.complex_mass_liquidity_cancel_status);
  skip
}

/* ---- Simple Quote Protection Reset Request: 19 bytes ------------------------- */

/* Following a quote protection being engaged for a given MPID and underlying, firms must use this message format to reset their Quote Protection in order to start quoting for any option of the specified underlying. */
typedef SimpleQuoteProtectionResetRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11]
};

int simple_quote_protection_reset_request_at;

/* every byte of Simple Quote Protection Reset Request set to one value */
inline fill_simple_quote_protection_reset_request(simple_quote_protection_reset_request_record, simple_quote_protection_reset_request_value) {
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> simple_quote_protection_reset_request_record.client_message_id[simple_quote_protection_reset_request_at] = simple_quote_protection_reset_request_value; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> simple_quote_protection_reset_request_record.mpid[simple_quote_protection_reset_request_at] = simple_quote_protection_reset_request_value; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 11 -> simple_quote_protection_reset_request_record.underlying_symbol[simple_quote_protection_reset_request_at] = simple_quote_protection_reset_request_value; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Quote Protection Reset Request set to where it lies, so a field read out of place says so */
inline ramp_simple_quote_protection_reset_request(simple_quote_protection_reset_request_record, simple_quote_protection_reset_request_base) {
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> simple_quote_protection_reset_request_record.client_message_id[simple_quote_protection_reset_request_at] = (simple_quote_protection_reset_request_base + 0 + simple_quote_protection_reset_request_at + 1) % 256; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> simple_quote_protection_reset_request_record.mpid[simple_quote_protection_reset_request_at] = (simple_quote_protection_reset_request_base + 4 + simple_quote_protection_reset_request_at + 1) % 256; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 11 -> simple_quote_protection_reset_request_record.underlying_symbol[simple_quote_protection_reset_request_at] = (simple_quote_protection_reset_request_base + 8 + simple_quote_protection_reset_request_at + 1) % 256; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Quote Protection Reset Request to the wire, 19 bytes from where the cursor stands */
inline encode_simple_quote_protection_reset_request(simple_quote_protection_reset_request_record) {
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> wire[at] = simple_quote_protection_reset_request_record.client_message_id[simple_quote_protection_reset_request_at]; at = at + 1; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> wire[at] = simple_quote_protection_reset_request_record.mpid[simple_quote_protection_reset_request_at]; at = at + 1; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 11 -> wire[at] = simple_quote_protection_reset_request_record.underlying_symbol[simple_quote_protection_reset_request_at]; at = at + 1; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Quote Protection Reset Request off the wire, 19 bytes from where the cursor stands */
inline decode_simple_quote_protection_reset_request(simple_quote_protection_reset_request_record) {
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> simple_quote_protection_reset_request_record.client_message_id[simple_quote_protection_reset_request_at] = wire[at]; at = at + 1; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> simple_quote_protection_reset_request_record.mpid[simple_quote_protection_reset_request_at] = wire[at]; at = at + 1; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 11 -> simple_quote_protection_reset_request_record.underlying_symbol[simple_quote_protection_reset_request_at] = wire[at]; at = at + 1; simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Quote Protection Reset Request is what was written, byte for byte */
inline equal_simple_quote_protection_reset_request(simple_quote_protection_reset_request_read, simple_quote_protection_reset_request_written) {
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> assert(simple_quote_protection_reset_request_read.client_message_id[simple_quote_protection_reset_request_at] == simple_quote_protection_reset_request_written.client_message_id[simple_quote_protection_reset_request_at]); simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 4 -> assert(simple_quote_protection_reset_request_read.mpid[simple_quote_protection_reset_request_at] == simple_quote_protection_reset_request_written.mpid[simple_quote_protection_reset_request_at]); simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_request_at = 0;
  do
  :: simple_quote_protection_reset_request_at < 11 -> assert(simple_quote_protection_reset_request_read.underlying_symbol[simple_quote_protection_reset_request_at] == simple_quote_protection_reset_request_written.underlying_symbol[simple_quote_protection_reset_request_at]); simple_quote_protection_reset_request_at = simple_quote_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Simple Quote Protection Reset Response: 9 bytes ------------------------- */

/* This message format is used to inform the firms of the status of their Simple Quote Protection Reset Request. */
typedef SimpleQuoteProtectionResetResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte quote_protection_reset_status
};

int simple_quote_protection_reset_response_at;

/* every byte of Simple Quote Protection Reset Response set to one value */
inline fill_simple_quote_protection_reset_response(simple_quote_protection_reset_response_record, simple_quote_protection_reset_response_value) {
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> simple_quote_protection_reset_response_record.client_message_id[simple_quote_protection_reset_response_at] = simple_quote_protection_reset_response_value; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> simple_quote_protection_reset_response_record.mpid[simple_quote_protection_reset_response_at] = simple_quote_protection_reset_response_value; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_record.quote_protection_reset_status = simple_quote_protection_reset_response_value;
  skip
}

/* each byte of Simple Quote Protection Reset Response set to where it lies, so a field read out of place says so */
inline ramp_simple_quote_protection_reset_response(simple_quote_protection_reset_response_record, simple_quote_protection_reset_response_base) {
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> simple_quote_protection_reset_response_record.client_message_id[simple_quote_protection_reset_response_at] = (simple_quote_protection_reset_response_base + 0 + simple_quote_protection_reset_response_at + 1) % 256; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> simple_quote_protection_reset_response_record.mpid[simple_quote_protection_reset_response_at] = (simple_quote_protection_reset_response_base + 4 + simple_quote_protection_reset_response_at + 1) % 256; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_record.quote_protection_reset_status = (simple_quote_protection_reset_response_base + 8 + 1) % 256;
  skip
}

/* Simple Quote Protection Reset Response to the wire, 9 bytes from where the cursor stands */
inline encode_simple_quote_protection_reset_response(simple_quote_protection_reset_response_record) {
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> wire[at] = simple_quote_protection_reset_response_record.client_message_id[simple_quote_protection_reset_response_at]; at = at + 1; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> wire[at] = simple_quote_protection_reset_response_record.mpid[simple_quote_protection_reset_response_at]; at = at + 1; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  wire[at] = simple_quote_protection_reset_response_record.quote_protection_reset_status; at = at + 1;
  skip
}

/* Simple Quote Protection Reset Response off the wire, 9 bytes from where the cursor stands */
inline decode_simple_quote_protection_reset_response(simple_quote_protection_reset_response_record) {
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> simple_quote_protection_reset_response_record.client_message_id[simple_quote_protection_reset_response_at] = wire[at]; at = at + 1; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> simple_quote_protection_reset_response_record.mpid[simple_quote_protection_reset_response_at] = wire[at]; at = at + 1; simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_record.quote_protection_reset_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Quote Protection Reset Response is what was written, byte for byte */
inline equal_simple_quote_protection_reset_response(simple_quote_protection_reset_response_read, simple_quote_protection_reset_response_written) {
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> assert(simple_quote_protection_reset_response_read.client_message_id[simple_quote_protection_reset_response_at] == simple_quote_protection_reset_response_written.client_message_id[simple_quote_protection_reset_response_at]); simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  simple_quote_protection_reset_response_at = 0;
  do
  :: simple_quote_protection_reset_response_at < 4 -> assert(simple_quote_protection_reset_response_read.mpid[simple_quote_protection_reset_response_at] == simple_quote_protection_reset_response_written.mpid[simple_quote_protection_reset_response_at]); simple_quote_protection_reset_response_at = simple_quote_protection_reset_response_at + 1
  :: else -> break
  od;
  assert(simple_quote_protection_reset_response_read.quote_protection_reset_status == simple_quote_protection_reset_response_written.quote_protection_reset_status);
  skip
}

/* ---- Liquidity Protection Reset Request: 29 bytes ---------------------------- */

/* Following a quote protection being engaged for a given MPID and underlying, firms must use this message format to reset their Complex Liquidity Protection and/or Simple Liquidity Protection in order to start submitting new simple or complex liquidities for any strategy of the specified underlying and/or products of the specified underlying. */
typedef LiquidityProtectionResetRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11];
  byte simple_liquidity_reset;
  byte complex_liquidity_reset;
  byte slap_codes;
  byte reserved_7[7]
};

int liquidity_protection_reset_request_at;

/* every byte of Liquidity Protection Reset Request set to one value */
inline fill_liquidity_protection_reset_request(liquidity_protection_reset_request_record, liquidity_protection_reset_request_value) {
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> liquidity_protection_reset_request_record.client_message_id[liquidity_protection_reset_request_at] = liquidity_protection_reset_request_value; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> liquidity_protection_reset_request_record.mpid[liquidity_protection_reset_request_at] = liquidity_protection_reset_request_value; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 11 -> liquidity_protection_reset_request_record.underlying_symbol[liquidity_protection_reset_request_at] = liquidity_protection_reset_request_value; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_record.simple_liquidity_reset = liquidity_protection_reset_request_value;
  liquidity_protection_reset_request_record.complex_liquidity_reset = liquidity_protection_reset_request_value;
  liquidity_protection_reset_request_record.slap_codes = liquidity_protection_reset_request_value;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 7 -> liquidity_protection_reset_request_record.reserved_7[liquidity_protection_reset_request_at] = liquidity_protection_reset_request_value; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Liquidity Protection Reset Request set to where it lies, so a field read out of place says so */
inline ramp_liquidity_protection_reset_request(liquidity_protection_reset_request_record, liquidity_protection_reset_request_base) {
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> liquidity_protection_reset_request_record.client_message_id[liquidity_protection_reset_request_at] = (liquidity_protection_reset_request_base + 0 + liquidity_protection_reset_request_at + 1) % 256; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> liquidity_protection_reset_request_record.mpid[liquidity_protection_reset_request_at] = (liquidity_protection_reset_request_base + 4 + liquidity_protection_reset_request_at + 1) % 256; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 11 -> liquidity_protection_reset_request_record.underlying_symbol[liquidity_protection_reset_request_at] = (liquidity_protection_reset_request_base + 8 + liquidity_protection_reset_request_at + 1) % 256; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_record.simple_liquidity_reset = (liquidity_protection_reset_request_base + 19 + 1) % 256;
  liquidity_protection_reset_request_record.complex_liquidity_reset = (liquidity_protection_reset_request_base + 20 + 1) % 256;
  liquidity_protection_reset_request_record.slap_codes = (liquidity_protection_reset_request_base + 21 + 1) % 256;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 7 -> liquidity_protection_reset_request_record.reserved_7[liquidity_protection_reset_request_at] = (liquidity_protection_reset_request_base + 22 + liquidity_protection_reset_request_at + 1) % 256; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Protection Reset Request to the wire, 29 bytes from where the cursor stands */
inline encode_liquidity_protection_reset_request(liquidity_protection_reset_request_record) {
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> wire[at] = liquidity_protection_reset_request_record.client_message_id[liquidity_protection_reset_request_at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> wire[at] = liquidity_protection_reset_request_record.mpid[liquidity_protection_reset_request_at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 11 -> wire[at] = liquidity_protection_reset_request_record.underlying_symbol[liquidity_protection_reset_request_at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_protection_reset_request_record.simple_liquidity_reset; at = at + 1;
  wire[at] = liquidity_protection_reset_request_record.complex_liquidity_reset; at = at + 1;
  wire[at] = liquidity_protection_reset_request_record.slap_codes; at = at + 1;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 7 -> wire[at] = liquidity_protection_reset_request_record.reserved_7[liquidity_protection_reset_request_at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Protection Reset Request off the wire, 29 bytes from where the cursor stands */
inline decode_liquidity_protection_reset_request(liquidity_protection_reset_request_record) {
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> liquidity_protection_reset_request_record.client_message_id[liquidity_protection_reset_request_at] = wire[at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> liquidity_protection_reset_request_record.mpid[liquidity_protection_reset_request_at] = wire[at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 11 -> liquidity_protection_reset_request_record.underlying_symbol[liquidity_protection_reset_request_at] = wire[at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_record.simple_liquidity_reset = wire[at]; at = at + 1;
  liquidity_protection_reset_request_record.complex_liquidity_reset = wire[at]; at = at + 1;
  liquidity_protection_reset_request_record.slap_codes = wire[at]; at = at + 1;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 7 -> liquidity_protection_reset_request_record.reserved_7[liquidity_protection_reset_request_at] = wire[at]; at = at + 1; liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Liquidity Protection Reset Request is what was written, byte for byte */
inline equal_liquidity_protection_reset_request(liquidity_protection_reset_request_read, liquidity_protection_reset_request_written) {
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> assert(liquidity_protection_reset_request_read.client_message_id[liquidity_protection_reset_request_at] == liquidity_protection_reset_request_written.client_message_id[liquidity_protection_reset_request_at]); liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 4 -> assert(liquidity_protection_reset_request_read.mpid[liquidity_protection_reset_request_at] == liquidity_protection_reset_request_written.mpid[liquidity_protection_reset_request_at]); liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 11 -> assert(liquidity_protection_reset_request_read.underlying_symbol[liquidity_protection_reset_request_at] == liquidity_protection_reset_request_written.underlying_symbol[liquidity_protection_reset_request_at]); liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  assert(liquidity_protection_reset_request_read.simple_liquidity_reset == liquidity_protection_reset_request_written.simple_liquidity_reset);
  assert(liquidity_protection_reset_request_read.complex_liquidity_reset == liquidity_protection_reset_request_written.complex_liquidity_reset);
  assert(liquidity_protection_reset_request_read.slap_codes == liquidity_protection_reset_request_written.slap_codes);
  liquidity_protection_reset_request_at = 0;
  do
  :: liquidity_protection_reset_request_at < 7 -> assert(liquidity_protection_reset_request_read.reserved_7[liquidity_protection_reset_request_at] == liquidity_protection_reset_request_written.reserved_7[liquidity_protection_reset_request_at]); liquidity_protection_reset_request_at = liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Liquidity Protection Reset Response: 10 bytes --------------------------- */

/* Response to the Liquidity Protection Reset Request */
typedef LiquidityProtectionResetResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte simple_liquidity_protection_reset_status;
  byte complex_liquidity_protection_reset_status
};

int liquidity_protection_reset_response_at;

/* every byte of Liquidity Protection Reset Response set to one value */
inline fill_liquidity_protection_reset_response(liquidity_protection_reset_response_record, liquidity_protection_reset_response_value) {
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> liquidity_protection_reset_response_record.client_message_id[liquidity_protection_reset_response_at] = liquidity_protection_reset_response_value; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> liquidity_protection_reset_response_record.mpid[liquidity_protection_reset_response_at] = liquidity_protection_reset_response_value; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_record.simple_liquidity_protection_reset_status = liquidity_protection_reset_response_value;
  liquidity_protection_reset_response_record.complex_liquidity_protection_reset_status = liquidity_protection_reset_response_value;
  skip
}

/* each byte of Liquidity Protection Reset Response set to where it lies, so a field read out of place says so */
inline ramp_liquidity_protection_reset_response(liquidity_protection_reset_response_record, liquidity_protection_reset_response_base) {
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> liquidity_protection_reset_response_record.client_message_id[liquidity_protection_reset_response_at] = (liquidity_protection_reset_response_base + 0 + liquidity_protection_reset_response_at + 1) % 256; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> liquidity_protection_reset_response_record.mpid[liquidity_protection_reset_response_at] = (liquidity_protection_reset_response_base + 4 + liquidity_protection_reset_response_at + 1) % 256; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_record.simple_liquidity_protection_reset_status = (liquidity_protection_reset_response_base + 8 + 1) % 256;
  liquidity_protection_reset_response_record.complex_liquidity_protection_reset_status = (liquidity_protection_reset_response_base + 9 + 1) % 256;
  skip
}

/* Liquidity Protection Reset Response to the wire, 10 bytes from where the cursor stands */
inline encode_liquidity_protection_reset_response(liquidity_protection_reset_response_record) {
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> wire[at] = liquidity_protection_reset_response_record.client_message_id[liquidity_protection_reset_response_at]; at = at + 1; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> wire[at] = liquidity_protection_reset_response_record.mpid[liquidity_protection_reset_response_at]; at = at + 1; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_protection_reset_response_record.simple_liquidity_protection_reset_status; at = at + 1;
  wire[at] = liquidity_protection_reset_response_record.complex_liquidity_protection_reset_status; at = at + 1;
  skip
}

/* Liquidity Protection Reset Response off the wire, 10 bytes from where the cursor stands */
inline decode_liquidity_protection_reset_response(liquidity_protection_reset_response_record) {
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> liquidity_protection_reset_response_record.client_message_id[liquidity_protection_reset_response_at] = wire[at]; at = at + 1; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> liquidity_protection_reset_response_record.mpid[liquidity_protection_reset_response_at] = wire[at]; at = at + 1; liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_record.simple_liquidity_protection_reset_status = wire[at]; at = at + 1;
  liquidity_protection_reset_response_record.complex_liquidity_protection_reset_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Liquidity Protection Reset Response is what was written, byte for byte */
inline equal_liquidity_protection_reset_response(liquidity_protection_reset_response_read, liquidity_protection_reset_response_written) {
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> assert(liquidity_protection_reset_response_read.client_message_id[liquidity_protection_reset_response_at] == liquidity_protection_reset_response_written.client_message_id[liquidity_protection_reset_response_at]); liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  liquidity_protection_reset_response_at = 0;
  do
  :: liquidity_protection_reset_response_at < 4 -> assert(liquidity_protection_reset_response_read.mpid[liquidity_protection_reset_response_at] == liquidity_protection_reset_response_written.mpid[liquidity_protection_reset_response_at]); liquidity_protection_reset_response_at = liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  assert(liquidity_protection_reset_response_read.simple_liquidity_protection_reset_status == liquidity_protection_reset_response_written.simple_liquidity_protection_reset_status);
  assert(liquidity_protection_reset_response_read.complex_liquidity_protection_reset_status == liquidity_protection_reset_response_written.complex_liquidity_protection_reset_status);
  skip
}

/* ---- Single Side Liquidity Protection Reset Request: 18 bytes ---------------- */

/* Request to reset Single Side Liquidity Protection for the specific Option or Complex Strategy. */
typedef SingleSideLiquidityProtectionResetRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte security_id_scope;
  byte security_id[4];
  byte side;
  byte reserved_4[4]
};

int single_side_liquidity_protection_reset_request_at;

/* every byte of Single Side Liquidity Protection Reset Request set to one value */
inline fill_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_record, single_side_liquidity_protection_reset_request_value) {
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.client_message_id[single_side_liquidity_protection_reset_request_at] = single_side_liquidity_protection_reset_request_value; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.mpid[single_side_liquidity_protection_reset_request_at] = single_side_liquidity_protection_reset_request_value; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_record.security_id_scope = single_side_liquidity_protection_reset_request_value;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.security_id[single_side_liquidity_protection_reset_request_at] = single_side_liquidity_protection_reset_request_value; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_record.side = single_side_liquidity_protection_reset_request_value;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.reserved_4[single_side_liquidity_protection_reset_request_at] = single_side_liquidity_protection_reset_request_value; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Liquidity Protection Reset Request set to where it lies, so a field read out of place says so */
inline ramp_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_record, single_side_liquidity_protection_reset_request_base) {
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.client_message_id[single_side_liquidity_protection_reset_request_at] = (single_side_liquidity_protection_reset_request_base + 0 + single_side_liquidity_protection_reset_request_at + 1) % 256; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.mpid[single_side_liquidity_protection_reset_request_at] = (single_side_liquidity_protection_reset_request_base + 4 + single_side_liquidity_protection_reset_request_at + 1) % 256; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_record.security_id_scope = (single_side_liquidity_protection_reset_request_base + 8 + 1) % 256;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.security_id[single_side_liquidity_protection_reset_request_at] = (single_side_liquidity_protection_reset_request_base + 9 + single_side_liquidity_protection_reset_request_at + 1) % 256; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_record.side = (single_side_liquidity_protection_reset_request_base + 13 + 1) % 256;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.reserved_4[single_side_liquidity_protection_reset_request_at] = (single_side_liquidity_protection_reset_request_base + 14 + single_side_liquidity_protection_reset_request_at + 1) % 256; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Liquidity Protection Reset Request to the wire, 18 bytes from where the cursor stands */
inline encode_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_record) {
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> wire[at] = single_side_liquidity_protection_reset_request_record.client_message_id[single_side_liquidity_protection_reset_request_at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> wire[at] = single_side_liquidity_protection_reset_request_record.mpid[single_side_liquidity_protection_reset_request_at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  wire[at] = single_side_liquidity_protection_reset_request_record.security_id_scope; at = at + 1;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> wire[at] = single_side_liquidity_protection_reset_request_record.security_id[single_side_liquidity_protection_reset_request_at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  wire[at] = single_side_liquidity_protection_reset_request_record.side; at = at + 1;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> wire[at] = single_side_liquidity_protection_reset_request_record.reserved_4[single_side_liquidity_protection_reset_request_at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Liquidity Protection Reset Request off the wire, 18 bytes from where the cursor stands */
inline decode_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_record) {
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.client_message_id[single_side_liquidity_protection_reset_request_at] = wire[at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.mpid[single_side_liquidity_protection_reset_request_at] = wire[at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_record.security_id_scope = wire[at]; at = at + 1;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.security_id[single_side_liquidity_protection_reset_request_at] = wire[at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_record.side = wire[at]; at = at + 1;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> single_side_liquidity_protection_reset_request_record.reserved_4[single_side_liquidity_protection_reset_request_at] = wire[at]; at = at + 1; single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Liquidity Protection Reset Request is what was written, byte for byte */
inline equal_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_read, single_side_liquidity_protection_reset_request_written) {
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> assert(single_side_liquidity_protection_reset_request_read.client_message_id[single_side_liquidity_protection_reset_request_at] == single_side_liquidity_protection_reset_request_written.client_message_id[single_side_liquidity_protection_reset_request_at]); single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> assert(single_side_liquidity_protection_reset_request_read.mpid[single_side_liquidity_protection_reset_request_at] == single_side_liquidity_protection_reset_request_written.mpid[single_side_liquidity_protection_reset_request_at]); single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  assert(single_side_liquidity_protection_reset_request_read.security_id_scope == single_side_liquidity_protection_reset_request_written.security_id_scope);
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> assert(single_side_liquidity_protection_reset_request_read.security_id[single_side_liquidity_protection_reset_request_at] == single_side_liquidity_protection_reset_request_written.security_id[single_side_liquidity_protection_reset_request_at]); single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  assert(single_side_liquidity_protection_reset_request_read.side == single_side_liquidity_protection_reset_request_written.side);
  single_side_liquidity_protection_reset_request_at = 0;
  do
  :: single_side_liquidity_protection_reset_request_at < 4 -> assert(single_side_liquidity_protection_reset_request_read.reserved_4[single_side_liquidity_protection_reset_request_at] == single_side_liquidity_protection_reset_request_written.reserved_4[single_side_liquidity_protection_reset_request_at]); single_side_liquidity_protection_reset_request_at = single_side_liquidity_protection_reset_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Liquidity Protection Reset Response: 13 bytes --------------- */

/* Response to Single Side Liquidity Protection Reset Request */
typedef SingleSideLiquidityProtectionResetResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte reserved_4[4];
  byte status
};

int single_side_liquidity_protection_reset_response_at;

/* every byte of Single Side Liquidity Protection Reset Response set to one value */
inline fill_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_record, single_side_liquidity_protection_reset_response_value) {
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.client_message_id[single_side_liquidity_protection_reset_response_at] = single_side_liquidity_protection_reset_response_value; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.mpid[single_side_liquidity_protection_reset_response_at] = single_side_liquidity_protection_reset_response_value; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.reserved_4[single_side_liquidity_protection_reset_response_at] = single_side_liquidity_protection_reset_response_value; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_record.status = single_side_liquidity_protection_reset_response_value;
  skip
}

/* each byte of Single Side Liquidity Protection Reset Response set to where it lies, so a field read out of place says so */
inline ramp_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_record, single_side_liquidity_protection_reset_response_base) {
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.client_message_id[single_side_liquidity_protection_reset_response_at] = (single_side_liquidity_protection_reset_response_base + 0 + single_side_liquidity_protection_reset_response_at + 1) % 256; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.mpid[single_side_liquidity_protection_reset_response_at] = (single_side_liquidity_protection_reset_response_base + 4 + single_side_liquidity_protection_reset_response_at + 1) % 256; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.reserved_4[single_side_liquidity_protection_reset_response_at] = (single_side_liquidity_protection_reset_response_base + 8 + single_side_liquidity_protection_reset_response_at + 1) % 256; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_record.status = (single_side_liquidity_protection_reset_response_base + 12 + 1) % 256;
  skip
}

/* Single Side Liquidity Protection Reset Response to the wire, 13 bytes from where the cursor stands */
inline encode_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_record) {
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> wire[at] = single_side_liquidity_protection_reset_response_record.client_message_id[single_side_liquidity_protection_reset_response_at]; at = at + 1; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> wire[at] = single_side_liquidity_protection_reset_response_record.mpid[single_side_liquidity_protection_reset_response_at]; at = at + 1; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> wire[at] = single_side_liquidity_protection_reset_response_record.reserved_4[single_side_liquidity_protection_reset_response_at]; at = at + 1; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  wire[at] = single_side_liquidity_protection_reset_response_record.status; at = at + 1;
  skip
}

/* Single Side Liquidity Protection Reset Response off the wire, 13 bytes from where the cursor stands */
inline decode_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_record) {
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.client_message_id[single_side_liquidity_protection_reset_response_at] = wire[at]; at = at + 1; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.mpid[single_side_liquidity_protection_reset_response_at] = wire[at]; at = at + 1; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> single_side_liquidity_protection_reset_response_record.reserved_4[single_side_liquidity_protection_reset_response_at] = wire[at]; at = at + 1; single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Side Liquidity Protection Reset Response is what was written, byte for byte */
inline equal_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_read, single_side_liquidity_protection_reset_response_written) {
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> assert(single_side_liquidity_protection_reset_response_read.client_message_id[single_side_liquidity_protection_reset_response_at] == single_side_liquidity_protection_reset_response_written.client_message_id[single_side_liquidity_protection_reset_response_at]); single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> assert(single_side_liquidity_protection_reset_response_read.mpid[single_side_liquidity_protection_reset_response_at] == single_side_liquidity_protection_reset_response_written.mpid[single_side_liquidity_protection_reset_response_at]); single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  single_side_liquidity_protection_reset_response_at = 0;
  do
  :: single_side_liquidity_protection_reset_response_at < 4 -> assert(single_side_liquidity_protection_reset_response_read.reserved_4[single_side_liquidity_protection_reset_response_at] == single_side_liquidity_protection_reset_response_written.reserved_4[single_side_liquidity_protection_reset_response_at]); single_side_liquidity_protection_reset_response_at = single_side_liquidity_protection_reset_response_at + 1
  :: else -> break
  od;
  assert(single_side_liquidity_protection_reset_response_read.status == single_side_liquidity_protection_reset_response_written.status);
  skip
}

/* ---- Simple Quote Protection Trigger Notification: 24 bytes ------------------ */

/* This message format will be used to notify firms when an MPID is placed under simple quote protection. Simple Quote protection can be triggered due to any one of the reasons listed in the message below. */
typedef SimpleQuoteProtectionTriggerNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte trigger_reason
};

int simple_quote_protection_trigger_notification_at;

/* every byte of Simple Quote Protection Trigger Notification set to one value */
inline fill_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_record, simple_quote_protection_trigger_notification_value) {
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 8 -> simple_quote_protection_trigger_notification_record.notification_time[simple_quote_protection_trigger_notification_at] = simple_quote_protection_trigger_notification_value; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 4 -> simple_quote_protection_trigger_notification_record.mpid[simple_quote_protection_trigger_notification_at] = simple_quote_protection_trigger_notification_value; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 11 -> simple_quote_protection_trigger_notification_record.underlying_symbol[simple_quote_protection_trigger_notification_at] = simple_quote_protection_trigger_notification_value; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_record.trigger_reason = simple_quote_protection_trigger_notification_value;
  skip
}

/* each byte of Simple Quote Protection Trigger Notification set to where it lies, so a field read out of place says so */
inline ramp_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_record, simple_quote_protection_trigger_notification_base) {
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 8 -> simple_quote_protection_trigger_notification_record.notification_time[simple_quote_protection_trigger_notification_at] = (simple_quote_protection_trigger_notification_base + 0 + simple_quote_protection_trigger_notification_at + 1) % 256; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 4 -> simple_quote_protection_trigger_notification_record.mpid[simple_quote_protection_trigger_notification_at] = (simple_quote_protection_trigger_notification_base + 8 + simple_quote_protection_trigger_notification_at + 1) % 256; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 11 -> simple_quote_protection_trigger_notification_record.underlying_symbol[simple_quote_protection_trigger_notification_at] = (simple_quote_protection_trigger_notification_base + 12 + simple_quote_protection_trigger_notification_at + 1) % 256; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_record.trigger_reason = (simple_quote_protection_trigger_notification_base + 23 + 1) % 256;
  skip
}

/* Simple Quote Protection Trigger Notification to the wire, 24 bytes from where the cursor stands */
inline encode_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_record) {
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 8 -> wire[at] = simple_quote_protection_trigger_notification_record.notification_time[simple_quote_protection_trigger_notification_at]; at = at + 1; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 4 -> wire[at] = simple_quote_protection_trigger_notification_record.mpid[simple_quote_protection_trigger_notification_at]; at = at + 1; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 11 -> wire[at] = simple_quote_protection_trigger_notification_record.underlying_symbol[simple_quote_protection_trigger_notification_at]; at = at + 1; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = simple_quote_protection_trigger_notification_record.trigger_reason; at = at + 1;
  skip
}

/* Simple Quote Protection Trigger Notification off the wire, 24 bytes from where the cursor stands */
inline decode_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_record) {
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 8 -> simple_quote_protection_trigger_notification_record.notification_time[simple_quote_protection_trigger_notification_at] = wire[at]; at = at + 1; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 4 -> simple_quote_protection_trigger_notification_record.mpid[simple_quote_protection_trigger_notification_at] = wire[at]; at = at + 1; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 11 -> simple_quote_protection_trigger_notification_record.underlying_symbol[simple_quote_protection_trigger_notification_at] = wire[at]; at = at + 1; simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_record.trigger_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Quote Protection Trigger Notification is what was written, byte for byte */
inline equal_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_read, simple_quote_protection_trigger_notification_written) {
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 8 -> assert(simple_quote_protection_trigger_notification_read.notification_time[simple_quote_protection_trigger_notification_at] == simple_quote_protection_trigger_notification_written.notification_time[simple_quote_protection_trigger_notification_at]); simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 4 -> assert(simple_quote_protection_trigger_notification_read.mpid[simple_quote_protection_trigger_notification_at] == simple_quote_protection_trigger_notification_written.mpid[simple_quote_protection_trigger_notification_at]); simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  simple_quote_protection_trigger_notification_at = 0;
  do
  :: simple_quote_protection_trigger_notification_at < 11 -> assert(simple_quote_protection_trigger_notification_read.underlying_symbol[simple_quote_protection_trigger_notification_at] == simple_quote_protection_trigger_notification_written.underlying_symbol[simple_quote_protection_trigger_notification_at]); simple_quote_protection_trigger_notification_at = simple_quote_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(simple_quote_protection_trigger_notification_read.trigger_reason == simple_quote_protection_trigger_notification_written.trigger_reason);
  skip
}

/* ---- Complex Liquidity Protection Trigger Notification: 24 bytes ------------- */

/* This message format will be used to notify firms when an MPID is placed under complex liquidity protection. Complex Liquidity protection can be triggered due to any one of the reasons listed in the message below. */
typedef ComplexLiquidityProtectionTriggerNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte trigger_reason
};

int complex_liquidity_protection_trigger_notification_at;

/* every byte of Complex Liquidity Protection Trigger Notification set to one value */
inline fill_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_record, complex_liquidity_protection_trigger_notification_value) {
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 8 -> complex_liquidity_protection_trigger_notification_record.notification_time[complex_liquidity_protection_trigger_notification_at] = complex_liquidity_protection_trigger_notification_value; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 4 -> complex_liquidity_protection_trigger_notification_record.mpid[complex_liquidity_protection_trigger_notification_at] = complex_liquidity_protection_trigger_notification_value; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 11 -> complex_liquidity_protection_trigger_notification_record.underlying_symbol[complex_liquidity_protection_trigger_notification_at] = complex_liquidity_protection_trigger_notification_value; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_record.trigger_reason = complex_liquidity_protection_trigger_notification_value;
  skip
}

/* each byte of Complex Liquidity Protection Trigger Notification set to where it lies, so a field read out of place says so */
inline ramp_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_record, complex_liquidity_protection_trigger_notification_base) {
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 8 -> complex_liquidity_protection_trigger_notification_record.notification_time[complex_liquidity_protection_trigger_notification_at] = (complex_liquidity_protection_trigger_notification_base + 0 + complex_liquidity_protection_trigger_notification_at + 1) % 256; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 4 -> complex_liquidity_protection_trigger_notification_record.mpid[complex_liquidity_protection_trigger_notification_at] = (complex_liquidity_protection_trigger_notification_base + 8 + complex_liquidity_protection_trigger_notification_at + 1) % 256; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 11 -> complex_liquidity_protection_trigger_notification_record.underlying_symbol[complex_liquidity_protection_trigger_notification_at] = (complex_liquidity_protection_trigger_notification_base + 12 + complex_liquidity_protection_trigger_notification_at + 1) % 256; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_record.trigger_reason = (complex_liquidity_protection_trigger_notification_base + 23 + 1) % 256;
  skip
}

/* Complex Liquidity Protection Trigger Notification to the wire, 24 bytes from where the cursor stands */
inline encode_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_record) {
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 8 -> wire[at] = complex_liquidity_protection_trigger_notification_record.notification_time[complex_liquidity_protection_trigger_notification_at]; at = at + 1; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 4 -> wire[at] = complex_liquidity_protection_trigger_notification_record.mpid[complex_liquidity_protection_trigger_notification_at]; at = at + 1; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 11 -> wire[at] = complex_liquidity_protection_trigger_notification_record.underlying_symbol[complex_liquidity_protection_trigger_notification_at]; at = at + 1; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = complex_liquidity_protection_trigger_notification_record.trigger_reason; at = at + 1;
  skip
}

/* Complex Liquidity Protection Trigger Notification off the wire, 24 bytes from where the cursor stands */
inline decode_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_record) {
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 8 -> complex_liquidity_protection_trigger_notification_record.notification_time[complex_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 4 -> complex_liquidity_protection_trigger_notification_record.mpid[complex_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 11 -> complex_liquidity_protection_trigger_notification_record.underlying_symbol[complex_liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_record.trigger_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Liquidity Protection Trigger Notification is what was written, byte for byte */
inline equal_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_read, complex_liquidity_protection_trigger_notification_written) {
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 8 -> assert(complex_liquidity_protection_trigger_notification_read.notification_time[complex_liquidity_protection_trigger_notification_at] == complex_liquidity_protection_trigger_notification_written.notification_time[complex_liquidity_protection_trigger_notification_at]); complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 4 -> assert(complex_liquidity_protection_trigger_notification_read.mpid[complex_liquidity_protection_trigger_notification_at] == complex_liquidity_protection_trigger_notification_written.mpid[complex_liquidity_protection_trigger_notification_at]); complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  complex_liquidity_protection_trigger_notification_at = 0;
  do
  :: complex_liquidity_protection_trigger_notification_at < 11 -> assert(complex_liquidity_protection_trigger_notification_read.underlying_symbol[complex_liquidity_protection_trigger_notification_at] == complex_liquidity_protection_trigger_notification_written.underlying_symbol[complex_liquidity_protection_trigger_notification_at]); complex_liquidity_protection_trigger_notification_at = complex_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(complex_liquidity_protection_trigger_notification_read.trigger_reason == complex_liquidity_protection_trigger_notification_written.trigger_reason);
  skip
}

/* ---- Slap Protection Trigger Notification: 35 bytes -------------------------- */

/* This message format will be used to notify firms when SLAP protection is triggered for an MPID and Underlying. */
typedef SlapProtectionTriggerNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte requested_slap_codes;
  byte triggered_slap_codes;
  byte reserved_10[10]
};

int slap_protection_trigger_notification_at;

/* every byte of Slap Protection Trigger Notification set to one value */
inline fill_slap_protection_trigger_notification(slap_protection_trigger_notification_record, slap_protection_trigger_notification_value) {
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 8 -> slap_protection_trigger_notification_record.notification_time[slap_protection_trigger_notification_at] = slap_protection_trigger_notification_value; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 4 -> slap_protection_trigger_notification_record.mpid[slap_protection_trigger_notification_at] = slap_protection_trigger_notification_value; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 11 -> slap_protection_trigger_notification_record.underlying_symbol[slap_protection_trigger_notification_at] = slap_protection_trigger_notification_value; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_record.requested_slap_codes = slap_protection_trigger_notification_value;
  slap_protection_trigger_notification_record.triggered_slap_codes = slap_protection_trigger_notification_value;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 10 -> slap_protection_trigger_notification_record.reserved_10[slap_protection_trigger_notification_at] = slap_protection_trigger_notification_value; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Slap Protection Trigger Notification set to where it lies, so a field read out of place says so */
inline ramp_slap_protection_trigger_notification(slap_protection_trigger_notification_record, slap_protection_trigger_notification_base) {
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 8 -> slap_protection_trigger_notification_record.notification_time[slap_protection_trigger_notification_at] = (slap_protection_trigger_notification_base + 0 + slap_protection_trigger_notification_at + 1) % 256; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 4 -> slap_protection_trigger_notification_record.mpid[slap_protection_trigger_notification_at] = (slap_protection_trigger_notification_base + 8 + slap_protection_trigger_notification_at + 1) % 256; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 11 -> slap_protection_trigger_notification_record.underlying_symbol[slap_protection_trigger_notification_at] = (slap_protection_trigger_notification_base + 12 + slap_protection_trigger_notification_at + 1) % 256; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_record.requested_slap_codes = (slap_protection_trigger_notification_base + 23 + 1) % 256;
  slap_protection_trigger_notification_record.triggered_slap_codes = (slap_protection_trigger_notification_base + 24 + 1) % 256;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 10 -> slap_protection_trigger_notification_record.reserved_10[slap_protection_trigger_notification_at] = (slap_protection_trigger_notification_base + 25 + slap_protection_trigger_notification_at + 1) % 256; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Slap Protection Trigger Notification to the wire, 35 bytes from where the cursor stands */
inline encode_slap_protection_trigger_notification(slap_protection_trigger_notification_record) {
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 8 -> wire[at] = slap_protection_trigger_notification_record.notification_time[slap_protection_trigger_notification_at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 4 -> wire[at] = slap_protection_trigger_notification_record.mpid[slap_protection_trigger_notification_at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 11 -> wire[at] = slap_protection_trigger_notification_record.underlying_symbol[slap_protection_trigger_notification_at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = slap_protection_trigger_notification_record.requested_slap_codes; at = at + 1;
  wire[at] = slap_protection_trigger_notification_record.triggered_slap_codes; at = at + 1;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 10 -> wire[at] = slap_protection_trigger_notification_record.reserved_10[slap_protection_trigger_notification_at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Slap Protection Trigger Notification off the wire, 35 bytes from where the cursor stands */
inline decode_slap_protection_trigger_notification(slap_protection_trigger_notification_record) {
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 8 -> slap_protection_trigger_notification_record.notification_time[slap_protection_trigger_notification_at] = wire[at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 4 -> slap_protection_trigger_notification_record.mpid[slap_protection_trigger_notification_at] = wire[at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 11 -> slap_protection_trigger_notification_record.underlying_symbol[slap_protection_trigger_notification_at] = wire[at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_record.requested_slap_codes = wire[at]; at = at + 1;
  slap_protection_trigger_notification_record.triggered_slap_codes = wire[at]; at = at + 1;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 10 -> slap_protection_trigger_notification_record.reserved_10[slap_protection_trigger_notification_at] = wire[at]; at = at + 1; slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Slap Protection Trigger Notification is what was written, byte for byte */
inline equal_slap_protection_trigger_notification(slap_protection_trigger_notification_read, slap_protection_trigger_notification_written) {
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 8 -> assert(slap_protection_trigger_notification_read.notification_time[slap_protection_trigger_notification_at] == slap_protection_trigger_notification_written.notification_time[slap_protection_trigger_notification_at]); slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 4 -> assert(slap_protection_trigger_notification_read.mpid[slap_protection_trigger_notification_at] == slap_protection_trigger_notification_written.mpid[slap_protection_trigger_notification_at]); slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 11 -> assert(slap_protection_trigger_notification_read.underlying_symbol[slap_protection_trigger_notification_at] == slap_protection_trigger_notification_written.underlying_symbol[slap_protection_trigger_notification_at]); slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(slap_protection_trigger_notification_read.requested_slap_codes == slap_protection_trigger_notification_written.requested_slap_codes);
  assert(slap_protection_trigger_notification_read.triggered_slap_codes == slap_protection_trigger_notification_written.triggered_slap_codes);
  slap_protection_trigger_notification_at = 0;
  do
  :: slap_protection_trigger_notification_at < 10 -> assert(slap_protection_trigger_notification_read.reserved_10[slap_protection_trigger_notification_at] == slap_protection_trigger_notification_written.reserved_10[slap_protection_trigger_notification_at]); slap_protection_trigger_notification_at = slap_protection_trigger_notification_at + 1
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

/* Simple Series Update: encoded, read back, and compared */
proctype check_simple_series_update() {
  SimpleSeriesUpdate simple_series_update_sent;
  SimpleSeriesUpdate simple_series_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_series_update(simple_series_update_sent, 0)
  :: pattern == 1 -> fill_simple_series_update(simple_series_update_sent, 32)
  :: pattern == 2 -> fill_simple_series_update(simple_series_update_sent, 255)
  :: else -> ramp_simple_series_update(simple_series_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_series_update(simple_series_update_sent);
    assert(at == 76);
    at = 0;
    decode_simple_series_update(simple_series_update_got);
    assert(at == 76);
    equal_simple_series_update(simple_series_update_got, simple_series_update_sent)
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

/* Valid Quote Width For Free Trading: encoded, read back, and compared */
proctype check_valid_quote_width_for_free_trading() {
  ValidQuoteWidthForFreeTrading valid_quote_width_for_free_trading_sent;
  ValidQuoteWidthForFreeTrading valid_quote_width_for_free_trading_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_sent, 0)
  :: pattern == 1 -> fill_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_sent, 32)
  :: pattern == 2 -> fill_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_sent, 255)
  :: else -> ramp_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_sent);
    assert(at == 37);
    at = 0;
    decode_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_got);
    assert(at == 37);
    equal_valid_quote_width_for_free_trading(valid_quote_width_for_free_trading_got, valid_quote_width_for_free_trading_sent)
  }
}

/* Simple Enhanced Quote E Quote Response: encoded, read back, and compared */
proctype check_simple_enhanced_quote_e_quote_response() {
  SimpleEnhancedQuoteEQuoteResponse simple_enhanced_quote_e_quote_response_sent;
  SimpleEnhancedQuoteEQuoteResponse simple_enhanced_quote_e_quote_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_sent, 0)
  :: pattern == 1 -> fill_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_sent, 32)
  :: pattern == 2 -> fill_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_sent, 255)
  :: else -> ramp_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_sent);
    assert(at == 17);
    at = 0;
    decode_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_got);
    assert(at == 17);
    equal_simple_enhanced_quote_e_quote_response(simple_enhanced_quote_e_quote_response_got, simple_enhanced_quote_e_quote_response_sent)
  }
}

/* Complex Enhanced Quote E Quote Response: encoded, read back, and compared */
proctype check_complex_enhanced_quote_e_quote_response() {
  ComplexEnhancedQuoteEQuoteResponse complex_enhanced_quote_e_quote_response_sent;
  ComplexEnhancedQuoteEQuoteResponse complex_enhanced_quote_e_quote_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_sent, 0)
  :: pattern == 1 -> fill_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_sent, 32)
  :: pattern == 2 -> fill_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_sent, 255)
  :: else -> ramp_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_sent);
    assert(at == 17);
    at = 0;
    decode_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_got);
    assert(at == 17);
    equal_complex_enhanced_quote_e_quote_response(complex_enhanced_quote_e_quote_response_got, complex_enhanced_quote_e_quote_response_sent)
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

/* Product Trading Status Notification: encoded, read back, and compared */
proctype check_product_trading_status_notification() {
  ProductTradingStatusNotification product_trading_status_notification_sent;
  ProductTradingStatusNotification product_trading_status_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_product_trading_status_notification(product_trading_status_notification_sent, 0)
  :: pattern == 1 -> fill_product_trading_status_notification(product_trading_status_notification_sent, 32)
  :: pattern == 2 -> fill_product_trading_status_notification(product_trading_status_notification_sent, 255)
  :: else -> ramp_product_trading_status_notification(product_trading_status_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_product_trading_status_notification(product_trading_status_notification_sent);
    assert(at == 21);
    at = 0;
    decode_product_trading_status_notification(product_trading_status_notification_got);
    assert(at == 21);
    equal_product_trading_status_notification(product_trading_status_notification_got, product_trading_status_notification_sent)
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
    assert(at == 29);
    at = 0;
    decode_underlying_trading_status_notification(underlying_trading_status_notification_got);
    assert(at == 29);
    equal_underlying_trading_status_notification(underlying_trading_status_notification_got, underlying_trading_status_notification_sent)
  }
}

/* Opening Quote Width Relief Notification: encoded, read back, and compared */
proctype check_opening_quote_width_relief_notification() {
  OpeningQuoteWidthReliefNotification opening_quote_width_relief_notification_sent;
  OpeningQuoteWidthReliefNotification opening_quote_width_relief_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_quote_width_relief_notification(opening_quote_width_relief_notification_sent, 0)
  :: pattern == 1 -> fill_opening_quote_width_relief_notification(opening_quote_width_relief_notification_sent, 32)
  :: pattern == 2 -> fill_opening_quote_width_relief_notification(opening_quote_width_relief_notification_sent, 255)
  :: else -> ramp_opening_quote_width_relief_notification(opening_quote_width_relief_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_quote_width_relief_notification(opening_quote_width_relief_notification_sent);
    assert(at == 23);
    at = 0;
    decode_opening_quote_width_relief_notification(opening_quote_width_relief_notification_got);
    assert(at == 23);
    equal_opening_quote_width_relief_notification(opening_quote_width_relief_notification_got, opening_quote_width_relief_notification_sent)
  }
}

/* Free Trading Quote Width Relief Notification: encoded, read back, and compared */
proctype check_free_trading_quote_width_relief_notification() {
  FreeTradingQuoteWidthReliefNotification free_trading_quote_width_relief_notification_sent;
  FreeTradingQuoteWidthReliefNotification free_trading_quote_width_relief_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_sent, 0)
  :: pattern == 1 -> fill_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_sent, 32)
  :: pattern == 2 -> fill_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_sent, 255)
  :: else -> ramp_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_sent);
    assert(at == 39);
    at = 0;
    decode_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_got);
    assert(at == 39);
    equal_free_trading_quote_width_relief_notification(free_trading_quote_width_relief_notification_got, free_trading_quote_width_relief_notification_sent)
  }
}

/* Simple Arm Protection Settings Notification: encoded, read back, and compared */
proctype check_simple_arm_protection_settings_notification() {
  SimpleArmProtectionSettingsNotification simple_arm_protection_settings_notification_sent;
  SimpleArmProtectionSettingsNotification simple_arm_protection_settings_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_sent, 0)
  :: pattern == 1 -> fill_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_sent, 32)
  :: pattern == 2 -> fill_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_sent, 255)
  :: else -> ramp_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_sent);
    assert(at == 59);
    at = 0;
    decode_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_got);
    assert(at == 59);
    equal_simple_arm_protection_settings_notification(simple_arm_protection_settings_notification_got, simple_arm_protection_settings_notification_sent)
  }
}

/* Arm 2 Underlying Level Protection Settings Notification: encoded, read back, and compared */
proctype check_arm2_underlying_level_protection_settings_notification() {
  Arm2UnderlyingLevelProtectionSettingsNotification arm2_underlying_level_protection_settings_notification_sent;
  Arm2UnderlyingLevelProtectionSettingsNotification arm2_underlying_level_protection_settings_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_sent, 0)
  :: pattern == 1 -> fill_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_sent, 32)
  :: pattern == 2 -> fill_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_sent, 255)
  :: else -> ramp_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_sent);
    assert(at == 48);
    at = 0;
    decode_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_got);
    assert(at == 48);
    equal_arm2_underlying_level_protection_settings_notification(arm2_underlying_level_protection_settings_notification_got, arm2_underlying_level_protection_settings_notification_sent)
  }
}

/* Single Side Liquidity Protection Trigger Notification: encoded, read back, and compared */
proctype check_single_side_liquidity_protection_trigger_notification() {
  SingleSideLiquidityProtectionTriggerNotification single_side_liquidity_protection_trigger_notification_sent;
  SingleSideLiquidityProtectionTriggerNotification single_side_liquidity_protection_trigger_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_sent, 0)
  :: pattern == 1 -> fill_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_sent, 32)
  :: pattern == 2 -> fill_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_sent, 255)
  :: else -> ramp_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_sent);
    assert(at == 27);
    at = 0;
    decode_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_got);
    assert(at == 27);
    equal_single_side_liquidity_protection_trigger_notification(single_side_liquidity_protection_trigger_notification_got, single_side_liquidity_protection_trigger_notification_sent)
  }
}

/* Arm 2 Underlying Level Protection Notification: encoded, read back, and compared */
proctype check_arm2_underlying_level_protection_notification() {
  Arm2UnderlyingLevelProtectionNotification arm2_underlying_level_protection_notification_sent;
  Arm2UnderlyingLevelProtectionNotification arm2_underlying_level_protection_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_sent, 0)
  :: pattern == 1 -> fill_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_sent, 32)
  :: pattern == 2 -> fill_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_sent, 255)
  :: else -> ramp_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_sent);
    assert(at == 48);
    at = 0;
    decode_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_got);
    assert(at == 48);
    equal_arm2_underlying_level_protection_notification(arm2_underlying_level_protection_notification_got, arm2_underlying_level_protection_notification_sent)
  }
}

/* Arm 2 Firm Level Protection Notification: encoded, read back, and compared */
proctype check_arm2_firm_level_protection_notification() {
  Arm2FirmLevelProtectionNotification arm2_firm_level_protection_notification_sent;
  Arm2FirmLevelProtectionNotification arm2_firm_level_protection_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_sent, 0)
  :: pattern == 1 -> fill_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_sent, 32)
  :: pattern == 2 -> fill_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_sent, 255)
  :: else -> ramp_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_sent);
    assert(at == 33);
    at = 0;
    decode_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_got);
    assert(at == 33);
    equal_arm2_firm_level_protection_notification(arm2_firm_level_protection_notification_got, arm2_firm_level_protection_notification_sent)
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

/* Option Execution Notification: encoded, read back, and compared */
proctype check_option_execution_notification() {
  OptionExecutionNotification option_execution_notification_sent;
  OptionExecutionNotification option_execution_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_execution_notification(option_execution_notification_sent, 0)
  :: pattern == 1 -> fill_option_execution_notification(option_execution_notification_sent, 32)
  :: pattern == 2 -> fill_option_execution_notification(option_execution_notification_sent, 255)
  :: else -> ramp_option_execution_notification(option_execution_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_execution_notification(option_execution_notification_sent);
    assert(at == 49);
    at = 0;
    decode_option_execution_notification(option_execution_notification_got);
    assert(at == 49);
    equal_option_execution_notification(option_execution_notification_got, option_execution_notification_sent)
  }
}

/* Stock Leg Execution Notification: encoded, read back, and compared */
proctype check_stock_leg_execution_notification() {
  StockLegExecutionNotification stock_leg_execution_notification_sent;
  StockLegExecutionNotification stock_leg_execution_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_leg_execution_notification(stock_leg_execution_notification_sent, 0)
  :: pattern == 1 -> fill_stock_leg_execution_notification(stock_leg_execution_notification_sent, 32)
  :: pattern == 2 -> fill_stock_leg_execution_notification(stock_leg_execution_notification_sent, 255)
  :: else -> ramp_stock_leg_execution_notification(stock_leg_execution_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_leg_execution_notification(stock_leg_execution_notification_sent);
    assert(at == 71);
    at = 0;
    decode_stock_leg_execution_notification(stock_leg_execution_notification_got);
    assert(at == 71);
    equal_stock_leg_execution_notification(stock_leg_execution_notification_got, stock_leg_execution_notification_sent)
  }
}

/* Simple Arm Settings Update Request: encoded, read back, and compared */
proctype check_simple_arm_settings_update_request() {
  SimpleArmSettingsUpdateRequest simple_arm_settings_update_request_sent;
  SimpleArmSettingsUpdateRequest simple_arm_settings_update_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_arm_settings_update_request(simple_arm_settings_update_request_sent, 0)
  :: pattern == 1 -> fill_simple_arm_settings_update_request(simple_arm_settings_update_request_sent, 32)
  :: pattern == 2 -> fill_simple_arm_settings_update_request(simple_arm_settings_update_request_sent, 255)
  :: else -> ramp_simple_arm_settings_update_request(simple_arm_settings_update_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_arm_settings_update_request(simple_arm_settings_update_request_sent);
    assert(at == 54);
    at = 0;
    decode_simple_arm_settings_update_request(simple_arm_settings_update_request_got);
    assert(at == 54);
    equal_simple_arm_settings_update_request(simple_arm_settings_update_request_got, simple_arm_settings_update_request_sent)
  }
}

/* Simple Arm Settings Update Response: encoded, read back, and compared */
proctype check_simple_arm_settings_update_response() {
  SimpleArmSettingsUpdateResponse simple_arm_settings_update_response_sent;
  SimpleArmSettingsUpdateResponse simple_arm_settings_update_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_arm_settings_update_response(simple_arm_settings_update_response_sent, 0)
  :: pattern == 1 -> fill_simple_arm_settings_update_response(simple_arm_settings_update_response_sent, 32)
  :: pattern == 2 -> fill_simple_arm_settings_update_response(simple_arm_settings_update_response_sent, 255)
  :: else -> ramp_simple_arm_settings_update_response(simple_arm_settings_update_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_arm_settings_update_response(simple_arm_settings_update_response_sent);
    assert(at == 20);
    at = 0;
    decode_simple_arm_settings_update_response(simple_arm_settings_update_response_got);
    assert(at == 20);
    equal_simple_arm_settings_update_response(simple_arm_settings_update_response_got, simple_arm_settings_update_response_sent)
  }
}

/* Arm 2 Underlying Level Protection Settings Update Request: encoded, read back, and compared */
proctype check_arm2_underlying_level_protection_settings_update_request() {
  Arm2UnderlyingLevelProtectionSettingsUpdateRequest arm2_underlying_level_protection_settings_update_request_sent;
  Arm2UnderlyingLevelProtectionSettingsUpdateRequest arm2_underlying_level_protection_settings_update_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_sent, 0)
  :: pattern == 1 -> fill_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_sent, 32)
  :: pattern == 2 -> fill_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_sent, 255)
  :: else -> ramp_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_sent);
    assert(at == 28);
    at = 0;
    decode_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_got);
    assert(at == 28);
    equal_arm2_underlying_level_protection_settings_update_request(arm2_underlying_level_protection_settings_update_request_got, arm2_underlying_level_protection_settings_update_request_sent)
  }
}

/* Arm 2 Underlying Level Protection Settings Update Response: encoded, read back, and compared */
proctype check_arm2_underlying_level_protection_settings_update_response() {
  Arm2UnderlyingLevelProtectionSettingsUpdateResponse arm2_underlying_level_protection_settings_update_response_sent;
  Arm2UnderlyingLevelProtectionSettingsUpdateResponse arm2_underlying_level_protection_settings_update_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_sent, 0)
  :: pattern == 1 -> fill_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_sent, 32)
  :: pattern == 2 -> fill_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_sent, 255)
  :: else -> ramp_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_sent);
    assert(at == 20);
    at = 0;
    decode_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_got);
    assert(at == 20);
    equal_arm2_underlying_level_protection_settings_update_response(arm2_underlying_level_protection_settings_update_response_got, arm2_underlying_level_protection_settings_update_response_sent)
  }
}

/* Simple Enhanced Quote E Quote Message: encoded, read back, and compared */
proctype check_simple_enhanced_quote_e_quote_message() {
  SimpleEnhancedQuoteEQuoteMessage simple_enhanced_quote_e_quote_message_sent;
  SimpleEnhancedQuoteEQuoteMessage simple_enhanced_quote_e_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_sent, 0)
  :: pattern == 1 -> fill_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_sent, 32)
  :: pattern == 2 -> fill_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_sent, 255)
  :: else -> ramp_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_sent);
    assert(at == 43);
    at = 0;
    decode_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_got);
    assert(at == 43);
    equal_simple_enhanced_quote_e_quote_message(simple_enhanced_quote_e_quote_message_got, simple_enhanced_quote_e_quote_message_sent)
  }
}

/* Complex Enhanced Quote E Quote Message: encoded, read back, and compared */
proctype check_complex_enhanced_quote_e_quote_message() {
  ComplexEnhancedQuoteEQuoteMessage complex_enhanced_quote_e_quote_message_sent;
  ComplexEnhancedQuoteEQuoteMessage complex_enhanced_quote_e_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_sent, 0)
  :: pattern == 1 -> fill_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_sent, 32)
  :: pattern == 2 -> fill_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_sent, 255)
  :: else -> ramp_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_sent);
    assert(at == 59);
    at = 0;
    decode_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_got);
    assert(at == 59);
    equal_complex_enhanced_quote_e_quote_message(complex_enhanced_quote_e_quote_message_got, complex_enhanced_quote_e_quote_message_sent)
  }
}

/* Simple Mass Quote Cancel Request: encoded, read back, and compared */
proctype check_simple_mass_quote_cancel_request() {
  SimpleMassQuoteCancelRequest simple_mass_quote_cancel_request_sent;
  SimpleMassQuoteCancelRequest simple_mass_quote_cancel_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_sent, 0)
  :: pattern == 1 -> fill_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_sent, 32)
  :: pattern == 2 -> fill_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_sent, 255)
  :: else -> ramp_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_sent);
    assert(at == 31);
    at = 0;
    decode_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_got);
    assert(at == 31);
    equal_simple_mass_quote_cancel_request(simple_mass_quote_cancel_request_got, simple_mass_quote_cancel_request_sent)
  }
}

/* Simple Mass Quote Cancel Response: encoded, read back, and compared */
proctype check_simple_mass_quote_cancel_response() {
  SimpleMassQuoteCancelResponse simple_mass_quote_cancel_response_sent;
  SimpleMassQuoteCancelResponse simple_mass_quote_cancel_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_sent, 0)
  :: pattern == 1 -> fill_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_sent, 32)
  :: pattern == 2 -> fill_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_sent, 255)
  :: else -> ramp_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_sent);
    assert(at == 9);
    at = 0;
    decode_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_got);
    assert(at == 9);
    equal_simple_mass_quote_cancel_response(simple_mass_quote_cancel_response_got, simple_mass_quote_cancel_response_sent)
  }
}

/* Mass Liquidity Cancel Request Simple And Complex: encoded, read back, and compared */
proctype check_mass_liquidity_cancel_request_simple_and_complex() {
  MassLiquidityCancelRequestSimpleAndComplex mass_liquidity_cancel_request_simple_and_complex_sent;
  MassLiquidityCancelRequestSimpleAndComplex mass_liquidity_cancel_request_simple_and_complex_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_sent, 0)
  :: pattern == 1 -> fill_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_sent, 32)
  :: pattern == 2 -> fill_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_sent, 255)
  :: else -> ramp_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_sent);
    assert(at == 37);
    at = 0;
    decode_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_got);
    assert(at == 37);
    equal_mass_liquidity_cancel_request_simple_and_complex(mass_liquidity_cancel_request_simple_and_complex_got, mass_liquidity_cancel_request_simple_and_complex_sent)
  }
}

/* Mass Liquidity Cancel Response: encoded, read back, and compared */
proctype check_mass_liquidity_cancel_response() {
  MassLiquidityCancelResponse mass_liquidity_cancel_response_sent;
  MassLiquidityCancelResponse mass_liquidity_cancel_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_liquidity_cancel_response(mass_liquidity_cancel_response_sent, 0)
  :: pattern == 1 -> fill_mass_liquidity_cancel_response(mass_liquidity_cancel_response_sent, 32)
  :: pattern == 2 -> fill_mass_liquidity_cancel_response(mass_liquidity_cancel_response_sent, 255)
  :: else -> ramp_mass_liquidity_cancel_response(mass_liquidity_cancel_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_liquidity_cancel_response(mass_liquidity_cancel_response_sent);
    assert(at == 10);
    at = 0;
    decode_mass_liquidity_cancel_response(mass_liquidity_cancel_response_got);
    assert(at == 10);
    equal_mass_liquidity_cancel_response(mass_liquidity_cancel_response_got, mass_liquidity_cancel_response_sent)
  }
}

/* Simple Quote Protection Reset Request: encoded, read back, and compared */
proctype check_simple_quote_protection_reset_request() {
  SimpleQuoteProtectionResetRequest simple_quote_protection_reset_request_sent;
  SimpleQuoteProtectionResetRequest simple_quote_protection_reset_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_quote_protection_reset_request(simple_quote_protection_reset_request_sent, 0)
  :: pattern == 1 -> fill_simple_quote_protection_reset_request(simple_quote_protection_reset_request_sent, 32)
  :: pattern == 2 -> fill_simple_quote_protection_reset_request(simple_quote_protection_reset_request_sent, 255)
  :: else -> ramp_simple_quote_protection_reset_request(simple_quote_protection_reset_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_quote_protection_reset_request(simple_quote_protection_reset_request_sent);
    assert(at == 19);
    at = 0;
    decode_simple_quote_protection_reset_request(simple_quote_protection_reset_request_got);
    assert(at == 19);
    equal_simple_quote_protection_reset_request(simple_quote_protection_reset_request_got, simple_quote_protection_reset_request_sent)
  }
}

/* Simple Quote Protection Reset Response: encoded, read back, and compared */
proctype check_simple_quote_protection_reset_response() {
  SimpleQuoteProtectionResetResponse simple_quote_protection_reset_response_sent;
  SimpleQuoteProtectionResetResponse simple_quote_protection_reset_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_quote_protection_reset_response(simple_quote_protection_reset_response_sent, 0)
  :: pattern == 1 -> fill_simple_quote_protection_reset_response(simple_quote_protection_reset_response_sent, 32)
  :: pattern == 2 -> fill_simple_quote_protection_reset_response(simple_quote_protection_reset_response_sent, 255)
  :: else -> ramp_simple_quote_protection_reset_response(simple_quote_protection_reset_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_quote_protection_reset_response(simple_quote_protection_reset_response_sent);
    assert(at == 9);
    at = 0;
    decode_simple_quote_protection_reset_response(simple_quote_protection_reset_response_got);
    assert(at == 9);
    equal_simple_quote_protection_reset_response(simple_quote_protection_reset_response_got, simple_quote_protection_reset_response_sent)
  }
}

/* Liquidity Protection Reset Request: encoded, read back, and compared */
proctype check_liquidity_protection_reset_request() {
  LiquidityProtectionResetRequest liquidity_protection_reset_request_sent;
  LiquidityProtectionResetRequest liquidity_protection_reset_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_protection_reset_request(liquidity_protection_reset_request_sent, 0)
  :: pattern == 1 -> fill_liquidity_protection_reset_request(liquidity_protection_reset_request_sent, 32)
  :: pattern == 2 -> fill_liquidity_protection_reset_request(liquidity_protection_reset_request_sent, 255)
  :: else -> ramp_liquidity_protection_reset_request(liquidity_protection_reset_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_protection_reset_request(liquidity_protection_reset_request_sent);
    assert(at == 29);
    at = 0;
    decode_liquidity_protection_reset_request(liquidity_protection_reset_request_got);
    assert(at == 29);
    equal_liquidity_protection_reset_request(liquidity_protection_reset_request_got, liquidity_protection_reset_request_sent)
  }
}

/* Liquidity Protection Reset Response: encoded, read back, and compared */
proctype check_liquidity_protection_reset_response() {
  LiquidityProtectionResetResponse liquidity_protection_reset_response_sent;
  LiquidityProtectionResetResponse liquidity_protection_reset_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_protection_reset_response(liquidity_protection_reset_response_sent, 0)
  :: pattern == 1 -> fill_liquidity_protection_reset_response(liquidity_protection_reset_response_sent, 32)
  :: pattern == 2 -> fill_liquidity_protection_reset_response(liquidity_protection_reset_response_sent, 255)
  :: else -> ramp_liquidity_protection_reset_response(liquidity_protection_reset_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_protection_reset_response(liquidity_protection_reset_response_sent);
    assert(at == 10);
    at = 0;
    decode_liquidity_protection_reset_response(liquidity_protection_reset_response_got);
    assert(at == 10);
    equal_liquidity_protection_reset_response(liquidity_protection_reset_response_got, liquidity_protection_reset_response_sent)
  }
}

/* Single Side Liquidity Protection Reset Request: encoded, read back, and compared */
proctype check_single_side_liquidity_protection_reset_request() {
  SingleSideLiquidityProtectionResetRequest single_side_liquidity_protection_reset_request_sent;
  SingleSideLiquidityProtectionResetRequest single_side_liquidity_protection_reset_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_sent, 0)
  :: pattern == 1 -> fill_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_sent, 32)
  :: pattern == 2 -> fill_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_sent, 255)
  :: else -> ramp_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_sent);
    assert(at == 18);
    at = 0;
    decode_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_got);
    assert(at == 18);
    equal_single_side_liquidity_protection_reset_request(single_side_liquidity_protection_reset_request_got, single_side_liquidity_protection_reset_request_sent)
  }
}

/* Single Side Liquidity Protection Reset Response: encoded, read back, and compared */
proctype check_single_side_liquidity_protection_reset_response() {
  SingleSideLiquidityProtectionResetResponse single_side_liquidity_protection_reset_response_sent;
  SingleSideLiquidityProtectionResetResponse single_side_liquidity_protection_reset_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_sent, 0)
  :: pattern == 1 -> fill_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_sent, 32)
  :: pattern == 2 -> fill_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_sent, 255)
  :: else -> ramp_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_sent);
    assert(at == 13);
    at = 0;
    decode_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_got);
    assert(at == 13);
    equal_single_side_liquidity_protection_reset_response(single_side_liquidity_protection_reset_response_got, single_side_liquidity_protection_reset_response_sent)
  }
}

/* Simple Quote Protection Trigger Notification: encoded, read back, and compared */
proctype check_simple_quote_protection_trigger_notification() {
  SimpleQuoteProtectionTriggerNotification simple_quote_protection_trigger_notification_sent;
  SimpleQuoteProtectionTriggerNotification simple_quote_protection_trigger_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_sent, 0)
  :: pattern == 1 -> fill_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_sent, 32)
  :: pattern == 2 -> fill_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_sent, 255)
  :: else -> ramp_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_sent);
    assert(at == 24);
    at = 0;
    decode_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_got);
    assert(at == 24);
    equal_simple_quote_protection_trigger_notification(simple_quote_protection_trigger_notification_got, simple_quote_protection_trigger_notification_sent)
  }
}

/* Complex Liquidity Protection Trigger Notification: encoded, read back, and compared */
proctype check_complex_liquidity_protection_trigger_notification() {
  ComplexLiquidityProtectionTriggerNotification complex_liquidity_protection_trigger_notification_sent;
  ComplexLiquidityProtectionTriggerNotification complex_liquidity_protection_trigger_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_sent, 0)
  :: pattern == 1 -> fill_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_sent, 32)
  :: pattern == 2 -> fill_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_sent, 255)
  :: else -> ramp_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_sent);
    assert(at == 24);
    at = 0;
    decode_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_got);
    assert(at == 24);
    equal_complex_liquidity_protection_trigger_notification(complex_liquidity_protection_trigger_notification_got, complex_liquidity_protection_trigger_notification_sent)
  }
}

/* Slap Protection Trigger Notification: encoded, read back, and compared */
proctype check_slap_protection_trigger_notification() {
  SlapProtectionTriggerNotification slap_protection_trigger_notification_sent;
  SlapProtectionTriggerNotification slap_protection_trigger_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_slap_protection_trigger_notification(slap_protection_trigger_notification_sent, 0)
  :: pattern == 1 -> fill_slap_protection_trigger_notification(slap_protection_trigger_notification_sent, 32)
  :: pattern == 2 -> fill_slap_protection_trigger_notification(slap_protection_trigger_notification_sent, 255)
  :: else -> ramp_slap_protection_trigger_notification(slap_protection_trigger_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_slap_protection_trigger_notification(slap_protection_trigger_notification_sent);
    assert(at == 35);
    at = 0;
    decode_slap_protection_trigger_notification(slap_protection_trigger_notification_got);
    assert(at == 35);
    equal_slap_protection_trigger_notification(slap_protection_trigger_notification_got, slap_protection_trigger_notification_sent)
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
  :: run check_simple_series_update()
  :: run check_valid_quote_width_for_opening()
  :: run check_valid_quote_width_for_free_trading()
  :: run check_simple_enhanced_quote_e_quote_response()
  :: run check_complex_enhanced_quote_e_quote_response()
  :: run check_system_state_notification()
  :: run check_product_trading_status_notification()
  :: run check_underlying_trading_status_notification()
  :: run check_opening_quote_width_relief_notification()
  :: run check_free_trading_quote_width_relief_notification()
  :: run check_simple_arm_protection_settings_notification()
  :: run check_arm2_underlying_level_protection_settings_notification()
  :: run check_single_side_liquidity_protection_trigger_notification()
  :: run check_arm2_underlying_level_protection_notification()
  :: run check_arm2_firm_level_protection_notification()
  :: run check_cancel_notification()
  :: run check_option_execution_notification()
  :: run check_stock_leg_execution_notification()
  :: run check_simple_arm_settings_update_request()
  :: run check_simple_arm_settings_update_response()
  :: run check_arm2_underlying_level_protection_settings_update_request()
  :: run check_arm2_underlying_level_protection_settings_update_response()
  :: run check_simple_enhanced_quote_e_quote_message()
  :: run check_complex_enhanced_quote_e_quote_message()
  :: run check_simple_mass_quote_cancel_request()
  :: run check_simple_mass_quote_cancel_response()
  :: run check_mass_liquidity_cancel_request_simple_and_complex()
  :: run check_mass_liquidity_cancel_response()
  :: run check_simple_quote_protection_reset_request()
  :: run check_simple_quote_protection_reset_response()
  :: run check_liquidity_protection_reset_request()
  :: run check_liquidity_protection_reset_response()
  :: run check_single_side_liquidity_protection_reset_request()
  :: run check_single_side_liquidity_protection_reset_response()
  :: run check_simple_quote_protection_trigger_notification()
  :: run check_complex_liquidity_protection_trigger_notification()
  :: run check_slap_protection_trigger_notification()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_retransmission_request()
  fi
}
