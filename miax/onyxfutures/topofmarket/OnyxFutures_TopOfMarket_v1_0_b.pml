/*
 * Miami International Holdings Top Of Market
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
  byte tom_version[8];
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
  :: system_state_message_at < 8 -> system_state_message_record.tom_version[system_state_message_at] = system_state_message_value; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.tom_version[system_state_message_at] = (system_state_message_base + 8 + system_state_message_at + 1) % 256; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> wire[at] = system_state_message_record.tom_version[system_state_message_at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> system_state_message_record.tom_version[system_state_message_at] = wire[at]; at = at + 1; system_state_message_at = system_state_message_at + 1
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
  :: system_state_message_at < 8 -> assert(system_state_message_read.tom_version[system_state_message_at] == system_state_message_written.tom_version[system_state_message_at]); system_state_message_at = system_state_message_at + 1
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

/* ---- Best Bid And Offer Message: 36 bytes ------------------------------------ */

/* used to publish MIAX Futures Onyx Best Bid and Offer (MBBO) of a Simple Instrument or Complex Instrument */
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

/* ---- Last Sale Message: 32 bytes --------------------------------------------- */

/* used to disseminate trades that are resulting from executions on MIAX Futures Onyx during the current trading session */
typedef LastSaleMessage {
  byte timestamp[8];
  byte instrument_id[4];
  byte trade_id[8];
  byte price[8];
  byte size[4]
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
  :: last_sale_message_at < 4 -> last_sale_message_record.instrument_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.trade_id[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
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
  :: last_sale_message_at < 4 -> last_sale_message_record.instrument_id[last_sale_message_at] = (last_sale_message_base + 8 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.trade_id[last_sale_message_at] = (last_sale_message_base + 12 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.price[last_sale_message_at] = (last_sale_message_base + 20 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.size[last_sale_message_at] = (last_sale_message_base + 28 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Sale Message to the wire, 32 bytes from where the cursor stands */
inline encode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> wire[at] = last_sale_message_record.timestamp[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
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
  skip
}

/* Last Sale Message off the wire, 32 bytes from where the cursor stands */
inline decode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> last_sale_message_record.timestamp[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
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
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.instrument_id[last_sale_message_at] == last_sale_message_written.instrument_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 8 -> assert(last_sale_message_read.trade_id[last_sale_message_at] == last_sale_message_written.trade_id[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
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
    assert(at == 32);
    at = 0;
    decode_last_sale_message(last_sale_message_got);
    assert(at == 32);
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
  :: run check_best_bid_and_offer_message()
  :: run check_last_sale_message()
  :: run check_trade_cancel_message()
  fi
}
