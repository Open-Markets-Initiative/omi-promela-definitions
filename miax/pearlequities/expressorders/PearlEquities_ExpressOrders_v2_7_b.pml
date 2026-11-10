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
 *   - a field read in bits
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 87

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Esesm Packet Header: 3 bytes -------------------------------------------- */

/* ESesM packet header */
typedef EsesmPacketHeader {
  byte esesm_packet_length[2];
  byte esesm_packet_type
};

int esesm_packet_header_at;

/* every byte of Esesm Packet Header set to one value */
inline fill_esesm_packet_header(esesm_packet_header_record, esesm_packet_header_value) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at] = esesm_packet_header_value; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  esesm_packet_header_record.esesm_packet_type = esesm_packet_header_value;
  skip
}

/* each byte of Esesm Packet Header set to where it lies, so a field read out of place says so */
inline ramp_esesm_packet_header(esesm_packet_header_record, esesm_packet_header_base) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at] = (esesm_packet_header_base + 0 + esesm_packet_header_at + 1) % 256; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  esesm_packet_header_record.esesm_packet_type = (esesm_packet_header_base + 2 + 1) % 256;
  skip
}

/* Esesm Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_esesm_packet_header(esesm_packet_header_record) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> wire[at] = esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at]; at = at + 1; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = esesm_packet_header_record.esesm_packet_type; at = at + 1;
  skip
}

/* Esesm Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_esesm_packet_header(esesm_packet_header_record) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> esesm_packet_header_record.esesm_packet_length[esesm_packet_header_at] = wire[at]; at = at + 1; esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  esesm_packet_header_record.esesm_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Esesm Packet Header is what was written, byte for byte */
inline equal_esesm_packet_header(esesm_packet_header_read, esesm_packet_header_written) {
  esesm_packet_header_at = 0;
  do
  :: esesm_packet_header_at < 2 -> assert(esesm_packet_header_read.esesm_packet_length[esesm_packet_header_at] == esesm_packet_header_written.esesm_packet_length[esesm_packet_header_at]); esesm_packet_header_at = esesm_packet_header_at + 1
  :: else -> break
  od;
  assert(esesm_packet_header_read.esesm_packet_type == esesm_packet_header_written.esesm_packet_type);
  skip
}

/* ---- Symbol Update Message: 59 bytes ----------------------------------------- */

/* used to disseminate all security symbols traded on MIAX Pearl Equities for the current session */
typedef SymbolUpdateMessage {
  byte matching_engine_time[8];
  byte symbol_id[4];
  byte ticker_symbol[11];
  byte reserved_1;
  byte test_security_indicator;
  byte second_reserved_1;
  byte lot_size[4];
  byte opening_time[8];
  byte closing_time[8];
  byte primary_market_code;
  byte reserved_12[12]
};

int symbol_update_message_at;

