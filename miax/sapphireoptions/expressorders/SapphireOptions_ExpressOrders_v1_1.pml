/*
 * Miami International Holdings Express Orders
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

/* This is the message format that will be used to disseminate all Option series traded on Sapphire for the current session on the cloud associated for this connection */
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
  byte active_on_sapphire;
  byte sapphire_bbo_posting_increment_indicator;
  byte order_acceptance_increment_indicator;
  byte opening_underlying_market_code;
  byte reserved_12[12]
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
  series_update_record.active_on_sapphire = series_update_value;
  series_update_record.sapphire_bbo_posting_increment_indicator = series_update_value;
  series_update_record.order_acceptance_increment_indicator = series_update_value;
  series_update_record.opening_underlying_market_code = series_update_value;
  series_update_at = 0;
  do
  :: series_update_at < 12 -> series_update_record.reserved_12[series_update_at] = series_update_value; series_update_at = series_update_at + 1
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
  series_update_record.active_on_sapphire = (series_update_base + 60 + 1) % 256;
  series_update_record.sapphire_bbo_posting_increment_indicator = (series_update_base + 61 + 1) % 256;
  series_update_record.order_acceptance_increment_indicator = (series_update_base + 62 + 1) % 256;
  series_update_record.opening_underlying_market_code = (series_update_base + 63 + 1) % 256;
  series_update_at = 0;
  do
  :: series_update_at < 12 -> series_update_record.reserved_12[series_update_at] = (series_update_base + 64 + series_update_at + 1) % 256; series_update_at = series_update_at + 1
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
  wire[at] = series_update_record.active_on_sapphire; at = at + 1;
  wire[at] = series_update_record.sapphire_bbo_posting_increment_indicator; at = at + 1;
  wire[at] = series_update_record.order_acceptance_increment_indicator; at = at + 1;
  wire[at] = series_update_record.opening_underlying_market_code; at = at + 1;
  series_update_at = 0;
  do
  :: series_update_at < 12 -> wire[at] = series_update_record.reserved_12[series_update_at]; at = at + 1; series_update_at = series_update_at + 1
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
  series_update_record.active_on_sapphire = wire[at]; at = at + 1;
  series_update_record.sapphire_bbo_posting_increment_indicator = wire[at]; at = at + 1;
  series_update_record.order_acceptance_increment_indicator = wire[at]; at = at + 1;
  series_update_record.opening_underlying_market_code = wire[at]; at = at + 1;
  series_update_at = 0;
  do
  :: series_update_at < 12 -> series_update_record.reserved_12[series_update_at] = wire[at]; at = at + 1; series_update_at = series_update_at + 1
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
  assert(series_update_read.active_on_sapphire == series_update_written.active_on_sapphire);
  assert(series_update_read.sapphire_bbo_posting_increment_indicator == series_update_written.sapphire_bbo_posting_increment_indicator);
  assert(series_update_read.order_acceptance_increment_indicator == series_update_written.order_acceptance_increment_indicator);
  assert(series_update_read.opening_underlying_market_code == series_update_written.opening_underlying_market_code);
  series_update_at = 0;
  do
  :: series_update_at < 12 -> assert(series_update_read.reserved_12[series_update_at] == series_update_written.reserved_12[series_update_at]); series_update_at = series_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Binary Order Response: 33 bytes --------------------------------- */

/* This message indicates if the complex binary order is accepted or rejected. Note that this message does not report executions */
typedef ComplexBinaryOrderResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte order_id[8];
  byte status;
  byte reserved_16[16]
};

int complex_binary_order_response_at;

