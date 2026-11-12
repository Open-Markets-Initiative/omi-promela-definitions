/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 27
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
#define WIRE 103

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

/* ---- Mutual Funds Trades Message: 53 bytes ----------------------------------- */

/* Any transaction made in mutual funds is reported. */
typedef MutualFundsTradesMessage {
  byte instrument_number[4];
  byte origin;
  byte date_of_the_trade[8];
  byte price[8];
  byte book_value[8];
  byte number_of_sales_trades[4];
  byte sales_volume[8];
  byte number_of_purchase_trades[4];
  byte purchase_volume[8]
};

int mutual_funds_trades_message_at;

/* every byte of Mutual Funds Trades Message set to one value */
inline fill_mutual_funds_trades_message(mutual_funds_trades_message_record, mutual_funds_trades_message_value) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_record.origin = mutual_funds_trades_message_value;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.price[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at] = mutual_funds_trades_message_value; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mutual Funds Trades Message set to where it lies, so a field read out of place says so */
inline ramp_mutual_funds_trades_message(mutual_funds_trades_message_record, mutual_funds_trades_message_base) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 0 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_record.origin = (mutual_funds_trades_message_base + 4 + 1) % 256;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 5 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.price[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 13 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 21 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 29 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 33 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 41 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at] = (mutual_funds_trades_message_base + 45 + mutual_funds_trades_message_at + 1) % 256; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Funds Trades Message to the wire, 53 bytes from where the cursor stands */
inline encode_mutual_funds_trades_message(mutual_funds_trades_message_record) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> wire[at] = mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = mutual_funds_trades_message_record.origin; at = at + 1;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.price[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> wire[at] = mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> wire[at] = mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> wire[at] = mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mutual Funds Trades Message off the wire, 53 bytes from where the cursor stands */
inline decode_mutual_funds_trades_message(mutual_funds_trades_message_record) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.instrument_number[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_record.origin = wire[at]; at = at + 1;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.date_of_the_trade[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.price[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.book_value[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_sales_trades[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.sales_volume[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> mutual_funds_trades_message_record.number_of_purchase_trades[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> mutual_funds_trades_message_record.purchase_volume[mutual_funds_trades_message_at] = wire[at]; at = at + 1; mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mutual Funds Trades Message is what was written, byte for byte */
inline equal_mutual_funds_trades_message(mutual_funds_trades_message_read, mutual_funds_trades_message_written) {
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> assert(mutual_funds_trades_message_read.instrument_number[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.instrument_number[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  assert(mutual_funds_trades_message_read.origin == mutual_funds_trades_message_written.origin);
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.date_of_the_trade[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.date_of_the_trade[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.price[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.price[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.book_value[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.book_value[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> assert(mutual_funds_trades_message_read.number_of_sales_trades[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.number_of_sales_trades[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.sales_volume[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.sales_volume[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 4 -> assert(mutual_funds_trades_message_read.number_of_purchase_trades[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.number_of_purchase_trades[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  mutual_funds_trades_message_at = 0;
  do
  :: mutual_funds_trades_message_at < 8 -> assert(mutual_funds_trades_message_read.purchase_volume[mutual_funds_trades_message_at] == mutual_funds_trades_message_written.purchase_volume[mutual_funds_trades_message_at]); mutual_funds_trades_message_at = mutual_funds_trades_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Opening Of Continuous Auctions Message: 21 bytes ------------------------ */

/* The message is sent when one of the ongoing, volatility or SIC bidding sessions is generated. */
typedef OpeningOfContinuousAuctionsMessage {
  byte instrument_number[4];
  byte origin;
  byte auction_session_startup_time[8];
  byte auction_session_end_time[8]
};

int opening_of_continuous_auctions_message_at;

/* every byte of Opening Of Continuous Auctions Message set to one value */
inline fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record, opening_of_continuous_auctions_message_value) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at] = opening_of_continuous_auctions_message_value; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_record.origin = opening_of_continuous_auctions_message_value;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at] = opening_of_continuous_auctions_message_value; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at] = opening_of_continuous_auctions_message_value; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Of Continuous Auctions Message set to where it lies, so a field read out of place says so */
inline ramp_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record, opening_of_continuous_auctions_message_base) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at] = (opening_of_continuous_auctions_message_base + 0 + opening_of_continuous_auctions_message_at + 1) % 256; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_record.origin = (opening_of_continuous_auctions_message_base + 4 + 1) % 256;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at] = (opening_of_continuous_auctions_message_base + 5 + opening_of_continuous_auctions_message_at + 1) % 256; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at] = (opening_of_continuous_auctions_message_base + 13 + opening_of_continuous_auctions_message_at + 1) % 256; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Of Continuous Auctions Message to the wire, 21 bytes from where the cursor stands */
inline encode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> wire[at] = opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_of_continuous_auctions_message_record.origin; at = at + 1;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> wire[at] = opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> wire[at] = opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Of Continuous Auctions Message off the wire, 21 bytes from where the cursor stands */
inline decode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_record) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> opening_of_continuous_auctions_message_record.instrument_number[opening_of_continuous_auctions_message_at] = wire[at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_record.origin = wire[at]; at = at + 1;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_startup_time[opening_of_continuous_auctions_message_at] = wire[at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> opening_of_continuous_auctions_message_record.auction_session_end_time[opening_of_continuous_auctions_message_at] = wire[at]; at = at + 1; opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Of Continuous Auctions Message is what was written, byte for byte */
inline equal_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_read, opening_of_continuous_auctions_message_written) {
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 4 -> assert(opening_of_continuous_auctions_message_read.instrument_number[opening_of_continuous_auctions_message_at] == opening_of_continuous_auctions_message_written.instrument_number[opening_of_continuous_auctions_message_at]); opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  assert(opening_of_continuous_auctions_message_read.origin == opening_of_continuous_auctions_message_written.origin);
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> assert(opening_of_continuous_auctions_message_read.auction_session_startup_time[opening_of_continuous_auctions_message_at] == opening_of_continuous_auctions_message_written.auction_session_startup_time[opening_of_continuous_auctions_message_at]); opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  opening_of_continuous_auctions_message_at = 0;
  do
  :: opening_of_continuous_auctions_message_at < 8 -> assert(opening_of_continuous_auctions_message_read.auction_session_end_time[opening_of_continuous_auctions_message_at] == opening_of_continuous_auctions_message_written.auction_session_end_time[opening_of_continuous_auctions_message_at]); opening_of_continuous_auctions_message_at = opening_of_continuous_auctions_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Existence Of Bids At Mid Price Message: 6 bytes ------------------------- */

/* This message is generated when an instrument enters a bid in the hidden electronic book At Mean Price. */
typedef ExistenceOfBidsAtMidPriceMessage {
  byte instrument_number[4];
  byte origin;
  byte bids_existing
};

int existence_of_bids_at_mid_price_message_at;

/* every byte of Existence Of Bids At Mid Price Message set to one value */
inline fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record, existence_of_bids_at_mid_price_message_value) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at] = existence_of_bids_at_mid_price_message_value; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  existence_of_bids_at_mid_price_message_record.origin = existence_of_bids_at_mid_price_message_value;
  existence_of_bids_at_mid_price_message_record.bids_existing = existence_of_bids_at_mid_price_message_value;
  skip
}

/* each byte of Existence Of Bids At Mid Price Message set to where it lies, so a field read out of place says so */
inline ramp_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record, existence_of_bids_at_mid_price_message_base) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at] = (existence_of_bids_at_mid_price_message_base + 0 + existence_of_bids_at_mid_price_message_at + 1) % 256; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  existence_of_bids_at_mid_price_message_record.origin = (existence_of_bids_at_mid_price_message_base + 4 + 1) % 256;
  existence_of_bids_at_mid_price_message_record.bids_existing = (existence_of_bids_at_mid_price_message_base + 5 + 1) % 256;
  skip
}

/* Existence Of Bids At Mid Price Message to the wire, 6 bytes from where the cursor stands */
inline encode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> wire[at] = existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at]; at = at + 1; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  wire[at] = existence_of_bids_at_mid_price_message_record.origin; at = at + 1;
  wire[at] = existence_of_bids_at_mid_price_message_record.bids_existing; at = at + 1;
  skip
}

/* Existence Of Bids At Mid Price Message off the wire, 6 bytes from where the cursor stands */
inline decode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_record) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> existence_of_bids_at_mid_price_message_record.instrument_number[existence_of_bids_at_mid_price_message_at] = wire[at]; at = at + 1; existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  existence_of_bids_at_mid_price_message_record.origin = wire[at]; at = at + 1;
  existence_of_bids_at_mid_price_message_record.bids_existing = wire[at]; at = at + 1;
  skip
}

/* what was read of Existence Of Bids At Mid Price Message is what was written, byte for byte */
inline equal_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_read, existence_of_bids_at_mid_price_message_written) {
  existence_of_bids_at_mid_price_message_at = 0;
  do
  :: existence_of_bids_at_mid_price_message_at < 4 -> assert(existence_of_bids_at_mid_price_message_read.instrument_number[existence_of_bids_at_mid_price_message_at] == existence_of_bids_at_mid_price_message_written.instrument_number[existence_of_bids_at_mid_price_message_at]); existence_of_bids_at_mid_price_message_at = existence_of_bids_at_mid_price_message_at + 1
  :: else -> break
  od;
  assert(existence_of_bids_at_mid_price_message_read.origin == existence_of_bids_at_mid_price_message_written.origin);
  assert(existence_of_bids_at_mid_price_message_read.bids_existing == existence_of_bids_at_mid_price_message_written.bids_existing);
  skip
}

/* ---- Catalogue Of Debt And Metals Instruments Message: 103 bytes ------------- */

/* Catalogue sent for instruments pertaining to the Local Fixed rate, Global Fixed rate and metals markets. */
typedef CatalogueOfDebtAndMetalsInstrumentsMessage {
  byte number_of_the_instrument[4];
  byte origin;
  byte type_of_value[2];
  byte issuing_company[7];
  byte issuance[6];
  byte date_of_issuance[8];
  byte date_of_maturity[8];
  byte price_rate_of_reference[8];
  byte date_of_reference[8];
  byte reference;
  byte term_days[2];
  byte coupon_period[2];
  byte isin[12];
  byte market;
  byte current_nominal_value[8];
  byte original_nominal_value[8];
  byte outstanding_shares[8];
  byte amount_placed[8];
  byte trades_rate_price
};

int catalogue_of_debt_and_metals_instruments_message_at;

/* every byte of Catalogue Of Debt And Metals Instruments Message set to one value */
inline fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record, catalogue_of_debt_and_metals_instruments_message_value) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.origin = catalogue_of_debt_and_metals_instruments_message_value;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.reference = catalogue_of_debt_and_metals_instruments_message_value;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.market = catalogue_of_debt_and_metals_instruments_message_value;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] = catalogue_of_debt_and_metals_instruments_message_value; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price = catalogue_of_debt_and_metals_instruments_message_value;
  skip
}

/* each byte of Catalogue Of Debt And Metals Instruments Message set to where it lies, so a field read out of place says so */
inline ramp_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record, catalogue_of_debt_and_metals_instruments_message_base) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 0 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.origin = (catalogue_of_debt_and_metals_instruments_message_base + 4 + 1) % 256;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 5 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 7 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 14 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 20 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 28 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 36 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 44 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.reference = (catalogue_of_debt_and_metals_instruments_message_base + 52 + 1) % 256;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 53 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 55 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 57 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.market = (catalogue_of_debt_and_metals_instruments_message_base + 69 + 1) % 256;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 70 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 78 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 86 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] = (catalogue_of_debt_and_metals_instruments_message_base + 94 + catalogue_of_debt_and_metals_instruments_message_at + 1) % 256; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price = (catalogue_of_debt_and_metals_instruments_message_base + 102 + 1) % 256;
  skip
}

/* Catalogue Of Debt And Metals Instruments Message to the wire, 103 bytes from where the cursor stands */
inline encode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.origin; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.reference; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.market; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> wire[at] = catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price; at = at + 1;
  skip
}

/* Catalogue Of Debt And Metals Instruments Message off the wire, 103 bytes from where the cursor stands */
inline decode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_record) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> catalogue_of_debt_and_metals_instruments_message_record.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.origin = wire[at]; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> catalogue_of_debt_and_metals_instruments_message_record.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> catalogue_of_debt_and_metals_instruments_message_record.issuance[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.reference = wire[at]; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.term_days[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> catalogue_of_debt_and_metals_instruments_message_record.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> catalogue_of_debt_and_metals_instruments_message_record.isin[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.market = wire[at]; at = at + 1;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> catalogue_of_debt_and_metals_instruments_message_record.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] = wire[at]; at = at + 1; catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_record.trades_rate_price = wire[at]; at = at + 1;
  skip
}

/* what was read of Catalogue Of Debt And Metals Instruments Message is what was written, byte for byte */
inline equal_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_read, catalogue_of_debt_and_metals_instruments_message_written) {
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 4 -> assert(catalogue_of_debt_and_metals_instruments_message_read.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.number_of_the_instrument[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.origin == catalogue_of_debt_and_metals_instruments_message_written.origin);
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> assert(catalogue_of_debt_and_metals_instruments_message_read.type_of_value[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.type_of_value[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 7 -> assert(catalogue_of_debt_and_metals_instruments_message_read.issuing_company[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.issuing_company[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 6 -> assert(catalogue_of_debt_and_metals_instruments_message_read.issuance[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.issuance[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.date_of_issuance[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.date_of_maturity[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.price_rate_of_reference[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.date_of_reference[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.reference == catalogue_of_debt_and_metals_instruments_message_written.reference);
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> assert(catalogue_of_debt_and_metals_instruments_message_read.term_days[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.term_days[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 2 -> assert(catalogue_of_debt_and_metals_instruments_message_read.coupon_period[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.coupon_period[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 12 -> assert(catalogue_of_debt_and_metals_instruments_message_read.isin[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.isin[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.market == catalogue_of_debt_and_metals_instruments_message_written.market);
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.current_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.original_nominal_value[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.outstanding_shares[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  catalogue_of_debt_and_metals_instruments_message_at = 0;
  do
  :: catalogue_of_debt_and_metals_instruments_message_at < 8 -> assert(catalogue_of_debt_and_metals_instruments_message_read.amount_placed[catalogue_of_debt_and_metals_instruments_message_at] == catalogue_of_debt_and_metals_instruments_message_written.amount_placed[catalogue_of_debt_and_metals_instruments_message_at]); catalogue_of_debt_and_metals_instruments_message_at = catalogue_of_debt_and_metals_instruments_message_at + 1
  :: else -> break
  od;
  assert(catalogue_of_debt_and_metals_instruments_message_read.trades_rate_price == catalogue_of_debt_and_metals_instruments_message_written.trades_rate_price);
  skip
}

/* ---- Catalog Sent For Instruments Belonging To Mutual Funds Message: 78 bytes ---- */

/* Catalogue sent for instrument pertaining to the investment companies. */
typedef CatalogSentForInstrumentsBelongingToMutualFundsMessage {
  byte number_of_the_instrument[4];
  byte origin;
  byte type_of_value[2];
  byte issuing_company[7];
  byte series[6];
  byte sector;
  byte sub_sector;
  byte industry;
  byte sub_industry;
  byte trading_company[10];
  byte reference_price[8];
  byte reference_date[8];
  byte reference;
  byte isin[12];
  byte rating[15]
};

int catalog_sent_for_instruments_belonging_to_mutual_funds_message_at;

/* every byte of Catalog Sent For Instruments Belonging To Mutual Funds Message set to one value */
inline fill_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record, catalog_sent_for_instruments_belonging_to_mutual_funds_message_value) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_sector = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
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
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference = catalog_sent_for_instruments_belonging_to_mutual_funds_message_value;
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
  skip
}

/* each byte of Catalog Sent For Instruments Belonging To Mutual Funds Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record, catalog_sent_for_instruments_belonging_to_mutual_funds_message_base) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 0 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 4 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 5 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 7 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 14 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 20 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_sector = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 21 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 22 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 23 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 24 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_price[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 34 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 8 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference_date[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 42 + catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference = (catalog_sent_for_instruments_belonging_to_mutual_funds_message_base + 50 + 1) % 256;
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
  skip
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message to the wire, 78 bytes from where the cursor stands */
inline encode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_sector; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry; at = at + 1;
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
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
  wire[at] = catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference; at = at + 1;
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
  skip
}

/* Catalog Sent For Instruments Belonging To Mutual Funds Message off the wire, 78 bytes from where the cursor stands */
inline decode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_record) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.origin = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sector = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_sector = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.industry = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.sub_industry = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
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
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_record.reference = wire[at]; at = at + 1;
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
  skip
}

/* what was read of Catalog Sent For Instruments Belonging To Mutual Funds Message is what was written, byte for byte */
inline equal_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read, catalog_sent_for_instruments_belonging_to_mutual_funds_message_written) {
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.number_of_the_instrument[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.origin == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.origin);
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 2 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.type_of_value[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 7 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.issuing_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 6 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.series[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.sector == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.sector);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.sub_sector == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.sub_sector);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.industry == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.industry);
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.sub_industry == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.sub_industry);
  catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_mutual_funds_message_at < 10 -> assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at] == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.trading_company[catalog_sent_for_instruments_belonging_to_mutual_funds_message_at]); catalog_sent_for_instruments_belonging_to_mutual_funds_message_at = catalog_sent_for_instruments_belonging_to_mutual_funds_message_at + 1
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
  assert(catalog_sent_for_instruments_belonging_to_mutual_funds_message_read.reference == catalog_sent_for_instruments_belonging_to_mutual_funds_message_written.reference);
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
  skip
}

/* ---- Weighted Average Price Message: 21 bytes -------------------------------- */

/* This message will have the weighted average price (WAP) per instrument and is sent for each transaction generated within the calculation period of the WAP (last 20 minutes of the trading session); when there are no more trades in this period, the message is sent with the Weighted Average Price in zeros. */
typedef WeightedAveragePriceMessage {
  byte instrument_number[4];
  byte origin;
  byte weighted_average_price[8];
  byte volatility[8]
};

int weighted_average_price_message_at;

/* every byte of Weighted Average Price Message set to one value */
inline fill_weighted_average_price_message(weighted_average_price_message_record, weighted_average_price_message_value) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> weighted_average_price_message_record.instrument_number[weighted_average_price_message_at] = weighted_average_price_message_value; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_record.origin = weighted_average_price_message_value;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at] = weighted_average_price_message_value; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.volatility[weighted_average_price_message_at] = weighted_average_price_message_value; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Weighted Average Price Message set to where it lies, so a field read out of place says so */
inline ramp_weighted_average_price_message(weighted_average_price_message_record, weighted_average_price_message_base) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> weighted_average_price_message_record.instrument_number[weighted_average_price_message_at] = (weighted_average_price_message_base + 0 + weighted_average_price_message_at + 1) % 256; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_record.origin = (weighted_average_price_message_base + 4 + 1) % 256;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at] = (weighted_average_price_message_base + 5 + weighted_average_price_message_at + 1) % 256; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.volatility[weighted_average_price_message_at] = (weighted_average_price_message_base + 13 + weighted_average_price_message_at + 1) % 256; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Message to the wire, 21 bytes from where the cursor stands */
inline encode_weighted_average_price_message(weighted_average_price_message_record) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> wire[at] = weighted_average_price_message_record.instrument_number[weighted_average_price_message_at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  wire[at] = weighted_average_price_message_record.origin; at = at + 1;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> wire[at] = weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> wire[at] = weighted_average_price_message_record.volatility[weighted_average_price_message_at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Weighted Average Price Message off the wire, 21 bytes from where the cursor stands */
inline decode_weighted_average_price_message(weighted_average_price_message_record) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> weighted_average_price_message_record.instrument_number[weighted_average_price_message_at] = wire[at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_record.origin = wire[at]; at = at + 1;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.weighted_average_price[weighted_average_price_message_at] = wire[at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> weighted_average_price_message_record.volatility[weighted_average_price_message_at] = wire[at]; at = at + 1; weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Weighted Average Price Message is what was written, byte for byte */
inline equal_weighted_average_price_message(weighted_average_price_message_read, weighted_average_price_message_written) {
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 4 -> assert(weighted_average_price_message_read.instrument_number[weighted_average_price_message_at] == weighted_average_price_message_written.instrument_number[weighted_average_price_message_at]); weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  assert(weighted_average_price_message_read.origin == weighted_average_price_message_written.origin);
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> assert(weighted_average_price_message_read.weighted_average_price[weighted_average_price_message_at] == weighted_average_price_message_written.weighted_average_price[weighted_average_price_message_at]); weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  weighted_average_price_message_at = 0;
  do
  :: weighted_average_price_message_at < 8 -> assert(weighted_average_price_message_read.volatility[weighted_average_price_message_at] == weighted_average_price_message_written.volatility[weighted_average_price_message_at]); weighted_average_price_message_at = weighted_average_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Events Message: 31 bytes ----------------------------------------- */

/* The system events message is used to inform that an event has taken place, which needs to be disclosed to the public for its attention. */
typedef SystemEventsMessage {
  byte instrument_number[4];
  byte origin;
  byte code_of_event;
  byte market;
  byte send_time[8];
  byte end_time[8];
  byte group[8]
};

int system_events_message_at;

/* every byte of System Events Message set to one value */
inline fill_system_events_message(system_events_message_record, system_events_message_value) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> system_events_message_record.instrument_number[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_record.origin = system_events_message_value;
  system_events_message_record.code_of_event = system_events_message_value;
  system_events_message_record.market = system_events_message_value;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.send_time[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.end_time[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.group[system_events_message_at] = system_events_message_value; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Events Message set to where it lies, so a field read out of place says so */
inline ramp_system_events_message(system_events_message_record, system_events_message_base) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> system_events_message_record.instrument_number[system_events_message_at] = (system_events_message_base + 0 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_record.origin = (system_events_message_base + 4 + 1) % 256;
  system_events_message_record.code_of_event = (system_events_message_base + 5 + 1) % 256;
  system_events_message_record.market = (system_events_message_base + 6 + 1) % 256;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.send_time[system_events_message_at] = (system_events_message_base + 7 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.end_time[system_events_message_at] = (system_events_message_base + 15 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.group[system_events_message_at] = (system_events_message_base + 23 + system_events_message_at + 1) % 256; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Events Message to the wire, 31 bytes from where the cursor stands */
inline encode_system_events_message(system_events_message_record) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> wire[at] = system_events_message_record.instrument_number[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  wire[at] = system_events_message_record.origin; at = at + 1;
  wire[at] = system_events_message_record.code_of_event; at = at + 1;
  wire[at] = system_events_message_record.market; at = at + 1;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> wire[at] = system_events_message_record.send_time[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> wire[at] = system_events_message_record.end_time[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> wire[at] = system_events_message_record.group[system_events_message_at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Events Message off the wire, 31 bytes from where the cursor stands */
inline decode_system_events_message(system_events_message_record) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> system_events_message_record.instrument_number[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_record.origin = wire[at]; at = at + 1;
  system_events_message_record.code_of_event = wire[at]; at = at + 1;
  system_events_message_record.market = wire[at]; at = at + 1;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.send_time[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.end_time[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> system_events_message_record.group[system_events_message_at] = wire[at]; at = at + 1; system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Events Message is what was written, byte for byte */
inline equal_system_events_message(system_events_message_read, system_events_message_written) {
  system_events_message_at = 0;
  do
  :: system_events_message_at < 4 -> assert(system_events_message_read.instrument_number[system_events_message_at] == system_events_message_written.instrument_number[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  assert(system_events_message_read.origin == system_events_message_written.origin);
  assert(system_events_message_read.code_of_event == system_events_message_written.code_of_event);
  assert(system_events_message_read.market == system_events_message_written.market);
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> assert(system_events_message_read.send_time[system_events_message_at] == system_events_message_written.send_time[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> assert(system_events_message_read.end_time[system_events_message_at] == system_events_message_written.end_time[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  system_events_message_at = 0;
  do
  :: system_events_message_at < 8 -> assert(system_events_message_read.group[system_events_message_at] == system_events_message_written.group[system_events_message_at]); system_events_message_at = system_events_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reference Price Message: 14 bytes --------------------------------------- */

/* This message is sent to define the reference price of an instrument. */
typedef ReferencePriceMessage {
  byte instrument_number[4];
  byte origin;
  byte price[8];
  byte price_type
};

int reference_price_message_at;

/* every byte of Reference Price Message set to one value */
inline fill_reference_price_message(reference_price_message_record, reference_price_message_value) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.instrument_number[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.origin = reference_price_message_value;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = reference_price_message_value; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = reference_price_message_value;
  skip
}

/* each byte of Reference Price Message set to where it lies, so a field read out of place says so */
inline ramp_reference_price_message(reference_price_message_record, reference_price_message_base) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.instrument_number[reference_price_message_at] = (reference_price_message_base + 0 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.origin = (reference_price_message_base + 4 + 1) % 256;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = (reference_price_message_base + 5 + reference_price_message_at + 1) % 256; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = (reference_price_message_base + 13 + 1) % 256;
  skip
}

/* Reference Price Message to the wire, 14 bytes from where the cursor stands */
inline encode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> wire[at] = reference_price_message_record.instrument_number[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = reference_price_message_record.origin; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> wire[at] = reference_price_message_record.price[reference_price_message_at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  wire[at] = reference_price_message_record.price_type; at = at + 1;
  skip
}

/* Reference Price Message off the wire, 14 bytes from where the cursor stands */
inline decode_reference_price_message(reference_price_message_record) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> reference_price_message_record.instrument_number[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.origin = wire[at]; at = at + 1;
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> reference_price_message_record.price[reference_price_message_at] = wire[at]; at = at + 1; reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  reference_price_message_record.price_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Reference Price Message is what was written, byte for byte */
inline equal_reference_price_message(reference_price_message_read, reference_price_message_written) {
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 4 -> assert(reference_price_message_read.instrument_number[reference_price_message_at] == reference_price_message_written.instrument_number[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  assert(reference_price_message_read.origin == reference_price_message_written.origin);
  reference_price_message_at = 0;
  do
  :: reference_price_message_at < 8 -> assert(reference_price_message_read.price[reference_price_message_at] == reference_price_message_written.price[reference_price_message_at]); reference_price_message_at = reference_price_message_at + 1
  :: else -> break
  od;
  assert(reference_price_message_read.price_type == reference_price_message_written.price_type);
  skip
}

/* ---- Changes In Status Message: 7 bytes -------------------------------------- */

/* This message is sent when there has been a change in the status of the instruments. */
typedef ChangesInStatusMessage {
  byte instrument_number[4];
  byte origin;
  byte status;
  byte reason
};

int changes_in_status_message_at;

/* every byte of Changes In Status Message set to one value */
inline fill_changes_in_status_message(changes_in_status_message_record, changes_in_status_message_value) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> changes_in_status_message_record.instrument_number[changes_in_status_message_at] = changes_in_status_message_value; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  changes_in_status_message_record.origin = changes_in_status_message_value;
  changes_in_status_message_record.status = changes_in_status_message_value;
  changes_in_status_message_record.reason = changes_in_status_message_value;
  skip
}

/* each byte of Changes In Status Message set to where it lies, so a field read out of place says so */
inline ramp_changes_in_status_message(changes_in_status_message_record, changes_in_status_message_base) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> changes_in_status_message_record.instrument_number[changes_in_status_message_at] = (changes_in_status_message_base + 0 + changes_in_status_message_at + 1) % 256; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  changes_in_status_message_record.origin = (changes_in_status_message_base + 4 + 1) % 256;
  changes_in_status_message_record.status = (changes_in_status_message_base + 5 + 1) % 256;
  changes_in_status_message_record.reason = (changes_in_status_message_base + 6 + 1) % 256;
  skip
}

/* Changes In Status Message to the wire, 7 bytes from where the cursor stands */
inline encode_changes_in_status_message(changes_in_status_message_record) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> wire[at] = changes_in_status_message_record.instrument_number[changes_in_status_message_at]; at = at + 1; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  wire[at] = changes_in_status_message_record.origin; at = at + 1;
  wire[at] = changes_in_status_message_record.status; at = at + 1;
  wire[at] = changes_in_status_message_record.reason; at = at + 1;
  skip
}

/* Changes In Status Message off the wire, 7 bytes from where the cursor stands */
inline decode_changes_in_status_message(changes_in_status_message_record) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> changes_in_status_message_record.instrument_number[changes_in_status_message_at] = wire[at]; at = at + 1; changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  changes_in_status_message_record.origin = wire[at]; at = at + 1;
  changes_in_status_message_record.status = wire[at]; at = at + 1;
  changes_in_status_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Changes In Status Message is what was written, byte for byte */
inline equal_changes_in_status_message(changes_in_status_message_read, changes_in_status_message_written) {
  changes_in_status_message_at = 0;
  do
  :: changes_in_status_message_at < 4 -> assert(changes_in_status_message_read.instrument_number[changes_in_status_message_at] == changes_in_status_message_written.instrument_number[changes_in_status_message_at]); changes_in_status_message_at = changes_in_status_message_at + 1
  :: else -> break
  od;
  assert(changes_in_status_message_read.origin == changes_in_status_message_written.origin);
  assert(changes_in_status_message_read.status == changes_in_status_message_written.status);
  assert(changes_in_status_message_read.reason == changes_in_status_message_written.reason);
  skip
}

/* ---- Catalog For Instruments Belonging To The Capital Warrants Market Message: 66 bytes ---- */

/* Catalogue for instruments pertaining to the Equities Warrants market. */
typedef CatalogForInstrumentsBelongingToTheCapitalWarrantsMarketMessage {
  byte number_of_the_instrument[4];
  byte origin;
  byte type_of_value[2];
  byte issuing_company[7];
  byte series[6];
  byte type_of_warrant;
  byte date_of_maturity[8];
  byte price_of_exercise[8];
  byte reference_price[8];
  byte reference_date[8];
  byte reference;
  byte isin[12]
};

int catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at;

/* every byte of Catalog For Instruments Belonging To The Capital Warrants Market Message set to one value */
inline fill_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
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
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_value; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Catalog For Instruments Belonging To The Capital Warrants Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 0 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 4 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 5 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 7 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 14 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 20 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 21 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 29 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_price[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 37 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference_date[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 45 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 53 + 1) % 256;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = (catalog_for_instruments_belonging_to_the_capital_warrants_market_message_base + 54 + catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1) % 256; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message to the wire, 66 bytes from where the cursor stands */
inline encode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
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
  wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> wire[at] = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog For Instruments Belonging To The Capital Warrants Market Message off the wire, 66 bytes from where the cursor stands */
inline decode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.origin = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.type_of_warrant = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
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
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.reference = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> catalog_for_instruments_belonging_to_the_capital_warrants_market_message_record.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Catalog For Instruments Belonging To The Capital Warrants Market Message is what was written, byte for byte */
inline equal_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written) {
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 4 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.number_of_the_instrument[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.origin == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.origin);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 2 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.type_of_value[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 7 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.issuing_company[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 6 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.series[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.type_of_warrant == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.type_of_warrant);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.date_of_maturity[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 8 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.price_of_exercise[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
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
  assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.reference == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.reference);
  catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at < 12 -> assert(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_read.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at] == catalog_for_instruments_belonging_to_the_capital_warrants_market_message_written.isin[catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at]); catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at = catalog_for_instruments_belonging_to_the_capital_warrants_market_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog Sent For Instruments Belonging To Capital Tracs Message: 82 bytes ---- */

/* Catalogue sent for instruments pertaining to the equities TRACS. */
typedef CatalogSentForInstrumentsBelongingToCapitalTracsMessage {
  byte number_of_the_trac[4];
  byte origin;
  byte name_of_the_trac[8];
  byte underlying_issuing_company[7];
  byte underlying_series[6];
  byte securities[8];
  byte excluded_securities[8];
  byte price[8];
  byte component_in_cash[8];
  byte excluded_value[8];
  byte number_of_certificates[8];
  byte theoretical_price[8]
};

int catalog_sent_for_instruments_belonging_to_capital_tracs_message_at;

/* every byte of Catalog Sent For Instruments Belonging To Capital Tracs Message set to one value */
inline fill_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record, catalog_sent_for_instruments_belonging_to_capital_tracs_message_value) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_value; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  skip
}

/* each byte of Catalog Sent For Instruments Belonging To Capital Tracs Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record, catalog_sent_for_instruments_belonging_to_capital_tracs_message_base) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 0 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 4 + 1) % 256;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 5 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 13 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 6 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_series[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 20 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 26 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_securities[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 34 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 42 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 50 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.excluded_value[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 58 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_certificates[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 66 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.theoretical_price[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = (catalog_sent_for_instruments_belonging_to_capital_tracs_message_base + 74 + catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1) % 256; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  skip
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message to the wire, 82 bytes from where the cursor stands */
inline encode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin; at = at + 1;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> wire[at] = catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  skip
}

/* Catalog Sent For Instruments Belonging To Capital Tracs Message off the wire, 82 bytes from where the cursor stands */
inline decode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_record) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.origin = wire[at]; at = at + 1;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> catalog_sent_for_instruments_belonging_to_capital_tracs_message_record.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] = wire[at]; at = at + 1; catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  skip
}

/* what was read of Catalog Sent For Instruments Belonging To Capital Tracs Message is what was written, byte for byte */
inline equal_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read, catalog_sent_for_instruments_belonging_to_capital_tracs_message_written) {
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 4 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.number_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.origin == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.origin);
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.name_of_the_trac[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
  :: else -> break
  od;
  catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = 0;
  do
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 7 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.underlying_issuing_company[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  :: catalog_sent_for_instruments_belonging_to_capital_tracs_message_at < 8 -> assert(catalog_sent_for_instruments_belonging_to_capital_tracs_message_read.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at] == catalog_sent_for_instruments_belonging_to_capital_tracs_message_written.component_in_cash[catalog_sent_for_instruments_belonging_to_capital_tracs_message_at]); catalog_sent_for_instruments_belonging_to_capital_tracs_message_at = catalog_sent_for_instruments_belonging_to_capital_tracs_message_at + 1
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
  skip
}

/* ---- Consolidated Inav Message: 13 bytes ------------------------------------- */

/* Disclosure of the TRACS during the trading hours of the ongoing market. */
typedef ConsolidatedInavMessage {
  byte number_of_the_trac[4];
  byte origin;
  byte current_theoretical_price[8]
};

int consolidated_inav_message_at;

/* every byte of Consolidated Inav Message set to one value */
inline fill_consolidated_inav_message(consolidated_inav_message_record, consolidated_inav_message_value) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at] = consolidated_inav_message_value; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  consolidated_inav_message_record.origin = consolidated_inav_message_value;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at] = consolidated_inav_message_value; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Inav Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_inav_message(consolidated_inav_message_record, consolidated_inav_message_base) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at] = (consolidated_inav_message_base + 0 + consolidated_inav_message_at + 1) % 256; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  consolidated_inav_message_record.origin = (consolidated_inav_message_base + 4 + 1) % 256;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at] = (consolidated_inav_message_base + 5 + consolidated_inav_message_at + 1) % 256; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Inav Message to the wire, 13 bytes from where the cursor stands */
inline encode_consolidated_inav_message(consolidated_inav_message_record) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> wire[at] = consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_inav_message_record.origin; at = at + 1;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> wire[at] = consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Inav Message off the wire, 13 bytes from where the cursor stands */
inline decode_consolidated_inav_message(consolidated_inav_message_record) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> consolidated_inav_message_record.number_of_the_trac[consolidated_inav_message_at] = wire[at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  consolidated_inav_message_record.origin = wire[at]; at = at + 1;
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> consolidated_inav_message_record.current_theoretical_price[consolidated_inav_message_at] = wire[at]; at = at + 1; consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Inav Message is what was written, byte for byte */
inline equal_consolidated_inav_message(consolidated_inav_message_read, consolidated_inav_message_written) {
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 4 -> assert(consolidated_inav_message_read.number_of_the_trac[consolidated_inav_message_at] == consolidated_inav_message_written.number_of_the_trac[consolidated_inav_message_at]); consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  assert(consolidated_inav_message_read.origin == consolidated_inav_message_written.origin);
  consolidated_inav_message_at = 0;
  do
  :: consolidated_inav_message_at < 8 -> assert(consolidated_inav_message_read.current_theoretical_price[consolidated_inav_message_at] == consolidated_inav_message_written.current_theoretical_price[consolidated_inav_message_at]); consolidated_inav_message_at = consolidated_inav_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Catalog For Instruments Belonging To The Local And Global Stock Market Message: 73 bytes ---- */

/* Catalog of instruments from the local and global stock markets. */
typedef CatalogForInstrumentsBelongingToTheLocalAndGlobalStockMar_gc6yau {
  byte mse_instrument_number[4];
  byte value_of_type[2];
  byte issuing_company[7];
  byte series[6];
  byte last_price[8];
  byte ppp_weighted_average_price[8];
  byte reference_date[8];
  byte reference;
  byte coupon_in_effect[2];
  byte marketability;
  byte numerical_marketability[4];
  byte isin[12];
  byte market;
  byte registered_values[8];
  byte exchange
};

int catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at;

/* every byte of Catalog For Instruments Belonging To The Local And Global Stock Market Message set to one value */
inline fill_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_value;
  skip
}

/* each byte of Catalog For Instruments Belonging To The Local And Global Stock Market Message set to where it lies, so a field read out of place says so */
inline ramp_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 0 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 4 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 6 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 27 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 35 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 43 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 44 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 46 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 47 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 12 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.isin[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 51 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.market = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 63 + 1) % 256;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 64 + catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1) % 256; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = (catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_base + 72 + 1) % 256;
  skip
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message to the wire, 73 bytes from where the cursor stands */
inline encode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  wire[at] = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange; at = at + 1;
  skip
}

/* Catalog For Instruments Belonging To The Local And Global Stock Market Message off the wire, 73 bytes from where the cursor stands */
inline decode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.reference = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.marketability = wire[at]; at = at + 1;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] = wire[at]; at = at + 1; catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_record.exchange = wire[at]; at = at + 1;
  skip
}

/* what was read of Catalog For Instruments Belonging To The Local And Global Stock Market Message is what was written, byte for byte */
inline equal_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written) {
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.mse_instrument_number[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.value_of_type[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 7 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.issuing_company[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.ppp_weighted_average_price[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.reference_date[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.reference == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.reference);
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 2 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.coupon_in_effect[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.marketability == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.marketability);
  catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = 0;
  do
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 4 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.numerical_marketability[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
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
  :: catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at < 8 -> assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at] == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.registered_values[catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at]); catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at = catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_at + 1
  :: else -> break
  od;
  assert(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_read.exchange == catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_written.exchange);
  skip
}

/* ---- Probable Price Of Allocation Message: 21 bytes -------------------------- */

/* The message is sent during any type of bidding (Opening, Ongoing, Volatility and Intraday) and only in the instruments where there already is a virtual term matching or pre-allotment. */
typedef ProbablePriceOfAllocationMessage {
  byte instrument_number[4];
  byte origin;
  byte probable_price_of_allocation[8];
  byte volume[8]
};

int probable_price_of_allocation_message_at;

/* every byte of Probable Price Of Allocation Message set to one value */
inline fill_probable_price_of_allocation_message(probable_price_of_allocation_message_record, probable_price_of_allocation_message_value) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at] = probable_price_of_allocation_message_value; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_record.origin = probable_price_of_allocation_message_value;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at] = probable_price_of_allocation_message_value; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.volume[probable_price_of_allocation_message_at] = probable_price_of_allocation_message_value; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Probable Price Of Allocation Message set to where it lies, so a field read out of place says so */
inline ramp_probable_price_of_allocation_message(probable_price_of_allocation_message_record, probable_price_of_allocation_message_base) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at] = (probable_price_of_allocation_message_base + 0 + probable_price_of_allocation_message_at + 1) % 256; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_record.origin = (probable_price_of_allocation_message_base + 4 + 1) % 256;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at] = (probable_price_of_allocation_message_base + 5 + probable_price_of_allocation_message_at + 1) % 256; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.volume[probable_price_of_allocation_message_at] = (probable_price_of_allocation_message_base + 13 + probable_price_of_allocation_message_at + 1) % 256; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Price Of Allocation Message to the wire, 21 bytes from where the cursor stands */
inline encode_probable_price_of_allocation_message(probable_price_of_allocation_message_record) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> wire[at] = probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  wire[at] = probable_price_of_allocation_message_record.origin; at = at + 1;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> wire[at] = probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> wire[at] = probable_price_of_allocation_message_record.volume[probable_price_of_allocation_message_at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Probable Price Of Allocation Message off the wire, 21 bytes from where the cursor stands */
inline decode_probable_price_of_allocation_message(probable_price_of_allocation_message_record) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> probable_price_of_allocation_message_record.instrument_number[probable_price_of_allocation_message_at] = wire[at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_record.origin = wire[at]; at = at + 1;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.probable_price_of_allocation[probable_price_of_allocation_message_at] = wire[at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> probable_price_of_allocation_message_record.volume[probable_price_of_allocation_message_at] = wire[at]; at = at + 1; probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Probable Price Of Allocation Message is what was written, byte for byte */
inline equal_probable_price_of_allocation_message(probable_price_of_allocation_message_read, probable_price_of_allocation_message_written) {
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 4 -> assert(probable_price_of_allocation_message_read.instrument_number[probable_price_of_allocation_message_at] == probable_price_of_allocation_message_written.instrument_number[probable_price_of_allocation_message_at]); probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  assert(probable_price_of_allocation_message_read.origin == probable_price_of_allocation_message_written.origin);
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> assert(probable_price_of_allocation_message_read.probable_price_of_allocation[probable_price_of_allocation_message_at] == probable_price_of_allocation_message_written.probable_price_of_allocation[probable_price_of_allocation_message_at]); probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  probable_price_of_allocation_message_at = 0;
  do
  :: probable_price_of_allocation_message_at < 8 -> assert(probable_price_of_allocation_message_read.volume[probable_price_of_allocation_message_at] == probable_price_of_allocation_message_written.volume[probable_price_of_allocation_message_at]); probable_price_of_allocation_message_at = probable_price_of_allocation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Relation Between Bmvbiva Instruments Message: 9 bytes ------------------- */

/* Relation between identifiers of instruments between BIVA and BMV. */
typedef RelationBetweenBmvbivaInstrumentsMessage {
  byte number_of_the_bmv_instrument[4];
  byte biva_instrument[4];
  byte type_of_trading
};

int relation_between_bmvbiva_instruments_message_at;

/* every byte of Relation Between Bmvbiva Instruments Message set to one value */
inline fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record, relation_between_bmvbiva_instruments_message_value) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] = relation_between_bmvbiva_instruments_message_value; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at] = relation_between_bmvbiva_instruments_message_value; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_record.type_of_trading = relation_between_bmvbiva_instruments_message_value;
  skip
}

/* each byte of Relation Between Bmvbiva Instruments Message set to where it lies, so a field read out of place says so */
inline ramp_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record, relation_between_bmvbiva_instruments_message_base) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] = (relation_between_bmvbiva_instruments_message_base + 0 + relation_between_bmvbiva_instruments_message_at + 1) % 256; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at] = (relation_between_bmvbiva_instruments_message_base + 4 + relation_between_bmvbiva_instruments_message_at + 1) % 256; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_record.type_of_trading = (relation_between_bmvbiva_instruments_message_base + 8 + 1) % 256;
  skip
}

/* Relation Between Bmvbiva Instruments Message to the wire, 9 bytes from where the cursor stands */
inline encode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> wire[at] = relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> wire[at] = relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  wire[at] = relation_between_bmvbiva_instruments_message_record.type_of_trading; at = at + 1;
  skip
}

/* Relation Between Bmvbiva Instruments Message off the wire, 9 bytes from where the cursor stands */
inline decode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_record) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] = wire[at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> relation_between_bmvbiva_instruments_message_record.biva_instrument[relation_between_bmvbiva_instruments_message_at] = wire[at]; at = at + 1; relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_record.type_of_trading = wire[at]; at = at + 1;
  skip
}

/* what was read of Relation Between Bmvbiva Instruments Message is what was written, byte for byte */
inline equal_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_read, relation_between_bmvbiva_instruments_message_written) {
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> assert(relation_between_bmvbiva_instruments_message_read.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at] == relation_between_bmvbiva_instruments_message_written.number_of_the_bmv_instrument[relation_between_bmvbiva_instruments_message_at]); relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  relation_between_bmvbiva_instruments_message_at = 0;
  do
  :: relation_between_bmvbiva_instruments_message_at < 4 -> assert(relation_between_bmvbiva_instruments_message_read.biva_instrument[relation_between_bmvbiva_instruments_message_at] == relation_between_bmvbiva_instruments_message_written.biva_instrument[relation_between_bmvbiva_instruments_message_at]); relation_between_bmvbiva_instruments_message_at = relation_between_bmvbiva_instruments_message_at + 1
  :: else -> break
  od;
  assert(relation_between_bmvbiva_instruments_message_read.type_of_trading == relation_between_bmvbiva_instruments_message_written.type_of_trading);
  skip
}

/* ---- Equities Market Trades Message: 61 bytes -------------------------------- */

/* Informs about any transaction which was accepted at the BMV or BIVA. */
typedef EquitiesMarketTradesMessage {
  byte instrument_number[4];
  byte origin;
  byte time_of_the_trade[8];
  byte volume[8];
  byte price[8];
  byte type_of_agreement;
  byte consecutive_number_of_the_trade[8];
  byte sets_price;
  byte type_of_trading;
  byte amount[8];
  byte purchases[5];
  byte sells[5];
  byte settlement;
  byte auction_indicator;
  byte indicator
};

int equities_market_trades_message_at;

/* every byte of Equities Market Trades Message set to one value */
inline fill_equities_market_trades_message(equities_market_trades_message_record, equities_market_trades_message_value) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> equities_market_trades_message_record.instrument_number[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.origin = equities_market_trades_message_value;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.volume[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.price[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.type_of_agreement = equities_market_trades_message_value;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.sets_price = equities_market_trades_message_value;
  equities_market_trades_message_record.type_of_trading = equities_market_trades_message_value;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.amount[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.purchases[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.sells[equities_market_trades_message_at] = equities_market_trades_message_value; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.settlement = equities_market_trades_message_value;
  equities_market_trades_message_record.auction_indicator = equities_market_trades_message_value;
  equities_market_trades_message_record.indicator = equities_market_trades_message_value;
  skip
}

/* each byte of Equities Market Trades Message set to where it lies, so a field read out of place says so */
inline ramp_equities_market_trades_message(equities_market_trades_message_record, equities_market_trades_message_base) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> equities_market_trades_message_record.instrument_number[equities_market_trades_message_at] = (equities_market_trades_message_base + 0 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.origin = (equities_market_trades_message_base + 4 + 1) % 256;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at] = (equities_market_trades_message_base + 5 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.volume[equities_market_trades_message_at] = (equities_market_trades_message_base + 13 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.price[equities_market_trades_message_at] = (equities_market_trades_message_base + 21 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.type_of_agreement = (equities_market_trades_message_base + 29 + 1) % 256;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at] = (equities_market_trades_message_base + 30 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.sets_price = (equities_market_trades_message_base + 38 + 1) % 256;
  equities_market_trades_message_record.type_of_trading = (equities_market_trades_message_base + 39 + 1) % 256;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.amount[equities_market_trades_message_at] = (equities_market_trades_message_base + 40 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.purchases[equities_market_trades_message_at] = (equities_market_trades_message_base + 48 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.sells[equities_market_trades_message_at] = (equities_market_trades_message_base + 53 + equities_market_trades_message_at + 1) % 256; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.settlement = (equities_market_trades_message_base + 58 + 1) % 256;
  equities_market_trades_message_record.auction_indicator = (equities_market_trades_message_base + 59 + 1) % 256;
  equities_market_trades_message_record.indicator = (equities_market_trades_message_base + 60 + 1) % 256;
  skip
}

/* Equities Market Trades Message to the wire, 61 bytes from where the cursor stands */
inline encode_equities_market_trades_message(equities_market_trades_message_record) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> wire[at] = equities_market_trades_message_record.instrument_number[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.origin; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.volume[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.price[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.type_of_agreement; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.sets_price; at = at + 1;
  wire[at] = equities_market_trades_message_record.type_of_trading; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> wire[at] = equities_market_trades_message_record.amount[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> wire[at] = equities_market_trades_message_record.purchases[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> wire[at] = equities_market_trades_message_record.sells[equities_market_trades_message_at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  wire[at] = equities_market_trades_message_record.settlement; at = at + 1;
  wire[at] = equities_market_trades_message_record.auction_indicator; at = at + 1;
  wire[at] = equities_market_trades_message_record.indicator; at = at + 1;
  skip
}

/* Equities Market Trades Message off the wire, 61 bytes from where the cursor stands */
inline decode_equities_market_trades_message(equities_market_trades_message_record) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> equities_market_trades_message_record.instrument_number[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.origin = wire[at]; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.time_of_the_trade[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.volume[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.price[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.type_of_agreement = wire[at]; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.consecutive_number_of_the_trade[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.sets_price = wire[at]; at = at + 1;
  equities_market_trades_message_record.type_of_trading = wire[at]; at = at + 1;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> equities_market_trades_message_record.amount[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.purchases[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> equities_market_trades_message_record.sells[equities_market_trades_message_at] = wire[at]; at = at + 1; equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_record.settlement = wire[at]; at = at + 1;
  equities_market_trades_message_record.auction_indicator = wire[at]; at = at + 1;
  equities_market_trades_message_record.indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Equities Market Trades Message is what was written, byte for byte */
inline equal_equities_market_trades_message(equities_market_trades_message_read, equities_market_trades_message_written) {
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 4 -> assert(equities_market_trades_message_read.instrument_number[equities_market_trades_message_at] == equities_market_trades_message_written.instrument_number[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.origin == equities_market_trades_message_written.origin);
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.time_of_the_trade[equities_market_trades_message_at] == equities_market_trades_message_written.time_of_the_trade[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.volume[equities_market_trades_message_at] == equities_market_trades_message_written.volume[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.price[equities_market_trades_message_at] == equities_market_trades_message_written.price[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.type_of_agreement == equities_market_trades_message_written.type_of_agreement);
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.consecutive_number_of_the_trade[equities_market_trades_message_at] == equities_market_trades_message_written.consecutive_number_of_the_trade[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.sets_price == equities_market_trades_message_written.sets_price);
  assert(equities_market_trades_message_read.type_of_trading == equities_market_trades_message_written.type_of_trading);
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 8 -> assert(equities_market_trades_message_read.amount[equities_market_trades_message_at] == equities_market_trades_message_written.amount[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> assert(equities_market_trades_message_read.purchases[equities_market_trades_message_at] == equities_market_trades_message_written.purchases[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  equities_market_trades_message_at = 0;
  do
  :: equities_market_trades_message_at < 5 -> assert(equities_market_trades_message_read.sells[equities_market_trades_message_at] == equities_market_trades_message_written.sells[equities_market_trades_message_at]); equities_market_trades_message_at = equities_market_trades_message_at + 1
  :: else -> break
  od;
  assert(equities_market_trades_message_read.settlement == equities_market_trades_message_written.settlement);
  assert(equities_market_trades_message_read.auction_indicator == equities_market_trades_message_written.auction_indicator);
  assert(equities_market_trades_message_read.indicator == equities_market_trades_message_written.indicator);
  skip
}

/* ---- Consolidated Trade Cancellation Message: 13 bytes ----------------------- */

/* This message in sent when a transaction is cancelled from BMV or BIVA system. */
typedef ConsolidatedTradeCancellationMessage {
  byte instrument_number[4];
  byte origin;
  byte consecutive_number_of_the_trade[8]
};

int consolidated_trade_cancellation_message_at;

/* every byte of Consolidated Trade Cancellation Message set to one value */
inline fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record, consolidated_trade_cancellation_message_value) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at] = consolidated_trade_cancellation_message_value; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancellation_message_record.origin = consolidated_trade_cancellation_message_value;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] = consolidated_trade_cancellation_message_value; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record, consolidated_trade_cancellation_message_base) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at] = (consolidated_trade_cancellation_message_base + 0 + consolidated_trade_cancellation_message_at + 1) % 256; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancellation_message_record.origin = (consolidated_trade_cancellation_message_base + 4 + 1) % 256;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] = (consolidated_trade_cancellation_message_base + 5 + consolidated_trade_cancellation_message_at + 1) % 256; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Cancellation Message to the wire, 13 bytes from where the cursor stands */
inline encode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> wire[at] = consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_trade_cancellation_message_record.origin; at = at + 1;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> wire[at] = consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Trade Cancellation Message off the wire, 13 bytes from where the cursor stands */
inline decode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_record) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> consolidated_trade_cancellation_message_record.instrument_number[consolidated_trade_cancellation_message_at] = wire[at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  consolidated_trade_cancellation_message_record.origin = wire[at]; at = at + 1;
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> consolidated_trade_cancellation_message_record.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] = wire[at]; at = at + 1; consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Trade Cancellation Message is what was written, byte for byte */
inline equal_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_read, consolidated_trade_cancellation_message_written) {
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 4 -> assert(consolidated_trade_cancellation_message_read.instrument_number[consolidated_trade_cancellation_message_at] == consolidated_trade_cancellation_message_written.instrument_number[consolidated_trade_cancellation_message_at]); consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  assert(consolidated_trade_cancellation_message_read.origin == consolidated_trade_cancellation_message_written.origin);
  consolidated_trade_cancellation_message_at = 0;
  do
  :: consolidated_trade_cancellation_message_at < 8 -> assert(consolidated_trade_cancellation_message_read.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at] == consolidated_trade_cancellation_message_written.consecutive_number_of_the_trade[consolidated_trade_cancellation_message_at]); consolidated_trade_cancellation_message_at = consolidated_trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Pricevolume Indicator Message: 38 bytes --------------------------------- */

/* Price/volume indicator for the messages coming from BIVA. */
typedef PricevolumeIndicatorMessage {
  byte instrument_number[4];
  byte origin;
  byte probable_price_of_allotment[8];
  byte volume[8];
  byte best_selling_price[8];
  byte best_purchasing_price[8];
  byte type_of_cross_trading
};

int pricevolume_indicator_message_at;

/* every byte of Pricevolume Indicator Message set to one value */
inline fill_pricevolume_indicator_message(pricevolume_indicator_message_record, pricevolume_indicator_message_value) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.origin = pricevolume_indicator_message_value;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.volume[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at] = pricevolume_indicator_message_value; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.type_of_cross_trading = pricevolume_indicator_message_value;
  skip
}

/* each byte of Pricevolume Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_pricevolume_indicator_message(pricevolume_indicator_message_record, pricevolume_indicator_message_base) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 0 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.origin = (pricevolume_indicator_message_base + 4 + 1) % 256;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 5 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.volume[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 13 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 21 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at] = (pricevolume_indicator_message_base + 29 + pricevolume_indicator_message_at + 1) % 256; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.type_of_cross_trading = (pricevolume_indicator_message_base + 37 + 1) % 256;
  skip
}

/* Pricevolume Indicator Message to the wire, 38 bytes from where the cursor stands */
inline encode_pricevolume_indicator_message(pricevolume_indicator_message_record) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> wire[at] = pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = pricevolume_indicator_message_record.origin; at = at + 1;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.volume[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> wire[at] = pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = pricevolume_indicator_message_record.type_of_cross_trading; at = at + 1;
  skip
}

/* Pricevolume Indicator Message off the wire, 38 bytes from where the cursor stands */
inline decode_pricevolume_indicator_message(pricevolume_indicator_message_record) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> pricevolume_indicator_message_record.instrument_number[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.origin = wire[at]; at = at + 1;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.probable_price_of_allotment[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.volume[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_selling_price[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> pricevolume_indicator_message_record.best_purchasing_price[pricevolume_indicator_message_at] = wire[at]; at = at + 1; pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_record.type_of_cross_trading = wire[at]; at = at + 1;
  skip
}

/* what was read of Pricevolume Indicator Message is what was written, byte for byte */
inline equal_pricevolume_indicator_message(pricevolume_indicator_message_read, pricevolume_indicator_message_written) {
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 4 -> assert(pricevolume_indicator_message_read.instrument_number[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.instrument_number[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  assert(pricevolume_indicator_message_read.origin == pricevolume_indicator_message_written.origin);
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.probable_price_of_allotment[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.probable_price_of_allotment[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.volume[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.volume[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.best_selling_price[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.best_selling_price[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  pricevolume_indicator_message_at = 0;
  do
  :: pricevolume_indicator_message_at < 8 -> assert(pricevolume_indicator_message_read.best_purchasing_price[pricevolume_indicator_message_at] == pricevolume_indicator_message_written.best_purchasing_price[pricevolume_indicator_message_at]); pricevolume_indicator_message_at = pricevolume_indicator_message_at + 1
  :: else -> break
  od;
  assert(pricevolume_indicator_message_read.type_of_cross_trading == pricevolume_indicator_message_written.type_of_cross_trading);
  skip
}

/* ---- Consolidated Execution Of Orders Message: 52 bytes ---------------------- */

/* The message is published when there is a term matching or closing in the electronic system of the BMV or BIVA. */
typedef ConsolidatedExecutionOfOrdersMessage {
  byte instrument_number[4];
  byte origin;
  byte date[8];
  byte consecutive_number[8];
  byte volume[8];
  byte consecutive_number_of_the_trade[8];
  byte execution_price[8];
  byte indicator;
  byte sets_price;
  byte participant[5]
};

int consolidated_execution_of_orders_message_at;

/* every byte of Consolidated Execution Of Orders Message set to one value */
inline fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record, consolidated_execution_of_orders_message_value) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.origin = consolidated_execution_of_orders_message_value;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.volume[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.indicator = consolidated_execution_of_orders_message_value;
  consolidated_execution_of_orders_message_record.sets_price = consolidated_execution_of_orders_message_value;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at] = consolidated_execution_of_orders_message_value; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Execution Of Orders Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record, consolidated_execution_of_orders_message_base) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 0 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.origin = (consolidated_execution_of_orders_message_base + 4 + 1) % 256;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 5 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 13 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.volume[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 21 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 29 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 37 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.indicator = (consolidated_execution_of_orders_message_base + 45 + 1) % 256;
  consolidated_execution_of_orders_message_record.sets_price = (consolidated_execution_of_orders_message_base + 46 + 1) % 256;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at] = (consolidated_execution_of_orders_message_base + 47 + consolidated_execution_of_orders_message_at + 1) % 256; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Execution Of Orders Message to the wire, 52 bytes from where the cursor stands */
inline encode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> wire[at] = consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_execution_of_orders_message_record.origin; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.volume[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> wire[at] = consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_execution_of_orders_message_record.indicator; at = at + 1;
  wire[at] = consolidated_execution_of_orders_message_record.sets_price; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> wire[at] = consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Execution Of Orders Message off the wire, 52 bytes from where the cursor stands */
inline decode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_record) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> consolidated_execution_of_orders_message_record.instrument_number[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.origin = wire[at]; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.date[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.volume[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> consolidated_execution_of_orders_message_record.execution_price[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_record.indicator = wire[at]; at = at + 1;
  consolidated_execution_of_orders_message_record.sets_price = wire[at]; at = at + 1;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> consolidated_execution_of_orders_message_record.participant[consolidated_execution_of_orders_message_at] = wire[at]; at = at + 1; consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Execution Of Orders Message is what was written, byte for byte */
inline equal_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_read, consolidated_execution_of_orders_message_written) {
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 4 -> assert(consolidated_execution_of_orders_message_read.instrument_number[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.instrument_number[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  assert(consolidated_execution_of_orders_message_read.origin == consolidated_execution_of_orders_message_written.origin);
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.date[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.date[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.consecutive_number[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.consecutive_number[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.volume[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.volume[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.consecutive_number_of_the_trade[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 8 -> assert(consolidated_execution_of_orders_message_read.execution_price[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.execution_price[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  assert(consolidated_execution_of_orders_message_read.indicator == consolidated_execution_of_orders_message_written.indicator);
  assert(consolidated_execution_of_orders_message_read.sets_price == consolidated_execution_of_orders_message_written.sets_price);
  consolidated_execution_of_orders_message_at = 0;
  do
  :: consolidated_execution_of_orders_message_at < 5 -> assert(consolidated_execution_of_orders_message_read.participant[consolidated_execution_of_orders_message_at] == consolidated_execution_of_orders_message_written.participant[consolidated_execution_of_orders_message_at]); consolidated_execution_of_orders_message_at = consolidated_execution_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Registration Of Order Message: 43 bytes --------------------------------- */

/* When the order is accepted by the central system of the BMV or BIVA, this message is sent to the appropriate media. */
typedef RegistrationOfOrderMessage {
  byte instrument_number[4];
  byte origin;
  byte date_and_time[8];
  byte consecutive_number[8];
  byte direction;
  byte volume[8];
  byte price[8];
  byte participant[5]
};

int registration_of_order_message_at;

/* every byte of Registration Of Order Message set to one value */
inline fill_registration_of_order_message(registration_of_order_message_record, registration_of_order_message_value) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> registration_of_order_message_record.instrument_number[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.origin = registration_of_order_message_value;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.date_and_time[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.consecutive_number[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.direction = registration_of_order_message_value;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.volume[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.price[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> registration_of_order_message_record.participant[registration_of_order_message_at] = registration_of_order_message_value; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Registration Of Order Message set to where it lies, so a field read out of place says so */
inline ramp_registration_of_order_message(registration_of_order_message_record, registration_of_order_message_base) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> registration_of_order_message_record.instrument_number[registration_of_order_message_at] = (registration_of_order_message_base + 0 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.origin = (registration_of_order_message_base + 4 + 1) % 256;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.date_and_time[registration_of_order_message_at] = (registration_of_order_message_base + 5 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.consecutive_number[registration_of_order_message_at] = (registration_of_order_message_base + 13 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.direction = (registration_of_order_message_base + 21 + 1) % 256;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.volume[registration_of_order_message_at] = (registration_of_order_message_base + 22 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.price[registration_of_order_message_at] = (registration_of_order_message_base + 30 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> registration_of_order_message_record.participant[registration_of_order_message_at] = (registration_of_order_message_base + 38 + registration_of_order_message_at + 1) % 256; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Registration Of Order Message to the wire, 43 bytes from where the cursor stands */
inline encode_registration_of_order_message(registration_of_order_message_record) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> wire[at] = registration_of_order_message_record.instrument_number[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  wire[at] = registration_of_order_message_record.origin; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.date_and_time[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.consecutive_number[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  wire[at] = registration_of_order_message_record.direction; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.volume[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> wire[at] = registration_of_order_message_record.price[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> wire[at] = registration_of_order_message_record.participant[registration_of_order_message_at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Registration Of Order Message off the wire, 43 bytes from where the cursor stands */
inline decode_registration_of_order_message(registration_of_order_message_record) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> registration_of_order_message_record.instrument_number[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.origin = wire[at]; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.date_and_time[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.consecutive_number[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_record.direction = wire[at]; at = at + 1;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.volume[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> registration_of_order_message_record.price[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> registration_of_order_message_record.participant[registration_of_order_message_at] = wire[at]; at = at + 1; registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Registration Of Order Message is what was written, byte for byte */
inline equal_registration_of_order_message(registration_of_order_message_read, registration_of_order_message_written) {
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 4 -> assert(registration_of_order_message_read.instrument_number[registration_of_order_message_at] == registration_of_order_message_written.instrument_number[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  assert(registration_of_order_message_read.origin == registration_of_order_message_written.origin);
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.date_and_time[registration_of_order_message_at] == registration_of_order_message_written.date_and_time[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.consecutive_number[registration_of_order_message_at] == registration_of_order_message_written.consecutive_number[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  assert(registration_of_order_message_read.direction == registration_of_order_message_written.direction);
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.volume[registration_of_order_message_at] == registration_of_order_message_written.volume[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 8 -> assert(registration_of_order_message_read.price[registration_of_order_message_at] == registration_of_order_message_written.price[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  registration_of_order_message_at = 0;
  do
  :: registration_of_order_message_at < 5 -> assert(registration_of_order_message_read.participant[registration_of_order_message_at] == registration_of_order_message_written.participant[registration_of_order_message_at]); registration_of_order_message_at = registration_of_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancellations Of Orders Message: 21 bytes ------------------------------- */

/* This message deletes the trading floor order. */
typedef CancellationsOfOrdersMessage {
  byte instrument_number[4];
  byte origin;
  byte date[8];
  byte consecutive_number[8]
};

int cancellations_of_orders_message_at;

/* every byte of Cancellations Of Orders Message set to one value */
inline fill_cancellations_of_orders_message(cancellations_of_orders_message_record, cancellations_of_orders_message_value) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at] = cancellations_of_orders_message_value; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_record.origin = cancellations_of_orders_message_value;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.date[cancellations_of_orders_message_at] = cancellations_of_orders_message_value; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at] = cancellations_of_orders_message_value; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancellations Of Orders Message set to where it lies, so a field read out of place says so */
inline ramp_cancellations_of_orders_message(cancellations_of_orders_message_record, cancellations_of_orders_message_base) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at] = (cancellations_of_orders_message_base + 0 + cancellations_of_orders_message_at + 1) % 256; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_record.origin = (cancellations_of_orders_message_base + 4 + 1) % 256;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.date[cancellations_of_orders_message_at] = (cancellations_of_orders_message_base + 5 + cancellations_of_orders_message_at + 1) % 256; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at] = (cancellations_of_orders_message_base + 13 + cancellations_of_orders_message_at + 1) % 256; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancellations Of Orders Message to the wire, 21 bytes from where the cursor stands */
inline encode_cancellations_of_orders_message(cancellations_of_orders_message_record) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> wire[at] = cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  wire[at] = cancellations_of_orders_message_record.origin; at = at + 1;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> wire[at] = cancellations_of_orders_message_record.date[cancellations_of_orders_message_at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> wire[at] = cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancellations Of Orders Message off the wire, 21 bytes from where the cursor stands */
inline decode_cancellations_of_orders_message(cancellations_of_orders_message_record) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> cancellations_of_orders_message_record.instrument_number[cancellations_of_orders_message_at] = wire[at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_record.origin = wire[at]; at = at + 1;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.date[cancellations_of_orders_message_at] = wire[at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> cancellations_of_orders_message_record.consecutive_number[cancellations_of_orders_message_at] = wire[at]; at = at + 1; cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancellations Of Orders Message is what was written, byte for byte */
inline equal_cancellations_of_orders_message(cancellations_of_orders_message_read, cancellations_of_orders_message_written) {
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 4 -> assert(cancellations_of_orders_message_read.instrument_number[cancellations_of_orders_message_at] == cancellations_of_orders_message_written.instrument_number[cancellations_of_orders_message_at]); cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  assert(cancellations_of_orders_message_read.origin == cancellations_of_orders_message_written.origin);
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> assert(cancellations_of_orders_message_read.date[cancellations_of_orders_message_at] == cancellations_of_orders_message_written.date[cancellations_of_orders_message_at]); cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
  :: else -> break
  od;
  cancellations_of_orders_message_at = 0;
  do
  :: cancellations_of_orders_message_at < 8 -> assert(cancellations_of_orders_message_read.consecutive_number[cancellations_of_orders_message_at] == cancellations_of_orders_message_written.consecutive_number[cancellations_of_orders_message_at]); cancellations_of_orders_message_at = cancellations_of_orders_message_at + 1
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

/* Mutual Funds Trades Message: encoded, read back, and compared */
proctype check_mutual_funds_trades_message() {
  MutualFundsTradesMessage mutual_funds_trades_message_sent;
  MutualFundsTradesMessage mutual_funds_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mutual_funds_trades_message(mutual_funds_trades_message_sent, 0)
  :: pattern == 1 -> fill_mutual_funds_trades_message(mutual_funds_trades_message_sent, 32)
  :: pattern == 2 -> fill_mutual_funds_trades_message(mutual_funds_trades_message_sent, 255)
  :: else -> ramp_mutual_funds_trades_message(mutual_funds_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mutual_funds_trades_message(mutual_funds_trades_message_sent);
    assert(at == 53);
    at = 0;
    decode_mutual_funds_trades_message(mutual_funds_trades_message_got);
    assert(at == 53);
    equal_mutual_funds_trades_message(mutual_funds_trades_message_got, mutual_funds_trades_message_sent)
  }
}

/* Opening Of Continuous Auctions Message: encoded, read back, and compared */
proctype check_opening_of_continuous_auctions_message() {
  OpeningOfContinuousAuctionsMessage opening_of_continuous_auctions_message_sent;
  OpeningOfContinuousAuctionsMessage opening_of_continuous_auctions_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 0)
  :: pattern == 1 -> fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 32)
  :: pattern == 2 -> fill_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 255)
  :: else -> ramp_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_sent);
    assert(at == 21);
    at = 0;
    decode_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_got);
    assert(at == 21);
    equal_opening_of_continuous_auctions_message(opening_of_continuous_auctions_message_got, opening_of_continuous_auctions_message_sent)
  }
}

/* Existence Of Bids At Mid Price Message: encoded, read back, and compared */
proctype check_existence_of_bids_at_mid_price_message() {
  ExistenceOfBidsAtMidPriceMessage existence_of_bids_at_mid_price_message_sent;
  ExistenceOfBidsAtMidPriceMessage existence_of_bids_at_mid_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 0)
  :: pattern == 1 -> fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 32)
  :: pattern == 2 -> fill_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 255)
  :: else -> ramp_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_sent);
    assert(at == 6);
    at = 0;
    decode_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_got);
    assert(at == 6);
    equal_existence_of_bids_at_mid_price_message(existence_of_bids_at_mid_price_message_got, existence_of_bids_at_mid_price_message_sent)
  }
}

/* Catalogue Of Debt And Metals Instruments Message: encoded, read back, and compared */
proctype check_catalogue_of_debt_and_metals_instruments_message() {
  CatalogueOfDebtAndMetalsInstrumentsMessage catalogue_of_debt_and_metals_instruments_message_sent;
  CatalogueOfDebtAndMetalsInstrumentsMessage catalogue_of_debt_and_metals_instruments_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 0)
  :: pattern == 1 -> fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 32)
  :: pattern == 2 -> fill_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 255)
  :: else -> ramp_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_sent);
    assert(at == 103);
    at = 0;
    decode_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_got);
    assert(at == 103);
    equal_catalogue_of_debt_and_metals_instruments_message(catalogue_of_debt_and_metals_instruments_message_got, catalogue_of_debt_and_metals_instruments_message_sent)
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
    assert(at == 78);
    at = 0;
    decode_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_got);
    assert(at == 78);
    equal_catalog_sent_for_instruments_belonging_to_mutual_funds_message(catalog_sent_for_instruments_belonging_to_mutual_funds_message_got, catalog_sent_for_instruments_belonging_to_mutual_funds_message_sent)
  }
}

/* Weighted Average Price Message: encoded, read back, and compared */
proctype check_weighted_average_price_message() {
  WeightedAveragePriceMessage weighted_average_price_message_sent;
  WeightedAveragePriceMessage weighted_average_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_average_price_message(weighted_average_price_message_sent, 0)
  :: pattern == 1 -> fill_weighted_average_price_message(weighted_average_price_message_sent, 32)
  :: pattern == 2 -> fill_weighted_average_price_message(weighted_average_price_message_sent, 255)
  :: else -> ramp_weighted_average_price_message(weighted_average_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_average_price_message(weighted_average_price_message_sent);
    assert(at == 21);
    at = 0;
    decode_weighted_average_price_message(weighted_average_price_message_got);
    assert(at == 21);
    equal_weighted_average_price_message(weighted_average_price_message_got, weighted_average_price_message_sent)
  }
}

/* System Events Message: encoded, read back, and compared */
proctype check_system_events_message() {
  SystemEventsMessage system_events_message_sent;
  SystemEventsMessage system_events_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_events_message(system_events_message_sent, 0)
  :: pattern == 1 -> fill_system_events_message(system_events_message_sent, 32)
  :: pattern == 2 -> fill_system_events_message(system_events_message_sent, 255)
  :: else -> ramp_system_events_message(system_events_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_events_message(system_events_message_sent);
    assert(at == 31);
    at = 0;
    decode_system_events_message(system_events_message_got);
    assert(at == 31);
    equal_system_events_message(system_events_message_got, system_events_message_sent)
  }
}

/* Reference Price Message: encoded, read back, and compared */
proctype check_reference_price_message() {
  ReferencePriceMessage reference_price_message_sent;
  ReferencePriceMessage reference_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reference_price_message(reference_price_message_sent, 0)
  :: pattern == 1 -> fill_reference_price_message(reference_price_message_sent, 32)
  :: pattern == 2 -> fill_reference_price_message(reference_price_message_sent, 255)
  :: else -> ramp_reference_price_message(reference_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reference_price_message(reference_price_message_sent);
    assert(at == 14);
    at = 0;
    decode_reference_price_message(reference_price_message_got);
    assert(at == 14);
    equal_reference_price_message(reference_price_message_got, reference_price_message_sent)
  }
}

/* Changes In Status Message: encoded, read back, and compared */
proctype check_changes_in_status_message() {
  ChangesInStatusMessage changes_in_status_message_sent;
  ChangesInStatusMessage changes_in_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_changes_in_status_message(changes_in_status_message_sent, 0)
  :: pattern == 1 -> fill_changes_in_status_message(changes_in_status_message_sent, 32)
  :: pattern == 2 -> fill_changes_in_status_message(changes_in_status_message_sent, 255)
  :: else -> ramp_changes_in_status_message(changes_in_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_changes_in_status_message(changes_in_status_message_sent);
    assert(at == 7);
    at = 0;
    decode_changes_in_status_message(changes_in_status_message_got);
    assert(at == 7);
    equal_changes_in_status_message(changes_in_status_message_got, changes_in_status_message_sent)
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
    assert(at == 66);
    at = 0;
    decode_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got);
    assert(at == 66);
    equal_catalog_for_instruments_belonging_to_the_capital_warrants_market_message(catalog_for_instruments_belonging_to_the_capital_warrants_market_message_got, catalog_for_instruments_belonging_to_the_capital_warrants_market_message_sent)
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
    assert(at == 82);
    at = 0;
    decode_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_got);
    assert(at == 82);
    equal_catalog_sent_for_instruments_belonging_to_capital_tracs_message(catalog_sent_for_instruments_belonging_to_capital_tracs_message_got, catalog_sent_for_instruments_belonging_to_capital_tracs_message_sent)
  }
}

/* Consolidated Inav Message: encoded, read back, and compared */
proctype check_consolidated_inav_message() {
  ConsolidatedInavMessage consolidated_inav_message_sent;
  ConsolidatedInavMessage consolidated_inav_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_inav_message(consolidated_inav_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_inav_message(consolidated_inav_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_inav_message(consolidated_inav_message_sent, 255)
  :: else -> ramp_consolidated_inav_message(consolidated_inav_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_inav_message(consolidated_inav_message_sent);
    assert(at == 13);
    at = 0;
    decode_consolidated_inav_message(consolidated_inav_message_got);
    assert(at == 13);
    equal_consolidated_inav_message(consolidated_inav_message_got, consolidated_inav_message_sent)
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
    assert(at == 73);
    at = 0;
    decode_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got);
    assert(at == 73);
    equal_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau(catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_got, catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau_sent)
  }
}

/* Probable Price Of Allocation Message: encoded, read back, and compared */
proctype check_probable_price_of_allocation_message() {
  ProbablePriceOfAllocationMessage probable_price_of_allocation_message_sent;
  ProbablePriceOfAllocationMessage probable_price_of_allocation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 0)
  :: pattern == 1 -> fill_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 32)
  :: pattern == 2 -> fill_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 255)
  :: else -> ramp_probable_price_of_allocation_message(probable_price_of_allocation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_probable_price_of_allocation_message(probable_price_of_allocation_message_sent);
    assert(at == 21);
    at = 0;
    decode_probable_price_of_allocation_message(probable_price_of_allocation_message_got);
    assert(at == 21);
    equal_probable_price_of_allocation_message(probable_price_of_allocation_message_got, probable_price_of_allocation_message_sent)
  }
}

/* Relation Between Bmvbiva Instruments Message: encoded, read back, and compared */
proctype check_relation_between_bmvbiva_instruments_message() {
  RelationBetweenBmvbivaInstrumentsMessage relation_between_bmvbiva_instruments_message_sent;
  RelationBetweenBmvbivaInstrumentsMessage relation_between_bmvbiva_instruments_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 0)
  :: pattern == 1 -> fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 32)
  :: pattern == 2 -> fill_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 255)
  :: else -> ramp_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_sent);
    assert(at == 9);
    at = 0;
    decode_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_got);
    assert(at == 9);
    equal_relation_between_bmvbiva_instruments_message(relation_between_bmvbiva_instruments_message_got, relation_between_bmvbiva_instruments_message_sent)
  }
}

/* Equities Market Trades Message: encoded, read back, and compared */
proctype check_equities_market_trades_message() {
  EquitiesMarketTradesMessage equities_market_trades_message_sent;
  EquitiesMarketTradesMessage equities_market_trades_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equities_market_trades_message(equities_market_trades_message_sent, 0)
  :: pattern == 1 -> fill_equities_market_trades_message(equities_market_trades_message_sent, 32)
  :: pattern == 2 -> fill_equities_market_trades_message(equities_market_trades_message_sent, 255)
  :: else -> ramp_equities_market_trades_message(equities_market_trades_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equities_market_trades_message(equities_market_trades_message_sent);
    assert(at == 61);
    at = 0;
    decode_equities_market_trades_message(equities_market_trades_message_got);
    assert(at == 61);
    equal_equities_market_trades_message(equities_market_trades_message_got, equities_market_trades_message_sent)
  }
}

/* Consolidated Trade Cancellation Message: encoded, read back, and compared */
proctype check_consolidated_trade_cancellation_message() {
  ConsolidatedTradeCancellationMessage consolidated_trade_cancellation_message_sent;
  ConsolidatedTradeCancellationMessage consolidated_trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 255)
  :: else -> ramp_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_sent);
    assert(at == 13);
    at = 0;
    decode_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_got);
    assert(at == 13);
    equal_consolidated_trade_cancellation_message(consolidated_trade_cancellation_message_got, consolidated_trade_cancellation_message_sent)
  }
}

/* Pricevolume Indicator Message: encoded, read back, and compared */
proctype check_pricevolume_indicator_message() {
  PricevolumeIndicatorMessage pricevolume_indicator_message_sent;
  PricevolumeIndicatorMessage pricevolume_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pricevolume_indicator_message(pricevolume_indicator_message_sent, 0)
  :: pattern == 1 -> fill_pricevolume_indicator_message(pricevolume_indicator_message_sent, 32)
  :: pattern == 2 -> fill_pricevolume_indicator_message(pricevolume_indicator_message_sent, 255)
  :: else -> ramp_pricevolume_indicator_message(pricevolume_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pricevolume_indicator_message(pricevolume_indicator_message_sent);
    assert(at == 38);
    at = 0;
    decode_pricevolume_indicator_message(pricevolume_indicator_message_got);
    assert(at == 38);
    equal_pricevolume_indicator_message(pricevolume_indicator_message_got, pricevolume_indicator_message_sent)
  }
}

/* Consolidated Execution Of Orders Message: encoded, read back, and compared */
proctype check_consolidated_execution_of_orders_message() {
  ConsolidatedExecutionOfOrdersMessage consolidated_execution_of_orders_message_sent;
  ConsolidatedExecutionOfOrdersMessage consolidated_execution_of_orders_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 255)
  :: else -> ramp_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_sent);
    assert(at == 52);
    at = 0;
    decode_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_got);
    assert(at == 52);
    equal_consolidated_execution_of_orders_message(consolidated_execution_of_orders_message_got, consolidated_execution_of_orders_message_sent)
  }
}

/* Registration Of Order Message: encoded, read back, and compared */
proctype check_registration_of_order_message() {
  RegistrationOfOrderMessage registration_of_order_message_sent;
  RegistrationOfOrderMessage registration_of_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_registration_of_order_message(registration_of_order_message_sent, 0)
  :: pattern == 1 -> fill_registration_of_order_message(registration_of_order_message_sent, 32)
  :: pattern == 2 -> fill_registration_of_order_message(registration_of_order_message_sent, 255)
  :: else -> ramp_registration_of_order_message(registration_of_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_registration_of_order_message(registration_of_order_message_sent);
    assert(at == 43);
    at = 0;
    decode_registration_of_order_message(registration_of_order_message_got);
    assert(at == 43);
    equal_registration_of_order_message(registration_of_order_message_got, registration_of_order_message_sent)
  }
}

/* Cancellations Of Orders Message: encoded, read back, and compared */
proctype check_cancellations_of_orders_message() {
  CancellationsOfOrdersMessage cancellations_of_orders_message_sent;
  CancellationsOfOrdersMessage cancellations_of_orders_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancellations_of_orders_message(cancellations_of_orders_message_sent, 0)
  :: pattern == 1 -> fill_cancellations_of_orders_message(cancellations_of_orders_message_sent, 32)
  :: pattern == 2 -> fill_cancellations_of_orders_message(cancellations_of_orders_message_sent, 255)
  :: else -> ramp_cancellations_of_orders_message(cancellations_of_orders_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancellations_of_orders_message(cancellations_of_orders_message_sent);
    assert(at == 21);
    at = 0;
    decode_cancellations_of_orders_message(cancellations_of_orders_message_got);
    assert(at == 21);
    equal_cancellations_of_orders_message(cancellations_of_orders_message_got, cancellations_of_orders_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_mutual_funds_trades_message()
  :: run check_opening_of_continuous_auctions_message()
  :: run check_existence_of_bids_at_mid_price_message()
  :: run check_catalogue_of_debt_and_metals_instruments_message()
  :: run check_catalog_sent_for_instruments_belonging_to_mutual_funds_message()
  :: run check_weighted_average_price_message()
  :: run check_system_events_message()
  :: run check_reference_price_message()
  :: run check_changes_in_status_message()
  :: run check_catalog_for_instruments_belonging_to_the_capital_warrants_market_message()
  :: run check_catalog_sent_for_instruments_belonging_to_capital_tracs_message()
  :: run check_consolidated_inav_message()
  :: run check_catalog_for_instruments_belonging_to_the_local_and_global_stock_mar_gc6yau()
  :: run check_probable_price_of_allocation_message()
  :: run check_relation_between_bmvbiva_instruments_message()
  :: run check_equities_market_trades_message()
  :: run check_consolidated_trade_cancellation_message()
  :: run check_pricevolume_indicator_message()
  :: run check_consolidated_execution_of_orders_message()
  :: run check_registration_of_order_message()
  :: run check_cancellations_of_orders_message()
  fi
}
