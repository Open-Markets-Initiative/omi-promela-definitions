/*
 * Borsa İstanbul A.Ş. Genium Inet
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 129

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

/* Sent every second for which at least one ITCH message is being generated. Contains the number of seconds since the start of 1970-01-01 00:00:00 UTC, also called Unix Time. */
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

/* ---- Order Book Directory: 129 bytes ----------------------------------------- */

/* At the start of each trading day, Order book directory messages are disseminated for all active securities, including halted securities. Intra-day transmissions may occur when new order books are added or updates to existing order books occur. */
typedef OrderBookDirectory {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte symbol[32];
  byte long_name[32];
  byte isin[12];
  byte financial_product;
  byte trading_currency[3];
  byte decimals_in_price[2];
  byte decimals_in_nominal_value[2];
  byte odd_lot_size[4];
  byte round_lot_size[4];
  byte block_lot_size[4];
  byte nominal_value[8];
  byte number_of_legs;
  byte underlying_order_book_id[4];
  byte strike_price[4];
  byte expiration_date[4];
  byte decimals_in_strike_price[2];
  byte put_or_call;
  byte ranking_type
};

int order_book_directory_at;

/* every byte of Order Book Directory set to one value */
inline fill_order_book_directory(order_book_directory_record, order_book_directory_value) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.nanoseconds[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_price[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_nominal_value[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_strike_price[order_book_directory_at] = order_book_directory_value; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.put_or_call = order_book_directory_value;
  order_book_directory_record.ranking_type = order_book_directory_value;
  skip
}

/* each byte of Order Book Directory set to where it lies, so a field read out of place says so */
inline ramp_order_book_directory(order_book_directory_record, order_book_directory_base) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.nanoseconds[order_book_directory_at] = (order_book_directory_base + 0 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_price[order_book_directory_at] = (order_book_directory_base + 88 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_nominal_value[order_book_directory_at] = (order_book_directory_base + 90 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_strike_price[order_book_directory_at] = (order_book_directory_base + 125 + order_book_directory_at + 1) % 256; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.put_or_call = (order_book_directory_base + 127 + 1) % 256;
  order_book_directory_record.ranking_type = (order_book_directory_base + 128 + 1) % 256;
  skip
}

/* Order Book Directory to the wire, 129 bytes from where the cursor stands */
inline encode_order_book_directory(order_book_directory_record) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> wire[at] = order_book_directory_record.nanoseconds[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> wire[at] = order_book_directory_record.decimals_in_price[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> wire[at] = order_book_directory_record.decimals_in_nominal_value[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> wire[at] = order_book_directory_record.decimals_in_strike_price[order_book_directory_at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  wire[at] = order_book_directory_record.put_or_call; at = at + 1;
  wire[at] = order_book_directory_record.ranking_type; at = at + 1;
  skip
}

/* Order Book Directory off the wire, 129 bytes from where the cursor stands */
inline decode_order_book_directory(order_book_directory_record) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> order_book_directory_record.nanoseconds[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_price[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_nominal_value[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> order_book_directory_record.decimals_in_strike_price[order_book_directory_at] = wire[at]; at = at + 1; order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_record.put_or_call = wire[at]; at = at + 1;
  order_book_directory_record.ranking_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book Directory is what was written, byte for byte */
inline equal_order_book_directory(order_book_directory_read, order_book_directory_written) {
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 4 -> assert(order_book_directory_read.nanoseconds[order_book_directory_at] == order_book_directory_written.nanoseconds[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> assert(order_book_directory_read.decimals_in_price[order_book_directory_at] == order_book_directory_written.decimals_in_price[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  order_book_directory_at = 0;
  do
  :: order_book_directory_at < 2 -> assert(order_book_directory_read.decimals_in_nominal_value[order_book_directory_at] == order_book_directory_written.decimals_in_nominal_value[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
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
  :: order_book_directory_at < 2 -> assert(order_book_directory_read.decimals_in_strike_price[order_book_directory_at] == order_book_directory_written.decimals_in_strike_price[order_book_directory_at]); order_book_directory_at = order_book_directory_at + 1
  :: else -> break
  od;
  assert(order_book_directory_read.put_or_call == order_book_directory_written.put_or_call);
  assert(order_book_directory_read.ranking_type == order_book_directory_written.ranking_type);
  skip
}

/* ---- Combination Order Book Leg: 17 bytes ------------------------------------ */

/* Provides a mapping between a combination order book and one of the combination leg order books. One message is generated per leg that the combination consists of. */
typedef CombinationOrderBookLeg {
  byte nanoseconds[4];
  byte combination_order_book_id[4];
  byte leg_order_book_id[4];
  byte leg_side;
  byte leg_ratio[4]
};

int combination_order_book_leg_at;

/* every byte of Combination Order Book Leg set to one value */
inline fill_combination_order_book_leg(combination_order_book_leg_record, combination_order_book_leg_value) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.nanoseconds[combination_order_book_leg_at] = combination_order_book_leg_value; combination_order_book_leg_at = combination_order_book_leg_at + 1
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
  skip
}

/* each byte of Combination Order Book Leg set to where it lies, so a field read out of place says so */
inline ramp_combination_order_book_leg(combination_order_book_leg_record, combination_order_book_leg_base) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.nanoseconds[combination_order_book_leg_at] = (combination_order_book_leg_base + 0 + combination_order_book_leg_at + 1) % 256; combination_order_book_leg_at = combination_order_book_leg_at + 1
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
  skip
}

/* Combination Order Book Leg to the wire, 17 bytes from where the cursor stands */
inline encode_combination_order_book_leg(combination_order_book_leg_record) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> wire[at] = combination_order_book_leg_record.nanoseconds[combination_order_book_leg_at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
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
  skip
}

/* Combination Order Book Leg off the wire, 17 bytes from where the cursor stands */
inline decode_combination_order_book_leg(combination_order_book_leg_record) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> combination_order_book_leg_record.nanoseconds[combination_order_book_leg_at] = wire[at]; at = at + 1; combination_order_book_leg_at = combination_order_book_leg_at + 1
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
  skip
}

/* what was read of Combination Order Book Leg is what was written, byte for byte */
inline equal_combination_order_book_leg(combination_order_book_leg_read, combination_order_book_leg_written) {
  combination_order_book_leg_at = 0;
  do
  :: combination_order_book_leg_at < 4 -> assert(combination_order_book_leg_read.nanoseconds[combination_order_book_leg_at] == combination_order_book_leg_written.nanoseconds[combination_order_book_leg_at]); combination_order_book_leg_at = combination_order_book_leg_at + 1
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
  skip
}

/* ---- Tick Size Table Entry: 24 bytes ----------------------------------------- */

/* Contains information on a tick size for a price range. Together, all Tick Size messages with the same order book ID form a complete Tick Size Table. */
typedef TickSizeTableEntry {
  byte nanoseconds[4];
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
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.nanoseconds[tick_size_table_entry_at] = tick_size_table_entry_value; tick_size_table_entry_at = tick_size_table_entry_at + 1
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
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.nanoseconds[tick_size_table_entry_at] = (tick_size_table_entry_base + 0 + tick_size_table_entry_at + 1) % 256; tick_size_table_entry_at = tick_size_table_entry_at + 1
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
  :: tick_size_table_entry_at < 4 -> wire[at] = tick_size_table_entry_record.nanoseconds[tick_size_table_entry_at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
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
  :: tick_size_table_entry_at < 4 -> tick_size_table_entry_record.nanoseconds[tick_size_table_entry_at] = wire[at]; at = at + 1; tick_size_table_entry_at = tick_size_table_entry_at + 1
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
  :: tick_size_table_entry_at < 4 -> assert(tick_size_table_entry_read.nanoseconds[tick_size_table_entry_at] == tick_size_table_entry_written.nanoseconds[tick_size_table_entry_at]); tick_size_table_entry_at = tick_size_table_entry_at + 1
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

/* ---- Short Sell Status: 9 bytes ---------------------------------------------- */

/* Indicates the short sell rules of an order book. Sent for order books which might have short sell allowing prior to the start of system. If an order book is absent from this message, clients should assume that the order book has no short selling rules at the start-of-day reference data messages. If short sell rules change during the day for an order book, this message will be re-sent for that order book. */
typedef ShortSellStatus {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte short_sale_restriction
};

int short_sell_status_at;

/* every byte of Short Sell Status set to one value */
inline fill_short_sell_status(short_sell_status_record, short_sell_status_value) {
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> short_sell_status_record.nanoseconds[short_sell_status_at] = short_sell_status_value; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> short_sell_status_record.order_book_id[short_sell_status_at] = short_sell_status_value; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_record.short_sale_restriction = short_sell_status_value;
  skip
}

/* each byte of Short Sell Status set to where it lies, so a field read out of place says so */
inline ramp_short_sell_status(short_sell_status_record, short_sell_status_base) {
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> short_sell_status_record.nanoseconds[short_sell_status_at] = (short_sell_status_base + 0 + short_sell_status_at + 1) % 256; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> short_sell_status_record.order_book_id[short_sell_status_at] = (short_sell_status_base + 4 + short_sell_status_at + 1) % 256; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_record.short_sale_restriction = (short_sell_status_base + 8 + 1) % 256;
  skip
}

/* Short Sell Status to the wire, 9 bytes from where the cursor stands */
inline encode_short_sell_status(short_sell_status_record) {
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> wire[at] = short_sell_status_record.nanoseconds[short_sell_status_at]; at = at + 1; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> wire[at] = short_sell_status_record.order_book_id[short_sell_status_at]; at = at + 1; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  wire[at] = short_sell_status_record.short_sale_restriction; at = at + 1;
  skip
}

/* Short Sell Status off the wire, 9 bytes from where the cursor stands */
inline decode_short_sell_status(short_sell_status_record) {
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> short_sell_status_record.nanoseconds[short_sell_status_at] = wire[at]; at = at + 1; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> short_sell_status_record.order_book_id[short_sell_status_at] = wire[at]; at = at + 1; short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_record.short_sale_restriction = wire[at]; at = at + 1;
  skip
}

/* what was read of Short Sell Status is what was written, byte for byte */
inline equal_short_sell_status(short_sell_status_read, short_sell_status_written) {
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> assert(short_sell_status_read.nanoseconds[short_sell_status_at] == short_sell_status_written.nanoseconds[short_sell_status_at]); short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  short_sell_status_at = 0;
  do
  :: short_sell_status_at < 4 -> assert(short_sell_status_read.order_book_id[short_sell_status_at] == short_sell_status_written.order_book_id[short_sell_status_at]); short_sell_status_at = short_sell_status_at + 1
  :: else -> break
  od;
  assert(short_sell_status_read.short_sale_restriction == short_sell_status_written.short_sale_restriction);
  skip
}

/* ---- System Event Message: 5 bytes ------------------------------------------- */

/* Used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte nanoseconds[4];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 4 + 1) % 256;
  skip
}

/* System Event Message to the wire, 5 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 5 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.nanoseconds[system_event_message_at] == system_event_message_written.nanoseconds[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Order Book State Message: 28 bytes -------------------------------------- */

/* Relays information on order book state changes. */
typedef OrderBookStateMessage {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte state_name[20]
};

int order_book_state_message_at;

/* every byte of Order Book State Message set to one value */
inline fill_order_book_state_message(order_book_state_message_record, order_book_state_message_value) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
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
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = (order_book_state_message_base + 0 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
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
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.nanoseconds[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
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
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
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
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.nanoseconds[order_book_state_message_at] == order_book_state_message_written.nanoseconds[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
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

/* ---- Order Executed Message: 51 bytes ---------------------------------------- */

/* Sent whenever an order on the book is executed in whole or in part. Modify Order messages always include the Order ID, Order book ID and Side of the Add Order to which the update applies. */
typedef OrderExecutedMessage {
  byte nanoseconds[4];
  byte order_id[8];
  byte order_book_id[4];
  byte side;
  byte executed_quantity[8];
  byte match_id[8];
  byte combo_group_id[4];
  byte reserved_14[14]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_book_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.combo_group_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 14 -> order_executed_message_record.reserved_14[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_book_id[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = (order_executed_message_base + 16 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 17 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_id[order_executed_message_at] = (order_executed_message_base + 25 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.combo_group_id[order_executed_message_at] = (order_executed_message_base + 33 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 14 -> order_executed_message_record.reserved_14[order_executed_message_at] = (order_executed_message_base + 37 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 51 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanoseconds[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.order_book_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.side; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.match_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.combo_group_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 14 -> wire[at] = order_executed_message_record.reserved_14[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 51 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_book_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.combo_group_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 14 -> order_executed_message_record.reserved_14[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.nanoseconds[order_executed_message_at] == order_executed_message_written.nanoseconds[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.order_book_id[order_executed_message_at] == order_executed_message_written.order_book_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.side == order_executed_message_written.side);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.match_id[order_executed_message_at] == order_executed_message_written.match_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.combo_group_id[order_executed_message_at] == order_executed_message_written.combo_group_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 14 -> assert(order_executed_message_read.reserved_14[order_executed_message_at] == order_executed_message_written.reserved_14[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 57 bytes ----------------------------- */

/* Sent in the relatively rare event that an order on the book is executed in whole or in part with a price different than the initial display price. Combination orders on the book that execute will always be represented by this message, with the Printable flag set to N; leg trades are published with the Trade message and are printable. */
typedef OrderExecutedWithPriceMessage {
  byte nanoseconds[4];
  byte order_id[8];
  byte order_book_id[4];
  byte side;
  byte executed_quantity[8];
  byte match_id[8];
  byte combo_group_id[4];
  byte reserved_14[14];
  byte trade_price[4];
  byte occurred_at_cross;
  byte printable
};

int order_executed_with_price_message_at;

/* every byte of Order Executed With Price Message set to one value */
inline fill_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_value) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_book_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.side = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.combo_group_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 14 -> order_executed_with_price_message_record.reserved_14[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.occurred_at_cross = order_executed_with_price_message_value;
  order_executed_with_price_message_record.printable = order_executed_with_price_message_value;
  skip
}

/* each byte of Order Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_base) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 0 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_book_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 12 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.side = (order_executed_with_price_message_base + 16 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 17 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 25 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.combo_group_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 33 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 14 -> order_executed_with_price_message_record.reserved_14[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 37 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 51 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.occurred_at_cross = (order_executed_with_price_message_base + 55 + 1) % 256;
  order_executed_with_price_message_record.printable = (order_executed_with_price_message_base + 56 + 1) % 256;
  skip
}

/* Order Executed With Price Message to the wire, 57 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.order_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.order_book_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.side; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.match_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.combo_group_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 14 -> wire[at] = order_executed_with_price_message_record.reserved_14[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.occurred_at_cross; at = at + 1;
  wire[at] = order_executed_with_price_message_record.printable; at = at + 1;
  skip
}

/* Order Executed With Price Message off the wire, 57 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_book_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.side = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.combo_group_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 14 -> order_executed_with_price_message_record.reserved_14[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.occurred_at_cross = wire[at]; at = at + 1;
  order_executed_with_price_message_record.printable = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Executed With Price Message is what was written, byte for byte */
inline equal_order_executed_with_price_message(order_executed_with_price_message_read, order_executed_with_price_message_written) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.nanoseconds[order_executed_with_price_message_at] == order_executed_with_price_message_written.nanoseconds[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.order_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.order_book_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_book_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.side == order_executed_with_price_message_written.side);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.executed_quantity[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_quantity[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.match_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.combo_group_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.combo_group_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 14 -> assert(order_executed_with_price_message_read.reserved_14[order_executed_with_price_message_at] == order_executed_with_price_message_written.reserved_14[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.trade_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.trade_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.occurred_at_cross == order_executed_with_price_message_written.occurred_at_cross);
  assert(order_executed_with_price_message_read.printable == order_executed_with_price_message_written.printable);
  skip
}

/* ---- Order Delete Message: 17 bytes ------------------------------------------ */

/* Sent whenever an order on the book is being deleted. There will be no remaining quantity, so the order should be removed from the book. Normally, no Order Delete message is sent when an order is completely filled. */
typedef OrderDeleteMessage {
  byte nanoseconds[4];
  byte order_id[8];
  byte order_book_id[4];
  byte side
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.nanoseconds[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_book_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = order_delete_message_value;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.nanoseconds[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_book_id[order_delete_message_at] = (order_delete_message_base + 12 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = (order_delete_message_base + 16 + 1) % 256;
  skip
}

/* Order Delete Message to the wire, 17 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.nanoseconds[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.order_book_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  wire[at] = order_delete_message_record.side; at = at + 1;
  skip
}

/* Order Delete Message off the wire, 17 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.nanoseconds[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_book_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.nanoseconds[order_delete_message_at] == order_delete_message_written.nanoseconds[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_id[order_delete_message_at] == order_delete_message_written.order_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.order_book_id[order_delete_message_at] == order_delete_message_written.order_book_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  assert(order_delete_message_read.side == order_delete_message_written.side);
  skip
}

/* ---- Order Book Flush Message: 8 bytes --------------------------------------- */

/* Sent whenever an order book is flushed. All remaining orders are no longer accessible and should be removed from the book. Markets by order dissemination may be disabled during auctions by configuration; in such cases every existing order of the order book is removed by this message immediately prior to the auction. Owners of these orders must not interpret this as order cancellations, and should use the private order flow to determine the state of their orders. */
typedef OrderBookFlushMessage {
  byte nanoseconds[4];
  byte order_book_id[4]
};

int order_book_flush_message_at;

/* every byte of Order Book Flush Message set to one value */
inline fill_order_book_flush_message(order_book_flush_message_record, order_book_flush_message_value) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.nanoseconds[order_book_flush_message_at] = order_book_flush_message_value; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.order_book_id[order_book_flush_message_at] = order_book_flush_message_value; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Flush Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_flush_message(order_book_flush_message_record, order_book_flush_message_base) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.nanoseconds[order_book_flush_message_at] = (order_book_flush_message_base + 0 + order_book_flush_message_at + 1) % 256; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.order_book_id[order_book_flush_message_at] = (order_book_flush_message_base + 4 + order_book_flush_message_at + 1) % 256; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Flush Message to the wire, 8 bytes from where the cursor stands */
inline encode_order_book_flush_message(order_book_flush_message_record) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> wire[at] = order_book_flush_message_record.nanoseconds[order_book_flush_message_at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> wire[at] = order_book_flush_message_record.order_book_id[order_book_flush_message_at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Flush Message off the wire, 8 bytes from where the cursor stands */
inline decode_order_book_flush_message(order_book_flush_message_record) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.nanoseconds[order_book_flush_message_at] = wire[at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> order_book_flush_message_record.order_book_id[order_book_flush_message_at] = wire[at]; at = at + 1; order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Flush Message is what was written, byte for byte */
inline equal_order_book_flush_message(order_book_flush_message_read, order_book_flush_message_written) {
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> assert(order_book_flush_message_read.nanoseconds[order_book_flush_message_at] == order_book_flush_message_written.nanoseconds[order_book_flush_message_at]); order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  order_book_flush_message_at = 0;
  do
  :: order_book_flush_message_at < 4 -> assert(order_book_flush_message_read.order_book_id[order_book_flush_message_at] == order_book_flush_message_written.order_book_id[order_book_flush_message_at]); order_book_flush_message_at = order_book_flush_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 49 bytes ------------------------------------------------- */

/* Designed to provide execution details for normal match events involving non-displayable order types. Also used to publish individual cross trades. Since no Add Order Message is generated when a non-displayed order is initially received, the Order Executed message cannot be used for all matches; the Trade Message reports a match for a non-displayable order in the book. Trade Messages should be included in trade tickers as well as volume and other market statistics. */
typedef TradeMessage {
  byte nanoseconds[4];
  byte match_id[8];
  byte combo_group_id[4];
  byte side;
  byte quantity[8];
  byte order_book_id[4];
  byte trade_price[4];
  byte reserved_14[14];
  byte printable;
  byte occurred_at_cross
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanoseconds[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.combo_group_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_book_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.reserved_14[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = trade_message_value;
  trade_message_record.occurred_at_cross = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanoseconds[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_id[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.combo_group_id[trade_message_at] = (trade_message_base + 12 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = (trade_message_base + 16 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.quantity[trade_message_at] = (trade_message_base + 17 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_book_id[trade_message_at] = (trade_message_base + 25 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_price[trade_message_at] = (trade_message_base + 29 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.reserved_14[trade_message_at] = (trade_message_base + 33 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = (trade_message_base + 47 + 1) % 256;
  trade_message_record.occurred_at_cross = (trade_message_base + 48 + 1) % 256;
  skip
}

/* Trade Message to the wire, 49 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.nanoseconds[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.match_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.combo_group_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.side; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.order_book_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.trade_price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> wire[at] = trade_message_record.reserved_14[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.printable; at = at + 1;
  wire[at] = trade_message_record.occurred_at_cross; at = at + 1;
  skip
}

/* Trade Message off the wire, 49 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanoseconds[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.combo_group_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_book_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.reserved_14[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.printable = wire[at]; at = at + 1;
  trade_message_record.occurred_at_cross = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.nanoseconds[trade_message_at] == trade_message_written.nanoseconds[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.match_id[trade_message_at] == trade_message_written.match_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.combo_group_id[trade_message_at] == trade_message_written.combo_group_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.side == trade_message_written.side);
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.quantity[trade_message_at] == trade_message_written.quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.order_book_id[trade_message_at] == trade_message_written.order_book_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.trade_price[trade_message_at] == trade_message_written.trade_price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> assert(trade_message_read.reserved_14[trade_message_at] == trade_message_written.reserved_14[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.printable == trade_message_written.printable);
  assert(trade_message_read.occurred_at_cross == trade_message_written.occurred_at_cross);
  skip
}

/* ---- Equilibrium Price Update: 52 bytes -------------------------------------- */

/* Used when auctions occur. Provides the changes in equilibrium price. Markets by order dissemination may be disabled during auctions by configuration. */
typedef EquilibriumPriceUpdate {
  byte nanoseconds[4];
  byte order_book_id[4];
  byte available_bid_quantity_at_equilibrium_price[8];
  byte available_ask_quantity_at_equilibrium_price[8];
  byte equilibrium_price[4];
  byte best_bid_price[4];
  byte best_ask_price[4];
  byte best_bid_quantity[8];
  byte best_ask_quantity[8]
};

int equilibrium_price_update_at;

/* every byte of Equilibrium Price Update set to one value */
inline fill_equilibrium_price_update(equilibrium_price_update_record, equilibrium_price_update_value) {
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.nanoseconds[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.order_book_id[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.equilibrium_price[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.best_bid_price[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.best_ask_price[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.best_bid_quantity[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.best_ask_quantity[equilibrium_price_update_at] = equilibrium_price_update_value; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equilibrium Price Update set to where it lies, so a field read out of place says so */
inline ramp_equilibrium_price_update(equilibrium_price_update_record, equilibrium_price_update_base) {
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.nanoseconds[equilibrium_price_update_at] = (equilibrium_price_update_base + 0 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.order_book_id[equilibrium_price_update_at] = (equilibrium_price_update_base + 4 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_update_at] = (equilibrium_price_update_base + 8 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_update_at] = (equilibrium_price_update_base + 16 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.equilibrium_price[equilibrium_price_update_at] = (equilibrium_price_update_base + 24 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.best_bid_price[equilibrium_price_update_at] = (equilibrium_price_update_base + 28 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.best_ask_price[equilibrium_price_update_at] = (equilibrium_price_update_base + 32 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.best_bid_quantity[equilibrium_price_update_at] = (equilibrium_price_update_base + 36 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.best_ask_quantity[equilibrium_price_update_at] = (equilibrium_price_update_base + 44 + equilibrium_price_update_at + 1) % 256; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Update to the wire, 52 bytes from where the cursor stands */
inline encode_equilibrium_price_update(equilibrium_price_update_record) {
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> wire[at] = equilibrium_price_update_record.nanoseconds[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> wire[at] = equilibrium_price_update_record.order_book_id[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> wire[at] = equilibrium_price_update_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> wire[at] = equilibrium_price_update_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> wire[at] = equilibrium_price_update_record.equilibrium_price[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> wire[at] = equilibrium_price_update_record.best_bid_price[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> wire[at] = equilibrium_price_update_record.best_ask_price[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> wire[at] = equilibrium_price_update_record.best_bid_quantity[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> wire[at] = equilibrium_price_update_record.best_ask_quantity[equilibrium_price_update_at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Update off the wire, 52 bytes from where the cursor stands */
inline decode_equilibrium_price_update(equilibrium_price_update_record) {
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.nanoseconds[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.order_book_id[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.available_bid_quantity_at_equilibrium_price[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.available_ask_quantity_at_equilibrium_price[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.equilibrium_price[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.best_bid_price[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> equilibrium_price_update_record.best_ask_price[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.best_bid_quantity[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> equilibrium_price_update_record.best_ask_quantity[equilibrium_price_update_at] = wire[at]; at = at + 1; equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equilibrium Price Update is what was written, byte for byte */
inline equal_equilibrium_price_update(equilibrium_price_update_read, equilibrium_price_update_written) {
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> assert(equilibrium_price_update_read.nanoseconds[equilibrium_price_update_at] == equilibrium_price_update_written.nanoseconds[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> assert(equilibrium_price_update_read.order_book_id[equilibrium_price_update_at] == equilibrium_price_update_written.order_book_id[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> assert(equilibrium_price_update_read.available_bid_quantity_at_equilibrium_price[equilibrium_price_update_at] == equilibrium_price_update_written.available_bid_quantity_at_equilibrium_price[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> assert(equilibrium_price_update_read.available_ask_quantity_at_equilibrium_price[equilibrium_price_update_at] == equilibrium_price_update_written.available_ask_quantity_at_equilibrium_price[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> assert(equilibrium_price_update_read.equilibrium_price[equilibrium_price_update_at] == equilibrium_price_update_written.equilibrium_price[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> assert(equilibrium_price_update_read.best_bid_price[equilibrium_price_update_at] == equilibrium_price_update_written.best_bid_price[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 4 -> assert(equilibrium_price_update_read.best_ask_price[equilibrium_price_update_at] == equilibrium_price_update_written.best_ask_price[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> assert(equilibrium_price_update_read.best_bid_quantity[equilibrium_price_update_at] == equilibrium_price_update_written.best_bid_quantity[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
  :: else -> break
  od;
  equilibrium_price_update_at = 0;
  do
  :: equilibrium_price_update_at < 8 -> assert(equilibrium_price_update_read.best_ask_quantity[equilibrium_price_update_at] == equilibrium_price_update_written.best_ask_quantity[equilibrium_price_update_at]); equilibrium_price_update_at = equilibrium_price_update_at + 1
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
    assert(at == 129);
    at = 0;
    decode_order_book_directory(order_book_directory_got);
    assert(at == 129);
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
    assert(at == 17);
    at = 0;
    decode_combination_order_book_leg(combination_order_book_leg_got);
    assert(at == 17);
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

/* Short Sell Status: encoded, read back, and compared */
proctype check_short_sell_status() {
  ShortSellStatus short_sell_status_sent;
  ShortSellStatus short_sell_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_sell_status(short_sell_status_sent, 0)
  :: pattern == 1 -> fill_short_sell_status(short_sell_status_sent, 32)
  :: pattern == 2 -> fill_short_sell_status(short_sell_status_sent, 255)
  :: else -> ramp_short_sell_status(short_sell_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_sell_status(short_sell_status_sent);
    assert(at == 9);
    at = 0;
    decode_short_sell_status(short_sell_status_got);
    assert(at == 9);
    equal_short_sell_status(short_sell_status_got, short_sell_status_sent)
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

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 51);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 51);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed With Price Message: encoded, read back, and compared */
proctype check_order_executed_with_price_message() {
  OrderExecutedWithPriceMessage order_executed_with_price_message_sent;
  OrderExecutedWithPriceMessage order_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_with_price_message(order_executed_with_price_message_sent, 255)
  :: else -> ramp_order_executed_with_price_message(order_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_with_price_message(order_executed_with_price_message_sent);
    assert(at == 57);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 57);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 17);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 17);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Book Flush Message: encoded, read back, and compared */
proctype check_order_book_flush_message() {
  OrderBookFlushMessage order_book_flush_message_sent;
  OrderBookFlushMessage order_book_flush_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_flush_message(order_book_flush_message_sent, 0)
  :: pattern == 1 -> fill_order_book_flush_message(order_book_flush_message_sent, 32)
  :: pattern == 2 -> fill_order_book_flush_message(order_book_flush_message_sent, 255)
  :: else -> ramp_order_book_flush_message(order_book_flush_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_flush_message(order_book_flush_message_sent);
    assert(at == 8);
    at = 0;
    decode_order_book_flush_message(order_book_flush_message_got);
    assert(at == 8);
    equal_order_book_flush_message(order_book_flush_message_got, order_book_flush_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 49);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 49);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Equilibrium Price Update: encoded, read back, and compared */
proctype check_equilibrium_price_update() {
  EquilibriumPriceUpdate equilibrium_price_update_sent;
  EquilibriumPriceUpdate equilibrium_price_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equilibrium_price_update(equilibrium_price_update_sent, 0)
  :: pattern == 1 -> fill_equilibrium_price_update(equilibrium_price_update_sent, 32)
  :: pattern == 2 -> fill_equilibrium_price_update(equilibrium_price_update_sent, 255)
  :: else -> ramp_equilibrium_price_update(equilibrium_price_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equilibrium_price_update(equilibrium_price_update_sent);
    assert(at == 52);
    at = 0;
    decode_equilibrium_price_update(equilibrium_price_update_got);
    assert(at == 52);
    equal_equilibrium_price_update(equilibrium_price_update_got, equilibrium_price_update_sent)
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
  :: run check_short_sell_status()
  :: run check_system_event_message()
  :: run check_order_book_state_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_order_delete_message()
  :: run check_order_book_flush_message()
  :: run check_trade_message()
  :: run check_equilibrium_price_update()
  fi
}
