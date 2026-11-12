/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 34
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
#define WIRE 53

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

/* ---- Big Picture Message: 37 bytes ------------------------------------------- */

/* Market share summary of the stock exchanges. */
typedef BigPictureMessage {
  byte origin;
  byte trades[4];
  byte volume[8];
  byte traded_value[8];
  byte market_share_amount[4];
  byte market_share_trades[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int big_picture_message_at;

/* every byte of Big Picture Message set to one value */
inline fill_big_picture_message(big_picture_message_record, big_picture_message_value) {
  big_picture_message_record.origin = big_picture_message_value;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.trades[big_picture_message_at] = big_picture_message_value; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> big_picture_message_record.volume[big_picture_message_at] = big_picture_message_value; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> big_picture_message_record.traded_value[big_picture_message_at] = big_picture_message_value; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.market_share_amount[big_picture_message_at] = big_picture_message_value; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.market_share_trades[big_picture_message_at] = big_picture_message_value; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_record.market = big_picture_message_value;
  big_picture_message_record.sector = big_picture_message_value;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.instrument_number[big_picture_message_at] = big_picture_message_value; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 2 -> big_picture_message_record.indices[big_picture_message_at] = big_picture_message_value; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Big Picture Message set to where it lies, so a field read out of place says so */
inline ramp_big_picture_message(big_picture_message_record, big_picture_message_base) {
  big_picture_message_record.origin = (big_picture_message_base + 0 + 1) % 256;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.trades[big_picture_message_at] = (big_picture_message_base + 1 + big_picture_message_at + 1) % 256; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> big_picture_message_record.volume[big_picture_message_at] = (big_picture_message_base + 5 + big_picture_message_at + 1) % 256; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> big_picture_message_record.traded_value[big_picture_message_at] = (big_picture_message_base + 13 + big_picture_message_at + 1) % 256; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.market_share_amount[big_picture_message_at] = (big_picture_message_base + 21 + big_picture_message_at + 1) % 256; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.market_share_trades[big_picture_message_at] = (big_picture_message_base + 25 + big_picture_message_at + 1) % 256; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_record.market = (big_picture_message_base + 29 + 1) % 256;
  big_picture_message_record.sector = (big_picture_message_base + 30 + 1) % 256;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.instrument_number[big_picture_message_at] = (big_picture_message_base + 31 + big_picture_message_at + 1) % 256; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 2 -> big_picture_message_record.indices[big_picture_message_at] = (big_picture_message_base + 35 + big_picture_message_at + 1) % 256; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  skip
}

/* Big Picture Message to the wire, 37 bytes from where the cursor stands */
inline encode_big_picture_message(big_picture_message_record) {
  wire[at] = big_picture_message_record.origin; at = at + 1;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> wire[at] = big_picture_message_record.trades[big_picture_message_at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> wire[at] = big_picture_message_record.volume[big_picture_message_at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> wire[at] = big_picture_message_record.traded_value[big_picture_message_at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> wire[at] = big_picture_message_record.market_share_amount[big_picture_message_at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> wire[at] = big_picture_message_record.market_share_trades[big_picture_message_at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  wire[at] = big_picture_message_record.market; at = at + 1;
  wire[at] = big_picture_message_record.sector; at = at + 1;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> wire[at] = big_picture_message_record.instrument_number[big_picture_message_at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 2 -> wire[at] = big_picture_message_record.indices[big_picture_message_at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  skip
}

/* Big Picture Message off the wire, 37 bytes from where the cursor stands */
inline decode_big_picture_message(big_picture_message_record) {
  big_picture_message_record.origin = wire[at]; at = at + 1;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.trades[big_picture_message_at] = wire[at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> big_picture_message_record.volume[big_picture_message_at] = wire[at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> big_picture_message_record.traded_value[big_picture_message_at] = wire[at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.market_share_amount[big_picture_message_at] = wire[at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.market_share_trades[big_picture_message_at] = wire[at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_record.market = wire[at]; at = at + 1;
  big_picture_message_record.sector = wire[at]; at = at + 1;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> big_picture_message_record.instrument_number[big_picture_message_at] = wire[at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 2 -> big_picture_message_record.indices[big_picture_message_at] = wire[at]; at = at + 1; big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Big Picture Message is what was written, byte for byte */
inline equal_big_picture_message(big_picture_message_read, big_picture_message_written) {
  assert(big_picture_message_read.origin == big_picture_message_written.origin);
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> assert(big_picture_message_read.trades[big_picture_message_at] == big_picture_message_written.trades[big_picture_message_at]); big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> assert(big_picture_message_read.volume[big_picture_message_at] == big_picture_message_written.volume[big_picture_message_at]); big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 8 -> assert(big_picture_message_read.traded_value[big_picture_message_at] == big_picture_message_written.traded_value[big_picture_message_at]); big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> assert(big_picture_message_read.market_share_amount[big_picture_message_at] == big_picture_message_written.market_share_amount[big_picture_message_at]); big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> assert(big_picture_message_read.market_share_trades[big_picture_message_at] == big_picture_message_written.market_share_trades[big_picture_message_at]); big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  assert(big_picture_message_read.market == big_picture_message_written.market);
  assert(big_picture_message_read.sector == big_picture_message_written.sector);
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 4 -> assert(big_picture_message_read.instrument_number[big_picture_message_at] == big_picture_message_written.instrument_number[big_picture_message_at]); big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  big_picture_message_at = 0;
  do
  :: big_picture_message_at < 2 -> assert(big_picture_message_read.indices[big_picture_message_at] == big_picture_message_written.indices[big_picture_message_at]); big_picture_message_at = big_picture_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Benchmark Trade Message: 25 bytes --------------------------------------- */

/* Trading statistics by trade. */
typedef BenchmarkTradeMessage {
  byte origin;
  byte average_volume[8];
  byte average_traded_value[8];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int benchmark_trade_message_at;

/* every byte of Benchmark Trade Message set to one value */
inline fill_benchmark_trade_message(benchmark_trade_message_record, benchmark_trade_message_value) {
  benchmark_trade_message_record.origin = benchmark_trade_message_value;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_volume[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_record.market = benchmark_trade_message_value;
  benchmark_trade_message_record.sector = benchmark_trade_message_value;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> benchmark_trade_message_record.instrument_number[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> benchmark_trade_message_record.indices[benchmark_trade_message_at] = benchmark_trade_message_value; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Benchmark Trade Message set to where it lies, so a field read out of place says so */
inline ramp_benchmark_trade_message(benchmark_trade_message_record, benchmark_trade_message_base) {
  benchmark_trade_message_record.origin = (benchmark_trade_message_base + 0 + 1) % 256;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_volume[benchmark_trade_message_at] = (benchmark_trade_message_base + 1 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at] = (benchmark_trade_message_base + 9 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_record.market = (benchmark_trade_message_base + 17 + 1) % 256;
  benchmark_trade_message_record.sector = (benchmark_trade_message_base + 18 + 1) % 256;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> benchmark_trade_message_record.instrument_number[benchmark_trade_message_at] = (benchmark_trade_message_base + 19 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> benchmark_trade_message_record.indices[benchmark_trade_message_at] = (benchmark_trade_message_base + 23 + benchmark_trade_message_at + 1) % 256; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Benchmark Trade Message to the wire, 25 bytes from where the cursor stands */
inline encode_benchmark_trade_message(benchmark_trade_message_record) {
  wire[at] = benchmark_trade_message_record.origin; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> wire[at] = benchmark_trade_message_record.average_volume[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> wire[at] = benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = benchmark_trade_message_record.market; at = at + 1;
  wire[at] = benchmark_trade_message_record.sector; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> wire[at] = benchmark_trade_message_record.instrument_number[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> wire[at] = benchmark_trade_message_record.indices[benchmark_trade_message_at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Benchmark Trade Message off the wire, 25 bytes from where the cursor stands */
inline decode_benchmark_trade_message(benchmark_trade_message_record) {
  benchmark_trade_message_record.origin = wire[at]; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_volume[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> benchmark_trade_message_record.average_traded_value[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_record.market = wire[at]; at = at + 1;
  benchmark_trade_message_record.sector = wire[at]; at = at + 1;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> benchmark_trade_message_record.instrument_number[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> benchmark_trade_message_record.indices[benchmark_trade_message_at] = wire[at]; at = at + 1; benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Benchmark Trade Message is what was written, byte for byte */
inline equal_benchmark_trade_message(benchmark_trade_message_read, benchmark_trade_message_written) {
  assert(benchmark_trade_message_read.origin == benchmark_trade_message_written.origin);
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> assert(benchmark_trade_message_read.average_volume[benchmark_trade_message_at] == benchmark_trade_message_written.average_volume[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 8 -> assert(benchmark_trade_message_read.average_traded_value[benchmark_trade_message_at] == benchmark_trade_message_written.average_traded_value[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  assert(benchmark_trade_message_read.market == benchmark_trade_message_written.market);
  assert(benchmark_trade_message_read.sector == benchmark_trade_message_written.sector);
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 4 -> assert(benchmark_trade_message_read.instrument_number[benchmark_trade_message_at] == benchmark_trade_message_written.instrument_number[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  benchmark_trade_message_at = 0;
  do
  :: benchmark_trade_message_at < 2 -> assert(benchmark_trade_message_read.indices[benchmark_trade_message_at] == benchmark_trade_message_written.indices[benchmark_trade_message_at]); benchmark_trade_message_at = benchmark_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Hour Tracker Message: 53 bytes ------------------------------------------ */

/* Trading performance evolution per hour. */
typedef HourTrackerMessage {
  byte origin;
  byte trades[4];
  byte volume[8];
  byte traded_value[8];
  byte spread_mxn[4];
  byte spread_basis_points[4];
  byte average_volume[8];
  byte average_traded_value[8];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int hour_tracker_message_at;

/* every byte of Hour Tracker Message set to one value */
inline fill_hour_tracker_message(hour_tracker_message_record, hour_tracker_message_value) {
  hour_tracker_message_record.origin = hour_tracker_message_value;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.trades[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.volume[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.traded_value[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.spread_mxn[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.spread_basis_points[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.average_volume[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.average_traded_value[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_record.market = hour_tracker_message_value;
  hour_tracker_message_record.sector = hour_tracker_message_value;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.instrument_number[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 2 -> hour_tracker_message_record.indices[hour_tracker_message_at] = hour_tracker_message_value; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Hour Tracker Message set to where it lies, so a field read out of place says so */
inline ramp_hour_tracker_message(hour_tracker_message_record, hour_tracker_message_base) {
  hour_tracker_message_record.origin = (hour_tracker_message_base + 0 + 1) % 256;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.trades[hour_tracker_message_at] = (hour_tracker_message_base + 1 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.volume[hour_tracker_message_at] = (hour_tracker_message_base + 5 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.traded_value[hour_tracker_message_at] = (hour_tracker_message_base + 13 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.spread_mxn[hour_tracker_message_at] = (hour_tracker_message_base + 21 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.spread_basis_points[hour_tracker_message_at] = (hour_tracker_message_base + 25 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.average_volume[hour_tracker_message_at] = (hour_tracker_message_base + 29 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.average_traded_value[hour_tracker_message_at] = (hour_tracker_message_base + 37 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_record.market = (hour_tracker_message_base + 45 + 1) % 256;
  hour_tracker_message_record.sector = (hour_tracker_message_base + 46 + 1) % 256;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.instrument_number[hour_tracker_message_at] = (hour_tracker_message_base + 47 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 2 -> hour_tracker_message_record.indices[hour_tracker_message_at] = (hour_tracker_message_base + 51 + hour_tracker_message_at + 1) % 256; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  skip
}

/* Hour Tracker Message to the wire, 53 bytes from where the cursor stands */
inline encode_hour_tracker_message(hour_tracker_message_record) {
  wire[at] = hour_tracker_message_record.origin; at = at + 1;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> wire[at] = hour_tracker_message_record.trades[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> wire[at] = hour_tracker_message_record.volume[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> wire[at] = hour_tracker_message_record.traded_value[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> wire[at] = hour_tracker_message_record.spread_mxn[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> wire[at] = hour_tracker_message_record.spread_basis_points[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> wire[at] = hour_tracker_message_record.average_volume[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> wire[at] = hour_tracker_message_record.average_traded_value[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  wire[at] = hour_tracker_message_record.market; at = at + 1;
  wire[at] = hour_tracker_message_record.sector; at = at + 1;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> wire[at] = hour_tracker_message_record.instrument_number[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 2 -> wire[at] = hour_tracker_message_record.indices[hour_tracker_message_at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  skip
}

/* Hour Tracker Message off the wire, 53 bytes from where the cursor stands */
inline decode_hour_tracker_message(hour_tracker_message_record) {
  hour_tracker_message_record.origin = wire[at]; at = at + 1;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.trades[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.volume[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.traded_value[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.spread_mxn[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.spread_basis_points[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.average_volume[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> hour_tracker_message_record.average_traded_value[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_record.market = wire[at]; at = at + 1;
  hour_tracker_message_record.sector = wire[at]; at = at + 1;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> hour_tracker_message_record.instrument_number[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 2 -> hour_tracker_message_record.indices[hour_tracker_message_at] = wire[at]; at = at + 1; hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Hour Tracker Message is what was written, byte for byte */
inline equal_hour_tracker_message(hour_tracker_message_read, hour_tracker_message_written) {
  assert(hour_tracker_message_read.origin == hour_tracker_message_written.origin);
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> assert(hour_tracker_message_read.trades[hour_tracker_message_at] == hour_tracker_message_written.trades[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> assert(hour_tracker_message_read.volume[hour_tracker_message_at] == hour_tracker_message_written.volume[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> assert(hour_tracker_message_read.traded_value[hour_tracker_message_at] == hour_tracker_message_written.traded_value[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> assert(hour_tracker_message_read.spread_mxn[hour_tracker_message_at] == hour_tracker_message_written.spread_mxn[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> assert(hour_tracker_message_read.spread_basis_points[hour_tracker_message_at] == hour_tracker_message_written.spread_basis_points[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> assert(hour_tracker_message_read.average_volume[hour_tracker_message_at] == hour_tracker_message_written.average_volume[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 8 -> assert(hour_tracker_message_read.average_traded_value[hour_tracker_message_at] == hour_tracker_message_written.average_traded_value[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  assert(hour_tracker_message_read.market == hour_tracker_message_written.market);
  assert(hour_tracker_message_read.sector == hour_tracker_message_written.sector);
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 4 -> assert(hour_tracker_message_read.instrument_number[hour_tracker_message_at] == hour_tracker_message_written.instrument_number[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  hour_tracker_message_at = 0;
  do
  :: hour_tracker_message_at < 2 -> assert(hour_tracker_message_read.indices[hour_tracker_message_at] == hour_tracker_message_written.indices[hour_tracker_message_at]); hour_tracker_message_at = hour_tracker_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Ratio Message: 37 bytes ----------------------------------------- */

/* Message to trade ratio conversion. */
typedef MessageRatioMessage {
  byte origin;
  byte messages[4];
  byte messages_bid[4];
  byte messages_ask[4];
  byte messages_modified[4];
  byte messages_canceled[4];
  byte trades[4];
  byte ratio[4];
  byte market;
  byte sector;
  byte instrument_number[4];
  byte indices[2]
};

int message_ratio_message_at;

/* every byte of Message Ratio Message set to one value */
inline fill_message_ratio_message(message_ratio_message_record, message_ratio_message_value) {
  message_ratio_message_record.origin = message_ratio_message_value;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_bid[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_ask[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_modified[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_canceled[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.trades[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.ratio[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_record.market = message_ratio_message_value;
  message_ratio_message_record.sector = message_ratio_message_value;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.instrument_number[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 2 -> message_ratio_message_record.indices[message_ratio_message_at] = message_ratio_message_value; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Ratio Message set to where it lies, so a field read out of place says so */
inline ramp_message_ratio_message(message_ratio_message_record, message_ratio_message_base) {
  message_ratio_message_record.origin = (message_ratio_message_base + 0 + 1) % 256;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages[message_ratio_message_at] = (message_ratio_message_base + 1 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_bid[message_ratio_message_at] = (message_ratio_message_base + 5 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_ask[message_ratio_message_at] = (message_ratio_message_base + 9 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_modified[message_ratio_message_at] = (message_ratio_message_base + 13 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_canceled[message_ratio_message_at] = (message_ratio_message_base + 17 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.trades[message_ratio_message_at] = (message_ratio_message_base + 21 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.ratio[message_ratio_message_at] = (message_ratio_message_base + 25 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_record.market = (message_ratio_message_base + 29 + 1) % 256;
  message_ratio_message_record.sector = (message_ratio_message_base + 30 + 1) % 256;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.instrument_number[message_ratio_message_at] = (message_ratio_message_base + 31 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 2 -> message_ratio_message_record.indices[message_ratio_message_at] = (message_ratio_message_base + 35 + message_ratio_message_at + 1) % 256; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Ratio Message to the wire, 37 bytes from where the cursor stands */
inline encode_message_ratio_message(message_ratio_message_record) {
  wire[at] = message_ratio_message_record.origin; at = at + 1;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.messages[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.messages_bid[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.messages_ask[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.messages_modified[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.messages_canceled[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.trades[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.ratio[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  wire[at] = message_ratio_message_record.market; at = at + 1;
  wire[at] = message_ratio_message_record.sector; at = at + 1;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> wire[at] = message_ratio_message_record.instrument_number[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 2 -> wire[at] = message_ratio_message_record.indices[message_ratio_message_at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Ratio Message off the wire, 37 bytes from where the cursor stands */
inline decode_message_ratio_message(message_ratio_message_record) {
  message_ratio_message_record.origin = wire[at]; at = at + 1;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_bid[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_ask[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_modified[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.messages_canceled[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.trades[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.ratio[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_record.market = wire[at]; at = at + 1;
  message_ratio_message_record.sector = wire[at]; at = at + 1;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> message_ratio_message_record.instrument_number[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 2 -> message_ratio_message_record.indices[message_ratio_message_at] = wire[at]; at = at + 1; message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Ratio Message is what was written, byte for byte */
inline equal_message_ratio_message(message_ratio_message_read, message_ratio_message_written) {
  assert(message_ratio_message_read.origin == message_ratio_message_written.origin);
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.messages[message_ratio_message_at] == message_ratio_message_written.messages[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.messages_bid[message_ratio_message_at] == message_ratio_message_written.messages_bid[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.messages_ask[message_ratio_message_at] == message_ratio_message_written.messages_ask[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.messages_modified[message_ratio_message_at] == message_ratio_message_written.messages_modified[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.messages_canceled[message_ratio_message_at] == message_ratio_message_written.messages_canceled[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.trades[message_ratio_message_at] == message_ratio_message_written.trades[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.ratio[message_ratio_message_at] == message_ratio_message_written.ratio[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  assert(message_ratio_message_read.market == message_ratio_message_written.market);
  assert(message_ratio_message_read.sector == message_ratio_message_written.sector);
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 4 -> assert(message_ratio_message_read.instrument_number[message_ratio_message_at] == message_ratio_message_written.instrument_number[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
  :: else -> break
  od;
  message_ratio_message_at = 0;
  do
  :: message_ratio_message_at < 2 -> assert(message_ratio_message_read.indices[message_ratio_message_at] == message_ratio_message_written.indices[message_ratio_message_at]); message_ratio_message_at = message_ratio_message_at + 1
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

/* Big Picture Message: encoded, read back, and compared */
proctype check_big_picture_message() {
  BigPictureMessage big_picture_message_sent;
  BigPictureMessage big_picture_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_big_picture_message(big_picture_message_sent, 0)
  :: pattern == 1 -> fill_big_picture_message(big_picture_message_sent, 32)
  :: pattern == 2 -> fill_big_picture_message(big_picture_message_sent, 255)
  :: else -> ramp_big_picture_message(big_picture_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_big_picture_message(big_picture_message_sent);
    assert(at == 37);
    at = 0;
    decode_big_picture_message(big_picture_message_got);
    assert(at == 37);
    equal_big_picture_message(big_picture_message_got, big_picture_message_sent)
  }
}

/* Benchmark Trade Message: encoded, read back, and compared */
proctype check_benchmark_trade_message() {
  BenchmarkTradeMessage benchmark_trade_message_sent;
  BenchmarkTradeMessage benchmark_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_benchmark_trade_message(benchmark_trade_message_sent, 0)
  :: pattern == 1 -> fill_benchmark_trade_message(benchmark_trade_message_sent, 32)
  :: pattern == 2 -> fill_benchmark_trade_message(benchmark_trade_message_sent, 255)
  :: else -> ramp_benchmark_trade_message(benchmark_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_benchmark_trade_message(benchmark_trade_message_sent);
    assert(at == 25);
    at = 0;
    decode_benchmark_trade_message(benchmark_trade_message_got);
    assert(at == 25);
    equal_benchmark_trade_message(benchmark_trade_message_got, benchmark_trade_message_sent)
  }
}

/* Hour Tracker Message: encoded, read back, and compared */
proctype check_hour_tracker_message() {
  HourTrackerMessage hour_tracker_message_sent;
  HourTrackerMessage hour_tracker_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_hour_tracker_message(hour_tracker_message_sent, 0)
  :: pattern == 1 -> fill_hour_tracker_message(hour_tracker_message_sent, 32)
  :: pattern == 2 -> fill_hour_tracker_message(hour_tracker_message_sent, 255)
  :: else -> ramp_hour_tracker_message(hour_tracker_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_hour_tracker_message(hour_tracker_message_sent);
    assert(at == 53);
    at = 0;
    decode_hour_tracker_message(hour_tracker_message_got);
    assert(at == 53);
    equal_hour_tracker_message(hour_tracker_message_got, hour_tracker_message_sent)
  }
}

/* Message Ratio Message: encoded, read back, and compared */
proctype check_message_ratio_message() {
  MessageRatioMessage message_ratio_message_sent;
  MessageRatioMessage message_ratio_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_ratio_message(message_ratio_message_sent, 0)
  :: pattern == 1 -> fill_message_ratio_message(message_ratio_message_sent, 32)
  :: pattern == 2 -> fill_message_ratio_message(message_ratio_message_sent, 255)
  :: else -> ramp_message_ratio_message(message_ratio_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_ratio_message(message_ratio_message_sent);
    assert(at == 37);
    at = 0;
    decode_message_ratio_message(message_ratio_message_got);
    assert(at == 37);
    equal_message_ratio_message(message_ratio_message_got, message_ratio_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_big_picture_message()
  :: run check_benchmark_trade_message()
  :: run check_hour_tracker_message()
  :: run check_message_ratio_message()
  fi
}
