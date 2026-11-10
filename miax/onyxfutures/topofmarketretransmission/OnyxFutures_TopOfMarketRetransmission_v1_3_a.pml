/*
 * Miami International Holdings Top Of Market Retransmission
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
#define WIRE 138

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

/* ---- Simple Instrument Definition Message: 138 bytes ------------------------- */

/* Simple Instrument Definition */
typedef SimpleInstrumentDefinitionMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte underlying_asset_type;
  byte underlying_asset_alphanumeric_4[4];
  byte product_group_code_alphanumeric_6[6];
  byte exchange[4];
  byte instrument_id_source;
  byte instrument_type;
  byte instrument_listing_status;
  byte reserved_3[3];
  byte currency;
  byte settlement_currency;
  byte match_algorithm;
  byte minimum_size[4];
  byte maximum_size[4];
  byte tick[8];
  byte unit_of_measure[5];
  byte unit_of_measure_quantity[4];
  byte settlement_price[8];
  byte settlement_price_type_calc_method;
  byte total_volume[4];
  byte open_interest_quantity[4];
  byte high_limit_price[8];
  byte low_limit_price[8];
  byte trading_collar_variation_type;
  byte trading_collar_variation[8];
  byte contract_date[4];
  byte maturity_date[2];
  byte valuation_date[2];
  byte first_trade_date[2];
  byte last_trade_date[2];
  byte first_notice_date[2];
  byte last_notice_date[2];
  byte first_delivery_date[2];
  byte last_delivery_date[2];
  byte option_strike_price[8];
  byte option_strike_currency;
  byte option_type;
  byte option_expiration_type;
  byte underlying_future_instrument_id[4]
};

int simple_instrument_definition_message_at;

