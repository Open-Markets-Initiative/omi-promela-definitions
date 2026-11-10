/*
 * Miami International Holdings Depth Of Market Retransmission
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
  byte do_m_version[8];
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
  :: system_state_message_at < 8 -> system_state_message_record.do_m_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.do_m_version[system_state_message_at] = (system_state_message_base + 8 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.do_m_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.do_m_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> assert(system_state_message_read.do_m_version[system_state_message_at] == system_state_message_written.do_m_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
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

/* ---- Anticipated Opening Price Message: 25 bytes ----------------------------- */

/* Anticipated Opening Price */
typedef AnticipatedOpeningPriceMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte anticipated_opening_price[8];
  byte opening_match_quantity[4];
  byte instrument_type
};

int anticipated_opening_price_message_at;

/* every byte of Anticipated Opening Price Message set to one value */
inline fill_anticipated_opening_price_message(anticipated_opening_price_message_record, anticipated_opening_price_message_value) {
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> anticipated_opening_price_message_record.timestamp[anticipated_opening_price_message_at] = anticipated_opening_price_message_value; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> anticipated_opening_price_message_record.instrument_id[anticipated_opening_price_message_at] = anticipated_opening_price_message_value; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> anticipated_opening_price_message_record.anticipated_opening_price[anticipated_opening_price_message_at] = anticipated_opening_price_message_value; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> anticipated_opening_price_message_record.opening_match_quantity[anticipated_opening_price_message_at] = anticipated_opening_price_message_value; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_record.instrument_type = anticipated_opening_price_message_value;
  skip
}

/* each byte of Anticipated Opening Price Message set to where it lies, so a field read out of place says so */
inline ramp_anticipated_opening_price_message(anticipated_opening_price_message_record, anticipated_opening_price_message_base) {
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> anticipated_opening_price_message_record.timestamp[anticipated_opening_price_message_at] = (anticipated_opening_price_message_base + 0 + anticipated_opening_price_message_at + 1) % 256; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> anticipated_opening_price_message_record.instrument_id[anticipated_opening_price_message_at] = (anticipated_opening_price_message_base + 8 + anticipated_opening_price_message_at + 1) % 256; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> anticipated_opening_price_message_record.anticipated_opening_price[anticipated_opening_price_message_at] = (anticipated_opening_price_message_base + 12 + anticipated_opening_price_message_at + 1) % 256; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> anticipated_opening_price_message_record.opening_match_quantity[anticipated_opening_price_message_at] = (anticipated_opening_price_message_base + 20 + anticipated_opening_price_message_at + 1) % 256; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_record.instrument_type = (anticipated_opening_price_message_base + 24 + 1) % 256;
  skip
}

