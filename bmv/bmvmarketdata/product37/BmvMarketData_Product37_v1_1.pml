/*
 * Bolsa Mexicana de Valores Bmv Market Data Product 37
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
#define WIRE 42

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

/* ---- Order Adition Message: 35 bytes ----------------------------------------- */

/* When the order is accepted by the BMV central system, this message is disseminated to the relevant media. */
typedef OrderAditionMessage {
  byte id_instrument[4];
  byte date_and_hour[8];
  byte folio[4];
  byte direction;
  byte volume[4];
  byte price[8];
  byte participant[5];
  byte operation_type
};

int order_adition_message_at;

/* every byte of Order Adition Message set to one value */
inline fill_order_adition_message(order_adition_message_record, order_adition_message_value) {
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.id_instrument[order_adition_message_at] = order_adition_message_value; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> order_adition_message_record.date_and_hour[order_adition_message_at] = order_adition_message_value; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.folio[order_adition_message_at] = order_adition_message_value; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_record.direction = order_adition_message_value;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.volume[order_adition_message_at] = order_adition_message_value; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> order_adition_message_record.price[order_adition_message_at] = order_adition_message_value; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 5 -> order_adition_message_record.participant[order_adition_message_at] = order_adition_message_value; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_record.operation_type = order_adition_message_value;
  skip
}

/* each byte of Order Adition Message set to where it lies, so a field read out of place says so */
inline ramp_order_adition_message(order_adition_message_record, order_adition_message_base) {
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.id_instrument[order_adition_message_at] = (order_adition_message_base + 0 + order_adition_message_at + 1) % 256; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> order_adition_message_record.date_and_hour[order_adition_message_at] = (order_adition_message_base + 4 + order_adition_message_at + 1) % 256; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.folio[order_adition_message_at] = (order_adition_message_base + 12 + order_adition_message_at + 1) % 256; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_record.direction = (order_adition_message_base + 16 + 1) % 256;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.volume[order_adition_message_at] = (order_adition_message_base + 17 + order_adition_message_at + 1) % 256; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> order_adition_message_record.price[order_adition_message_at] = (order_adition_message_base + 21 + order_adition_message_at + 1) % 256; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 5 -> order_adition_message_record.participant[order_adition_message_at] = (order_adition_message_base + 29 + order_adition_message_at + 1) % 256; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_record.operation_type = (order_adition_message_base + 34 + 1) % 256;
  skip
}

