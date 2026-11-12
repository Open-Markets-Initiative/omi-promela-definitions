/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 40
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 124

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- INTRA Multicast Header: 17 bytes ---------------------------------------- */

/* BMV INTRA Multicast Header */
typedef INTRAMulticastHeader {
  byte length[2];
  byte total_messages;
  byte market_data_group;
  byte session;
  byte sequence_number[4];
  byte datetime[8]
};

int i_n_t_r_a_multicast_header_at;

/* every byte of INTRA Multicast Header set to one value */
inline fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_value) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.market_data_group = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_record.session = i_n_t_r_a_multicast_header_value;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = i_n_t_r_a_multicast_header_value; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of INTRA Multicast Header set to where it lies, so a field read out of place says so */
inline ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record, i_n_t_r_a_multicast_header_base) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 0 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = (i_n_t_r_a_multicast_header_base + 2 + 1) % 256;
  i_n_t_r_a_multicast_header_record.market_data_group = (i_n_t_r_a_multicast_header_base + 3 + 1) % 256;
  i_n_t_r_a_multicast_header_record.session = (i_n_t_r_a_multicast_header_base + 4 + 1) % 256;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 5 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = (i_n_t_r_a_multicast_header_base + 9 + i_n_t_r_a_multicast_header_at + 1) % 256; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header to the wire, 17 bytes from where the cursor stands */
inline encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> wire[at] = i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  wire[at] = i_n_t_r_a_multicast_header_record.total_messages; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.market_data_group; at = at + 1;
  wire[at] = i_n_t_r_a_multicast_header_record.session; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> wire[at] = i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> wire[at] = i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* INTRA Multicast Header off the wire, 17 bytes from where the cursor stands */
