/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 32
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
#define WIRE 33

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

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Message length and message type */
typedef MessageHeader {
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Effective Spread Message: 33 bytes -------------------------------------- */

/* Transaction cost analysis benchmark. */
typedef EffectiveSpreadMessage {
  byte origin;
  byte es_mxn[4];
  byte es_basis_points[4];
  byte es_mxn_bid[4];
  byte es_basis_points_bid[4];
  byte es_mxn_ask[4];
  byte es_basis_points_ask[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int effective_spread_message_at;

/* every byte of Effective Spread Message set to one value */
inline fill_effective_spread_message(effective_spread_message_record, effective_spread_message_value) {
  effective_spread_message_record.origin = effective_spread_message_value;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn_bid[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points_bid[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn_ask[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points_ask[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_record.market = effective_spread_message_value;
  effective_spread_message_record.sector = effective_spread_message_value;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.instrument_number[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 2 -> effective_spread_message_record.indices[effective_spread_message_at] = effective_spread_message_value; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Effective Spread Message set to where it lies, so a field read out of place says so */
inline ramp_effective_spread_message(effective_spread_message_record, effective_spread_message_base) {
  effective_spread_message_record.origin = (effective_spread_message_base + 0 + 1) % 256;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn[effective_spread_message_at] = (effective_spread_message_base + 1 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points[effective_spread_message_at] = (effective_spread_message_base + 5 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn_bid[effective_spread_message_at] = (effective_spread_message_base + 9 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points_bid[effective_spread_message_at] = (effective_spread_message_base + 13 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn_ask[effective_spread_message_at] = (effective_spread_message_base + 17 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points_ask[effective_spread_message_at] = (effective_spread_message_base + 21 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_record.market = (effective_spread_message_base + 25 + 1) % 256;
  effective_spread_message_record.sector = (effective_spread_message_base + 26 + 1) % 256;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.instrument_number[effective_spread_message_at] = (effective_spread_message_base + 27 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 2 -> effective_spread_message_record.indices[effective_spread_message_at] = (effective_spread_message_base + 31 + effective_spread_message_at + 1) % 256; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  skip
}

/* Effective Spread Message to the wire, 33 bytes from where the cursor stands */
inline encode_effective_spread_message(effective_spread_message_record) {
  wire[at] = effective_spread_message_record.origin; at = at + 1;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> wire[at] = effective_spread_message_record.es_mxn[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> wire[at] = effective_spread_message_record.es_basis_points[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> wire[at] = effective_spread_message_record.es_mxn_bid[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> wire[at] = effective_spread_message_record.es_basis_points_bid[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> wire[at] = effective_spread_message_record.es_mxn_ask[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> wire[at] = effective_spread_message_record.es_basis_points_ask[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  wire[at] = effective_spread_message_record.market; at = at + 1;
  wire[at] = effective_spread_message_record.sector; at = at + 1;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> wire[at] = effective_spread_message_record.instrument_number[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 2 -> wire[at] = effective_spread_message_record.indices[effective_spread_message_at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  skip
}

/* Effective Spread Message off the wire, 33 bytes from where the cursor stands */
inline decode_effective_spread_message(effective_spread_message_record) {
  effective_spread_message_record.origin = wire[at]; at = at + 1;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn_bid[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points_bid[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_mxn_ask[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.es_basis_points_ask[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_record.market = wire[at]; at = at + 1;
  effective_spread_message_record.sector = wire[at]; at = at + 1;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> effective_spread_message_record.instrument_number[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 2 -> effective_spread_message_record.indices[effective_spread_message_at] = wire[at]; at = at + 1; effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Effective Spread Message is what was written, byte for byte */
inline equal_effective_spread_message(effective_spread_message_read, effective_spread_message_written) {
  assert(effective_spread_message_read.origin == effective_spread_message_written.origin);
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> assert(effective_spread_message_read.es_mxn[effective_spread_message_at] == effective_spread_message_written.es_mxn[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> assert(effective_spread_message_read.es_basis_points[effective_spread_message_at] == effective_spread_message_written.es_basis_points[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> assert(effective_spread_message_read.es_mxn_bid[effective_spread_message_at] == effective_spread_message_written.es_mxn_bid[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> assert(effective_spread_message_read.es_basis_points_bid[effective_spread_message_at] == effective_spread_message_written.es_basis_points_bid[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> assert(effective_spread_message_read.es_mxn_ask[effective_spread_message_at] == effective_spread_message_written.es_mxn_ask[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> assert(effective_spread_message_read.es_basis_points_ask[effective_spread_message_at] == effective_spread_message_written.es_basis_points_ask[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  assert(effective_spread_message_read.market == effective_spread_message_written.market);
  assert(effective_spread_message_read.sector == effective_spread_message_written.sector);
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 4 -> assert(effective_spread_message_read.instrument_number[effective_spread_message_at] == effective_spread_message_written.instrument_number[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  effective_spread_message_at = 0;
  do
  :: effective_spread_message_at < 2 -> assert(effective_spread_message_read.indices[effective_spread_message_at] == effective_spread_message_written.indices[effective_spread_message_at]); effective_spread_message_at = effective_spread_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spread Quality Message: 21 bytes ---------------------------------------- */

/* Quality of the quoted spread throughout the session. */
typedef SpreadQualityMessage {
  byte origin;
  byte time_best_spread[4];
  byte time_tie_best_spread[4];
  byte time_without_best_spread[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int spread_quality_message_at;

/* every byte of Spread Quality Message set to one value */
inline fill_spread_quality_message(spread_quality_message_record, spread_quality_message_value) {
  spread_quality_message_record.origin = spread_quality_message_value;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_best_spread[spread_quality_message_at] = spread_quality_message_value; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_tie_best_spread[spread_quality_message_at] = spread_quality_message_value; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_without_best_spread[spread_quality_message_at] = spread_quality_message_value; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_record.market = spread_quality_message_value;
  spread_quality_message_record.sector = spread_quality_message_value;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.instrument_number[spread_quality_message_at] = spread_quality_message_value; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 2 -> spread_quality_message_record.indices[spread_quality_message_at] = spread_quality_message_value; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spread Quality Message set to where it lies, so a field read out of place says so */
inline ramp_spread_quality_message(spread_quality_message_record, spread_quality_message_base) {
  spread_quality_message_record.origin = (spread_quality_message_base + 0 + 1) % 256;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_best_spread[spread_quality_message_at] = (spread_quality_message_base + 1 + spread_quality_message_at + 1) % 256; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_tie_best_spread[spread_quality_message_at] = (spread_quality_message_base + 5 + spread_quality_message_at + 1) % 256; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_without_best_spread[spread_quality_message_at] = (spread_quality_message_base + 9 + spread_quality_message_at + 1) % 256; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_record.market = (spread_quality_message_base + 13 + 1) % 256;
  spread_quality_message_record.sector = (spread_quality_message_base + 14 + 1) % 256;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.instrument_number[spread_quality_message_at] = (spread_quality_message_base + 15 + spread_quality_message_at + 1) % 256; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 2 -> spread_quality_message_record.indices[spread_quality_message_at] = (spread_quality_message_base + 19 + spread_quality_message_at + 1) % 256; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Quality Message to the wire, 21 bytes from where the cursor stands */
inline encode_spread_quality_message(spread_quality_message_record) {
  wire[at] = spread_quality_message_record.origin; at = at + 1;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> wire[at] = spread_quality_message_record.time_best_spread[spread_quality_message_at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> wire[at] = spread_quality_message_record.time_tie_best_spread[spread_quality_message_at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> wire[at] = spread_quality_message_record.time_without_best_spread[spread_quality_message_at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  wire[at] = spread_quality_message_record.market; at = at + 1;
  wire[at] = spread_quality_message_record.sector; at = at + 1;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> wire[at] = spread_quality_message_record.instrument_number[spread_quality_message_at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 2 -> wire[at] = spread_quality_message_record.indices[spread_quality_message_at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Quality Message off the wire, 21 bytes from where the cursor stands */
inline decode_spread_quality_message(spread_quality_message_record) {
  spread_quality_message_record.origin = wire[at]; at = at + 1;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_best_spread[spread_quality_message_at] = wire[at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_tie_best_spread[spread_quality_message_at] = wire[at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.time_without_best_spread[spread_quality_message_at] = wire[at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_record.market = wire[at]; at = at + 1;
  spread_quality_message_record.sector = wire[at]; at = at + 1;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> spread_quality_message_record.instrument_number[spread_quality_message_at] = wire[at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 2 -> spread_quality_message_record.indices[spread_quality_message_at] = wire[at]; at = at + 1; spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spread Quality Message is what was written, byte for byte */
inline equal_spread_quality_message(spread_quality_message_read, spread_quality_message_written) {
  assert(spread_quality_message_read.origin == spread_quality_message_written.origin);
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> assert(spread_quality_message_read.time_best_spread[spread_quality_message_at] == spread_quality_message_written.time_best_spread[spread_quality_message_at]); spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> assert(spread_quality_message_read.time_tie_best_spread[spread_quality_message_at] == spread_quality_message_written.time_tie_best_spread[spread_quality_message_at]); spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> assert(spread_quality_message_read.time_without_best_spread[spread_quality_message_at] == spread_quality_message_written.time_without_best_spread[spread_quality_message_at]); spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  assert(spread_quality_message_read.market == spread_quality_message_written.market);
  assert(spread_quality_message_read.sector == spread_quality_message_written.sector);
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 4 -> assert(spread_quality_message_read.instrument_number[spread_quality_message_at] == spread_quality_message_written.instrument_number[spread_quality_message_at]); spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  spread_quality_message_at = 0;
  do
  :: spread_quality_message_at < 2 -> assert(spread_quality_message_read.indices[spread_quality_message_at] == spread_quality_message_written.indices[spread_quality_message_at]); spread_quality_message_at = spread_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Leaderboard Message: 33 bytes ------------------------------------- */

/* Measures time proportion that a stock Exchange maintains the best bid and (or) ask throughout the session. */
typedef PriceLeaderboardMessage {
  byte origin;
  byte t_best_bid[4];
  byte t_tie_best_bid[4];
  byte t_without_best_bid[4];
  byte t_best_ask[4];
  byte t_tie_best_ask[4];
  byte t_without_best_ask[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int price_leaderboard_message_at;

/* every byte of Price Leaderboard Message set to one value */
inline fill_price_leaderboard_message(price_leaderboard_message_record, price_leaderboard_message_value) {
  price_leaderboard_message_record.origin = price_leaderboard_message_value;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_record.market = price_leaderboard_message_value;
  price_leaderboard_message_record.sector = price_leaderboard_message_value;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.instrument_number[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> price_leaderboard_message_record.indices[price_leaderboard_message_at] = price_leaderboard_message_value; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Leaderboard Message set to where it lies, so a field read out of place says so */
inline ramp_price_leaderboard_message(price_leaderboard_message_record, price_leaderboard_message_base) {
  price_leaderboard_message_record.origin = (price_leaderboard_message_base + 0 + 1) % 256;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at] = (price_leaderboard_message_base + 1 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at] = (price_leaderboard_message_base + 5 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at] = (price_leaderboard_message_base + 9 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at] = (price_leaderboard_message_base + 13 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at] = (price_leaderboard_message_base + 17 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at] = (price_leaderboard_message_base + 21 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_record.market = (price_leaderboard_message_base + 25 + 1) % 256;
  price_leaderboard_message_record.sector = (price_leaderboard_message_base + 26 + 1) % 256;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.instrument_number[price_leaderboard_message_at] = (price_leaderboard_message_base + 27 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> price_leaderboard_message_record.indices[price_leaderboard_message_at] = (price_leaderboard_message_base + 31 + price_leaderboard_message_at + 1) % 256; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Leaderboard Message to the wire, 33 bytes from where the cursor stands */
inline encode_price_leaderboard_message(price_leaderboard_message_record) {
  wire[at] = price_leaderboard_message_record.origin; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  wire[at] = price_leaderboard_message_record.market; at = at + 1;
  wire[at] = price_leaderboard_message_record.sector; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> wire[at] = price_leaderboard_message_record.instrument_number[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> wire[at] = price_leaderboard_message_record.indices[price_leaderboard_message_at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Leaderboard Message off the wire, 33 bytes from where the cursor stands */
inline decode_price_leaderboard_message(price_leaderboard_message_record) {
  price_leaderboard_message_record.origin = wire[at]; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_bid[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_bid[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_bid[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_best_ask[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_tie_best_ask[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.t_without_best_ask[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_record.market = wire[at]; at = at + 1;
  price_leaderboard_message_record.sector = wire[at]; at = at + 1;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> price_leaderboard_message_record.instrument_number[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> price_leaderboard_message_record.indices[price_leaderboard_message_at] = wire[at]; at = at + 1; price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Leaderboard Message is what was written, byte for byte */
inline equal_price_leaderboard_message(price_leaderboard_message_read, price_leaderboard_message_written) {
  assert(price_leaderboard_message_read.origin == price_leaderboard_message_written.origin);
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_best_bid[price_leaderboard_message_at] == price_leaderboard_message_written.t_best_bid[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_tie_best_bid[price_leaderboard_message_at] == price_leaderboard_message_written.t_tie_best_bid[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_without_best_bid[price_leaderboard_message_at] == price_leaderboard_message_written.t_without_best_bid[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_best_ask[price_leaderboard_message_at] == price_leaderboard_message_written.t_best_ask[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_tie_best_ask[price_leaderboard_message_at] == price_leaderboard_message_written.t_tie_best_ask[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.t_without_best_ask[price_leaderboard_message_at] == price_leaderboard_message_written.t_without_best_ask[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  assert(price_leaderboard_message_read.market == price_leaderboard_message_written.market);
  assert(price_leaderboard_message_read.sector == price_leaderboard_message_written.sector);
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 4 -> assert(price_leaderboard_message_read.instrument_number[price_leaderboard_message_at] == price_leaderboard_message_written.instrument_number[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  price_leaderboard_message_at = 0;
  do
  :: price_leaderboard_message_at < 2 -> assert(price_leaderboard_message_read.indices[price_leaderboard_message_at] == price_leaderboard_message_written.indices[price_leaderboard_message_at]); price_leaderboard_message_at = price_leaderboard_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quotes Quality Message: 15 bytes ---------------------------------------- */

/* Time proportion in which an Exchange maintains quotes on both sides, bid and ask. */
typedef QuotesQualityMessage {
  byte origin;
  byte instruments[2];
  byte time[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int quotes_quality_message_at;

/* every byte of Quotes Quality Message set to one value */
inline fill_quotes_quality_message(quotes_quality_message_record, quotes_quality_message_value) {
  quotes_quality_message_record.origin = quotes_quality_message_value;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> quotes_quality_message_record.instruments[quotes_quality_message_at] = quotes_quality_message_value; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> quotes_quality_message_record.time[quotes_quality_message_at] = quotes_quality_message_value; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_record.market = quotes_quality_message_value;
  quotes_quality_message_record.sector = quotes_quality_message_value;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> quotes_quality_message_record.instrument_number[quotes_quality_message_at] = quotes_quality_message_value; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> quotes_quality_message_record.indices[quotes_quality_message_at] = quotes_quality_message_value; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quotes Quality Message set to where it lies, so a field read out of place says so */
inline ramp_quotes_quality_message(quotes_quality_message_record, quotes_quality_message_base) {
  quotes_quality_message_record.origin = (quotes_quality_message_base + 0 + 1) % 256;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> quotes_quality_message_record.instruments[quotes_quality_message_at] = (quotes_quality_message_base + 1 + quotes_quality_message_at + 1) % 256; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> quotes_quality_message_record.time[quotes_quality_message_at] = (quotes_quality_message_base + 3 + quotes_quality_message_at + 1) % 256; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_record.market = (quotes_quality_message_base + 7 + 1) % 256;
  quotes_quality_message_record.sector = (quotes_quality_message_base + 8 + 1) % 256;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> quotes_quality_message_record.instrument_number[quotes_quality_message_at] = (quotes_quality_message_base + 9 + quotes_quality_message_at + 1) % 256; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> quotes_quality_message_record.indices[quotes_quality_message_at] = (quotes_quality_message_base + 13 + quotes_quality_message_at + 1) % 256; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quotes Quality Message to the wire, 15 bytes from where the cursor stands */
inline encode_quotes_quality_message(quotes_quality_message_record) {
  wire[at] = quotes_quality_message_record.origin; at = at + 1;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> wire[at] = quotes_quality_message_record.instruments[quotes_quality_message_at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> wire[at] = quotes_quality_message_record.time[quotes_quality_message_at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  wire[at] = quotes_quality_message_record.market; at = at + 1;
  wire[at] = quotes_quality_message_record.sector; at = at + 1;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> wire[at] = quotes_quality_message_record.instrument_number[quotes_quality_message_at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> wire[at] = quotes_quality_message_record.indices[quotes_quality_message_at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quotes Quality Message off the wire, 15 bytes from where the cursor stands */
inline decode_quotes_quality_message(quotes_quality_message_record) {
  quotes_quality_message_record.origin = wire[at]; at = at + 1;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> quotes_quality_message_record.instruments[quotes_quality_message_at] = wire[at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> quotes_quality_message_record.time[quotes_quality_message_at] = wire[at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_record.market = wire[at]; at = at + 1;
  quotes_quality_message_record.sector = wire[at]; at = at + 1;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> quotes_quality_message_record.instrument_number[quotes_quality_message_at] = wire[at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> quotes_quality_message_record.indices[quotes_quality_message_at] = wire[at]; at = at + 1; quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quotes Quality Message is what was written, byte for byte */
inline equal_quotes_quality_message(quotes_quality_message_read, quotes_quality_message_written) {
  assert(quotes_quality_message_read.origin == quotes_quality_message_written.origin);
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> assert(quotes_quality_message_read.instruments[quotes_quality_message_at] == quotes_quality_message_written.instruments[quotes_quality_message_at]); quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> assert(quotes_quality_message_read.time[quotes_quality_message_at] == quotes_quality_message_written.time[quotes_quality_message_at]); quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  assert(quotes_quality_message_read.market == quotes_quality_message_written.market);
  assert(quotes_quality_message_read.sector == quotes_quality_message_written.sector);
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 4 -> assert(quotes_quality_message_read.instrument_number[quotes_quality_message_at] == quotes_quality_message_written.instrument_number[quotes_quality_message_at]); quotes_quality_message_at = quotes_quality_message_at + 1
  :: else -> break
  od;
  quotes_quality_message_at = 0;
  do
  :: quotes_quality_message_at < 2 -> assert(quotes_quality_message_read.indices[quotes_quality_message_at] == quotes_quality_message_written.indices[quotes_quality_message_at]); quotes_quality_message_at = quotes_quality_message_at + 1
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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Effective Spread Message: encoded, read back, and compared */
proctype check_effective_spread_message() {
  EffectiveSpreadMessage effective_spread_message_sent;
  EffectiveSpreadMessage effective_spread_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_effective_spread_message(effective_spread_message_sent, 0)
  :: pattern == 1 -> fill_effective_spread_message(effective_spread_message_sent, 32)
  :: pattern == 2 -> fill_effective_spread_message(effective_spread_message_sent, 255)
  :: else -> ramp_effective_spread_message(effective_spread_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_effective_spread_message(effective_spread_message_sent);
    assert(at == 33);
    at = 0;
    decode_effective_spread_message(effective_spread_message_got);
    assert(at == 33);
    equal_effective_spread_message(effective_spread_message_got, effective_spread_message_sent)
  }
}

/* Spread Quality Message: encoded, read back, and compared */
proctype check_spread_quality_message() {
  SpreadQualityMessage spread_quality_message_sent;
  SpreadQualityMessage spread_quality_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_quality_message(spread_quality_message_sent, 0)
  :: pattern == 1 -> fill_spread_quality_message(spread_quality_message_sent, 32)
  :: pattern == 2 -> fill_spread_quality_message(spread_quality_message_sent, 255)
  :: else -> ramp_spread_quality_message(spread_quality_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_quality_message(spread_quality_message_sent);
    assert(at == 21);
    at = 0;
    decode_spread_quality_message(spread_quality_message_got);
    assert(at == 21);
    equal_spread_quality_message(spread_quality_message_got, spread_quality_message_sent)
  }
}

/* Price Leaderboard Message: encoded, read back, and compared */
proctype check_price_leaderboard_message() {
  PriceLeaderboardMessage price_leaderboard_message_sent;
  PriceLeaderboardMessage price_leaderboard_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_leaderboard_message(price_leaderboard_message_sent, 0)
  :: pattern == 1 -> fill_price_leaderboard_message(price_leaderboard_message_sent, 32)
  :: pattern == 2 -> fill_price_leaderboard_message(price_leaderboard_message_sent, 255)
  :: else -> ramp_price_leaderboard_message(price_leaderboard_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_leaderboard_message(price_leaderboard_message_sent);
    assert(at == 33);
    at = 0;
    decode_price_leaderboard_message(price_leaderboard_message_got);
    assert(at == 33);
    equal_price_leaderboard_message(price_leaderboard_message_got, price_leaderboard_message_sent)
  }
}

/* Quotes Quality Message: encoded, read back, and compared */
proctype check_quotes_quality_message() {
  QuotesQualityMessage quotes_quality_message_sent;
  QuotesQualityMessage quotes_quality_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quotes_quality_message(quotes_quality_message_sent, 0)
  :: pattern == 1 -> fill_quotes_quality_message(quotes_quality_message_sent, 32)
  :: pattern == 2 -> fill_quotes_quality_message(quotes_quality_message_sent, 255)
  :: else -> ramp_quotes_quality_message(quotes_quality_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quotes_quality_message(quotes_quality_message_sent);
    assert(at == 15);
    at = 0;
    decode_quotes_quality_message(quotes_quality_message_got);
    assert(at == 15);
    equal_quotes_quality_message(quotes_quality_message_got, quotes_quality_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_effective_spread_message()
  :: run check_spread_quality_message()
  :: run check_price_leaderboard_message()
  :: run check_quotes_quality_message()
  fi
}