/* Order Adition Message to the wire, 35 bytes from where the cursor stands */
inline encode_order_adition_message(order_adition_message_record) {
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> wire[at] = order_adition_message_record.id_instrument[order_adition_message_at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> wire[at] = order_adition_message_record.date_and_hour[order_adition_message_at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> wire[at] = order_adition_message_record.folio[order_adition_message_at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  wire[at] = order_adition_message_record.direction; at = at + 1;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> wire[at] = order_adition_message_record.volume[order_adition_message_at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> wire[at] = order_adition_message_record.price[order_adition_message_at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 5 -> wire[at] = order_adition_message_record.participant[order_adition_message_at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  wire[at] = order_adition_message_record.operation_type; at = at + 1;
  skip
}

/* Order Adition Message off the wire, 35 bytes from where the cursor stands */
inline decode_order_adition_message(order_adition_message_record) {
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.id_instrument[order_adition_message_at] = wire[at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> order_adition_message_record.date_and_hour[order_adition_message_at] = wire[at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.folio[order_adition_message_at] = wire[at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_record.direction = wire[at]; at = at + 1;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> order_adition_message_record.volume[order_adition_message_at] = wire[at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> order_adition_message_record.price[order_adition_message_at] = wire[at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 5 -> order_adition_message_record.participant[order_adition_message_at] = wire[at]; at = at + 1; order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_record.operation_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Adition Message is what was written, byte for byte */
inline equal_order_adition_message(order_adition_message_read, order_adition_message_written) {
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> assert(order_adition_message_read.id_instrument[order_adition_message_at] == order_adition_message_written.id_instrument[order_adition_message_at]); order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> assert(order_adition_message_read.date_and_hour[order_adition_message_at] == order_adition_message_written.date_and_hour[order_adition_message_at]); order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> assert(order_adition_message_read.folio[order_adition_message_at] == order_adition_message_written.folio[order_adition_message_at]); order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  assert(order_adition_message_read.direction == order_adition_message_written.direction);
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 4 -> assert(order_adition_message_read.volume[order_adition_message_at] == order_adition_message_written.volume[order_adition_message_at]); order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 8 -> assert(order_adition_message_read.price[order_adition_message_at] == order_adition_message_written.price[order_adition_message_at]); order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  order_adition_message_at = 0;
  do
  :: order_adition_message_at < 5 -> assert(order_adition_message_read.participant[order_adition_message_at] == order_adition_message_written.participant[order_adition_message_at]); order_adition_message_at = order_adition_message_at + 1
  :: else -> break
  od;
  assert(order_adition_message_read.operation_type == order_adition_message_written.operation_type);
  skip
}

/* ---- Execution Of Orders Message: 33 bytes ----------------------------------- */

/* The message is disseminated as soon as there is a match in the BMV's electronic system. */
typedef ExecutionOfOrdersMessage {
  byte id_instrument[4];
  byte date[8];
  byte folio[4];
  byte volume[4];
  byte trade_number[4];
  byte execution_price[8];
  byte operation_type
};

int execution_of_orders_message_at;

/* every byte of Execution Of Orders Message set to one value */
inline fill_execution_of_orders_message(execution_of_orders_message_record, execution_of_orders_message_value) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.id_instrument[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.date[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.folio[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.volume[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.trade_number[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.execution_price[execution_of_orders_message_at] = execution_of_orders_message_value; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_record.operation_type = execution_of_orders_message_value;
  skip
}

/* each byte of Execution Of Orders Message set to where it lies, so a field read out of place says so */
inline ramp_execution_of_orders_message(execution_of_orders_message_record, execution_of_orders_message_base) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.id_instrument[execution_of_orders_message_at] = (execution_of_orders_message_base + 0 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.date[execution_of_orders_message_at] = (execution_of_orders_message_base + 4 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.folio[execution_of_orders_message_at] = (execution_of_orders_message_base + 12 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.volume[execution_of_orders_message_at] = (execution_of_orders_message_base + 16 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.trade_number[execution_of_orders_message_at] = (execution_of_orders_message_base + 20 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.execution_price[execution_of_orders_message_at] = (execution_of_orders_message_base + 24 + execution_of_orders_message_at + 1) % 256; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_record.operation_type = (execution_of_orders_message_base + 32 + 1) % 256;
  skip
}

/* Execution Of Orders Message to the wire, 33 bytes from where the cursor stands */
inline encode_execution_of_orders_message(execution_of_orders_message_record) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.id_instrument[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> wire[at] = execution_of_orders_message_record.date[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.folio[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.volume[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> wire[at] = execution_of_orders_message_record.trade_number[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> wire[at] = execution_of_orders_message_record.execution_price[execution_of_orders_message_at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_of_orders_message_record.operation_type; at = at + 1;
  skip
}

/* Execution Of Orders Message off the wire, 33 bytes from where the cursor stands */
inline decode_execution_of_orders_message(execution_of_orders_message_record) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.id_instrument[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.date[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.folio[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.volume[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> execution_of_orders_message_record.trade_number[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> execution_of_orders_message_record.execution_price[execution_of_orders_message_at] = wire[at]; at = at + 1; execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_record.operation_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Execution Of Orders Message is what was written, byte for byte */
inline equal_execution_of_orders_message(execution_of_orders_message_read, execution_of_orders_message_written) {
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.id_instrument[execution_of_orders_message_at] == execution_of_orders_message_written.id_instrument[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> assert(execution_of_orders_message_read.date[execution_of_orders_message_at] == execution_of_orders_message_written.date[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.folio[execution_of_orders_message_at] == execution_of_orders_message_written.folio[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.volume[execution_of_orders_message_at] == execution_of_orders_message_written.volume[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 4 -> assert(execution_of_orders_message_read.trade_number[execution_of_orders_message_at] == execution_of_orders_message_written.trade_number[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  execution_of_orders_message_at = 0;
  do
  :: execution_of_orders_message_at < 8 -> assert(execution_of_orders_message_read.execution_price[execution_of_orders_message_at] == execution_of_orders_message_written.execution_price[execution_of_orders_message_at]); execution_of_orders_message_at = execution_of_orders_message_at + 1
  :: else -> break
  od;
  assert(execution_of_orders_message_read.operation_type == execution_of_orders_message_written.operation_type);
  skip
}

/* ---- Order Cancellation Message: 17 bytes ------------------------------------ */

/* This message indicates the fully elimination of an order in the trading floor */
typedef OrderCancellationMessage {
  byte id_instrument[4];
  byte date[8];
  byte folio[4];
  byte operation_type
};

int order_cancellation_message_at;

/* every byte of Order Cancellation Message set to one value */
inline fill_order_cancellation_message(order_cancellation_message_record, order_cancellation_message_value) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.id_instrument[order_cancellation_message_at] = order_cancellation_message_value; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> order_cancellation_message_record.date[order_cancellation_message_at] = order_cancellation_message_value; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.folio[order_cancellation_message_at] = order_cancellation_message_value; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_record.operation_type = order_cancellation_message_value;
  skip
}

/* each byte of Order Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation_message(order_cancellation_message_record, order_cancellation_message_base) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.id_instrument[order_cancellation_message_at] = (order_cancellation_message_base + 0 + order_cancellation_message_at + 1) % 256; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> order_cancellation_message_record.date[order_cancellation_message_at] = (order_cancellation_message_base + 4 + order_cancellation_message_at + 1) % 256; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.folio[order_cancellation_message_at] = (order_cancellation_message_base + 12 + order_cancellation_message_at + 1) % 256; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_record.operation_type = (order_cancellation_message_base + 16 + 1) % 256;
  skip
}

/* Order Cancellation Message to the wire, 17 bytes from where the cursor stands */
inline encode_order_cancellation_message(order_cancellation_message_record) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> wire[at] = order_cancellation_message_record.id_instrument[order_cancellation_message_at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> wire[at] = order_cancellation_message_record.date[order_cancellation_message_at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> wire[at] = order_cancellation_message_record.folio[order_cancellation_message_at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancellation_message_record.operation_type; at = at + 1;
  skip
}

/* Order Cancellation Message off the wire, 17 bytes from where the cursor stands */
inline decode_order_cancellation_message(order_cancellation_message_record) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.id_instrument[order_cancellation_message_at] = wire[at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> order_cancellation_message_record.date[order_cancellation_message_at] = wire[at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> order_cancellation_message_record.folio[order_cancellation_message_at] = wire[at]; at = at + 1; order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_record.operation_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancellation Message is what was written, byte for byte */
inline equal_order_cancellation_message(order_cancellation_message_read, order_cancellation_message_written) {
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> assert(order_cancellation_message_read.id_instrument[order_cancellation_message_at] == order_cancellation_message_written.id_instrument[order_cancellation_message_at]); order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 8 -> assert(order_cancellation_message_read.date[order_cancellation_message_at] == order_cancellation_message_written.date[order_cancellation_message_at]); order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  order_cancellation_message_at = 0;
  do
  :: order_cancellation_message_at < 4 -> assert(order_cancellation_message_read.folio[order_cancellation_message_at] == order_cancellation_message_written.folio[order_cancellation_message_at]); order_cancellation_message_at = order_cancellation_message_at + 1
  :: else -> break
  od;
  assert(order_cancellation_message_read.operation_type == order_cancellation_message_written.operation_type);
  skip
}

/* ---- Order Change Message: 42 bytes ------------------------------------------ */

/* Message sent when the order modifies any of its data, the system assigns it a new priority in the electronic book, the order to be replaced is identified with the original Instrument, Date, and Folio, and the new priority assignment in the electronic book appears in the New Date and Folio fields. */
typedef OrderChangeMessage {
  byte id_instrument[4];
  byte original_date[8];
  byte original_folio[4];
  byte new_date[8];
  byte new_folio[4];
  byte direction;
  byte volume[4];
  byte price[8];
  byte operation_type
};

int order_change_message_at;

/* every byte of Order Change Message set to one value */
inline fill_order_change_message(order_change_message_record, order_change_message_value) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.id_instrument[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.original_date[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.original_folio[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.new_date[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.new_folio[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.direction = order_change_message_value;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.volume[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.price[order_change_message_at] = order_change_message_value; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.operation_type = order_change_message_value;
  skip
}

/* each byte of Order Change Message set to where it lies, so a field read out of place says so */
inline ramp_order_change_message(order_change_message_record, order_change_message_base) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.id_instrument[order_change_message_at] = (order_change_message_base + 0 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.original_date[order_change_message_at] = (order_change_message_base + 4 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.original_folio[order_change_message_at] = (order_change_message_base + 12 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.new_date[order_change_message_at] = (order_change_message_base + 16 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.new_folio[order_change_message_at] = (order_change_message_base + 24 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.direction = (order_change_message_base + 28 + 1) % 256;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.volume[order_change_message_at] = (order_change_message_base + 29 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.price[order_change_message_at] = (order_change_message_base + 33 + order_change_message_at + 1) % 256; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.operation_type = (order_change_message_base + 41 + 1) % 256;
  skip
}

/* Order Change Message to the wire, 42 bytes from where the cursor stands */
inline encode_order_change_message(order_change_message_record) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.id_instrument[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> wire[at] = order_change_message_record.original_date[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.original_folio[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> wire[at] = order_change_message_record.new_date[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.new_folio[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  wire[at] = order_change_message_record.direction; at = at + 1;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> wire[at] = order_change_message_record.volume[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> wire[at] = order_change_message_record.price[order_change_message_at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  wire[at] = order_change_message_record.operation_type; at = at + 1;
  skip
}

/* Order Change Message off the wire, 42 bytes from where the cursor stands */
inline decode_order_change_message(order_change_message_record) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.id_instrument[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.original_date[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.original_folio[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.new_date[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.new_folio[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.direction = wire[at]; at = at + 1;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> order_change_message_record.volume[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> order_change_message_record.price[order_change_message_at] = wire[at]; at = at + 1; order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_record.operation_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Change Message is what was written, byte for byte */
inline equal_order_change_message(order_change_message_read, order_change_message_written) {
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.id_instrument[order_change_message_at] == order_change_message_written.id_instrument[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> assert(order_change_message_read.original_date[order_change_message_at] == order_change_message_written.original_date[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.original_folio[order_change_message_at] == order_change_message_written.original_folio[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> assert(order_change_message_read.new_date[order_change_message_at] == order_change_message_written.new_date[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.new_folio[order_change_message_at] == order_change_message_written.new_folio[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  assert(order_change_message_read.direction == order_change_message_written.direction);
  order_change_message_at = 0;
  do
  :: order_change_message_at < 4 -> assert(order_change_message_read.volume[order_change_message_at] == order_change_message_written.volume[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  order_change_message_at = 0;
  do
  :: order_change_message_at < 8 -> assert(order_change_message_read.price[order_change_message_at] == order_change_message_written.price[order_change_message_at]); order_change_message_at = order_change_message_at + 1
  :: else -> break
  od;
  assert(order_change_message_read.operation_type == order_change_message_written.operation_type);
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

/* Order Adition Message: encoded, read back, and compared */
proctype check_order_adition_message() {
  OrderAditionMessage order_adition_message_sent;
  OrderAditionMessage order_adition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_adition_message(order_adition_message_sent, 0)
  :: pattern == 1 -> fill_order_adition_message(order_adition_message_sent, 32)
  :: pattern == 2 -> fill_order_adition_message(order_adition_message_sent, 255)
  :: else -> ramp_order_adition_message(order_adition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_adition_message(order_adition_message_sent);
    assert(at == 35);
    at = 0;
    decode_order_adition_message(order_adition_message_got);
    assert(at == 35);
    equal_order_adition_message(order_adition_message_got, order_adition_message_sent)
  }
}

/* Execution Of Orders Message: encoded, read back, and compared */
proctype check_execution_of_orders_message() {
  ExecutionOfOrdersMessage execution_of_orders_message_sent;
  ExecutionOfOrdersMessage execution_of_orders_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_of_orders_message(execution_of_orders_message_sent, 0)
  :: pattern == 1 -> fill_execution_of_orders_message(execution_of_orders_message_sent, 32)
  :: pattern == 2 -> fill_execution_of_orders_message(execution_of_orders_message_sent, 255)
  :: else -> ramp_execution_of_orders_message(execution_of_orders_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_of_orders_message(execution_of_orders_message_sent);
    assert(at == 33);
    at = 0;
    decode_execution_of_orders_message(execution_of_orders_message_got);
    assert(at == 33);
    equal_execution_of_orders_message(execution_of_orders_message_got, execution_of_orders_message_sent)
  }
}

/* Order Cancellation Message: encoded, read back, and compared */
proctype check_order_cancellation_message() {
  OrderCancellationMessage order_cancellation_message_sent;
  OrderCancellationMessage order_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancellation_message(order_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_order_cancellation_message(order_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_order_cancellation_message(order_cancellation_message_sent, 255)
  :: else -> ramp_order_cancellation_message(order_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancellation_message(order_cancellation_message_sent);
    assert(at == 17);
    at = 0;
    decode_order_cancellation_message(order_cancellation_message_got);
    assert(at == 17);
    equal_order_cancellation_message(order_cancellation_message_got, order_cancellation_message_sent)
  }
}

/* Order Change Message: encoded, read back, and compared */
proctype check_order_change_message() {
  OrderChangeMessage order_change_message_sent;
  OrderChangeMessage order_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_change_message(order_change_message_sent, 0)
  :: pattern == 1 -> fill_order_change_message(order_change_message_sent, 32)
  :: pattern == 2 -> fill_order_change_message(order_change_message_sent, 255)
  :: else -> ramp_order_change_message(order_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_change_message(order_change_message_sent);
    assert(at == 42);
    at = 0;
    decode_order_change_message(order_change_message_got);
    assert(at == 42);
    equal_order_change_message(order_change_message_got, order_change_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_i_n_t_r_a_multicast_header()
  :: run check_message_header()
  :: run check_order_adition_message()
  :: run check_execution_of_orders_message()
  :: run check_order_cancellation_message()
  :: run check_order_change_message()
  fi
}