inline decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_record) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> i_n_t_r_a_multicast_header_record.length[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_record.total_messages = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.market_data_group = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_record.session = wire[at]; at = at + 1;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> i_n_t_r_a_multicast_header_record.sequence_number[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> i_n_t_r_a_multicast_header_record.datetime[i_n_t_r_a_multicast_header_at] = wire[at]; at = at + 1; i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of INTRA Multicast Header is what was written, byte for byte */
inline equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_read, i_n_t_r_a_multicast_header_written) {
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 2 -> assert(i_n_t_r_a_multicast_header_read.length[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.length[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  assert(i_n_t_r_a_multicast_header_read.total_messages == i_n_t_r_a_multicast_header_written.total_messages);
  assert(i_n_t_r_a_multicast_header_read.market_data_group == i_n_t_r_a_multicast_header_written.market_data_group);
  assert(i_n_t_r_a_multicast_header_read.session == i_n_t_r_a_multicast_header_written.session);
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 4 -> assert(i_n_t_r_a_multicast_header_read.sequence_number[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.sequence_number[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  i_n_t_r_a_multicast_header_at = 0;
  do
  :: i_n_t_r_a_multicast_header_at < 8 -> assert(i_n_t_r_a_multicast_header_read.datetime[i_n_t_r_a_multicast_header_at] == i_n_t_r_a_multicast_header_written.datetime[i_n_t_r_a_multicast_header_at]); i_n_t_r_a_multicast_header_at = i_n_t_r_a_multicast_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 4 bytes ------------------------------------------------- */

/* Message length and message type */
typedef MessageHeader {
  byte message_length[2];
  byte message_type[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog For Instruments Belonging To The Local And Global Stock Market Message: 111 bytes ---- */

/* It disseminates information on the local and global stock market. */
typedef CatalogForInstrumentsBelongingToTheLocalAndGlobalStockMar_gc6yau {
  byte instrument_number[4];
  byte value_type[2];
  byte issuer[7];
  byte series[6];
  byte last_price[8];
  byte wap[8];
  byte closing_price[8];
  byte reference_date[8];
  byte reference[2];
  byte current_coupon[2];
  byte marketability[2];
  byte numeric_marketability[4];
  byte isin[12];
  byte market;
  byte shares_outstanding[8];
  byte blocks_amount[8];
  byte exchange;
  byte filler[20]
};

int catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at;

/* every byte of Catalog For Instruments Belonging To The Local And Global Stock Market Message set to one value */
inline fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuer[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.wap[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.closing_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.current_coupon[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numeric_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.shares_outstanding[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.blocks_amount[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 20 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.filler[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog For Instruments Belonging To The Local And Global Stock Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 0 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 4 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuer[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 6 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 13 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 19 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.wap[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 27 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.closing_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 35 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 43 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 51 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.current_coupon[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 53 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 55 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numeric_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 57 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 61 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 73 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.shares_outstanding[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 74 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.blocks_amount[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 82 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 90 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 20 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.filler[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 91 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message to the wire, 111 bytes from where the cursor stands */
inline encode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuer[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.wap[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.closing_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.current_coupon[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numeric_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.shares_outstanding[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.blocks_amount[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 20 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.filler[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message off the wire, 111 bytes from where the cursor stands */
inline decode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuer[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.wap[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.closing_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.current_coupon[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numeric_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.shares_outstanding[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.blocks_amount[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 20 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.filler[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog For Instruments Belonging To The Local And Global Stock Market Message is what was written, byte for byte */
inline equal_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.value_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.value_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.issuer[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.issuer[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 6 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.series[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.last_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.wap[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.wap[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.closing_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.closing_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.reference[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.reference[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.current_coupon[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.current_coupon[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.numeric_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.numeric_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.market == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.market);
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.shares_outstanding[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.shares_outstanding[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.blocks_amount[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.blocks_amount[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.exchange == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.exchange);
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 20 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.filler[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.filler[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog Of Instruments That Belong To The Debt Metals And Money Market Message: 124 bytes ---- */

/* Catalog of instruments that belong to the Debt, Metals and Money market */
typedef CatalogOfInstrumentsThatBelongToTheDebtMetalsAndMoneyMark_a9x5rm {
  byte instrument_number[4];
  byte value_type[2];
  byte issuer[7];
  byte issue[6];
  byte issue_date[8];
  byte maturity_date[8];
  byte reference_pricerate[8];
  byte reference_date[8];
  byte reference[2];
  byte term_days[2];
  byte current_coupon[2];
  byte isin[12];
  byte market;
  byte current_nominal_value[8];
  byte original_nominal_value[8];
  byte outstanding_shares[8];
  byte amount_placed[8];
  byte operate_price_rate;
  byte exchange;
  byte filler[20]
};

int catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at;

/* every byte of Catalog Of Instruments That Belong To The Debt Metals And Money Market Message set to one value */
inline fill_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record, catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value) {
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 4 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.instrument_number[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.value_type[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 7 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issuer[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 6 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.maturity_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_pricerate[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.term_days[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_coupon[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 12 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.isin[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.market = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.original_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.outstanding_shares[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.amount_placed[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.operate_price_rate = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.exchange = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 20 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.filler[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_value; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog Of Instruments That Belong To The Debt Metals And Money Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record, catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base) {
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 4 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.instrument_number[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 0 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.value_type[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 4 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 7 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issuer[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 6 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 6 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 13 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 19 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.maturity_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 27 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_pricerate[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 35 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 43 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 51 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.term_days[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 53 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_coupon[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 55 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 12 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.isin[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 57 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.market = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 69 + 1) % 256;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 70 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.original_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 78 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.outstanding_shares[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 86 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.amount_placed[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 94 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.operate_price_rate = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 102 + 1) % 256;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.exchange = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 103 + 1) % 256;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 20 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.filler[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = (catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_base + 104 + catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1) % 256; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Of Instruments That Belong To The Debt Metals And Money Market Message to the wire, 124 bytes from where the cursor stands */
inline encode_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record) {
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 4 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.instrument_number[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.value_type[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 7 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issuer[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 6 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.maturity_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_pricerate[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.term_days[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_coupon[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 12 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.isin[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.market; at = at + 1;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.original_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.outstanding_shares[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.amount_placed[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.operate_price_rate; at = at + 1;
  wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.exchange; at = at + 1;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 20 -> wire[at] = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.filler[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Of Instruments That Belong To The Debt Metals And Money Market Message off the wire, 124 bytes from where the cursor stands */
inline decode_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record) {
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 4 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.instrument_number[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.value_type[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 7 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issuer[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 6 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.issue_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.maturity_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_pricerate[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.reference[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.term_days[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_coupon[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 12 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.isin[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.market = wire[at]; at = at + 1;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.current_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.original_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.outstanding_shares[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.amount_placed[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.operate_price_rate = wire[at]; at = at + 1;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.exchange = wire[at]; at = at + 1;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 20 -> catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_record.filler[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] = wire[at]; at = at + 1; catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog Of Instruments That Belong To The Debt Metals And Money Market Message is what was written, byte for byte */
inline equal_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read, catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written) {
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 4 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.instrument_number[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.instrument_number[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.value_type[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.value_type[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 7 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.issuer[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.issuer[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 6 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.issue[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.issue[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.issue_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.issue_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.maturity_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.maturity_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.reference_pricerate[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.reference_pricerate[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.reference_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.reference_date[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.reference[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.reference[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.term_days[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.term_days[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 2 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.current_coupon[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.current_coupon[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 12 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.isin[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.isin[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.market == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.market);
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.current_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.current_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.original_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.original_nominal_value[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.outstanding_shares[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.outstanding_shares[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 8 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.amount_placed[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.amount_placed[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.operate_price_rate == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.operate_price_rate);
  assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.exchange == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.exchange);
  catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = 0;
  do
  :: catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at < 20 -> assert(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_read.filler[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at] == catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_written.filler[catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at]); catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at = catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog For Instruments Belonging To The Capital Warrants Market Message: 87 bytes ---- */

/* Catalog for instruments belonging to the capital warrants market */
typedef CatalogForInstrumentsBelongingToTheCapitalWarrantsMarketMessage {
  byte instrument_number[4];
  byte value_type[2];
  byte issuer[7];
  byte series[6];
  byte warrant_type;
  byte maturity_date[8];
  byte exercise_price[8];
  byte reference_price[8];
  byte reference_date[8];
  byte reference[2];
  byte isin[12];
  byte exchange;
  byte filler[20]
};

int catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at;

/* every byte of Catalog For Instruments Belonging To The Capital Warrants Market Message set to one value */
inline fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.instrument_number[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.value_type[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuer[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.warrant_type = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.maturity_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exercise_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exchange = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 20 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.filler[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog For Instruments Belonging To The Capital Warrants Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.instrument_number[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 0 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.value_type[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 4 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuer[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 6 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 13 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.warrant_type = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 19 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.maturity_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 20 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exercise_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 28 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 36 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 44 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 52 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 54 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exchange = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 66 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 20 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.filler[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 67 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message to the wire, 87 bytes from where the cursor stands */
inline encode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.instrument_number[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.value_type[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuer[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.warrant_type; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.maturity_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exercise_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exchange; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 20 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.filler[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message off the wire, 87 bytes from where the cursor stands */
inline decode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.instrument_number[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.value_type[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuer[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.warrant_type = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.maturity_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exercise_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.exchange = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 20 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.filler[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog For Instruments Belonging To The Capital Warrants Market Message is what was written, byte for byte */
inline equal_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.instrument_number[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.instrument_number[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.value_type[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.value_type[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.issuer[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.issuer[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.warrant_type == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.warrant_type);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.maturity_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.maturity_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.exercise_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.exercise_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.reference[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.reference[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.exchange == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.exchange);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 20 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.filler[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.filler[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Futures And Swaps Derivatives Market Instruments Catalog Message: 113 bytes ---- */

/* Options, futures and swaps derivatives market instruments catalog */
typedef OptionsFuturesAndSwapsDerivativesMarketInstrumentsCatalogMessage {
  byte instrument_number[4];
  byte value_type[2];
  byte class[7];
  byte maturity[6];
  byte option_type;
  byte exercise_price[8];
  byte bid[8];
  byte prior_day_settlement_price[8];
  byte last_day_of_operation[8];
  byte maturity_date[8];
  byte open_contracts[4];
  byte contract_size[4];
  byte product_code[12];
  byte daily_maturity;
  byte key_exercise_price[6];
  byte cfi_code[6];
  byte filler[20]
};

int options_futures_and_swaps_derivatives_market_instruments_catalog_message_at;

/* every byte of Options Futures And Swaps Derivatives Market Instruments Catalog Message set to one value */
inline fill_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_record, options_futures_and_swaps_derivatives_market_instruments_catalog_message_value) {
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.instrument_number[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 2 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.value_type[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 7 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.class[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.option_type = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.bid[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.prior_day_settlement_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.last_day_of_operation[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity_date[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.open_contracts[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.contract_size[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 12 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.product_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.daily_maturity = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.key_exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.cfi_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 20 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.filler[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_value; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Futures And Swaps Derivatives Market Instruments Catalog Message set to where it lies, so a field read out of place says so */
inline ramp_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_record, options_futures_and_swaps_derivatives_market_instruments_catalog_message_base) {
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.instrument_number[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 0 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 2 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.value_type[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 4 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 7 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.class[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 6 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 13 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.option_type = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 19 + 1) % 256;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 20 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.bid[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 28 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.prior_day_settlement_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 36 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.last_day_of_operation[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 44 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity_date[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 52 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.open_contracts[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 60 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.contract_size[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 64 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 12 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.product_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 68 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.daily_maturity = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 80 + 1) % 256;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.key_exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 81 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.cfi_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 87 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 20 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.filler[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = (options_futures_and_swaps_derivatives_market_instruments_catalog_message_base + 93 + options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1) % 256; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Futures And Swaps Derivatives Market Instruments Catalog Message to the wire, 113 bytes from where the cursor stands */
inline encode_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_record) {
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.instrument_number[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 2 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.value_type[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 7 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.class[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.option_type; at = at + 1;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.bid[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.prior_day_settlement_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.last_day_of_operation[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity_date[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.open_contracts[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.contract_size[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 12 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.product_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.daily_maturity; at = at + 1;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.key_exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.cfi_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 20 -> wire[at] = options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.filler[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Futures And Swaps Derivatives Market Instruments Catalog Message off the wire, 113 bytes from where the cursor stands */
inline decode_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_record) {
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.instrument_number[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 2 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.value_type[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 7 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.class[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.option_type = wire[at]; at = at + 1;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.bid[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.prior_day_settlement_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.last_day_of_operation[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.maturity_date[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.open_contracts[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.contract_size[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 12 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.product_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.daily_maturity = wire[at]; at = at + 1;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.key_exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.cfi_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 20 -> options_futures_and_swaps_derivatives_market_instruments_catalog_message_record.filler[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] = wire[at]; at = at + 1; options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Futures And Swaps Derivatives Market Instruments Catalog Message is what was written, byte for byte */
inline equal_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read, options_futures_and_swaps_derivatives_market_instruments_catalog_message_written) {
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.instrument_number[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.instrument_number[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 2 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.value_type[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.value_type[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 7 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.class[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.class[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.maturity[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.maturity[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.option_type == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.option_type);
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.bid[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.bid[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.prior_day_settlement_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.prior_day_settlement_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.last_day_of_operation[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.last_day_of_operation[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 8 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.maturity_date[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.maturity_date[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.open_contracts[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.open_contracts[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 4 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.contract_size[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.contract_size[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 12 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.product_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.product_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.daily_maturity == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.daily_maturity);
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.key_exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.key_exercise_price[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 6 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.cfi_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.cfi_code[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = 0;
  do
  :: options_futures_and_swaps_derivatives_market_instruments_catalog_message_at < 20 -> assert(options_futures_and_swaps_derivatives_market_instruments_catalog_message_read.filler[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at] == options_futures_and_swaps_derivatives_market_instruments_catalog_message_written.filler[options_futures_and_swaps_derivatives_market_instruments_catalog_message_at]); options_futures_and_swaps_derivatives_market_instruments_catalog_message_at = options_futures_and_swaps_derivatives_market_instruments_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog Sent For Instruments Belonging To Capital Tracs Message: 101 bytes ---- */

/* Catalog sent for instruments belonging to capital TRACS */
typedef CatalogSentForInstrumentsBelongingToCapitalTracsMessage {
  byte trac_number[4];
  byte trac_name[8];
  byte underlying_issuer[7];
  byte underlying_series[6];
  byte securities[8];
  byte excluded_securities[8];
  byte price[8];
  byte cash_component[8];
  byte excluded_value[8];
  byte number_of_certificates[8];
  byte theoretical_price[8];
  byte filler[20]
};

int catalog_sent_for_instruments_belonging_to_capital_tracs_message_at;

/* every byte of Catalog Sent For Instruments Belonging To Capital Tracs Message set to one value */
inline fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record, catalog_sent_for_instruments_belonging_to_capital_tracs_message_value) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_number[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_name[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuer[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.cash_component[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 20 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.filler[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog Sent For Instruments Belonging To Capital Tracs Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record, catalog_sent_for_instruments_belonging_to_capital_tracs_message_base) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_number[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 0 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_name[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 4 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuer[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 12 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 19 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 25 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 33 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 41 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.cash_component[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 49 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 57 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 65 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 73 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 20 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.filler[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 81 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message to the wire, 101 bytes from where the cursor stands */
inline encode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_number[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_name[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuer[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.cash_component[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 20 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.filler[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message off the wire, 101 bytes from where the cursor stands */
inline decode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_number[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.trac_name[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuer[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.cash_component[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 20 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.filler[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog Sent For Instruments Belonging To Capital Tracs Message is what was written, byte for byte */
inline equal_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read, catalog_sent_for_instruments_belonging_to_capital_tracs_message_written) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.trac_number[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.trac_number[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.trac_name[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.trac_name[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.underlying_issuer[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.underlying_issuer[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.cash_component[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.cash_component[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 20 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.filler[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.filler[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog Sent For Instruments Belonging To Mutual Funds Message: 98 bytes ---- */

/* Catalog sent for instruments belonging to mutual funds */
typedef CatalogSentForInstrumentsBelongingToMutualFundsMessage {
  byte instrument_number[4];
  byte value_type[2];
  byte issuer[7];
  byte series[6];
  byte sector;
  byte subsector;
  byte business_line;
  byte sub_line;
  byte operating_company[10];
  byte reference_price[8];
  byte reference_date[8];
  byte reference[2];
  byte isin[12];
  byte rating[15];
  byte filler[20]
};

int catalog_sent_for_instruments_belonging_to_mutual_funds_message_at;

/* every byte of Catalog Sent For Instruments Belonging To Mutual Funds Message set to one value */
inline fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record, catalog_sent_for_instruments_belonging_to_mutual_funds_message_value) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.instrument_number[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.value_type[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuer[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.business_line = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_line = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.operating_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 20 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.filler[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog Sent For Instruments Belonging To Mutual Funds Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record, catalog_sent_for_instruments_belonging_to_mutual_funds_message_base) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.instrument_number[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 0 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.value_type[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 4 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuer[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 6 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 13 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 19 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 20 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.business_line = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 21 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_line = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 22 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.operating_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 23 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 33 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 41 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 49 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 51 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 63 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 20 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.filler[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 78 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message to the wire, 98 bytes from where the cursor stands */
inline encode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.instrument_number[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.value_type[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuer[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.business_line; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_line; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.operating_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 20 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.filler[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message off the wire, 98 bytes from where the cursor stands */
inline decode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.instrument_number[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.value_type[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuer[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.subsector = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.business_line = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_line = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.operating_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 20 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.filler[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog Sent For Instruments Belonging To Mutual Funds Message is what was written, byte for byte */
inline equal_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read, catalog_sent_for_instruments_belonging_to_mutual_funds_message_written) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.instrument_number[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.instrument_number[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.value_type[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.value_type[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.issuer[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.issuer[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.sector == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.sector);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.subsector == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.subsector);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.business_line == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.business_line);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.sub_line == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.sub_line);
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.operating_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.operating_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.reference[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.reference[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 12 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.isin[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 15 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.rating[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 20 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.filler[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.filler[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog Sent For Instruments Belonging To The Strategy Derivative Market Message: 74 bytes ---- */

/* Catalog sent for instruments belonging to the strategy derivative market */
typedef CatalogSentForInstrumentsBelongingToTheStrategyDerivative_nw7mmt {
  byte instrument_number[4];
  byte value_type[2];
  byte class[7];
  byte maturity[6];
  byte type_of_strategy;
  byte bid[8];
  byte last_date_operation[8];
  byte maturity_date[8];
  byte short_leg_instrument_identifier[4];
  byte long_leg_instruments_id[4];
  byte frequency;
  byte number_of_maturities;
  byte filler[20]
};

int catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at;

/* every byte of Catalog Sent For Instruments Belonging To The Strategy Derivative Market Message set to one value */
inline fill_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record, catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value) {
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.instrument_number[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 2 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.value_type[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 7 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.class[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 6 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.type_of_strategy = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.bid[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.last_date_operation[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity_date[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.short_leg_instrument_identifier[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.long_leg_instruments_id[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.frequency = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.number_of_maturities = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 20 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.filler[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_value; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog Sent For Instruments Belonging To The Strategy Derivative Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record, catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base) {
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.instrument_number[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 0 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 2 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.value_type[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 4 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 7 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.class[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 6 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 6 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 13 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.type_of_strategy = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 19 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.bid[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 20 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.last_date_operation[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 28 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity_date[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 36 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.short_leg_instrument_identifier[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 44 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.long_leg_instruments_id[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 48 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.frequency = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 52 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.number_of_maturities = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 53 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 20 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.filler[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = (catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_base + 54 + catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1) % 256; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To The Strategy Derivative Market Message to the wire, 74 bytes from where the cursor stands */
inline encode_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record) {
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.instrument_number[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 2 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.value_type[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 7 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.class[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 6 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.type_of_strategy; at = at + 1;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.bid[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.last_date_operation[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity_date[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.short_leg_instrument_identifier[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.long_leg_instruments_id[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.frequency; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.number_of_maturities; at = at + 1;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 20 -> wire[at] = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.filler[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To The Strategy Derivative Market Message off the wire, 74 bytes from where the cursor stands */
inline decode_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record) {
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.instrument_number[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 2 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.value_type[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 7 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.class[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 6 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.type_of_strategy = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.bid[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.last_date_operation[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.maturity_date[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.short_leg_instrument_identifier[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.long_leg_instruments_id[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.frequency = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.number_of_maturities = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 20 -> catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_record.filler[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog Sent For Instruments Belonging To The Strategy Derivative Market Message is what was written, byte for byte */
inline equal_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read, catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written) {
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.instrument_number[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.instrument_number[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 2 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.value_type[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.value_type[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 7 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.class[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.class[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 6 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.maturity[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.maturity[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.type_of_strategy == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.type_of_strategy);
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.bid[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.bid[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.last_date_operation[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.last_date_operation[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.maturity_date[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.maturity_date[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.short_leg_instrument_identifier[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.short_leg_instrument_identifier[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.long_leg_instruments_id[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.long_leg_instruments_id[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.frequency == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.frequency);
  assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.number_of_maturities == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.number_of_maturities);
  catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at < 20 -> assert(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_read.filler[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at] == catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_written.filler[catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at]); catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at = catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Underlying Value On Warrants Catalog Message: 63 bytes ------------------ */

/* Underlying value on warrants catalog */
typedef UnderlyingValueOnWarrantsCatalogMessage {
  byte instrument_number[4];
  byte issuer[7];
  byte series[6];
  byte value_type[2];
  byte underlying_issuer[7];
  byte underlying_series[6];
  byte underlying_value_type[2];
  byte number_of_registered_values[8];
  byte exchange;
  byte filler[20]
};

int underlying_value_on_warrants_catalog_message_at;

/* every byte of Underlying Value On Warrants Catalog Message set to one value */
inline fill_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_record, underlying_value_on_warrants_catalog_message_value) {
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 4 -> underlying_value_on_warrants_catalog_message_record.instrument_number[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> underlying_value_on_warrants_catalog_message_record.issuer[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> underlying_value_on_warrants_catalog_message_record.series[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> underlying_value_on_warrants_catalog_message_record.value_type[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> underlying_value_on_warrants_catalog_message_record.underlying_issuer[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> underlying_value_on_warrants_catalog_message_record.underlying_series[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> underlying_value_on_warrants_catalog_message_record.underlying_value_type[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 8 -> underlying_value_on_warrants_catalog_message_record.number_of_registered_values[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_record.exchange = underlying_value_on_warrants_catalog_message_value;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 20 -> underlying_value_on_warrants_catalog_message_record.filler[underlying_value_on_warrants_catalog_message_at] = underlying_value_on_warrants_catalog_message_value; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Underlying Value On Warrants Catalog Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_record, underlying_value_on_warrants_catalog_message_base) {
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 4 -> underlying_value_on_warrants_catalog_message_record.instrument_number[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 0 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> underlying_value_on_warrants_catalog_message_record.issuer[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 4 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> underlying_value_on_warrants_catalog_message_record.series[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 11 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> underlying_value_on_warrants_catalog_message_record.value_type[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 17 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> underlying_value_on_warrants_catalog_message_record.underlying_issuer[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 19 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> underlying_value_on_warrants_catalog_message_record.underlying_series[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 26 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> underlying_value_on_warrants_catalog_message_record.underlying_value_type[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 32 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 8 -> underlying_value_on_warrants_catalog_message_record.number_of_registered_values[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 34 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_record.exchange = (underlying_value_on_warrants_catalog_message_base + 42 + 1) % 256;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 20 -> underlying_value_on_warrants_catalog_message_record.filler[underlying_value_on_warrants_catalog_message_at] = (underlying_value_on_warrants_catalog_message_base + 43 + underlying_value_on_warrants_catalog_message_at + 1) % 256; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Value On Warrants Catalog Message to the wire, 63 bytes from where the cursor stands */
inline encode_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_record) {
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 4 -> wire[at] = underlying_value_on_warrants_catalog_message_record.instrument_number[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> wire[at] = underlying_value_on_warrants_catalog_message_record.issuer[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> wire[at] = underlying_value_on_warrants_catalog_message_record.series[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> wire[at] = underlying_value_on_warrants_catalog_message_record.value_type[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> wire[at] = underlying_value_on_warrants_catalog_message_record.underlying_issuer[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> wire[at] = underlying_value_on_warrants_catalog_message_record.underlying_series[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> wire[at] = underlying_value_on_warrants_catalog_message_record.underlying_value_type[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 8 -> wire[at] = underlying_value_on_warrants_catalog_message_record.number_of_registered_values[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_value_on_warrants_catalog_message_record.exchange; at = at + 1;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 20 -> wire[at] = underlying_value_on_warrants_catalog_message_record.filler[underlying_value_on_warrants_catalog_message_at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* Underlying Value On Warrants Catalog Message off the wire, 63 bytes from where the cursor stands */
inline decode_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_record) {
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 4 -> underlying_value_on_warrants_catalog_message_record.instrument_number[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> underlying_value_on_warrants_catalog_message_record.issuer[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> underlying_value_on_warrants_catalog_message_record.series[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> underlying_value_on_warrants_catalog_message_record.value_type[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> underlying_value_on_warrants_catalog_message_record.underlying_issuer[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> underlying_value_on_warrants_catalog_message_record.underlying_series[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> underlying_value_on_warrants_catalog_message_record.underlying_value_type[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 8 -> underlying_value_on_warrants_catalog_message_record.number_of_registered_values[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_record.exchange = wire[at]; at = at + 1;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 20 -> underlying_value_on_warrants_catalog_message_record.filler[underlying_value_on_warrants_catalog_message_at] = wire[at]; at = at + 1; underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Underlying Value On Warrants Catalog Message is what was written, byte for byte */
inline equal_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_read, underlying_value_on_warrants_catalog_message_written) {
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 4 -> assert(underlying_value_on_warrants_catalog_message_read.instrument_number[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.instrument_number[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> assert(underlying_value_on_warrants_catalog_message_read.issuer[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.issuer[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> assert(underlying_value_on_warrants_catalog_message_read.series[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.series[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> assert(underlying_value_on_warrants_catalog_message_read.value_type[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.value_type[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 7 -> assert(underlying_value_on_warrants_catalog_message_read.underlying_issuer[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.underlying_issuer[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 6 -> assert(underlying_value_on_warrants_catalog_message_read.underlying_series[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.underlying_series[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 2 -> assert(underlying_value_on_warrants_catalog_message_read.underlying_value_type[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.underlying_value_type[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 8 -> assert(underlying_value_on_warrants_catalog_message_read.number_of_registered_values[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.number_of_registered_values[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  assert(underlying_value_on_warrants_catalog_message_read.exchange == underlying_value_on_warrants_catalog_message_written.exchange);
  underlying_value_on_warrants_catalog_message_at = 0;
  do
  :: underlying_value_on_warrants_catalog_message_at < 20 -> assert(underlying_value_on_warrants_catalog_message_read.filler[underlying_value_on_warrants_catalog_message_at] == underlying_value_on_warrants_catalog_message_written.filler[underlying_value_on_warrants_catalog_message_at]); underlying_value_on_warrants_catalog_message_at = underlying_value_on_warrants_catalog_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* INTRA Multicast Header: encoded, read back, and compared */
proctype check_i_n_t_r_a_multicast_header() {
  INTRAMulticastHeader i_n_t_r_a_multicast_header_sent;
  INTRAMulticastHeader i_n_t_r_a_multicast_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  :: pattern == 1 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 32)
  :: pattern == 2 -> fill_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 255)
  :: else -> ramp_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_sent);
    assert(at == 17);
    at = 0;
    decode_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got);
    assert(at == 17);
    equal_i_n_t_r_a_multicast_header(i_n_t_r_a_multicast_header_got, i_n_t_r_a_multicast_header_sent)
  }
}

/* Message Header: encoded, read back, and compared */
proctype check_message_header() {
  MessageHeader message_header_sent;
  MessageHeader message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_header(message_header_sent, 0)
  :: pattern == 1 -> fill_message_header(message_header_sent, 32)
  :: pattern == 2 -> fill_message_header(message_header_sent, 255)
  :: else -> ramp_message_header(message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_header(message_header_sent);
    assert(at == 4);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 4);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message: encoded, read back, and compared */
proctype check_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau() {
  CatalogForInstrumentsBelongingToTheLocalAndGlobalStockMar_gc6yau catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent;
  CatalogForInstrumentsBelongingToTheLocalAndGlobalStockMar_gc6yau catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 0)
  :: pattern == 1 -> fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 32)
  :: pattern == 2 -> fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 255)
  :: else -> ramp_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent);
    assert(at == 111);
    at = 0;
    decode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got);
    assert(at == 111);
    equal_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent)
  }
}

/* Catalog Of Instruments That Belong To The Debt Metals And Money Market Message: encoded, read back, and compared */
proctype check_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm() {
  CatalogOfInstrumentsThatBelongToTheDebtMetalsAndMoneyMark_a9x5rm catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_sent;
  CatalogOfInstrumentsThatBelongToTheDebtMetalsAndMoneyMark_a9x5rm catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_sent, 0)
  :: pattern == 1 -> fill_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_sent, 32)
  :: pattern == 2 -> fill_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_sent, 255)
  :: else -> ramp_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_sent);
    assert(at == 124);
    at = 0;
    decode_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_got);
    assert(at == 124);
    equal_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm(catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_got, catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm_sent)
  }
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message: encoded, read back, and compared */
proctype check_catalog_for_instruments_belonging_to_the_capital_warrants_market_message() {
  CatalogForInstrumentsBelongingToTheCapitalWarrantsMarketMessage catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent;
  CatalogForInstrumentsBelongingToTheCapitalWarrantsMarketMessage catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 0)
  :: pattern == 1 -> fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 32)
  :: pattern == 2 -> fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 255)
  :: else -> ramp_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent);
    assert(at == 87);
    at = 0;
    decode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got);
    assert(at == 87);
    equal_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent)
  }
}

/* Options Futures And Swaps Derivatives Market Instruments Catalog Message: encoded, read back, and compared */
proctype check_options_futures_and_swaps_derivatives_market_instruments_catalog_message() {
  OptionsFuturesAndSwapsDerivativesMarketInstrumentsCatalogMessage options_futures_and_swaps_derivatives_market_instruments_catalog_message_sent;
  OptionsFuturesAndSwapsDerivativesMarketInstrumentsCatalogMessage options_futures_and_swaps_derivatives_market_instruments_catalog_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_sent, 0)
  :: pattern == 1 -> fill_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_sent, 32)
  :: pattern == 2 -> fill_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_sent, 255)
  :: else -> ramp_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_sent);
    assert(at == 113);
    at = 0;
    decode_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_got);
    assert(at == 113);
    equal_options_futures_and_swaps_derivatives_market_instruments_catalog_message(options_futures_and_swaps_derivatives_market_instruments_catalog_message_got, options_futures_and_swaps_derivatives_market_instruments_catalog_message_sent)
  }
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message: encoded, read back, and compared */
proctype check_catalog_sent_for_instruments_belonging_to_capital_tracs_message() {
  CatalogSentForInstrumentsBelongingToCapitalTracsMessage catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent;
  CatalogSentForInstrumentsBelongingToCapitalTracsMessage catalog_sent_for_instruments_belonging_to_capital_tracs_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 0)
  :: pattern == 1 -> fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 32)
  :: pattern == 2 -> fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 255)
  :: else -> ramp_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent);
    assert(at == 101);
    at = 0;
    decode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_got);
    assert(at == 101);
    equal_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_got, catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent)
  }
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message: encoded, read back, and compared */
proctype check_catalog_sent_for_instruments_belonging_to_mutual_funds_message() {
  CatalogSentForInstrumentsBelongingToMutualFundsMessage catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent;
  CatalogSentForInstrumentsBelongingToMutualFundsMessage catalog_sent_for_instruments_belonging_to_mutual_funds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 0)
  :: pattern == 1 -> fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 32)
  :: pattern == 2 -> fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 255)
  :: else -> ramp_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent);
    assert(at == 98);
    at = 0;
    decode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_got);
    assert(at == 98);
    equal_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_got, catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent)
  }
}

/* Catalog Sent For Instruments Belonging To The Strategy Derivative Market Message: encoded, read back, and compared */
proctype check_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt() {
  CatalogSentForInstrumentsBelongingToTheStrategyDerivative_nw7mmt catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_sent;
  CatalogSentForInstrumentsBelongingToTheStrategyDerivative_nw7mmt catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_sent, 0)
  :: pattern == 1 -> fill_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_sent, 32)
  :: pattern == 2 -> fill_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_sent, 255)
  :: else -> ramp_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_sent);
    assert(at == 74);
    at = 0;
    decode_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_got);
    assert(at == 74);
    equal_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt(catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_got, catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt_sent)
  }
}

/* Underlying Value On Warrants Catalog Message: encoded, read back, and compared */
proctype check_underlying_value_on_warrants_catalog_message() {
  UnderlyingValueOnWarrantsCatalogMessage underlying_value_on_warrants_catalog_message_sent;
  UnderlyingValueOnWarrantsCatalogMessage underlying_value_on_warrants_catalog_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_sent, 0)
  :: pattern == 1 -> fill_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_sent, 32)
  :: pattern == 2 -> fill_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_sent, 255)
  :: else -> ramp_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_sent);
    assert(at == 63);
    at = 0;
    decode_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_got);
    assert(at == 63);
    equal_underlying_value_on_warrants_catalog_message(underlying_value_on_warrants_catalog_message_got, underlying_value_on_warrants_catalog_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau()
  :: run check_catalog_of_instruments_that_belong_to_the_debt_metals_and_money_mark_a9x5rm()
  :: run check_catalog_for_instruments_belonging_to_the_capital_warrants_market_message()
  :: run check_options_futures_and_swaps_derivatives_market_instruments_catalog_message()
  :: run check_catalog_sent_for_instruments_belonging_to_capital_tracs_message()
  :: run check_catalog_sent_for_instruments_belonging_to_mutual_funds_message()
  :: run check_catalog_sent_for_instruments_belonging_to_the_strategy_derivative_nw7mmt()
  :: run check_underlying_value_on_warrants_catalog_message()
  fi
}
