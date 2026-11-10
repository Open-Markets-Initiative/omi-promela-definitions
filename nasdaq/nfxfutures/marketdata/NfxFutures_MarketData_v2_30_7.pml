/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Genium INET Auxiliary Market Data
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
 *   - the dispatch that chooses a message by its type
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 135

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Itch Mold Udp 64 Packet Header */
typedef PacketHeader {
  byte session[10];
  byte sequence_number[8];
  byte message_count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 20 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 20 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> assert(packet_header_read.session[packet_header_at] == packet_header_written.session[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Mold Udp 64 Message Header */
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

/* ---- Seconds Message: 4 bytes ------------------------------------------------ */

typedef SecondsMessage {
  byte second[4]
};

int seconds_message_at;

/* every byte of Seconds Message set to one value */
inline fill_seconds_message(seconds_message_record, seconds_message_value) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = seconds_message_value; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_seconds_message(seconds_message_record, seconds_message_base) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = (seconds_message_base + 0 + seconds_message_at + 1) % 256; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message to the wire, 4 bytes from where the cursor stands */
inline encode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> wire[at] = seconds_message_record.second[seconds_message_at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message off the wire, 4 bytes from where the cursor stands */
inline decode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> seconds_message_record.second[seconds_message_at] = wire[at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seconds Message is what was written, byte for byte */
inline equal_seconds_message(seconds_message_read, seconds_message_written) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 4 -> assert(seconds_message_read.second[seconds_message_at] == seconds_message_written.second[seconds_message_at]); seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book Directory: 135 bytes ----------------------------------------- */

typedef OrderBookDirectory {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte symbol[32];
  byte long_name[32];
  byte isin[12];
  byte financial_product;
  byte trading_currency[3];
  byte number_of_decimals_in_price[2];
  byte number_of_decimals_in_nominal_value[2];
  byte odd_lot_size[4];
  byte round_lot_size[4];
  byte block_lot_size[4];
  byte nominal_value[8];
  byte number_of_legs;
  byte underlying_order_book_id[4];
  byte strike_price[4];
  byte expiration_date[4];
  byte number_of_decimals_in_strike_price[2];
  byte put_or_call;
  byte market_id[2];
  byte strategy_subtype;
  byte minimum_quantity_and_multiple[4]
};

int order_book_directory_at;

/* every byte of Order Book Directory set to one value */
inline fill_order_book_directory(order_book_directory_record, order_book_directory_value) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.timestamp_nanoseconds[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.order_book_id[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> order_book_directory_record.symbol[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> order_book_directory_record.long_name[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 12 -> order_book_directory_record.isin[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.financial_product = order_book_directory_value;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 3 -> order_book_directory_record.trading_currency[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_price[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_nominal_value[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.odd_lot_size[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.round_lot_size[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.block_lot_size[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 8 -> order_book_directory_record.nominal_value[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.number_of_legs = order_book_directory_value;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.underlying_order_book_id[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.strike_price[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.expiration_date[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_strike_price[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.put_or_call = order_book_directory_value;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.market_id[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.strategy_subtype = order_book_directory_value;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.minimum_quantity_and_multiple[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Directory set to where it lies, so a field read out of place says so */
inline ramp_order_book_directory(order_book_directory_record, order_book_directory_base) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.timestamp_nanoseconds[order_book_directory_at] = (order_book_directory_base + 0 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.order_book_id[order_book_directory_at] = (order_book_directory_base + 4 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> order_book_directory_record.symbol[order_book_directory_at] = (order_book_directory_base + 8 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> order_book_directory_record.long_name[order_book_directory_at] = (order_book_directory_base + 40 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 12 -> order_book_directory_record.isin[order_book_directory_at] = (order_book_directory_base + 72 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.financial_product = (order_book_directory_base + 84 + 1) % 256;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 3 -> order_book_directory_record.trading_currency[order_book_directory_at] = (order_book_directory_base + 85 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_price[order_book_directory_at] = (order_book_directory_base + 88 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_nominal_value[order_book_directory_at] = (order_book_directory_base + 90 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.odd_lot_size[order_book_directory_at] = (order_book_directory_base + 92 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.round_lot_size[order_book_directory_at] = (order_book_directory_base + 96 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.block_lot_size[order_book_directory_at] = (order_book_directory_base + 100 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 8 -> order_book_directory_record.nominal_value[order_book_directory_at] = (order_book_directory_base + 104 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.number_of_legs = (order_book_directory_base + 112 + 1) % 256;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.underlying_order_book_id[order_book_directory_at] = (order_book_directory_base + 113 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.strike_price[order_book_directory_at] = (order_book_directory_base + 117 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.expiration_date[order_book_directory_at] = (order_book_directory_base + 121 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_strike_price[order_book_directory_at] = (order_book_directory_base + 125 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.put_or_call = (order_book_directory_base + 127 + 1) % 256;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.market_id[order_book_directory_at] = (order_book_directory_base + 128 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.strategy_subtype = (order_book_directory_base + 130 + 1) % 256;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.minimum_quantity_and_multiple[order_book_directory_at] = (order_book_directory_base + 131 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Directory to the wire, 135 bytes from where the cursor stands */
inline encode_order_book_directory(order_book_directory_record) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.timestamp_nanoseconds[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.order_book_id[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> wire[at] = order_book_directory_record.symbol[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> wire[at] = order_book_directory_record.long_name[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 12 -> wire[at] = order_book_directory_record.isin[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_record.financial_product; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 3 -> wire[at] = order_book_directory_record.trading_currency[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> wire[at] = order_book_directory_record.number_of_decimals_in_price[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> wire[at] = order_book_directory_record.number_of_decimals_in_nominal_value[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.odd_lot_size[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.round_lot_size[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.block_lot_size[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 8 -> wire[at] = order_book_directory_record.nominal_value[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_record.number_of_legs; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.underlying_order_book_id[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.strike_price[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.expiration_date[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> wire[at] = order_book_directory_record.number_of_decimals_in_strike_price[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_record.put_or_call; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> wire[at] = order_book_directory_record.market_id[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_record.strategy_subtype; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.minimum_quantity_and_multiple[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Directory off the wire, 135 bytes from where the cursor stands */
inline decode_order_book_directory(order_book_directory_record) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.timestamp_nanoseconds[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.order_book_id[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> order_book_directory_record.symbol[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> order_book_directory_record.long_name[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 12 -> order_book_directory_record.isin[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.financial_product = wire[at]; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 3 -> order_book_directory_record.trading_currency[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_price[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_nominal_value[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.odd_lot_size[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.round_lot_size[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.block_lot_size[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 8 -> order_book_directory_record.nominal_value[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.number_of_legs = wire[at]; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.underlying_order_book_id[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.strike_price[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.expiration_date[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.number_of_decimals_in_strike_price[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.put_or_call = wire[at]; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.market_id[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.strategy_subtype = wire[at]; at = at + 1;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.minimum_quantity_and_multiple[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Directory is what was written, byte for byte */
inline equal_order_book_directory(order_book_directory_read, order_book_directory_written) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.timestamp_nanoseconds[order_book_directory_at] == order_book_directory_written.timestamp_nanoseconds[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.order_book_id[order_book_directory_at] == order_book_directory_written.order_book_id[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> assert(order_book_directory_read.symbol[order_book_directory_at] == order_book_directory_written.symbol[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 32 -> assert(order_book_directory_read.long_name[order_book_directory_at] == order_book_directory_written.long_name[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 12 -> assert(order_book_directory_read.isin[order_book_directory_at] == order_book_directory_written.isin[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  assert(order_book_directory_read.financial_product == order_book_directory_written.financial_product);
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 3 -> assert(order_book_directory_read.trading_currency[order_book_directory_at] == order_book_directory_written.trading_currency[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> assert(order_book_directory_read.number_of_decimals_in_price[order_book_directory_at] == order_book_directory_written.number_of_decimals_in_price[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> assert(order_book_directory_read.number_of_decimals_in_nominal_value[order_book_directory_at] == order_book_directory_written.number_of_decimals_in_nominal_value[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.odd_lot_size[order_book_directory_at] == order_book_directory_written.odd_lot_size[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.round_lot_size[order_book_directory_at] == order_book_directory_written.round_lot_size[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.block_lot_size[order_book_directory_at] == order_book_directory_written.block_lot_size[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 8 -> assert(order_book_directory_read.nominal_value[order_book_directory_at] == order_book_directory_written.nominal_value[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  assert(order_book_directory_read.number_of_legs == order_book_directory_written.number_of_legs);
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.underlying_order_book_id[order_book_directory_at] == order_book_directory_written.underlying_order_book_id[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.strike_price[order_book_directory_at] == order_book_directory_written.strike_price[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.expiration_date[order_book_directory_at] == order_book_directory_written.expiration_date[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> assert(order_book_directory_read.number_of_decimals_in_strike_price[order_book_directory_at] == order_book_directory_written.number_of_decimals_in_strike_price[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  assert(order_book_directory_read.put_or_call == order_book_directory_written.put_or_call);
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> assert(order_book_directory_read.market_id[order_book_directory_at] == order_book_directory_written.market_id[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  assert(order_book_directory_read.strategy_subtype == order_book_directory_written.strategy_subtype);
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.minimum_quantity_and_multiple[order_book_directory_at] == order_book_directory_written.minimum_quantity_and_multiple[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Combination Order Book Leg: 29 bytes ------------------------------------ */

/* Combination Order book Directory Message */
typedef CombinationOrderBookLeg {
  byte timestamp_nanoseconds[4];
  byte combination_order_book_id[4];
  byte leg_order_book_id[4];
  byte leg_side;
  byte leg_ratio[4];
  byte leg_price_future[4];
  byte leg_delta[4];
  byte leg_quantity_future[4]
};

int combination_order_book_leg_at;

/* every byte of Combination Order Book Leg set to one value */
inline fill_combination_order_book_leg(combination_order_book_leg_record, combination_order_book_leg_value) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.timestamp_nanoseconds[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.combination_order_book_id[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_order_book_id[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_record.leg_side = combination_order_book_leg_value;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_ratio[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_price_future[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_delta[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_quantity_future[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Combination Order Book Leg set to where it lies, so a field read out of place says so */
inline ramp_combination_order_book_leg(combination_order_book_leg_record, combination_order_book_leg_base) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.timestamp_nanoseconds[combination_order_book_leg_at] = (combination_order_book_leg_base + 0 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.combination_order_book_id[combination_order_book_leg_at] = (combination_order_book_leg_base + 4 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_order_book_id[combination_order_book_leg_at] = (combination_order_book_leg_base + 8 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_record.leg_side = (combination_order_book_leg_base + 12 + 1) % 256;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_ratio[combination_order_book_leg_at] = (combination_order_book_leg_base + 13 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_price_future[combination_order_book_leg_at] = (combination_order_book_leg_base + 17 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_delta[combination_order_book_leg_at] = (combination_order_book_leg_base + 21 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_quantity_future[combination_order_book_leg_at] = (combination_order_book_leg_base + 25 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Book Leg to the wire, 29 bytes from where the cursor stands */
inline encode_combination_order_book_leg(combination_order_book_leg_record) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.timestamp_nanoseconds[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.combination_order_book_id[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.leg_order_book_id[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_book_leg_record.leg_side; at = at + 1;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.leg_ratio[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.leg_price_future[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.leg_delta[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.leg_quantity_future[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Book Leg off the wire, 29 bytes from where the cursor stands */
inline decode_combination_order_book_leg(combination_order_book_leg_record) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.timestamp_nanoseconds[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.combination_order_book_id[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_order_book_id[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_record.leg_side = wire[at]; at = at + 1;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_ratio[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_price_future[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_delta[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.leg_quantity_future[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Combination Order Book Leg is what was written, byte for byte */
inline equal_combination_order_book_leg(combination_order_book_leg_read, combination_order_book_leg_written) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.timestamp_nanoseconds[combination_order_book_leg_at] == combination_order_book_leg_written.timestamp_nanoseconds[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.combination_order_book_id[combination_order_book_leg_at] == combination_order_book_leg_written.combination_order_book_id[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.leg_order_book_id[combination_order_book_leg_at] == combination_order_book_leg_written.leg_order_book_id[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  assert(combination_order_book_leg_read.leg_side == combination_order_book_leg_written.leg_side);
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.leg_ratio[combination_order_book_leg_at] == combination_order_book_leg_written.leg_ratio[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.leg_price_future[combination_order_book_leg_at] == combination_order_book_leg_written.leg_price_future[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.leg_delta[combination_order_book_leg_at] == combination_order_book_leg_written.leg_delta[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.leg_quantity_future[combination_order_book_leg_at] == combination_order_book_leg_written.leg_quantity_future[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Tick Size Table Entry: 24 bytes ----------------------------------------- */

/* L - Tick Size Message. */
typedef TickSizeTableEntry {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte tick_size[8];
  byte price_from[4];
  byte price_to[4]
};

int tick_size_table_entry_at;

/* every byte of Tick Size Table Entry set to one value */
inline fill_tick_size_table_entry(tick_size_table_entry_record, tick_size_table_entry_value) {
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.timestamp_nanoseconds[tick_size_table_entry_at] = tick_size_table_entry_value; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.order_book_id[tick_size_table_entry_at] = tick_size_table_entry_value; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 8 -> tick_size_table_entry_record.tick_size[tick_size_table_entry_at] = tick_size_table_entry_value; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.price_from[tick_size_table_entry_at] = tick_size_table_entry_value; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.price_to[tick_size_table_entry_at] = tick_size_table_entry_value; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Tick Size Table Entry set to where it lies, so a field read out of place says so */
inline ramp_tick_size_table_entry(tick_size_table_entry_record, tick_size_table_entry_base) {
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.timestamp_nanoseconds[tick_size_table_entry_at] = (tick_size_table_entry_base + 0 + tick_size_table_entry_at + 1) % 256; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.order_book_id[tick_size_table_entry_at] = (tick_size_table_entry_base + 4 + tick_size_table_entry_at + 1) % 256; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 8 -> tick_size_table_entry_record.tick_size[tick_size_table_entry_at] = (tick_size_table_entry_base + 8 + tick_size_table_entry_at + 1) % 256; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.price_from[tick_size_table_entry_at] = (tick_size_table_entry_base + 16 + tick_size_table_entry_at + 1) % 256; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.price_to[tick_size_table_entry_at] = (tick_size_table_entry_base + 20 + tick_size_table_entry_at + 1) % 256; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Table Entry to the wire, 24 bytes from where the cursor stands */
inline encode_tick_size_table_entry(tick_size_table_entry_record) {
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> wire[at] = tick_size_table_entry_record.timestamp_nanoseconds[tick_size_table_entry_at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> wire[at] = tick_size_table_entry_record.order_book_id[tick_size_table_entry_at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 8 -> wire[at] = tick_size_table_entry_record.tick_size[tick_size_table_entry_at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> wire[at] = tick_size_table_entry_record.price_from[tick_size_table_entry_at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> wire[at] = tick_size_table_entry_record.price_to[tick_size_table_entry_at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* Tick Size Table Entry off the wire, 24 bytes from where the cursor stands */
inline decode_tick_size_table_entry(tick_size_table_entry_record) {
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.timestamp_nanoseconds[tick_size_table_entry_at] = wire[at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.order_book_id[tick_size_table_entry_at] = wire[at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 8 -> tick_size_table_entry_record.tick_size[tick_size_table_entry_at] = wire[at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.price_from[tick_size_table_entry_at] = wire[at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.price_to[tick_size_table_entry_at] = wire[at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Tick Size Table Entry is what was written, byte for byte */
inline equal_tick_size_table_entry(tick_size_table_entry_read, tick_size_table_entry_written) {
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> assert(tick_size_table_entry_read.timestamp_nanoseconds[tick_size_table_entry_at] == tick_size_table_entry_written.timestamp_nanoseconds[tick_size_table_entry_at]); tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> assert(tick_size_table_entry_read.order_book_id[tick_size_table_entry_at] == tick_size_table_entry_written.order_book_id[tick_size_table_entry_at]); tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 8 -> assert(tick_size_table_entry_read.tick_size[tick_size_table_entry_at] == tick_size_table_entry_written.tick_size[tick_size_table_entry_at]); tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> assert(tick_size_table_entry_read.price_from[tick_size_table_entry_at] == tick_size_table_entry_written.price_from[tick_size_table_entry_at]); tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  tick_size_table_entry_at = 0;
  do
  :: tick_size_table_entry_at < 4 -> assert(tick_size_table_entry_read.price_to[tick_size_table_entry_at] == tick_size_table_entry_written.price_to[tick_size_table_entry_at]); tick_size_table_entry_at = tick_size_table_entry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 5 bytes ------------------------------------------- */

typedef SystemEventMessage {
  byte timestamp_nanoseconds[4];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 4 + 1) % 256;
  skip
}

/* System Event Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.timestamp_nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.timestamp_nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.timestamp_nanoseconds[system_event_message_at] == system_event_message_written.timestamp_nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Order Book State Message: 28 bytes -------------------------------------- */

typedef OrderBookStateMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte state_name[20]
};

int order_book_state_message_at;

/* every byte of Order Book State Message set to one value */
inline fill_order_book_state_message(order_book_state_message_record, order_book_state_message_value) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book State Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_state_message(order_book_state_message_record, order_book_state_message_base) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at] = (order_book_state_message_base + 0 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = (order_book_state_message_base + 4 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = (order_book_state_message_base + 8 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book State Message to the wire, 28 bytes from where the cursor stands */
inline encode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.order_book_id[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> wire[at] = order_book_state_message_record.state_name[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book State Message off the wire, 28 bytes from where the cursor stands */
inline decode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.timestamp_nanoseconds[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.order_book_id[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> order_book_state_message_record.state_name[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book State Message is what was written, byte for byte */
inline equal_order_book_state_message(order_book_state_message_read, order_book_state_message_written) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.timestamp_nanoseconds[order_book_state_message_at] == order_book_state_message_written.timestamp_nanoseconds[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.order_book_id[order_book_state_message_at] == order_book_state_message_written.order_book_id[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 20 -> assert(order_book_state_message_read.state_name[order_book_state_message_at] == order_book_state_message_written.state_name[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reported Trade: 72 bytes ------------------------------------------------ */

typedef ReportedTrade {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte traded_quantity[8];
  byte match_id[8];
  byte combo_group_id[4];
  byte time_of_trade_execution[8];
  byte time_of_trade_agreement[8];
  byte time_of_trade_dissemination[8];
  byte trade_price[4];
  byte trade_type[2];
  byte reserved[7];
  byte second_reserved[7]
};

int reported_trade_at;

/* every byte of Reported Trade set to one value */
inline fill_reported_trade(reported_trade_record, reported_trade_value) {
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.timestamp_nanoseconds[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.order_book_id[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.traded_quantity[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.match_id[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.combo_group_id[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_execution[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_agreement[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_dissemination[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.trade_price[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 2 -> reported_trade_record.trade_type[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> reported_trade_record.reserved[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> reported_trade_record.second_reserved[reported_trade_at] = reported_trade_value; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reported Trade set to where it lies, so a field read out of place says so */
inline ramp_reported_trade(reported_trade_record, reported_trade_base) {
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.timestamp_nanoseconds[reported_trade_at] = (reported_trade_base + 0 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.order_book_id[reported_trade_at] = (reported_trade_base + 4 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.traded_quantity[reported_trade_at] = (reported_trade_base + 8 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.match_id[reported_trade_at] = (reported_trade_base + 16 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.combo_group_id[reported_trade_at] = (reported_trade_base + 24 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_execution[reported_trade_at] = (reported_trade_base + 28 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_agreement[reported_trade_at] = (reported_trade_base + 36 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_dissemination[reported_trade_at] = (reported_trade_base + 44 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.trade_price[reported_trade_at] = (reported_trade_base + 52 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 2 -> reported_trade_record.trade_type[reported_trade_at] = (reported_trade_base + 56 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> reported_trade_record.reserved[reported_trade_at] = (reported_trade_base + 58 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> reported_trade_record.second_reserved[reported_trade_at] = (reported_trade_base + 65 + reported_trade_at + 1) % 256; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  skip
}

/* Reported Trade to the wire, 72 bytes from where the cursor stands */
inline encode_reported_trade(reported_trade_record) {
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> wire[at] = reported_trade_record.timestamp_nanoseconds[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> wire[at] = reported_trade_record.order_book_id[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> wire[at] = reported_trade_record.traded_quantity[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> wire[at] = reported_trade_record.match_id[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> wire[at] = reported_trade_record.combo_group_id[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> wire[at] = reported_trade_record.time_of_trade_execution[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> wire[at] = reported_trade_record.time_of_trade_agreement[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> wire[at] = reported_trade_record.time_of_trade_dissemination[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> wire[at] = reported_trade_record.trade_price[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 2 -> wire[at] = reported_trade_record.trade_type[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> wire[at] = reported_trade_record.reserved[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> wire[at] = reported_trade_record.second_reserved[reported_trade_at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  skip
}

/* Reported Trade off the wire, 72 bytes from where the cursor stands */
inline decode_reported_trade(reported_trade_record) {
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.timestamp_nanoseconds[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.order_book_id[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.traded_quantity[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.match_id[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.combo_group_id[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_execution[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_agreement[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> reported_trade_record.time_of_trade_dissemination[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> reported_trade_record.trade_price[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 2 -> reported_trade_record.trade_type[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> reported_trade_record.reserved[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> reported_trade_record.second_reserved[reported_trade_at] = wire[at]; at = at + 1; reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reported Trade is what was written, byte for byte */
inline equal_reported_trade(reported_trade_read, reported_trade_written) {
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> assert(reported_trade_read.timestamp_nanoseconds[reported_trade_at] == reported_trade_written.timestamp_nanoseconds[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> assert(reported_trade_read.order_book_id[reported_trade_at] == reported_trade_written.order_book_id[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> assert(reported_trade_read.traded_quantity[reported_trade_at] == reported_trade_written.traded_quantity[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> assert(reported_trade_read.match_id[reported_trade_at] == reported_trade_written.match_id[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> assert(reported_trade_read.combo_group_id[reported_trade_at] == reported_trade_written.combo_group_id[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> assert(reported_trade_read.time_of_trade_execution[reported_trade_at] == reported_trade_written.time_of_trade_execution[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> assert(reported_trade_read.time_of_trade_agreement[reported_trade_at] == reported_trade_written.time_of_trade_agreement[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 8 -> assert(reported_trade_read.time_of_trade_dissemination[reported_trade_at] == reported_trade_written.time_of_trade_dissemination[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 4 -> assert(reported_trade_read.trade_price[reported_trade_at] == reported_trade_written.trade_price[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 2 -> assert(reported_trade_read.trade_type[reported_trade_at] == reported_trade_written.trade_type[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> assert(reported_trade_read.reserved[reported_trade_at] == reported_trade_written.reserved[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  reported_trade_at = 0;
  do
  :: reported_trade_at < 7 -> assert(reported_trade_read.second_reserved[reported_trade_at] == reported_trade_written.second_reserved[reported_trade_at]); reported_trade_at = reported_trade_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Broken Trade Message: 12 bytes ------------------------------------------ */

typedef BrokenTradeMessage {
  byte timestamp_nanoseconds[4];
  byte match_id[8]
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.timestamp_nanoseconds[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_id[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.timestamp_nanoseconds[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_id[broken_trade_message_at] = (broken_trade_message_base + 4 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message to the wire, 12 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.timestamp_nanoseconds[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.match_id[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message off the wire, 12 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.timestamp_nanoseconds[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_id[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.timestamp_nanoseconds[broken_trade_message_at] == broken_trade_message_written.timestamp_nanoseconds[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.match_id[broken_trade_message_at] == broken_trade_message_written.match_id[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 16 bytes ----------------------------------------- */

typedef OpenInterestMessage {
  byte timestamp_nanoseconds[4];
  byte order_book_id[4];
  byte open_interest[8]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.timestamp_nanoseconds[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.order_book_id[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.open_interest[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.timestamp_nanoseconds[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.order_book_id[open_interest_message_at] = (open_interest_message_base + 4 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.open_interest[open_interest_message_at] = (open_interest_message_base + 8 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 16 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.timestamp_nanoseconds[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.order_book_id[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.open_interest[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 16 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.timestamp_nanoseconds[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.order_book_id[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.open_interest[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.timestamp_nanoseconds[open_interest_message_at] == open_interest_message_written.timestamp_nanoseconds[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.order_book_id[open_interest_message_at] == open_interest_message_written.order_book_id[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.open_interest[open_interest_message_at] == open_interest_message_written.open_interest[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Message: 13 bytes ------------------------------------------------- */

typedef PriceMessage {
  byte timestamp_nanoseconds[4];
  byte price_type;
  byte order_book_id[4];
  byte price[4]
};

int price_message_at;

/* every byte of Price Message set to one value */
inline fill_price_message(price_message_record, price_message_value) {
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.timestamp_nanoseconds[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.price_type = price_message_value;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.order_book_id[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Message set to where it lies, so a field read out of place says so */
inline ramp_price_message(price_message_record, price_message_base) {
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.timestamp_nanoseconds[price_message_at] = (price_message_base + 0 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.price_type = (price_message_base + 4 + 1) % 256;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.order_book_id[price_message_at] = (price_message_base + 5 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price[price_message_at] = (price_message_base + 9 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Message to the wire, 13 bytes from where the cursor stands */
inline encode_price_message(price_message_record) {
  price_message_at = 0;
  do
  :: price_message_at < 4 -> wire[at] = price_message_record.timestamp_nanoseconds[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  wire[at] = price_message_record.price_type; at = at + 1;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> wire[at] = price_message_record.order_book_id[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> wire[at] = price_message_record.price[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Message off the wire, 13 bytes from where the cursor stands */
inline decode_price_message(price_message_record) {
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.timestamp_nanoseconds[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.price_type = wire[at]; at = at + 1;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.order_book_id[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Message is what was written, byte for byte */
inline equal_price_message(price_message_read, price_message_written) {
  price_message_at = 0;
  do
  :: price_message_at < 4 -> assert(price_message_read.timestamp_nanoseconds[price_message_at] == price_message_written.timestamp_nanoseconds[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  assert(price_message_read.price_type == price_message_written.price_type);
  price_message_at = 0;
  do
  :: price_message_at < 4 -> assert(price_message_read.order_book_id[price_message_at] == price_message_written.order_book_id[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> assert(price_message_read.price[price_message_at] == price_message_written.price[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Packet Header: encoded, read back, and compared */
proctype check_packet_header() {
  PacketHeader packet_header_sent;
  PacketHeader packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet_header(packet_header_sent, 0)
  :: pattern == 1 -> fill_packet_header(packet_header_sent, 32)
  :: pattern == 2 -> fill_packet_header(packet_header_sent, 255)
  :: else -> ramp_packet_header(packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet_header(packet_header_sent);
    assert(at == 20);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 20);
    equal_packet_header(packet_header_got, packet_header_sent)
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

/* Seconds Message: encoded, read back, and compared */
proctype check_seconds_message() {
  SecondsMessage seconds_message_sent;
  SecondsMessage seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seconds_message(seconds_message_sent, 0)
  :: pattern == 1 -> fill_seconds_message(seconds_message_sent, 32)
  :: pattern == 2 -> fill_seconds_message(seconds_message_sent, 255)
  :: else -> ramp_seconds_message(seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seconds_message(seconds_message_sent);
    assert(at == 4);
    at = 0;
    decode_seconds_message(seconds_message_got);
    assert(at == 4);
    equal_seconds_message(seconds_message_got, seconds_message_sent)
  }
}

/* Order Book Directory: encoded, read back, and compared */
proctype check_order_book_directory() {
  OrderBookDirectory order_book_directory_sent;
  OrderBookDirectory order_book_directory_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_directory(order_book_directory_sent, 0)
  :: pattern == 1 -> fill_order_book_directory(order_book_directory_sent, 32)
  :: pattern == 2 -> fill_order_book_directory(order_book_directory_sent, 255)
  :: else -> ramp_order_book_directory(order_book_directory_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_directory(order_book_directory_sent);
    assert(at == 135);
    at = 0;
    decode_order_book_directory(order_book_directory_got);
    assert(at == 135);
    equal_order_book_directory(order_book_directory_got, order_book_directory_sent)
  }
}

/* Combination Order Book Leg: encoded, read back, and compared */
proctype check_combination_order_book_leg() {
  CombinationOrderBookLeg combination_order_book_leg_sent;
  CombinationOrderBookLeg combination_order_book_leg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_combination_order_book_leg(combination_order_book_leg_sent, 0)
  :: pattern == 1 -> fill_combination_order_book_leg(combination_order_book_leg_sent, 32)
  :: pattern == 2 -> fill_combination_order_book_leg(combination_order_book_leg_sent, 255)
  :: else -> ramp_combination_order_book_leg(combination_order_book_leg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_combination_order_book_leg(combination_order_book_leg_sent);
    assert(at == 29);
    at = 0;
    decode_combination_order_book_leg(combination_order_book_leg_got);
    assert(at == 29);
    equal_combination_order_book_leg(combination_order_book_leg_got, combination_order_book_leg_sent)
  }
}

/* Tick Size Table Entry: encoded, read back, and compared */
proctype check_tick_size_table_entry() {
  TickSizeTableEntry tick_size_table_entry_sent;
  TickSizeTableEntry tick_size_table_entry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_tick_size_table_entry(tick_size_table_entry_sent, 0)
  :: pattern == 1 -> fill_tick_size_table_entry(tick_size_table_entry_sent, 32)
  :: pattern == 2 -> fill_tick_size_table_entry(tick_size_table_entry_sent, 255)
  :: else -> ramp_tick_size_table_entry(tick_size_table_entry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_tick_size_table_entry(tick_size_table_entry_sent);
    assert(at == 24);
    at = 0;
    decode_tick_size_table_entry(tick_size_table_entry_got);
    assert(at == 24);
    equal_tick_size_table_entry(tick_size_table_entry_got, tick_size_table_entry_sent)
  }
}

/* System Event Message: encoded, read back, and compared */
proctype check_system_event_message() {
  SystemEventMessage system_event_message_sent;
  SystemEventMessage system_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_message(system_event_message_sent, 0)
  :: pattern == 1 -> fill_system_event_message(system_event_message_sent, 32)
  :: pattern == 2 -> fill_system_event_message(system_event_message_sent, 255)
  :: else -> ramp_system_event_message(system_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_message(system_event_message_sent);
    assert(at == 5);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 5);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Order Book State Message: encoded, read back, and compared */
proctype check_order_book_state_message() {
  OrderBookStateMessage order_book_state_message_sent;
  OrderBookStateMessage order_book_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_state_message(order_book_state_message_sent, 0)
  :: pattern == 1 -> fill_order_book_state_message(order_book_state_message_sent, 32)
  :: pattern == 2 -> fill_order_book_state_message(order_book_state_message_sent, 255)
  :: else -> ramp_order_book_state_message(order_book_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_state_message(order_book_state_message_sent);
    assert(at == 28);
    at = 0;
    decode_order_book_state_message(order_book_state_message_got);
    assert(at == 28);
    equal_order_book_state_message(order_book_state_message_got, order_book_state_message_sent)
  }
}

/* Reported Trade: encoded, read back, and compared */
proctype check_reported_trade() {
  ReportedTrade reported_trade_sent;
  ReportedTrade reported_trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reported_trade(reported_trade_sent, 0)
  :: pattern == 1 -> fill_reported_trade(reported_trade_sent, 32)
  :: pattern == 2 -> fill_reported_trade(reported_trade_sent, 255)
  :: else -> ramp_reported_trade(reported_trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reported_trade(reported_trade_sent);
    assert(at == 72);
    at = 0;
    decode_reported_trade(reported_trade_got);
    assert(at == 72);
    equal_reported_trade(reported_trade_got, reported_trade_sent)
  }
}

/* Broken Trade Message: encoded, read back, and compared */
proctype check_broken_trade_message() {
  BrokenTradeMessage broken_trade_message_sent;
  BrokenTradeMessage broken_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broken_trade_message(broken_trade_message_sent, 0)
  :: pattern == 1 -> fill_broken_trade_message(broken_trade_message_sent, 32)
  :: pattern == 2 -> fill_broken_trade_message(broken_trade_message_sent, 255)
  :: else -> ramp_broken_trade_message(broken_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broken_trade_message(broken_trade_message_sent);
    assert(at == 12);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 12);
    equal_broken_trade_message(broken_trade_message_got, broken_trade_message_sent)
  }
}

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 16);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 16);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Price Message: encoded, read back, and compared */
proctype check_price_message() {
  PriceMessage price_message_sent;
  PriceMessage price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_message(price_message_sent, 0)
  :: pattern == 1 -> fill_price_message(price_message_sent, 32)
  :: pattern == 2 -> fill_price_message(price_message_sent, 255)
  :: else -> ramp_price_message(price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_message(price_message_sent);
    assert(at == 13);
    at = 0;
    decode_price_message(price_message_got);
    assert(at == 13);
    equal_price_message(price_message_got, price_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_seconds_message()
  :: run check_order_book_directory()
  :: run check_combination_order_book_leg()
  :: run check_tick_size_table_entry()
  :: run check_system_event_message()
  :: run check_order_book_state_message()
  :: run check_reported_trade()
  :: run check_broken_trade_message()
  :: run check_open_interest_message()
  :: run check_price_message()
  fi
}