/* every byte of Symbol Update Message set to one value */
inline fill_symbol_update_message(symbol_update_message_record, symbol_update_message_value) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.matching_engine_time[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.symbol_id[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> symbol_update_message_record.ticker_symbol[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.reserved_1 = symbol_update_message_value;
  symbol_update_message_record.test_security_indicator = symbol_update_message_value;
  symbol_update_message_record.second_reserved_1 = symbol_update_message_value;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.lot_size[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.opening_time[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.closing_time[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.primary_market_code = symbol_update_message_value;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 12 -> symbol_update_message_record.reserved_12[symbol_update_message_at] = symbol_update_message_value; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Update Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_update_message(symbol_update_message_record, symbol_update_message_base) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.matching_engine_time[symbol_update_message_at] = (symbol_update_message_base + 0 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.symbol_id[symbol_update_message_at] = (symbol_update_message_base + 8 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> symbol_update_message_record.ticker_symbol[symbol_update_message_at] = (symbol_update_message_base + 12 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.reserved_1 = (symbol_update_message_base + 23 + 1) % 256;
  symbol_update_message_record.test_security_indicator = (symbol_update_message_base + 24 + 1) % 256;
  symbol_update_message_record.second_reserved_1 = (symbol_update_message_base + 25 + 1) % 256;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.lot_size[symbol_update_message_at] = (symbol_update_message_base + 26 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.opening_time[symbol_update_message_at] = (symbol_update_message_base + 30 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.closing_time[symbol_update_message_at] = (symbol_update_message_base + 38 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.primary_market_code = (symbol_update_message_base + 46 + 1) % 256;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 12 -> symbol_update_message_record.reserved_12[symbol_update_message_at] = (symbol_update_message_base + 47 + symbol_update_message_at + 1) % 256; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Update Message to the wire, 59 bytes from where the cursor stands */
inline encode_symbol_update_message(symbol_update_message_record) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> wire[at] = symbol_update_message_record.matching_engine_time[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> wire[at] = symbol_update_message_record.symbol_id[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> wire[at] = symbol_update_message_record.ticker_symbol[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_update_message_record.reserved_1; at = at + 1;
  wire[at] = symbol_update_message_record.test_security_indicator; at = at + 1;
  wire[at] = symbol_update_message_record.second_reserved_1; at = at + 1;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> wire[at] = symbol_update_message_record.lot_size[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> wire[at] = symbol_update_message_record.opening_time[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> wire[at] = symbol_update_message_record.closing_time[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_update_message_record.primary_market_code; at = at + 1;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 12 -> wire[at] = symbol_update_message_record.reserved_12[symbol_update_message_at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Update Message off the wire, 59 bytes from where the cursor stands */
inline decode_symbol_update_message(symbol_update_message_record) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.matching_engine_time[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.symbol_id[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> symbol_update_message_record.ticker_symbol[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.reserved_1 = wire[at]; at = at + 1;
  symbol_update_message_record.test_security_indicator = wire[at]; at = at + 1;
  symbol_update_message_record.second_reserved_1 = wire[at]; at = at + 1;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> symbol_update_message_record.lot_size[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.opening_time[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> symbol_update_message_record.closing_time[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_record.primary_market_code = wire[at]; at = at + 1;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 12 -> symbol_update_message_record.reserved_12[symbol_update_message_at] = wire[at]; at = at + 1; symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Update Message is what was written, byte for byte */
inline equal_symbol_update_message(symbol_update_message_read, symbol_update_message_written) {
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> assert(symbol_update_message_read.matching_engine_time[symbol_update_message_at] == symbol_update_message_written.matching_engine_time[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> assert(symbol_update_message_read.symbol_id[symbol_update_message_at] == symbol_update_message_written.symbol_id[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 11 -> assert(symbol_update_message_read.ticker_symbol[symbol_update_message_at] == symbol_update_message_written.ticker_symbol[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  assert(symbol_update_message_read.reserved_1 == symbol_update_message_written.reserved_1);
  assert(symbol_update_message_read.test_security_indicator == symbol_update_message_written.test_security_indicator);
  assert(symbol_update_message_read.second_reserved_1 == symbol_update_message_written.second_reserved_1);
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 4 -> assert(symbol_update_message_read.lot_size[symbol_update_message_at] == symbol_update_message_written.lot_size[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> assert(symbol_update_message_read.opening_time[symbol_update_message_at] == symbol_update_message_written.opening_time[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 8 -> assert(symbol_update_message_read.closing_time[symbol_update_message_at] == symbol_update_message_written.closing_time[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  assert(symbol_update_message_read.primary_market_code == symbol_update_message_written.primary_market_code);
  symbol_update_message_at = 0;
  do
  :: symbol_update_message_at < 12 -> assert(symbol_update_message_read.reserved_12[symbol_update_message_at] == symbol_update_message_written.reserved_12[symbol_update_message_at]); symbol_update_message_at = symbol_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Response Message: 76 bytes ------------------------------------ */

/* provides an acknowledgement for a New Order Request accepted by MIAX Pearl Equities */
typedef NewOrderResponseMessage {
  byte matching_engine_time[8];
  byte mpid[4];
  byte client_order_id[20];
  byte symbol_id[4];
  byte order_id[8];
  byte price[8];
  byte size[4];
  byte order_status;
  byte reserved_19[19]
};

int new_order_response_message_at;

/* every byte of New Order Response Message set to one value */
inline fill_new_order_response_message(new_order_response_message_record, new_order_response_message_value) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.matching_engine_time[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.mpid[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> new_order_response_message_record.client_order_id[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.symbol_id[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.order_id[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.price[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.size[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_record.order_status = new_order_response_message_value;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 19 -> new_order_response_message_record.reserved_19[new_order_response_message_at] = new_order_response_message_value; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Response Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_response_message(new_order_response_message_record, new_order_response_message_base) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.matching_engine_time[new_order_response_message_at] = (new_order_response_message_base + 0 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.mpid[new_order_response_message_at] = (new_order_response_message_base + 8 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> new_order_response_message_record.client_order_id[new_order_response_message_at] = (new_order_response_message_base + 12 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.symbol_id[new_order_response_message_at] = (new_order_response_message_base + 32 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.order_id[new_order_response_message_at] = (new_order_response_message_base + 36 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.price[new_order_response_message_at] = (new_order_response_message_base + 44 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.size[new_order_response_message_at] = (new_order_response_message_base + 52 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_record.order_status = (new_order_response_message_base + 56 + 1) % 256;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 19 -> new_order_response_message_record.reserved_19[new_order_response_message_at] = (new_order_response_message_base + 57 + new_order_response_message_at + 1) % 256; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Response Message to the wire, 76 bytes from where the cursor stands */
inline encode_new_order_response_message(new_order_response_message_record) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> wire[at] = new_order_response_message_record.matching_engine_time[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> wire[at] = new_order_response_message_record.mpid[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> wire[at] = new_order_response_message_record.client_order_id[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> wire[at] = new_order_response_message_record.symbol_id[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> wire[at] = new_order_response_message_record.order_id[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> wire[at] = new_order_response_message_record.price[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> wire[at] = new_order_response_message_record.size[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_response_message_record.order_status; at = at + 1;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 19 -> wire[at] = new_order_response_message_record.reserved_19[new_order_response_message_at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Response Message off the wire, 76 bytes from where the cursor stands */
inline decode_new_order_response_message(new_order_response_message_record) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.matching_engine_time[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.mpid[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> new_order_response_message_record.client_order_id[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.symbol_id[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.order_id[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> new_order_response_message_record.price[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> new_order_response_message_record.size[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_record.order_status = wire[at]; at = at + 1;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 19 -> new_order_response_message_record.reserved_19[new_order_response_message_at] = wire[at]; at = at + 1; new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Response Message is what was written, byte for byte */
inline equal_new_order_response_message(new_order_response_message_read, new_order_response_message_written) {
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> assert(new_order_response_message_read.matching_engine_time[new_order_response_message_at] == new_order_response_message_written.matching_engine_time[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> assert(new_order_response_message_read.mpid[new_order_response_message_at] == new_order_response_message_written.mpid[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 20 -> assert(new_order_response_message_read.client_order_id[new_order_response_message_at] == new_order_response_message_written.client_order_id[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> assert(new_order_response_message_read.symbol_id[new_order_response_message_at] == new_order_response_message_written.symbol_id[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> assert(new_order_response_message_read.order_id[new_order_response_message_at] == new_order_response_message_written.order_id[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 8 -> assert(new_order_response_message_read.price[new_order_response_message_at] == new_order_response_message_written.price[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 4 -> assert(new_order_response_message_read.size[new_order_response_message_at] == new_order_response_message_written.size[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  assert(new_order_response_message_read.order_status == new_order_response_message_written.order_status);
  new_order_response_message_at = 0;
  do
  :: new_order_response_message_at < 19 -> assert(new_order_response_message_read.reserved_19[new_order_response_message_at] == new_order_response_message_written.reserved_19[new_order_response_message_at]); new_order_response_message_at = new_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Response Message: 87 bytes --------------------------------- */

/* This message format provides acknowledgement for a Modify Order Request accepted by MIAX Pearl Equities */
typedef ModifyOrderResponseMessage {
  byte matching_engine_time[8];
  byte mpid[4];
  byte client_order_id[20];
  byte original_client_order_id[20];
  byte symbol_id[4];
  byte order_id[8];
  byte leaves_qty[4];
  byte price[8];
  byte modify_status;
  byte reserved_10[10]
};

int modify_order_response_message_at;

/* every byte of Modify Order Response Message set to one value */
inline fill_modify_order_response_message(modify_order_response_message_record, modify_order_response_message_value) {
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.matching_engine_time[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.mpid[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> modify_order_response_message_record.client_order_id[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> modify_order_response_message_record.original_client_order_id[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.symbol_id[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.order_id[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.leaves_qty[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.price[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_record.modify_status = modify_order_response_message_value;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 10 -> modify_order_response_message_record.reserved_10[modify_order_response_message_at] = modify_order_response_message_value; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Response Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_response_message(modify_order_response_message_record, modify_order_response_message_base) {
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.matching_engine_time[modify_order_response_message_at] = (modify_order_response_message_base + 0 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.mpid[modify_order_response_message_at] = (modify_order_response_message_base + 8 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> modify_order_response_message_record.client_order_id[modify_order_response_message_at] = (modify_order_response_message_base + 12 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> modify_order_response_message_record.original_client_order_id[modify_order_response_message_at] = (modify_order_response_message_base + 32 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.symbol_id[modify_order_response_message_at] = (modify_order_response_message_base + 52 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.order_id[modify_order_response_message_at] = (modify_order_response_message_base + 56 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.leaves_qty[modify_order_response_message_at] = (modify_order_response_message_base + 64 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.price[modify_order_response_message_at] = (modify_order_response_message_base + 68 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_record.modify_status = (modify_order_response_message_base + 76 + 1) % 256;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 10 -> modify_order_response_message_record.reserved_10[modify_order_response_message_at] = (modify_order_response_message_base + 77 + modify_order_response_message_at + 1) % 256; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Response Message to the wire, 87 bytes from where the cursor stands */
inline encode_modify_order_response_message(modify_order_response_message_record) {
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> wire[at] = modify_order_response_message_record.matching_engine_time[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> wire[at] = modify_order_response_message_record.mpid[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> wire[at] = modify_order_response_message_record.client_order_id[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> wire[at] = modify_order_response_message_record.original_client_order_id[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> wire[at] = modify_order_response_message_record.symbol_id[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> wire[at] = modify_order_response_message_record.order_id[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> wire[at] = modify_order_response_message_record.leaves_qty[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> wire[at] = modify_order_response_message_record.price[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_response_message_record.modify_status; at = at + 1;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 10 -> wire[at] = modify_order_response_message_record.reserved_10[modify_order_response_message_at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Response Message off the wire, 87 bytes from where the cursor stands */
inline decode_modify_order_response_message(modify_order_response_message_record) {
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.matching_engine_time[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.mpid[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> modify_order_response_message_record.client_order_id[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> modify_order_response_message_record.original_client_order_id[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.symbol_id[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.order_id[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> modify_order_response_message_record.leaves_qty[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> modify_order_response_message_record.price[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_record.modify_status = wire[at]; at = at + 1;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 10 -> modify_order_response_message_record.reserved_10[modify_order_response_message_at] = wire[at]; at = at + 1; modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Response Message is what was written, byte for byte */
inline equal_modify_order_response_message(modify_order_response_message_read, modify_order_response_message_written) {
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> assert(modify_order_response_message_read.matching_engine_time[modify_order_response_message_at] == modify_order_response_message_written.matching_engine_time[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> assert(modify_order_response_message_read.mpid[modify_order_response_message_at] == modify_order_response_message_written.mpid[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> assert(modify_order_response_message_read.client_order_id[modify_order_response_message_at] == modify_order_response_message_written.client_order_id[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 20 -> assert(modify_order_response_message_read.original_client_order_id[modify_order_response_message_at] == modify_order_response_message_written.original_client_order_id[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> assert(modify_order_response_message_read.symbol_id[modify_order_response_message_at] == modify_order_response_message_written.symbol_id[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> assert(modify_order_response_message_read.order_id[modify_order_response_message_at] == modify_order_response_message_written.order_id[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 4 -> assert(modify_order_response_message_read.leaves_qty[modify_order_response_message_at] == modify_order_response_message_written.leaves_qty[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 8 -> assert(modify_order_response_message_read.price[modify_order_response_message_at] == modify_order_response_message_written.price[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  assert(modify_order_response_message_read.modify_status == modify_order_response_message_written.modify_status);
  modify_order_response_message_at = 0;
  do
  :: modify_order_response_message_at < 10 -> assert(modify_order_response_message_read.reserved_10[modify_order_response_message_at] == modify_order_response_message_written.reserved_10[modify_order_response_message_at]); modify_order_response_message_at = modify_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Response Message: 79 bytes --------------------------------- */

/* This message format provides response to an Order Cancel Request */
typedef CancelOrderResponseMessage {
  byte matching_engine_time[8];
  byte mpid[4];
  byte client_order_id[20];
  byte original_client_order_id[20];
  byte symbol_id[4];
  byte order_id[8];
  byte leaves_qty[4];
  byte cancel_status;
  byte reserved_10[10]
};

int cancel_order_response_message_at;

/* every byte of Cancel Order Response Message set to one value */
inline fill_cancel_order_response_message(cancel_order_response_message_record, cancel_order_response_message_value) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.matching_engine_time[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.mpid[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> cancel_order_response_message_record.client_order_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> cancel_order_response_message_record.original_client_order_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.symbol_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.order_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.leaves_qty[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_record.cancel_status = cancel_order_response_message_value;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 10 -> cancel_order_response_message_record.reserved_10[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Response Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_response_message(cancel_order_response_message_record, cancel_order_response_message_base) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.matching_engine_time[cancel_order_response_message_at] = (cancel_order_response_message_base + 0 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.mpid[cancel_order_response_message_at] = (cancel_order_response_message_base + 8 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> cancel_order_response_message_record.client_order_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 12 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> cancel_order_response_message_record.original_client_order_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 32 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.symbol_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 52 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.order_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 56 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.leaves_qty[cancel_order_response_message_at] = (cancel_order_response_message_base + 64 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_record.cancel_status = (cancel_order_response_message_base + 68 + 1) % 256;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 10 -> cancel_order_response_message_record.reserved_10[cancel_order_response_message_at] = (cancel_order_response_message_base + 69 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Response Message to the wire, 79 bytes from where the cursor stands */
inline encode_cancel_order_response_message(cancel_order_response_message_record) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.matching_engine_time[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> wire[at] = cancel_order_response_message_record.mpid[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> wire[at] = cancel_order_response_message_record.client_order_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> wire[at] = cancel_order_response_message_record.original_client_order_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> wire[at] = cancel_order_response_message_record.symbol_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.order_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> wire[at] = cancel_order_response_message_record.leaves_qty[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_order_response_message_record.cancel_status; at = at + 1;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 10 -> wire[at] = cancel_order_response_message_record.reserved_10[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Response Message off the wire, 79 bytes from where the cursor stands */
inline decode_cancel_order_response_message(cancel_order_response_message_record) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.matching_engine_time[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.mpid[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> cancel_order_response_message_record.client_order_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> cancel_order_response_message_record.original_client_order_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.symbol_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.order_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> cancel_order_response_message_record.leaves_qty[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_record.cancel_status = wire[at]; at = at + 1;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 10 -> cancel_order_response_message_record.reserved_10[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Response Message is what was written, byte for byte */
inline equal_cancel_order_response_message(cancel_order_response_message_read, cancel_order_response_message_written) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.matching_engine_time[cancel_order_response_message_at] == cancel_order_response_message_written.matching_engine_time[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> assert(cancel_order_response_message_read.mpid[cancel_order_response_message_at] == cancel_order_response_message_written.mpid[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> assert(cancel_order_response_message_read.client_order_id[cancel_order_response_message_at] == cancel_order_response_message_written.client_order_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 20 -> assert(cancel_order_response_message_read.original_client_order_id[cancel_order_response_message_at] == cancel_order_response_message_written.original_client_order_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> assert(cancel_order_response_message_read.symbol_id[cancel_order_response_message_at] == cancel_order_response_message_written.symbol_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.order_id[cancel_order_response_message_at] == cancel_order_response_message_written.order_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 4 -> assert(cancel_order_response_message_read.leaves_qty[cancel_order_response_message_at] == cancel_order_response_message_written.leaves_qty[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  assert(cancel_order_response_message_read.cancel_status == cancel_order_response_message_written.cancel_status);
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 10 -> assert(cancel_order_response_message_read.reserved_10[cancel_order_response_message_at] == cancel_order_response_message_written.reserved_10[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order By Exchange Order Id Response Message: 59 bytes ------------ */

/* Cancel Order by Exchange Order ID Response */
typedef CancelOrderByExchangeOrderIdResponseMessage {
  byte matching_engine_time[8];
  byte mpid[4];
  byte client_order_id[20];
  byte symbol_id[4];
  byte order_id[8];
  byte leaves_qty[4];
  byte cancel_status;
  byte reserved_10[10]
};

int cancel_order_by_exchange_order_id_response_message_at;

/* every byte of Cancel Order By Exchange Order Id Response Message set to one value */
inline fill_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_record, cancel_order_by_exchange_order_id_response_message_value) {
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> cancel_order_by_exchange_order_id_response_message_record.matching_engine_time[cancel_order_by_exchange_order_id_response_message_at] = cancel_order_by_exchange_order_id_response_message_value; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.mpid[cancel_order_by_exchange_order_id_response_message_at] = cancel_order_by_exchange_order_id_response_message_value; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 20 -> cancel_order_by_exchange_order_id_response_message_record.client_order_id[cancel_order_by_exchange_order_id_response_message_at] = cancel_order_by_exchange_order_id_response_message_value; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.symbol_id[cancel_order_by_exchange_order_id_response_message_at] = cancel_order_by_exchange_order_id_response_message_value; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> cancel_order_by_exchange_order_id_response_message_record.order_id[cancel_order_by_exchange_order_id_response_message_at] = cancel_order_by_exchange_order_id_response_message_value; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.leaves_qty[cancel_order_by_exchange_order_id_response_message_at] = cancel_order_by_exchange_order_id_response_message_value; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_record.cancel_status = cancel_order_by_exchange_order_id_response_message_value;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 10 -> cancel_order_by_exchange_order_id_response_message_record.reserved_10[cancel_order_by_exchange_order_id_response_message_at] = cancel_order_by_exchange_order_id_response_message_value; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order By Exchange Order Id Response Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_record, cancel_order_by_exchange_order_id_response_message_base) {
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> cancel_order_by_exchange_order_id_response_message_record.matching_engine_time[cancel_order_by_exchange_order_id_response_message_at] = (cancel_order_by_exchange_order_id_response_message_base + 0 + cancel_order_by_exchange_order_id_response_message_at + 1) % 256; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.mpid[cancel_order_by_exchange_order_id_response_message_at] = (cancel_order_by_exchange_order_id_response_message_base + 8 + cancel_order_by_exchange_order_id_response_message_at + 1) % 256; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 20 -> cancel_order_by_exchange_order_id_response_message_record.client_order_id[cancel_order_by_exchange_order_id_response_message_at] = (cancel_order_by_exchange_order_id_response_message_base + 12 + cancel_order_by_exchange_order_id_response_message_at + 1) % 256; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.symbol_id[cancel_order_by_exchange_order_id_response_message_at] = (cancel_order_by_exchange_order_id_response_message_base + 32 + cancel_order_by_exchange_order_id_response_message_at + 1) % 256; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> cancel_order_by_exchange_order_id_response_message_record.order_id[cancel_order_by_exchange_order_id_response_message_at] = (cancel_order_by_exchange_order_id_response_message_base + 36 + cancel_order_by_exchange_order_id_response_message_at + 1) % 256; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.leaves_qty[cancel_order_by_exchange_order_id_response_message_at] = (cancel_order_by_exchange_order_id_response_message_base + 44 + cancel_order_by_exchange_order_id_response_message_at + 1) % 256; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_record.cancel_status = (cancel_order_by_exchange_order_id_response_message_base + 48 + 1) % 256;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 10 -> cancel_order_by_exchange_order_id_response_message_record.reserved_10[cancel_order_by_exchange_order_id_response_message_at] = (cancel_order_by_exchange_order_id_response_message_base + 49 + cancel_order_by_exchange_order_id_response_message_at + 1) % 256; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order By Exchange Order Id Response Message to the wire, 59 bytes from where the cursor stands */
inline encode_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_record) {
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> wire[at] = cancel_order_by_exchange_order_id_response_message_record.matching_engine_time[cancel_order_by_exchange_order_id_response_message_at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> wire[at] = cancel_order_by_exchange_order_id_response_message_record.mpid[cancel_order_by_exchange_order_id_response_message_at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 20 -> wire[at] = cancel_order_by_exchange_order_id_response_message_record.client_order_id[cancel_order_by_exchange_order_id_response_message_at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> wire[at] = cancel_order_by_exchange_order_id_response_message_record.symbol_id[cancel_order_by_exchange_order_id_response_message_at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> wire[at] = cancel_order_by_exchange_order_id_response_message_record.order_id[cancel_order_by_exchange_order_id_response_message_at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> wire[at] = cancel_order_by_exchange_order_id_response_message_record.leaves_qty[cancel_order_by_exchange_order_id_response_message_at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_order_by_exchange_order_id_response_message_record.cancel_status; at = at + 1;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 10 -> wire[at] = cancel_order_by_exchange_order_id_response_message_record.reserved_10[cancel_order_by_exchange_order_id_response_message_at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order By Exchange Order Id Response Message off the wire, 59 bytes from where the cursor stands */
inline decode_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_record) {
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> cancel_order_by_exchange_order_id_response_message_record.matching_engine_time[cancel_order_by_exchange_order_id_response_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.mpid[cancel_order_by_exchange_order_id_response_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 20 -> cancel_order_by_exchange_order_id_response_message_record.client_order_id[cancel_order_by_exchange_order_id_response_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.symbol_id[cancel_order_by_exchange_order_id_response_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> cancel_order_by_exchange_order_id_response_message_record.order_id[cancel_order_by_exchange_order_id_response_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> cancel_order_by_exchange_order_id_response_message_record.leaves_qty[cancel_order_by_exchange_order_id_response_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_record.cancel_status = wire[at]; at = at + 1;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 10 -> cancel_order_by_exchange_order_id_response_message_record.reserved_10[cancel_order_by_exchange_order_id_response_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order By Exchange Order Id Response Message is what was written, byte for byte */
inline equal_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_read, cancel_order_by_exchange_order_id_response_message_written) {
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> assert(cancel_order_by_exchange_order_id_response_message_read.matching_engine_time[cancel_order_by_exchange_order_id_response_message_at] == cancel_order_by_exchange_order_id_response_message_written.matching_engine_time[cancel_order_by_exchange_order_id_response_message_at]); cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> assert(cancel_order_by_exchange_order_id_response_message_read.mpid[cancel_order_by_exchange_order_id_response_message_at] == cancel_order_by_exchange_order_id_response_message_written.mpid[cancel_order_by_exchange_order_id_response_message_at]); cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 20 -> assert(cancel_order_by_exchange_order_id_response_message_read.client_order_id[cancel_order_by_exchange_order_id_response_message_at] == cancel_order_by_exchange_order_id_response_message_written.client_order_id[cancel_order_by_exchange_order_id_response_message_at]); cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> assert(cancel_order_by_exchange_order_id_response_message_read.symbol_id[cancel_order_by_exchange_order_id_response_message_at] == cancel_order_by_exchange_order_id_response_message_written.symbol_id[cancel_order_by_exchange_order_id_response_message_at]); cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 8 -> assert(cancel_order_by_exchange_order_id_response_message_read.order_id[cancel_order_by_exchange_order_id_response_message_at] == cancel_order_by_exchange_order_id_response_message_written.order_id[cancel_order_by_exchange_order_id_response_message_at]); cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 4 -> assert(cancel_order_by_exchange_order_id_response_message_read.leaves_qty[cancel_order_by_exchange_order_id_response_message_at] == cancel_order_by_exchange_order_id_response_message_written.leaves_qty[cancel_order_by_exchange_order_id_response_message_at]); cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  assert(cancel_order_by_exchange_order_id_response_message_read.cancel_status == cancel_order_by_exchange_order_id_response_message_written.cancel_status);
  cancel_order_by_exchange_order_id_response_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_response_message_at < 10 -> assert(cancel_order_by_exchange_order_id_response_message_read.reserved_10[cancel_order_by_exchange_order_id_response_message_at] == cancel_order_by_exchange_order_id_response_message_written.reserved_10[cancel_order_by_exchange_order_id_response_message_at]); cancel_order_by_exchange_order_id_response_message_at = cancel_order_by_exchange_order_id_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System State Notification Message: 26 bytes ----------------------------- */

/* This message is published whenever system state events take place */
typedef SystemStateNotificationMessage {
  byte matching_engine_time[8];
  byte meo_version[8];
  byte session_id;
  byte system_status;
  byte reserved_8[8]
};

int system_state_notification_message_at;

/* every byte of System State Notification Message set to one value */
inline fill_system_state_notification_message(system_state_notification_message_record, system_state_notification_message_value) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.matching_engine_time[system_state_notification_message_at] = system_state_notification_message_value; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.meo_version[system_state_notification_message_at] = system_state_notification_message_value; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_record.session_id = system_state_notification_message_value;
  system_state_notification_message_record.system_status = system_state_notification_message_value;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.reserved_8[system_state_notification_message_at] = system_state_notification_message_value; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System State Notification Message set to where it lies, so a field read out of place says so */
inline ramp_system_state_notification_message(system_state_notification_message_record, system_state_notification_message_base) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.matching_engine_time[system_state_notification_message_at] = (system_state_notification_message_base + 0 + system_state_notification_message_at + 1) % 256; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.meo_version[system_state_notification_message_at] = (system_state_notification_message_base + 8 + system_state_notification_message_at + 1) % 256; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_record.session_id = (system_state_notification_message_base + 16 + 1) % 256;
  system_state_notification_message_record.system_status = (system_state_notification_message_base + 17 + 1) % 256;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.reserved_8[system_state_notification_message_at] = (system_state_notification_message_base + 18 + system_state_notification_message_at + 1) % 256; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* System State Notification Message to the wire, 26 bytes from where the cursor stands */
inline encode_system_state_notification_message(system_state_notification_message_record) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> wire[at] = system_state_notification_message_record.matching_engine_time[system_state_notification_message_at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> wire[at] = system_state_notification_message_record.meo_version[system_state_notification_message_at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = system_state_notification_message_record.session_id; at = at + 1;
  wire[at] = system_state_notification_message_record.system_status; at = at + 1;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> wire[at] = system_state_notification_message_record.reserved_8[system_state_notification_message_at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* System State Notification Message off the wire, 26 bytes from where the cursor stands */
inline decode_system_state_notification_message(system_state_notification_message_record) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.matching_engine_time[system_state_notification_message_at] = wire[at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.meo_version[system_state_notification_message_at] = wire[at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_record.session_id = wire[at]; at = at + 1;
  system_state_notification_message_record.system_status = wire[at]; at = at + 1;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> system_state_notification_message_record.reserved_8[system_state_notification_message_at] = wire[at]; at = at + 1; system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System State Notification Message is what was written, byte for byte */
inline equal_system_state_notification_message(system_state_notification_message_read, system_state_notification_message_written) {
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> assert(system_state_notification_message_read.matching_engine_time[system_state_notification_message_at] == system_state_notification_message_written.matching_engine_time[system_state_notification_message_at]); system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> assert(system_state_notification_message_read.meo_version[system_state_notification_message_at] == system_state_notification_message_written.meo_version[system_state_notification_message_at]); system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  assert(system_state_notification_message_read.session_id == system_state_notification_message_written.session_id);
  assert(system_state_notification_message_read.system_status == system_state_notification_message_written.system_status);
  system_state_notification_message_at = 0;
  do
  :: system_state_notification_message_at < 8 -> assert(system_state_notification_message_read.reserved_8[system_state_notification_message_at] == system_state_notification_message_written.reserved_8[system_state_notification_message_at]); system_state_notification_message_at = system_state_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Reduce Size Order Notification Message: 71 bytes ----------------- */

/* This is the message format that will be used when Cancel Order Request is accepted by MIAX Pearl Equities or when unsolicited order cancels or order size reductions are to be notified to firms */
typedef CancelReduceSizeOrderNotificationMessage {
  byte matching_engine_time[8];
  byte mpid[4];
  byte client_order_id[20];
  byte symbol_id[4];
  byte order_id[8];
  byte leaves_qty[4];
  byte cancel_reason;
  byte last_price[8];
  byte last_size[4];
  byte pending_cancel_status;
  byte pending_reject_reason;
  byte reserved_8[8]
};

int cancel_reduce_size_order_notification_message_at;

/* every byte of Cancel Reduce Size Order Notification Message set to one value */
inline fill_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_record, cancel_reduce_size_order_notification_message_value) {
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.matching_engine_time[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.mpid[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 20 -> cancel_reduce_size_order_notification_message_record.client_order_id[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.symbol_id[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.order_id[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.leaves_qty[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_record.cancel_reason = cancel_reduce_size_order_notification_message_value;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.last_price[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.last_size[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_record.pending_cancel_status = cancel_reduce_size_order_notification_message_value;
  cancel_reduce_size_order_notification_message_record.pending_reject_reason = cancel_reduce_size_order_notification_message_value;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.reserved_8[cancel_reduce_size_order_notification_message_at] = cancel_reduce_size_order_notification_message_value; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Reduce Size Order Notification Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_record, cancel_reduce_size_order_notification_message_base) {
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.matching_engine_time[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 0 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.mpid[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 8 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 20 -> cancel_reduce_size_order_notification_message_record.client_order_id[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 12 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.symbol_id[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 32 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.order_id[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 36 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.leaves_qty[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 44 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_record.cancel_reason = (cancel_reduce_size_order_notification_message_base + 48 + 1) % 256;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.last_price[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 49 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.last_size[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 57 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_record.pending_cancel_status = (cancel_reduce_size_order_notification_message_base + 61 + 1) % 256;
  cancel_reduce_size_order_notification_message_record.pending_reject_reason = (cancel_reduce_size_order_notification_message_base + 62 + 1) % 256;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.reserved_8[cancel_reduce_size_order_notification_message_at] = (cancel_reduce_size_order_notification_message_base + 63 + cancel_reduce_size_order_notification_message_at + 1) % 256; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Reduce Size Order Notification Message to the wire, 71 bytes from where the cursor stands */
inline encode_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_record) {
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> wire[at] = cancel_reduce_size_order_notification_message_record.matching_engine_time[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> wire[at] = cancel_reduce_size_order_notification_message_record.mpid[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 20 -> wire[at] = cancel_reduce_size_order_notification_message_record.client_order_id[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> wire[at] = cancel_reduce_size_order_notification_message_record.symbol_id[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> wire[at] = cancel_reduce_size_order_notification_message_record.order_id[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> wire[at] = cancel_reduce_size_order_notification_message_record.leaves_qty[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_reduce_size_order_notification_message_record.cancel_reason; at = at + 1;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> wire[at] = cancel_reduce_size_order_notification_message_record.last_price[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> wire[at] = cancel_reduce_size_order_notification_message_record.last_size[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_reduce_size_order_notification_message_record.pending_cancel_status; at = at + 1;
  wire[at] = cancel_reduce_size_order_notification_message_record.pending_reject_reason; at = at + 1;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> wire[at] = cancel_reduce_size_order_notification_message_record.reserved_8[cancel_reduce_size_order_notification_message_at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Reduce Size Order Notification Message off the wire, 71 bytes from where the cursor stands */
inline decode_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_record) {
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.matching_engine_time[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.mpid[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 20 -> cancel_reduce_size_order_notification_message_record.client_order_id[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.symbol_id[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.order_id[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.leaves_qty[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_record.cancel_reason = wire[at]; at = at + 1;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.last_price[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> cancel_reduce_size_order_notification_message_record.last_size[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_record.pending_cancel_status = wire[at]; at = at + 1;
  cancel_reduce_size_order_notification_message_record.pending_reject_reason = wire[at]; at = at + 1;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> cancel_reduce_size_order_notification_message_record.reserved_8[cancel_reduce_size_order_notification_message_at] = wire[at]; at = at + 1; cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Reduce Size Order Notification Message is what was written, byte for byte */
inline equal_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_read, cancel_reduce_size_order_notification_message_written) {
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> assert(cancel_reduce_size_order_notification_message_read.matching_engine_time[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.matching_engine_time[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> assert(cancel_reduce_size_order_notification_message_read.mpid[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.mpid[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 20 -> assert(cancel_reduce_size_order_notification_message_read.client_order_id[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.client_order_id[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> assert(cancel_reduce_size_order_notification_message_read.symbol_id[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.symbol_id[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> assert(cancel_reduce_size_order_notification_message_read.order_id[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.order_id[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> assert(cancel_reduce_size_order_notification_message_read.leaves_qty[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.leaves_qty[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  assert(cancel_reduce_size_order_notification_message_read.cancel_reason == cancel_reduce_size_order_notification_message_written.cancel_reason);
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> assert(cancel_reduce_size_order_notification_message_read.last_price[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.last_price[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 4 -> assert(cancel_reduce_size_order_notification_message_read.last_size[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.last_size[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  assert(cancel_reduce_size_order_notification_message_read.pending_cancel_status == cancel_reduce_size_order_notification_message_written.pending_cancel_status);
  assert(cancel_reduce_size_order_notification_message_read.pending_reject_reason == cancel_reduce_size_order_notification_message_written.pending_reject_reason);
  cancel_reduce_size_order_notification_message_at = 0;
  do
  :: cancel_reduce_size_order_notification_message_at < 8 -> assert(cancel_reduce_size_order_notification_message_read.reserved_8[cancel_reduce_size_order_notification_message_at] == cancel_reduce_size_order_notification_message_written.reserved_8[cancel_reduce_size_order_notification_message_at]); cancel_reduce_size_order_notification_message_at = cancel_reduce_size_order_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Price Update Notification Message: 58 bytes ----------------------- */

/* This is the message format that will be used to notify firms about order reprices */
typedef OrderPriceUpdateNotificationMessage {
  byte matching_engine_time[8];
  byte symbol_id[4];
  byte order_id[8];
  byte client_order_id[20];
  byte working_price[8];
  byte nbbo_indicator;
  byte reserved_9[9]
};

int order_price_update_notification_message_at;

/* every byte of Order Price Update Notification Message set to one value */
inline fill_order_price_update_notification_message(order_price_update_notification_message_record, order_price_update_notification_message_value) {
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.matching_engine_time[order_price_update_notification_message_at] = order_price_update_notification_message_value; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 4 -> order_price_update_notification_message_record.symbol_id[order_price_update_notification_message_at] = order_price_update_notification_message_value; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.order_id[order_price_update_notification_message_at] = order_price_update_notification_message_value; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 20 -> order_price_update_notification_message_record.client_order_id[order_price_update_notification_message_at] = order_price_update_notification_message_value; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.working_price[order_price_update_notification_message_at] = order_price_update_notification_message_value; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_record.nbbo_indicator = order_price_update_notification_message_value;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 9 -> order_price_update_notification_message_record.reserved_9[order_price_update_notification_message_at] = order_price_update_notification_message_value; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Price Update Notification Message set to where it lies, so a field read out of place says so */
inline ramp_order_price_update_notification_message(order_price_update_notification_message_record, order_price_update_notification_message_base) {
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.matching_engine_time[order_price_update_notification_message_at] = (order_price_update_notification_message_base + 0 + order_price_update_notification_message_at + 1) % 256; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 4 -> order_price_update_notification_message_record.symbol_id[order_price_update_notification_message_at] = (order_price_update_notification_message_base + 8 + order_price_update_notification_message_at + 1) % 256; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.order_id[order_price_update_notification_message_at] = (order_price_update_notification_message_base + 12 + order_price_update_notification_message_at + 1) % 256; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 20 -> order_price_update_notification_message_record.client_order_id[order_price_update_notification_message_at] = (order_price_update_notification_message_base + 20 + order_price_update_notification_message_at + 1) % 256; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.working_price[order_price_update_notification_message_at] = (order_price_update_notification_message_base + 40 + order_price_update_notification_message_at + 1) % 256; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_record.nbbo_indicator = (order_price_update_notification_message_base + 48 + 1) % 256;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 9 -> order_price_update_notification_message_record.reserved_9[order_price_update_notification_message_at] = (order_price_update_notification_message_base + 49 + order_price_update_notification_message_at + 1) % 256; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Price Update Notification Message to the wire, 58 bytes from where the cursor stands */
inline encode_order_price_update_notification_message(order_price_update_notification_message_record) {
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> wire[at] = order_price_update_notification_message_record.matching_engine_time[order_price_update_notification_message_at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 4 -> wire[at] = order_price_update_notification_message_record.symbol_id[order_price_update_notification_message_at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> wire[at] = order_price_update_notification_message_record.order_id[order_price_update_notification_message_at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 20 -> wire[at] = order_price_update_notification_message_record.client_order_id[order_price_update_notification_message_at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> wire[at] = order_price_update_notification_message_record.working_price[order_price_update_notification_message_at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = order_price_update_notification_message_record.nbbo_indicator; at = at + 1;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 9 -> wire[at] = order_price_update_notification_message_record.reserved_9[order_price_update_notification_message_at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Price Update Notification Message off the wire, 58 bytes from where the cursor stands */
inline decode_order_price_update_notification_message(order_price_update_notification_message_record) {
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.matching_engine_time[order_price_update_notification_message_at] = wire[at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 4 -> order_price_update_notification_message_record.symbol_id[order_price_update_notification_message_at] = wire[at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.order_id[order_price_update_notification_message_at] = wire[at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 20 -> order_price_update_notification_message_record.client_order_id[order_price_update_notification_message_at] = wire[at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> order_price_update_notification_message_record.working_price[order_price_update_notification_message_at] = wire[at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_record.nbbo_indicator = wire[at]; at = at + 1;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 9 -> order_price_update_notification_message_record.reserved_9[order_price_update_notification_message_at] = wire[at]; at = at + 1; order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Price Update Notification Message is what was written, byte for byte */
inline equal_order_price_update_notification_message(order_price_update_notification_message_read, order_price_update_notification_message_written) {
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> assert(order_price_update_notification_message_read.matching_engine_time[order_price_update_notification_message_at] == order_price_update_notification_message_written.matching_engine_time[order_price_update_notification_message_at]); order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 4 -> assert(order_price_update_notification_message_read.symbol_id[order_price_update_notification_message_at] == order_price_update_notification_message_written.symbol_id[order_price_update_notification_message_at]); order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> assert(order_price_update_notification_message_read.order_id[order_price_update_notification_message_at] == order_price_update_notification_message_written.order_id[order_price_update_notification_message_at]); order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 20 -> assert(order_price_update_notification_message_read.client_order_id[order_price_update_notification_message_at] == order_price_update_notification_message_written.client_order_id[order_price_update_notification_message_at]); order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 8 -> assert(order_price_update_notification_message_read.working_price[order_price_update_notification_message_at] == order_price_update_notification_message_written.working_price[order_price_update_notification_message_at]); order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  assert(order_price_update_notification_message_read.nbbo_indicator == order_price_update_notification_message_written.nbbo_indicator);
  order_price_update_notification_message_at = 0;
  do
  :: order_price_update_notification_message_at < 9 -> assert(order_price_update_notification_message_read.reserved_9[order_price_update_notification_message_at] == order_price_update_notification_message_written.reserved_9[order_price_update_notification_message_at]); order_price_update_notification_message_at = order_price_update_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reserve Order Replenishment Notification Message: 42 bytes -------------- */

/* This is the message format that will be used to notify firms of their Reserve order replenishment events */
typedef ReserveOrderReplenishmentNotificationMessage {
  byte matching_engine_time[8];
  byte symbol_id[4];
  byte order_id[8];
  byte secondary_order_id[8];
  byte display_qty[4];
  byte reserved_10[10]
};

int reserve_order_replenishment_notification_message_at;

/* every byte of Reserve Order Replenishment Notification Message set to one value */
inline fill_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_record, reserve_order_replenishment_notification_message_value) {
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.matching_engine_time[reserve_order_replenishment_notification_message_at] = reserve_order_replenishment_notification_message_value; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> reserve_order_replenishment_notification_message_record.symbol_id[reserve_order_replenishment_notification_message_at] = reserve_order_replenishment_notification_message_value; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.order_id[reserve_order_replenishment_notification_message_at] = reserve_order_replenishment_notification_message_value; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.secondary_order_id[reserve_order_replenishment_notification_message_at] = reserve_order_replenishment_notification_message_value; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> reserve_order_replenishment_notification_message_record.display_qty[reserve_order_replenishment_notification_message_at] = reserve_order_replenishment_notification_message_value; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 10 -> reserve_order_replenishment_notification_message_record.reserved_10[reserve_order_replenishment_notification_message_at] = reserve_order_replenishment_notification_message_value; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reserve Order Replenishment Notification Message set to where it lies, so a field read out of place says so */
inline ramp_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_record, reserve_order_replenishment_notification_message_base) {
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.matching_engine_time[reserve_order_replenishment_notification_message_at] = (reserve_order_replenishment_notification_message_base + 0 + reserve_order_replenishment_notification_message_at + 1) % 256; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> reserve_order_replenishment_notification_message_record.symbol_id[reserve_order_replenishment_notification_message_at] = (reserve_order_replenishment_notification_message_base + 8 + reserve_order_replenishment_notification_message_at + 1) % 256; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.order_id[reserve_order_replenishment_notification_message_at] = (reserve_order_replenishment_notification_message_base + 12 + reserve_order_replenishment_notification_message_at + 1) % 256; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.secondary_order_id[reserve_order_replenishment_notification_message_at] = (reserve_order_replenishment_notification_message_base + 20 + reserve_order_replenishment_notification_message_at + 1) % 256; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> reserve_order_replenishment_notification_message_record.display_qty[reserve_order_replenishment_notification_message_at] = (reserve_order_replenishment_notification_message_base + 28 + reserve_order_replenishment_notification_message_at + 1) % 256; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 10 -> reserve_order_replenishment_notification_message_record.reserved_10[reserve_order_replenishment_notification_message_at] = (reserve_order_replenishment_notification_message_base + 32 + reserve_order_replenishment_notification_message_at + 1) % 256; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reserve Order Replenishment Notification Message to the wire, 42 bytes from where the cursor stands */
inline encode_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_record) {
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> wire[at] = reserve_order_replenishment_notification_message_record.matching_engine_time[reserve_order_replenishment_notification_message_at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> wire[at] = reserve_order_replenishment_notification_message_record.symbol_id[reserve_order_replenishment_notification_message_at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> wire[at] = reserve_order_replenishment_notification_message_record.order_id[reserve_order_replenishment_notification_message_at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> wire[at] = reserve_order_replenishment_notification_message_record.secondary_order_id[reserve_order_replenishment_notification_message_at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> wire[at] = reserve_order_replenishment_notification_message_record.display_qty[reserve_order_replenishment_notification_message_at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 10 -> wire[at] = reserve_order_replenishment_notification_message_record.reserved_10[reserve_order_replenishment_notification_message_at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reserve Order Replenishment Notification Message off the wire, 42 bytes from where the cursor stands */
inline decode_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_record) {
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.matching_engine_time[reserve_order_replenishment_notification_message_at] = wire[at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> reserve_order_replenishment_notification_message_record.symbol_id[reserve_order_replenishment_notification_message_at] = wire[at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.order_id[reserve_order_replenishment_notification_message_at] = wire[at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> reserve_order_replenishment_notification_message_record.secondary_order_id[reserve_order_replenishment_notification_message_at] = wire[at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> reserve_order_replenishment_notification_message_record.display_qty[reserve_order_replenishment_notification_message_at] = wire[at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 10 -> reserve_order_replenishment_notification_message_record.reserved_10[reserve_order_replenishment_notification_message_at] = wire[at]; at = at + 1; reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reserve Order Replenishment Notification Message is what was written, byte for byte */
inline equal_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_read, reserve_order_replenishment_notification_message_written) {
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> assert(reserve_order_replenishment_notification_message_read.matching_engine_time[reserve_order_replenishment_notification_message_at] == reserve_order_replenishment_notification_message_written.matching_engine_time[reserve_order_replenishment_notification_message_at]); reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> assert(reserve_order_replenishment_notification_message_read.symbol_id[reserve_order_replenishment_notification_message_at] == reserve_order_replenishment_notification_message_written.symbol_id[reserve_order_replenishment_notification_message_at]); reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> assert(reserve_order_replenishment_notification_message_read.order_id[reserve_order_replenishment_notification_message_at] == reserve_order_replenishment_notification_message_written.order_id[reserve_order_replenishment_notification_message_at]); reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 8 -> assert(reserve_order_replenishment_notification_message_read.secondary_order_id[reserve_order_replenishment_notification_message_at] == reserve_order_replenishment_notification_message_written.secondary_order_id[reserve_order_replenishment_notification_message_at]); reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 4 -> assert(reserve_order_replenishment_notification_message_read.display_qty[reserve_order_replenishment_notification_message_at] == reserve_order_replenishment_notification_message_written.display_qty[reserve_order_replenishment_notification_message_at]); reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  reserve_order_replenishment_notification_message_at = 0;
  do
  :: reserve_order_replenishment_notification_message_at < 10 -> assert(reserve_order_replenishment_notification_message_read.reserved_10[reserve_order_replenishment_notification_message_at] == reserve_order_replenishment_notification_message_written.reserved_10[reserve_order_replenishment_notification_message_at]); reserve_order_replenishment_notification_message_at = reserve_order_replenishment_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Request Message: 66 bytes ---------------------------------- */

/* Firms can use this format to send a cancel request for a resting order */
typedef CancelOrderRequestMessage {
  byte reserved_8[8];
  byte mpid[4];
  byte client_order_id[20];
  byte original_client_order_id[20];
  byte symbol_id[4];
  byte reserved_10[10]
};

int cancel_order_request_message_at;

/* every byte of Cancel Order Request Message set to one value */
inline fill_cancel_order_request_message(cancel_order_request_message_record, cancel_order_request_message_value) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.reserved_8[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.mpid[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.symbol_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> cancel_order_request_message_record.reserved_10[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_request_message(cancel_order_request_message_record, cancel_order_request_message_base) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.reserved_8[cancel_order_request_message_at] = (cancel_order_request_message_base + 0 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.mpid[cancel_order_request_message_at] = (cancel_order_request_message_base + 8 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 12 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 32 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.symbol_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 52 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> cancel_order_request_message_record.reserved_10[cancel_order_request_message_at] = (cancel_order_request_message_base + 56 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Request Message to the wire, 66 bytes from where the cursor stands */
inline encode_cancel_order_request_message(cancel_order_request_message_record) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> wire[at] = cancel_order_request_message_record.reserved_8[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> wire[at] = cancel_order_request_message_record.mpid[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> wire[at] = cancel_order_request_message_record.client_order_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> wire[at] = cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> wire[at] = cancel_order_request_message_record.symbol_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> wire[at] = cancel_order_request_message_record.reserved_10[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Request Message off the wire, 66 bytes from where the cursor stands */
inline decode_cancel_order_request_message(cancel_order_request_message_record) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.reserved_8[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.mpid[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> cancel_order_request_message_record.original_client_order_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> cancel_order_request_message_record.symbol_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> cancel_order_request_message_record.reserved_10[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Request Message is what was written, byte for byte */
inline equal_cancel_order_request_message(cancel_order_request_message_read, cancel_order_request_message_written) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> assert(cancel_order_request_message_read.reserved_8[cancel_order_request_message_at] == cancel_order_request_message_written.reserved_8[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> assert(cancel_order_request_message_read.mpid[cancel_order_request_message_at] == cancel_order_request_message_written.mpid[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> assert(cancel_order_request_message_read.client_order_id[cancel_order_request_message_at] == cancel_order_request_message_written.client_order_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 20 -> assert(cancel_order_request_message_read.original_client_order_id[cancel_order_request_message_at] == cancel_order_request_message_written.original_client_order_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 4 -> assert(cancel_order_request_message_read.symbol_id[cancel_order_request_message_at] == cancel_order_request_message_written.symbol_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 10 -> assert(cancel_order_request_message_read.reserved_10[cancel_order_request_message_at] == cancel_order_request_message_written.reserved_10[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order By Exchange Order Id Request Message: 54 bytes ------------- */

/* Firms can use this format to send a cancel request for a resting order using Exchange assigned Order ID */
typedef CancelOrderByExchangeOrderIdRequestMessage {
  byte reserved_8[8];
  byte mpid[4];
  byte client_order_id[20];
  byte order_id[8];
  byte symbol_id[4];
  byte reserved_10[10]
};

int cancel_order_by_exchange_order_id_request_message_at;

/* every byte of Cancel Order By Exchange Order Id Request Message set to one value */
inline fill_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_record, cancel_order_by_exchange_order_id_request_message_value) {
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> cancel_order_by_exchange_order_id_request_message_record.reserved_8[cancel_order_by_exchange_order_id_request_message_at] = cancel_order_by_exchange_order_id_request_message_value; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> cancel_order_by_exchange_order_id_request_message_record.mpid[cancel_order_by_exchange_order_id_request_message_at] = cancel_order_by_exchange_order_id_request_message_value; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 20 -> cancel_order_by_exchange_order_id_request_message_record.client_order_id[cancel_order_by_exchange_order_id_request_message_at] = cancel_order_by_exchange_order_id_request_message_value; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> cancel_order_by_exchange_order_id_request_message_record.order_id[cancel_order_by_exchange_order_id_request_message_at] = cancel_order_by_exchange_order_id_request_message_value; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> cancel_order_by_exchange_order_id_request_message_record.symbol_id[cancel_order_by_exchange_order_id_request_message_at] = cancel_order_by_exchange_order_id_request_message_value; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 10 -> cancel_order_by_exchange_order_id_request_message_record.reserved_10[cancel_order_by_exchange_order_id_request_message_at] = cancel_order_by_exchange_order_id_request_message_value; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order By Exchange Order Id Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_record, cancel_order_by_exchange_order_id_request_message_base) {
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> cancel_order_by_exchange_order_id_request_message_record.reserved_8[cancel_order_by_exchange_order_id_request_message_at] = (cancel_order_by_exchange_order_id_request_message_base + 0 + cancel_order_by_exchange_order_id_request_message_at + 1) % 256; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> cancel_order_by_exchange_order_id_request_message_record.mpid[cancel_order_by_exchange_order_id_request_message_at] = (cancel_order_by_exchange_order_id_request_message_base + 8 + cancel_order_by_exchange_order_id_request_message_at + 1) % 256; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 20 -> cancel_order_by_exchange_order_id_request_message_record.client_order_id[cancel_order_by_exchange_order_id_request_message_at] = (cancel_order_by_exchange_order_id_request_message_base + 12 + cancel_order_by_exchange_order_id_request_message_at + 1) % 256; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> cancel_order_by_exchange_order_id_request_message_record.order_id[cancel_order_by_exchange_order_id_request_message_at] = (cancel_order_by_exchange_order_id_request_message_base + 32 + cancel_order_by_exchange_order_id_request_message_at + 1) % 256; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> cancel_order_by_exchange_order_id_request_message_record.symbol_id[cancel_order_by_exchange_order_id_request_message_at] = (cancel_order_by_exchange_order_id_request_message_base + 40 + cancel_order_by_exchange_order_id_request_message_at + 1) % 256; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 10 -> cancel_order_by_exchange_order_id_request_message_record.reserved_10[cancel_order_by_exchange_order_id_request_message_at] = (cancel_order_by_exchange_order_id_request_message_base + 44 + cancel_order_by_exchange_order_id_request_message_at + 1) % 256; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order By Exchange Order Id Request Message to the wire, 54 bytes from where the cursor stands */
inline encode_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_record) {
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> wire[at] = cancel_order_by_exchange_order_id_request_message_record.reserved_8[cancel_order_by_exchange_order_id_request_message_at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> wire[at] = cancel_order_by_exchange_order_id_request_message_record.mpid[cancel_order_by_exchange_order_id_request_message_at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 20 -> wire[at] = cancel_order_by_exchange_order_id_request_message_record.client_order_id[cancel_order_by_exchange_order_id_request_message_at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> wire[at] = cancel_order_by_exchange_order_id_request_message_record.order_id[cancel_order_by_exchange_order_id_request_message_at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> wire[at] = cancel_order_by_exchange_order_id_request_message_record.symbol_id[cancel_order_by_exchange_order_id_request_message_at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 10 -> wire[at] = cancel_order_by_exchange_order_id_request_message_record.reserved_10[cancel_order_by_exchange_order_id_request_message_at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order By Exchange Order Id Request Message off the wire, 54 bytes from where the cursor stands */
inline decode_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_record) {
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> cancel_order_by_exchange_order_id_request_message_record.reserved_8[cancel_order_by_exchange_order_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> cancel_order_by_exchange_order_id_request_message_record.mpid[cancel_order_by_exchange_order_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 20 -> cancel_order_by_exchange_order_id_request_message_record.client_order_id[cancel_order_by_exchange_order_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> cancel_order_by_exchange_order_id_request_message_record.order_id[cancel_order_by_exchange_order_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> cancel_order_by_exchange_order_id_request_message_record.symbol_id[cancel_order_by_exchange_order_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 10 -> cancel_order_by_exchange_order_id_request_message_record.reserved_10[cancel_order_by_exchange_order_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order By Exchange Order Id Request Message is what was written, byte for byte */
inline equal_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_read, cancel_order_by_exchange_order_id_request_message_written) {
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> assert(cancel_order_by_exchange_order_id_request_message_read.reserved_8[cancel_order_by_exchange_order_id_request_message_at] == cancel_order_by_exchange_order_id_request_message_written.reserved_8[cancel_order_by_exchange_order_id_request_message_at]); cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> assert(cancel_order_by_exchange_order_id_request_message_read.mpid[cancel_order_by_exchange_order_id_request_message_at] == cancel_order_by_exchange_order_id_request_message_written.mpid[cancel_order_by_exchange_order_id_request_message_at]); cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 20 -> assert(cancel_order_by_exchange_order_id_request_message_read.client_order_id[cancel_order_by_exchange_order_id_request_message_at] == cancel_order_by_exchange_order_id_request_message_written.client_order_id[cancel_order_by_exchange_order_id_request_message_at]); cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 8 -> assert(cancel_order_by_exchange_order_id_request_message_read.order_id[cancel_order_by_exchange_order_id_request_message_at] == cancel_order_by_exchange_order_id_request_message_written.order_id[cancel_order_by_exchange_order_id_request_message_at]); cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 4 -> assert(cancel_order_by_exchange_order_id_request_message_read.symbol_id[cancel_order_by_exchange_order_id_request_message_at] == cancel_order_by_exchange_order_id_request_message_written.symbol_id[cancel_order_by_exchange_order_id_request_message_at]); cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_exchange_order_id_request_message_at = 0;
  do
  :: cancel_order_by_exchange_order_id_request_message_at < 10 -> assert(cancel_order_by_exchange_order_id_request_message_read.reserved_10[cancel_order_by_exchange_order_id_request_message_at] == cancel_order_by_exchange_order_id_request_message_written.reserved_10[cancel_order_by_exchange_order_id_request_message_at]); cancel_order_by_exchange_order_id_request_message_at = cancel_order_by_exchange_order_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Request Message: 44 bytes ----------------------------------- */

/* Firms can use this message format to request the cancellation of all orders for an MPID */
typedef MassCancelRequestMessage {
  byte reserved_8[8];
  byte mpid[4];
  byte client_order_id[20];
  byte scope;
  byte action;
  byte purge_group;
  byte reserved_9[9]
};

int mass_cancel_request_message_at;

/* every byte of Mass Cancel Request Message set to one value */
inline fill_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_value) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.reserved_8[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.mpid[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 20 -> mass_cancel_request_message_record.client_order_id[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.scope = mass_cancel_request_message_value;
  mass_cancel_request_message_record.action = mass_cancel_request_message_value;
  mass_cancel_request_message_record.purge_group = mass_cancel_request_message_value;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 9 -> mass_cancel_request_message_record.reserved_9[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_base) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.reserved_8[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 0 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.mpid[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 8 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 20 -> mass_cancel_request_message_record.client_order_id[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 12 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.scope = (mass_cancel_request_message_base + 32 + 1) % 256;
  mass_cancel_request_message_record.action = (mass_cancel_request_message_base + 33 + 1) % 256;
  mass_cancel_request_message_record.purge_group = (mass_cancel_request_message_base + 34 + 1) % 256;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 9 -> mass_cancel_request_message_record.reserved_9[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 35 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Request Message to the wire, 44 bytes from where the cursor stands */
inline encode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.reserved_8[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> wire[at] = mass_cancel_request_message_record.mpid[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 20 -> wire[at] = mass_cancel_request_message_record.client_order_id[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_request_message_record.scope; at = at + 1;
  wire[at] = mass_cancel_request_message_record.action; at = at + 1;
  wire[at] = mass_cancel_request_message_record.purge_group; at = at + 1;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 9 -> wire[at] = mass_cancel_request_message_record.reserved_9[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Request Message off the wire, 44 bytes from where the cursor stands */
inline decode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.reserved_8[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.mpid[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 20 -> mass_cancel_request_message_record.client_order_id[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.scope = wire[at]; at = at + 1;
  mass_cancel_request_message_record.action = wire[at]; at = at + 1;
  mass_cancel_request_message_record.purge_group = wire[at]; at = at + 1;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 9 -> mass_cancel_request_message_record.reserved_9[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Request Message is what was written, byte for byte */
inline equal_mass_cancel_request_message(mass_cancel_request_message_read, mass_cancel_request_message_written) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.reserved_8[mass_cancel_request_message_at] == mass_cancel_request_message_written.reserved_8[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> assert(mass_cancel_request_message_read.mpid[mass_cancel_request_message_at] == mass_cancel_request_message_written.mpid[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 20 -> assert(mass_cancel_request_message_read.client_order_id[mass_cancel_request_message_at] == mass_cancel_request_message_written.client_order_id[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_request_message_read.scope == mass_cancel_request_message_written.scope);
  assert(mass_cancel_request_message_read.action == mass_cancel_request_message_written.action);
  assert(mass_cancel_request_message_read.purge_group == mass_cancel_request_message_written.purge_group);
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 9 -> assert(mass_cancel_request_message_read.reserved_9[mass_cancel_request_message_at] == mass_cancel_request_message_written.reserved_9[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Aggressive Side Purge Response Message: 49 bytes ------------------------ */

/* This message format will be used to inform the Firm about the status of their previous ASP Mass Cancel Request */
typedef AggressiveSidePurgeResponseMessage {
  byte matching_engine_time[8];
  byte mpid[4];
  byte client_order_id[20];
  byte symbold_id[4];
  byte asp_status;
  byte number_of_orders_cancelled;
  byte asp_eligible_orders_cancelled;
  byte reserved_10[10]
};

int aggressive_side_purge_response_message_at;

/* every byte of Aggressive Side Purge Response Message set to one value */
inline fill_aggressive_side_purge_response_message(aggressive_side_purge_response_message_record, aggressive_side_purge_response_message_value) {
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 8 -> aggressive_side_purge_response_message_record.matching_engine_time[aggressive_side_purge_response_message_at] = aggressive_side_purge_response_message_value; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> aggressive_side_purge_response_message_record.mpid[aggressive_side_purge_response_message_at] = aggressive_side_purge_response_message_value; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 20 -> aggressive_side_purge_response_message_record.client_order_id[aggressive_side_purge_response_message_at] = aggressive_side_purge_response_message_value; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> aggressive_side_purge_response_message_record.symbold_id[aggressive_side_purge_response_message_at] = aggressive_side_purge_response_message_value; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_record.asp_status = aggressive_side_purge_response_message_value;
  aggressive_side_purge_response_message_record.number_of_orders_cancelled = aggressive_side_purge_response_message_value;
  aggressive_side_purge_response_message_record.asp_eligible_orders_cancelled = aggressive_side_purge_response_message_value;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 10 -> aggressive_side_purge_response_message_record.reserved_10[aggressive_side_purge_response_message_at] = aggressive_side_purge_response_message_value; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Aggressive Side Purge Response Message set to where it lies, so a field read out of place says so */
inline ramp_aggressive_side_purge_response_message(aggressive_side_purge_response_message_record, aggressive_side_purge_response_message_base) {
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 8 -> aggressive_side_purge_response_message_record.matching_engine_time[aggressive_side_purge_response_message_at] = (aggressive_side_purge_response_message_base + 0 + aggressive_side_purge_response_message_at + 1) % 256; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> aggressive_side_purge_response_message_record.mpid[aggressive_side_purge_response_message_at] = (aggressive_side_purge_response_message_base + 8 + aggressive_side_purge_response_message_at + 1) % 256; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 20 -> aggressive_side_purge_response_message_record.client_order_id[aggressive_side_purge_response_message_at] = (aggressive_side_purge_response_message_base + 12 + aggressive_side_purge_response_message_at + 1) % 256; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> aggressive_side_purge_response_message_record.symbold_id[aggressive_side_purge_response_message_at] = (aggressive_side_purge_response_message_base + 32 + aggressive_side_purge_response_message_at + 1) % 256; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_record.asp_status = (aggressive_side_purge_response_message_base + 36 + 1) % 256;
  aggressive_side_purge_response_message_record.number_of_orders_cancelled = (aggressive_side_purge_response_message_base + 37 + 1) % 256;
  aggressive_side_purge_response_message_record.asp_eligible_orders_cancelled = (aggressive_side_purge_response_message_base + 38 + 1) % 256;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 10 -> aggressive_side_purge_response_message_record.reserved_10[aggressive_side_purge_response_message_at] = (aggressive_side_purge_response_message_base + 39 + aggressive_side_purge_response_message_at + 1) % 256; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Aggressive Side Purge Response Message to the wire, 49 bytes from where the cursor stands */
inline encode_aggressive_side_purge_response_message(aggressive_side_purge_response_message_record) {
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 8 -> wire[at] = aggressive_side_purge_response_message_record.matching_engine_time[aggressive_side_purge_response_message_at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> wire[at] = aggressive_side_purge_response_message_record.mpid[aggressive_side_purge_response_message_at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 20 -> wire[at] = aggressive_side_purge_response_message_record.client_order_id[aggressive_side_purge_response_message_at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> wire[at] = aggressive_side_purge_response_message_record.symbold_id[aggressive_side_purge_response_message_at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  wire[at] = aggressive_side_purge_response_message_record.asp_status; at = at + 1;
  wire[at] = aggressive_side_purge_response_message_record.number_of_orders_cancelled; at = at + 1;
  wire[at] = aggressive_side_purge_response_message_record.asp_eligible_orders_cancelled; at = at + 1;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 10 -> wire[at] = aggressive_side_purge_response_message_record.reserved_10[aggressive_side_purge_response_message_at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Aggressive Side Purge Response Message off the wire, 49 bytes from where the cursor stands */
inline decode_aggressive_side_purge_response_message(aggressive_side_purge_response_message_record) {
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 8 -> aggressive_side_purge_response_message_record.matching_engine_time[aggressive_side_purge_response_message_at] = wire[at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> aggressive_side_purge_response_message_record.mpid[aggressive_side_purge_response_message_at] = wire[at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 20 -> aggressive_side_purge_response_message_record.client_order_id[aggressive_side_purge_response_message_at] = wire[at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> aggressive_side_purge_response_message_record.symbold_id[aggressive_side_purge_response_message_at] = wire[at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_record.asp_status = wire[at]; at = at + 1;
  aggressive_side_purge_response_message_record.number_of_orders_cancelled = wire[at]; at = at + 1;
  aggressive_side_purge_response_message_record.asp_eligible_orders_cancelled = wire[at]; at = at + 1;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 10 -> aggressive_side_purge_response_message_record.reserved_10[aggressive_side_purge_response_message_at] = wire[at]; at = at + 1; aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Aggressive Side Purge Response Message is what was written, byte for byte */
inline equal_aggressive_side_purge_response_message(aggressive_side_purge_response_message_read, aggressive_side_purge_response_message_written) {
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 8 -> assert(aggressive_side_purge_response_message_read.matching_engine_time[aggressive_side_purge_response_message_at] == aggressive_side_purge_response_message_written.matching_engine_time[aggressive_side_purge_response_message_at]); aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> assert(aggressive_side_purge_response_message_read.mpid[aggressive_side_purge_response_message_at] == aggressive_side_purge_response_message_written.mpid[aggressive_side_purge_response_message_at]); aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 20 -> assert(aggressive_side_purge_response_message_read.client_order_id[aggressive_side_purge_response_message_at] == aggressive_side_purge_response_message_written.client_order_id[aggressive_side_purge_response_message_at]); aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 4 -> assert(aggressive_side_purge_response_message_read.symbold_id[aggressive_side_purge_response_message_at] == aggressive_side_purge_response_message_written.symbold_id[aggressive_side_purge_response_message_at]); aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  assert(aggressive_side_purge_response_message_read.asp_status == aggressive_side_purge_response_message_written.asp_status);
  assert(aggressive_side_purge_response_message_read.number_of_orders_cancelled == aggressive_side_purge_response_message_written.number_of_orders_cancelled);
  assert(aggressive_side_purge_response_message_read.asp_eligible_orders_cancelled == aggressive_side_purge_response_message_written.asp_eligible_orders_cancelled);
  aggressive_side_purge_response_message_at = 0;
  do
  :: aggressive_side_purge_response_message_at < 10 -> assert(aggressive_side_purge_response_message_read.reserved_10[aggressive_side_purge_response_message_at] == aggressive_side_purge_response_message_written.reserved_10[aggressive_side_purge_response_message_at]); aggressive_side_purge_response_message_at = aggressive_side_purge_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Synchronization Complete: 1 bytes --------------------------------------- */

/* The ESesM server sends a Synchronization complete packet when it is done replaying all the old packets and is ready to start sending new packets from the Matching Engine */
typedef SynchronizationComplete {
  byte matching_engine_id
};

/* every byte of Synchronization Complete set to one value */
inline fill_synchronization_complete(synchronization_complete_record, synchronization_complete_value) {
  synchronization_complete_record.matching_engine_id = synchronization_complete_value;
  skip
}

/* each byte of Synchronization Complete set to where it lies, so a field read out of place says so */
inline ramp_synchronization_complete(synchronization_complete_record, synchronization_complete_base) {
  synchronization_complete_record.matching_engine_id = (synchronization_complete_base + 0 + 1) % 256;
  skip
}

/* Synchronization Complete to the wire, 1 bytes from where the cursor stands */
inline encode_synchronization_complete(synchronization_complete_record) {
  wire[at] = synchronization_complete_record.matching_engine_id; at = at + 1;
  skip
}

/* Synchronization Complete off the wire, 1 bytes from where the cursor stands */
inline decode_synchronization_complete(synchronization_complete_record) {
  synchronization_complete_record.matching_engine_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Synchronization Complete is what was written, byte for byte */
inline equal_synchronization_complete(synchronization_complete_read, synchronization_complete_written) {
  assert(synchronization_complete_read.matching_engine_id == synchronization_complete_written.matching_engine_id);
  skip
}

/* ---- Retransmission Request: 16 bytes ---------------------------------------- */

/* The ESesM client uses this packet to request a retransmission server to retransmit a range of packets */
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

/* ---- Trading Session Update: 2 bytes ----------------------------------------- */

/* The ESesM server sends a Trading Session Update packet to inform the client that a new trading session is starting on the specified Matching Engine */
typedef TradingSessionUpdate {
  byte matching_engine_id;
  byte trading_session_id
};

/* every byte of Trading Session Update set to one value */
inline fill_trading_session_update(trading_session_update_record, trading_session_update_value) {
  trading_session_update_record.matching_engine_id = trading_session_update_value;
  trading_session_update_record.trading_session_id = trading_session_update_value;
  skip
}

/* each byte of Trading Session Update set to where it lies, so a field read out of place says so */
inline ramp_trading_session_update(trading_session_update_record, trading_session_update_base) {
  trading_session_update_record.matching_engine_id = (trading_session_update_base + 0 + 1) % 256;
  trading_session_update_record.trading_session_id = (trading_session_update_base + 1 + 1) % 256;
  skip
}

/* Trading Session Update to the wire, 2 bytes from where the cursor stands */
inline encode_trading_session_update(trading_session_update_record) {
  wire[at] = trading_session_update_record.matching_engine_id; at = at + 1;
  wire[at] = trading_session_update_record.trading_session_id; at = at + 1;
  skip
}

/* Trading Session Update off the wire, 2 bytes from where the cursor stands */
inline decode_trading_session_update(trading_session_update_record) {
  trading_session_update_record.matching_engine_id = wire[at]; at = at + 1;
  trading_session_update_record.trading_session_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Session Update is what was written, byte for byte */
inline equal_trading_session_update(trading_session_update_read, trading_session_update_written) {
  assert(trading_session_update_read.matching_engine_id == trading_session_update_written.matching_engine_id);
  assert(trading_session_update_read.trading_session_id == trading_session_update_written.trading_session_id);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Esesm Packet Header: encoded, read back, and compared */
proctype check_esesm_packet_header() {
  EsesmPacketHeader esesm_packet_header_sent;
  EsesmPacketHeader esesm_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_esesm_packet_header(esesm_packet_header_sent, 0)
  :: pattern == 1 -> fill_esesm_packet_header(esesm_packet_header_sent, 32)
  :: pattern == 2 -> fill_esesm_packet_header(esesm_packet_header_sent, 255)
  :: else -> ramp_esesm_packet_header(esesm_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_esesm_packet_header(esesm_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_esesm_packet_header(esesm_packet_header_got);
    assert(at == 3);
    equal_esesm_packet_header(esesm_packet_header_got, esesm_packet_header_sent)
  }
}

/* Symbol Update Message: encoded, read back, and compared */
proctype check_symbol_update_message() {
  SymbolUpdateMessage symbol_update_message_sent;
  SymbolUpdateMessage symbol_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_update_message(symbol_update_message_sent, 0)
  :: pattern == 1 -> fill_symbol_update_message(symbol_update_message_sent, 32)
  :: pattern == 2 -> fill_symbol_update_message(symbol_update_message_sent, 255)
  :: else -> ramp_symbol_update_message(symbol_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_update_message(symbol_update_message_sent);
    assert(at == 59);
    at = 0;
    decode_symbol_update_message(symbol_update_message_got);
    assert(at == 59);
    equal_symbol_update_message(symbol_update_message_got, symbol_update_message_sent)
  }
}

/* New Order Response Message: encoded, read back, and compared */
proctype check_new_order_response_message() {
  NewOrderResponseMessage new_order_response_message_sent;
  NewOrderResponseMessage new_order_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_response_message(new_order_response_message_sent, 0)
  :: pattern == 1 -> fill_new_order_response_message(new_order_response_message_sent, 32)
  :: pattern == 2 -> fill_new_order_response_message(new_order_response_message_sent, 255)
  :: else -> ramp_new_order_response_message(new_order_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_response_message(new_order_response_message_sent);
    assert(at == 76);
    at = 0;
    decode_new_order_response_message(new_order_response_message_got);
    assert(at == 76);
    equal_new_order_response_message(new_order_response_message_got, new_order_response_message_sent)
  }
}

/* Modify Order Response Message: encoded, read back, and compared */
proctype check_modify_order_response_message() {
  ModifyOrderResponseMessage modify_order_response_message_sent;
  ModifyOrderResponseMessage modify_order_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_response_message(modify_order_response_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_response_message(modify_order_response_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_response_message(modify_order_response_message_sent, 255)
  :: else -> ramp_modify_order_response_message(modify_order_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_response_message(modify_order_response_message_sent);
    assert(at == 87);
    at = 0;
    decode_modify_order_response_message(modify_order_response_message_got);
    assert(at == 87);
    equal_modify_order_response_message(modify_order_response_message_got, modify_order_response_message_sent)
  }
}

/* Cancel Order Response Message: encoded, read back, and compared */
proctype check_cancel_order_response_message() {
  CancelOrderResponseMessage cancel_order_response_message_sent;
  CancelOrderResponseMessage cancel_order_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_response_message(cancel_order_response_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_response_message(cancel_order_response_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_response_message(cancel_order_response_message_sent, 255)
  :: else -> ramp_cancel_order_response_message(cancel_order_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_response_message(cancel_order_response_message_sent);
    assert(at == 79);
    at = 0;
    decode_cancel_order_response_message(cancel_order_response_message_got);
    assert(at == 79);
    equal_cancel_order_response_message(cancel_order_response_message_got, cancel_order_response_message_sent)
  }
}

/* Cancel Order By Exchange Order Id Response Message: encoded, read back, and compared */
proctype check_cancel_order_by_exchange_order_id_response_message() {
  CancelOrderByExchangeOrderIdResponseMessage cancel_order_by_exchange_order_id_response_message_sent;
  CancelOrderByExchangeOrderIdResponseMessage cancel_order_by_exchange_order_id_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_sent, 255)
  :: else -> ramp_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_sent);
    assert(at == 59);
    at = 0;
    decode_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_got);
    assert(at == 59);
    equal_cancel_order_by_exchange_order_id_response_message(cancel_order_by_exchange_order_id_response_message_got, cancel_order_by_exchange_order_id_response_message_sent)
  }
}

/* System State Notification Message: encoded, read back, and compared */
proctype check_system_state_notification_message() {
  SystemStateNotificationMessage system_state_notification_message_sent;
  SystemStateNotificationMessage system_state_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_state_notification_message(system_state_notification_message_sent, 0)
  :: pattern == 1 -> fill_system_state_notification_message(system_state_notification_message_sent, 32)
  :: pattern == 2 -> fill_system_state_notification_message(system_state_notification_message_sent, 255)
  :: else -> ramp_system_state_notification_message(system_state_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_state_notification_message(system_state_notification_message_sent);
    assert(at == 26);
    at = 0;
    decode_system_state_notification_message(system_state_notification_message_got);
    assert(at == 26);
    equal_system_state_notification_message(system_state_notification_message_got, system_state_notification_message_sent)
  }
}

/* Cancel Reduce Size Order Notification Message: encoded, read back, and compared */
proctype check_cancel_reduce_size_order_notification_message() {
  CancelReduceSizeOrderNotificationMessage cancel_reduce_size_order_notification_message_sent;
  CancelReduceSizeOrderNotificationMessage cancel_reduce_size_order_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_sent, 0)
  :: pattern == 1 -> fill_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_sent, 32)
  :: pattern == 2 -> fill_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_sent, 255)
  :: else -> ramp_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_sent);
    assert(at == 71);
    at = 0;
    decode_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_got);
    assert(at == 71);
    equal_cancel_reduce_size_order_notification_message(cancel_reduce_size_order_notification_message_got, cancel_reduce_size_order_notification_message_sent)
  }
}

/* Order Price Update Notification Message: encoded, read back, and compared */
proctype check_order_price_update_notification_message() {
  OrderPriceUpdateNotificationMessage order_price_update_notification_message_sent;
  OrderPriceUpdateNotificationMessage order_price_update_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_price_update_notification_message(order_price_update_notification_message_sent, 0)
  :: pattern == 1 -> fill_order_price_update_notification_message(order_price_update_notification_message_sent, 32)
  :: pattern == 2 -> fill_order_price_update_notification_message(order_price_update_notification_message_sent, 255)
  :: else -> ramp_order_price_update_notification_message(order_price_update_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_price_update_notification_message(order_price_update_notification_message_sent);
    assert(at == 58);
    at = 0;
    decode_order_price_update_notification_message(order_price_update_notification_message_got);
    assert(at == 58);
    equal_order_price_update_notification_message(order_price_update_notification_message_got, order_price_update_notification_message_sent)
  }
}

/* Reserve Order Replenishment Notification Message: encoded, read back, and compared */
proctype check_reserve_order_replenishment_notification_message() {
  ReserveOrderReplenishmentNotificationMessage reserve_order_replenishment_notification_message_sent;
  ReserveOrderReplenishmentNotificationMessage reserve_order_replenishment_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_sent, 0)
  :: pattern == 1 -> fill_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_sent, 32)
  :: pattern == 2 -> fill_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_sent, 255)
  :: else -> ramp_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_sent);
    assert(at == 42);
    at = 0;
    decode_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_got);
    assert(at == 42);
    equal_reserve_order_replenishment_notification_message(reserve_order_replenishment_notification_message_got, reserve_order_replenishment_notification_message_sent)
  }
}

/* Cancel Order Request Message: encoded, read back, and compared */
proctype check_cancel_order_request_message() {
  CancelOrderRequestMessage cancel_order_request_message_sent;
  CancelOrderRequestMessage cancel_order_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 255)
  :: else -> ramp_cancel_order_request_message(cancel_order_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_request_message(cancel_order_request_message_sent);
    assert(at == 66);
    at = 0;
    decode_cancel_order_request_message(cancel_order_request_message_got);
    assert(at == 66);
    equal_cancel_order_request_message(cancel_order_request_message_got, cancel_order_request_message_sent)
  }
}

/* Cancel Order By Exchange Order Id Request Message: encoded, read back, and compared */
proctype check_cancel_order_by_exchange_order_id_request_message() {
  CancelOrderByExchangeOrderIdRequestMessage cancel_order_by_exchange_order_id_request_message_sent;
  CancelOrderByExchangeOrderIdRequestMessage cancel_order_by_exchange_order_id_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_sent, 255)
  :: else -> ramp_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_sent);
    assert(at == 54);
    at = 0;
    decode_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_got);
    assert(at == 54);
    equal_cancel_order_by_exchange_order_id_request_message(cancel_order_by_exchange_order_id_request_message_got, cancel_order_by_exchange_order_id_request_message_sent)
  }
}

/* Mass Cancel Request Message: encoded, read back, and compared */
proctype check_mass_cancel_request_message() {
  MassCancelRequestMessage mass_cancel_request_message_sent;
  MassCancelRequestMessage mass_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 255)
  :: else -> ramp_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_request_message(mass_cancel_request_message_sent);
    assert(at == 44);
    at = 0;
    decode_mass_cancel_request_message(mass_cancel_request_message_got);
    assert(at == 44);
    equal_mass_cancel_request_message(mass_cancel_request_message_got, mass_cancel_request_message_sent)
  }
}

/* Aggressive Side Purge Response Message: encoded, read back, and compared */
proctype check_aggressive_side_purge_response_message() {
  AggressiveSidePurgeResponseMessage aggressive_side_purge_response_message_sent;
  AggressiveSidePurgeResponseMessage aggressive_side_purge_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_aggressive_side_purge_response_message(aggressive_side_purge_response_message_sent, 0)
  :: pattern == 1 -> fill_aggressive_side_purge_response_message(aggressive_side_purge_response_message_sent, 32)
  :: pattern == 2 -> fill_aggressive_side_purge_response_message(aggressive_side_purge_response_message_sent, 255)
  :: else -> ramp_aggressive_side_purge_response_message(aggressive_side_purge_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_aggressive_side_purge_response_message(aggressive_side_purge_response_message_sent);
    assert(at == 49);
    at = 0;
    decode_aggressive_side_purge_response_message(aggressive_side_purge_response_message_got);
    assert(at == 49);
    equal_aggressive_side_purge_response_message(aggressive_side_purge_response_message_got, aggressive_side_purge_response_message_sent)
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

/* Trading Session Update: encoded, read back, and compared */
proctype check_trading_session_update() {
  TradingSessionUpdate trading_session_update_sent;
  TradingSessionUpdate trading_session_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_update(trading_session_update_sent, 0)
  :: pattern == 1 -> fill_trading_session_update(trading_session_update_sent, 32)
  :: pattern == 2 -> fill_trading_session_update(trading_session_update_sent, 255)
  :: else -> ramp_trading_session_update(trading_session_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_update(trading_session_update_sent);
    assert(at == 2);
    at = 0;
    decode_trading_session_update(trading_session_update_got);
    assert(at == 2);
    equal_trading_session_update(trading_session_update_got, trading_session_update_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_esesm_packet_header()
  :: run check_symbol_update_message()
  :: run check_new_order_response_message()
  :: run check_modify_order_response_message()
  :: run check_cancel_order_response_message()
  :: run check_cancel_order_by_exchange_order_id_response_message()
  :: run check_system_state_notification_message()
  :: run check_cancel_reduce_size_order_notification_message()
  :: run check_order_price_update_notification_message()
  :: run check_reserve_order_replenishment_notification_message()
  :: run check_cancel_order_request_message()
  :: run check_cancel_order_by_exchange_order_id_request_message()
  :: run check_mass_cancel_request_message()
  :: run check_aggressive_side_purge_response_message()
  :: run check_synchronization_complete()
  :: run check_retransmission_request()
  :: run check_trading_session_update()
  fi
}