/* every byte of Complex Binary Order Response set to one value */
inline fill_complex_binary_order_response(complex_binary_order_response_record, complex_binary_order_response_value) {
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> complex_binary_order_response_record.client_message_id[complex_binary_order_response_at] = complex_binary_order_response_value; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> complex_binary_order_response_record.mpid[complex_binary_order_response_at] = complex_binary_order_response_value; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 8 -> complex_binary_order_response_record.order_id[complex_binary_order_response_at] = complex_binary_order_response_value; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_record.status = complex_binary_order_response_value;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 16 -> complex_binary_order_response_record.reserved_16[complex_binary_order_response_at] = complex_binary_order_response_value; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Binary Order Response set to where it lies, so a field read out of place says so */
inline ramp_complex_binary_order_response(complex_binary_order_response_record, complex_binary_order_response_base) {
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> complex_binary_order_response_record.client_message_id[complex_binary_order_response_at] = (complex_binary_order_response_base + 0 + complex_binary_order_response_at + 1) % 256; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> complex_binary_order_response_record.mpid[complex_binary_order_response_at] = (complex_binary_order_response_base + 4 + complex_binary_order_response_at + 1) % 256; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 8 -> complex_binary_order_response_record.order_id[complex_binary_order_response_at] = (complex_binary_order_response_base + 8 + complex_binary_order_response_at + 1) % 256; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_record.status = (complex_binary_order_response_base + 16 + 1) % 256;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 16 -> complex_binary_order_response_record.reserved_16[complex_binary_order_response_at] = (complex_binary_order_response_base + 17 + complex_binary_order_response_at + 1) % 256; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Binary Order Response to the wire, 33 bytes from where the cursor stands */
inline encode_complex_binary_order_response(complex_binary_order_response_record) {
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> wire[at] = complex_binary_order_response_record.client_message_id[complex_binary_order_response_at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> wire[at] = complex_binary_order_response_record.mpid[complex_binary_order_response_at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 8 -> wire[at] = complex_binary_order_response_record.order_id[complex_binary_order_response_at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  wire[at] = complex_binary_order_response_record.status; at = at + 1;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 16 -> wire[at] = complex_binary_order_response_record.reserved_16[complex_binary_order_response_at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Binary Order Response off the wire, 33 bytes from where the cursor stands */
inline decode_complex_binary_order_response(complex_binary_order_response_record) {
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> complex_binary_order_response_record.client_message_id[complex_binary_order_response_at] = wire[at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> complex_binary_order_response_record.mpid[complex_binary_order_response_at] = wire[at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 8 -> complex_binary_order_response_record.order_id[complex_binary_order_response_at] = wire[at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_record.status = wire[at]; at = at + 1;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 16 -> complex_binary_order_response_record.reserved_16[complex_binary_order_response_at] = wire[at]; at = at + 1; complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Binary Order Response is what was written, byte for byte */
inline equal_complex_binary_order_response(complex_binary_order_response_read, complex_binary_order_response_written) {
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> assert(complex_binary_order_response_read.client_message_id[complex_binary_order_response_at] == complex_binary_order_response_written.client_message_id[complex_binary_order_response_at]); complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 4 -> assert(complex_binary_order_response_read.mpid[complex_binary_order_response_at] == complex_binary_order_response_written.mpid[complex_binary_order_response_at]); complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 8 -> assert(complex_binary_order_response_read.order_id[complex_binary_order_response_at] == complex_binary_order_response_written.order_id[complex_binary_order_response_at]); complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  assert(complex_binary_order_response_read.status == complex_binary_order_response_written.status);
  complex_binary_order_response_at = 0;
  do
  :: complex_binary_order_response_at < 16 -> assert(complex_binary_order_response_read.reserved_16[complex_binary_order_response_at] == complex_binary_order_response_written.reserved_16[complex_binary_order_response_at]); complex_binary_order_response_at = complex_binary_order_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Notification: 18 bytes ------------------------------------- */

/* This message format is used to notify the firms of the state changes of the system. This is an exchange-wide notification and not a symbol or member-based notification */
typedef SystemStateNotification {
  byte notification_time[8];
  byte meo_version[8];
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
  :: system_state_notification_at < 8 -> system_state_notification_record.meo_version[system_state_notification_at] = system_state_notification_value; system_state_notification_at = system_state_notification_at + 1
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
  :: system_state_notification_at < 8 -> system_state_notification_record.meo_version[system_state_notification_at] = (system_state_notification_base + 8 + system_state_notification_at + 1) % 256; system_state_notification_at = system_state_notification_at + 1
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
  :: system_state_notification_at < 8 -> wire[at] = system_state_notification_record.meo_version[system_state_notification_at]; at = at + 1; system_state_notification_at = system_state_notification_at + 1
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
  :: system_state_notification_at < 8 -> system_state_notification_record.meo_version[system_state_notification_at] = wire[at]; at = at + 1; system_state_notification_at = system_state_notification_at + 1
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
  :: system_state_notification_at < 8 -> assert(system_state_notification_read.meo_version[system_state_notification_at] == system_state_notification_written.meo_version[system_state_notification_at]); system_state_notification_at = system_state_notification_at + 1
  :: else -> break
  od;
  assert(system_state_notification_read.session_id == system_state_notification_written.session_id);
  assert(system_state_notification_read.system_status == system_state_notification_written.system_status);
  skip
}

/* ---- Underlying Trading Status Notification: 29 bytes ------------------------ */

/* This message format will be used to notify the firms of changes to the trading status of all the options of an underlying */
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

/* ---- Opening Width Relief Notification: 23 bytes ----------------------------- */

/* This message format will be used to notify the firms if and when Sapphire grants relief from valid opening width parameters for Opening as specified by regulatory circulars of Sapphire */
typedef OpeningWidthReliefNotification {
  byte notification_time[8];
  byte underlying_symbol[11];
  byte relief_multiplier[4]
};

int opening_width_relief_notification_at;

/* every byte of Opening Width Relief Notification set to one value */
inline fill_opening_width_relief_notification(opening_width_relief_notification_record, opening_width_relief_notification_value) {
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 8 -> opening_width_relief_notification_record.notification_time[opening_width_relief_notification_at] = opening_width_relief_notification_value; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 11 -> opening_width_relief_notification_record.underlying_symbol[opening_width_relief_notification_at] = opening_width_relief_notification_value; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 4 -> opening_width_relief_notification_record.relief_multiplier[opening_width_relief_notification_at] = opening_width_relief_notification_value; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Width Relief Notification set to where it lies, so a field read out of place says so */
inline ramp_opening_width_relief_notification(opening_width_relief_notification_record, opening_width_relief_notification_base) {
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 8 -> opening_width_relief_notification_record.notification_time[opening_width_relief_notification_at] = (opening_width_relief_notification_base + 0 + opening_width_relief_notification_at + 1) % 256; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 11 -> opening_width_relief_notification_record.underlying_symbol[opening_width_relief_notification_at] = (opening_width_relief_notification_base + 8 + opening_width_relief_notification_at + 1) % 256; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 4 -> opening_width_relief_notification_record.relief_multiplier[opening_width_relief_notification_at] = (opening_width_relief_notification_base + 19 + opening_width_relief_notification_at + 1) % 256; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Width Relief Notification to the wire, 23 bytes from where the cursor stands */
inline encode_opening_width_relief_notification(opening_width_relief_notification_record) {
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 8 -> wire[at] = opening_width_relief_notification_record.notification_time[opening_width_relief_notification_at]; at = at + 1; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 11 -> wire[at] = opening_width_relief_notification_record.underlying_symbol[opening_width_relief_notification_at]; at = at + 1; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 4 -> wire[at] = opening_width_relief_notification_record.relief_multiplier[opening_width_relief_notification_at]; at = at + 1; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Width Relief Notification off the wire, 23 bytes from where the cursor stands */
inline decode_opening_width_relief_notification(opening_width_relief_notification_record) {
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 8 -> opening_width_relief_notification_record.notification_time[opening_width_relief_notification_at] = wire[at]; at = at + 1; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 11 -> opening_width_relief_notification_record.underlying_symbol[opening_width_relief_notification_at] = wire[at]; at = at + 1; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 4 -> opening_width_relief_notification_record.relief_multiplier[opening_width_relief_notification_at] = wire[at]; at = at + 1; opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Width Relief Notification is what was written, byte for byte */
inline equal_opening_width_relief_notification(opening_width_relief_notification_read, opening_width_relief_notification_written) {
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 8 -> assert(opening_width_relief_notification_read.notification_time[opening_width_relief_notification_at] == opening_width_relief_notification_written.notification_time[opening_width_relief_notification_at]); opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 11 -> assert(opening_width_relief_notification_read.underlying_symbol[opening_width_relief_notification_at] == opening_width_relief_notification_written.underlying_symbol[opening_width_relief_notification_at]); opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  opening_width_relief_notification_at = 0;
  do
  :: opening_width_relief_notification_at < 4 -> assert(opening_width_relief_notification_read.relief_multiplier[opening_width_relief_notification_at] == opening_width_relief_notification_written.relief_multiplier[opening_width_relief_notification_at]); opening_width_relief_notification_at = opening_width_relief_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm Protection Settings Notification: 31 bytes -------------------------- */

/* This message format will be used to notify firms of their ARM settings */
typedef ArmProtectionSettingsNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte allowable_engagement_percentage[4];
  byte counting_period_binary_u_2[2];
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
  :: arm_protection_settings_notification_at < 2 -> arm_protection_settings_notification_record.counting_period_binary_u_2[arm_protection_settings_notification_at] = arm_protection_settings_notification_value; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
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
  :: arm_protection_settings_notification_at < 2 -> arm_protection_settings_notification_record.counting_period_binary_u_2[arm_protection_settings_notification_at] = (arm_protection_settings_notification_base + 27 + arm_protection_settings_notification_at + 1) % 256; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
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
  :: arm_protection_settings_notification_at < 2 -> wire[at] = arm_protection_settings_notification_record.counting_period_binary_u_2[arm_protection_settings_notification_at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
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
  :: arm_protection_settings_notification_at < 2 -> arm_protection_settings_notification_record.counting_period_binary_u_2[arm_protection_settings_notification_at] = wire[at]; at = at + 1; arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
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
  :: arm_protection_settings_notification_at < 2 -> assert(arm_protection_settings_notification_read.counting_period_binary_u_2[arm_protection_settings_notification_at] == arm_protection_settings_notification_written.counting_period_binary_u_2[arm_protection_settings_notification_at]); arm_protection_settings_notification_at = arm_protection_settings_notification_at + 1
  :: else -> break
  od;
  assert(arm_protection_settings_notification_read.action == arm_protection_settings_notification_written.action);
  assert(arm_protection_settings_notification_read.source == arm_protection_settings_notification_written.source);
  skip
}

/* ---- Arm 2 Underlying Level Protection Settings Notification: 48 bytes ------- */

/* This message format will be used to notify firms of their ARM2 Underlying Level protection settings */
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

/* This message format will be used to notify firms when a Single Side Liquidity Protection is triggered for an Option or Strategy */
typedef SingleSideLiquidityProtectionTriggerNotification {
  byte notification_time[8];
  byte mpid[4];
  byte security_id_scope;
  byte security_id[4];
  byte side;
  byte triggering_client_message_id[4];
  byte triggering_bulk_order_index;
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
  single_side_liquidity_protection_trigger_notification_record.triggering_bulk_order_index = single_side_liquidity_protection_trigger_notification_value;
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
  single_side_liquidity_protection_trigger_notification_record.triggering_bulk_order_index = (single_side_liquidity_protection_trigger_notification_base + 22 + 1) % 256;
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
  wire[at] = single_side_liquidity_protection_trigger_notification_record.triggering_bulk_order_index; at = at + 1;
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
  single_side_liquidity_protection_trigger_notification_record.triggering_bulk_order_index = wire[at]; at = at + 1;
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
  assert(single_side_liquidity_protection_trigger_notification_read.triggering_bulk_order_index == single_side_liquidity_protection_trigger_notification_written.triggering_bulk_order_index);
  single_side_liquidity_protection_trigger_notification_at = 0;
  do
  :: single_side_liquidity_protection_trigger_notification_at < 4 -> assert(single_side_liquidity_protection_trigger_notification_read.reserved_4[single_side_liquidity_protection_trigger_notification_at] == single_side_liquidity_protection_trigger_notification_written.reserved_4[single_side_liquidity_protection_trigger_notification_at]); single_side_liquidity_protection_trigger_notification_at = single_side_liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm 2 Underlying Level Protection Notification: 48 bytes ---------------- */

/* This message format will be used to notify firms about ARM2 Underlying Level protection events */
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

/* This message format will be used to notify firms about ARM2 Firm Level protection events */
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

/* ---- Cancel Notification: 48 bytes ------------------------------------------- */

/* This is the message format that will be used to notify firms about Simple or Complex order cancels. By default this is not a sequenced message; firms can request it to be configured as a sequenced message */
typedef CancelNotification {
  byte notification_time[8];
  byte mpid[4];
  byte security_id_scope;
  byte security_id[4];
  byte client_message_id[4];
  byte client_order_id[4];
  byte bulk_order_index;
  byte side;
  byte size[4];
  byte engine_sequence_number[8];
  byte cancel_reason;
  byte reserved_8[8]
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
  cancel_notification_record.security_id_scope = cancel_notification_value;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.security_id[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_message_id[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_order_id[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.bulk_order_index = cancel_notification_value;
  cancel_notification_record.side = cancel_notification_value;
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
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.reserved_8[cancel_notification_at] = cancel_notification_value; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
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
  cancel_notification_record.security_id_scope = (cancel_notification_base + 12 + 1) % 256;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.security_id[cancel_notification_at] = (cancel_notification_base + 13 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_message_id[cancel_notification_at] = (cancel_notification_base + 17 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_order_id[cancel_notification_at] = (cancel_notification_base + 21 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.bulk_order_index = (cancel_notification_base + 25 + 1) % 256;
  cancel_notification_record.side = (cancel_notification_base + 26 + 1) % 256;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.size[cancel_notification_at] = (cancel_notification_base + 27 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.engine_sequence_number[cancel_notification_at] = (cancel_notification_base + 31 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.cancel_reason = (cancel_notification_base + 39 + 1) % 256;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.reserved_8[cancel_notification_at] = (cancel_notification_base + 40 + cancel_notification_at + 1) % 256; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Notification to the wire, 48 bytes from where the cursor stands */
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
  wire[at] = cancel_notification_record.security_id_scope; at = at + 1;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.security_id[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.client_message_id[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> wire[at] = cancel_notification_record.client_order_id[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  wire[at] = cancel_notification_record.bulk_order_index; at = at + 1;
  wire[at] = cancel_notification_record.side; at = at + 1;
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
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> wire[at] = cancel_notification_record.reserved_8[cancel_notification_at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Notification off the wire, 48 bytes from where the cursor stands */
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
  cancel_notification_record.security_id_scope = wire[at]; at = at + 1;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.security_id[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_message_id[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> cancel_notification_record.client_order_id[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_record.bulk_order_index = wire[at]; at = at + 1;
  cancel_notification_record.side = wire[at]; at = at + 1;
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
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> cancel_notification_record.reserved_8[cancel_notification_at] = wire[at]; at = at + 1; cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
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
  assert(cancel_notification_read.security_id_scope == cancel_notification_written.security_id_scope);
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.security_id[cancel_notification_at] == cancel_notification_written.security_id[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.client_message_id[cancel_notification_at] == cancel_notification_written.client_message_id[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 4 -> assert(cancel_notification_read.client_order_id[cancel_notification_at] == cancel_notification_written.client_order_id[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  assert(cancel_notification_read.bulk_order_index == cancel_notification_written.bulk_order_index);
  assert(cancel_notification_read.side == cancel_notification_written.side);
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
  cancel_notification_at = 0;
  do
  :: cancel_notification_at < 8 -> assert(cancel_notification_read.reserved_8[cancel_notification_at] == cancel_notification_written.reserved_8[cancel_notification_at]); cancel_notification_at = cancel_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Notification: 64 bytes ---------------------------------------- */

/* This message format will be used to notify the firms of executions of their orders */
typedef ExecutionNotification {
  byte notification_time[8];
  byte mpid[4];
  byte security_id_scope;
  byte security_id[4];
  byte client_message_id[4];
  byte client_order_id[4];
  byte bulk_order_index;
  byte trade_id[4];
  byte execution_id[8];
  byte trade_status;
  byte last_price[4];
  byte side;
  byte last_size[4];
  byte liquidity_indicator;
  byte reserved_15[15]
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
  execution_notification_record.security_id_scope = execution_notification_value;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.security_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_message_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_order_id[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.bulk_order_index = execution_notification_value;
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
  execution_notification_record.liquidity_indicator = execution_notification_value;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 15 -> execution_notification_record.reserved_15[execution_notification_at] = execution_notification_value; execution_notification_at = execution_notification_at + 1
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
  execution_notification_record.security_id_scope = (execution_notification_base + 12 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.security_id[execution_notification_at] = (execution_notification_base + 13 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_message_id[execution_notification_at] = (execution_notification_base + 17 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_order_id[execution_notification_at] = (execution_notification_base + 21 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.bulk_order_index = (execution_notification_base + 25 + 1) % 256;
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
  execution_notification_record.trade_status = (execution_notification_base + 38 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_price[execution_notification_at] = (execution_notification_base + 39 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.side = (execution_notification_base + 43 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.last_size[execution_notification_at] = (execution_notification_base + 44 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.liquidity_indicator = (execution_notification_base + 48 + 1) % 256;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 15 -> execution_notification_record.reserved_15[execution_notification_at] = (execution_notification_base + 49 + execution_notification_at + 1) % 256; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notification to the wire, 64 bytes from where the cursor stands */
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
  wire[at] = execution_notification_record.security_id_scope; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.security_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.client_message_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> wire[at] = execution_notification_record.client_order_id[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  wire[at] = execution_notification_record.bulk_order_index; at = at + 1;
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
  wire[at] = execution_notification_record.liquidity_indicator; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 15 -> wire[at] = execution_notification_record.reserved_15[execution_notification_at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notification off the wire, 64 bytes from where the cursor stands */
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
  execution_notification_record.security_id_scope = wire[at]; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.security_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_message_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> execution_notification_record.client_order_id[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_record.bulk_order_index = wire[at]; at = at + 1;
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
  execution_notification_record.liquidity_indicator = wire[at]; at = at + 1;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 15 -> execution_notification_record.reserved_15[execution_notification_at] = wire[at]; at = at + 1; execution_notification_at = execution_notification_at + 1
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
  assert(execution_notification_read.security_id_scope == execution_notification_written.security_id_scope);
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.security_id[execution_notification_at] == execution_notification_written.security_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.client_message_id[execution_notification_at] == execution_notification_written.client_message_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  execution_notification_at = 0;
  do
  :: execution_notification_at < 4 -> assert(execution_notification_read.client_order_id[execution_notification_at] == execution_notification_written.client_order_id[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  assert(execution_notification_read.bulk_order_index == execution_notification_written.bulk_order_index);
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
  assert(execution_notification_read.liquidity_indicator == execution_notification_written.liquidity_indicator);
  execution_notification_at = 0;
  do
  :: execution_notification_at < 15 -> assert(execution_notification_read.reserved_15[execution_notification_at] == execution_notification_written.reserved_15[execution_notification_at]); execution_notification_at = execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Leg Execution Notification: 67 bytes ------------------------------ */

/* This message format will be used to notify the firm of a stock leg execution from a stock-tied complex binary order */
typedef StockLegExecutionNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte liquidity_type;
  byte client_message_id[4];
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
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.trade_id[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 28 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 8 -> stock_leg_execution_notification_record.execution_id[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 32 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.trade_status = (stock_leg_execution_notification_base + 40 + 1) % 256;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_price[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 41 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_record.side = (stock_leg_execution_notification_base + 45 + 1) % 256;
  stock_leg_execution_notification_record.stock_sell_short_indicator = (stock_leg_execution_notification_base + 46 + 1) % 256;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 4 -> stock_leg_execution_notification_record.last_size[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 47 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  stock_leg_execution_notification_at = 0;
  do
  :: stock_leg_execution_notification_at < 16 -> stock_leg_execution_notification_record.reserved_16[stock_leg_execution_notification_at] = (stock_leg_execution_notification_base + 51 + stock_leg_execution_notification_at + 1) % 256; stock_leg_execution_notification_at = stock_leg_execution_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Leg Execution Notification to the wire, 67 bytes from where the cursor stands */
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

/* Stock Leg Execution Notification off the wire, 67 bytes from where the cursor stands */
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

/* ---- Arm Settings Update Request: 26 bytes ----------------------------------- */

/* Firms can use this message format to set up their ARM protection settings for each session. Changes to these settings can be made throughout the day */
typedef ArmSettingsUpdateRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte action;
  byte underlying_symbol[11];
  byte allowable_engagement_percentage[4];
  byte counting_period_binary_u_2[2]
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
  :: arm_settings_update_request_at < 2 -> arm_settings_update_request_record.counting_period_binary_u_2[arm_settings_update_request_at] = arm_settings_update_request_value; arm_settings_update_request_at = arm_settings_update_request_at + 1
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
  :: arm_settings_update_request_at < 2 -> arm_settings_update_request_record.counting_period_binary_u_2[arm_settings_update_request_at] = (arm_settings_update_request_base + 24 + arm_settings_update_request_at + 1) % 256; arm_settings_update_request_at = arm_settings_update_request_at + 1
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
  :: arm_settings_update_request_at < 2 -> wire[at] = arm_settings_update_request_record.counting_period_binary_u_2[arm_settings_update_request_at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
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
  :: arm_settings_update_request_at < 2 -> arm_settings_update_request_record.counting_period_binary_u_2[arm_settings_update_request_at] = wire[at]; at = at + 1; arm_settings_update_request_at = arm_settings_update_request_at + 1
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
  :: arm_settings_update_request_at < 2 -> assert(arm_settings_update_request_read.counting_period_binary_u_2[arm_settings_update_request_at] == arm_settings_update_request_written.counting_period_binary_u_2[arm_settings_update_request_at]); arm_settings_update_request_at = arm_settings_update_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Arm Settings Update Response: 20 bytes ---------------------------------- */

/* Sapphire uses this format to respond to the firm with a status of their ARM protection settings request */
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

/* ---- Arm 2 Underlying Level Protection Settings Update Request: 28 bytes ----- */

/* Firms can use this message format to set up their ARM2 Underlying Level protection settings for each session. Changes to these settings can be made throughout the day */
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

/* Sapphire uses this format to respond to the firm with a status of their ARM2 Underlying level protection Settings Update Request */
typedef Arm2UnderlyingLevelProtectionSettingsUpdateResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11];
  byte arm_2_settings_update_status
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
  arm2_underlying_level_protection_settings_update_response_record.arm_2_settings_update_status = arm2_underlying_level_protection_settings_update_response_value;
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
  arm2_underlying_level_protection_settings_update_response_record.arm_2_settings_update_status = (arm2_underlying_level_protection_settings_update_response_base + 19 + 1) % 256;
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
  wire[at] = arm2_underlying_level_protection_settings_update_response_record.arm_2_settings_update_status; at = at + 1;
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
  arm2_underlying_level_protection_settings_update_response_record.arm_2_settings_update_status = wire[at]; at = at + 1;
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
  assert(arm2_underlying_level_protection_settings_update_response_read.arm_2_settings_update_status == arm2_underlying_level_protection_settings_update_response_written.arm_2_settings_update_status);
  skip
}

/* ---- Series Assignment Request: 13 bytes ------------------------------------- */

/* Market Making firms can use this message format to communicate to Sapphire which of their MM MPIDs is assigned or unassigned in a product */
typedef SeriesAssignmentRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte product_id[4];
  byte action
};

int series_assignment_request_at;

/* every byte of Series Assignment Request set to one value */
inline fill_series_assignment_request(series_assignment_request_record, series_assignment_request_value) {
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.client_message_id[series_assignment_request_at] = series_assignment_request_value; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.mpid[series_assignment_request_at] = series_assignment_request_value; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.product_id[series_assignment_request_at] = series_assignment_request_value; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_record.action = series_assignment_request_value;
  skip
}

/* each byte of Series Assignment Request set to where it lies, so a field read out of place says so */
inline ramp_series_assignment_request(series_assignment_request_record, series_assignment_request_base) {
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.client_message_id[series_assignment_request_at] = (series_assignment_request_base + 0 + series_assignment_request_at + 1) % 256; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.mpid[series_assignment_request_at] = (series_assignment_request_base + 4 + series_assignment_request_at + 1) % 256; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.product_id[series_assignment_request_at] = (series_assignment_request_base + 8 + series_assignment_request_at + 1) % 256; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_record.action = (series_assignment_request_base + 12 + 1) % 256;
  skip
}

/* Series Assignment Request to the wire, 13 bytes from where the cursor stands */
inline encode_series_assignment_request(series_assignment_request_record) {
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> wire[at] = series_assignment_request_record.client_message_id[series_assignment_request_at]; at = at + 1; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> wire[at] = series_assignment_request_record.mpid[series_assignment_request_at]; at = at + 1; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> wire[at] = series_assignment_request_record.product_id[series_assignment_request_at]; at = at + 1; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  wire[at] = series_assignment_request_record.action; at = at + 1;
  skip
}

/* Series Assignment Request off the wire, 13 bytes from where the cursor stands */
inline decode_series_assignment_request(series_assignment_request_record) {
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.client_message_id[series_assignment_request_at] = wire[at]; at = at + 1; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.mpid[series_assignment_request_at] = wire[at]; at = at + 1; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> series_assignment_request_record.product_id[series_assignment_request_at] = wire[at]; at = at + 1; series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_record.action = wire[at]; at = at + 1;
  skip
}

/* what was read of Series Assignment Request is what was written, byte for byte */
inline equal_series_assignment_request(series_assignment_request_read, series_assignment_request_written) {
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> assert(series_assignment_request_read.client_message_id[series_assignment_request_at] == series_assignment_request_written.client_message_id[series_assignment_request_at]); series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> assert(series_assignment_request_read.mpid[series_assignment_request_at] == series_assignment_request_written.mpid[series_assignment_request_at]); series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  series_assignment_request_at = 0;
  do
  :: series_assignment_request_at < 4 -> assert(series_assignment_request_read.product_id[series_assignment_request_at] == series_assignment_request_written.product_id[series_assignment_request_at]); series_assignment_request_at = series_assignment_request_at + 1
  :: else -> break
  od;
  assert(series_assignment_request_read.action == series_assignment_request_written.action);
  skip
}

/* ---- Series Assignment Response: 9 bytes ------------------------------------- */

/* Sapphire uses this format to respond to the firm assignment request */
typedef SeriesAssignmentResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte assignment_settings_status
};

int series_assignment_response_at;

/* every byte of Series Assignment Response set to one value */
inline fill_series_assignment_response(series_assignment_response_record, series_assignment_response_value) {
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> series_assignment_response_record.client_message_id[series_assignment_response_at] = series_assignment_response_value; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> series_assignment_response_record.mpid[series_assignment_response_at] = series_assignment_response_value; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_record.assignment_settings_status = series_assignment_response_value;
  skip
}

/* each byte of Series Assignment Response set to where it lies, so a field read out of place says so */
inline ramp_series_assignment_response(series_assignment_response_record, series_assignment_response_base) {
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> series_assignment_response_record.client_message_id[series_assignment_response_at] = (series_assignment_response_base + 0 + series_assignment_response_at + 1) % 256; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> series_assignment_response_record.mpid[series_assignment_response_at] = (series_assignment_response_base + 4 + series_assignment_response_at + 1) % 256; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_record.assignment_settings_status = (series_assignment_response_base + 8 + 1) % 256;
  skip
}

/* Series Assignment Response to the wire, 9 bytes from where the cursor stands */
inline encode_series_assignment_response(series_assignment_response_record) {
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> wire[at] = series_assignment_response_record.client_message_id[series_assignment_response_at]; at = at + 1; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> wire[at] = series_assignment_response_record.mpid[series_assignment_response_at]; at = at + 1; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  wire[at] = series_assignment_response_record.assignment_settings_status; at = at + 1;
  skip
}

/* Series Assignment Response off the wire, 9 bytes from where the cursor stands */
inline decode_series_assignment_response(series_assignment_response_record) {
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> series_assignment_response_record.client_message_id[series_assignment_response_at] = wire[at]; at = at + 1; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> series_assignment_response_record.mpid[series_assignment_response_at] = wire[at]; at = at + 1; series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_record.assignment_settings_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Series Assignment Response is what was written, byte for byte */
inline equal_series_assignment_response(series_assignment_response_read, series_assignment_response_written) {
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> assert(series_assignment_response_read.client_message_id[series_assignment_response_at] == series_assignment_response_written.client_message_id[series_assignment_response_at]); series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  series_assignment_response_at = 0;
  do
  :: series_assignment_response_at < 4 -> assert(series_assignment_response_read.mpid[series_assignment_response_at] == series_assignment_response_written.mpid[series_assignment_response_at]); series_assignment_response_at = series_assignment_response_at + 1
  :: else -> break
  od;
  assert(series_assignment_response_read.assignment_settings_status == series_assignment_response_written.assignment_settings_status);
  skip
}

/* ---- Complex Binary Order Request: 51 bytes ---------------------------------- */

/* This is the format for a Complex Binary Order message that can be sent to match with a resting Complex orders on the complex book */
typedef ComplexBinaryOrderRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte client_send_time[8];
  byte strategy_id[4];
  byte time_in_force;
  byte price_binary_prc_4s_8[8];
  byte size[4];
  byte side;
  byte stock_sell_short_indicator;
  byte reserved_16[16]
};

int complex_binary_order_request_at;

/* every byte of Complex Binary Order Request set to one value */
inline fill_complex_binary_order_request(complex_binary_order_request_record, complex_binary_order_request_value) {
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.client_message_id[complex_binary_order_request_at] = complex_binary_order_request_value; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.mpid[complex_binary_order_request_at] = complex_binary_order_request_value; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> complex_binary_order_request_record.client_send_time[complex_binary_order_request_at] = complex_binary_order_request_value; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.strategy_id[complex_binary_order_request_at] = complex_binary_order_request_value; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_record.time_in_force = complex_binary_order_request_value;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> complex_binary_order_request_record.price_binary_prc_4s_8[complex_binary_order_request_at] = complex_binary_order_request_value; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.size[complex_binary_order_request_at] = complex_binary_order_request_value; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_record.side = complex_binary_order_request_value;
  complex_binary_order_request_record.stock_sell_short_indicator = complex_binary_order_request_value;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 16 -> complex_binary_order_request_record.reserved_16[complex_binary_order_request_at] = complex_binary_order_request_value; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Binary Order Request set to where it lies, so a field read out of place says so */
inline ramp_complex_binary_order_request(complex_binary_order_request_record, complex_binary_order_request_base) {
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.client_message_id[complex_binary_order_request_at] = (complex_binary_order_request_base + 0 + complex_binary_order_request_at + 1) % 256; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.mpid[complex_binary_order_request_at] = (complex_binary_order_request_base + 4 + complex_binary_order_request_at + 1) % 256; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> complex_binary_order_request_record.client_send_time[complex_binary_order_request_at] = (complex_binary_order_request_base + 8 + complex_binary_order_request_at + 1) % 256; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.strategy_id[complex_binary_order_request_at] = (complex_binary_order_request_base + 16 + complex_binary_order_request_at + 1) % 256; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_record.time_in_force = (complex_binary_order_request_base + 20 + 1) % 256;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> complex_binary_order_request_record.price_binary_prc_4s_8[complex_binary_order_request_at] = (complex_binary_order_request_base + 21 + complex_binary_order_request_at + 1) % 256; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.size[complex_binary_order_request_at] = (complex_binary_order_request_base + 29 + complex_binary_order_request_at + 1) % 256; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_record.side = (complex_binary_order_request_base + 33 + 1) % 256;
  complex_binary_order_request_record.stock_sell_short_indicator = (complex_binary_order_request_base + 34 + 1) % 256;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 16 -> complex_binary_order_request_record.reserved_16[complex_binary_order_request_at] = (complex_binary_order_request_base + 35 + complex_binary_order_request_at + 1) % 256; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Binary Order Request to the wire, 51 bytes from where the cursor stands */
inline encode_complex_binary_order_request(complex_binary_order_request_record) {
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> wire[at] = complex_binary_order_request_record.client_message_id[complex_binary_order_request_at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> wire[at] = complex_binary_order_request_record.mpid[complex_binary_order_request_at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> wire[at] = complex_binary_order_request_record.client_send_time[complex_binary_order_request_at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> wire[at] = complex_binary_order_request_record.strategy_id[complex_binary_order_request_at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  wire[at] = complex_binary_order_request_record.time_in_force; at = at + 1;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> wire[at] = complex_binary_order_request_record.price_binary_prc_4s_8[complex_binary_order_request_at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> wire[at] = complex_binary_order_request_record.size[complex_binary_order_request_at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  wire[at] = complex_binary_order_request_record.side; at = at + 1;
  wire[at] = complex_binary_order_request_record.stock_sell_short_indicator; at = at + 1;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 16 -> wire[at] = complex_binary_order_request_record.reserved_16[complex_binary_order_request_at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Binary Order Request off the wire, 51 bytes from where the cursor stands */
inline decode_complex_binary_order_request(complex_binary_order_request_record) {
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.client_message_id[complex_binary_order_request_at] = wire[at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.mpid[complex_binary_order_request_at] = wire[at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> complex_binary_order_request_record.client_send_time[complex_binary_order_request_at] = wire[at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.strategy_id[complex_binary_order_request_at] = wire[at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_record.time_in_force = wire[at]; at = at + 1;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> complex_binary_order_request_record.price_binary_prc_4s_8[complex_binary_order_request_at] = wire[at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> complex_binary_order_request_record.size[complex_binary_order_request_at] = wire[at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_record.side = wire[at]; at = at + 1;
  complex_binary_order_request_record.stock_sell_short_indicator = wire[at]; at = at + 1;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 16 -> complex_binary_order_request_record.reserved_16[complex_binary_order_request_at] = wire[at]; at = at + 1; complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Binary Order Request is what was written, byte for byte */
inline equal_complex_binary_order_request(complex_binary_order_request_read, complex_binary_order_request_written) {
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> assert(complex_binary_order_request_read.client_message_id[complex_binary_order_request_at] == complex_binary_order_request_written.client_message_id[complex_binary_order_request_at]); complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> assert(complex_binary_order_request_read.mpid[complex_binary_order_request_at] == complex_binary_order_request_written.mpid[complex_binary_order_request_at]); complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> assert(complex_binary_order_request_read.client_send_time[complex_binary_order_request_at] == complex_binary_order_request_written.client_send_time[complex_binary_order_request_at]); complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> assert(complex_binary_order_request_read.strategy_id[complex_binary_order_request_at] == complex_binary_order_request_written.strategy_id[complex_binary_order_request_at]); complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  assert(complex_binary_order_request_read.time_in_force == complex_binary_order_request_written.time_in_force);
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 8 -> assert(complex_binary_order_request_read.price_binary_prc_4s_8[complex_binary_order_request_at] == complex_binary_order_request_written.price_binary_prc_4s_8[complex_binary_order_request_at]); complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 4 -> assert(complex_binary_order_request_read.size[complex_binary_order_request_at] == complex_binary_order_request_written.size[complex_binary_order_request_at]); complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  assert(complex_binary_order_request_read.side == complex_binary_order_request_written.side);
  assert(complex_binary_order_request_read.stock_sell_short_indicator == complex_binary_order_request_written.stock_sell_short_indicator);
  complex_binary_order_request_at = 0;
  do
  :: complex_binary_order_request_at < 16 -> assert(complex_binary_order_request_read.reserved_16[complex_binary_order_request_at] == complex_binary_order_request_written.reserved_16[complex_binary_order_request_at]); complex_binary_order_request_at = complex_binary_order_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Liquidity Mass Cancel Request: 35 bytes --------------------------------- */

/* Firms can use this message format to request the cancelation of all Simple orders for an MPID for all series for an underlying */
typedef LiquidityMassCancelRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte client_send_time[8];
  byte underlying_symbol[11];
  byte mass_cancel_scope;
  byte reserved_7[7]
};

int liquidity_mass_cancel_request_at;

/* every byte of Liquidity Mass Cancel Request set to one value */
inline fill_liquidity_mass_cancel_request(liquidity_mass_cancel_request_record, liquidity_mass_cancel_request_value) {
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> liquidity_mass_cancel_request_record.client_message_id[liquidity_mass_cancel_request_at] = liquidity_mass_cancel_request_value; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> liquidity_mass_cancel_request_record.mpid[liquidity_mass_cancel_request_at] = liquidity_mass_cancel_request_value; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 8 -> liquidity_mass_cancel_request_record.client_send_time[liquidity_mass_cancel_request_at] = liquidity_mass_cancel_request_value; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 11 -> liquidity_mass_cancel_request_record.underlying_symbol[liquidity_mass_cancel_request_at] = liquidity_mass_cancel_request_value; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_record.mass_cancel_scope = liquidity_mass_cancel_request_value;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 7 -> liquidity_mass_cancel_request_record.reserved_7[liquidity_mass_cancel_request_at] = liquidity_mass_cancel_request_value; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Liquidity Mass Cancel Request set to where it lies, so a field read out of place says so */
inline ramp_liquidity_mass_cancel_request(liquidity_mass_cancel_request_record, liquidity_mass_cancel_request_base) {
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> liquidity_mass_cancel_request_record.client_message_id[liquidity_mass_cancel_request_at] = (liquidity_mass_cancel_request_base + 0 + liquidity_mass_cancel_request_at + 1) % 256; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> liquidity_mass_cancel_request_record.mpid[liquidity_mass_cancel_request_at] = (liquidity_mass_cancel_request_base + 4 + liquidity_mass_cancel_request_at + 1) % 256; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 8 -> liquidity_mass_cancel_request_record.client_send_time[liquidity_mass_cancel_request_at] = (liquidity_mass_cancel_request_base + 8 + liquidity_mass_cancel_request_at + 1) % 256; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 11 -> liquidity_mass_cancel_request_record.underlying_symbol[liquidity_mass_cancel_request_at] = (liquidity_mass_cancel_request_base + 16 + liquidity_mass_cancel_request_at + 1) % 256; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_record.mass_cancel_scope = (liquidity_mass_cancel_request_base + 27 + 1) % 256;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 7 -> liquidity_mass_cancel_request_record.reserved_7[liquidity_mass_cancel_request_at] = (liquidity_mass_cancel_request_base + 28 + liquidity_mass_cancel_request_at + 1) % 256; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Mass Cancel Request to the wire, 35 bytes from where the cursor stands */
inline encode_liquidity_mass_cancel_request(liquidity_mass_cancel_request_record) {
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> wire[at] = liquidity_mass_cancel_request_record.client_message_id[liquidity_mass_cancel_request_at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> wire[at] = liquidity_mass_cancel_request_record.mpid[liquidity_mass_cancel_request_at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 8 -> wire[at] = liquidity_mass_cancel_request_record.client_send_time[liquidity_mass_cancel_request_at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 11 -> wire[at] = liquidity_mass_cancel_request_record.underlying_symbol[liquidity_mass_cancel_request_at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_mass_cancel_request_record.mass_cancel_scope; at = at + 1;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 7 -> wire[at] = liquidity_mass_cancel_request_record.reserved_7[liquidity_mass_cancel_request_at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Liquidity Mass Cancel Request off the wire, 35 bytes from where the cursor stands */
inline decode_liquidity_mass_cancel_request(liquidity_mass_cancel_request_record) {
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> liquidity_mass_cancel_request_record.client_message_id[liquidity_mass_cancel_request_at] = wire[at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> liquidity_mass_cancel_request_record.mpid[liquidity_mass_cancel_request_at] = wire[at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 8 -> liquidity_mass_cancel_request_record.client_send_time[liquidity_mass_cancel_request_at] = wire[at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 11 -> liquidity_mass_cancel_request_record.underlying_symbol[liquidity_mass_cancel_request_at] = wire[at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_record.mass_cancel_scope = wire[at]; at = at + 1;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 7 -> liquidity_mass_cancel_request_record.reserved_7[liquidity_mass_cancel_request_at] = wire[at]; at = at + 1; liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Liquidity Mass Cancel Request is what was written, byte for byte */
inline equal_liquidity_mass_cancel_request(liquidity_mass_cancel_request_read, liquidity_mass_cancel_request_written) {
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> assert(liquidity_mass_cancel_request_read.client_message_id[liquidity_mass_cancel_request_at] == liquidity_mass_cancel_request_written.client_message_id[liquidity_mass_cancel_request_at]); liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 4 -> assert(liquidity_mass_cancel_request_read.mpid[liquidity_mass_cancel_request_at] == liquidity_mass_cancel_request_written.mpid[liquidity_mass_cancel_request_at]); liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 8 -> assert(liquidity_mass_cancel_request_read.client_send_time[liquidity_mass_cancel_request_at] == liquidity_mass_cancel_request_written.client_send_time[liquidity_mass_cancel_request_at]); liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 11 -> assert(liquidity_mass_cancel_request_read.underlying_symbol[liquidity_mass_cancel_request_at] == liquidity_mass_cancel_request_written.underlying_symbol[liquidity_mass_cancel_request_at]); liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  assert(liquidity_mass_cancel_request_read.mass_cancel_scope == liquidity_mass_cancel_request_written.mass_cancel_scope);
  liquidity_mass_cancel_request_at = 0;
  do
  :: liquidity_mass_cancel_request_at < 7 -> assert(liquidity_mass_cancel_request_read.reserved_7[liquidity_mass_cancel_request_at] == liquidity_mass_cancel_request_written.reserved_7[liquidity_mass_cancel_request_at]); liquidity_mass_cancel_request_at = liquidity_mass_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Liquidity Mass Cancel Response: 9 bytes --------------------------------- */

/* This message format will be used to inform the firm about the status of their previous Mass Cancel request */
typedef LiquidityMassCancelResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte status
};

int liquidity_mass_cancel_response_at;

/* every byte of Liquidity Mass Cancel Response set to one value */
inline fill_liquidity_mass_cancel_response(liquidity_mass_cancel_response_record, liquidity_mass_cancel_response_value) {
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> liquidity_mass_cancel_response_record.client_message_id[liquidity_mass_cancel_response_at] = liquidity_mass_cancel_response_value; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> liquidity_mass_cancel_response_record.mpid[liquidity_mass_cancel_response_at] = liquidity_mass_cancel_response_value; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_record.status = liquidity_mass_cancel_response_value;
  skip
}

/* each byte of Liquidity Mass Cancel Response set to where it lies, so a field read out of place says so */
inline ramp_liquidity_mass_cancel_response(liquidity_mass_cancel_response_record, liquidity_mass_cancel_response_base) {
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> liquidity_mass_cancel_response_record.client_message_id[liquidity_mass_cancel_response_at] = (liquidity_mass_cancel_response_base + 0 + liquidity_mass_cancel_response_at + 1) % 256; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> liquidity_mass_cancel_response_record.mpid[liquidity_mass_cancel_response_at] = (liquidity_mass_cancel_response_base + 4 + liquidity_mass_cancel_response_at + 1) % 256; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_record.status = (liquidity_mass_cancel_response_base + 8 + 1) % 256;
  skip
}

/* Liquidity Mass Cancel Response to the wire, 9 bytes from where the cursor stands */
inline encode_liquidity_mass_cancel_response(liquidity_mass_cancel_response_record) {
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> wire[at] = liquidity_mass_cancel_response_record.client_message_id[liquidity_mass_cancel_response_at]; at = at + 1; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> wire[at] = liquidity_mass_cancel_response_record.mpid[liquidity_mass_cancel_response_at]; at = at + 1; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_mass_cancel_response_record.status; at = at + 1;
  skip
}

/* Liquidity Mass Cancel Response off the wire, 9 bytes from where the cursor stands */
inline decode_liquidity_mass_cancel_response(liquidity_mass_cancel_response_record) {
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> liquidity_mass_cancel_response_record.client_message_id[liquidity_mass_cancel_response_at] = wire[at]; at = at + 1; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> liquidity_mass_cancel_response_record.mpid[liquidity_mass_cancel_response_at] = wire[at]; at = at + 1; liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Liquidity Mass Cancel Response is what was written, byte for byte */
inline equal_liquidity_mass_cancel_response(liquidity_mass_cancel_response_read, liquidity_mass_cancel_response_written) {
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> assert(liquidity_mass_cancel_response_read.client_message_id[liquidity_mass_cancel_response_at] == liquidity_mass_cancel_response_written.client_message_id[liquidity_mass_cancel_response_at]); liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  liquidity_mass_cancel_response_at = 0;
  do
  :: liquidity_mass_cancel_response_at < 4 -> assert(liquidity_mass_cancel_response_read.mpid[liquidity_mass_cancel_response_at] == liquidity_mass_cancel_response_written.mpid[liquidity_mass_cancel_response_at]); liquidity_mass_cancel_response_at = liquidity_mass_cancel_response_at + 1
  :: else -> break
  od;
  assert(liquidity_mass_cancel_response_read.status == liquidity_mass_cancel_response_written.status);
  skip
}

/* ---- Liquidity Protection Reset Request: 19 bytes ---------------------------- */

/* Following an order protection being engaged for a given MPID and underlying, firms must use this message format to reset their Order Protection in order to start sending orders for any option or a complex strategy of the specified underlying */
typedef LiquidityProtectionResetRequest {
  byte client_message_id[4];
  byte mpid[4];
  byte underlying_symbol[11]
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
  skip
}

/* Liquidity Protection Reset Request to the wire, 19 bytes from where the cursor stands */
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
  skip
}

/* Liquidity Protection Reset Request off the wire, 19 bytes from where the cursor stands */
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
  skip
}

/* ---- Liquidity Protection Reset Response: 9 bytes ---------------------------- */

/* This message format is used to inform the firms of the status of their Order Protection Reset Request */
typedef LiquidityProtectionResetResponse {
  byte client_message_id[4];
  byte mpid[4];
  byte status
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
  liquidity_protection_reset_response_record.status = liquidity_protection_reset_response_value;
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
  liquidity_protection_reset_response_record.status = (liquidity_protection_reset_response_base + 8 + 1) % 256;
  skip
}

/* Liquidity Protection Reset Response to the wire, 9 bytes from where the cursor stands */
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
  wire[at] = liquidity_protection_reset_response_record.status; at = at + 1;
  skip
}

/* Liquidity Protection Reset Response off the wire, 9 bytes from where the cursor stands */
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
  liquidity_protection_reset_response_record.status = wire[at]; at = at + 1;
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
  assert(liquidity_protection_reset_response_read.status == liquidity_protection_reset_response_written.status);
  skip
}

/* ---- Single Side Liquidity Protection Reset Request: 18 bytes ---------------- */

/* Request to reset Single Side Liquidity Protection for the specific Option or Complex Strategy */
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

/* ---- Liquidity Protection Trigger Notification: 24 bytes --------------------- */

/* This message format will be used to notify firms when order protection is triggered for an MPID */
typedef LiquidityProtectionTriggerNotification {
  byte notification_time[8];
  byte mpid[4];
  byte underlying_symbol[11];
  byte trigger_reason
};

int liquidity_protection_trigger_notification_at;

/* every byte of Liquidity Protection Trigger Notification set to one value */
inline fill_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_record, liquidity_protection_trigger_notification_value) {
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 8 -> liquidity_protection_trigger_notification_record.notification_time[liquidity_protection_trigger_notification_at] = liquidity_protection_trigger_notification_value; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 4 -> liquidity_protection_trigger_notification_record.mpid[liquidity_protection_trigger_notification_at] = liquidity_protection_trigger_notification_value; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 11 -> liquidity_protection_trigger_notification_record.underlying_symbol[liquidity_protection_trigger_notification_at] = liquidity_protection_trigger_notification_value; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_record.trigger_reason = liquidity_protection_trigger_notification_value;
  skip
}

/* each byte of Liquidity Protection Trigger Notification set to where it lies, so a field read out of place says so */
inline ramp_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_record, liquidity_protection_trigger_notification_base) {
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 8 -> liquidity_protection_trigger_notification_record.notification_time[liquidity_protection_trigger_notification_at] = (liquidity_protection_trigger_notification_base + 0 + liquidity_protection_trigger_notification_at + 1) % 256; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 4 -> liquidity_protection_trigger_notification_record.mpid[liquidity_protection_trigger_notification_at] = (liquidity_protection_trigger_notification_base + 8 + liquidity_protection_trigger_notification_at + 1) % 256; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 11 -> liquidity_protection_trigger_notification_record.underlying_symbol[liquidity_protection_trigger_notification_at] = (liquidity_protection_trigger_notification_base + 12 + liquidity_protection_trigger_notification_at + 1) % 256; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_record.trigger_reason = (liquidity_protection_trigger_notification_base + 23 + 1) % 256;
  skip
}

/* Liquidity Protection Trigger Notification to the wire, 24 bytes from where the cursor stands */
inline encode_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_record) {
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 8 -> wire[at] = liquidity_protection_trigger_notification_record.notification_time[liquidity_protection_trigger_notification_at]; at = at + 1; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 4 -> wire[at] = liquidity_protection_trigger_notification_record.mpid[liquidity_protection_trigger_notification_at]; at = at + 1; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 11 -> wire[at] = liquidity_protection_trigger_notification_record.underlying_symbol[liquidity_protection_trigger_notification_at]; at = at + 1; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  wire[at] = liquidity_protection_trigger_notification_record.trigger_reason; at = at + 1;
  skip
}

/* Liquidity Protection Trigger Notification off the wire, 24 bytes from where the cursor stands */
inline decode_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_record) {
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 8 -> liquidity_protection_trigger_notification_record.notification_time[liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 4 -> liquidity_protection_trigger_notification_record.mpid[liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 11 -> liquidity_protection_trigger_notification_record.underlying_symbol[liquidity_protection_trigger_notification_at] = wire[at]; at = at + 1; liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_record.trigger_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Liquidity Protection Trigger Notification is what was written, byte for byte */
inline equal_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_read, liquidity_protection_trigger_notification_written) {
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 8 -> assert(liquidity_protection_trigger_notification_read.notification_time[liquidity_protection_trigger_notification_at] == liquidity_protection_trigger_notification_written.notification_time[liquidity_protection_trigger_notification_at]); liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 4 -> assert(liquidity_protection_trigger_notification_read.mpid[liquidity_protection_trigger_notification_at] == liquidity_protection_trigger_notification_written.mpid[liquidity_protection_trigger_notification_at]); liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  liquidity_protection_trigger_notification_at = 0;
  do
  :: liquidity_protection_trigger_notification_at < 11 -> assert(liquidity_protection_trigger_notification_read.underlying_symbol[liquidity_protection_trigger_notification_at] == liquidity_protection_trigger_notification_written.underlying_symbol[liquidity_protection_trigger_notification_at]); liquidity_protection_trigger_notification_at = liquidity_protection_trigger_notification_at + 1
  :: else -> break
  od;
  assert(liquidity_protection_trigger_notification_read.trigger_reason == liquidity_protection_trigger_notification_written.trigger_reason);
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

/* Complex Binary Order Response: encoded, read back, and compared */
proctype check_complex_binary_order_response() {
  ComplexBinaryOrderResponse complex_binary_order_response_sent;
  ComplexBinaryOrderResponse complex_binary_order_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_binary_order_response(complex_binary_order_response_sent, 0)
  :: pattern == 1 -> fill_complex_binary_order_response(complex_binary_order_response_sent, 32)
  :: pattern == 2 -> fill_complex_binary_order_response(complex_binary_order_response_sent, 255)
  :: else -> ramp_complex_binary_order_response(complex_binary_order_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_binary_order_response(complex_binary_order_response_sent);
    assert(at == 33);
    at = 0;
    decode_complex_binary_order_response(complex_binary_order_response_got);
    assert(at == 33);
    equal_complex_binary_order_response(complex_binary_order_response_got, complex_binary_order_response_sent)
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

/* Opening Width Relief Notification: encoded, read back, and compared */
proctype check_opening_width_relief_notification() {
  OpeningWidthReliefNotification opening_width_relief_notification_sent;
  OpeningWidthReliefNotification opening_width_relief_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_width_relief_notification(opening_width_relief_notification_sent, 0)
  :: pattern == 1 -> fill_opening_width_relief_notification(opening_width_relief_notification_sent, 32)
  :: pattern == 2 -> fill_opening_width_relief_notification(opening_width_relief_notification_sent, 255)
  :: else -> ramp_opening_width_relief_notification(opening_width_relief_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_width_relief_notification(opening_width_relief_notification_sent);
    assert(at == 23);
    at = 0;
    decode_opening_width_relief_notification(opening_width_relief_notification_got);
    assert(at == 23);
    equal_opening_width_relief_notification(opening_width_relief_notification_got, opening_width_relief_notification_sent)
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
    assert(at == 48);
    at = 0;
    decode_cancel_notification(cancel_notification_got);
    assert(at == 48);
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
    assert(at == 64);
    at = 0;
    decode_execution_notification(execution_notification_got);
    assert(at == 64);
    equal_execution_notification(execution_notification_got, execution_notification_sent)
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
    assert(at == 67);
    at = 0;
    decode_stock_leg_execution_notification(stock_leg_execution_notification_got);
    assert(at == 67);
    equal_stock_leg_execution_notification(stock_leg_execution_notification_got, stock_leg_execution_notification_sent)
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

/* Series Assignment Request: encoded, read back, and compared */
proctype check_series_assignment_request() {
  SeriesAssignmentRequest series_assignment_request_sent;
  SeriesAssignmentRequest series_assignment_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_assignment_request(series_assignment_request_sent, 0)
  :: pattern == 1 -> fill_series_assignment_request(series_assignment_request_sent, 32)
  :: pattern == 2 -> fill_series_assignment_request(series_assignment_request_sent, 255)
  :: else -> ramp_series_assignment_request(series_assignment_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_assignment_request(series_assignment_request_sent);
    assert(at == 13);
    at = 0;
    decode_series_assignment_request(series_assignment_request_got);
    assert(at == 13);
    equal_series_assignment_request(series_assignment_request_got, series_assignment_request_sent)
  }
}

/* Series Assignment Response: encoded, read back, and compared */
proctype check_series_assignment_response() {
  SeriesAssignmentResponse series_assignment_response_sent;
  SeriesAssignmentResponse series_assignment_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_series_assignment_response(series_assignment_response_sent, 0)
  :: pattern == 1 -> fill_series_assignment_response(series_assignment_response_sent, 32)
  :: pattern == 2 -> fill_series_assignment_response(series_assignment_response_sent, 255)
  :: else -> ramp_series_assignment_response(series_assignment_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_series_assignment_response(series_assignment_response_sent);
    assert(at == 9);
    at = 0;
    decode_series_assignment_response(series_assignment_response_got);
    assert(at == 9);
    equal_series_assignment_response(series_assignment_response_got, series_assignment_response_sent)
  }
}

/* Complex Binary Order Request: encoded, read back, and compared */
proctype check_complex_binary_order_request() {
  ComplexBinaryOrderRequest complex_binary_order_request_sent;
  ComplexBinaryOrderRequest complex_binary_order_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_binary_order_request(complex_binary_order_request_sent, 0)
  :: pattern == 1 -> fill_complex_binary_order_request(complex_binary_order_request_sent, 32)
  :: pattern == 2 -> fill_complex_binary_order_request(complex_binary_order_request_sent, 255)
  :: else -> ramp_complex_binary_order_request(complex_binary_order_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_binary_order_request(complex_binary_order_request_sent);
    assert(at == 51);
    at = 0;
    decode_complex_binary_order_request(complex_binary_order_request_got);
    assert(at == 51);
    equal_complex_binary_order_request(complex_binary_order_request_got, complex_binary_order_request_sent)
  }
}

/* Liquidity Mass Cancel Request: encoded, read back, and compared */
proctype check_liquidity_mass_cancel_request() {
  LiquidityMassCancelRequest liquidity_mass_cancel_request_sent;
  LiquidityMassCancelRequest liquidity_mass_cancel_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_mass_cancel_request(liquidity_mass_cancel_request_sent, 0)
  :: pattern == 1 -> fill_liquidity_mass_cancel_request(liquidity_mass_cancel_request_sent, 32)
  :: pattern == 2 -> fill_liquidity_mass_cancel_request(liquidity_mass_cancel_request_sent, 255)
  :: else -> ramp_liquidity_mass_cancel_request(liquidity_mass_cancel_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_mass_cancel_request(liquidity_mass_cancel_request_sent);
    assert(at == 35);
    at = 0;
    decode_liquidity_mass_cancel_request(liquidity_mass_cancel_request_got);
    assert(at == 35);
    equal_liquidity_mass_cancel_request(liquidity_mass_cancel_request_got, liquidity_mass_cancel_request_sent)
  }
}

/* Liquidity Mass Cancel Response: encoded, read back, and compared */
proctype check_liquidity_mass_cancel_response() {
  LiquidityMassCancelResponse liquidity_mass_cancel_response_sent;
  LiquidityMassCancelResponse liquidity_mass_cancel_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_mass_cancel_response(liquidity_mass_cancel_response_sent, 0)
  :: pattern == 1 -> fill_liquidity_mass_cancel_response(liquidity_mass_cancel_response_sent, 32)
  :: pattern == 2 -> fill_liquidity_mass_cancel_response(liquidity_mass_cancel_response_sent, 255)
  :: else -> ramp_liquidity_mass_cancel_response(liquidity_mass_cancel_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_mass_cancel_response(liquidity_mass_cancel_response_sent);
    assert(at == 9);
    at = 0;
    decode_liquidity_mass_cancel_response(liquidity_mass_cancel_response_got);
    assert(at == 9);
    equal_liquidity_mass_cancel_response(liquidity_mass_cancel_response_got, liquidity_mass_cancel_response_sent)
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
    assert(at == 19);
    at = 0;
    decode_liquidity_protection_reset_request(liquidity_protection_reset_request_got);
    assert(at == 19);
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
    assert(at == 9);
    at = 0;
    decode_liquidity_protection_reset_response(liquidity_protection_reset_response_got);
    assert(at == 9);
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

/* Liquidity Protection Trigger Notification: encoded, read back, and compared */
proctype check_liquidity_protection_trigger_notification() {
  LiquidityProtectionTriggerNotification liquidity_protection_trigger_notification_sent;
  LiquidityProtectionTriggerNotification liquidity_protection_trigger_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_sent, 0)
  :: pattern == 1 -> fill_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_sent, 32)
  :: pattern == 2 -> fill_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_sent, 255)
  :: else -> ramp_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_sent);
    assert(at == 24);
    at = 0;
    decode_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_got);
    assert(at == 24);
    equal_liquidity_protection_trigger_notification(liquidity_protection_trigger_notification_got, liquidity_protection_trigger_notification_sent)
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
  :: run check_complex_binary_order_response()
  :: run check_system_state_notification()
  :: run check_underlying_trading_status_notification()
  :: run check_opening_width_relief_notification()
  :: run check_arm_protection_settings_notification()
  :: run check_arm2_underlying_level_protection_settings_notification()
  :: run check_single_side_liquidity_protection_trigger_notification()
  :: run check_arm2_underlying_level_protection_notification()
  :: run check_arm2_firm_level_protection_notification()
  :: run check_cancel_notification()
  :: run check_execution_notification()
  :: run check_stock_leg_execution_notification()
  :: run check_arm_settings_update_request()
  :: run check_arm_settings_update_response()
  :: run check_arm2_underlying_level_protection_settings_update_request()
  :: run check_arm2_underlying_level_protection_settings_update_response()
  :: run check_series_assignment_request()
  :: run check_series_assignment_response()
  :: run check_complex_binary_order_request()
  :: run check_liquidity_mass_cancel_request()
  :: run check_liquidity_mass_cancel_response()
  :: run check_liquidity_protection_reset_request()
  :: run check_liquidity_protection_reset_response()
  :: run check_single_side_liquidity_protection_reset_request()
  :: run check_single_side_liquidity_protection_reset_response()
  :: run check_liquidity_protection_trigger_notification()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_retransmission_request()
  fi
}