/* Anticipated Opening Price Message to the wire, 25 bytes from where the cursor stands */
inline encode_anticipated_opening_price_message(anticipated_opening_price_message_record) {
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> wire[at] = anticipated_opening_price_message_record.timestamp[anticipated_opening_price_message_at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> wire[at] = anticipated_opening_price_message_record.instrument_id[anticipated_opening_price_message_at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> wire[at] = anticipated_opening_price_message_record.anticipated_opening_price[anticipated_opening_price_message_at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> wire[at] = anticipated_opening_price_message_record.opening_match_quantity[anticipated_opening_price_message_at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  wire[at] = anticipated_opening_price_message_record.instrument_type; at = at + 1;
  skip
}

/* Anticipated Opening Price Message off the wire, 25 bytes from where the cursor stands */
inline decode_anticipated_opening_price_message(anticipated_opening_price_message_record) {
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> anticipated_opening_price_message_record.timestamp[anticipated_opening_price_message_at] = wire[at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> anticipated_opening_price_message_record.instrument_id[anticipated_opening_price_message_at] = wire[at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> anticipated_opening_price_message_record.anticipated_opening_price[anticipated_opening_price_message_at] = wire[at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> anticipated_opening_price_message_record.opening_match_quantity[anticipated_opening_price_message_at] = wire[at]; at = at + 1; anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Anticipated Opening Price Message is what was written, byte for byte */
inline equal_anticipated_opening_price_message(anticipated_opening_price_message_read, anticipated_opening_price_message_written) {
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> assert(anticipated_opening_price_message_read.timestamp[anticipated_opening_price_message_at] == anticipated_opening_price_message_written.timestamp[anticipated_opening_price_message_at]); anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> assert(anticipated_opening_price_message_read.instrument_id[anticipated_opening_price_message_at] == anticipated_opening_price_message_written.instrument_id[anticipated_opening_price_message_at]); anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 8 -> assert(anticipated_opening_price_message_read.anticipated_opening_price[anticipated_opening_price_message_at] == anticipated_opening_price_message_written.anticipated_opening_price[anticipated_opening_price_message_at]); anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  anticipated_opening_price_message_at = 0;
  do
  :: anticipated_opening_price_message_at < 4 -> assert(anticipated_opening_price_message_read.opening_match_quantity[anticipated_opening_price_message_at] == anticipated_opening_price_message_written.opening_match_quantity[anticipated_opening_price_message_at]); anticipated_opening_price_message_at = anticipated_opening_price_message_at + 1
  :: else -> break
  od;
  assert(anticipated_opening_price_message_read.instrument_type == anticipated_opening_price_message_written.instrument_type);
  skip
}

/* ---- Settlement Price Update Message: 24 bytes ------------------------------- */

/* Settlement Price Update */
typedef SettlementPriceUpdateMessage {
  byte timestamp[8];
  byte trade_date[2];
  byte instrument_id[4];
  byte settlement_price[8];
  byte settlement_price_type;
  byte settlement_price_type_calc_method
};

int settlement_price_update_message_at;

/* every byte of Settlement Price Update Message set to one value */
inline fill_settlement_price_update_message(settlement_price_update_message_record, settlement_price_update_message_value) {
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> settlement_price_update_message_record.timestamp[settlement_price_update_message_at] = settlement_price_update_message_value; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 2 -> settlement_price_update_message_record.trade_date[settlement_price_update_message_at] = settlement_price_update_message_value; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 4 -> settlement_price_update_message_record.instrument_id[settlement_price_update_message_at] = settlement_price_update_message_value; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> settlement_price_update_message_record.settlement_price[settlement_price_update_message_at] = settlement_price_update_message_value; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_record.settlement_price_type = settlement_price_update_message_value;
  settlement_price_update_message_record.settlement_price_type_calc_method = settlement_price_update_message_value;
  skip
}

/* each byte of Settlement Price Update Message set to where it lies, so a field read out of place says so */
inline ramp_settlement_price_update_message(settlement_price_update_message_record, settlement_price_update_message_base) {
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> settlement_price_update_message_record.timestamp[settlement_price_update_message_at] = (settlement_price_update_message_base + 0 + settlement_price_update_message_at + 1) % 256; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 2 -> settlement_price_update_message_record.trade_date[settlement_price_update_message_at] = (settlement_price_update_message_base + 8 + settlement_price_update_message_at + 1) % 256; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 4 -> settlement_price_update_message_record.instrument_id[settlement_price_update_message_at] = (settlement_price_update_message_base + 10 + settlement_price_update_message_at + 1) % 256; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> settlement_price_update_message_record.settlement_price[settlement_price_update_message_at] = (settlement_price_update_message_base + 14 + settlement_price_update_message_at + 1) % 256; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_record.settlement_price_type = (settlement_price_update_message_base + 22 + 1) % 256;
  settlement_price_update_message_record.settlement_price_type_calc_method = (settlement_price_update_message_base + 23 + 1) % 256;
  skip
}

/* Settlement Price Update Message to the wire, 24 bytes from where the cursor stands */
inline encode_settlement_price_update_message(settlement_price_update_message_record) {
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> wire[at] = settlement_price_update_message_record.timestamp[settlement_price_update_message_at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 2 -> wire[at] = settlement_price_update_message_record.trade_date[settlement_price_update_message_at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 4 -> wire[at] = settlement_price_update_message_record.instrument_id[settlement_price_update_message_at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> wire[at] = settlement_price_update_message_record.settlement_price[settlement_price_update_message_at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_price_update_message_record.settlement_price_type; at = at + 1;
  wire[at] = settlement_price_update_message_record.settlement_price_type_calc_method; at = at + 1;
  skip
}

/* Settlement Price Update Message off the wire, 24 bytes from where the cursor stands */
inline decode_settlement_price_update_message(settlement_price_update_message_record) {
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> settlement_price_update_message_record.timestamp[settlement_price_update_message_at] = wire[at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 2 -> settlement_price_update_message_record.trade_date[settlement_price_update_message_at] = wire[at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 4 -> settlement_price_update_message_record.instrument_id[settlement_price_update_message_at] = wire[at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> settlement_price_update_message_record.settlement_price[settlement_price_update_message_at] = wire[at]; at = at + 1; settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_record.settlement_price_type = wire[at]; at = at + 1;
  settlement_price_update_message_record.settlement_price_type_calc_method = wire[at]; at = at + 1;
  skip
}

/* what was read of Settlement Price Update Message is what was written, byte for byte */
inline equal_settlement_price_update_message(settlement_price_update_message_read, settlement_price_update_message_written) {
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> assert(settlement_price_update_message_read.timestamp[settlement_price_update_message_at] == settlement_price_update_message_written.timestamp[settlement_price_update_message_at]); settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 2 -> assert(settlement_price_update_message_read.trade_date[settlement_price_update_message_at] == settlement_price_update_message_written.trade_date[settlement_price_update_message_at]); settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 4 -> assert(settlement_price_update_message_read.instrument_id[settlement_price_update_message_at] == settlement_price_update_message_written.instrument_id[settlement_price_update_message_at]); settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  settlement_price_update_message_at = 0;
  do
  :: settlement_price_update_message_at < 8 -> assert(settlement_price_update_message_read.settlement_price[settlement_price_update_message_at] == settlement_price_update_message_written.settlement_price[settlement_price_update_message_at]); settlement_price_update_message_at = settlement_price_update_message_at + 1
  :: else -> break
  od;
  assert(settlement_price_update_message_read.settlement_price_type == settlement_price_update_message_written.settlement_price_type);
  assert(settlement_price_update_message_read.settlement_price_type_calc_method == settlement_price_update_message_written.settlement_price_type_calc_method);
  skip
}

/* ---- Open Interest Update Message: 18 bytes ---------------------------------- */

/* Open Interest Update */
typedef OpenInterestUpdateMessage {
  byte timestamp[8];
  byte trade_date[2];
  byte instrument_id[4];
  byte open_interest_quantity[4]
};

int open_interest_update_message_at;

/* every byte of Open Interest Update Message set to one value */
inline fill_open_interest_update_message(open_interest_update_message_record, open_interest_update_message_value) {
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 8 -> open_interest_update_message_record.timestamp[open_interest_update_message_at] = open_interest_update_message_value; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 2 -> open_interest_update_message_record.trade_date[open_interest_update_message_at] = open_interest_update_message_value; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> open_interest_update_message_record.instrument_id[open_interest_update_message_at] = open_interest_update_message_value; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> open_interest_update_message_record.open_interest_quantity[open_interest_update_message_at] = open_interest_update_message_value; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Update Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_update_message(open_interest_update_message_record, open_interest_update_message_base) {
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 8 -> open_interest_update_message_record.timestamp[open_interest_update_message_at] = (open_interest_update_message_base + 0 + open_interest_update_message_at + 1) % 256; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 2 -> open_interest_update_message_record.trade_date[open_interest_update_message_at] = (open_interest_update_message_base + 8 + open_interest_update_message_at + 1) % 256; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> open_interest_update_message_record.instrument_id[open_interest_update_message_at] = (open_interest_update_message_base + 10 + open_interest_update_message_at + 1) % 256; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> open_interest_update_message_record.open_interest_quantity[open_interest_update_message_at] = (open_interest_update_message_base + 14 + open_interest_update_message_at + 1) % 256; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Update Message to the wire, 18 bytes from where the cursor stands */
inline encode_open_interest_update_message(open_interest_update_message_record) {
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 8 -> wire[at] = open_interest_update_message_record.timestamp[open_interest_update_message_at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 2 -> wire[at] = open_interest_update_message_record.trade_date[open_interest_update_message_at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> wire[at] = open_interest_update_message_record.instrument_id[open_interest_update_message_at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> wire[at] = open_interest_update_message_record.open_interest_quantity[open_interest_update_message_at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Update Message off the wire, 18 bytes from where the cursor stands */
inline decode_open_interest_update_message(open_interest_update_message_record) {
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 8 -> open_interest_update_message_record.timestamp[open_interest_update_message_at] = wire[at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 2 -> open_interest_update_message_record.trade_date[open_interest_update_message_at] = wire[at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> open_interest_update_message_record.instrument_id[open_interest_update_message_at] = wire[at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> open_interest_update_message_record.open_interest_quantity[open_interest_update_message_at] = wire[at]; at = at + 1; open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Update Message is what was written, byte for byte */
inline equal_open_interest_update_message(open_interest_update_message_read, open_interest_update_message_written) {
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 8 -> assert(open_interest_update_message_read.timestamp[open_interest_update_message_at] == open_interest_update_message_written.timestamp[open_interest_update_message_at]); open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 2 -> assert(open_interest_update_message_read.trade_date[open_interest_update_message_at] == open_interest_update_message_written.trade_date[open_interest_update_message_at]); open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> assert(open_interest_update_message_read.instrument_id[open_interest_update_message_at] == open_interest_update_message_written.instrument_id[open_interest_update_message_at]); open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  open_interest_update_message_at = 0;
  do
  :: open_interest_update_message_at < 4 -> assert(open_interest_update_message_read.open_interest_quantity[open_interest_update_message_at] == open_interest_update_message_written.open_interest_quantity[open_interest_update_message_at]); open_interest_update_message_at = open_interest_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Total Volume Update Message: 18 bytes ----------------------------------- */

/* Total Volume Update */
typedef TotalVolumeUpdateMessage {
  byte timestamp[8];
  byte trade_date[2];
  byte instrument_id[4];
  byte total_volume[4]
};

int total_volume_update_message_at;

/* every byte of Total Volume Update Message set to one value */
inline fill_total_volume_update_message(total_volume_update_message_record, total_volume_update_message_value) {
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 8 -> total_volume_update_message_record.timestamp[total_volume_update_message_at] = total_volume_update_message_value; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 2 -> total_volume_update_message_record.trade_date[total_volume_update_message_at] = total_volume_update_message_value; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> total_volume_update_message_record.instrument_id[total_volume_update_message_at] = total_volume_update_message_value; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> total_volume_update_message_record.total_volume[total_volume_update_message_at] = total_volume_update_message_value; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Total Volume Update Message set to where it lies, so a field read out of place says so */
inline ramp_total_volume_update_message(total_volume_update_message_record, total_volume_update_message_base) {
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 8 -> total_volume_update_message_record.timestamp[total_volume_update_message_at] = (total_volume_update_message_base + 0 + total_volume_update_message_at + 1) % 256; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 2 -> total_volume_update_message_record.trade_date[total_volume_update_message_at] = (total_volume_update_message_base + 8 + total_volume_update_message_at + 1) % 256; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> total_volume_update_message_record.instrument_id[total_volume_update_message_at] = (total_volume_update_message_base + 10 + total_volume_update_message_at + 1) % 256; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> total_volume_update_message_record.total_volume[total_volume_update_message_at] = (total_volume_update_message_base + 14 + total_volume_update_message_at + 1) % 256; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Total Volume Update Message to the wire, 18 bytes from where the cursor stands */
inline encode_total_volume_update_message(total_volume_update_message_record) {
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 8 -> wire[at] = total_volume_update_message_record.timestamp[total_volume_update_message_at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 2 -> wire[at] = total_volume_update_message_record.trade_date[total_volume_update_message_at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> wire[at] = total_volume_update_message_record.instrument_id[total_volume_update_message_at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> wire[at] = total_volume_update_message_record.total_volume[total_volume_update_message_at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Total Volume Update Message off the wire, 18 bytes from where the cursor stands */
inline decode_total_volume_update_message(total_volume_update_message_record) {
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 8 -> total_volume_update_message_record.timestamp[total_volume_update_message_at] = wire[at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 2 -> total_volume_update_message_record.trade_date[total_volume_update_message_at] = wire[at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> total_volume_update_message_record.instrument_id[total_volume_update_message_at] = wire[at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> total_volume_update_message_record.total_volume[total_volume_update_message_at] = wire[at]; at = at + 1; total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Total Volume Update Message is what was written, byte for byte */
inline equal_total_volume_update_message(total_volume_update_message_read, total_volume_update_message_written) {
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 8 -> assert(total_volume_update_message_read.timestamp[total_volume_update_message_at] == total_volume_update_message_written.timestamp[total_volume_update_message_at]); total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 2 -> assert(total_volume_update_message_read.trade_date[total_volume_update_message_at] == total_volume_update_message_written.trade_date[total_volume_update_message_at]); total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> assert(total_volume_update_message_read.instrument_id[total_volume_update_message_at] == total_volume_update_message_written.instrument_id[total_volume_update_message_at]); total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  total_volume_update_message_at = 0;
  do
  :: total_volume_update_message_at < 4 -> assert(total_volume_update_message_read.total_volume[total_volume_update_message_at] == total_volume_update_message_written.total_volume[total_volume_update_message_at]); total_volume_update_message_at = total_volume_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Clear Message: 12 bytes -------------------------------------- */

/* Instrument Clear Message */
typedef InstrumentClearMessage {
  byte timestamp[8];
  byte instrument_id[4]
};

int instrument_clear_message_at;

/* every byte of Instrument Clear Message set to one value */
inline fill_instrument_clear_message(instrument_clear_message_record, instrument_clear_message_value) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> instrument_clear_message_record.timestamp[instrument_clear_message_at] = instrument_clear_message_value; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> instrument_clear_message_record.instrument_id[instrument_clear_message_at] = instrument_clear_message_value; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Clear Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_clear_message(instrument_clear_message_record, instrument_clear_message_base) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> instrument_clear_message_record.timestamp[instrument_clear_message_at] = (instrument_clear_message_base + 0 + instrument_clear_message_at + 1) % 256; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> instrument_clear_message_record.instrument_id[instrument_clear_message_at] = (instrument_clear_message_base + 8 + instrument_clear_message_at + 1) % 256; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Clear Message to the wire, 12 bytes from where the cursor stands */
inline encode_instrument_clear_message(instrument_clear_message_record) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> wire[at] = instrument_clear_message_record.timestamp[instrument_clear_message_at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> wire[at] = instrument_clear_message_record.instrument_id[instrument_clear_message_at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Clear Message off the wire, 12 bytes from where the cursor stands */
inline decode_instrument_clear_message(instrument_clear_message_record) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> instrument_clear_message_record.timestamp[instrument_clear_message_at] = wire[at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> instrument_clear_message_record.instrument_id[instrument_clear_message_at] = wire[at]; at = at + 1; instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Clear Message is what was written, byte for byte */
inline equal_instrument_clear_message(instrument_clear_message_read, instrument_clear_message_written) {
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 8 -> assert(instrument_clear_message_read.timestamp[instrument_clear_message_at] == instrument_clear_message_written.timestamp[instrument_clear_message_at]); instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  instrument_clear_message_at = 0;
  do
  :: instrument_clear_message_at < 4 -> assert(instrument_clear_message_read.instrument_id[instrument_clear_message_at] == instrument_clear_message_written.instrument_id[instrument_clear_message_at]); instrument_clear_message_at = instrument_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 35 bytes --------------------------------------------- */

/* Add Order Message */
typedef AddOrderMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte order_type;
  byte order_id[8];
  byte order_side;
  byte price[8];
  byte size[4];
  byte instrument_type
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.instrument_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_type = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_side = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.size[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.instrument_type = add_order_message_value;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.instrument_id[add_order_message_at] = (add_order_message_base + 8 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_type = (add_order_message_base + 12 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 13 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_side = (add_order_message_base + 21 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 22 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.size[add_order_message_at] = (add_order_message_base + 30 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.instrument_type = (add_order_message_base + 34 + 1) % 256;
  skip
}

/* Add Order Message to the wire, 35 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.timestamp[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.instrument_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.order_type; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.order_side; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.size[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.instrument_type; at = at + 1;
  skip
}

/* Add Order Message off the wire, 35 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.instrument_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_type = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.order_side = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.size[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.timestamp[add_order_message_at] == add_order_message_written.timestamp[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.instrument_id[add_order_message_at] == add_order_message_written.instrument_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.order_type == add_order_message_written.order_type);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.order_side == add_order_message_written.order_side);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.size[add_order_message_at] == add_order_message_written.size[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.instrument_type == add_order_message_written.instrument_type);
  skip
}

/* ---- Modify Order Message: 34 bytes ------------------------------------------ */

/* Modify Order Message */
typedef ModifyOrderMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte order_id[8];
  byte price[8];
  byte size_flags[4];
  byte order_side;
  byte instrument_type
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.timestamp[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.instrument_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.size_flags[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.order_side = modify_order_message_value;
  modify_order_message_record.instrument_type = modify_order_message_value;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.timestamp[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.instrument_id[modify_order_message_at] = (modify_order_message_base + 8 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = (modify_order_message_base + 12 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = (modify_order_message_base + 20 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.size_flags[modify_order_message_at] = (modify_order_message_base + 28 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.order_side = (modify_order_message_base + 32 + 1) % 256;
  modify_order_message_record.instrument_type = (modify_order_message_base + 33 + 1) % 256;
  skip
}

/* Modify Order Message to the wire, 34 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.timestamp[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.instrument_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.order_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> wire[at] = modify_order_message_record.price[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.size_flags[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.order_side; at = at + 1;
  wire[at] = modify_order_message_record.instrument_type; at = at + 1;
  skip
}

/* Modify Order Message off the wire, 34 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.timestamp[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.instrument_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.order_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> modify_order_message_record.price[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.size_flags[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.order_side = wire[at]; at = at + 1;
  modify_order_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.timestamp[modify_order_message_at] == modify_order_message_written.timestamp[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.instrument_id[modify_order_message_at] == modify_order_message_written.instrument_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.order_id[modify_order_message_at] == modify_order_message_written.order_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 8 -> assert(modify_order_message_read.price[modify_order_message_at] == modify_order_message_written.price[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.size_flags[modify_order_message_at] == modify_order_message_written.size_flags[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.order_side == modify_order_message_written.order_side);
  assert(modify_order_message_read.instrument_type == modify_order_message_written.instrument_type);
  skip
}

/* ---- Delete Order Message: 22 bytes ------------------------------------------ */

/* Delete Order Message */
typedef DeleteOrderMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte order_id[8];
  byte order_side;
  byte instrument_type
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.instrument_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.order_side = delete_order_message_value;
  delete_order_message_record.instrument_type = delete_order_message_value;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.instrument_id[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 12 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.order_side = (delete_order_message_base + 20 + 1) % 256;
  delete_order_message_record.instrument_type = (delete_order_message_base + 21 + 1) % 256;
  skip
}

/* Delete Order Message to the wire, 22 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.timestamp[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.instrument_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  wire[at] = delete_order_message_record.order_side; at = at + 1;
  wire[at] = delete_order_message_record.instrument_type; at = at + 1;
  skip
}

/* Delete Order Message off the wire, 22 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.timestamp[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.instrument_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.order_side = wire[at]; at = at + 1;
  delete_order_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.timestamp[delete_order_message_at] == delete_order_message_written.timestamp[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.instrument_id[delete_order_message_at] == delete_order_message_written.instrument_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  assert(delete_order_message_read.order_side == delete_order_message_written.order_side);
  assert(delete_order_message_read.instrument_type == delete_order_message_written.instrument_type);
  skip
}

/* ---- Order Execution Message: 62 bytes --------------------------------------- */

/* Order Execution Message */
typedef OrderExecutionMessage {
  byte timestamp[8];
  byte trade_date[2];
  byte instrument_id[4];
  byte buy_order_id[8];
  byte sell_order_id[8];
  byte aggressor_side;
  byte trade_id[8];
  byte correction_number;
  byte price[8];
  byte size[4];
  byte trade_type;
  byte complex_trade_id[8];
  byte instrument_type
};

int order_execution_message_at;

/* every byte of Order Execution Message set to one value */
inline fill_order_execution_message(order_execution_message_record, order_execution_message_value) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.timestamp[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.trade_date[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.instrument_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.buy_order_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.sell_order_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.aggressor_side = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.trade_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.correction_number = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.price[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.size[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_type = order_execution_message_value;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.complex_trade_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.instrument_type = order_execution_message_value;
  skip
}

/* each byte of Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_message(order_execution_message_record, order_execution_message_base) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.timestamp[order_execution_message_at] = (order_execution_message_base + 0 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.trade_date[order_execution_message_at] = (order_execution_message_base + 8 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.instrument_id[order_execution_message_at] = (order_execution_message_base + 10 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.buy_order_id[order_execution_message_at] = (order_execution_message_base + 14 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.sell_order_id[order_execution_message_at] = (order_execution_message_base + 22 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.aggressor_side = (order_execution_message_base + 30 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.trade_id[order_execution_message_at] = (order_execution_message_base + 31 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.correction_number = (order_execution_message_base + 39 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.price[order_execution_message_at] = (order_execution_message_base + 40 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.size[order_execution_message_at] = (order_execution_message_base + 48 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_type = (order_execution_message_base + 52 + 1) % 256;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.complex_trade_id[order_execution_message_at] = (order_execution_message_base + 53 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.instrument_type = (order_execution_message_base + 61 + 1) % 256;
  skip
}

/* Order Execution Message to the wire, 62 bytes from where the cursor stands */
inline encode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.timestamp[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> wire[at] = order_execution_message_record.trade_date[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.instrument_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.buy_order_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.sell_order_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.aggressor_side; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.trade_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.correction_number; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.price[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.size[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.trade_type; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.complex_trade_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  wire[at] = order_execution_message_record.instrument_type; at = at + 1;
  skip
}

/* Order Execution Message off the wire, 62 bytes from where the cursor stands */
inline decode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.timestamp[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> order_execution_message_record.trade_date[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.instrument_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.buy_order_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.sell_order_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.aggressor_side = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.trade_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.correction_number = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.price[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.size[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.trade_type = wire[at]; at = at + 1;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.complex_trade_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_record.instrument_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Execution Message is what was written, byte for byte */
inline equal_order_execution_message(order_execution_message_read, order_execution_message_written) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.timestamp[order_execution_message_at] == order_execution_message_written.timestamp[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 2 -> assert(order_execution_message_read.trade_date[order_execution_message_at] == order_execution_message_written.trade_date[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.instrument_id[order_execution_message_at] == order_execution_message_written.instrument_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.buy_order_id[order_execution_message_at] == order_execution_message_written.buy_order_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.sell_order_id[order_execution_message_at] == order_execution_message_written.sell_order_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.aggressor_side == order_execution_message_written.aggressor_side);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.trade_id[order_execution_message_at] == order_execution_message_written.trade_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.correction_number == order_execution_message_written.correction_number);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.price[order_execution_message_at] == order_execution_message_written.price[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.size[order_execution_message_at] == order_execution_message_written.size[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.trade_type == order_execution_message_written.trade_type);
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.complex_trade_id[order_execution_message_at] == order_execution_message_written.complex_trade_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  assert(order_execution_message_read.instrument_type == order_execution_message_written.instrument_type);
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

/* Anticipated Opening Price Message: encoded, read back, and compared */
proctype check_anticipated_opening_price_message() {
  AnticipatedOpeningPriceMessage anticipated_opening_price_message_sent;
  AnticipatedOpeningPriceMessage anticipated_opening_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_anticipated_opening_price_message(anticipated_opening_price_message_sent, 0)
  :: pattern == 1 -> fill_anticipated_opening_price_message(anticipated_opening_price_message_sent, 32)
  :: pattern == 2 -> fill_anticipated_opening_price_message(anticipated_opening_price_message_sent, 255)
  :: else -> ramp_anticipated_opening_price_message(anticipated_opening_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_anticipated_opening_price_message(anticipated_opening_price_message_sent);
    assert(at == 25);
    at = 0;
    decode_anticipated_opening_price_message(anticipated_opening_price_message_got);
    assert(at == 25);
    equal_anticipated_opening_price_message(anticipated_opening_price_message_got, anticipated_opening_price_message_sent)
  }
}

/* Settlement Price Update Message: encoded, read back, and compared */
proctype check_settlement_price_update_message() {
  SettlementPriceUpdateMessage settlement_price_update_message_sent;
  SettlementPriceUpdateMessage settlement_price_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_price_update_message(settlement_price_update_message_sent, 0)
  :: pattern == 1 -> fill_settlement_price_update_message(settlement_price_update_message_sent, 32)
  :: pattern == 2 -> fill_settlement_price_update_message(settlement_price_update_message_sent, 255)
  :: else -> ramp_settlement_price_update_message(settlement_price_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_price_update_message(settlement_price_update_message_sent);
    assert(at == 24);
    at = 0;
    decode_settlement_price_update_message(settlement_price_update_message_got);
    assert(at == 24);
    equal_settlement_price_update_message(settlement_price_update_message_got, settlement_price_update_message_sent)
  }
}

/* Open Interest Update Message: encoded, read back, and compared */
proctype check_open_interest_update_message() {
  OpenInterestUpdateMessage open_interest_update_message_sent;
  OpenInterestUpdateMessage open_interest_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_update_message(open_interest_update_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_update_message(open_interest_update_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_update_message(open_interest_update_message_sent, 255)
  :: else -> ramp_open_interest_update_message(open_interest_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_update_message(open_interest_update_message_sent);
    assert(at == 18);
    at = 0;
    decode_open_interest_update_message(open_interest_update_message_got);
    assert(at == 18);
    equal_open_interest_update_message(open_interest_update_message_got, open_interest_update_message_sent)
  }
}

/* Total Volume Update Message: encoded, read back, and compared */
proctype check_total_volume_update_message() {
  TotalVolumeUpdateMessage total_volume_update_message_sent;
  TotalVolumeUpdateMessage total_volume_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_total_volume_update_message(total_volume_update_message_sent, 0)
  :: pattern == 1 -> fill_total_volume_update_message(total_volume_update_message_sent, 32)
  :: pattern == 2 -> fill_total_volume_update_message(total_volume_update_message_sent, 255)
  :: else -> ramp_total_volume_update_message(total_volume_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_total_volume_update_message(total_volume_update_message_sent);
    assert(at == 18);
    at = 0;
    decode_total_volume_update_message(total_volume_update_message_got);
    assert(at == 18);
    equal_total_volume_update_message(total_volume_update_message_got, total_volume_update_message_sent)
  }
}

/* Instrument Clear Message: encoded, read back, and compared */
proctype check_instrument_clear_message() {
  InstrumentClearMessage instrument_clear_message_sent;
  InstrumentClearMessage instrument_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_clear_message(instrument_clear_message_sent, 0)
  :: pattern == 1 -> fill_instrument_clear_message(instrument_clear_message_sent, 32)
  :: pattern == 2 -> fill_instrument_clear_message(instrument_clear_message_sent, 255)
  :: else -> ramp_instrument_clear_message(instrument_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_clear_message(instrument_clear_message_sent);
    assert(at == 12);
    at = 0;
    decode_instrument_clear_message(instrument_clear_message_got);
    assert(at == 12);
    equal_instrument_clear_message(instrument_clear_message_got, instrument_clear_message_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 35);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 35);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Modify Order Message: encoded, read back, and compared */
proctype check_modify_order_message() {
  ModifyOrderMessage modify_order_message_sent;
  ModifyOrderMessage modify_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_message(modify_order_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_message(modify_order_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_message(modify_order_message_sent, 255)
  :: else -> ramp_modify_order_message(modify_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_message(modify_order_message_sent);
    assert(at == 34);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 34);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 22);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 22);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Order Execution Message: encoded, read back, and compared */
proctype check_order_execution_message() {
  OrderExecutionMessage order_execution_message_sent;
  OrderExecutionMessage order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_message(order_execution_message_sent, 0)
  :: pattern == 1 -> fill_order_execution_message(order_execution_message_sent, 32)
  :: pattern == 2 -> fill_order_execution_message(order_execution_message_sent, 255)
  :: else -> ramp_order_execution_message(order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_message(order_execution_message_sent);
    assert(at == 62);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 62);
    equal_order_execution_message(order_execution_message_got, order_execution_message_sent)
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
  :: run check_anticipated_opening_price_message()
  :: run check_settlement_price_update_message()
  :: run check_open_interest_update_message()
  :: run check_total_volume_update_message()
  :: run check_instrument_clear_message()
  :: run check_add_order_message()
  :: run check_modify_order_message()
  :: run check_delete_order_message()
  :: run check_order_execution_message()
  :: run check_trade_cancel_message()
  :: run check_refresh_request()
  :: run check_end_of_refresh()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_retransmission_request()
  fi
}
