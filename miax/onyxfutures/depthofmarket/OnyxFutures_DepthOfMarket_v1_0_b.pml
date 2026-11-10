/*
 * Miami International Holdings Depth Of Market
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 119

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

/* ---- Simple Instrument Definition Message: 119 bytes ------------------------- */

/* used to disseminate all Simple Instruments traded on MIAX FuturesOnyx for the current trading session */
typedef SimpleInstrumentDefinitionMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte underlying_asset_type;
  byte underlying_asset[4];
  byte product_group_code[6];
  byte exchange[4];
  byte instrument_id_source;
  byte instrument_type;
  byte maturity_month_year[4];
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
  byte reserved_16[16]
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
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_asset[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> simple_instrument_definition_message_record.product_group_code[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.instrument_id_source = simple_instrument_definition_message_value;
  simple_instrument_definition_message_record.instrument_type = simple_instrument_definition_message_value;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.maturity_month_year[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
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
  :: simple_instrument_definition_message_at < 16 -> simple_instrument_definition_message_record.reserved_16[simple_instrument_definition_message_at] = simple_instrument_definition_message_value; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
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
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_asset[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 13 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> simple_instrument_definition_message_record.product_group_code[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 17 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 23 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.instrument_id_source = (simple_instrument_definition_message_base + 27 + 1) % 256;
  simple_instrument_definition_message_record.instrument_type = (simple_instrument_definition_message_base + 28 + 1) % 256;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.maturity_month_year[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 29 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
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
  :: simple_instrument_definition_message_at < 16 -> simple_instrument_definition_message_record.reserved_16[simple_instrument_definition_message_at] = (simple_instrument_definition_message_base + 103 + simple_instrument_definition_message_at + 1) % 256; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Definition Message to the wire, 119 bytes from where the cursor stands */
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
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.underlying_asset[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> wire[at] = simple_instrument_definition_message_record.product_group_code[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = simple_instrument_definition_message_record.instrument_id_source; at = at + 1;
  wire[at] = simple_instrument_definition_message_record.instrument_type; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> wire[at] = simple_instrument_definition_message_record.maturity_month_year[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
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
  :: simple_instrument_definition_message_at < 16 -> wire[at] = simple_instrument_definition_message_record.reserved_16[simple_instrument_definition_message_at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Simple Instrument Definition Message off the wire, 119 bytes from where the cursor stands */
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
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.underlying_asset[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> simple_instrument_definition_message_record.product_group_code[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.exchange[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_record.instrument_id_source = wire[at]; at = at + 1;
  simple_instrument_definition_message_record.instrument_type = wire[at]; at = at + 1;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> simple_instrument_definition_message_record.maturity_month_year[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
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
  :: simple_instrument_definition_message_at < 16 -> simple_instrument_definition_message_record.reserved_16[simple_instrument_definition_message_at] = wire[at]; at = at + 1; simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
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
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.underlying_asset[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.underlying_asset[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 6 -> assert(simple_instrument_definition_message_read.product_group_code[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.product_group_code[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.exchange[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.exchange[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  assert(simple_instrument_definition_message_read.instrument_id_source == simple_instrument_definition_message_written.instrument_id_source);
  assert(simple_instrument_definition_message_read.instrument_type == simple_instrument_definition_message_written.instrument_type);
  simple_instrument_definition_message_at = 0;
  do
  :: simple_instrument_definition_message_at < 4 -> assert(simple_instrument_definition_message_read.maturity_month_year[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.maturity_month_year[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
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
  :: simple_instrument_definition_message_at < 16 -> assert(simple_instrument_definition_message_read.reserved_16[simple_instrument_definition_message_at] == simple_instrument_definition_message_written.reserved_16[simple_instrument_definition_message_at]); simple_instrument_definition_message_at = simple_instrument_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Message: 18 bytes ------------------------------------------ */

typedef SystemStateMessage {
  byte timestamp[8];
  byte dom_version[8];
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
  :: system_state_message_at < 8 -> system_state_message_record.dom_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.dom_version[system_state_message_at] = (system_state_message_base + 8 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.dom_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.dom_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> assert(system_state_message_read.dom_version[system_state_message_at] == system_state_message_written.dom_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
  :: else -> break
  od;
  assert(system_state_message_read.session_id == system_state_message_written.session_id);
  assert(system_state_message_read.system_status == system_state_message_written.system_status);
  skip
}

/* ---- Instrument Trading Status Notification Message: 14 bytes ---------------- */

/* Used to notify firms of changes to the trading status of a particular Simple or Complex instrument */
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

/* ---- Anticipated Opening Price Message: 24 bytes ----------------------------- */

/* used to publish Anticipated Opening Price Messages for each Simple Instrument and Complex Instrument before the start of trading */
typedef AnticipatedOpeningPriceMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte anticipated_opening_price[8];
  byte opening_match_quantity[4]
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
  skip
}

/* Anticipated Opening Price Message to the wire, 24 bytes from where the cursor stands */
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
  skip
}

/* Anticipated Opening Price Message off the wire, 24 bytes from where the cursor stands */
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
  skip
}

/* ---- Settlement Price Update Message: 24 bytes ------------------------------- */

/* Used to publish a Settlement Price Update and will be disseminated for each Simple Instrument as the Settlement Price is calculated for the Futures Instrument */
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

/* Used to publish an Open Interest Update for each Simple Instrument once after the end of the last Trading Session */
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

/* used to publish a Total Volume Update for each Simple Instrument at the end of the last Trading Session */
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

/* Used to indicate that the MIAX Futures Onyx book for a Simple or Complex instrument has been cleared of all orders */
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

/* ---- Add Order Message: 34 bytes --------------------------------------------- */

/* Used when an order is added to the MIAX Futures Onyx book */
typedef AddOrderMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte order_type;
  byte order_id[8];
  byte order_side;
  byte price[8];
  byte size[4]
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
  skip
}

/* Add Order Message to the wire, 34 bytes from where the cursor stands */
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
  skip
}

/* Add Order Message off the wire, 34 bytes from where the cursor stands */
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
  skip
}

/* ---- Delete Order Message: 20 bytes ------------------------------------------ */

/* used to indicate that an order has been removed from the MIAX Futures Onyx book */
typedef DeleteOrderMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte order_id[8]
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
  skip
}

/* Delete Order Message to the wire, 20 bytes from where the cursor stands */
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
  skip
}

/* Delete Order Message off the wire, 20 bytes from where the cursor stands */
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
  skip
}

/* ---- Order Execution Message: 52 bytes --------------------------------------- */

/* Used when a Simple or Complex order on the book executes in whole or in part */
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
  byte size[4]
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
  skip
}

/* Order Execution Message to the wire, 52 bytes from where the cursor stands */
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
  skip
}

/* Order Execution Message off the wire, 52 bytes from where the cursor stands */
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
  skip
}

/* ---- Trade Cancel Message: 35 bytes ------------------------------------------ */

/* used to publish cancellation of a Simple Instrument trade which was previously published via an Order Execution Message */
typedef TradeCancelMessage {
  byte timestamp[8];
  byte trade_date[2];
  byte instrument_id[4];
  byte trade_id[8];
  byte correction_number;
  byte price[8];
  byte size[4]
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
  skip
}

/* Trade Cancel Message to the wire, 35 bytes from where the cursor stands */
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
  skip
}

/* Trade Cancel Message off the wire, 35 bytes from where the cursor stands */
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
    assert(at == 119);
    at = 0;
    decode_simple_instrument_definition_message(simple_instrument_definition_message_got);
    assert(at == 119);
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
    assert(at == 24);
    at = 0;
    decode_anticipated_opening_price_message(anticipated_opening_price_message_got);
    assert(at == 24);
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
    assert(at == 34);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 34);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
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
    assert(at == 20);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 20);
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
    assert(at == 52);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 52);
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
    assert(at == 35);
    at = 0;
    decode_trade_cancel_message(trade_cancel_message_got);
    assert(at == 35);
    equal_trade_cancel_message(trade_cancel_message_got, trade_cancel_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_mach_packet_header()
  :: run check_simple_instrument_definition_message()
  :: run check_system_state_message()
  :: run check_instrument_trading_status_notification_message()
  :: run check_anticipated_opening_price_message()
  :: run check_settlement_price_update_message()
  :: run check_open_interest_update_message()
  :: run check_total_volume_update_message()
  :: run check_instrument_clear_message()
  :: run check_add_order_message()
  :: run check_delete_order_message()
  :: run check_order_execution_message()
  :: run check_trade_cancel_message()
  fi
}