/* every byte of Simple Instrument Definition Message set to one value */
inline fill_simple_instrument_definition_message(simple_instrument_definition_message_record, simple_instrument_definition_message_value) {
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.timestamp[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.instrument_id[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.underlying_asset_type = simple_instrument_definition_message_value;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_asset_alphanumeric_4[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> simple_instrument_definition_message_record.product_group_code_alphanumeric_6[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.instrument_id_source = simple_instrument_definition_message_value;
  simple_instrument_definition_message_record.instrument_type = simple_instrument_definition_message_value;
  simple_instrument_definition_message_record.instrument_listing_status = simple_instrument_definition_message_value;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 3 -> simple_instrument_definition_message_record.reserved_3[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.currency = simple_instrument_definition_message_value;
  simple_instrument_definition_message_record.settlement_currency = simple_instrument_definition_message_value;
  simple_instrument_definition_message_record.match_algorithm = simple_instrument_definition_message_value;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.minimum_size[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.maximum_size[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.tick[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 5 -> simple_instrument_definition_message_record.unit_of_measure[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.unit_of_measure_quantity[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.settlement_price[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.settlement_price_type_calc_method = simple_instrument_definition_message_value;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.total_volume[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.open_interest_quantity[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.high_limit_price[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.low_limit_price[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.trading_collar_variation_type = simple_instrument_definition_message_value;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.trading_collar_variation[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.contract_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.maturity_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.valuation_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_trade_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_trade_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_notice_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_notice_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_delivery_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_delivery_date[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.option_strike_price[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.option_strike_currency = simple_instrument_definition_message_value;
  simple_instrument_definition_message_record.option_type = simple_instrument_definition_message_value;
  simple_instrument_definition_message_record.option_expiration_type = simple_instrument_definition_message_value;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_future_instrument_id[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Simple Instrument Definition Message set to where it lies, so a field read out of place says so */
inline ramp_simple_instrument_definition_message(simple_instrument_definition_message_record, simple_instrument_definition_message_base) {
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.timestamp[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 0 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.instrument_id[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 8 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.underlying_asset_type = (simple_instrument_definition_message_base + 12 + 1) % 256;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_asset_alphanumeric_4[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 13 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> simple_instrument_definition_message_record.product_group_code_alphanumeric_6[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 17 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 23 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.instrument_id_source = (simple_instrument_definition_message_base + 27 + 1) % 256;
  simple_instrument_definition_message_record.instrument_type = (simple_instrument_definition_message_base + 28 + 1) % 256;
  simple_instrument_definition_message_record.instrument_listing_status = (simple_instrument_definition_message_base + 29 + 1) % 256;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 3 -> simple_instrument_definition_message_record.reserved_3[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 30 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.currency = (simple_instrument_definition_message_base + 33 + 1) % 256;
  simple_instrument_definition_message_record.settlement_currency = (simple_instrument_definition_message_base + 34 + 1) % 256;
  simple_instrument_definition_message_record.match_algorithm = (simple_instrument_definition_message_base + 35 + 1) % 256;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.minimum_size[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 36 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.maximum_size[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 40 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.tick[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 44 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 5 -> simple_instrument_definition_message_record.unit_of_measure[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 52 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.unit_of_measure_quantity[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 57 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.settlement_price[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 61 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.settlement_price_type_calc_method = (simple_instrument_definition_message_base + 69 + 1) % 256;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.total_volume[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 70 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.open_interest_quantity[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 74 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.high_limit_price[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 78 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.low_limit_price[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 86 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.trading_collar_variation_type = (simple_instrument_definition_message_base + 94 + 1) % 256;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.trading_collar_variation[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 95 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.contract_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 103 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.maturity_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 107 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.valuation_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 109 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_trade_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 111 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_trade_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 113 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_notice_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 115 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_notice_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 117 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_delivery_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 119 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_delivery_date[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 121 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.option_strike_price[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 123 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.option_strike_currency = (simple_instrument_definition_message_base + 131 + 1) % 256;
  simple_instrument_definition_message_record.option_type = (simple_instrument_definition_message_base + 132 + 1) % 256;
  simple_instrument_definition_message_record.option_expiration_type = (simple_instrument_definition_message_base + 133 + 1) % 256;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_future_instrument_id[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 134 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Definition Message to the wire, 138 bytes from where the cursor stands */
inline encode_simple_instrument_definition_message(simple_instrument_definition_message_record) {
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> wire[at] = simple_instrument_definition_message_record.timestamp[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.instrument_id[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_definition_message_record.underlying_asset_type; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.underlying_asset_alphanumeric_4[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> wire[at] = simple_instrument_definition_message_record.product_group_code_alphanumeric_6[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_definition_message_record.instrument_id_source; at = at + 1;
  wire[at] = simple_instrument_definition_message_record.instrument_type; at = at + 1;
  wire[at] = simple_instrument_definition_message_record.instrument_listing_status; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 3 -> wire[at] = simple_instrument_definition_message_record.reserved_3[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_definition_message_record.currency; at = at + 1;
  wire[at] = simple_instrument_definition_message_record.settlement_currency; at = at + 1;
  wire[at] = simple_instrument_definition_message_record.match_algorithm; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.minimum_size[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.maximum_size[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> wire[at] = simple_instrument_definition_message_record.tick[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 5 -> wire[at] = simple_instrument_definition_message_record.unit_of_measure[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.unit_of_measure_quantity[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> wire[at] = simple_instrument_definition_message_record.settlement_price[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_definition_message_record.settlement_price_type_calc_method; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.total_volume[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.open_interest_quantity[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> wire[at] = simple_instrument_definition_message_record.high_limit_price[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> wire[at] = simple_instrument_definition_message_record.low_limit_price[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_definition_message_record.trading_collar_variation_type; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> wire[at] = simple_instrument_definition_message_record.trading_collar_variation[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.contract_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.maturity_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.valuation_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.first_trade_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.last_trade_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.first_notice_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.last_notice_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.first_delivery_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> wire[at] = simple_instrument_definition_message_record.last_delivery_date[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> wire[at] = simple_instrument_definition_message_record.option_strike_price[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_definition_message_record.option_strike_currency; at = at + 1;
  wire[at] = simple_instrument_definition_message_record.option_type; at = at + 1;
  wire[at] = simple_instrument_definition_message_record.option_expiration_type; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.underlying_future_instrument_id[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Definition Message off the wire, 138 bytes from where the cursor stands */
inline decode_simple_instrument_definition_message(simple_instrument_definition_message_record) {
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.timestamp[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.instrument_id[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.underlying_asset_type = wire[at]; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_asset_alphanumeric_4[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> simple_instrument_definition_message_record.product_group_code_alphanumeric_6[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.instrument_id_source = wire[at]; at = at + 1;
  simple_instrument_definition_message_record.instrument_type = wire[at]; at = at + 1;
  simple_instrument_definition_message_record.instrument_listing_status = wire[at]; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 3 -> simple_instrument_definition_message_record.reserved_3[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.currency = wire[at]; at = at + 1;
  simple_instrument_definition_message_record.settlement_currency = wire[at]; at = at + 1;
  simple_instrument_definition_message_record.match_algorithm = wire[at]; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.minimum_size[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.maximum_size[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.tick[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 5 -> simple_instrument_definition_message_record.unit_of_measure[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.unit_of_measure_quantity[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.settlement_price[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.settlement_price_type_calc_method = wire[at]; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.total_volume[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.open_interest_quantity[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.high_limit_price[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.low_limit_price[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.trading_collar_variation_type = wire[at]; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.trading_collar_variation[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.contract_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.maturity_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.valuation_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_trade_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_trade_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_notice_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_notice_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.first_delivery_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> simple_instrument_definition_message_record.last_delivery_date[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> simple_instrument_definition_message_record.option_strike_price[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.option_strike_currency = wire[at]; at = at + 1;
  simple_instrument_definition_message_record.option_type = wire[at]; at = at + 1;
  simple_instrument_definition_message_record.option_expiration_type = wire[at]; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_future_instrument_id[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Simple Instrument Definition Message is what was written, byte for byte */
inline equal_simple_instrument_definition_message(simple_instrument_definition_message_read, simple_instrument_definition_message_written) {
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> assert(simple_instrument_definition_message_read.timestamp[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.timestamp[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.instrument_id[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.instrument_id[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_definition_message_read.underlying_asset_type == simple_instrument_definition_message_written.underlying_asset_type);
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.underlying_asset_alphanumeric_4[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.underlying_asset_alphanumeric_4[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> assert(simple_instrument_definition_message_read.product_group_code_alphanumeric_6[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.product_group_code_alphanumeric_6[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.exchange[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.exchange[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_definition_message_read.instrument_id_source == simple_instrument_definition_message_written.instrument_id_source);
  assert(simple_instrument_definition_message_read.instrument_type == simple_instrument_definition_message_written.instrument_type);
  assert(simple_instrument_definition_message_read.instrument_listing_status == simple_instrument_definition_message_written.instrument_listing_status);
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 3 -> assert(simple_instrument_definition_message_read.reserved_3[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.reserved_3[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_definition_message_read.currency == simple_instrument_definition_message_written.currency);
  assert(simple_instrument_definition_message_read.settlement_currency == simple_instrument_definition_message_written.settlement_currency);
  assert(simple_instrument_definition_message_read.match_algorithm == simple_instrument_definition_message_written.match_algorithm);
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.minimum_size[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.minimum_size[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.maximum_size[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.maximum_size[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> assert(simple_instrument_definition_message_read.tick[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.tick[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 5 -> assert(simple_instrument_definition_message_read.unit_of_measure[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.unit_of_measure[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.unit_of_measure_quantity[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.unit_of_measure_quantity[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> assert(simple_instrument_definition_message_read.settlement_price[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.settlement_price[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_definition_message_read.settlement_price_type_calc_method == simple_instrument_definition_message_written.settlement_price_type_calc_method);
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.total_volume[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.total_volume[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.open_interest_quantity[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.open_interest_quantity[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> assert(simple_instrument_definition_message_read.high_limit_price[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.high_limit_price[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> assert(simple_instrument_definition_message_read.low_limit_price[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.low_limit_price[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_definition_message_read.trading_collar_variation_type == simple_instrument_definition_message_written.trading_collar_variation_type);
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> assert(simple_instrument_definition_message_read.trading_collar_variation[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.trading_collar_variation[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.contract_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.contract_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.maturity_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.maturity_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.valuation_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.valuation_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.first_trade_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.first_trade_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.last_trade_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.last_trade_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.first_notice_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.first_notice_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.last_notice_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.last_notice_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.first_delivery_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.first_delivery_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 2 -> assert(simple_instrument_definition_message_read.last_delivery_date[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.last_delivery_date[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 8 -> assert(simple_instrument_definition_message_read.option_strike_price[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.option_strike_price[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_definition_message_read.option_strike_currency == simple_instrument_definition_message_written.option_strike_currency);
  assert(simple_instrument_definition_message_read.option_type == simple_instrument_definition_message_written.option_type);
  assert(simple_instrument_definition_message_read.option_expiration_type == simple_instrument_definition_message_written.option_expiration_type);
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.underlying_future_instrument_id[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.underlying_future_instrument_id[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Message: 18 bytes ------------------------------------------ */

/* System State */
typedef SystemStateMessage {
  byte timestamp[8];
  byte to_m_version[8];
  byte session_id;
  byte system_status
};

int system_state_message_at;

/* every byte of System State Message set to one value */
inline fill_system_state_message(system_state_message_record, system_state_message_value) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.timestamp[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_record.session_id = system_state_message_value;
  system_state_message_record.system_status = system_state_message_value;
  skip
}

/* each byte of System State Message set to where it lies, so a field read out of place says so */
inline ramp_system_state_message(system_state_message_record, system_state_message_base) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.timestamp[system_state_message_at] = (system_state_message_base + 0 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = (system_state_message_base + 8 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_record.session_id = (system_state_message_base + 16 + 1) % 256;
  system_state_message_record.system_status = (system_state_message_base + 17 + 1) % 256;
  skip
}

/* System State Message to the wire, 18 bytes from where the cursor stands */
inline encode_system_state_message(system_state_message_record) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.timestamp[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.to_m_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  wire[at] = system_state_message_record.session_id; at = at + 1;
  wire[at] = system_state_message_record.system_status; at = at + 1;
  skip
}

/* System State Message off the wire, 18 bytes from where the cursor stands */
inline decode_system_state_message(system_state_message_record) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.timestamp[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> system_state_message_record.to_m_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_record.session_id = wire[at]; at = at + 1;
  system_state_message_record.system_status = wire[at]; at = at + 1;
  skip
}

/* what was read of System State Message is what was written, byte for byte */
inline equal_system_state_message(system_state_message_read, system_state_message_written) {
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> assert(system_state_message_read.timestamp[system_state_message_at] == system_state_message_written.timestamp[system_state_message_at]); system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  system_state_message_at = 0;
  do
  :: system_state_message_at < 8 -> assert(system_state_message_read.to_m_version[system_state_message_at] == system_state_message_written.to_m_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  assert(system_state_message_read.session_id == system_state_message_written.session_id);
  assert(system_state_message_read.system_status == system_state_message_written.system_status);
  skip
}

/* ---- Instrument Trading Status Notification Message: 14 bytes ---------------- */

/* Instrument Trading Status Notification */
typedef InstrumentTradingStatusNotificationMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte trading_status;
  byte market_state
};

int instrument_trading_status_notification_message_at;

/* every byte of Instrument Trading Status Notification Message set to one value */
inline fill_instrument_trading_status_notification_message(instrument_trading_status_notification_message_record, instrument_trading_status_notification_message_value) {
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 8 -> instrument_trading_status_notification_message_record.timestamp[instrument_trading_status_notification_message_at] = instrument_trading_status_notification_message_value; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 4 -> instrument_trading_status_notification_message_record.instrument_id[instrument_trading_status_notification_message_at] = instrument_trading_status_notification_message_value; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_record.trading_status = instrument_trading_status_notification_message_value;
  instrument_trading_status_notification_message_record.market_state = instrument_trading_status_notification_message_value;
  skip
}

/* each byte of Instrument Trading Status Notification Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_trading_status_notification_message(instrument_trading_status_notification_message_record, instrument_trading_status_notification_message_base) {
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 8 -> instrument_trading_status_notification_message_record.timestamp[instrument_trading_status_notification_message_at] = (instrument_trading_status_notification_message_base + 0 + instrument_trading_status_notification_message_at + 1) % 256; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 4 -> instrument_trading_status_notification_message_record.instrument_id[instrument_trading_status_notification_message_at] = (instrument_trading_status_notification_message_base + 8 + instrument_trading_status_notification_message_at + 1) % 256; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_record.trading_status = (instrument_trading_status_notification_message_base + 12 + 1) % 256;
  instrument_trading_status_notification_message_record.market_state = (instrument_trading_status_notification_message_base + 13 + 1) % 256;
  skip
}

/* Instrument Trading Status Notification Message to the wire, 14 bytes from where the cursor stands */
inline encode_instrument_trading_status_notification_message(instrument_trading_status_notification_message_record) {
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 8 -> wire[at] = instrument_trading_status_notification_message_record.timestamp[instrument_trading_status_notification_message_at]; at = at + 1; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 4 -> wire[at] = instrument_trading_status_notification_message_record.instrument_id[instrument_trading_status_notification_message_at]; at = at + 1; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_trading_status_notification_message_record.trading_status; at = at + 1;
  wire[at] = instrument_trading_status_notification_message_record.market_state; at = at + 1;
  skip
}

/* Instrument Trading Status Notification Message off the wire, 14 bytes from where the cursor stands */
inline decode_instrument_trading_status_notification_message(instrument_trading_status_notification_message_record) {
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 8 -> instrument_trading_status_notification_message_record.timestamp[instrument_trading_status_notification_message_at] = wire[at]; at = at + 1; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 4 -> instrument_trading_status_notification_message_record.instrument_id[instrument_trading_status_notification_message_at] = wire[at]; at = at + 1; instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_record.trading_status = wire[at]; at = at + 1;
  instrument_trading_status_notification_message_record.market_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Trading Status Notification Message is what was written, byte for byte */
inline equal_instrument_trading_status_notification_message(instrument_trading_status_notification_message_read, instrument_trading_status_notification_message_written) {
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 8 -> assert(instrument_trading_status_notification_message_read.timestamp[instrument_trading_status_notification_message_at] == instrument_trading_status_notification_message_written.timestamp[instrument_trading_status_notification_message_at]); instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  instrument_trading_status_notification_message_at = 0;
  do
  :: instrument_trading_status_notification_message_at < 4 -> assert(instrument_trading_status_notification_message_read.instrument_id[instrument_trading_status_notification_message_at] == instrument_trading_status_notification_message_written.instrument_id[instrument_trading_status_notification_message_at]); instrument_trading_status_notification_message_at = instrument_trading_status_notification_message_at + 1
  :: else -> break
  od;
  assert(instrument_trading_status_notification_message_read.trading_status == instrument_trading_status_notification_message_written.trading_status);
  assert(instrument_trading_status_notification_message_read.market_state == instrument_trading_status_notification_message_written.market_state);
  skip
}

/* ---- Best Bid And Offer Message: 36 bytes ------------------------------------ */

/* Top of Market (Best Bid and Offer) Message */
typedef BestBidAndOfferMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte mbb_price[8];
  byte mbb_size[4];
  byte mbo_price[8];
  byte mbo_size[4]
};

int best_bid_and_offer_message_at;

/* every byte of Best Bid And Offer Message set to one value */
inline fill_best_bid_and_offer_message(best_bid_and_offer_message_record, best_bid_and_offer_message_value) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.timestamp[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.instrument_id[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.mbb_price[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.mbb_size[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.mbo_price[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.mbo_size[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid And Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_and_offer_message(best_bid_and_offer_message_record, best_bid_and_offer_message_base) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.timestamp[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 0 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.instrument_id[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 8 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.mbb_price[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 12 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.mbb_size[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 20 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.mbo_price[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 24 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.mbo_size[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 32 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Offer Message to the wire, 36 bytes from where the cursor stands */
inline encode_best_bid_and_offer_message(best_bid_and_offer_message_record) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> wire[at] = best_bid_and_offer_message_record.timestamp[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> wire[at] = best_bid_and_offer_message_record.instrument_id[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> wire[at] = best_bid_and_offer_message_record.mbb_price[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> wire[at] = best_bid_and_offer_message_record.mbb_size[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> wire[at] = best_bid_and_offer_message_record.mbo_price[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> wire[at] = best_bid_and_offer_message_record.mbo_size[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Offer Message off the wire, 36 bytes from where the cursor stands */
inline decode_best_bid_and_offer_message(best_bid_and_offer_message_record) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.timestamp[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.instrument_id[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.mbb_price[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.mbb_size[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.mbo_price[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> best_bid_and_offer_message_record.mbo_size[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid And Offer Message is what was written, byte for byte */
inline equal_best_bid_and_offer_message(best_bid_and_offer_message_read, best_bid_and_offer_message_written) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> assert(best_bid_and_offer_message_read.timestamp[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.timestamp[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> assert(best_bid_and_offer_message_read.instrument_id[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.instrument_id[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> assert(best_bid_and_offer_message_read.mbb_price[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.mbb_price[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> assert(best_bid_and_offer_message_read.mbb_size[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.mbb_size[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> assert(best_bid_and_offer_message_read.mbo_price[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.mbo_price[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 4 -> assert(best_bid_and_offer_message_read.mbo_size[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.mbo_size[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Last Sale Message: 45 bytes --------------------------------------------- */

/* Last Sale (Trade) Message */
typedef LastSaleMessage {
  byte timestamp[8];
  byte trade_date[2];
  byte instrument_id[4];
  byte trade_id[8];
  byte correction_number;
  byte price[8];
  byte size[4];
  byte trade_type;
  byte complex_trade_id[8];
  byte instrument_type
};

int last_sale_message_at;

/* every byte of Last Sale Message set to one value */
inline fill_last_sale_message(last_sale_message_record, last_sale_message_value) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.timestamp[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 2 -> last_sale_message_record.trade_date[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.instrument_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.trade_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.correction_number = last_sale_message_value;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.price[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.size[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.trade_type = last_sale_message_value;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.complex_trade_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.instrument_type = last_sale_message_value;
  skip
}

/* each byte of Last Sale Message set to where it lies, so a field read out of place says so */
inline ramp_last_sale_message(last_sale_message_record, last_sale_message_base) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.timestamp[last_sale_message_at] = (last_sale_message_base + 0 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 2 -> last_sale_message_record.trade_date[last_sale_message_at] = (last_sale_message_base + 8 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.instrument_id[last_sale_message_at] = (last_sale_message_base + 10 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.trade_id[last_sale_message_at] = (last_sale_message_base + 14 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.correction_number = (last_sale_message_base + 22 + 1) % 256;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.price[last_sale_message_at] = (last_sale_message_base + 23 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.size[last_sale_message_at] = (last_sale_message_base + 31 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.trade_type = (last_sale_message_base + 35 + 1) % 256;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.complex_trade_id[last_sale_message_at] = (last_sale_message_base + 36 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.instrument_type = (last_sale_message_base + 44 + 1) % 256;
  skip
}

/* Last Sale Message to the wire, 45 bytes from where the cursor stands */
inline encode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> wire[at] = last_sale_message_record.timestamp[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 2 -> wire[at] = last_sale_message_record.trade_date[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.instrument_id[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> wire[at] = last_sale_message_record.trade_id[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = last_sale_message_record.correction_number; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> wire[at] = last_sale_message_record.price[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.size[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = last_sale_message_record.trade_type; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> wire[at] = last_sale_message_record.complex_trade_id[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = last_sale_message_record.instrument_type; at = at + 1;
  skip
}

/* Last Sale Message off the wire, 45 bytes from where the cursor stands */
inline decode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.timestamp[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 2 -> last_sale_message_record.trade_date[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.instrument_id[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.trade_id[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.correction_number = wire[at]; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.price[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.size[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.trade_type = wire[at]; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.complex_trade_id[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Last Sale Message is what was written, byte for byte */
inline equal_last_sale_message(last_sale_message_read, last_sale_message_written) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> assert(last_sale_message_read.timestamp[last_sale_message_at] == last_sale_message_written.timestamp[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 2 -> assert(last_sale_message_read.trade_date[last_sale_message_at] == last_sale_message_written.trade_date[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.instrument_id[last_sale_message_at] == last_sale_message_written.instrument_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> assert(last_sale_message_read.trade_id[last_sale_message_at] == last_sale_message_written.trade_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  assert(last_sale_message_read.correction_number == last_sale_message_written.correction_number);
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> assert(last_sale_message_read.price[last_sale_message_at] == last_sale_message_written.price[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.size[last_sale_message_at] == last_sale_message_written.size[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  assert(last_sale_message_read.trade_type == last_sale_message_written.trade_type);
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> assert(last_sale_message_read.complex_trade_id[last_sale_message_at] == last_sale_message_written.complex_trade_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  assert(last_sale_message_read.instrument_type == last_sale_message_written.instrument_type);
  skip
}

/* ---- Trade Cancel Message: 36 bytes ------------------------------------------ */

/* Trade Cancel Message */
typedef TradeCancelMessage {
  byte timestamp[8];
  byte trade_date[2];
  byte instrument_id[4];
  byte trade_id[8];
  byte correction_number;
  byte price[8];
  byte size[4];
  byte instrument_type
};

int trade_cancel_message_at;

/* every byte of Trade Cancel Message set to one value */
inline fill_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_value) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.timestamp[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> trade_cancel_message_record.trade_date[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.instrument_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = trade_cancel_message_value;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.price[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.size[trade_cancel_message_at] = trade_cancel_message_value; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.instrument_type = trade_cancel_message_value;
  skip
}

/* each byte of Trade Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_message(trade_cancel_message_record, trade_cancel_message_base) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.timestamp[trade_cancel_message_at] = (trade_cancel_message_base + 0 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> trade_cancel_message_record.trade_date[trade_cancel_message_at] = (trade_cancel_message_base + 8 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.instrument_id[trade_cancel_message_at] = (trade_cancel_message_base + 10 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = (trade_cancel_message_base + 14 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = (trade_cancel_message_base + 22 + 1) % 256;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.price[trade_cancel_message_at] = (trade_cancel_message_base + 23 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.size[trade_cancel_message_at] = (trade_cancel_message_base + 31 + trade_cancel_message_at + 1) % 256; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.instrument_type = (trade_cancel_message_base + 35 + 1) % 256;
  skip
}

/* Trade Cancel Message to the wire, 36 bytes from where the cursor stands */
inline encode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.timestamp[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> wire[at] = trade_cancel_message_record.trade_date[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.instrument_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.trade_id[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_message_record.correction_number; at = at + 1;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> wire[at] = trade_cancel_message_record.price[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> wire[at] = trade_cancel_message_record.size[trade_cancel_message_at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_message_record.instrument_type; at = at + 1;
  skip
}

/* Trade Cancel Message off the wire, 36 bytes from where the cursor stands */
inline decode_trade_cancel_message(trade_cancel_message_record) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.timestamp[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> trade_cancel_message_record.trade_date[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.instrument_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.trade_id[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.correction_number = wire[at]; at = at + 1;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> trade_cancel_message_record.price[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> trade_cancel_message_record.size[trade_cancel_message_at] = wire[at]; at = at + 1; trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Cancel Message is what was written, byte for byte */
inline equal_trade_cancel_message(trade_cancel_message_read, trade_cancel_message_written) {
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.timestamp[trade_cancel_message_at] == trade_cancel_message_written.timestamp[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 2 -> assert(trade_cancel_message_read.trade_date[trade_cancel_message_at] == trade_cancel_message_written.trade_date[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.instrument_id[trade_cancel_message_at] == trade_cancel_message_written.instrument_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.trade_id[trade_cancel_message_at] == trade_cancel_message_written.trade_id[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_message_read.correction_number == trade_cancel_message_written.correction_number);
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 8 -> assert(trade_cancel_message_read.price[trade_cancel_message_at] == trade_cancel_message_written.price[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  trade_cancel_message_at = 0;
  do
  :: trade_cancel_message_at < 4 -> assert(trade_cancel_message_read.size[trade_cancel_message_at] == trade_cancel_message_written.size[trade_cancel_message_at]); trade_cancel_message_at = trade_cancel_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_message_read.instrument_type == trade_cancel_message_written.instrument_type);
  skip
}

/* ---- Refresh Request: 1 bytes ------------------------------------------------ */

/* Firms request a last value refresh of market data and status information */
typedef RefreshRequest {
  byte refresh_message_type
};

/* every byte of Refresh Request set to one value */
inline fill_refresh_request(refresh_request_record, refresh_request_value) {
  refresh_request_record.refresh_message_type = refresh_request_value;
  skip
}

/* each byte of Refresh Request set to where it lies, so a field read out of place says so */
inline ramp_refresh_request(refresh_request_record, refresh_request_base) {
  refresh_request_record.refresh_message_type = (refresh_request_base + 0 + 1) % 256;
  skip
}

/* Refresh Request to the wire, 1 bytes from where the cursor stands */
inline encode_refresh_request(refresh_request_record) {
  wire[at] = refresh_request_record.refresh_message_type; at = at + 1;
  skip
}

/* Refresh Request off the wire, 1 bytes from where the cursor stands */
inline decode_refresh_request(refresh_request_record) {
  refresh_request_record.refresh_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Refresh Request is what was written, byte for byte */
inline equal_refresh_request(refresh_request_read, refresh_request_written) {
  assert(refresh_request_read.refresh_message_type == refresh_request_written.refresh_message_type);
  skip
}

/* ---- End Of Refresh: 1 bytes ------------------------------------------------- */

/* Sent when the refresh of the requested message type is complete */
typedef EndOfRefresh {
  byte refresh_message_type
};

/* every byte of End Of Refresh set to one value */
inline fill_end_of_refresh(end_of_refresh_record, end_of_refresh_value) {
  end_of_refresh_record.refresh_message_type = end_of_refresh_value;
  skip
}

/* each byte of End Of Refresh set to where it lies, so a field read out of place says so */
inline ramp_end_of_refresh(end_of_refresh_record, end_of_refresh_base) {
  end_of_refresh_record.refresh_message_type = (end_of_refresh_base + 0 + 1) % 256;
  skip
}

/* End Of Refresh to the wire, 1 bytes from where the cursor stands */
inline encode_end_of_refresh(end_of_refresh_record) {
  wire[at] = end_of_refresh_record.refresh_message_type; at = at + 1;
  skip
}

/* End Of Refresh off the wire, 1 bytes from where the cursor stands */
inline decode_end_of_refresh(end_of_refresh_record) {
  end_of_refresh_record.refresh_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of End Of Refresh is what was written, byte for byte */
inline equal_end_of_refresh(end_of_refresh_read, end_of_refresh_written) {
  assert(end_of_refresh_read.refresh_message_type == end_of_refresh_written.refresh_message_type);
  skip
}

/* ---- Login Request: 35 bytes ------------------------------------------------- */

/* The SesM client must send a Login request packet immediately upon establishing a new TCP/IP socket connection to the server */
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

/* The SesM server sends a Login response packet in response a Login request packet from the client */
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

/* The SesM server sends a Login response packet in response a Login request packet from the client */
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

/* Simple Instrument Definition Message: encoded, read back, and compared */
proctype check_simple_instrument_definition_message() {
  SimpleInstrumentDefinitionMessage simple_instrument_definition_message_sent;
  SimpleInstrumentDefinitionMessage simple_instrument_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_instrument_definition_message(simple_instrument_definition_message_sent, 0)
  :: pattern == 1 -> fill_simple_instrument_definition_message(simple_instrument_definition_message_sent, 32)
  :: pattern == 2 -> fill_simple_instrument_definition_message(simple_instrument_definition_message_sent, 255)
  :: else -> ramp_simple_instrument_definition_message(simple_instrument_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_instrument_definition_message(simple_instrument_definition_message_sent);
    assert(at == 138);
    at = 0;
    decode_simple_instrument_definition_message(simple_instrument_definition_message_got);
    assert(at == 138);
    equal_simple_instrument_definition_message(simple_instrument_definition_message_got, simple_instrument_definition_message_sent)
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
    assert(at == 18);
    at = 0;
    decode_system_state_message(system_state_message_got);
    assert(at == 18);
    equal_system_state_message(system_state_message_got, system_state_message_sent)
  }
}

/* Instrument Trading Status Notification Message: encoded, read back, and compared */
proctype check_instrument_trading_status_notification_message() {
  InstrumentTradingStatusNotificationMessage instrument_trading_status_notification_message_sent;
  InstrumentTradingStatusNotificationMessage instrument_trading_status_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_trading_status_notification_message(instrument_trading_status_notification_message_sent, 0)
  :: pattern == 1 -> fill_instrument_trading_status_notification_message(instrument_trading_status_notification_message_sent, 32)
  :: pattern == 2 -> fill_instrument_trading_status_notification_message(instrument_trading_status_notification_message_sent, 255)
  :: else -> ramp_instrument_trading_status_notification_message(instrument_trading_status_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_trading_status_notification_message(instrument_trading_status_notification_message_sent);
    assert(at == 14);
    at = 0;
    decode_instrument_trading_status_notification_message(instrument_trading_status_notification_message_got);
    assert(at == 14);
    equal_instrument_trading_status_notification_message(instrument_trading_status_notification_message_got, instrument_trading_status_notification_message_sent)
  }
}

/* Best Bid And Offer Message: encoded, read back, and compared */
proctype check_best_bid_and_offer_message() {
  BestBidAndOfferMessage best_bid_and_offer_message_sent;
  BestBidAndOfferMessage best_bid_and_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_and_offer_message(best_bid_and_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_and_offer_message(best_bid_and_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_and_offer_message(best_bid_and_offer_message_sent, 255)
  :: else -> ramp_best_bid_and_offer_message(best_bid_and_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_and_offer_message(best_bid_and_offer_message_sent);
    assert(at == 36);
    at = 0;
    decode_best_bid_and_offer_message(best_bid_and_offer_message_got);
    assert(at == 36);
    equal_best_bid_and_offer_message(best_bid_and_offer_message_got, best_bid_and_offer_message_sent)
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
    assert(at == 45);
    at = 0;
    decode_last_sale_message(last_sale_message_got);
    assert(at == 45);
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
    assert(at == 36);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 36);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* Refresh Request: encoded, read back, and compared */
proctype check_refresh_request() {
  RefreshRequest refresh_request_sent;
  RefreshRequest refresh_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_request(refresh_request_sent, 0)
  :: pattern == 1 -> fill_refresh_request(refresh_request_sent, 32)
  :: pattern == 2 -> fill_refresh_request(refresh_request_sent, 255)
  :: else -> ramp_refresh_request(refresh_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_request(refresh_request_sent);
    assert(at == 1);
    at = 0;
    decode_refresh_request(refresh_request_got);
    assert(at == 1);
    equal_refresh_request(refresh_request_got, refresh_request_sent)
  }
}

/* End Of Refresh: encoded, read back, and compared */
proctype check_end_of_refresh() {
  EndOfRefresh end_of_refresh_sent;
  EndOfRefresh end_of_refresh_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_refresh(end_of_refresh_sent, 0)
  :: pattern == 1 -> fill_end_of_refresh(end_of_refresh_sent, 32)
  :: pattern == 2 -> fill_end_of_refresh(end_of_refresh_sent, 255)
  :: else -> ramp_end_of_refresh(end_of_refresh_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_refresh(end_of_refresh_sent);
    assert(at == 1);
    at = 0;
    decode_end_of_refresh(end_of_refresh_got);
    assert(at == 1);
    equal_end_of_refresh(end_of_refresh_got, end_of_refresh_sent)
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
  :: run check_simple_instrument_definition_message()
  :: run check_system_state_message()
  :: run check_instrument_trading_status_notification_message()
  :: run check_best_bid_and_offer_message()
  :: run check_last_sale_message()
  :: run check_trade_cancel_message()
  :: run check_refresh_request()
  :: run check_end_of_refresh()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_retransmission_request()
  fi
}
